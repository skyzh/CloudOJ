<div class="row">
{% for topcoders in ranklist %}
    <div class="col-sm-6 col-md-4 col-lg-2" style="margin-bottom: 10px; margin-top: 10px;">
        <p class="text-center">{{ link_to("profile/view/" ~ topcoders.user.uid, "<img class='img-circle' src='" ~ topcoders.user.avatar ~ "'></img>") }}</p>
        <p class="text-center">{{ topcoders.user.username }}</p>
    </div>
{% endfor %}
</div>
