{{ content() }}

<div class="row">
    <div class="col-md-6" align="left">
        <p>{{ link_to("problemset/view/" ~ problem.pid, "class": "btn btn-default", "<span class='glyphicon glyphicon-chevron-left'></span> " ~ problem.title) }}
        </p>
    </div>
    <div class="col-md-6" align="right">
        <p>{{ link_to('data/new/' ~ problem.pid, '<span class="glyphicon glyphicon-plus"></span> Create', 'class': 'btn btn-default btn-large')}}</p>
    </div>
</div>
<div class="page-header">
    <h2>View Data</h2>
</div>

{% for data in probdata %}
    {{ link_to('data/edit/' ~ problem.pid ~ '/' ~ data.pdid, '<span class="glyphicon glyphicon-edit"></span> ' ~ data.dat_name, 'class': 'btn btn-default btn-large')}}

{% else %}
    <p>No data is recorded</p>
{% endfor %}
