<script>

var aeditors;

function doAce(obj, mode) {
    __p = document.createElement("p");
    aceelememt = document.createElement("pre");
    $(__p).append($(aceelememt));
    $(obj).after(__p);
    $(aceelememt).text($(obj).val());

    editor = ace.edit(aceelememt);
    editor.setTheme("ace/theme/github");
    editor.getSession().setMode(mode);

    $(aceelememt).css("height", $(obj).css("height"));
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
