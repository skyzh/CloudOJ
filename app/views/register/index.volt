
{{ content() }}

<div class="page-header">
    <h2>Sign Up</h2>
    <h5>The whole new Advanture.</h5>
</div>

{{ form('register', 'id': 'registerForm') }}
    <fieldset>
        <div class="control-group">
            <div class="controls">
                <p>{{ form.render('username', ['class': 'form-control']) }}</p>
                <p class="help-block">(Required, 5 ~ 20 characters, only a-z, A-Z, 0-9)</p>
            </div>
        </div>

        <div class="control-group">
            <div class="controls">
                <p>{{ form.render('email', ['class': 'form-control']) }}</p>
                <p class="help-block">(Required, we will use this email to fetch avatar on Gravatar)</p>
            </div>
        </div>

        <div class="control-group">
            <div class="controls">
                <p>{{ form.render('password', ['class': 'form-control']) }}</p>
                <p class="help-block">(5 ~ 20 characters)</p>
            </div>
        </div>

        <div class="control-group">
            <div class="controls">
                <p>{{ form.render('repeatPassword', ['class': 'form-control']) }}</p>
                <p class="help-block">(Type again)</p>
            </div>
        </div>

        <div class="form-actions">
            {{ submit_button('Sign Up', 'class': 'btn btn-primary') }}
        </div>
        <p class="help-block">By signing up, you accept terms of use and privacy policy.</p>
        <p class="help-block">Your password won't be encrypted while transfering to the server, but will be safely encrypted in the database. Take notice!</p>
    </fieldset>
{{ endform() }}
