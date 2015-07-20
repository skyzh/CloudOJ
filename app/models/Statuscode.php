CREATE TABLE `statuscode` (
    sid int(11) NOT null,
    foreign key(sid) references status(sid),
    PRIMARY KEY (sid),
    code mediumtext not null
);

<?php
use Phalcon\Mvc\Model;
use Phalcon\Mvc\Model\Validator\Email as EmailValidator;
use Phalcon\Mvc\Model\Validator\Uniqueness as UniquenessValidator;
use Phalcon\Db\RawValue;

class Statuscode extends Model {
    public $sid;
    public $code;

    public function validation()
    {
    }

    public function beforeCreate()
    {
    }
}
