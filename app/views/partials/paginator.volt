<?php $pages = PublicLib::getPageElement($paginator, 2); ?>
<div class = "row">
    <div class="col-xs-12" align="middle">
        <nav>
            <ul class="pagination">
                {% if paginator.current == paginator.before %}
                <li class="disabled">
                    {{ link_to(targetURL ~ paginator.before,"<span>&laquo;</span>")}}
                {% else %}
                <li>
                    {{ link_to(targetURL ~ paginator.before,"<span>&laquo;</span>")}}
                {% endif %}
                </li>
                {% for page in pages %}
                    {% if paginator.current == page %}
                <li class="disabled">
                    {{ link_to(targetURL ~ page,"<span>"~ page ~"</span>")}}
                    {% else %}
                <li>
                    {{ link_to(targetURL ~ page,"<span>"~ page ~"</span>")}}
                    {% endif %}
                </li>
                {% endfor %}
                {% if paginator.current == paginator.next %}
                <li class="disabled">
                    {{ link_to(targetURL ~ paginator.next,"<span>&raquo;</span>")}}
                {% else %}
                <li>
                    {{ link_to(targetURL ~ paginator.next,"<span>&raquo;</span>")}}
                {% endif %}
                </li>
            </ul>
        </nav>
    </div>
</div>
