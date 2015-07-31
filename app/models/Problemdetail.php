<?php
use Phalcon\Mvc\Model;
use Phalcon\Mvc\Model\Validator\Email as EmailValidator;
use Phalcon\Mvc\Model\Validator\Uniqueness as UniquenessValidator;
use Phalcon\Db\RawValue;

class Problemdetail extends Model {
    public $pid;
    public $description;
    public $input;
    public $output;
    public $sampleinput;
    public $sampleoutput;
    public $hint;

    public function initialize() {
        $this->belongsTo("pid", "Problemset", "pid", array(
            'reusable' => true
        ));
    }
}
