<?php

use Phalcon\Mvc\Controller;
use Phalcon\Mvc\View;
use Phalcon\Db\RawValue;
use Phalcon\Mvc\Model\Query;

class IndexController extends ControllerBase {
    public function initialize() {
        $this->tag->setTitle('Welcome');
        parent::initialize();
    }

    public function indexAction() {
        $this->view->toprankers = Userprofile::find(array(
            "order" => "score DESC",
            "limit" => 6
        ));
        $this->view->notification = Directmessage::getLatestNotice();

        date_default_timezone_set("Asia/Shanghai");
        $__now = strtotime("now");
        $time_now = date("Y-m-d H:i:s" ,$__now);
        $time_prev = date("Y-m-d H:i:s" , strtotime("-3 days"));
        $builder = $this->modelsManager->createBuilder()->from("Status")
        ->betweenWhere("Status.submittime", $time_prev, $time_now);
        $query = $builder->getQuery();
        //echo $builder->getPhql();
        $result = $query->execute();

        $statArray = array(0, 0, 0, 0, 0, 0, 0);
        $statArray_ac = array(0, 0, 0, 0, 0, 0, 0);
        foreach ($result as $row) {
            $__time = strtotime($row->submittime);
            $__delta = $__now - $__time;
            $statArray[ceil(6 - $__delta / 43200)]++;
            if($row->status == 2) $statArray_ac[ceil(6 - $__delta / 43200)]++;
        }
        $this->view->statArray = $statArray;
        $this->view->statArray_ac = $statArray_ac;
    }
}
