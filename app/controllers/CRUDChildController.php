<?php
use Phalcon\Paginator\Adapter\Model as PaginatorModel;
use Phalcon\Paginator\Adapter\NativeArray as PaginatorArray;
use Phalcon\Paginator\Adapter\QueryBuilder as PaginatorQueryBuilder;

class CRUDChildController extends ControllerBase {
    public function initialize() {
        $this->tag->setTitle($this->title);
        parent::initialize();
    }

    protected $title = "CRUD";
    protected $baseName = "CRUD";
    protected $childName = "CRUD";
    protected $baseURI = "CRUD";
    protected $baseFailURI = "problemset/view";

    protected function getBaseObject($baseID) {
        return null;
    }
    protected function getAllChildObject($baseObj) {
        return $baseObj->problempremission;
    }
    protected function getNewChildObject($baseObj) {
        return null;
    }
    protected function findChildObject($childID) {
        return null;
    }
    protected function getForm($entity, $options) {
        return null;
    }
    private function forwardIndex($baseID) {
        return $this->forward("{$this->baseURI}/index/{$baseID}");
    }
    protected function afterSave($baseObj, $childObj) {
        return null;
    }
    public function indexAction($baseID) {
        $baseObj = $this->getBaseObject($baseID);
        if(!$baseObj) {
            $this->flash->error("{$this->baseName} does not exist");
            return $this->forward("{$this->baseFailURI}/{$baseID}");
        }
        $this->view->baseID = $baseID;
        $this->view->baseObj = $baseObj;
        $this->view->childObj = $this->getAllChildObject($baseObj);
    }

    public function newAction($baseID) {
        return $this->forward("{$this->baseURI}/edit/{$baseID}/0");
    }

    public function editAction($baseID, $childID) {
        $baseObj = $this->getBaseObject($baseID);
        if(!$baseObj) {
            $this->flash->error("{$this->baseName} does not exist");
            return $this->forward("{$this->baseFailURI}/{$baseID}");
        }
        if($childID == 0) {
            $childObj = $this->getNewChildObject($baseObj);
        } else {
            $childObj = $this->findChildObject($childID);
            if(!$childObj) {
                $this->flash->error("{$this->childName} not found");
                return $this->forwardIndex($baseID);
            }
        }
        $form = $this->getForm($childObj, null);

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
                    $this->afterSave($baseObj, $childObj);
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
