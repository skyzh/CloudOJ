<div class="page-header">
    <h1>Assets</h1>
</div>

<div id="result">
    {{ path }}
</div>

{{ form('assets/index/', 'method': 'post', 'enctype': 'multipart/form-data') }}
    <div class="row">
        <div class="col-md-8">
            <p>
                {{ file_field("file", "class": "form-control") }}
            </p>
        </div>
        <div class="col-md-4">
            <p>
                <button type="submit" class="btn btn-primary btn-block"><span class='glyphicon glyphicon-upload'></span> Upload</button>
            </p>
        </div>
    </div>
{{ endform() }}
