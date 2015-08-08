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
    protected function getObject($objID) {
        return null;
    }

    private function forwardIndex() {
        return $this->forward("index/index");
    }
    public function indexAction() {
    }

    public function newAction($objID) {
        return $this->forward("{$this->objURI}/edit/{$objID}/0");
    }

    public function editAction($objID) {
        $obj = $this->getObject($objID);
        if(!$baseObj) {
            $this->flash->error("{$this->objName} does not exist");
            return $this->forwardIndex();
        }

        $form = $this->getForm($obj, null);

        $this->view->baseID = $baseID;
        $this->view->childID = $childID;
        $this->view->isNew = ($childID == 0);
        $this->view->childObj = $childObj;
        $this->view->baseObj = $baseObj;
        $this->view->form = $form;

        if($this->request->isPost()) {
            $data = $this->request->getPost();

            if (!$form->isValid($data, $childObj)) {
                foreach ($form->getMessages() as $message) {
                    $this->flash->error($message);
                }
            } else {
                if ($childObj->save() == false) {
                    foreach ($childObj->getMessages() as $message) {
                        $this->flash->error($message);
                    }
                } else {
                    $form->clear();

                    $this->flash->success("{$this->childName} was updated successfully");
                    return $this->forwardIndex($baseID);
                }
            }
        }
    }

    public function removeAction($baseID, $childID) {
        $childObj = $this->findChildObject($childID);
        if(!$childObj) {
            $this->flash->error("{$this->childName} not found");
            return $this->forwardIndex($baseID);
        }
        $childObj->delete();
        $this->flash->success("{$this->childName} was deleted successfully");
        return $this->forwardIndex($baseID);
    }
}
