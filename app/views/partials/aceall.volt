<script>

var aeditors;

function doAce(obj, mode) {
    __p = document.createElement("p");
    __h3 = document.createElement("h3");
    aceelement = document.createElement("pre");
    $(__h3).text($(obj).attr("placeholder"));
    $(__p).append($(aceelement));

    $(obj).before(__h3);
    $(obj).after(__p);

    $(aceelement).text($(obj).val());

    editor = ace.edit(aceelement);
    editor.setTheme("ace/theme/github");
    editor.getSession().setMode(mode);

    $(aceelement).css("height", $(obj).css("height"));
    aeditors[$(obj).attr("name")] = editor;
    $(obj).hide();
}

$(document).one('pjax:send', function() {

});

$(document).one('pjax:end', function() {
    aeditors = new Array();
    $("form.aceeditor").attr("onsubmit", "return __processSubmit()");
    $("textarea.aceeditor.markdownarea").each(function(index, obj) {
        doAce(obj, "ace/mode/markdown");
    });
    $("textarea.aceeditor.textarea").each(function(index, obj) {
        doAce(obj, "ace/mode/plain_text");
        console.log("OK");
    });
});

function __processSubmit() {
    for (key in aeditors) {
        val = aeditors[key];
        $("textarea[name=" + key + "]").val(val.getValue());
    }
}
</script>
