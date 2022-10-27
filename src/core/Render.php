<?php

namespace Sergiolg\Dawes\core;

use Sergiolg\Dawes\controller\Configuration;
use Sergiolg\Dawes\core\Router;

class Render {

    function getPage() {
        $config = Configuration::getConfig();
        $route = Router::getRoute();
        return serialize($config) . "</br></br>" . serialize($route);
    }
    
    function generateMarkup() {
        return $this->getPage();
    }

}