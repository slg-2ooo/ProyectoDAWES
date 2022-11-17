<?php

namespace Sergiolg\Dawes\controller;

class Configuration {


    static function getConfig() {
        include __DIR__ . "/../config.php";
        return $config;
    }

    static function setValue($property, $value) {
        $config = $this->getConfig();
        $config[$property] = $value;
    }

}