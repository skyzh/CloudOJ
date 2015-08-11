<?php $notification = Directmessage::getLatestNotice(); ?>

<div class="row">
{% for notice in notification %}
    <div class="col-lg-4 col-md-6 col-sm-12">
        <div class="notice_card">
            <div class="center-block">
                <img class="media-object img-circle center-block" src="{{ notice.sendUser.avatar }}">
            </div>
            <hr/>
            <p><span class="markdown_desc">{{ notice.message | e }}</span></p>
            <br/>
            <p class="text-right">{{ notice.sendUser.username }}
            {% if notice.ruid == 0 %}
                <small>&raquo All
            {% else %}
                <small>&raquo {{ notice.recvUser.username }}
            {% endif %}
                at {{ notice.sendtime }}</small></p>
        </div>
    </div>
{% else %}
    <p class="text-center">No notice is recorded</p>
{% endfor %}
</div>

<style>
.notice_card {
    background-color: #FFF;
    min-height: 25em;
    padding: 3em 2.5em;
    border-radius: 4px;
    border: solid 1px #b0b0b0;
    margin: 1em 1em 1em 1em;
}
</style>
