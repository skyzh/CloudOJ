<?php
use Phalcon\Paginator\Adapter\Model as PaginatorModel;
use Phalcon\Paginator\Adapter\NativeArray as PaginatorArray;
use Phalcon\Paginator\Adapter\QueryBuilder as PaginatorQueryBuilder;

class PremissionController extends ControllerBase {
    public function initialize() {
        $this->tag->setTitle('Premission');
        parent::initialize();
    }

    public function indexAction($pid) {
        $problem = Problemset::findProblemByID($pid);
        if(!$problem) {
            $this->flash->error("Problem does not exist");
            return $this->forward("problemset/view/" . strval($pid));
        }
        $this->view->problem = $problem;
        $this->view->probprem = $problem->problempremission;
    }

    public function newAction($pid) {
        return $this->forward("premission/edit/" . $pid . "/0");
    }

    public function editAction($pid, $ppid) {
        $problem = Problemset::findProblemByID($pid);
        if(!$problem) {
            $this->flash->error("Problem does not exist");
            return $this->forward("problemset/view/" . strval($pid));
        }
        if($ppid == 0) {
            $probprem = new Problempremission;
            $probprem->ppid = 0;
            $probprem->pid = $pid;
        } else {
            $probprem = Problempremission::findProblemPremissionByPID($ppid);
            if(!$probprem) {
                $this->flash->error("Problem premission not found");
                return $this->forward("premission/index/" . $pid);
            }
        }
        $form = new ProbPremForm($probprem);
        $this->view->probprem = $probprem;
        $this->view->problem = $problem;
        $this->view->form = $form;
    }

    public function saveAction($pid, $ppid) {
        if (!$this->request->isPost()) {
            return $this->forward("premission/index/" . $pid);
        }

        if($ppid == 0) {
            $probprem = new Problempremission;
            $probprem->pid = $pid;
        } else {
            $probprem = Problempremission::findProblemPremissionByPID($ppid);
            if(!$probprem) {
                $this->flash->error("Problem premission not found");
                return $this->forward("premission/index/" . $pid);
            }
        }
        $form = new ProbPremForm;

        $data = $this->request->getPost();

        if (!$form->isValid($data, $probprem)) {
            foreach ($form->getMessages() as $message) {
                $this->flash->error($message);
            }
            return $this->forward('premission/edit/' . strval($pid) . '/' . strval($ppid));
        }
        if ($probprem->save() == false) {
            foreach ($probdata->getMessages() as $message) {
                $this->flash->error($message);
            }
            return $this->forward('premission/edit/' . strval($pid) . '/' . strval($ppid));
        }

        $form->clear();

        $this->flash->success("Problem Premission was updated successfully");
        return $this->forward('premission/index/' . $probprem->pid);
    }

    public function removeAction($pid, $ppid) {
        $probprem = Problempremission::findProblemPremissionByPID($ppid);
        if(!$probprem) {
            $this->flash->error("Problem premission not found");
            return $this->forward('premission/index/' . $probprem->pid);
        }
        $probprem->delete();
        $this->flash->success("Problem premission was deleted successfully");
        return $this->forward('premission/index/' . $probprem->pid);
    }
}
