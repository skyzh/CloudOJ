{{ content() }}

<div class="page-header">
    <h2>Rank</h2>
</div>

{% for profile in userprofile.items %}
    {% if loop.first %}
        <div class = "row">
            <div class="col-md-2 col-xs-4"><h6>Username</h6></div>
            <div class="col-md-3 hidden-sm hidden-xs"><h6>Level</h6></div>
            <div class="col-md-3 hidden-sm hidden-xs"><h6>Accepted/Submit</h6></div>
            <div class="col-md-4 col-xs-8"><h6>Score</h6></div>
        </div>
    {% endif %}
        <div class="row">
            <div class="col-md-2 col-xs-4"><p>{{ link_to("profile/view/" ~ profile.user.uid, profile.user.username)}}</p></div>
            <div class="col-md-3 hidden-sm hidden-xs"><p>{{ profile.group.name }}</p></div>
            <div class="col-md-3 hidden-sm hidden-xs"><p>{{ profile.accepted }}/{{ profile.submit }}</p></div>
            <div class="col-md-4 col-xs-8"><p>{{ profile.score }}</p></div>
        </div>
    {% if loop.last %}
        <div class = "row">
            <div class="col-xs-12" align="middle">
                <nav>
                    <ul class="pagination">
                        {% if userprofile.current == userprofile.before %}
                        <li class="disabled">
                            {{ link_to("rank/index?page=" ~ userprofile.before,"<span>&laquo;</span>")}}
                        {% else %}
                        <li>
                            {{ link_to("rank/index?page=" ~ userprofile.before,"<span>&laquo;</span>")}}
                        {% endif %}
                        </li>
                        <?php
                        $__start_page =  $userprofile->current - 2;
                        $__end_page = $userprofile->current + 2;
                        list($__start_page, $__end_page) = getPage($__start_page, $__end_page, $userprofile->total_pages);

                        for($__p = $__start_page; $__p <= $__end_page; $__p++) { ?>
                            {% if userprofile.current == __p %}
                        <li class="disabled">
                            {{ link_to("rank/index?page=" ~ __p,"<span>"~ __p ~"</span>")}}
                            {% else %}
                        <li>
                            {{ link_to("rank/index?page=" ~ __p,"<span>"~ __p ~"</span>")}}
                            {% endif %}
                        </li>
                        <?php } ?>
                        {% if userprofile.current == userprofile.next %}
                        <li class="disabled">
                            {{ link_to("rank/index?page=" ~ userprofile.next,"<span>&raquo;</span>")}}
                        {% else %}
                        <li>
                            {{ link_to("rank/index?page=" ~ userprofile.next,"<span>&raquo;</span>")}}
                        {% endif %}
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
    {% endif %}
{% else %}
    <p>No problems are recorded</p>
{% endfor %}
