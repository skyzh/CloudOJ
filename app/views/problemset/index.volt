<div class="page-header">
    <h2>Problems</h2>
</div>
{{ content() }}

{% for problem in problems %}
    {% if loop.first %}
    <table class="table table-bordered table-striped" align="center">
        <tbody>
        {% endif %}
            <tr>
                <td>{{ problem.pid }}</td>
                <td>{{ problem.title }}</td>
            </tr>
        {% if loop.last %}
        </tbody>
    </table>
    {% endif %}
{% else %}
    No products are recorded
{% endfor %}
