<?php

namespace Sergiolg\Dawes\core;

use Sergiolg\Dawes\core\Render;

use Symfony\Component\Yaml\Yaml;


class Router {

    static function getRoute() {
        $url = Router::getURL();
        $route = Router::existRoute($url);
        if ($route === "/") {
            $render = new Render();
            $markup = $render->generateMarkup();
            return $markup;
        } else {
            return $route;
        }
        // return $_SERVER;
    }

    static function getURL() {
        return $_SERVER['REQUEST_URI'];
        // return $_SERVER;
    }

    static function getStaticRoutes() {
        $static_routes_file = __DIR__ . "/config/router.yml";
        $yml = Yaml::parseFile($static_routes_file);
        $routes = [];
        foreach ($yml as $key => $value) {
            $routes[] = $value["path"];
        }
        return $routes;
    }

    static function existRoute($url) {
        $routes = Router::getStaticRoutes();
        $static_route_exist = array_search($url, $routes);
        if (is_numeric($static_route_exist)){
            $path = $routes[$static_route_exist];
            return $path;
        } else {
            //Comprobamos si hay rutas dinamicas
            $dynamic_route_exist = false;
            if ($dynamic_route_exist){
                //Devolveriamos la ruta dinamica
                return $dynamic_route;
            } else {
                header("location: /404");
            }
        }    
    }

    static function setDynamicRoute() {
        return $_SERVER['REQUEST_URI'];
        // return $_SERVER;
    }

    static function getDynamicRoute() {
        $fichero_rutas_estaticas = __DIR__ . "/config/router.yml";
        $yml = Yaml::parseFile($fichero_rutas_estaticas);
        return $yml;
    }
    
}