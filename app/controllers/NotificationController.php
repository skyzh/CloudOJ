<?php
use Phalcon\Paginator\Adapter\Model as PaginatorModel;
use Phalcon\Paginator\Adapter\NativeArray as PaginatorArray;
use Phalcon\Paginator\Adapter\QueryBuilder as PaginatorQueryBuilder;

class NotificationController extends ControllerBase {
    public function initialize() {
        $this->tag->setTitle('Notification');
        parent::initialize();
    }

    public function indexAction() {
        $currentPage = (int) $this->request->getQuery('page');
        if( $currentPage == 0) $currentPage = 1;

        $data = Directmessage::find(array(
            "(ruid = :ruid: OR suid = :ruid: OR ruid = 0)",
            'bind' => array('ruid' => $this->auth["id"]),
            "order" => "dmid DESC"
        ));

        $paginator = new PaginatorModel(
            array(
                "data"  => $data,
                "limit" => 20,
                "page"  => $currentPage
            )
        );

        $dms = $paginator->getPaginate();

        $this->view->dms = $dms;
        $this->view->no_muid = $this->auth["id"];
    }

    public function sendAction() {
        $dm = new Directmessage;
        $dm->ruser = $this->request->getQuery("ruser");
        $form = new DirectMessageForm($dm);

        if ($this->request->isPost()) {

            $data = $this->request->getPost();

            $user = User::findUserByName($data["ruser"]);
            if(!$user) {
                $this->flash->error("User not found!");
            } else {
                $data["ruid"] = $user->uid;
                if (!$form->isValid($data, $dm)) {
                    foreach ($form->getMessages() as $message) {
                        $this->flash->error($message);
                    }
                }
                else {
                    $dm->ruid = $user->uid;
                    $dm->suid = $this->auth["id"];

                    if($dm->save() == false) {
                        foreach ($dm->getMessages() as $message) {
                            $this->flash->error($message);
                        }
                    }
                    else {
                        $this->flash->success("Direct Message Sent!");
                        return $this->forward("notification/index");
                    }
                }
            }
        }
        $this->view->form = $form;
    }

    public function sendallAction() {
        $dm = new Directmessage;
        $dm->ruser = "All";
        $form = new DirectMessageForm($dm);

        if ($this->request->isPost()) {

            $data = $this->request->getPost();

            if (!$form->isValid($data, $dm)) {
                foreach ($form->getMessages() as $message) {
                    $this->flash->error($message);
                }
            } else {
                $dm->ruid = 0;
                $dm->suid = $this->auth["id"];

                if($dm->save() == false) {
                    foreach ($dm->getMessages() as $message) {
                        $this->flash->error($message);
                    }
                }
                else {
                    $this->flash->success("Notice Published!");
                    return $this->forward("notification/index");
                }
            }
        }
        $this->view->form = $form;
    }

    public function removeAction($dmid) {
        $dm = Directmessage::findFirst(array(
            "(dmid = :dmid:)",
            'bind' => array('dmid' => $dmid)
        ));
        if(!$dm) {
            $this->flash->error("Direct Message Not Found!");
            return $this->forward("notification/index");
        } else {
            if($dm->suid == $this->auth["id"] || $dm->ruid == $this->auth["id"]) {
                $dm->delete();
                $this->flash->success("Direct Message Deleted!");
                return $this->forward("notification/index");
            } else {
                $this->flash->error("Premission Denied");
                return $this->forward("notification/index");
            }
        }
    }
}
