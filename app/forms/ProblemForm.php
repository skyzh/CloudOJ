<?php

use Phalcon\Forms\Form;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\TextArea;
use Phalcon\Forms\Element\Hidden;
use Phalcon\Forms\Element\Select;
use Phalcon\Validation\Validator\PresenceOf;
use Phalcon\Validation\Validator\Email;
use Phalcon\Validation\Validator\Numericality;

class ProblemForm extends Form {
    private function addNumber($objName, $objLabel) {
        $obj = new Text($objName);
        $obj->setLabel($objLabel);
        $obj->setFilters(array('int'));
        $obj->addValidators(array(
            new PresenceOf(array(
                'message' => $objLabel.' is required'
            )),
            new Numericality(array(
                'message' => $objLabel.' is required'
            ))
        ));
        $this->add($obj);
    }
    private function addStringArea($objName, $objLabel) {
        $obj= new TextArea($objName);
        $obj->setLabel($objLabel);
        $obj->addValidators(array(
            new PresenceOf(array(
                'message' => $objLabel.' is required'
            )),
        ));
        $this->add($obj);
    }
    public function initialize($entity = null, $options = array()) {

        $this->add(new Hidden("pid"));
        $this->add(new Hidden("submit"));
        $this->add(new Hidden("accepted"));

        $title = new Text("title");
        $title->setLabel("Title");
        $title->setFilters(array('striptags', 'string'));
        $title->addValidators(array(
            new PresenceOf(array(
                'message' => 'Title is required'
            ))
        ));
        $this->add($title);

        $this->addNumber("memlimit", "Memory Limit");
        $this->addNumber("timelimit", "Time Limit");

        $type = new Text("type");
        $type->setLabel("Type");
        $type->setFilters(array('string'));
        $type->addValidators(array(
            new PresenceOf(array(
                'message' => 'Type is required'
            )),
        ));
        $this->add($type);

        $this->addStringArea("description", "Description");
        $this->addStringArea("input", "Input");
        $this->addStringArea("output", "Output");
        $this->addStringArea("sampleinput", "Sample Input");
        $this->addStringArea("sampleoutput", "Sample Output");
        $this->addStringArea("hint", "Hint");
    }
}
