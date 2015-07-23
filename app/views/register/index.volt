
{{ content() }}

<div class="page-header">
    <h2>Sign Up</h2>
    <h5>The whole new Advanture.</h5>
</div>

{{ form('register', 'id': 'registerForm', 'onbeforesubmit': 'return false') }}
    <fieldset>

        <div class="control-group">
            <div class="controls">
                {{ form.render('username', ['class': 'form-control', 'placeholder': 'Username']) }}
                <p class="help-block">(Required, Minimum 5 characters, only a-z, A-Z, 0-9)</p>
                <div class="alert alert-warning" id="username_alert">
                    <strong>Warning!</strong> Please enter your desired username
                </div>
            </div>
        </div>

        <div class="control-group">
            <div class="controls">
                {{ form.render('email', ['class': 'form-control', 'placeholder': 'Email']) }}
                <p class="help-block">(Required, we will use this email to fetch avatar on Gravatar)</p>
                <div class="alert alert-warning" id="email_alert">
                    <strong>Warning!</strong> Please enter your email
                </div>
            </div>
        </div>

        <div class="control-group">
            <div class="controls">
                {{ form.render('password', ['class': 'form-control', 'placeholder': 'Password']) }}
                <p class="help-block">(Minimum 8 characters)</p>
                <div class="alert alert-warning" id="password_alert">
                    <strong>Warning!</strong> Please provide a valid password
                </div>
            </div>
        </div>

        <div class="control-group">
            <div class="controls">
                {{ form.render('repeatPassword', ['class': 'form-control', 'placeholder': 'Repeat Password']) }}
                <p class="help-block">(Type again)</p>
                <div class="alert alert-warning" id="repeatPassword_alert">
                    <strong>Warning!</strong> The password does not match
                </div>
            </div>
        </div>

        <div class="form-actions">
            {{ submit_button('Sign Up', 'class': 'btn btn-primary', 'onclick': 'return SignUp.validate();') }}
        </div>
        <p class="help-block">By signing up, you accept terms of use and privacy policy.</p>
    </fieldset>
{{ endform() }}
