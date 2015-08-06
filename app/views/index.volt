<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        {{ get_title() }}
        {{ stylesheet_link('//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css') }}
        {{ stylesheet_link('//cdn.bootcss.com/highlight.js/8.6/styles/github.min.css') }}
        {{ stylesheet_link('css/main.css') }}

        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
        <meta name="description" content="SNGOJ">
        <meta name="author" content="SkyZH, CloudOJ">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="renderer" content="webkit">
        <meta name="keywords" content="SNGOJ, OI, NOI, NOIP, OJ, Online Judge" />
    </head>

    <body>
        {{ javascript_include('//cdn.bootcss.com/jquery/2.1.4/jquery.min.js') }}
        {{ javascript_include('//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js') }}
        {{ javascript_include('//cdn.bootcss.com/jquery.pjax/1.9.6/jquery.pjax.min.js') }}
        {{ javascript_include('//cdn.bootcss.com/twemoji/1.4.1/twemoji.min.js') }}
        {{ javascript_include('//cdn.bootcss.com/markdown.js/0.5.0/markdown.min.js') }}
        <script type="text/x-mathjax-config">
            MathJax.Hub.Config({
                tex2jax: {
                    inlineMath: [ ['$','$'], ["\\(","\\)"] ],
                    processEscapes: true
                }
            });
        </script>
        {{ javascript_include('//cdn.bootcss.com/mathjax/2.5.3/MathJax.js?config=TeX-AMS_HTML') }}
        {{ javascript_include('//cdn.bootcss.com/ace/1.2.0/ace.js') }}
        {{ javascript_include('//cdn.bootcss.com/highlight.js/8.6/highlight.min.js') }}
        {{ javascript_include('js/utils.js') }}

        <div id="pjax-container">
            {{ content() }}
        </div>
    </body>


</html>
