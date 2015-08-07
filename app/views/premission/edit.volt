{{ content() }}


{{ form('premission/save/' ~ problem.pid ~ '/' ~ probprem.ppid)}}
    <div class="row">
        <div class="col-md-6" align="left">
            <p>{{ link_to('premission/index/' ~ problem.pid, "class": "btn btn-default", "<span class='glyphicon glyphicon-chevron-left'></span> Data") }}
            </p>
        </div>
        <div class="col-md-6" align="right">
            <p>
                {{ link_to('premission/remove/' ~ problem.pid ~ '/' ~ probprem.ppid, '<span class="glyphicon glyphicon-trash"></span> Remove', 'class': 'btn btn-danger btn-large')}}
                {{ link_to('premission/edit/' ~ problem.pid ~ '/' ~ probprem.ppid, "class": "btn btn-default", "Reset") }}
                {{ submit_button("Save", "class": "btn btn-primary") }}
            </p>
        </div>
    </div>
    <div class="page-header">
    {% if probprem.ppid == 0 %}
        <h2>Create Premission</h2>
    {% else %}
        <h2>Edit Premission</h2>
    {% endif %}
    </div>
    <fieldset>
        <div class="row">
            <div class="col-sm-12">
                <p>{{ form.render('type', ['class': 'form-control']) }}</p>
            </div>
        </div>
        <div class="row">
            <div class="col-xs-12">
                    <p>{{ form.render('data', ['class': 'form-control']) }}</p>
            </div>
        </div>
    </fieldset>
{{ endform() }}

{{ partial("partials/aceall") }}
