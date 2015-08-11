{{ content() }}

<div class = "row">
    <div class="col-sm-6">
        {% if isSearch %}
        <p>{{ link_to('status/index', '<span class="glyphicon glyphicon-chevron-left"></span> Status', 'class': 'btn btn-default')}}</p>
        {% endif %}
    </div>
    <div class="col-sm-6" align="right">
        <p>
            <a href="javascript:reload_stat()" class="btn btn-primary"><span class="
glyphicon glyphicon-refresh"></span> Reload</a>
        </p>
    </div>
</div>

<div class="page-header">
    {% if isSearch %}
        <h1>Search Status::{{ searchInfo }}</h1>
    {% else %}
        <h1>Status</h1>
    {% endif %}
</div>

<div class="row">
    {{ form('status/search/', 'method': 'get') }}
    <div class="col-md-5 col-sm-6" style="margin-bottom: 10px;">
        <div class="input-group">
            <input type="text" class="form-control" placeholder="Problem ID" name="pid"/>
            <span class="input-group-btn">
                <button class="btn btn-default" type="submit">
                    <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                </button>
            </span>
        </div>
    </div>
    {{ endform() }}
    {{ form('status/search/', 'method': 'get') }}
    <div class="col-md-2 hidden-sm hidden-xs" style="margin-bottom: 10px;">
        <div class="input-group">
            <input type="text" class="form-control" placeholder="User ID" name="uid"/>
            <span class="input-group-btn">
                <button class="btn btn-default" type="submit">
                    <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                </button>
            </span>
        </div>
    </div>
    {{ endform() }}
    {{ form('status/search/', 'method': 'get') }}
    <div class="col-md-5 col-sm-6" style="margin-bottom: 10px;">
        <div class="input-group">
            <input type="text" class="form-control" placeholder="User" name="uname"/>
            <span class="input-group-btn">
                <button class="btn btn-default" type="submit">
                    <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                </button>
            </span>
        </div>
    </div>
    {{ endform() }}
</div>

{% for st in status.items %}
    {% if loop.first %}
    {{ partial("partials/status_view_top") }}
    {% endif %}


    {{ partial("partials/status_view_body") }}
    {% if loop.last %}
    {{ partial("partials/paginator", ["paginator" : status,
    "targetURL" : "status/search?uid=" ~ (uid | url_encode) ~ "&pid=" ~ (pid | url_encode) ~ "&page="]) }}
    {% endif %}
{% else %}
    No status is recorded
{% endfor %}

<script>
function reload_stat() {
    $.pjax.reload('#pjax-container');
}
</script>
