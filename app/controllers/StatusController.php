<?php

class StatusController extends ControllerBase {
    public function initialize() {
        $this->tag->setTitle('Problems');
        parent::initialize();
    }

    public function indexAction() {
    }
    public function submitAction($pid) {
        $problem = Problemset::findFirst(array(
            "pid = :pid:", 'bind' => array('pid' => $pid)));
        if (!$problem) {
            $this->flash->error("Problem was not found");
            return $this->forward("status/index");
        }
        if ($this->request->isPost()) {
        }
        $this->view->problem = $problem;
    }

}
