<?php
use Phalcon\Paginator\Adapter\Model as PaginatorModel;
use Phalcon\Paginator\Adapter\NativeArray as PaginatorArray;
use Phalcon\Paginator\Adapter\QueryBuilder as PaginatorQueryBuilder;

class DataController extends CRUDChildController {
    protected $title = "Data";
    protected $baseName = "Problem";
    protected $childName = "Problem Data";
    protected $baseURI = "data";
    protected $baseFailURI = "problemset/view";

    protected function getBaseObject($baseID) {
        return Problemset::findProblemByID($baseID);
    }
    protected function getAllChildObject($baseObj) {
        return $baseObj->problemdata;
    }
    protected function getNewChildObject($baseObj) {
        $probdata = new Problemdata;
        $probdata->pdid = 0;
        $probdata->pid = $baseObj->pid;
        return $probdata;
    }
    protected function findChildObject($childID) {
        return Problemdata::findProblemDataByDID($childID);
    }
    protected function getForm($entity, $options) {
        return new ProbDataForm($entity, $options);
    }
    protected function afterSave($baseObj, $childObj) {
        WatcherAction::ContributeProblem($this->auth["id"], $baseObj->pid);
    }
}
