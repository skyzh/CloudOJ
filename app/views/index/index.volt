
{{ content() }}

<div class="jumbotron">
    <h1>Welcome to SNGOJ</h1>
    <p>This is SNGOJ, which enables you to practise programming online.</p>
    <p>{{ link_to('problemset/view/1', 'Get Started &raquo;', 'class': 'btn btn-primary btn-large') }}
    {% if !isUser %}
    {{ link_to('session/start', 'Log In &raquo;', 'class': 'btn btn-default btn-large') }}
    {{ link_to('register', 'Sign Up &raquo;', 'class': 'btn btn-default btn-large') }}
    {% endif %}</p>

</div>
