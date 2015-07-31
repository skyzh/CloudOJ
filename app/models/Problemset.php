<?php
use Phalcon\Mvc\Model;
use Phalcon\Mvc\Model\Validator\Email as EmailValidator;
use Phalcon\Mvc\Model\Validator\Uniqueness as UniquenessValidator;
use Phalcon\Db\RawValue;

class Problemset extends Model {
    public $pid;
    public $title;
    public $type;
    public $submit;
    public $accepted;
    public $changetime;
    public $memlimit;
    public $timelimit;
    public $problemdetail;

    public function initialize() {
        $this->hasOne("pid", "problemdetail", "pid", array(
            'reusable' => true
        ));
    }

    public function beforeValidationOnCreate() {
        $this->submit = 0;
        $this->accepted = 0;
        $this->changetime = new RawValue('now()');
    }

    public static function findProblemByID($pid) {
        $problem = Problemset::findFirst(array(
            "pid = :pid:", 'bind' => array('pid' => $pid)));
        return $problem;
    }
}
