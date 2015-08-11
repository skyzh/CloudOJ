<?php
use Phalcon\Paginator\Adapter\Model as PaginatorModel;
use Phalcon\Paginator\Adapter\NativeArray as PaginatorArray;
use Phalcon\Paginator\Adapter\QueryBuilder as PaginatorQueryBuilder;

class StatusController extends ControllerBase {
    public function initialize() {
        $this->tag->setTitle('Status');
        parent::initialize();
    }
    public function searchAction() {
        $currentPage = (int) $this->request->getQuery('page');
        if( $currentPage == 0) $currentPage = 1;

        $this->request->getQuery("page", "int");


        $bindArr = array("pid" => 1, "uid"=> 1);

        $para = $this->modelsManager->createBuilder()->from("Status");
        $this->view->isSearch = false;

        $uid = $this->request->getQuery("uid");
        $pid = $this->request->getQuery("pid");
        $uname = $this->request->getQuery("uname");

        if($pid) {
            $para = $para->where("Status.pid = :pid:", array(
                "pid" => $pid
            ));
            $this->view->isSearch = true;
            $this->view->searchInfo = Problemset::findProblemByID($pid)->title;
        }
        if($uid || $uname) {
            if(!$uid) {
                $user = User::findUserByName($uname);
            } else {
                $user = User::findUserByID($uid);
            }
            if(!$user) {
                $this->flash->error("User not found!");
                $uid = null;
                $uname = null;
            } else {
                if($user) {
                    $uid = $user->uid;
                }
                $para = $para->where("Status.uid = :uid:", array(
                    "uid" => $uid
                ));
                $this->view->isSearch = true;
                $this->view->searchInfo = $user->username;
            }
        }

        $this->view->uid = $uid;
        $this->view->pid = $pid;

        $para = $para->orderBy("Status.sid DESC");

        $currentPage = (int) $this->request->getQuery('page');
        if($currentPage == 0) $currentPage = 1;

        $paginator = new PaginatorQueryBuilder(array(
            "builder" => $para,
            "limit"=> 20,
            "page" => $currentPage
        ));
        $status = $paginator->getPaginate();

        $status->items = $status->items->filter(function($item) {
            $__prob = Problemset::findProblemByID($item->pid);
            $__user = User::findUserByID($item->uid);
            $item->__title = $__prob->title;
            $item->__username = $__user->username;
            return $item;
        });
        $this->view->status = $status;
    }

    public function indexAction() {
        return $this->forward("status/search");
    }
    public function submitAction($pid) {
        $problem = Problemset::findFirst(array(
            "pid = :pid:", 'bind' => array('pid' => $pid)));
        if (!$problem) {
            $this->flash->error("Problem was not found");
            return $this->forward("status/index");
        }

        $permission = $problem->checkPermission($this->auth["id"]);

        if(!$permission) {
            $this->flash->error("Permission Denied!");
            return $this->forward("problemset/view/" . $pid);
        }

        $form = new StatusForm;

        if ($this->request->isPost()) {
            $status = new Status;
            $status->statuscode = new Statuscode;

            $data = $this->request->getPost();
            $_status = new StatusRef($status, $status->statuscode);

            if (!$form->isValid($data, $_status)) {
                foreach ($form->getMessages() as $message) {
                    $this->flash->error($message);
                }
            } else {
                $status->pid = $pid;
                $status->uid = $this->auth["id"];
                $status->codelength = strlen($status->statuscode->code);
                if ($status->save() == false) {
                    foreach ($status->getMessages() as $message) {
                        $this->flash->error((string) $message);
                    }
                } else {
                    WatcherAction::SubmitProblem($status->uid, $status->pid);
                    $this->flash->success('Submit success! Now view your status.');
                    $form->clear();
                    return $this->forward("status/view/{$status->sid}");
                }
            }
        }
        $this->view->form = $form;
        $this->view->problem = $problem;
    }
    public function viewAction($sid) {
        $status = Status::findFirst(array(
            "sid = :sid:", 'bind' => array('sid' => $sid)));
        if(!$status) {
            $this->flash->error("Status was not found");
            return $this->forward("status/index");
        }

        $stcode = $status->statuscode;

        $status->__title = Problemset::findProblemByID($status->pid)->title;
        $status->__username = User::findUserByID($status->uid)->username;

        $this->view->st = $status;
        $this->view->code = $stcode;
    }
}
