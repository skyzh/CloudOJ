{{ content() }}


{{ form('problemset/save/' ~ problem.pid, 'id': 'createproblemForm') }}
    <div class="row">
        <div class="col-md-6" align="left">
            {{ link_to("problemset/view/" ~ problem.pid, "class": "btn btn-default", "<span class='glyphicon glyphicon-chevron-left'></span> Go Back") }}
        </div>
        <div class="col-md-6" align="right">
            {{ link_to("problemset/edit/" ~ problem.pid , "class": "btn btn-default", "Reset") }}
            {{ submit_button("Save", "class": "btn btn-primary") }}
        </div>
    </div>
    <div class="page-header">
        <h2>Edit Problem</h2>
    </div>
    <fieldset>
        {{ form.render('pid') }}
        {{ form.render('submit') }}
        {{ form.render('accepted') }}

        <div class="row">
            <div class="col-xs-12">
                {{ form.render('title', ['class': 'form-control', 'placeholder': 'Title']) }}
            </div>
        </div>
        <div class="row-margin"></div>
        <div class="row">
            <div class="col-sm-4">
                {{ form.render('memlimit', ['class': 'form-control', 'placeholder': 'Memory Limit']) }}
            </div>
            <div class="col-sm-4">
                {{ form.render('timelimit', ['class': 'form-control', 'placeholder': 'Time Limit']) }}
            </div>
            <div class="col-sm-4">
                {{ form.render('type', ['class': 'form-control', 'placeholder': 'Type']) }}
            </div>
        </div>
        <div class="row-margin"></div>
        <div class="row">
            <div class="col-xs-12">
                    {{ form.render('description', ['class': 'form-control', 'placeholder': 'Description', 'style': 'height: 200px; resize: none;']) }}
            </div>
        </div>
        <div class="row-margin"></div>
        <div class="row">
            <div class="col-xs-12">
                    {{ form.render('input', ['class': 'form-control', 'placeholder': 'Input', 'style': 'height: 200px; resize: none;']) }}
            </div>
        </div>
        <div class="row-margin"></div>
        <div class="row">
            <div class="col-xs-12">
                    {{ form.render('output', ['class': 'form-control', 'placeholder': 'Output', 'style': 'height: 200px; resize: none;']) }}
            </div>
        </div>
        <div class="row-margin"></div>
        <div class="row">
            <div class="col-sm-6">
                    {{ form.render('sampleinput', ['class': 'form-control', 'placeholder': 'Sample Input', 'style': 'height: 200px; resize: none;']) }}
            </div>
            <div class="col-sm-6">
                    {{ form.render('sampleoutput', ['class': 'form-control', 'placeholder': 'Sample Output', 'style': 'height: 200px; resize: none;']) }}
            </div>
        </div>
        <div class="row-margin"></div>
        <div class="row">
            <div class="col-xs-12">
                    {{ form.render('hint', ['class': 'form-control', 'placeholder': 'Hint', 'style': 'height: 200px; resize: none;']) }}
            </div>
        </div>
    </fieldset>
{{ endform() }}
