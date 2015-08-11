<nav id="top_navbar" class="navbar navbar-default navbar-fixed-top">
    <div id = "top_navbar_container" class="container-fluid" style = "z-index:999;">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#oj-nav-collapse-main" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a id = "top_navbar_brand" class="navbar-brand" href="{{ url('index/index') }}">SNGOJ</a>
        </div>
        <div class="collapse navbar-collapse" id="oj-nav-collapse-main">
            {{ elements.getMenu() }}
        </div>
    </div>
</nav>
