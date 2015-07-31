<?php

class RegisterController extends ControllerBase {
    public function initialize()
    {
        $this->tag->setTitle('Sign Up');
        parent::initialize();
    }

    public function indexAction() {
        $form = new RegisterForm;

        if ($this->request->isPost()) {
            $password = $this->request->getPost("password");
            $repeatPassword = $this->request->getPost("repeatPassword");
            if ($password != $repeatPassword) {
                $this->flash->error('Passwords are different');
            } else {
                $user = new User();
                $form->bind($_POST, $user);

                if (!$form->isValid()) {
                    foreach ($form->getMessages() as $message) {
                        $this->flash->error((string) $message);
                    }
                } else {
                    $user->password = $this->security->hash($user->password);
                    $user->userprofile = new Userprofile;
                    if ($user->save() == false) {
                        foreach ($user->getMessages() as $message) {
                            $this->flash->error((string) $message);
                        }
                    } else {
                        $this->tag->setDefault('email', '');
                        $this->tag->setDefault('password', '');

                        $this->flash->success('Thanks for sign-up! Log in to start Advanture</h6>');
                        return $this->forward('session/index');
                    }
                }
            }
        }

        $this->view->form = $form;
    }
}
