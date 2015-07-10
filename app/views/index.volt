<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        {{ get_title() }}
        <link href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">
        <link href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap-theme.min.css" rel="stylesheet">
        {{ stylesheet_link('css/main.css') }}

        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="SNGOJ">
        <meta name="author" content="SkyZH">
    </head>
    <body>
        {{ content() }}
        <script src="//cdn.bootcss.com/jquery/2.1.4/jquery.min.js"></script>
        <script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>        {{ javascript_include('js/utils.js') }}
    </body>
</html>
