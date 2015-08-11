{{ content() }}


{{ form( this.view.getControllerName() ~ '/edit/' ~ baseObj.pid ~ '/' ~ childObj.pdid, "class": "aceeditor")}}
    {{ partial("partials/CURDChild_top", ["baseObjID" : baseObj.pid, "childObjID" : childObj.pdid]) }}
    <div class="page-header">
    {% if isNew %}
        <h1>Create Data</h1>
    {% else %}
        <h1>Edit Data</h1>
    {% endif %}
    </div>
    <fieldset>
        <div class="row">
            <div class="col-sm-8">
                <p>{{ form.render('dat_name', ['class': 'form-control']) }}</p>
            </div>
            <div class="col-sm-2">
                <p>{{ form.render('isSample', ['class': 'form-control']) }}</p>
            </div>
            <div class="col-sm-2">
                <p>{{ form.render('isFile', ['class': 'form-control']) }}</p>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-6">
                    <p>{{ form.render('dat_in', ['class': 'form-control aceeditor textarea', 'style': 'height: 200px; resize: none;']) }}</p>
            </div>
            <div class="col-sm-6">
                    <p>{{ form.render('dat_out', ['class': 'form-control aceeditor textarea', 'style': 'height: 200px; resize: none;']) }}</p>
            </div>
        </div>
    </fieldset>
{{ endform() }}

{{ partial("partials/aceall") }}
