
{{ content() }}

{{ form('notification/send', 'id': 'dmsendForm') }}
    <div class="row">
        <div class="col-md-6" align="left">
            {{ link_to("notification", "class": "btn btn-default", "<span class='glyphicon glyphicon-chevron-left'></span> Go Back") }}
        </div>
        <div class="col-md-6" align="right">
            {{ link_to("notification/send", "class": "btn btn-default", "Reset") }}
            {{ submit_button("Send", "class": "btn btn-primary") }}
        </div>
    </div>

    <div class="page-header">
        <h2>Send</h2>
    </div>
    <fieldset>
        <div class="row">
            <div class="col-xs-12">
                <p>{{ form.render('ruser', ['class': 'form-control', 'placeholder': 'Friend']) }}</p>
            </div>
        </div>
        <div class="row">
            <div class="col-xs-12">
                <p>{{ form.render('message', ['class': 'form-control', 'placeholder': 'Message', 'style': 'height: 200px; resize: none;']) }}</p>
            </div>
        </div>
    </fieldset>
{{ endform() }}