<?php

class StatusController extends ControllerBase {
    public function initialize() {
        $this->tag->setTitle('Problems');
        parent::initialize();
    }

    public function indexAction() {
    }

    public function submitAction($pid) {
        if (!$this->request->isPost()) {
            $problem = Problemset::findFirst(array(
                "pid = :pid:", 'bind' => array('pid' => $pid)));
            if (!$problem) {
                $this->flash->error("Problem was not found");
                return $this->forward("problemset/index");
            }
            $this->view->problem = $problem;
        }
    }

}
