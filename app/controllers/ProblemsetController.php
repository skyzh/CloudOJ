<?php

class ProblemSetController extends ControllerBase {
    public function initialize() {
        $this->tag->setTitle('Problems');
        parent::initialize();
    }

    public function indexAction() {
        $problems = Problemset::find();
        $this->view->problems = $problems;
        $auth = $this->session->get('auth');

        $this->view->isAdmin = false;
        if($auth)
            if($auth["groupid"] == 1)
                $this->view->isAdmin = true;
    }

    public function newAction() {
        
    }
}
