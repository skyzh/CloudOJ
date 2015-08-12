<?php

class AssetsController extends ControllerBase
{
    public function initialize()
    {
        $this->tag->setTitle('Assets');
        parent::initialize();
    }

    public function indexAction() {
        $this->view->path = "";
        if($this->request->isPost()) {
            if ($this->request->hasFiles() == true) {
                $__count = 0;
                foreach ($this->request->getUploadedFiles() as $file) {
                    if($file->getName() != "") {
                        $__path = "upload/" . strval(strtotime("now")) . "." .
                            $file->getName();
                        if(preg_match("/^image/", $file->getRealType())) {
                            $__count++;
                            $this->flash->success("{$__path} was uploaded successfully");
                            $file->moveTo(APP_PATH . "public/" . $__path);
                            $__baseURI = $this->url->getBaseUri();
                            $this->view->path .= "<div class='alert alert-success'><p>Insert this code into markdown area: </p><pre><code>![description]({$__baseURI}{$__path})</code></pre></div>";
                        }
                    }
                }
                $this->flash->success("{$__count} files were uploaded successfully");
            }
        }
    }
}
