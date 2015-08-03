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
        $this->belongsTo("uid", "User", "uid", array(
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

    public function getGroup() {
        return Group::findFirst(array(
            "conditions" => ":score: >= scorerequired",
            "order"      => "scorerequired DESC",
            "bind"       => array("score" => $this->score)
        ));
    }
    public function getNextGroup() {
        return Group::findFirst(array(
            "conditions" => ":score: < scorerequired",
            "order"      => "scorerequired",
            "bind"       => array("score" => $this->score)
        ));
    }
}
