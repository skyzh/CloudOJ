{{ content() }}

{{ content() }}


{{ form( this.view.getControllerName() ~ '/edit/' ~ baseObj.pid ~ '/' ~ childObj.ppid) }}
    {{ partial("partials/CURDChild_top", ["baseObjID" : baseObj.pid, "childObjID" : childObj.ppid]) }}
    <div class="page-header">
    {% if isNew %}
        <h1>Create Permission</h1>
    {% else %}
        <h1>Edit Permission</h1>
    {% endif %}
    </div>
    <fieldset>
        <div class="row">
            <div class="col-xs-12">
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
