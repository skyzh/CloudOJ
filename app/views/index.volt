<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        {{ get_title() }}
        {{ stylesheet_link('//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css') }}
        {{ stylesheet_link('//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap-theme.min.css') }}
        {{ stylesheet_link('css/main.css') }}

        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
        <meta name="description" content="SNGOJ">
        <meta name="author" content="SkyZH">
    </head>

    <body>
        <div id="pjax-container">
        {{ javascript_include('//cdn.bootcss.com/jquery/2.1.4/jquery.min.js') }}
        {{ javascript_include('//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js') }}
        {{ javascript_include('//cdn.bootcss.com/jquery.pjax/1.9.6/jquery.pjax.min.js') }}
        {{ javascript_include('js/utils.js') }}
        {{ content() }}
        </div>
    </body>


</html>
