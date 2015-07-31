<?php
use Phalcon\Mvc\Model;
use Phalcon\Mvc\Model\Validator\Email as EmailValidator;
use Phalcon\Mvc\Model\Validator\Uniqueness as UniquenessValidator;
use Phalcon\Db\RawValue;

class Userprofile extends Model {
    public $uid;
    public $submit;
    public $accepted;
    public $score;
    public $registertime;
    public $lastactive;

    public function initialize() {
        $this->belongsTo("uid", "user", "uid", array(
            'reusable' => true
        ));
    }

    public function beforeValidationOnCreate() {
        $this->registertime = new RawValue('now()');
        $this->lastactive = new RawValue('now()');
        $this->score = 0;
        $this->submit = 0;
        $this->accepted = 0;
    }
}
