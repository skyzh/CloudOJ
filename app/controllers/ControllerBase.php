<?php

use Phalcon\Mvc\Controller;

class ControllerBase extends Controller {

    protected $auth;

    protected function getAuth()
    {
        $this->auth = $this->session->get('auth');

        $this->view->isUser = false;
        $this->view->isAdmin = false;
        if($this->auth) {
            if($this->auth["groupid"] == 1)
                $this->view->isAdmin = true;
            if($this->auth["groupid"] <> 0)
                $this->view->isUser = true;
        }
    }

    protected function initialize() {
        $this->getAuth();
        $this->tag->prependTitle('SNGOJ | ');
        $this->view->setTemplateAfter('main');
    }

    protected function forward($uri) {
        $uriParts = explode('/', $uri);
        $params = array_slice($uriParts, 2);
        return $this->dispatcher->forward(
            array(
                'controller' => $uriParts[0],
                'action' => $uriParts[1],
                'params' => $params
            )
        );
    }
}
