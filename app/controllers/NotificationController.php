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
            "(ruid = :ruid: OR suid = :ruid:)",
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

        foreach ($dms->items as $item) {
            $item->__susername = User::findUserByID($item->suid);
            $item->__rusername = User::findUserByID($item->ruid);
        }

        $this->view->dms = $dms;
    }

    public function sendAction() {
        $form = new DirectMessageForm();

        if ($this->request->isPost()) {
            $dm = new Directmessage();
            $data = $this->request->getPost();

            $__id = User::findUserByName($data["ruser"]);
            if($__id == -1) {
                $this->flash->error("User not found!");
            } else {
                $data["ruid"] = $__id;
                if (!$form->isValid($data, $dm)) {
                    foreach ($form->getMessages() as $message) {
                        $this->flash->error($message);
                    }
                }
                else {
                    $dm->ruid = $__id;
                    $dm->suid = $this->auth["id"];
                    $dm->message = $data["message"];

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
}
