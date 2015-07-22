{{ content() }}

<div class="page-header">
    <h2>View Status</h2>
</div>

<div class="row">
    <div class="col-xs-12">
        <h3>Basic</h3>
    </div>
</div>
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
<div class="row">
        <div class="col-md-2 col-xs-2">{{ link_to('problemset/view/' ~ st.pid, st.__title)}}</div>
        <div class="col-md-2 col-xs-5">{{ st.__username }}</div>
        <div class="col-md-1 hidden-sm hidden-xs">
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
        </div>
        <div class="col-md-2 hidden-sm hidden-xs">{{ st.submittime }}</div>
        <div class="col-md-1 hidden-sm hidden-xs">{{ st.timelimit }} ms</div>
        <div class="col-md-1 hidden-sm hidden-xs">{{ st.memlimit }} KB</div>
</div>

<div class="row">
    <div class="col-xs-12">
        <h3>Return</h3>
    </div>
</div>
<div class="row">
    <div class="col-xs-12">
        <div class = "panel panel-default">
        {% if code.ret != " " %}
            <span id = "retdat" class="monotext">{{ code.ret }}</span>
        {% else %}
            <span id = "retdat" class="monotext">No Return Data</span>
        {% endif %}
        </div>
    </div>
</div>
<div class="row">
    <div class="col-xs-12">
        <h3>Code</h3>
    </div>
</div>
<div class="row">
    <div class="col-xs-12">

        <div class = "panel panel-default">
            <span class="sampledata">{{ code.code|e }}</span>
        </div>
    </div>
</div>
