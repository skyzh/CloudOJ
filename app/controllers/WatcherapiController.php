<?php

use Phalcon\Mvc\Controller;
use Phalcon\Mvc\View;

class WatcherapiController extends Controller {
    protected function initialize() {
        $this->view->setRenderLevel(View::LEVEL_NO_RENDER);
    }
    protected function __task($request) {
        if($request->type) {
            if($request->type == "get") {
                $status = Status::findFirst(array(
                    "limit" => "1",
                    "conditions" => "status = :status: ",
                    "bind" => array(
                        "status" => 0
                    ),
                    "shared_lock" => true
                ));
                echo json_encode(array(
                    "status" => "success",
                    "sid" => $status->sid,
                    "lang" => $status->lang,
                    "pid" => $status->pid
                ));
            } else {
                echo json_encode(array(
                    "status" => "error",
                    "detail" => "invaild task request"
                ));
            }
        }
        else {
            echo json_encode(array(
                "status" => "error",
                "detail" => "invaild task request"
            ));
        }
    }

    public function taskAction() {
        if($this->request->isPost()) {
            $request = $this->request->getJsonRawBody();
            if(!$request) {
                echo $this->_invaildjson("invaild json");
            } else {
                if($request->apikey) {
                    if($request->apikey == $this->__watcherapi["apikey"]) {
                        $this->__task($request);
                    } else {
                        echo json_encode(array(
                            "status" => "error",
                            "detail" => "wrong key"
                        ));
                    }
                } else {
                    echo $this->_invaildjson("apikey not found");
                }
            }
        } else {
            echo $this->_invaildjson("invaild request");
        }
    }

    public function verifyAction() {
        if($this->request->isPost()) {
            $request = $this->request->getJsonRawBody();
            if(!$request) {
                echo $this->_invaildjson("invaild json");
            } else {
                if($request->apikey) {
                    if($request->apikey == $this->__watcherapi["apikey"]) {
                        echo json_encode(array(
                            "status" => "success",
                            "detail" => "success"
                        ));
                    } else {
                        echo json_encode(array(
                            "status" => "error",
                            "detail" => "wrong key"
                        ));
                    }
                } else {
                    echo $this->_invaildjson("apikey not found");
                }
            }
        } else {
            echo $this->_invaildjson("invaild request");
        }
    }

    private function _invaildjson($errtext) {
        return json_encode(array(
            "status" => "error",
            "detail" => $errtext
        ));
    }
}
