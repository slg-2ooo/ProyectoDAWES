<?php

if ($logged) {

$accountButton = <<<EOD
<a href="/login">{$language['Iniciar sesión'][$lang]}</a>
EOD;

} else {

$accountButton = <<<EOD
<a href="/logout">{$language['Cerrar sesión'][$lang]}</a>
EOD;

}