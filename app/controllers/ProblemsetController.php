<?php
use Phalcon\Paginator\Adapter\Model as PaginatorModel;
use Phalcon\Paginator\Adapter\NativeArray as PaginatorArray;
use Phalcon\Paginator\Adapter\QueryBuilder as PaginatorQueryBuilder;

class ProblemsetController extends ControllerBase {
    public function initialize() {
        $this->tag->setTitle('Problems');
        parent::initialize();
    }

    public function indexAction() {
        $currentPage = (int) $this->request->getQuery('page');
        if($currentPage == 0) $currentPage = 1;

        $paginator = new PaginatorQueryBuilder(array(
            "builder" => $this->modelsManager->createBuilder()->from("Problemset"),
            "limit"=> 20,
            "page" => $currentPage
        ));
        $problems = $paginator->getPaginate();
        $this->view->problems = $problems;
    }

    public function newAction() {
        return $this->forward('problemset/edit/0');
    }

    public function dataAction($pid) {
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

    public function editAction($pid) {
        if (!$this->request->isPost()) {
            if(intval($pid) != 0) {
                $problem = Problemset::findFirst(array(
                    "pid = :pid:", 'bind' => array('pid' => $pid)));
                if (!$problem) {
                    $this->flash->error("Problem was not found");
                    return $this->forward("problemset/index");
                }
            }
            else {
                $problem = new Problemset;
                $problem->problemdetail = new Problemdetail;
                $problem->pid = 0;
            }
            $_problem = new ProblemRef($problem, $problem->problemdetail);
            $this->view->problem = $_problem;
            $this->view->form = new ProblemForm($_problem);
        }
    }
    public function saveAction($pid)
    {
        if (!$this->request->isPost()) {
            return $this->forward("problemset/index");
        }

        if(intval($pid) != 0)
        {
            $problem = Problemset::findFirst(array(
                "pid = :pid:", 'bind' => array('pid' => $pid)));

            if (!$problem) {
                $this->flash->error("Problem does not exist");
                return $this->forward("problemset/index");
            }
        }
        else {
            $problem = new Problemset;
            $problem->problemdetail = new Problemdetail;
            $problem->pid = 0;
        }
        $_problem = new ProblemRef($problem, $problem->problemdetail);
        $this->view->problem = $_problem;

        $form = new ProblemForm;

        $this->view->form = $form;

        $data = $this->request->getPost();

        if (!$form->isValid($data, $_problem)) {
            foreach ($form->getMessages() as $message) {
                $this->flash->error($message);
            }
            return $this->forward('problemset/edit/' . strval($pid));
        } elseif ($problem->save() == false) {
            foreach ($problem->getMessages() as $message) {
                $this->flash->error($message);
            }
            return $this->forward('problemset/edit/' . strval($pid));
        }

        $form->clear();

        $this->flash->success("Problem was updated successfully");
        return $this->forward('problemset/view/' . $problem->pid);
    }

    public function viewAction($pid) {
        $problem = Problemset::findFirst(array(
            "pid = :pid:", 'bind' => array('pid' => $pid)));
        if (!$problem) {
            $this->flash->error("Problem does not exist");
            return $this->forward("problemset/index");
        }
        $_problem = new ProblemRef($problem, $problem->problemdetail);
        $this->view->problem = $_problem;
    }

    public function removeAction($pid) {
        $problem = Problemset::findFirst(array(
            "pid = :pid:", 'bind' => array('pid' => $pid)));

        if (!$problem) {
            $this->flash->error("Problem does not exist");
            return $this->forward("problemset/index");
        }

        $problem->delete();
        $this->flash->success("Problem was deleted successfully");
        return $this->forward("problemset/index");
    }
}
