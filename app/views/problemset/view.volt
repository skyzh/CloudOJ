{{ content() }}


<div class = "row">
    <div class="col-sm-6" align="left"><p>
        {{ link_to("problemset", "class": "btn btn-default", "<span class='glyphicon glyphicon-chevron-left'></span> Problems") }}
    </p></div>

    <div class="col-sm-6" align="right">
        <p>
        {% if isUser %}
        {{ link_to('status/submit/' ~ problem.pid, '<span class="glyphicon glyphicon-upload"></span> Submit', 'class': 'btn btn-success btn-large')}}
        {% else %}
        <span class = "btn btn-success btn-large disabled" data-toggle="tooltip" data-placement="bottom" title="Log In to Submit"><span class="glyphicon glyphicon-upload"></span> Submit</span>
        {% endif %}
        {{ link_to('discuss/index/?pid=' ~ problem.pid, '<span class="glyphicon glyphicon-comment"></span> Discuss', 'class': 'btn btn-primary btn-large')}}
        {{ link_to('status/index/?pid=' ~ problem.pid, '<span class="glyphicon glyphicon-stats"></span> Status', 'class': 'btn btn-primary btn-large')}}
        </p>
    </div>
</div>
{% if isAdmin %}
<div class = "row">
    <div class="col-xs-12" align="right">
        <p>
        {{ link_to('data/index/' ~ problem.pid, '<span class="glyphicon glyphicon-tasks"></span> Data', 'class': 'btn btn-default btn-large')}}
        {{ link_to('problemset/edit/' ~ problem.pid, '<span class="glyphicon glyphicon-edit"></span> Edit', 'class': 'btn btn-default btn-large')}}
        {{ link_to('problemset/remove/' ~ problem.pid, '<span class="glyphicon glyphicon-trash"></span> Remove', 'class': 'btn btn-danger btn-large')}}
        </p>
    </div>
</div>
{% endif %}


<div class="page-header">
    <h2>{{ problem.pid }} {{ problem.title }}</h2>
</div>


<div class="row">
    <div class="col-md-2"></div>
    <div class="col-md-2">
        <h6>Type {{ problem.type }}</h6>
    </div>
    <div class="col-md-2">
        <h6>Memory Limit {{ problem.memlimit/1024 }} MB</h6>
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
            <p><span class="markdown_desc">{{ problem.description }}</span></p>
        </div>
    </div>
    <div class="row">
        <div class="col-xs-12">
            <h3 id="_input">Input</h3>
            <p><span class="markdown_desc">{{ problem.input }}</span></p>
        </div>
    </div>
    <div class="row">
        <div class="col-xs-12">
            <h3 id="_output">Output</h3>
            <p><span class="markdown_desc">{{ problem.output }}</span></p>
        </div>
    </div>
    <div class="row">
        <div class="col-xs-12">
            <h3 id="_sample">Sample</h3>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6">
            <div class = "panel panel-default">
                <span class="sampledata">{{ problem.sampleinput }}</span>
            </div>
        </div>
        <div class="col-md-6">
            <div class = "panel panel-default">
                <span class="sampledata">{{ problem.sampleoutput }}</span>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-xs-12">
            <h3 id="_hint">Hint</h3>
            <p><span class="markdown_desc">{{ problem.hint }}</span></p>
        </div>
    </div>
