<?php

use Phalcon\Forms\Form;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Hidden;
use Phalcon\Forms\Element\Select;
use Phalcon\Validation\Validator\PresenceOf;
use Phalcon\Validation\Validator\Email;
use Phalcon\Validation\Validator\Numericality;

class ProblemForm extends Form {
    public function initialize($entity = null, $options = array()) {

        if (!isset($options['edit'])) {
            $element = new Text("id");
            $this->add($element->setLabel("Id"));
        } else {
            $this->add(new Hidden("id"));
        }

        $title = new Text("title");
        $title->setLabel("Title");
        $title->setFilters(array('striptags', 'string'));
        $title->addValidators(array(
            new PresenceOf(array(
                'message' => 'Title is required'
            ))
        ));
        $this->add($title);

        $memlimit = new Text("memlimit");
        $memlimit->setLabel("Memory Limit");
        $memlimit->setFilters(array('int'));
        $memlimit->addValidators(array(
            new PresenceOf(array(
                'message' => 'Memory Limit is required'
            )),
            new Numericality(array(
                'message' => 'Memory Limit is required'
            ))
        ));
        $this->add($memlimit);

        $timelimit = new Text("memlimit");
        $timelimit->setLabel("Memory Limit");
        $timelimit->setFilters(array('int'));
        $timelimit->addValidators(array(
            new PresenceOf(array(
                'message' => 'Memory Limit is required'
            )),
            new Numericality(array(
                'message' => 'Memory Limit is required'
            ))
        ));
        $this->add($timelimit);
    }
}
