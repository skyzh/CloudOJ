<div class="row">
{% for topcoders in ranklist %}
    <div class="col-sm-6 col-md-4 col-lg-2" align="middle" style="margin-bottom: 10px; margin-top: 10px;">
        <p><img class="img-circle" src="{{ topcoders.user.avatar }}"></img></p>
        <p>{{ link_to("profile/view/" ~ topcoders.user.uid, topcoders.user.username) }}</p>
    </div>
{% endfor %}
</div>
