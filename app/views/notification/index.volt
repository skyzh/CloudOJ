
{{ content() }}

<div class = "row">
    <div align="right">
        <div class="col-xs-12">
            {% if isAdmin %}
            {{ link_to('notification/sendall', '<span class="glyphicon glyphicon-send"></span> Publish Notice', 'class': 'btn btn-primary btn-large')}}
            {% endif %}
            {{ link_to('notification/send', '<span class="glyphicon glyphicon-send"></span> Send Message', 'class': 'btn btn-primary btn-large')}}
        </div>
    </div>
</div>

<div class="page-header">
    <h2>Notification</h2>
</div>


{% for dm in dms.items %}
        <div class="row">
            <div class="media">
                <div class="media-left">
                        <img class="media-object img-circle" src="{{ dm.sendUser.avatar }}">
                </div>
                <div class="media-body">

                    <h4 class="media-heading">
                        {{ dm.sendUser.username }}
                    {% if dm.ruid == 0 %}
                        <small>&raquo All
                    {% else %}
                        <small>&raquo {{ dm.recvUser.username }}
                    {% endif %}
                        at {{ dm.sendtime }}</small></h4>
                    <p>{{ dm.message | e }}</p>
                    <p>
                        {{ link_to('notification/send/?ruser=' ~ dm.sendUser.username, '<span class="glyphicon glyphicon-share-alt"></span> Reply', 'class': 'btn btn-default btn-sm')}}
                        {% if dm.ruid != 0 %}{{ link_to('notification/remove/' ~ dm.dmid, '<span class="glyphicon glyphicon-trash"></span> Remove', 'class': 'btn btn-danger btn-sm')}}{% endif %}
                    </p>
                </div>
            </div>
        </div>
    {% if loop.last %}
    {{ partial("partials/paginator", ["paginator" : dms, "targetURL" : "notification/index?page="]) }}
    {% endif %}
{% else %}
    No notification is recorded
{% endfor %}
