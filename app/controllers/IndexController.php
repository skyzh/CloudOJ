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
        $this->view->beforeNavbar = "before_index";
        $this->view->afterNavbar = "after_index";

    }
}
