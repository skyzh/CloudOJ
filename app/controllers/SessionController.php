<?php

class SessionController extends ControllerBase {
    public function initialize() {
        $this->tag->setTitle('Sign In');
        parent::initialize();
    }

    public function indexAction() {
    }

    private function _registerSession(User $user) {
        $this->session->set('auth', array(
            'id' => $user->uid,
            'name' => $user->username,
            'groupid' => $user->groupid
        ));
    }

    public function startAction() {
        if ($this->request->isPost()) {

            $email = $this->request->getPost('email');
            $password = $this->request->getPost('password');

            $user = User::findFirst(array(
                "(email = :email: OR username = :email:)",
                'bind' => array('email' => $email)
            ));
            if ($user) {
                if ($this->security->checkHash($password, $user->password)) {
                    $this->_registerSession($user);
                    $this->flash->success('<h5>Log in successfully</h5><h6>Welcome, ' . $user->username .
                    '</h6>');
                    return $this->forward('index/index');
                }
            }
            $this->flash->error('Wrong email/password');
        }
        return $this->forward('session/index');
    }

    public function endAction() {
        $this->session->remove('auth');
        $this->flash->success('<h5>Log out successfully</h5><h6>Goodbye!</h6>');
        return $this->forward('index/index');
    }
}
