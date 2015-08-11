{{ content() }}

<div class="row">
    <div class="col-md-6" align="left">
        <p>
            {{ link_to("problemset/view/" ~ baseObj.pid, "class": "btn btn-default", "<span class='glyphicon glyphicon-chevron-left'></span> " ~ baseObj.title) }}
        </p>
    </div>
    <div class="col-md-6" align="right">
        <p>
            {{ link_to( this.view.getControllerName() ~ '/new/' ~ baseObj.pid, '<span class="glyphicon glyphicon-plus"></span> Create', 'class': 'btn btn-default btn-large')}}
        </p>
    </div>
</div>
<div class="page-header">
    <h1>View Data</h1>
</div>

{% for obj in childObj %}
    {{ link_to( this.view.getControllerName() ~ '/edit/' ~ baseID ~ '/' ~ obj.pdid, '<span class="glyphicon glyphicon-edit"></span> ' ~ obj.dat_name, 'class': 'btn btn-default btn-large')}}

{% else %}
    <p>No data is recorded</p>
{% endfor %}
