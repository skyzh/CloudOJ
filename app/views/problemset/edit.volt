{{ content() }}


{{ form('problemset/save/' ~ problem.pid, 'id': 'createproblemForm') }}
    <div class="row">
        <div class="col-md-6" align="left">
            <p>{% if problem.pid == 0 %}
            {{ link_to("problemset/index", "class": "btn btn-default", "<span class='glyphicon glyphicon-chevron-left'></span> Problems") }}
            {% else %}
            {{ link_to("problemset/view/" ~ problem.pid, "class": "btn btn-default", "<span class='glyphicon glyphicon-chevron-left'></span> " ~ problem.title) }}
            {% endif %}</p>
        </div>
        <div class="col-md-6" align="right">
            <p>{{ link_to("problemset/edit/" ~ problem.pid , "class": "btn btn-default", "Reset") }}
            {{ submit_button("Save", "class": "btn btn-primary") }}</p>
        </div>
    </div>
    <div class="page-header">
        <h2>{% if problem.pid == 0 %}
            Create Problem
        {% else %}
            Edit Problem
        {% endif %}</h2>
    </div>
    <fieldset>
        <div class="row">
            <div class="col-xs-12">
                <p>{{ form.render('title', ['class': 'form-control', 'placeholder': 'Title']) }}</p>
            </div>
        </div>

        <div class="row">
            <div class="col-sm-4">
                <p>{{ form.render('memlimit', ['class': 'form-control', 'placeholder': 'Memory Limit']) }}</p>
            </div>
            <div class="col-sm-4">
                <p>{{ form.render('timelimit', ['class': 'form-control', 'placeholder': 'Time Limit']) }}</p>
            </div>
            <div class="col-sm-4">
                <p>{{ form.render('type', ['class': 'form-control', 'placeholder': 'Type']) }}</p>
            </div>
        </div>

        <div class="row">
            <div class="col-xs-12">
                    <p>{{ form.render('description', ['class': 'form-control markdownarea', 'placeholder': 'Description', 'style': 'height: 200px; resize: none;']) }}</p>
            </div>
        </div>

        <div class="row">
            <div class="col-xs-12">
                    <p>{{ form.render('input', ['class': 'form-control markdownarea', 'placeholder': 'Input', 'style': 'height: 200px; resize: none;']) }}</p>
            </div>
        </div>

        <div class="row">
            <div class="col-xs-12">
                    <p>{{ form.render('output', ['class': 'form-control markdownarea', 'placeholder': 'Output', 'style': 'height: 200px; resize: none;']) }}</p>
            </div>
        </div>

        <div class="row">
            <div class="col-sm-6">
                    <p>{{ form.render('sampleinput', ['class': 'form-control', 'placeholder': 'Sample Input', 'style': 'height: 200px; resize: none;']) }}</p>
            </div>
            <div class="col-sm-6">
                    <p>{{ form.render('sampleoutput', ['class': 'form-control', 'placeholder': 'Sample Output', 'style': 'height: 200px; resize: none;']) }}</p>
            </div>
        </div>

        <div class="row">
            <div class="col-xs-12">
                    <p>{{ form.render('hint', ['class': 'form-control markdownarea', 'placeholder': 'Hint', 'style': 'height: 200px; resize: none;']) }}</p>
            </div>
        </div>
    </fieldset>
{{ endform() }}
