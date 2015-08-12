
{{ content() }}

{{ form('notification/send') }}
    <div class="row">
        <div class="col-md-6" align="left">
            {{ link_to("notification", "class": "btn btn-default", "<span class='glyphicon glyphicon-chevron-left'></span> Notification") }}
        </div>
        <div class="col-md-6" align="right">
            <p>
                <div class="btn-group">
                    {{ link_to("notification/send", "class": "btn btn-default", "<span class='glyphicon glyphicon-repeat'></span> Reset") }}
                    <button type="submit" class="btn btn-primary"><span class='glyphicon glyphicon-send'></span> Send</button>
                </div>
            </p>
        </div>
    </div>

    <div class="page-header">
        <h1>Send</h1>
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
