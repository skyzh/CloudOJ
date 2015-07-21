<?php

class StatusController extends ControllerBase {
    public function initialize() {
        $this->tag->setTitle('Problems');
        parent::initialize();
    }

    private function findProblem($pid) {
        $problem = Problemset::findFirst(array(
            "pid = :pid:", 'bind' => array('pid' => $pid)));
        return $problem->title;
    }

    private function findUser($uid) {
        $problem = User::findFirst(array(
            "uid = :uid:", 'bind' => array('uid' => $uid)));
        return $problem->username;
    }

    public function indexAction() {
        $status = Status::find();
        $_status = $status->filter(function($st){
            $st->__title = $this->findProblem($st->pid);
            $st->__username = $this->findUser($st->uid);
            return $st;
        });
        $this->view->status = $_status;
    }
    public function submitAction($pid) {
        $problem = Problemset::findFirst(array(
            "pid = :pid:", 'bind' => array('pid' => $pid)));
        if (!$problem) {
            $this->flash->error("Problem was not found");
            return $this->forward("status/index");
        }
        if ($this->request->isPost()) {
            $status = new Status;
            $status->pid = $pid;
            $status->uid = $this->auth["id"];
            $status->lang = $this->request->getPost('lang');
            $__code = $this->request->getPost('code');
            $status->codelength = strlen($__code);
            if ($status->save() == false) {
                foreach ($status->getMessages() as $message) {
                    $this->flash->error((string) $message);
                }
            } else {
                $stcode = new StatusCode;
                $stcode->sid = $status->sid;
                $stcode->code = $__code;
                if ($stcode->save() == false) {
                    foreach ($stcode->getMessages() as $message) {
                        $this->flash->error((string) $message);
                    }
                } else {
                    $this->flash->success('<h5>Submit success</h5><h6>Now view your status</h6>');
                    return $this->forward('problemset/view/'.$pid);
                }
            }
        }
        $this->view->problem = $problem;
    }
    public function viewAction($sid) {
        $status = Status::findFirst(array(
            "sid = :sid:", 'bind' => array('sid' => $sid)));
        $stcode = Statuscode::findFirst(array(
            "sid = :sid:", 'bind' => array('sid' => $sid)));
        $this->view->status = $status;
        $this->view->code = $stcode;
    }
}
