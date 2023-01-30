{% macro session_events(event_description) %}
    {% set sql %}
        select distinct session_guid, order_guid, product_guid
        from {{ref('stg_events')}}
        where event_description = '{{event_description}}'
    {% endset %}

    {% set table = run_query(sql) %}
{% endmacro %}