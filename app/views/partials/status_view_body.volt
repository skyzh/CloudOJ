<div class="row">
        <div class="col-md-2 col-xs-4"><p>{{ link_to('problemset/view/' ~ st.pid, st.__title)}}</p></div>
        <div class="col-md-2 col-xs-4"><p>{{ link_to("profile/view/" ~ st.uid, st.__username)}} </p></div>
        <div class="col-md-2 col-xs-4">
            {% if st.status == 0 %}
            <label class='label label-default'>Pending</label>
            {% elseif st.status == 1 %}
            <label class='label label-default'>Compiling</label>
            {% elseif st.status == 2 %}
            <label class='label label-success'>Accepted</label>
            {% elseif st.status == 3 %}
            <label class='label label-danger'>Wrong Answer</label>
            {% elseif st.status == 4 %}
            <label class='label label-danger'>Memory Limit Exceed</label>
            {% elseif st.status == 5 %}
            <label class='label label-danger'>Time Limit Exceed</label>
            {% elseif st.status == 6 %}
            <label class='label label-danger'>Runtime Error</label>
            {% elseif st.status == 7 %}
            <label class='label label-warning'>Compile Error</label>
            {% elseif st.status == 8 %}
            <label class='label label-info'>Running</label>
            {% elseif st.status == 9 %}
            <label class='label label-warning'>Unknown</label>
            {% elseif st.status == 10 %}
            <label class='label label-warning'>Presentation Error</label>
            {% elseif st.status == 11 %}
            <label class='label label-warning'>Output Limit Exceed</label>
            {% elseif st.status == 12 %}
            <label class='label label-warning'>System Error</label>
            {% endif %}
        </p></div>
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
        <div class="col-md-1 hidden-sm hidden-xs">{{ link_to('status/view/' ~ st.sid, st.codelength ~ "B") }}</div>
        <div class="col-md-2 hidden-sm hidden-xs"><p>{{ st.submittime }}</p></div>
        <div class="col-md-1 hidden-sm hidden-xs"><p>{{ st.timelimit }} <small>ms</small></p></div>
        <div class="col-md-1 hidden-sm hidden-xs">
        <p>{% if st.memlimit <= 10240 %}
            {{ st.memlimit }} <small>KB</small>
        {% else %}
            {{ "%d" | format(st.memlimit/1024) }} <small>MB</small>
        {% endif %}</p>
        </div>
</div>
