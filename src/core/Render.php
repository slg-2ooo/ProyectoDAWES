<?php

namespace Sergiolg\Dawes\core;

use Sergiolg\Dawes\controller\Configuration;
use Sergiolg\Dawes\core\Router;

class Render {

    function getPage() {
        $config = Configuration::getConfig();
        //$route = Router::getRoute();
        //$existe_ruta = Router::existRoute();
        //return serialize($config) . "</br></br>" . serialize($route);
        //return serialize($staticRoute);
        //return $route;
        //$existe_ruta = true;

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