{{ content() }}

{% if isAdmin %}
<div class = "row">
    <div align="right">
        <div class="col-xs-12">
            {{ link_to('problem/edit/' ~ problem.pid, '<span class="glyphicon glyphicon-pencil"></span> Create', 'class': 'btn btn-default btn-large')}}
        </div>
    </div>
</div>
{% endif %}

<div class="page-header">
    <h2>Problem</h2>
</div>
