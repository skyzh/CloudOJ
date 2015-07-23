<?php
use Phalcon\Paginator\Adapter\Model as PaginatorModel;
use Phalcon\Paginator\Adapter\NativeArray as PaginatorArray;
use Phalcon\Paginator\Adapter\QueryBuilder as PaginatorQueryBuilder;

class ProfileController extends ControllerBase {
    public function initialize() {
        $this->tag->setTitle('Problems');
        parent::initialize();
    }

    public function indexAction() {
        return $this->forward("profile/view/".$this->auth["id"]);
    }
    public function viewAction($uid) {
    $user = User::findFirst(array(
        "uid = :uid:", 'bind' => array('uid' => $uid)));
        $user->avatar = User::getAvatar($user->email);
        $this->view->user = $user;
    }
}
