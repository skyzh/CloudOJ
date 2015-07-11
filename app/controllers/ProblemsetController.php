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
        $form = new ProblemForm(null, null);
        if ($this->request->isPost()) {
            $this->flash->success('<h5>Problem Submitted!</h5><h6>Now start submit!</h6>');
        }
        $this->view->form = $form;
    }
}
