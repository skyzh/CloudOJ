{{ content() }}

<script>
    $("#top_navbar").removeClass("navbar-fixed-top");
</script>

<div class="row">
        <div class = "col-xs-12">
            <p style="font-size: 5em" class="hidden-xs">SNGOJ</p>
            <h1> = ADVENTURE</p>
        </div>
</div>
<section>
    <hr/>
    <div class="row" style="margin-bottom: 10px; margin-top: 10px;">
        <div class="col-xs-12">
            <h1 class="text-center"><p>TOP CODERS</p><small><p>We Love Coding</p></small></h1>
        </div>
    </div>
    {{ partial("partials/rank_top")}}
    <hr/>
    <div class="row" style="margin-bottom: 10px; margin-top: 10px;">
        <div class="col-xs-12">
            <h1 class="text-center"><p>ACTIVITIES</p><small><p>Something Important</p></small></h1>
        </div>
    </div>
    {{ partial("partials/notice")}}
    <hr/>
    <div class="row" style="margin-bottom: 10px; margin-top: 10px;">
        <div class="col-xs-12">
            <h1 class="text-center"><p>SUBMISSIONS</p><small>So Many Coders</small></h1>
        </div>
    </div>
    <div class="row" style="margin-bottom: 10px; margin-top: 10px;">
        {{ partial("partials/stat_home")}}
    </div>
    <hr/>
    <div class="row" style="margin-bottom: 10px; margin-top: 10px;">
        <div class="col-xs-12">
            <h1 class="text-center"><p>JOIN US</p><small><p>Just see <a href="http://kids.org.cn">kids.org.cn</a></p></small></h1>
        </div>
    </div>
    <div class="row">
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
</section>
