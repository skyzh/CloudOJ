
{{ content() }}

<div class="row">
        <div class = "col-xs-12">
            <p style="font-size: 5em" class="text-center">SNGOJ</p>
            <p style="font-size: 3em" class="text-center text-muted">The Whole New</p>
            <p style="font-size: 10em" class="text-center"><strong>ADVENTURE</strong></p>
        </div>
</div>
<section>
    <hr/>
    <div class="row" style="margin-bottom: 10px; margin-top: 10px;">
        <div class="col-xs-12">
            <h1 class="text-center"><p>TOP CODERS</p><small><p>We Love Coding</p></small></h1>
        </div>
    </div>
    {{ partial("partials/rank_top", ["ranklist" : toprankers])}}
    <hr/>
    <div class="row" style="margin-bottom: 10px; margin-top: 10px;">
        <div class="col-xs-12">
            <h1 class="text-center"><p>ACTIVITIES</p><small><p>Something Important</p></small></h1>
        </div>
    </div>
    {{ partial("partials/notice", ["notification" : notification])}}
    <hr/>
    <div class="row" style="margin-bottom: 10px; margin-top: 10px;">
        <div class="col-xs-12">
            <h1 class="text-center"><p>SUBMISSIONS</p><small>So Many Coders</small></h1>
        </div>
    </div>
    <div class="row" style="margin-bottom: 10px; margin-top: 10px;">
        <canvas id="statusChart" width="100%" height="400"></canvas>
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

<script>
__json_stat_dat = "{{ statArray | json_encode | escape_js}}";
__json_stat_ac_dat = "{{ statArray_ac | json_encode | escape_js}}";
__json_stat_labels = "{{statArray_labels | json_encode | escape_js}}";
$(document).one("pjax:end", function() {
    var ctx = $("#statusChart").get(0).getContext("2d");
    var data = {
        labels : JSON.parse(__json_stat_labels),
        datasets : [{
                label: "Submissions",
                fillColor : "rgba(91, 192, 222, 0.21)",
                strokeColor : "#5bc0de",
                pointColor : "rgba(91, 192, 222, 0.68)",
                pointStrokeColor : "#fff",
                data : JSON.parse(__json_stat_dat)
            }, {
                label: "Accepted",
                fillColor : "rgba(92, 184, 92, 0.5)",
                strokeColor : "#5cb85c",
                pointColor : "rgba(92, 184, 92, 0.68)",
                pointStrokeColor : "#fff",
                data : JSON.parse(__json_stat_ac_dat)
            }
        ]
    };
    var statChart = new Chart(ctx).Line(data, {
        scaleShowGridLines : true,
        scaleGridLineColor : "rgba(0,0,0,.05)",
        scaleGridLineWidth : 1,
        scaleShowHorizontalLines: true,
        scaleShowVerticalLines: true,
        bezierCurve : true,
        bezierCurveTension : 0.4,
        pointDot : true,
        pointDotRadius : 4,
        pointDotStrokeWidth : 1,
        pointHitDetectionRadius : 20,
        datasetStroke : true,
        datasetStrokeWidth : 2,
        datasetFill : true,
        legendTemplate : _stat_template
    });
});
</script>
