{{ content() }}


<div class = "row">
    <div align="right">
        <div class="col-md-6" align="left">
            {{ link_to("problemset/view/" ~ problem.pid, "class": "btn btn-default", "<span class='glyphicon glyphicon-chevron-left'></span> Go Back") }}
        </div>
    </div>
</div>


<div class="page-header">
    <h2>Submit - {{ problem.title }}</h2>
</div>
