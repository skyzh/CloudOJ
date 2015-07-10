<?php

class ProblemSetController extends ControllerBase
{
    public function initialize()
    {
        $this->tag->setTitle('Problems');
        parent::initialize();
    }

    public function indexAction()
    {
    }
}
