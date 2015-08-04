<?php

use Phalcon\Mvc\Controller;
use Phalcon\Mvc\View;

class IndexController extends ControllerBase {
    public function initialize() {
        $this->tag->setTitle('Welcome');
        parent::initialize();
    }

    public function indexAction() {

    }

    public function welcomeAction() {
        
    }
}
