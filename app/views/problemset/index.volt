{{ content() }}

{% if isAdmin %}
<div class = "row">
    <div align="right">
        <div class="col-xs-12">
            <p>{{ link_to('problemset/new', '<span class="glyphicon glyphicon-plus"></span> Create', 'class': 'btn btn-default')}}</p>
        </div>
    </div>
</div>
{% endif %}

<div class="page-header">
    <h2>Problems</h2>
</div>

{% for problem in problems.items %}
    {% if loop.first %}
        <div class = "row">
            <div class="col-md-2 col-xs-4"><h6>ID</h6></div>
            <div class="col-md-4 col-xs-8"><h6>Title</h6></div>
            <div class="col-md-3 hidden-sm hidden-xs"><h6>Type</h6></div>
            <div class="col-md-3 hidden-sm hidden-xs"><h6>Accepted/Submit</h6></div>
        </div>
    {% endif %}
        <div class="row">
            <div class="col-md-2 col-xs-4"><p>{{ problem.pid }}</p></div>
            <div class="col-md-4 col-xs-8"><p>{{ link_to('problemset/view/' ~ problem.pid, problem.title) }}</p></div>
            <div class="col-md-3 hidden-sm hidden-xs"><p>{{ problem.type }}</p></div>
            <div class="col-md-3 hidden-sm hidden-xs"><p>{{ problem.accepted }}/{{ problem.submit }}</p></div>
        </div>
    {% if loop.last %}
    {{ partial("partials/paginator", ["paginator" : problems, "targetURL" : "problemset/index?page="]) }}
    {% endif %}
{% else %}
    <p>No problems are recorded</p>
{% endfor %}
