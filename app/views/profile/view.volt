{% if isAdmin %}
<div class="row">
    <div class="col-xs-12" align="right">
        <p>
            <div class="btn-group">
                {{ link_to('profile/group/' ~ user.uid ~ '/1', '<span class="glyphicon glyphicon-edit"></span> Mark as Admin', 'class': 'btn btn-default')}}
                {{ link_to('profile/group/' ~ user.uid ~ '/2', '<span class="glyphicon glyphicon-edit"></span> Mark as Usern', 'class': 'btn btn-default')}}
            </div>
        </p>
    </div>
</div>
{% endif %}
<div class="page-header">
    <h2>Profile</h2>
</div>
<div class="row">
    <div class="col-sm-4">
        <img class='img-responsive img-circle center-block' style="width: 100%" src='{{ user.avatar }}'></img>
        <h3>{{user.username}}</h3>
        <h5>{{user.email}}</h5>
        <p>
        {% if user.groupid == 1 %}
            Administrator
        {% elseif user.groupid == 2 %}
            User
        {% endif %}
        </p>
    </div>
    <div class="col-sm-8">
        <p>The <strong>{{user.uid}}#</strong> user of SNGOJ,</p>
        <p><strong>Joined</strong> at {{user.userprofile.registertime}},</p>
        <p><strong>Last active</strong> at {{user.userprofile.lastactive}}.</p>
        <p><strong>Submission</strong> {{user.userprofile.submit}} times</p>
        <p><strong>Accepted</strong> {{user.userprofile.accepted}} times</p>
        <p><strong>Level</strong> {{ usergroup.name }},
            {{ nusergroup.scorerequired - user.userprofile.score}} Points to {{ nusergroup.name }} </p>
        <div class="progress">
            <div class="progress-bar progress-bar-success" style="width: {{ user.userprofile.score / nusergroup.scorerequired * 100 }}%; min-width: 5%; overflow: visible; white-space: nowrap;">
                {{ user.userprofile.score }} / {{ nusergroup.scorerequired }}
            </div>
        </div>
    </div>
</div>
