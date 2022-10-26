<?php

namespace Sergiolg\Dawes\controller;

use Sergiolg\Dawes\core\Render;

class Connection {

    function __construct($autoload) {
        //$this->$autoload = $autoload;
    }

    function handleRequest($globals) {
        //print_r($globals);
        //print_r($this->$autoload);

        $render = new Render();
        $markup = $render->generateMarkup();

        return $markup;
    }

    function sendResponse($response) {
        print serialize($response);
    }

    function terminate() {
        echo "</br>Conexion terminada";
    }

}