<?php
use Phalcon\Mvc\Model;
use Phalcon\Mvc\Model\Validator\Email as EmailValidator;
use Phalcon\Mvc\Model\Validator\Uniqueness as UniquenessValidator;
use Phalcon\Db\RawValue;

class Problempermission extends Model {
    public $ppid;
    public $data;
    public $pid;

    public function initialize() {
        $this->belongsTo("pid", "Problemset", "pid", array(
            'reusable' => true
        ));
    }

    public function checkPermission($user) {
        if($this->type == 0) {
            return $user->userprofile->score >= $this->data;
        }
        if($this->type == 1) {
            return false;
        }
        return false;
    }

    public function getPermissionInfo() {
        if($this->type == 0) {
            return "At least {$this->data} points of EXP are required.";
        }
        if($this->type == 1) {
            return "This problem is hidden.";
        }
    }
    public static function findProblemPermissionByPID($ppid) {
        $probperm = Problempermission::findFirst(array(
            "ppid = :ppid:", 'bind' => array('ppid' => $ppid)));
        return $probperm;
    }
}
