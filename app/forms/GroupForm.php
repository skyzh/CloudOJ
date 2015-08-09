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

class GroupForm extends Form {
    public function initialize($entity = null, $options = array()) {
        $name = new Text("name", array(
            "placeholder" => "Group Name"
        ));
        $name->setLabel("Name");
        $name->setFilters(array('striptags', 'string'));
        $name->addValidators(array(
            new PresenceOf(array(
                'message' => 'Name is required'
            ))
        ));
        $this->add($name);

        $score = new Text("scorerequired", array(
            'placeholder' => "Require Score"
        ));
        $score->setLabel("Require Score");
        $score->setFilters(array('int'));
        $score->addValidators(array(
            new PresenceOf(array(
                'message' => 'Score is required'
            )),
            new Numericality(array(
                'message' => 'Score is required'
            ))
        ));
        $this->add($score);
    }
}
