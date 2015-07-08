<?
use Phalcon\Mvc\Router;

$di->set('router', function(){
    $router = new Router();

    $router->add("/admin/:controller/:action/:params", array(
        'controller' => 'admin',
        'controller' => 1,
        'action'     => 2,
        'params'     => 3
    ));

    $router->add("/:controller/:action/:params", array(
        'controller' => 1,
        'action'     => 2,
        'params'     => 3
    ));

    return $router;
});
