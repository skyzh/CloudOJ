{{ content() }}

<div class="row">
    <div align="right">
        <div class="col-md-6" align="left">
            {{ link_to("problemset/view/" ~ problem.pid, "class": "btn btn-default", "
            <span class='glyphicon glyphicon-chevron-left'></span> Go Back") }}
        </div>
    </div>
</div>


<div class="page-header">
    <h2>Submit - {{ problem.title }}</h2>
</div>

<div class="row">
    <div class="col-sm-3">
        <div class="row">
            <div class="col-xs-12">
                <div class="list-group">
                    <option value="0" class="list-group-item active langselect lang_c" href="javascript:">C++</option>
                    <option value="1" class="list-group-item langselect lang_c" href="javascript:">C</option>
                    <option value="2" class="list-group-item langselect lang_c" href="javascript:">C++11</option>
                    <option value="3" class="list-group-item langselect lang_py" href="javascript:">Python2</option>
                    <option value="4" class="list-group-item langselect lang_py" href="javascript:">Python3</option>
                    <option value="5" class="list-group-item langselect lang_ja" href="javascript:">Java</option>
                    <option value="6" class="list-group-item langselect lang_pascal" href="javascript:">Pascal</option>
                    <option value="7" class="list-group-item langselect lang_ruby" href="javascript:">Ruby</option>
                    <option value="8" class="list-group-item langselect lang_perl" href="javascript:">Perl</option>
                    <option value="9" class="list-group-item langselect lang_go" href="javascript:">Go</option>
                    <option value="10" class="list-group-item langselect lang_lua" href="javascript:">Lua</option>
                    <option value="11" class="list-group-item langselect lang_haskell" href="javascript:">Haskell</option>
                </div>
            </div>
        </div>
        <div class="row-margin"></div>
        {{ form('status/submit/' ~ problem.pid, 'id': 'submitForm', 'onbeforesubmit': "return false;") }}
        <div class="row">
            <div class="col-xs-12">
                {{ submit_button("Submit", "class": "btn btn-primary btn-block",'onclick': 'return __processSubmit();') }}
                {{ link_to('status/submit/' ~ problem.pid, 'Reset', 'class': 'btn btn-default btn-block')}}
            </div>
            <div style="display:none">
                <textarea name = "code"></textarea>
                <select name="lang" class="form-control">
                    <option value = "0">C++(g++)</option>
                    <option value = "1">C(gcc)</option>
                    <option value = "2">Python2</option>
                    <option value = "3">Python3</option>
                    <option value = "4">Java</option>
                    <option value = "5">Pascal</option>
                    <option value = "6">Ruby</option>
                    <option value = "7">Perl</option>
                    <option value = "8">Go</option>
                    <option value = "9">Lua</option>
                    <option value = "10">Haskell</option>
                </select>
            </div>
        </div>
        {{ endform() }}
    </div>
    <div class="col-sm-9" style="height: 600px;">
        <div id="editor-container">
            <pre id="editor">//Put your code here!</pre>
        </div>
    </div>
</div>

{{ javascript_include('//cdn.bootcss.com/ace/1.1.9/ace.js') }}
<script>
    var editor;
    $(document).ready(function() {
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
        $("select[name=lang]").val($("option[class*=active]").attr("value"));
        $("textarea[name=code]").val(editor.getValue());
        $("#submitForm")[0].submit();
        return true;
    }
</script>
