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

    public function initialize() {
        $this->hasOne("pid", "Problemdetail", "pid", array(
            'reusable' => true
        ));
        $this->hasMany("pid", "Problemdata", "pid", array(
            'reusable' => true
        ));
        $this->hasMany("pid", "Problempremission", "pid", array(
            'reusable' => true
        ));
    }

    public function beforeValidationOnCreate() {
        $this->submit = 0;
        $this->accepted = 0;
        $this->changetime = new RawValue('now()');
    }

    public function beforeSave() {
        $this->changetime = new RawValue('now()');
    }

    public static function findProblemByID($pid) {
        $problem = Problemset::findFirst(array(
            "pid = :pid:", 'bind' => array('pid' => $pid)));
        return $problem;
    }

    public function checkPremission($uid) {
        $user = User::findUserByID($uid);
        foreach($this->problempremission as $premission) {
            if(!$user) return false;
            if(!$premission->checkPremission($user)) {
                return false;
            }
        }
        return true;
    }

    public function getPremissionInfo() {
        $text = "";
        foreach($this->problempremission as $premission) {
            $text = $text . "<p>" . $premission->getPremissionInfo() . "</p>";
        }
        return $text;
    }
}
