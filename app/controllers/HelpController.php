<?php

class HelpController extends ControllerBase
{
    public function initialize()
    {
        $this->tag->setTitle('Help');
        parent::initialize();
    }

    public function indexAction() {
    }

    public function viewAction($help_path) {
        $__path = APP_PATH . "app/views/help/{$help_path}.md";

        if(file_exists($__path)) {
            $helpFile = fopen($__path, "r");
            $fileContent =  fread($helpFile,filesize($__path));
            fclose($helpFile);
        } else {
            return $this->forward("help/index");
        }
        $this->view->fileContent = $fileContent;
    }
}
