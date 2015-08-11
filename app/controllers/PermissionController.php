<?php
use Phalcon\Paginator\Adapter\Model as PaginatorModel;
use Phalcon\Paginator\Adapter\NativeArray as PaginatorArray;
use Phalcon\Paginator\Adapter\QueryBuilder as PaginatorQueryBuilder;

class PermissionController extends CRUDChildController {
    protected $title = "Permission";
    protected $baseName = "Problem";
    protected $childName = "Problem Permission";
    protected $baseURI = "permission";
    protected $baseFailURI = "problemset/view";

    protected function getBaseObject($baseID) {
        return Problemset::findProblemByID($baseID);
    }
    protected function getAllChildObject($baseObj) {
        return $baseObj->problempermission;
    }
    protected function getNewChildObject($baseObj) {
        $probperm = new Problempermission;
        $probperm->ppid = 0;
        $probperm->pid = $baseObj->pid;
        return $probperm;
    }
    protected function findChildObject($childID) {
        return Problempermission::findProblemPermissionByPID($childID);
    }
    protected function getForm($entity, $options) {
        return new ProbPermForm($entity, $options);
    }
}
