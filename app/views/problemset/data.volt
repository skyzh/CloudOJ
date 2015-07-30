{{ content() }}


{{ form('problemset/save/' ~ problem.pid, 'id': 'createproblemForm') }}
    <div class="row">
        <div class="col-md-6" align="left">
            <p>{{ link_to("problemset/view/" ~ problem.pid, "class": "btn btn-default", "<span class='glyphicon glyphicon-chevron-left'></span> " ~ problem.title) }}
            </p>
        </div>
        <div class="col-md-6" align="right">
            <p>{{ link_to("problemset/data/" ~ problem.pid , "class": "btn btn-default", "Reset") }}
            {{ submit_button("Save", "class": "btn btn-primary") }}</p>
        </div>
    </div>
    <div class="page-header">
        <h2>Edit Data</h2>
    </div>
{{ endform() }}
