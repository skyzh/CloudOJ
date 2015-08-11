{{ content() }}


<div class = "row">
    <div class="col-xs-6" align="left">
        {{ link_to("status", "class": "btn btn-default", "<span class='glyphicon glyphicon-chevron-left'></span> Status") }}
    </div>
    <div class="col-xs-6" align="right">
        <p>
            <a href="javascript:reload_stat()" class="btn btn-primary"><span class="
glyphicon glyphicon-refresh"></span> Reload</a>
        </p>
    </div>
</div>

<div class="page-header">
    <h1>View Status</h1>
</div>
{% if st.hidden == true %}
    <h3>Hidden</h3>
{% else %}
<div class="row">
    <div class="col-xs-12">
        <h3>Summary</h3>
    </div>
</div>

{{ partial("partials/status_view_top") }}

{{ partial("partials/status_view_body") }}

<div class="row">
    <div class="col-xs-12">
        <h3>Details</h3>
    </div>
</div>
<div class="row">
    <div class="col-xs-12">
        {% if code.ret != " " %}
        <pre>{{ code.ret | e }}</pre>
        {% else %}
        <pre>No Data</pre>
        {% endif %}
    </div>
</div>
<div class="row">
    <div class="col-xs-12">
        <h3>Code</h3>
    </div>
</div>


<div class="row">
    <div class="col-xs-12">
        <pre><code>{{ code.code|e }}</code></pre>
    </div>
</div>
{% endif %}

<script>
function reload_stat() {
    $.pjax.reload('#pjax-container', { url: "{{ url("status/view/" ~ st.sid)}}" });
}
</script>
