<?php
use Phalcon\Mvc\Model;
use Phalcon\Mvc\Model\Validator\Email as EmailValidator;
use Phalcon\Mvc\Model\Validator\Uniqueness as UniquenessValidator;
use Phalcon\Db\RawValue;

class Statuscode extends Model {
    public $sid;
    public $code;
    public $ret;

    public function validation()
    {
    }
    public function beforeValidationOnCreate()
    {
        $this->ret = " ";
    }
    public function beforeCreate()
    {
    }
}
