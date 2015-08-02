<?php
use Phalcon\Paginator\Adapter\Model as PaginatorModel;
use Phalcon\Paginator\Adapter\NativeArray as PaginatorArray;
use Phalcon\Paginator\Adapter\QueryBuilder as PaginatorQueryBuilder;

class DataController extends ControllerBase {
    public function initialize() {
        $this->tag->setTitle('Data');
        parent::initialize();
    }

    public function indexAction($pid) {
        $problem = Problemset::findProblemByID($pid);
        if(!$problem) {
            $this->flash->error("Problem does not exist");
            return $this->forward("problemset/view/" . strval($pid));
        }
        $this->view->problem = $problem;
        $this->view->probdata = $problem->problemdata;
    }

    public function newAction($pid) {
        return $this->forward("data/edit/" . $pid . "/0");
    }

    public function editAction($pid, $pdid) {
        $problem = Problemset::findProblemByID($pid);
        if(!$problem) {
            $this->flash->error("Problem does not exist");
            return $this->forward("problemset/view/" . strval($pid));
        }
        if($pdid == 0) {
            $probdata= new Problemdata;
            $probdata->pdid = 0;
            $probdata->pid = $pid;
        } else {
            $probdata = Problemdata::findProblemDataByDID($pdid);
        }
        $form = new ProbDataForm($probdata);
        $this->view->probdata = $probdata;
        $this->view->problem = $problem;
        $this->view->form = $form;
    }

    public function saveAction($pid, $pdid) {
        if (!$this->request->isPost()) {
            return $this->forward("data/index");
        }

        if($pdid == 0) {
            $probdata = new Problemdata;
            $probdata->pid = $pid;
        } else {
            $probdata = Problemdata::findProblemDataByDID($pdid);
            if(!$probdata) {
                $this->flash->error("Problem data not found");
                return $this->forward("data/index");
            }
        }
        $form = new ProbDataForm;

        $data = $this->request->getPost();

        if (!$form->isValid($data, $probdata)) {
            foreach ($form->getMessages() as $message) {
                $this->flash->error($message);
            }
            return $this->forward('data/edit/' . strval($pid) . '/' . strval($pdid));
        }
        $probdata->dat_out = str_replace("\r", "", $probdata->dat_out);
        $probdata->dat_in = str_replace("\r", "", $probdata->dat_in);
        if ($probdata->save() == false) {
            foreach ($probdata->getMessages() as $message) {
                $this->flash->error($message);
            }
            return $this->forward('data/edit/' . strval($pid) . '/' . strval($pdid));
        }

        $form->clear();

        $this->flash->success("Problem Data was updated successfully");
        return $this->forward('data/index/' . $probdata->pid);
    }
}
