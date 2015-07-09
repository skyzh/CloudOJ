<?php

use Phalcon\Mvc\User\Component;

/**
 * Elements
 *
 * Helps to build UI elements for the application
 */
class Elements extends Component
{

    private $_headerMenu = array(
        'navbar-left' => array(
            'index' => array(
                'caption' => 'Home',
                'action' => 'index'
            ),
            'admin' => array(
                'caption' => 'Admin',
                'action' => 'index'
            ),
            'problemset' => array(
                'caption' => 'Problems',
                'action' => 'index'
            ),
            'status' => array(
                'caption' => 'Status',
                'action' => 'index'
            ),
            'rank' => array(
                'caption' => 'Rank',
                'action' => 'index'
            )
        ),
        'navbar-right' => array(
            'session' => array(
                'caption' => 'Log In/Sign Up',
                'action' => 'index'
            ),
        )
    );

    public function getDropdown($menu) {
        echo '<li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">User<span class="caret"></span></a>
            <ul class="dropdown-menu">';
        foreach ($menu as $controller => $option) {
            echo '<li>';
            echo $this->tag->linkTo($controller . '/' . $option['action'], $option['caption']);
            echo '</li>';
        }
        echo '</ul></li>';
    }

    public function getList($currentController, $menu) {
        foreach ($menu as $controller => $option) {
            if($controller == ".dropdown") {
                $this->getDropdown($option);
            } else {
                if ($currentController == $controller) {
                    echo '<li class="active">';
                } else {
                    echo '<li>';
                }
                echo $this->tag->linkTo($controller . '/' . $option['action'], $option['caption']);
                echo '</li>';
            }
        }
    }
    public function getMenu() {

        $auth = $this->session->get('auth');
        if ($auth) {
            $this->_headerMenu['navbar-right'] = array(
                '.dropdown' => array(
                    'profile' => array(
                        'caption' => 'Profile',
                        'action' => 'index'
                    ),
                    'notification' => array(
                        'caption' => 'Notification',
                        'action' => 'index'
                    ),
                    'session' => array(
                        'caption' => 'Log Out',
                        'action' => 'end'
                    )
                )
            );
        } else {
            unset($this->_headerMenu['navbar-left']['admin']);
        }

        $controllerName = $this->view->getControllerName();
        foreach ($this->_headerMenu as $position => $menu) {
            echo '<ul class="nav navbar-nav ', $position, '">';
            $this->getList($controllerName, $menu);
            echo '</ul>';
        }

    }
}
