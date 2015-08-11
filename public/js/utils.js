jQuery.fn.slideLeftHide = function( speed, callback ) { this.animate( { width: "hide", paddingLeft: "hide", paddingRight: "hide", marginLeft: "hide", marginRight: "hide" }, speed, callback ); }
jQuery.fn.slideLeftShow = function( speed, callback ) { this.animate( { width: "show", paddingLeft: "show", paddingRight: "show", marginLeft: "show", marginRight: "show" }, speed, callback ); }



$(document).ready(function () {

    if($.support.pjax) {
        $(document).pjax('a', '#pjax-container', {timeout: 5000});
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

    $(document).on('pjax:popstate', function() {
        $.pjax.reload('#pjax-container', {});
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
    $('pre code').each(function(i, block) {
        hljs.highlightBlock(block);
    });
    MathJax.Hub.Queue(["Typeset",MathJax.Hub]);
    $('[data-toggle="tooltip"]').tooltip();
    clearTimeout(t);
    t = setTimeout(function() {
        $("#flashcontainer").slideUp(500);
    }, 5000);
});

Chart.defaults.global = {
    animation: true,
    animationSteps: 60,
    animationEasing: "easeOutQuart",
    showScale: true,
    scaleOverride: false,
    scaleSteps: null,
    scaleStepWidth: null,
    scaleStartValue: null,
    scaleLineColor: "rgba(0,0,0,.1)",
    scaleLineWidth: 1,
    scaleShowLabels: true,
    scaleLabel: "<%=value%>",
    scaleIntegersOnly: true,
    scaleBeginAtZero: false,
    scaleFontFamily: "'Helvetica Neue', 'Helvetica', 'Arial', sans-serif",
    scaleFontSize: 12,
    scaleFontStyle: "normal",
    scaleFontColor: "#666",
    responsive: true,
    maintainAspectRatio: false,
    showTooltips: true,
    customTooltips: false,
    tooltipEvents: ["mousemove", "touchstart", "touchmove"],
    tooltipFillColor: "rgba(0,0,0,0.8)",
    tooltipFontFamily: "'Helvetica Neue', 'Helvetica', 'Arial', sans-serif",
    tooltipFontSize: 14,
    tooltipFontStyle: "normal",
    tooltipFontColor: "#fff",
    tooltipTitleFontFamily: "'Helvetica Neue', 'Helvetica', 'Arial', sans-serif",
    tooltipTitleFontSize: 14,
    tooltipTitleFontStyle: "bold",
    tooltipTitleFontColor: "#fff",
    tooltipYPadding: 6,
    tooltipXPadding: 6,
    tooltipCaretSize: 8,
    tooltipCornerRadius: 6,
    tooltipXOffset: 10,
    tooltipTemplate: "<%if (label){%><%=label%>: <%}%><%= value %>",
    multiTooltipTemplate: "<%= value %>",

    onAnimationProgress: function(){},
    onAnimationComplete: function(){}
};
