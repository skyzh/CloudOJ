{{ content() }}

<div class="row">
    <div align="right">
        <div class="col-md-6" align="left">
            {{ link_to("problemset/view/" ~ problem.pid, "class": "btn btn-default", "
            <span class='glyphicon glyphicon-chevron-left'></span> " ~ problem.title) }}
        </div>
    </div>
</div>


<div class="page-header">
    <h1>Submit::{{ problem.title }}</h1>
</div>

<div class="row">
    <div class="col-sm-3">
        <div class="row">
            <div class="col-xs-12">
                <div class="list-group">
                    <p value="0" class="list-group-item active langselect lang_c" href="javascript:">GNU C++</p>
                    <p value="1" class="list-group-item langselect lang_c" href="javascript:">GNU C</p>
                    <p value="2" class="list-group-item langselect lang_c" href="javascript:">GNU C++11</p>
                    <!--<option value="3" class="list-group-item langselect lang_py" href="javascript:">Python2</option>
                    <option value="4" class="list-group-item langselect lang_py" href="javascript:">Python3</option>
                    <option value="5" class="list-group-item langselect lang_ja" href="javascript:">Java</option>-->
                    <p value="6" class="list-group-item langselect lang_pascal" href="javascript:">Pascal</p>
                    <!--<option value="7" class="list-group-item langselect lang_ruby" href="javascript:">Ruby</option>
                    <option value="8" class="list-group-item langselect lang_perl" href="javascript:">Perl</option>
                    <option value="9" class="list-group-item langselect lang_go" href="javascript:">Go</option>
                    <option value="10" class="list-group-item langselect lang_lua" href="javascript:">Lua</option>
                    <option value="11" class="list-group-item langselect lang_haskell" href="javascript:">Haskell</option>-->
                </div>
            </div>
        </div>
        {{ form('status/submit/' ~ problem.pid, 'id': 'submitForm', 'onsubmit': "return __processSubmit()") }}
        <div class="row">
            <div class="col-xs-12">
                <p>{{ submit_button("Submit", "class": "btn btn-primary btn-block") }}</p>
                <p>{{ link_to('status/submit/' ~ problem.pid, 'Reset', 'class': 'btn btn-default btn-block')}}</p>
            </div>
            <div style="display:none">
                <textarea name = "code"></textarea>
                <select name="lang" class="form-control">
                    <option value = "0"></option>
                    <option value = "1"></option>
                    <option value = "2"></option>
                    <option value = "3"></option>
                    <option value = "4"></option>
                    <option value = "5"></option>
                    <option value = "6"></option>
                    <option value = "7"></option>
                    <option value = "8"></option>
                    <option value = "9"></option>
                    <option value = "10"></option>
                    <option value = "11"></option>
                </select>
            </div>
        </div>
        {{ endform() }}
    </div>
    <div class="col-sm-9" style="height: 600px;">
        <div id="editor-container">
            <p><pre id="editor" style="height: 600px">//Put your code here!</pre></p>
        </div>
    </div>
</div>


<script>
    var editor;
    $(document).one('pjax:end' ,function() {
        editor = ace.edit("editor");
        editor.setTheme("ace/theme/xcode");
        editor.getSession().setMode("ace/mode/c_cpp");
    })

    $(".langselect").click(function() {
        $(".langselect").removeClass("active");
        $(this).addClass("active");
        if ($(this).hasClass("lang_c")) editor.getSession().setMode("ace/mode/c_cpp");
        if ($(this).hasClass("lang_py")) editor.getSession().setMode("ace/mode/python");
        if ($(this).hasClass("lang_ja")) editor.getSession().setMode("ace/mode/java");
        if ($(this).hasClass("lang_pascal")) editor.getSession().setMode("ace/mode/pascal");
        if ($(this).hasClass("lang_ruby")) editor.getSession().setMode("ace/mode/ruby");
        if ($(this).hasClass("lang_perl")) editor.getSession().setMode("ace/mode/perl");
        if ($(this).hasClass("lang_go")) editor.getSession().setMode("ace/mode/golang");
        if ($(this).hasClass("lang_lua")) editor.getSession().setMode("ace/mode/lua");
        if ($(this).hasClass("lang_haskell")) editor.getSession().setMode("ace/mode/haskell");
    });

    function __processSubmit() {
        $("select[name=lang]").val($(".langselect[class*=active]").attr("value"));
        $("textarea[name=code]").val(editor.getValue());
        return true;
    }
</script>
