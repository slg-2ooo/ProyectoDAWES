<?php

if ($logged) {

$accountButton = <<<EOD
<a href="/login">{$language['Iniciar sesión']}</a>
EOD;

} else {

$accountButton = <<<EOD
<a href="/logout">{$language['Cerrar sesión']}</a>
EOD;

}