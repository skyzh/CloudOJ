{{ content() }}


{{ form( this.view.getControllerName() ~ '/edit/' ~ obj.gid)}}
    <div class="row">
        <div class="col-md-6" align="left">
            <p>{{ link_to( this.view.getControllerName() ~ '/index/', "class": "btn btn-default", "<span class='glyphicon glyphicon-chevron-left'></span> Data") }}
            </p>
        </div>
        <div class="col-md-6" align="right">
            <p>
                {{ link_to( this.view.getControllerName() ~ '/remove/' ~ obj.gid, "class": "btn btn-danger", "<span class='glyphicon glyphicon-trash'></span> Remove")}}
                {{ link_to( this.view.getControllerName() ~ '/edit/' ~ obj.gid, "class": "btn btn-default", "<span class='glyphicon glyphicon-repeat'></span> Reset") }}
                <button type="submit" class="btn btn-primary"><span class='glyphicon glyphicon-ok'></span> Save</button>
            </p>
        </div>
    </div>
    <div class="page-header">
    {% if isNew %}
        <h1>Create Group</h1>
    {% else %}
        <h1>Edit Group</h1>
    {% endif %}
    </div>
    <fieldset>
        <div class="row">
            <div class="col-xs-12">
                <p>{{ form.render('name', ['class': 'form-control']) }}</p>
            </div>
        </div>
        <div class="row">
            <div class="col-xs-12">
                <p>{{ form.render('scorerequired', ['class': 'form-control']) }}</p>
            </div>
        </div>
    </fieldset>
{{ endform() }}
