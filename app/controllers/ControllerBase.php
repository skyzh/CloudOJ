<?php

use Phalcon\Mvc\Controller;

class ControllerBase extends Controller {

    protected function getAuth()
    {
        $auth = $this->session->get('auth');

        $this->view->isUser = false;
        $this->view->isAdmin = false;
        if($auth) {
            if($auth["groupid"] == 1)
                $this->view->isAdmin = true;
            if($auth["groupid"] <> 0)
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
