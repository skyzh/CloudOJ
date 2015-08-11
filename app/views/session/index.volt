
{{ content() }}

<div class="row">
    <div class="col-md-6">
        <div class="page-header">
            <h1>Log In</h1>
            <h4>Practice and Improve.</h4>
        </div>
        {{ form('session/start', 'role': 'form') }}
            <fieldset>
                <div class="form-group">
                    <div class="controls">
                        {{ text_field('email', 'class': "form-control",
                        "placeholder" : "Username/Email", "required": "") }}
                    </div>
                </div>
                <div class="form-group">
                    <div class="controls">
                        {{ password_field('password', 'class': "form-control",
                        "placeholder" : "Password", "required": "") }}
                    </div>
                </div>
                <div class="form-group">
                    {{ submit_button('Login', 'class': 'btn btn-primary btn-block') }}
                </div>
            </fieldset>
        {{ endform() }}
    </div>

    <div class="col-md-6">

        <div class="page-header">
            <h1>Don't have an account yet?</h1>
        </div>

        <h5>Sign up now!</h5>
        <p>SNGOJ enables you:</p>
        <ul>
            <li>To submit your code</li>
            <li>To see the result online</li>
            <li>And to keep in touch with your friends</li>
        </ul>

        <div class="clearfix">
            {{ link_to('register', 'Sign Up', 'class': 'btn btn-primary btn-block btn-success') }}
        </div>
    </div>
</div>
