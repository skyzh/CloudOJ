{{ content() }}

<div class="page-header">
    <h2>Problems</h2>
</div>


{% if isAdmin %}
<div class = "row">
    <div align="right">
        {{ link_to('problemset/new', '<span class="glyphicon glyphicon-pencil"></span> Create', 'class': 'btn btn-default btn-large')}}
    </div>
</div>
{% endif %}

{% for problem in problems %}
    {% if loop.first %}
        <div class = "row" style="line-height: 30px;">
            <div class="col-md-2 col-xs-4"><h6>ID</h6></div>
            <div class="col-md-4 col-xs-8"><h6>Title</h6></div>
            <div class="col-md-3 hidden-sm hidden-xs"><h6>Source</h6></div>
            <div class="col-md-3 hidden-sm hidden-xs"><h6>Submit/Accepted</h6></div>
        </div>
    {% endif %}
        <div class="row">
            <div class="col-md-2 col-xs-4">{{ problem.pid }}</div>
            <div class="col-md-4 col-xs-8">{{ problem.title }}</div>
            <div class="col-md-3 hidden-sm hidden-xs"></div>
            <div class="col-md-3 hidden-sm hidden-xs"></div>
        </div>
{% else %}
    No problems are recorded
{% endfor %}
