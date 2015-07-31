{{ content() }}

{% if isAdmin %}
<div class = "row">
    <div align="right">
        <div class="col-xs-12">
            <p>{{ link_to('problemset/new', '<span class="glyphicon glyphicon-plus"></span> Create', 'class': 'btn btn-default btn-large')}}</p>
        </div>
    </div>
</div>
{% endif %}

<div class="page-header">
    <h2>Problems</h2>
</div>

{% for problem in problems.items %}
    {% if loop.first %}
        <div class = "row">
            <div class="col-md-2 col-xs-4"><h6>ID</h6></div>
            <div class="col-md-4 col-xs-8"><h6>Title</h6></div>
            <div class="col-md-3 hidden-sm hidden-xs"><h6>Type</h6></div>
            <div class="col-md-3 hidden-sm hidden-xs"><h6>Accepted/Submit</h6></div>
        </div>
    {% endif %}
        <div class="row">
            <div class="col-md-2 col-xs-4"><p>{{ problem.pid }}</p></div>
            <div class="col-md-4 col-xs-8"><p>{{ link_to('problemset/view/' ~ problem.pid, problem.title) }}</p></div>
            <div class="col-md-3 hidden-sm hidden-xs"><p>{{ problem.type }}</p></div>
            <div class="col-md-3 hidden-sm hidden-xs"><p>{{ problem.accepted }}/{{ problem.submit }}</p></div>
        </div>
    {% if loop.last %}
        <div class = "row">
            <div class="col-xs-12" align="middle">
                <nav>
                    <ul class="pagination">
                        {% if problems.current == problems.before %}
                        <li class="disabled">
                            {{ link_to("problemset/index?page=" ~ problems.before,"<span>&laquo;</span>")}}
                        {% else %}
                        <li>
                            {{ link_to("problemset/index?page=" ~ problems.before,"<span>&laquo;</span>")}}
                        {% endif %}
                        </li>
                        <?php
                        $__start_page =  $problems->current - 2;
                        $__end_page = $problems->current + 2;
                        list($__start_page, $__end_page) = getPage($__start_page, $__end_page, $problems->total_pages);

                        for($__p = $__start_page; $__p <= $__end_page; $__p++) { ?>
                        <li>
                            {{ link_to("problemset/index?page=" ~ __p,"<span>"~ __p ~"</span>")}}
                        </li>
                        <?php } ?>
                        {% if problems.current == problems.next %}
                        <li class="disabled">
                            {{ link_to("problemset/index?page=" ~ problems.next,"<span>&raquo;</span>")}}
                        {% else %}
                        <li>
                            {{ link_to("problemset/index?page=" ~ problems.next,"<span>&raquo;</span>")}}
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
