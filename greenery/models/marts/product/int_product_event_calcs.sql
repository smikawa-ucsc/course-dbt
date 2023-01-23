select 
    product_guid,
    sum(case when event_description = 'page_view' then 1 else 0 end) as product_views,
    sum(case when event_description = 'add_to_cart' then 1 else 0 end) as product_added_to_cart,
    min(datediff('d',created_at_utc,current_timestamp())) as days_since_first_event
from {{ ref('stg_events')}}
where product_guid is not null
group by 1