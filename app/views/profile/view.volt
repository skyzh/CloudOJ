<div class="page-header">
    <h2>Profile</h2>
</div>
<div class="row">
    <div class="col-sm-4">
        <img class='avatar' width='100%' src='{{ user.avatar }}'></img>
        <h3>{{user.username}}</h3>
        <h5>{{user.email}}</h5>
        <p>
        {% if user.groupid == 1 %}
            Administer
        {% elseif user.groupid == 2 %}
            User
        {% endif %}
        </p>
    </div>
    <div class="col-sm-8">
        <p>The {{user.uid}}# user of SNGOJ,</p>
        <p>joined at {{user.userprofile.registertime}},</p>
        <p>last active at {{user.userprofile.lastactive}}.</p>
    </div>
</div>
