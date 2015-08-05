<?php

error_reporting(E_ALL);

use Phalcon\Mvc\Application;
use Phalcon\Config\Adapter\Ini as ConfigIni;

try {

    define('APP_PATH', realpath('..') . '/');
    $config = new ConfigIni(APP_PATH . 'app/config/config.ini');

    require APP_PATH . 'app/config/loader.php';
    require APP_PATH . 'app/config/services.php';

    $application = new Application($di);

    echo $application->handle()->getContent();

} catch (Exception $e){
    echo $e->getMessage();
}
