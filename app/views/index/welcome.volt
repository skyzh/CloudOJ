
<div class = "row">
    <div class = "col-md-10 hidden-xs">
        <p style="font-size: 50px">SNGOJ, The Whole New</p>
        <p style="font-size: 110px"><strong>ADVENTURE</strong></p>
    </div>
    <div class = "col-xs-12 visible-xs">
        <p style="font-size: 30px">The Whole New</p>
        <p style="font-size: 40px"><strong>ADVENTURE</strong></p>
    </div>
    <div class="col-xs-12 col-md-2">
        <p>{{ link_to('problemset/view/1', 'Get Started &raquo;', 'class': 'btn btn-primary btn-lg btn-block') }}</p>
        <p>{{ link_to('session/start', '<span class="glyphicon glyphicon-log-in"></span> Log In', 'class': 'btn btn-default btn-lg btn-block') }}</p>
        <p>{{ link_to('register', '<span class="glyphicon glyphicon-new-window"></span> Sign Up', 'class': 'btn btn-default btn-lg btn-block') }}</p>
    </div>
</div>

<script>
$("#top_navbar").removeClass("navbar-default");
</script>
