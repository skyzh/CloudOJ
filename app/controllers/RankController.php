<?php
use Phalcon\Paginator\Adapter\Model as PaginatorModel;
use Phalcon\Paginator\Adapter\NativeArray as PaginatorArray;
use Phalcon\Paginator\Adapter\QueryBuilder as PaginatorQueryBuilder;

class RankController extends ControllerBase {
    public function initialize() {
        $this->tag->setTitle('Rank');
        parent::initialize();
    }

    public function indexAction() {
        $currentPage = (int) $this->request->getQuery('page');
        if($currentPage <= 0) $currentPage = 1;

        $paginator = new PaginatorQueryBuilder(array(
            "builder" => $this->modelsManager->createBuilder()->from("Userprofile")
            ->orderBy("Userprofile.score DESC"),
            "limit"=> 50,
            "page" => $currentPage
        ));
        $users = $paginator->getPaginate();
        $this->view->userprofile = $users;
    }
}
