<?php
use Phalcon\Mvc\Model;
use Phalcon\Mvc\Model\Validator\Email as EmailValidator;
use Phalcon\Mvc\Model\Validator\Uniqueness as UniquenessValidator;
use Phalcon\Db\RawValue;

class User extends Model {
    public $uid;
    public $username;
    public $email;
    public $password;
    public $groupid;
    public $avatar;

    public function initialize() {
        $this->hasOne("uid", "userprofile", "uid", array(
            'reusable' => true
        ));
    }

    public function validation() {
        $this->validate(new UniquenessValidator(array(
            'field' => 'email',
            'message' => 'Sorry, The email was registered by another user'
        )));
        $this->validate(new UniquenessValidator(array(
            'field' => 'username',
            'message' => 'Sorry, That username is already taken'
        )));
        if ($this->validationHasFailed() == true) {
            return false;
        }
    }
    public function beforeValidationOnCreate() {
        $this->avatar = User::getAvatar($this->email);
        $this->groupid = 2;
    }

    public static function getAvatar($email) {
        return "https://cdn.v2ex.com/gravatar/".md5(strtolower($email));
    }

    public static function findUserByName($username) {
        $user = User::findFirst(array(
            "(email = :email: OR username = :email:)",
            'bind' => array('email' => $username)
        ));
        return $user;
    }
    public static function findUserByID($uid) {
        $user = User::findFirst(array(
            "uid = :uid:", 'bind' => array('uid' => $uid)));
        return $user;
    }
}
