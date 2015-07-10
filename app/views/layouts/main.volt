<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container-fluid" style = "z-index:999;">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#oj-nav-collapse-main" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="/oj/">SNGOJ</a>
        </div>
        <div class="collapse navbar-collapse" id="oj-nav-collapse-main">
            {{ elements.getMenu() }}
        </div>
    </div>
</nav>

<div class="container">
    {{ flash.output() }}
    {{ content() }}
    <hr>
    <footer>
        <p>{{ link_to('about', 'SNGOJ') }}, an Online Judge under MIT License.</p>
    </footer>
</div>
