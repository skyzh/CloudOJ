<?php

use Phalcon\Forms\Form;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\TextArea;
use Phalcon\Forms\Element\Hidden;
use Phalcon\Forms\Element\Select;
use Phalcon\Validation\Validator\PresenceOf;
use Phalcon\Validation\Validator\Email;
use Phalcon\Validation\Validator\Numericality;

class ProbDataForm extends Form {

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
        $isSample = new Select("isSample", array(
            0 => "Test Data",
            1 => "Sample",
        ));
        $isSample->setLabel("Is Sample");
        $this->add($isSample);

        $dat_name = new Text('dat_name', array(
            'placeholder' => 'Data Name'
        ));
        $dat_name->setLabel('Data Name');
        $dat_name->setFilters(array('alphanum'));
        $dat_name->addValidators(array(
            new PresenceOf(array(
                'message' => 'Please enter Data Name'
            ))
        ));
        $this->add($dat_name);

        $this->addStringArea("dat_in", "Data in");
        $this->addStringArea("dat_out", "Data out");
    }
}
