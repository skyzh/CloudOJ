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

    public function scanAction($baseID) {
        $__count = 0;
        $baseObj = $this->getBaseObject($baseID);
        if(!$baseObj) {
            $this->flash->error("{$this->baseName} does not exist");
            return $this->forward("{$this->baseFailURI}/{$baseID}");
        }
        $__datbaseDir = "{$baseID}/";
        $__baseDir = APP_PATH . "ojdata/" . $__datbaseDir;
        $files = scandir($__baseDir);
        if($files) {
            foreach ($files as $name) {
                if($name != '.' && $name != '..') {
                    $file_arr = explode('.', $name);
                    if(count($file_arr) >= 2) {
                        $file_ext = $file_arr[count($file_arr) - 1];
                        unset($file_arr[count($file_arr) - 1]);
                        $file_name = join('.', $file_arr);
                        if($file_ext == "out" || $file_ext == "ans") {
                            $childObj = $this->getNewChildObject($baseObj);
                            $childObj->isSample = 0;
                            $childObj->dat_in = $__datbaseDir . $file_name . ".in";
                            $childObj->dat_out = $__datbaseDir . $name;
                            $childObj->dat_name = $file_name;
                            $childObj->isFile = 1;
                            $childObj->save();
                            $__count++;
                        }
                    }
                }
            }
        }

        $this->flash->success("Found {$__count} Data in {$__baseDir}");
        return $this->forwardIndex($baseID);
    }
}
