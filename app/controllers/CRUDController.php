<?php
use Phalcon\Paginator\Adapter\Model as PaginatorModel;
use Phalcon\Paginator\Adapter\NativeArray as PaginatorArray;
use Phalcon\Paginator\Adapter\QueryBuilder as PaginatorQueryBuilder;

class CRUDController extends ControllerBase {
    public function initialize() {
        $this->tag->setTitle($this->title);
        parent::initialize();
    }

    protected $title = "CRUD";
    protected $objName = "CRUD";
    protected $objURI = "CRUD";


    protected function getObjects() {
        return null;
    }
    protected function newObject() {
        return null;
    }
    protected function findObject($objID) {
        return null;
    }
    protected function getForm($entity, $options) {
        return null;
    }

    private function forwardIndex() {
        return $this->forward("{$this->objURI}/index");
    }
    public function indexAction() {
        $this->view->obj = $this->getObjects();
    }

    public function newAction() {
        return $this->forward("{$this->objURI}/edit/0");
    }

    public function editAction($objID) {
        if($objID == 0) {
            $obj = $this->newObject();
        } else {
            $obj = $this->findObject($objID);
            if(!$obj) {
                $this->flash->error("{$this->objName} does not exist");
                return $this->forwardIndex();
            }
        }

        $form = $this->getForm($obj, null);

        $this->view->isNew = ($objID == 0);
        $this->view->form = $form;
        $this->view->obj = $obj;

        if($this->request->isPost()) {
            $data = $this->request->getPost();

            if (!$form->isValid($data, $obj)) {
                foreach ($form->getMessages() as $message) {
                    $this->flash->error($message);
                }
            } else {
                if ($obj->save() == false) {
                    foreach ($obj->getMessages() as $message) {
                        $this->flash->error($message);
                    }
                } else {
                    $form->clear();

                    $this->flash->success("{$this->objName} was updated successfully");
                    return $this->forwardIndex();
                }
            }
        }
    }

    public function removeAction($objID) {
        $obj = $this->findObject($objID);
        if(!$obj) {
            $this->flash->error("{$this->objName} not found");
            return $this->forwardIndex();
        }
        $obj->delete();
        $this->flash->success("{$this->objName} was deleted successfully");
        return $this->forwardIndex();
    }
}
