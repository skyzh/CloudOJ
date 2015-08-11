<?php

class AssetsController extends ControllerBase
{
    public function initialize()
    {
        $this->tag->setTitle('Assets');
        parent::initialize();
    }

    public function indexAction() {
    }
}
