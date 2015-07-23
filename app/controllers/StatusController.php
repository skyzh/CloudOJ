<?php
use Phalcon\Paginator\Adapter\Model as PaginatorModel;
use Phalcon\Paginator\Adapter\NativeArray as PaginatorArray;
use Phalcon\Paginator\Adapter\QueryBuilder as PaginatorQueryBuilder;

class StatusController extends ControllerBase {
    public function initialize() {
        $this->tag->setTitle('Status');
        parent::initialize();
    }

    private function findProblem($pid) {
        $problem = Problemset::findFirst(array(
            "pid = :pid:", 'bind' => array('pid' => $pid)));
        return $problem->title;
    }

    private function findUser($uid) {
        $problem = User::findFirst(array(
            "uid = :uid:", 'bind' => array('uid' => $uid)));
        return $problem->username;
    }
    
    public function indexAction() {
        $currentPage = (int) $this->request->getQuery('page');
        if( $currentPage == 0) $currentPage = 1;

        $this->request->getQuery("page", "int");


        $bindArr = array("pid" => 1, "uid"=> 1);

        $para = Status::query();
        if($this->request->hasQuery("pid")) {
            $para = $para->where("pid = :pid:")->bind(array("pid" => $this->request->getQuery("pid", "int")));
        }
        $para = $para->orderBy("sid DESC");
        $data = Status::find($para->getParams());

        $paginator = new PaginatorModel(
            array(
                "data"  => $data,
                "limit" => 20,
                "page"  => $currentPage
            )
        );
        $status = $paginator->getPaginate();
        foreach ($status->items as $item) {
            $item->__title = $this->findProblem($item->pid);
            $item->__username = $this->findUser($item->uid);
        }
        $this->view->status = $status;
    }
    public function submitAction($pid) {
        $problem = Problemset::findFirst(array(
            "pid = :pid:", 'bind' => array('pid' => $pid)));
        if (!$problem) {
            $this->flash->error("Problem was not found");
            return $this->forward("status/index");
        }
        if ($this->request->isPost()) {
            $status = new Status;
            $status->pid = $pid;
            $status->uid = $this->auth["id"];
            $status->lang = $this->request->getPost('lang');
            $__code = $this->request->getPost('code');
            $status->codelength = strlen($__code);
            if ($status->save() == false) {
                foreach ($status->getMessages() as $message) {
                    $this->flash->error((string) $message);
                }
            } else {
                $stcode = new StatusCode;
                $stcode->sid = $status->sid;
                $stcode->code = $__code;
                if ($stcode->save() == false) {
                    foreach ($stcode->getMessages() as $message) {
                        $this->flash->error((string) $message);
                    }
                } else {
                    $prob = Problemset::findFirst(array(
                        "pid = :pid:", 'bind' => array('pid' => $status->pid)));
                    $prob->submit = $prob->submit + 1;
                    $prob->save();

                    $this->flash->success('<h5>Submit success</h5><h6>Now view your status</h6>');
                    return $this->forward('problemset/view/'.$pid);
                }
            }
        }
        $this->view->problem = $problem;
    }
    public function viewAction($sid) {
        $status = Status::findFirst(array(
            "sid = :sid:", 'bind' => array('sid' => $sid)));
        $stcode = Statuscode::findFirst(array(
            "sid = :sid:", 'bind' => array('sid' => $sid)));

        $status->__title = $this->findProblem($status->pid);
        $status->__username = $this->findUser($status->uid);

        $this->view->st = $status;
        $this->view->code = $stcode;
    }
}
