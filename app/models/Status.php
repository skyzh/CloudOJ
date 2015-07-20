<?php
use Phalcon\Mvc\Model;
use Phalcon\Mvc\Model\Validator\Email as EmailValidator;
use Phalcon\Mvc\Model\Validator\Uniqueness as UniquenessValidator;
use Phalcon\Db\RawValue;

class Status extends Model {
    public $sid;
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

    public function beforeCreate()
    {
        $this->submittime = new RawValue('now()');
    }
}
