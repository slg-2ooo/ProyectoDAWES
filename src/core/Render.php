<?php

namespace Sergiolg\Dawes\core;

use Sergiolg\Dawes\controller\Configuration;
use Sergiolg\Dawes\core\Router;

class Render {

    function getPage() {
        $config = Configuration::getConfig();
        $route = Router::getRoute();
        //return serialize($config) . "</br></br>" . serialize($route);
        $lang = "es";
        $logged  = true;
        require_once($config["lang_file"]);
        require_once($config["theme"] . "templates/page.php");
        return $page;
    }
    
    function generateMarkup() {
        return $this->getPage();
    }

}