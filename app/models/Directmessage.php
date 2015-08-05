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

    public $suser;
    public $ruser;

    public function initialize() {
        $this->hasOne("suid", "User", "uid", array(
            'reusable' => true,
            'alias' => 'sendUser'
        ));
        $this->hasOne("ruid", "User", "uid", array(
            'reusable' => true,
            'alias' => 'recvUser'
        ));
    }

    public function beforeValidationOnCreate()
    {
        $this->sendtime = new RawValue('now()');
    }
}
