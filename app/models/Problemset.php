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

    public function beforeValidationOnCreate()
    {
        $this->submit = 0;
        $this->accepted = 0;
        $this->changetime = new RawValue('now()');
    }
}
