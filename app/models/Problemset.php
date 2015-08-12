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
    public $isDeleted;

    public function initialize() {
        $this->hasOne("pid", "Problemdetail", "pid", array(
            'reusable' => true
        ));
        $this->hasMany("pid", "Problemdata", "pid", array(
            'reusable' => true
        ));
        $this->hasMany("pid", "Problempermission", "pid", array(
            'reusable' => true
        ));
    }

    public function beforeValidationOnCreate() {
        $this->submit = 0;
        $this->accepted = 0;
        $this->changetime = new RawValue('now()');
        $this->isDeleted = false;
    }

    public function beforeSave() {
        $this->changetime = new RawValue('now()');
    }

    public static function findProblemByID($pid) {
        $problem = Problemset::findFirst(array(
            "pid = :pid:", 'bind' => array('pid' => $pid)));
        return $problem;
    }

    public function checkPermission($uid) {
        $user = User::findUserByID($uid);
        foreach($this->problempermission as $permission) {
            if(!$user) return false;
            if(!$permission->checkPermission($user)) {
                return false;
            }
        }
        return true;
    }

    public function getPermissionInfo() {
        $text = "";
        foreach($this->problempermission as $permission) {
            $text = $text . "<p>" . $permission->getPermissionInfo() . "</p>";
        }
        return $text;
    }
}
