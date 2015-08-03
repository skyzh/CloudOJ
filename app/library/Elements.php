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
                'caption' => '<span class="glyphicon glyphicon-home"></span> Home',
                'action' => 'index'
            ),
            'problemset' => array(
                'caption' => '<span class="glyphicon glyphicon-question-sign"></span> Problems',
                'action' => 'index'
            ),
            'contest' => array(
                'caption' => '<span class="glyphicon glyphicon-list-alt"></span> Contest',
                'action' => 'index'
            ),
            'status' => array(
                'caption' => '<span class="glyphicon glyphicon-stats"></span> Status',
                'action' => 'index'
            ),
            'discuss' => array(
                'caption' => '<span class="glyphicon glyphicon-comment"></span> Discuss',
                'action' => 'index'
            ),
            'rank' => array(
                'caption' => '<span class="glyphicon glyphicon-education"></span> Rank',
                'action' => 'index'
            )
        ),
        'navbar-right' => array(
            'session' => array(
                'caption' => '<span class="glyphicon glyphicon-log-in"></span> Log In',
                'action' => 'index'
            ),
            'register' => array(
                'caption' => '<span class="glyphicon glyphicon-new-window"></span> Sign Up',
                'action' => 'index'
            )
        )
    );

    public function getDropdown($menu) {
        echo '<li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">'.$menu[".text"].'<span class="caret"></span></a>
            <ul class="dropdown-menu">';
        unset($menu[".text"]);
        foreach ($menu as $controller => $option) {
            if($controller[0] == '.') echo '<li class="'. $option["class"] .'"><a href = "#">'.$option['caption'].'</a></li>';
            else {
                echo '<li>';
                echo $this->tag->linkTo($controller . '/' . $option['action'], $option['caption']);
                echo '</li>';
            }
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
                    '.text' => "<img class='avatar' width='17px' height='17px' src='".$auth["avatar"]."'></img> ",
                    '.0' => array(
                        'class' => 'disabled',
                        'caption' => "Signed in as <strong>". $auth["name"] ."</strong>"
                    ),
                    '.1' => array(
                        'class' => 'divider',
                        'caption' => ''
                    ),
                    'profile' => array(
                        'caption' => '<span class="glyphicon glyphicon-user"></span> Profile',
                        'action' => 'index'
                    ),
                    'notification' => array(
                        'caption' => '<span class="glyphicon glyphicon-inbox"></span> Notification',
                        'action' => 'index'
                    ),
                    '.2' => array(
                        'class' => 'divider',
                        'caption' => ''
                    ),
                    'session' => array(
                        'caption' => '<span class="glyphicon glyphicon-log-out"></span> Log Out',
                        'action' => 'end'
                    )
                )
            );
        }

        $controllerName = $this->view->getControllerName();
        foreach ($this->_headerMenu as $position => $menu) {
            echo '<ul class="nav navbar-nav ', $position, '">';
            $this->getList($controllerName, $menu);
            echo '</ul>';
        }

    }
}
