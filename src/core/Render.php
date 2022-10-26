<?php

namespace Sergiolg\Dawes\core;

use Sergiolg\Dawes\controller\Configuration;

class Render {

    function getPage() {
        $config = Configuration::getConfig();
        return $config;
    }
    
    function generateMarkup() {
        return $this->getPage();
    }

}