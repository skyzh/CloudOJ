<?php
use Phalcon\Paginator\Adapter\Model as PaginatorModel;
use Phalcon\Paginator\Adapter\NativeArray as PaginatorArray;
use Phalcon\Paginator\Adapter\QueryBuilder as PaginatorQueryBuilder;

class PremissionController extends CRUDController {
    protected $title = "Premission";
    protected $baseName = "Problem";
    protected $childName = "Problem Premission";
    protected $baseURI = "premission";
    protected $baseFailURI = "problemset/view";

    protected function getBaseObject($baseID) {
        return Problemset::findProblemByID($baseID);
    }
    protected function getAllChildObject($baseObj) {
        return $baseObj->problempremission;
    }
    protected function getNewChildObject($baseObj) {
        $probprem = new problempremission;
        $probprem->ppid = 0;
        $probprem->pid = $baseObj->pid;
        return $probprem;
    }
    protected function findChildObject($childID) {
        return Problempremission::findProblemPremissionByPID($childID);
    }
    protected function getForm($entity, $options) {
        return new ProbPremForm($entity, $options);
    }
}
