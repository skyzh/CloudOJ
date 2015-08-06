<?php

use Phalcon\Forms\Form;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Password;
use Phalcon\Validation\Validator\PresenceOf;
use Phalcon\Validation\Validator\Email;
use Phalcon\Validation\Validator\StringLength;

class RegisterForm extends Form
{

    public function initialize($entity = null, $options = null)
    {
        $username = new Text('username', array(
            'placeholder' => 'Username'
        ));
        $username->setLabel('Username');
        $username->setFilters(array('striptags', 'string'));
        $username->addValidators(array(
            new PresenceOf(array(
                'message' => 'Please enter your desired username'
            )),
            new StringLength(array(
                'max' => 20,
                'min' => 5,
                'messageMaximum' => 'Username must have at most 20 characters',
                'messageMinimum' => 'Username must have at least 5 characters'
            ))
        ));
        $this->add($username);

        $email = new Text('email', array(
            'placeholder' => 'E-mail'
        ));
        $email->setLabel('E-mail');
        $email->setFilters('email');
        $email->addValidators(array(
            new PresenceOf(array(
                'message' => 'E-mail is required'
            )),
            new Email(array(
                'message' => 'E-mail is not valid'
            ))
        ));
        $this->add($email);

        $password = new Password('password', array(
            'placeholder' => 'Password'
        ));
        $password->setLabel('Password');
        $password->addValidators(array(
            new PresenceOf(array(
                'message' => 'Password is required'
            )),
            new StringLength(array(
                'max' => 20,
                'min' => 5,
                'messageMaximum' => 'Password must have at most 20 characters',
                'messageMinimum' => 'Password must have at least 5 characters'
            ))
        ));
        $this->add($password);

        $repeatPassword = new Password('repeatPassword', array(
            'placeholder' => 'Repeat Password'
        ));
        $repeatPassword->setLabel('Repeat Password');
        $repeatPassword->addValidators(array(
            new PresenceOf(array(
                'message' => 'Confirmation password is required'
            ))
        ));
        $this->add($repeatPassword);
    }
}
