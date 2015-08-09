{{ content() }}

<div class="row">
    <div class="col-xs-12" align="right">
        <p>{{ link_to( this.view.getControllerName() ~ '/new/', '<span class="glyphicon glyphicon-plus"></span> Create', 'class': 'btn btn-default btn-large')}}</p>
    </div>
</div>
<div class="page-header">
    <h2>View Group</h2>
</div>

{% for _obj in obj %}
    {{ link_to( this.view.getControllerName() ~ '/edit/' ~ _obj.gid, '<span class="glyphicon glyphicon-edit"></span> ' ~ _obj.name, 'class': 'btn btn-default btn-large')}}
{% else %}
    <p>No group is recorded</p>
{% endfor %}
