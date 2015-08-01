jQuery.fn.slideLeftHide = function( speed, callback ) { this.animate( { width: "hide", paddingLeft: "hide", paddingRight: "hide", marginLeft: "hide", marginRight: "hide" }, speed, callback ); }
jQuery.fn.slideLeftShow = function( speed, callback ) { this.animate( { width: "show", paddingLeft: "show", paddingRight: "show", marginLeft: "show", marginRight: "show" }, speed, callback ); }

$(document).ready(function () {

    if($.support.pjax) {
        $(document).pjax('a', '#pjax-container');
        $(document).on('submit', 'form', function(event) {
            event.preventDefault();
            $.pjax.submit(event, '#pjax-container');
        });
    }

    $(document).on('pjax:send', function() {
        $('#pjax-loading').slideLeftShow(300);
    });
    $(document).on('pjax:success', function() {
        $('#pjax-loading').fadeOut(500);
    });

    $(document).trigger('pjax:success');
    $(document).trigger('pjax:end');
});

var t;

$(document).on('pjax:end' , function() {
    $(".markdown_desc").each(function(){
        $(this).html(markdown.toHTML($(this).text()));
    });
    twemoji.parse(
        document.body,
        {
            callback: function(icon, options) {
            return '//cdn.bootcss.com/twemoji/1.4.1/' + options.size + '/' + icon + '.png';
            },
            size: 16
        }
    );
    MathJax.Hub.Queue(["Typeset",MathJax.Hub]);
    $('[data-toggle="tooltip"]').tooltip();
    clearTimeout(t);
    t = setTimeout(function() {
        $("#flashcontainer").slideUp(500);
    }, 5000);
});
