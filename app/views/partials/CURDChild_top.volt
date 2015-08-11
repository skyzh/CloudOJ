<div class="row">
    <div class="col-md-6" align="left">
        <p>{{ link_to( this.view.getControllerName() ~ '/index/' ~ baseObjID, "class": "btn btn-default", "<span class='glyphicon glyphicon-chevron-left'></span> Data") }}
        </p>
    </div>
    <div class="col-md-6" align="right">
        <p>
            <div class="btn-group">
                {% if not(isNew) %}
                    {{ link_to( this.view.getControllerName() ~ '/remove/' ~ baseObjID ~ '/' ~ childObjID, "class": "btn btn-danger", "<span class='glyphicon glyphicon-trash'></span> Remove")}}
                {% endif %}
                {{ link_to( this.view.getControllerName() ~ '/edit/' ~ baseObjID ~ '/' ~ childObjID, "class": "btn btn-default", "<span class='glyphicon glyphicon-repeat'></span> Reset") }}
                <button type="submit" class="btn btn-primary"><span class='glyphicon glyphicon-ok'></span> Save</button>
            </div>
        </p>
    </div>
</div>
