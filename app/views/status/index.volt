{{ content() }}

<div class = "row">
    <div class="col-xs-12" align="right">
        <p>
            <a href="javascript:reload_stat()" class="btn btn-primary"><span class="
glyphicon glyphicon-refresh"></span> Reload</a>
        </p>
    </div>
</div>

<div class="page-header">
    <h1>Status</h1>
</div>

{% for st in status.items %}
    {% if loop.first %}
    {{ partial("partials/status_view_top") }}
    {% endif %}


    {{ partial("partials/status_view_body") }}
    {% if loop.last %}
    {{ partial("partials/paginator", ["paginator" : status, "targetURL" : "status/index?page="]) }}
    {% endif %}
{% else %}
    No status is recorded
{% endfor %}

<script>
function reload_stat() {
    $.pjax.reload('#pjax-container');
}
</script>
