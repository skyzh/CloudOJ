{{ content() }}


<div class = "row">
    <div align="right">
        <div class="col-md-6" align="left">
            {{ link_to("problemset", "class": "btn btn-default", "<span class='glyphicon glyphicon-chevron-left'></span> Go Back") }}
        </div>

        <div class="col-md-6" align="right">
            {% if isUser %}
            {{ link_to('status/submit/' ~ problem.pid, '<span class="glyphicon glyphicon-upload"></span> Submit', 'class': 'btn btn-primary btn-large')}}
            {% endif %}
            {{ link_to('discuss/search/pid/' ~ problem.pid, '<span class="glyphicon glyphicon-th-list"></span> Discuss', 'class': 'btn btn-primary btn-large')}}
            {{ link_to('status/search/pid/' ~ problem.pid, '<span class="glyphicon glyphicon-signal"></span> Status', 'class': 'btn btn-primary btn-large')}}
            {% if isAdmin %}
            {{ link_to('problemset/edit/' ~ problem.pid, '<span class="glyphicon glyphicon-pencil"></span> Edit', 'class': 'btn btn-default btn-large')}}
            {{ link_to('problemset/remove/' ~ problem.pid, '<span class="glyphicon glyphicon-trash"></span> Remove', 'class': 'btn btn-danger btn-large')}}
            {% endif %}
        </div>

    </div>
</div>


<div class="page-header">
    <h2>{{ problem.pid }} {{ problem.title }}</h2>
</div>


<div class="row">
    <div class="col-sm-3">
        <h6>Type {{ problem.type }}</h6>
    </div>
    <div class="col-sm-3">
        <h6>Memory Limit {{ problem.memlimit }} KB</h6>
    </div>
    <div class="col-sm-3">
        <h6>Time Limit {{ problem.timelimit }} ms</h6>
    </div>
    <div class="col-sm-3">
        <h6>Accepted/Submit {{ problem.accepted }}/{{ problem.submit }}</h6>
    </div>
</div>
<div data-spy="scroll" data-target="#navbar-example2" data-offset="0" class="scrollspy-example">
    <div class="row">
        <div class="col-xs-12">
            <h3 id="_description">Description</h3>
            <p><span class="prob_desc">{{ problem.description }}</span></p>
        </div>
    </div>
    <div class="row">
        <div class="col-xs-12">
            <h3 id="_input">Input</h3>
            <p><span class="prob_desc">{{ problem.input }}</span></p>
        </div>
    </div>
    <div class="row">
        <div class="col-xs-12">
            <h3 id="_output">Output</h3>
            <p><span class="prob_desc">{{ problem.output }}</span></p>
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
            <p><span class="prob_desc">{{ problem.hint }}</span></p>
        </div>
    </div>
</div>
{{ javascript_include('//cdn.bootcss.com/markdown.js/0.5.0/markdown.min.js') }}

<script>
    $(document).ready(function(){
        $(".prob_desc").each(function(){
            $(this).html(markdown.toHTML($(this).html()));
        });
    });
</script>
