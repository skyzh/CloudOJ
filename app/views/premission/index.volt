{{ content() }}

<div class="row">
    <div class="col-md-6" align="left">
        <p>{{ link_to("problemset/view/" ~ problem.pid, "class": "btn btn-default", "<span class='glyphicon glyphicon-chevron-left'></span> " ~ problem.title) }}
        </p>
    </div>
    <div class="col-md-6" align="right">
        <p>{{ link_to('premission/new/' ~ problem.pid, '<span class="glyphicon glyphicon-plus"></span> Create', 'class': 'btn btn-default btn-large')}}</p>
    </div>
</div>
<div class="page-header">
    <h2>View Premission</h2>
</div>

{% for prem in probprem %}
    {{ link_to('premission/edit/' ~ problem.pid ~ '/' ~ prem.ppid, '<span class="glyphicon glyphicon-edit"></span> ' ~ prem.type, 'class': 'btn btn-default btn-large')}}
{% else %}
    <p>No premission is recorded</p>
{% endfor %}
