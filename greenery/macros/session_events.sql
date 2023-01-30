{% macro session_events(event_description) %}
    select 
        oit.product_guid, 
        count(distinct session_guid) as unique_session_events
    from {{ref('stg_events')}} oit left join {{ref('stg_order_items')}} evt on oit.order_guid = evt.order_guid
    where event_description = '{{event_description}}'
    group by 1
{% endmacro %}