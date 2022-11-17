<?php

require_once(__DIR__ . "/../users/accountButton.php");

$header = <<<EOD
<header id="header">
    <nav>
        <ul>
            <li>
                <a href="/inicio">{$language['Inicio'][$lang]}</a>
            </li>
            <li>
                <a href="/inicio">{$language['Inicio'][$lang]}</a>
            </li>
            <li>
                $accountButton
            </li>
        </ul>
    </nav>
</header>
EOD;