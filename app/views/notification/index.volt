
{{ content() }}

<div class = "row">
    <div align="right">
        <div class="col-xs-12">
            {{ link_to('notification/send', '<span class="glyphicon glyphicon-send"></span> Send Direct Message', 'class': 'btn btn-primary btn-large')}}
        </div>
    </div>
</div>

<div class="page-header">
    <h2>Notification</h2>
</div>


{% for dm in dms.items %}
    {% if loop.first %}
        <div class = "row">
            <div class="col-md-2 col-xs-3">User</div>
            <div class="col-md-6 col-xs-7">Message</div>
            <div class="col-md-2 hidden-sm hidden-xs">Time</div>
            <div class="col-md-2 col-xs-2"></div>
        </div>
    {% endif %}
        <div class="row-margin"></div>
        <div class="row">
            <div class="col-md-2 col-xs-3">{{ dm.__susername }}  &raquo {{ dm.__rusername }}</div>
            <div class="col-md-6 col-xs-7"><p><span class="dmmessage">{{ dm.message|e }}</span></p></div>
            <div class="col-md-2 hidden-sm hidden-xs">{{ dm.sendtime }}</div>
            <div class="col-md-2 col-xs-2">{{ link_to('notification/send', '<span class="glyphicon glyphicon-share-alt"></span> Reply', 'class': 'btn btn-default btn-sm')}}</div>
        </div>
    {% if loop.last %}
        <div class = "row">
            <div class="col-xs-12" align="middle">
                <nav>
                    <ul class="pagination">
                        {% if dms.current == dms.before %}
                        <li class="disabled">
                            {{ link_to("notification/index?page=" ~ dms.before,"<span>&laquo;</span>")}}
                        {% else %}
                        <li>
                            {{ link_to("notification/index?page=" ~ dms.before,"<span>&laquo;</span>")}}
                        {% endif %}
                        </li>
                        <?php
                        $__start_page =  $dms->current - 2;
                        $__end_page = $dms->current + 2;
                        list($__start_page, $__end_page) = getPage($__start_page, $__end_page, $dms->total_pages);

                        for($__p = $__start_page; $__p <= $__end_page; $__p++) { ?>
                        <li>
                            {{ link_to("notification/index?page=" ~ __p, "<span>"~ __p ~"</span>")}}
                        </li>
                        <?php } ?>
                        {% if dms.current == dms.next %}
                        <li class="disabled">
                            {{ link_to("notification/index?page=" ~ dms.next,"<span>&raquo;</span>")}}
                        {% else %}
                        <li>
                            {{ link_to("notification/index?page=" ~ dms.next,"<span>&raquo;</span>")}}
                        {% endif %}
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
    {% endif %}
{% else %}
    No notification is recorded
{% endfor %}
