<?php

use Phalcon\Forms\Form;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\TextArea;
use Phalcon\Forms\Element\Hidden;
use Phalcon\Forms\Element\Select;
use Phalcon\Validation\Validator\PresenceOf;
use Phalcon\Validation\Validator\Email;
use Phalcon\Validation\Validator\Numericality;

class DirectMessageForm extends Form {
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
        $friend = new Text("ruser");
        $friend->setLabel("Friend");
        $friend->setFilters(array('striptags', 'string'));
        $friend->addValidators(array(
            new PresenceOf(array(
                'message' => 'Friend is required'
            ))
        ));
        $this->add($friend);


        $this->addStringArea("message", "Message");
    }
}
