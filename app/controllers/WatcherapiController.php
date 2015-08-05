<?php

use Phalcon\Mvc\Controller;
use Phalcon\Mvc\View;

class WatcherapiController extends Controller {
    protected function json_error($detail) {
        echo json_encode(array(
            "status" => "error",
            "detail" => $detail
        ));
    }
    protected function initialize() {
        $this->view->setRenderLevel(View::LEVEL_NO_RENDER);
    }
    protected function __data($request) {
        if($request->type) {
            if($request->type == "list") {
                $problem = Problemset::findProblemByID($request->pid);
                if(!$problem) {
                    $this->json_error("problem not found");
                } else {
                    $datlist = array();
                    foreach($problem->problemdata as $prob) {
                        $datlist[$prob->pdid] = $prob->dat_name;
                    }
                    echo json_encode(array(
                        "status" => "success",
                        "datalist" => $datlist,
                        "memlimit" => $problem->memlimit,
                        "timelimit" => $problem->timelimit
                    ));
                }
            } elseif ($request->type == "get" && $request->ext) {
                $probdata = Problemdata::findProblemDataByDID($request->pdid);
                if(!$probdata) {
                    $this->json_error("data not found");
                } else {
                    if($request->ext == "in") echo $probdata->getIn();
                    elseif($request->ext == "out") echo $probdata->getOut();
                }
            } else {
                $this->json_error("invaild type");
            }
        } else {
            $this->json_error("invaild data request");
        }
    }

    protected function __status($request) {
        if($request->type) {
            if($request->type == "set") {
                if($request->sid && $request->status) {
                    $status = Status::findFirst(array(
                        "conditions" => "sid = :sid:",
                        "bind" => array(
                            "sid" => $request->sid
                        )
                    ));
                    if(!$status) {
                        $this->json_error("invaild sid");
                    } else {
                        $status->status = $request->status;
                        $status->memlimit = $request->memlimit;
                        $status->timelimit = $request->timelimit;
                        $status->save();
                        if($status->status == 2) {
                            WatcherAction::AcceptProblem($status->uid, $status->pid);
                        }
                        echo json_encode(array(
                            "status" => "success"
                        ));
                    }
                } else {
                    $this->json_error("invaild set request");
                }
            } else {
                $this->json_error("invaild type");
            }
        } else {
            $this->json_error("invaild status request");
        }
    }

    protected function __post($request, $sid) {
        $status = Status::findFirst(array(
            "conditions" => "sid = :sid:",
            "bind" => array(
                "sid" => $sid
            )
        ));
        if(!$status) {
            $this->json_error("invaild sid");
        } else {
            $status->statuscode->ret = $request;
            $status->save();
            echo json_encode(array(
                "status" => "success"
            ));
        }
    }
    protected function __code($request) {
        if($request->type) {
            if($request->type == "get") {
                if($request->sid) {
                    $status = Status::findFirst(array(
                        "conditions" => "sid = :sid:",
                        "bind" => array(
                            "sid" => $request->sid
                        )
                    ));
                    echo $status->statuscode->code;
                } else {
                    $this->json_error("invaild sid");
                }
            } else {
                $this->json_error("invaild type");
            }
        }
        else {
            $this->json_error("invaild code request");
        }
    }

    protected function __task($request) {
        if($request->type) {
            if($request->type == "get") {
                $status = Status::findFirst(array(
                    "conditions" => "status = :status: ",
                    "bind" => array(
                        "status" => 0
                    ),
                    "shared_lock" => true
                ));
                if($status) {
                    echo json_encode(array(
                        "status" => "success",
                        "sid" => $status->sid,
                        "lang" => $status->lang,
                        "pid" => $status->pid
                    ));
                    $status->status = 1;
                    $status->save();
                } else {
                    echo json_encode(array(
                        "status" => "idle"
                    ));
                }
            } else {
                $this->json_error("invaild type");
            }
        }
        else {
            $this->json_error("invaild task request");
        }
    }
    private function checkKey() {
        if($this->request->getQuery("apikey")) {
            if($this->request->getQuery("apikey") != $this->__watcherapi["apikey"]) {
                $this->json_error("wrong key");
            } else {
                return true;
            }
        } else {
            $this->json_error("apikey not found");
            return false;
        }
    }
    private function checkJSONRequest() {
        if($this->request->isPost()) {
            $request = $this->request->getJsonRawBody();
            if(!$request) {
                $this->json_error("invaild json");
                return false;
            } else {
                return $request;
            }
        } else {
            $this->json_error("invaild request");
            return false;
        }
    }
    private function checkRequest() {
        if($this->request->isPost()) {
            $request = $this->request->getRawBody();
            if(!$request) {
                $this->json_error("invaild body");
                return false;
            } else {
                return $request;
            }
        } else {
            $this->json_error("invaild http request");
            return false;
        }
    }


    public function codeAction() {
        $request = $this->checkJSONRequest();
        if($request != false) {
            if($this->checkKey()) {
                $this->__code($request);
            }
        }
    }

    public function taskAction() {
        $request = $this->checkJSONRequest();
        if($request != false) {
            if($this->checkKey()) {
                $this->__task($request);
            }
        }
    }

    public function statusAction() {
        $request = $this->checkJSONRequest();
        if($request != false) {
            if($this->checkKey()) {
                $this->__status($request);
            }
        }
    }

    public function dataAction() {
        $request = $this->checkJSONRequest();
        if($request != false) {
            if($this->checkKey()) {
                $this->__data($request);
            }
        }
    }

    public function verifyAction() {
        $request = $this->checkJSONRequest();
        if($request != false) {
            if($request->apikey) {
                if($request->apikey == $this->__watcherapi["apikey"]) {
                    echo json_encode(array(
                        "status" => "success"
                    ));
                } else {
                    echo json_encode(array(
                        "status" => "error",
                        "detail" => "wrong key"
                    ));
                }
            } else {
                $this->json_error("apikey not found");
            }
        }
    }

    public function postAction($sid) {
        $request = $this->checkRequest();
        if($request != false) {
            if($this->checkKey()) {
                $this->__post($request, $sid);
            }
        }
    }



}
