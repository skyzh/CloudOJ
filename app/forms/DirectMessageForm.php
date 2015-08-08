<?php

use Phalcon\Forms\Form;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\TextArea;
use Phalcon\Forms\Element\Hidden;
use Phalcon\Forms\Element\Select;
use Phalcon\Validation\Validator\PresenceOf;
use Phalcon\Validation\Validator\Email;
use Phalcon\Validation\Validator\Numericality;
use Phalcon\Validation\Validator\StringLength;

class DirectMessageForm extends Form {
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


        $message= new TextArea("message", array(
            'placeholder' => "Message"
        ));
        $message->setLabel("message");
        $message->addValidators(array(
            new PresenceOf(array(
                'message' => 'message is required'
            )),
            new StringLength(array(
                'max' => 140,
                'min' => 3,
                'messageMaximum' => 'message must have at most 140 characters',
                'messageMinimum' => 'message must have at least 3 characters'
            ))
        ));
        $this->add($message);
    }
}
