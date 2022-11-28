<?php

namespace Sergiolg\Dawes\controller;

use Sergiolg\Dawes\core\Router;

class Connection {

    function __construct($autoload) {
        //$this->$autoload = $autoload;
    }

    function handleRequest($globals) {
        //print_r($globals);
        //print_r($this->$autoload);

        $router = new Router();
        $route = $router->getRoute();

        return $route;
    }

    function sendResponse($response) {
        print $response;
    }

    function terminate() {
        echo "</br>Conexion terminada";
    }

}