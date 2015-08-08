<div class="row">
{% for notice in notification %}
    <div class="col-xs-12 col-md-8 col-md-offset-2">
        <div class="media" style = "margin-top: 10px; margin-bottom: 10px">
            <div class="media-left">
                    <img class="media-object img-circle" src="{{ notice.sendUser.avatar }}">
            </div>
            <div class="media-body">
                <h4 class="media-heading">{{ notice.sendUser.username }}
                {% if notice.ruid == 0 %}
                    <small>&raquo All
                {% else %}
                    <small>&raquo {{ notice.recvUser.username }}
                {% endif %}
                    at {{ notice.sendtime }}</small></h4>
                <p>{{ notice.message | e }}</p>
            </div>
        </div>
    </div>
{% else %}
    <p class="text-center">No notice is recorded</p>
{% endfor %}
</div>
