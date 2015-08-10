{{ content() }}

<div class="page-header">
    <h2>Rank</h2>
</div>
<div class="row">
    <h3>Top Coders</h3>
</div>
{{ partial("partials/rank_top")}}
<div class="row">
    <h3>Ranklist</h3>
</div>
{% for profile in userprofile.items %}
    {% if loop.first %}
        <div class = "row">
            <div class="col-md-3 col-xs-4"><h6>Username</h6></div>
            <div class="col-md-3 hidden-sm hidden-xs"><h6>Level</h6></div>
            <div class="col-md-3 hidden-sm hidden-xs"><h6>Accepted/Submit</h6></div>
            <div class="col-md-3 col-xs-8"><h6>Score</h6></div>
        </div>
    {% endif %}
        <div class="row">
            <div class="col-md-3 col-xs-4"><p>{{ link_to("profile/view/" ~ profile.user.uid, profile.user.username)}}</p></div>
            <div class="col-md-3 hidden-sm hidden-xs"><p>{{ profile.group.name }}</p></div>
            <div class="col-md-3 hidden-sm hidden-xs"><p>{{ profile.accepted }}/{{ profile.submit }}</p></div>
            <div class="col-md-3 col-xs-8"><p>{{ profile.score }}</p></div>
        </div>
    {% if loop.last %}
    {{ partial("partials/paginator", ["paginator" : userprofile, "targetURL" : "rank/index?page="]) }}
    {% endif %}
{% else %}
    <p>No users are recorded</p>
{% endfor %}
