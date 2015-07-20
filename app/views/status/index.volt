{{ content() }}

<div class="page-header">
    <h2>Status</h2>
</div>
<!--
{% for problem in problems %}
    {% if loop.first %}
        <div class = "row" style="line-height: 30px;">
            <div class="col-md-2 col-xs-4"><h6>ID</h6></div>
            <div class="col-md-4 col-xs-8"><h6>Title</h6></div>
            <div class="col-md-3 hidden-sm hidden-xs"><h6>Type</h6></div>
            <div class="col-md-3 hidden-sm hidden-xs"><h6>Submit/Accepted</h6></div>
        </div>
    {% endif %}
        <div class="row-margin"></div>

        <div class="row">
            <div class="col-md-2 col-xs-4">{{ problem.pid }}</div>
            <div class="col-md-4 col-xs-8">{{ link_to('problemset/view/' ~ problem.pid, problem.title) }}</div>
            <div class="col-md-3 hidden-sm hidden-xs">{{ problem.type }}</div>
            <div class="col-md-3 hidden-sm hidden-xs">{{ problem.submit }}/{{ problem.accepted }}</div>
        </div>
{% else %}
    No submit is recorded
{% endfor %}
-->
