<nav id="top_navbar" class="navbar navbar-default navbar-fixed-top">
    <div id = "nav_container" class="container-fluid" style = "z-index:999;">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#oj-nav-collapse-main" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="{{ url('index/index') }}">SNGOJ</a>
        </div>
        <div class="collapse navbar-collapse" id="oj-nav-collapse-main">
            {{ elements.getMenu() }}
        </div>
    </div>
</nav>
<div id="pjax-loading" style="position: fixed; top: 0px; width: 100%; z-index:1200;">
    <div class="progress" style="height:10px">
        <div class="progress-bar progress-bar-primary progress-bar-striped active" role="progressbar" style="width: 100%;">
        </div>
    </div>
</div>

<div class="container">
    <div id="flashcontainer">
        {{ flash.output() }}
    </div>
    <br/>
    {{ content() }}
    <hr>
    <footer>
        <ul class="list-inline">
            <li><small>Powered by CloudOJ, an Online Judge under Apache License.</small></li>
            <li><small>{{ link_to('about', 'About') }}</small></li>
            <li><small><a href="mailto:iSkyZH@163.com">Feedback</a></small></li>
        </ul>
    </footer>
</div>

<head>
    {{ get_title() }}
</head>
