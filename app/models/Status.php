<?php
use Phalcon\Mvc\Model;
use Phalcon\Mvc\Model\Validator\Email as EmailValidator;
use Phalcon\Mvc\Model\Validator\Uniqueness as UniquenessValidator;
use Phalcon\Db\RawValue;

class Status extends Model {
    public $sid;
    public $pid;
    public $uid;
    public $lang;
    public $submittime;
    public $status;
    public $memlimit;
    public $timelimit;
    public $codelength;

    public function validation()
    {
    }

    public function beforeValidationOnCreate()
    {
        $this->submittime = new RawValue('now()');
        $this->memlimit = 0;
        $this->timelimit = 0;
        $this->status = 0;
    }
}