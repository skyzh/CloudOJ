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
        $lucky = $this->request->getQuery("lucky");
        $title = $this->request->getQuery("title");

        $currentPage = (int) $this->request->getQuery('page');
        if($currentPage == 0) $currentPage = 1;

        $dataBuilder = $this->modelsManager->createBuilder()->from("Problemset");

        if($title || $lucky) $this->view->isSearch = true;
        else $this->view->isSearch = false;
        if($lucky) {
            $dataBuilder = $dataBuilder->orderBy("rand()");
            $this->view->pageElement = false;
        } else {
            $this->view->pageElement = true;
        }

        if($title) {
            $dataBuilder = $dataBuilder->where("title like :title:", array("title" => "%{$title}%"));
        }
        $this->view->title = $title;

        $paginator = new PaginatorQueryBuilder(array(
            "builder" => $dataBuilder,
            "limit"=> 20,
            "page" => $currentPage));

        $problems = $paginator->getPaginate();
        $this->view->problems = $problems;
    }

    public function newAction() {
        return $this->forward('problemset/edit/0');
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

        WatcherAction::ContributeProblem($this->auth["id"], $problem->pid);
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
        $this->view->permission = $problem->checkPermission($this->auth["id"]);
        if(!$this->view->permission) $this->view->permissioninfo = $problem->getPermissionInfo();
        $contributors = explode(',', $problem->problemdetail->contributors);
        $view_contributors = array();
        foreach($contributors as $contributor) {
            $__user = User::findUserByID($contributor);
            if($__user) {
                array_push($view_contributors, $__user);
            }
        }
        $this->view->contributors = $view_contributors;
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

    public function searchAction() {
        $pid = $this->request->getQuery("pid");
        $lucky = $this->request->getQuery("lucky");
        if($pid) return $this->forward("problemset/view/{$pid}");
        if($lucky) return $this->forward("problemset/index/?lucky={$lucky}");
        return $this->forward("problemset/index");
    }
}
