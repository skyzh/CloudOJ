<?php

use Phalcon\Forms\Form;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\TextArea;
use Phalcon\Forms\Element\Hidden;
use Phalcon\Forms\Element\Select;
use Phalcon\Validation\Validator\PresenceOf;
use Phalcon\Validation\Validator\Email;
use Phalcon\Validation\Validator\Numericality;

class ProbPermForm extends Form {
    public function initialize($entity = null, $options = array()) {
        $type = new Select("type", array(
            0 => "Experience",
            1 => "Hidden"
        ));

        $type->setLabel("Type");
        $this->add($type);

        $dat = new Text('data', array(
            'placeholder' => 'Data'
        ));
        $dat->setLabel('Data');
        $dat->setFilters(array('alphanum'));
        $dat->addValidators(array(
            new PresenceOf(array(
                'message' => 'Please enter Data'
            ))
        ));
        $this->add($dat);
    }
}
