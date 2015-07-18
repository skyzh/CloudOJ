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

    public $description;
    public $input;
    public $output;
    public $sampleinput;
    public $sampleoutput;
    public $hint;
    public $changetime;
    public $memlimit;
    public $timelimit;

    public function validation()
    {
    }

    public function beforeCreate()
    {
        $this->changetime = new RawValue('now()');
    }
}
