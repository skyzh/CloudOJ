{{ content() }}

{{ content() }}


{{ form( this.view.getControllerName() ~ '/edit/' ~ baseObj.pid ~ '/' ~ childObj.ppid) }}
    <div class="row">
        <div class="col-md-6" align="left">
            <p>{{ link_to( this.view.getControllerName() ~ '/index/' ~ baseObj.pid, "class": "btn btn-default", "<span class='glyphicon glyphicon-chevron-left'></span> Data") }}
            </p>
        </div>
        <div class="col-md-6" align="right">
            <p>
                {{ link_to( this.view.getControllerName() ~ '/remove/' ~ baseObj.pid ~ '/' ~ childObj.ppid, "class": "btn btn-danger", "<span class='glyphicon glyphicon-trash'></span> Remove")}}
                {{ link_to( this.view.getControllerName() ~ '/edit/' ~ baseObj.pid ~ '/' ~ childObj.ppid, "class": "btn btn-default", "<span class='glyphicon glyphicon-repeat'></span> Reset") }}
                <button type="submit" class="btn btn-primary"><span class='glyphicon glyphicon-ok'></span> Save</button>
            </p>
        </div>
    </div>
    <div class="page-header">
    {% if isNew %}
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
