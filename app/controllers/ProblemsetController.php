<?php

class ProblemsetController extends ControllerBase {
    public function initialize() {
        $this->tag->setTitle('Problems');
        parent::initialize();
    }

    public function indexAction() {
        $problems = Problemset::find();
        $this->view->problems = $problems;
    }

    public function newAction() {
        $form = new ProblemForm(null, null);

        if ($this->request->isPost()) {
            $problemset = new Problemset();

            $problemset->title = $this->request->getPost("title");
            $problemset->type = $this->request->getPost("type");
            $problemset->submit = 0;
            $problemset->accepted = 0;
            $problemset->description = $this->request->getPost("description");
            $problemset->input = $this->request->getPost("input");
            $problemset->output = $this->request->getPost("output");
            $problemset->sampleinput = $this->request->getPost("sampleinput");
            $problemset->sampleoutput = $this->request->getPost("sampleoutput");
            $problemset->memlimit = $this->request->getPost("memlimit");
            $problemset->timelimit = $this->request->getPost("timelimit");
            $problemset->hint = $this->request->getPost("hint");
            $problemset->changetime = $this->request->getPost("hint");
            $problemset->save();
            if ($problemset->save() == false) {
                foreach ($problemset->getMessages() as $message) {
                    $this->flash->error((string) $message);
                }
            }
            else {
                $this->flash->success('<h5>Problem Submitted!</h5><h6>Now start submitting!</h6>');
                return $this->forward('problemset/index');
            }
        }
        $this->view->form = $form;
    }

    public function editAction($pid) {
        if (!$this->request->isPost()) {
            $problem = Problemset::findFirst(array(
                "pid = :pid:", 'bind' => array('pid' => $pid)));
            if (!$problem) {
                $this->flash->error("Problem was not found");
                return $this->forward("problemset/index");
            }
            $this->view->problem = $problem;
            $this->view->form = new ProblemForm($problem, array('edit' => true));
        }
    }
    public function saveAction()
    {
        if (!$this->request->isPost()) {
            return $this->forward("products/index");
        }

        $pid = $this->request->getPost("pid", "int");

        $problem = Problemset::findFirst(array(
            "pid = :pid:", 'bind' => array('pid' => $pid)));

        if (!$problem) {
            $this->flash->error("Problem does not exist");
            return $this->forward("problemset/index");
        }

        $form = new ProblemForm ;
        $this->view->form = $form;

        $data = $this->request->getPost();

        if (!$form->isValid($data, $problem)) {
            foreach ($form->getMessages() as $message) {
                $this->flash->error($message);
            }
            return $this->forward('problemset/edit/' . $pid);
        }

        if ($problem->save() == false) {
            foreach ($problem->getMessages() as $message) {
                $this->flash->error($message);
            }
            return $this->forward('problemset/edit/' . $pid);
        }

        $form->clear();

        $this->flash->success("Problem was updated successfully");
        return $this->forward('problemset/view/' . $pid);
    }

    public function viewAction($pid) {
        $problem = Problemset::findFirst(array(
            "pid = :pid:", 'bind' => array('pid' => $pid)));

        $this->view->problem = $problem;
    }
}
