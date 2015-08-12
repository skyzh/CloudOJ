<style>
.index_section .container {
    min-height: 60rem;
    padding: 6em 0em 4em;
}
section h1 p{
    margin: 0 0 1em;
}
.shadow_text {
    text-shadow: 0 1px 3px rgba(0,0,0,.4),0 0 30px rgba(0,0,0,.075);
}
</style>


<script>
    $("#top_navbar").removeClass("navbar-fixed-top");
    $("#top_navbar_container").removeClass("container-fluid");
    $("#top_navbar_container").addClass("container");
    $("#top_navbar_brand").empty();

</script>
<section class="index_section" style="background-color: #ffffff">
    <div class="container">
        <div class="row">
            <div class="col-xs-12">
                <h1 class="text-center">TOP CODERS</h1>
                <h3 class="text-center">We Love Coding</h3>
            </div>
        </div>
        <hr/>
        {{ partial("partials/rank_top")}}
    </div>
</section>
<section class="index_section" style="color: #FFFFFF; background-color: #3cadd4">
    <div class="container">
        <div class="row">
            <div class="col-xs-12 shadow_text">
                <h1 class="text-center">ACTIVITIES</h1>
                <h3 class="text-center">Something Important</h3>
            </div>
        </div>
        <hr class="hidden-xs"/>
        <div style="color: #000000;">
            {{ partial("partials/notice")}}
        </div>
    </div>
</section>
<section class="index_section">
    <div class="container">
        <div class="row">
            <div class="col-xs-12">
                <h1 class="text-center">SUBMISSIONS</h1>
                <h3 class="text-center">So Many Coders</h3>
            </div>
        </div>
        <hr/>
        <div class="row">
            <div class="col-xs-12">
                <div>
                    {{ partial("partials/stat_home")}}
                </div>
            </div>
        </div>
    </div>
</section>
<section class="index_section" style="color: #FFFFFF; background-color: #383b43">
    <div class="container">
        <div class="row">
            <div class="col-xs-12 shadow_text">
                <h1 class="text-center">JOIN US</h1>
                <h3 class="text-center">Just see kids.org.cn</h3>
            </div>
        </div>
        <div class="row" style="margin: 3em 0 3em">
            <div class="col-xs-12 col-md-10 col-md-offset-1">
                <div class="col-xs-12">
                    <p>
                        {{ link_to('problemset/view/1', 'Get Started &raquo;', 'class': 'btn btn-primary btn-lg btn-block') }}
                    </p>
                </div>
            </div>
        </div>
        {% if !isUser %}
        <div class="row">
            <div class="col-xs-12 col-md-10 col-md-offset-1">
                <div class="col-sm-6">
                    <p>
                        {{ link_to('session/start', '<span class="glyphicon glyphicon-log-in"></span> Log In', 'class': 'btn btn-default btn-lg btn-block') }}
                    </p>
                </div>
                <div class="col-sm-6">
                    <p>
                        {{ link_to('register', '<span class="glyphicon glyphicon-new-window"></span> Sign Up', 'class': 'btn btn-default btn-lg btn-block') }}
                    </p>
                </div>
            </div>
        </div>
        {% endif %}
    </div>
</section>
