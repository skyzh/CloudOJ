<?php
use Phalcon\Mvc\Model;
use Phalcon\Mvc\Model\Validator\Email as EmailValidator;
use Phalcon\Mvc\Model\Validator\Uniqueness as UniquenessValidator;
use Phalcon\Db\RawValue;

class Group extends Model {
    public $gid;
    public $scorerequired;
    public $name;

    public static function findGroupByID($gid) {
        $group = Group::findFirst(array(
            "gid = :gid:", 'bind' => array('gid' => $gid)));
        return $group;
    }
}
