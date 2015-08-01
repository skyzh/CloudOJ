<?php
use Phalcon\Mvc\Model;
use Phalcon\Mvc\Model\Validator\Email as EmailValidator;
use Phalcon\Mvc\Model\Validator\Uniqueness as UniquenessValidator;
use Phalcon\Db\RawValue;

class Problemdata extends Model {
    public $pdid;
    public $pid;
    public $isSample;
    public $dat_in;
    public $dat_out;
    public $dat_name;

    public function initialize() {
        $this->belongsTo("pid", "Problemset", "pid", array(
            'reusable' => true
        ));
    }

    public static function findProblemDataByDID($pdid) {
        $probdata = Problemdata::findFirst(array(
            "pdid = :pdid:", 'bind' => array('pdid' => $pdid)));
        return $probdata;
    }
}
