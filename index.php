<?php

error_reporting(E_ALL | E_STRICT);
ini_set('display_errors', TRUE);


use Sergiolg\Dawes\controller\Connection;

$autoloader = require_once 'autoload.php';

//echo "<pre>";
//print_r($autoloader);

$connection = new Connection($autoloader);

$response = $connection->handleRequest($GLOBALS);
$connection->sendResponse($response);

$connection->terminate();
