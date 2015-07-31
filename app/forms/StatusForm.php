<?php

use Phalcon\Forms\Form;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\TextArea;
use Phalcon\Forms\Element\Hidden;
use Phalcon\Forms\Element\Select;
use Phalcon\Validation\Validator\PresenceOf;
use Phalcon\Validation\Validator\Email;
use Phalcon\Validation\Validator\Numericality;

class StatusForm extends Form {
    private function addStringArea($objName, $objLabel) {
        $obj= new TextArea($objName, array(
            'placeholder' => $objLabel
        ));
        $obj->setLabel($objLabel);
        $obj->addValidators(array(
            new PresenceOf(array(
                'message' => $objLabel.' is required'
            )),
        ));
        $this->add($obj);
    }
    public function initialize($entity = null, $options = array()) {
        $lang = new Select("lang", array(
            0 => "GNU C++",
            1 => "GNU C",
            2 => "GNU C++11",
            3 => "Python2",
            4 => "Python3",
            5 => "Java",
            6 => "Pascal",
            7 => "Ruby",
            8 => "Perl",
            9 => "Go",
            10 => "Lua",
            11 => "Haskell"
        ));
        $lang->setLabel("Language");
        $this->add($lang);

        $this->addStringArea("code", "Code");
    }
}
