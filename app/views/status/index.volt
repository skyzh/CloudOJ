{{ content() }}

<div class = "row">
    <div class="col-xs-12" align="right">
        <p>
            <a href="javascript:reload_stat()" class="btn btn-primary"><span class="
glyphicon glyphicon-refresh"></span> Reload</a>
        </p>
    </div>
</div>

<div class="page-header">
    <h2>Status</h2>
</div>

{% for st in status.items %}
    {% if loop.first %}
        <div class = "row">
            <div class="col-md-2 col-xs-2"><h6>Problem</h6></div>
            <div class="col-md-2 col-xs-5"><h6>User</h6></div>
            <div class="col-md-1 hidden-sm hidden-xs"><h6>Language</h6></div>
            <div class="col-md-1 hidden-sm hidden-xs"><h6>Length</h6></div>
            <div class="col-md-2 col-xs-5"><h6>Status</h6></div>
            <div class="col-md-2 hidden-sm hidden-xs"><h6>Submit</h6></div>
            <div class="col-md-1 hidden-sm hidden-xs"><h6>Time</h6></div>
            <div class="col-md-1 hidden-sm hidden-xs"><h6>Memory</h6></div>
        </div>
    {% endif %}
        <div class="row">
                <div class="col-md-2 col-xs-2"><p>{{ link_to('problemset/view/' ~ st.pid, st.__title)}}</p></div>
                <div class="col-md-2 col-xs-5"><p>{{ link_to("profile/view/" ~ st.uid, st.__username)}}</p></div>
                <div class="col-md-1 hidden-sm hidden-xs"><p>
                    {% if st.lang == 0 %}
                    C++
                    {% elseif st.lang == 1 %}
                    C
                    {% elseif st.lang == 2 %}
                    C++11
                    {% elseif st.lang == 3 %}
                    Python2
                    {% elseif st.lang == 4 %}
                    Python3
                    {% elseif st.lang == 5 %}
                    Java
                    {% elseif st.lang == 6 %}
                    Pascal
                    {% elseif st.lang == 7 %}
                    Ruby
                    {% elseif st.lang == 8 %}
                    Perl
                    {% elseif st.lang == 9 %}
                    Go
                    {% elseif st.lang == 10 %}
                    Lua
                    {% elseif st.lang == 11 %}
                    Haskell
                    {% endif %}
                </div>
                <div class="col-md-1 hidden-sm hidden-xs">{{ link_to('status/view/' ~ st.sid, st.codelength ~ "B")}}</div>
                <div class="col-md-2 col-xs-5">
                    {% if st.status == 0 %}
                    <label class='label label-default'>Pending</label>
                    {% elseif st.status == 1 %}
                    <label class='label label-default'>Compiling</label>
                    {% elseif st.status == 2 %}
                    <label class='label label-success'>Accepted</label>
                    {% elseif st.status == 3 %}
                    <label class='label label-danger'>Wrong Answer</label>
                    {% elseif st.status == 4 %}
                    <label class='label label-danger'>Memory Limit Excceed</label>
                    {% elseif st.status == 5 %}
                    <label class='label label-danger'>Time Limit Excceed</label>
                    {% elseif st.status == 6 %}
                    <label class='label label-danger'>Runtime Error</label>
                    {% elseif st.status == 7 %}
                    <label class='label label-warning'>Compile Error</label>
                    {% elseif st.status == 8 %}
                    <label class='label label-info'>Running</label>
                    {% elseif st.status == 9 %}
                    <label class='label label-warning'>Unknown</label>
                    {% endif %}
                </p></div>
                <div class="col-md-2 hidden-sm hidden-xs"><p>{{ st.submittime }}</p></div>
                <div class="col-md-1 hidden-sm hidden-xs"><p>{{ st.timelimit }} ms</p></div>
                <div class="col-md-1 hidden-sm hidden-xs"><p>{{ st.memlimit }} KB</p></div>
        </div>
    {% if loop.last %}
        <div class = "row">
            <div class="col-xs-12" align="middle">
                <nav>
                    <ul class="pagination">
                        {% if status.current == status.before %}
                        <li class="disabled">
                            {{ link_to("status/index?page=" ~ status.before,"<span>&laquo;</span>")}}
                        {% else %}
                        <li>
                            {{ link_to("status/index?page=" ~ status.before,"<span>&laquo;</span>")}}
                        {% endif %}
                        </li>
                        <?php
                        $__start_page =  $status->current - 2;
                        $__end_page = $status->current + 2;
                        list($__start_page, $__end_page) = getPage($__start_page, $__end_page, $status->total_pages);

                        for($__p = $__start_page; $__p <= $__end_page; $__p++) { ?>
                        <li>
                            {{ link_to("status/index?page=" ~ __p,"<span>"~ __p ~"</span>")}}
                        </li>
                        <?php } ?>
                        {% if status.current == status.next %}
                        <li class="disabled">
                            {{ link_to("status/index?page=" ~ status.next,"<span>&raquo;</span>")}}
                        {% else %}
                        <li>
                            {{ link_to("status/index?page=" ~ status.next,"<span>&raquo;</span>")}}
                        {% endif %}
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
    {% endif %}
{% else %}
    No status is recorded
{% endfor %}

<script>
function reload_stat() {
    $.pjax.reload('#pjax-container', {});
}
</script>
