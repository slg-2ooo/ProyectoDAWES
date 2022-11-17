<?php

require_once("regions/header.php");
require_once("regions/content.php");
require_once("regions/footer.php");

$regions = <<<EOD
<div id="region-header">
    $header
</div>
<div id="region-content">
    $content
</div>
<div id="region-footer">
    $footer
</div>
EOD;