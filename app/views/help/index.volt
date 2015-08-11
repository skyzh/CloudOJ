<div class="page-header">
    <h1>Help</h1>
</div>

<?php
    $__path = APP_PATH . "app/views/help/help.md";
    $helpFile = fopen($__path, "r") or die("Unable to open file!");
    $fileContent =  fread($helpFile,filesize($__path));
    fclose($helpFile);
?>

<div><span class="markdown_desc">{{ fileContent | e}}</span></div>
