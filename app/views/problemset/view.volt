{{ content() }}


<div class = "row">
    <div class="col-sm-6" align="left"><p>
        {{ link_to("problemset", "class": "btn btn-default", "<span class='glyphicon glyphicon-chevron-left'></span> Problems") }}
    </p></div>

    <div class="col-sm-6" align="right">
        <p>
            <div class="btn-group">
                {% if isUser %}
                {{ link_to('status/submit/' ~ problem.pid, '<span class="glyphicon glyphicon-upload"></span> Submit', 'class': 'btn btn-success btn-large')}}
                {% else %}
                <span class = "btn btn-success btn-large disabled" data-toggle="tooltip" data-placement="bottom" title="Log In to Submit"><span class="glyphicon glyphicon-upload"></span> Submit</span>
                {% endif %}
                <!--{{link_to('discuss/index/?pid=' ~ problem.pid, '<span class="glyphicon glyphicon-comment"></span> Discuss', 'class': 'btn btn-primary btn-large')}}-->
                {{ link_to('status/index/?pid=' ~ problem.pid, '<span class="glyphicon glyphicon-stats"></span> Status', 'class': 'btn btn-primary btn-large')}}
            </div>
        </p>
    </div>
</div>
{% if isAdmin %}
<div class = "row">
    <div class="col-xs-12" align="right">
        <p>
            <div class="btn-group">
            {{ link_to('data/index/' ~ problem.pid, '<span class="glyphicon glyphicon-tasks"></span> Data', 'class': 'btn btn-default')}}
            {{ link_to('premission/index/' ~ problem.pid, '<span class="glyphicon glyphicon-console"></span> Premission', 'class': 'btn btn-default')}}
            {{ link_to('problemset/edit/' ~ problem.pid, '<span class="glyphicon glyphicon-edit"></span> Edit', 'class': 'btn btn-default')}}
            {{ link_to('problemset/remove/' ~ problem.pid, '<span class="glyphicon glyphicon-trash"></span> Remove', 'class': 'btn btn-danger')}}
        </div>
        </p>
    </div>
</div>
{% endif %}


<div class="page-header">
    <h2>{{ problem.pid }} {{ problem.title }} {% if !premission %}<small>Premission Denied</small>{% endif %}</h2>
</div>

{% if premission %}
<div class="row">
    <div class="col-md-2"></div>
    <div class="col-md-2">
        <h6>Type {{ problem.type }}</h6>
    </div>
    <div class="col-md-2">
        <h6>Memory Limit {% if problem.memlimit <= 10240 %}
            {{ problem.memlimit }} KB
        {% else %}
            {{ "%d" | format(problem.memlimit/1024) }} MB
        {% endif %}</h6>
    </div>
    <div class="col-md-2">
        <h6>Time Limit {{ problem.timelimit }} ms</h6>
    </div>
    <div class="col-md-2">
        <h6>Accepted/Submit {{ problem.accepted }}/{{ problem.submit }}</h6>
    </div>
    <div class="col-md-2"></div>
</div>
<div data-spy="scroll" data-target="#navbar-example2" data-offset="0" class="scrollspy-example">
    <div class="row">
        <div class="col-xs-12">
            <h3 id="_description">Description</h3>
            <p><span class="markdown_desc">{{ problem.description | e }}</span></p>
        </div>
    </div>
    <div class="row">
        <div class="col-xs-12">
            <h3 id="_input">Input</h3>
            <p><span class="markdown_desc">{{ problem.input | e }}</span></p>
        </div>
    </div>
    <div class="row">
        <div class="col-xs-12">
            <h3 id="_output">Output</h3>
            <p><span class="markdown_desc">{{ problem.output | e }}</span></p>
        </div>
    </div>
    <div class="row">
        <div class="col-xs-12">
            <h3 id="_sample">Sample</h3>
        </div>
    </div>
    {% for data in problem.problemdata %}
        {% if data.isSample == 1 %}
        <div class="row">
            <div class="col-md-12">
                <h4>{{ data.dat_name }}</h4>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <div class = "panel panel-default">
                    <span class="sampledata">{{ data.getIn() }}</span>
                </div>
            </div>
            <div class="col-md-6">
                <div class = "panel panel-default">
                    <span class="sampledata">{{ data.getOut() }}</span>
                </div>
            </div>
        </div>
        {% endif %}
    {% endfor %}
    <div class="row">
        <div class="col-xs-12">
            <h3 id="_hint">Hint</h3>
            <p><span class="markdown_desc">{{ problem.hint | e }}</span></p>
        </div>
    </div>
{% else %}
    <h3>Requirements</h3>
    <p>The following conditions are required:</p>
    {{ premissioninfo }}
{% endif %}
