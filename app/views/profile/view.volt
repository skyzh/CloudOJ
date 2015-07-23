<div class="page-header">
    <h2>Profile</h2>
</div>
<div class="row">
    <div class="col-sm-2">
        <img class='avatar' width='100%' src='{{ user.avatar }}'></img>
    </div>
    <div class="col-sm-10">
        <h3>{{user.username}}</h3>
        <h4>{{user.email}}</h4>
        <h5>
        {% if user.groupid == 1 %}
            Administer
        {% elseif user.groupid == 1 %}
            User
        {% endif %}
        </h5>
        <p>The {{user.uid}}# user of SNGOJ, joined at {{user.registertime}}.</p>
    </div>
</div>
