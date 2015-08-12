<?php
    date_default_timezone_set("Asia/Shanghai");
    $__now = strtotime("now");
    $time_now = date("Y-m-d H:i:s" ,$__now);
    $time_prev = date("Y-m-d H:i:s" , strtotime("-3 days"));
    $builder = $this->modelsManager->createBuilder()->from("Status")
    ->betweenWhere("Status.submittime", $time_prev, $time_now);
    $query = $builder->getQuery();
    $result = $query->execute();

    $statArray = array(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
    $statArray_ac = array(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
    $statArray_labels = array("", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "");
    foreach ($result as $row) {
        $__time = strtotime($row->submittime);
        $__delta = $__now - $__time;
        $statArray[ceil(18 - $__delta / 43200 * 3)]++;
        if($row->status == 2) $statArray_ac[ceil(18 - $__delta / 43200 * 3)]++;
    }
    for($i = 0; $i <= 18; $i++) {
        $statArray_labels[18 - $i] = strval($i * 4) . " hrs";
    }
?>

<canvas id="statusChart" width="250" height="400"></canvas>

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
                pointStrokeColor: "#fff",
                pointHighlightFill: "#fff",
                pointHighlightStroke: "#5bc0de",
                data : JSON.parse(__json_stat_dat)
            }, {
                label: "Accepted",
                fillColor : "rgba(92, 184, 92, 0.5)",
                strokeColor : "#5cb85c",
                pointColor : "rgba(92, 184, 92, 0.68)",
                pointStrokeColor: "#fff",
                pointHighlightFill: "#fff",
                pointHighlightStroke: "#5cb85c",
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
        datasetFill : true
    });
});
</script>
