<?php
use Phalcon\Mvc\Model;
use Phalcon\Mvc\Model\Validator\Email as EmailValidator;
use Phalcon\Mvc\Model\Validator\Uniqueness as UniquenessValidator;
use Phalcon\Db\RawValue;

class Directmessage extends Model {
    public $dmid;
    public $suid;
    public $ruid;
    public $message;
    public $sendtime;

    public $__susername;
    public $__rusername;

    public function beforeValidationOnCreate()
    {
        $this->sendtime = new RawValue('now()');
    }
}
