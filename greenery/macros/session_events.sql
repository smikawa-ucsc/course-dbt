{% macro event_sum(event_description) %}
    SUM(case when event_description = 'event_description' then 1 else 0 end)
{% endmacro %}