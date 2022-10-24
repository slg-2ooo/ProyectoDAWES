<?php

namespace Sergiolg\Dawes\controller;

class Connection {

    private Composer\Autoload\ClassLoader $autoload;

    function __construct($autoload) {
        $this->$autoload = $autoload;
    }

    function handleRequest($globals) {
        print_r($globals);
        //print_r($this->$autoload);
        return "Respuesta";
    }

    function sendResponse($response) {
        print_r($response);
    }

    function terminate() {
        echo "Conexion terminada";
    }

}