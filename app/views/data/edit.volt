{{ content() }}


{{ form('data/save/' ~ problem.pid ~ '/' ~ probdata.pdid) }}
    <div class="row">
        <div class="col-md-6" align="left">
            <p>{{ link_to('data/index/' ~ problem.pid, "class": "btn btn-default", "<span class='glyphicon glyphicon-chevron-left'></span> Data") }}
            </p>
        </div>
        <div class="col-md-6" align="right">
            <p>{{ link_to('data/edit/' ~ problem.pid ~ '/' ~ probdata.pdid, "class": "btn btn-default", "Reset") }}
            {{ submit_button("Save", "class": "btn btn-primary") }}</p>
        </div>
    </div>
    <div class="page-header">
    {% if probdata.pdid == 0 %}
        <h2>Create Data</h2>
    {% else %}
        <h2>Edit Data</h2>
    {% endif %}
    </div>
    <fieldset>
        <div class="row">
            <div class="col-sm-8">
                <p>{{ form.render('dat_name', ['class': 'form-control']) }}</p>
            </div>
            <div class="col-sm-4">
                <p>{{ form.render('isSample', ['class': 'form-control']) }}</p>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-6">
                    <p>{{ form.render('dat_in', ['class': 'form-control', 'style': 'height: 200px; resize: none;']) }}</p>
            </div>
            <div class="col-sm-6">
                    <p>{{ form.render('dat_out', ['class': 'form-control', 'style': 'height: 200px; resize: none;']) }}</p>
            </div>
        </div>
    </fieldset>
{{ endform() }}
