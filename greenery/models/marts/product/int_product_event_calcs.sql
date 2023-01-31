select 
    product_guid,
   {{event_sum('page_view')}} as product_views,
    {{event_sum('add_to_cart')}} as product_added_to_cart,
    min(datediff('d',created_at_utc,current_timestamp())) as days_since_first_event
from {{ ref('stg_events')}}
where product_guid is not null
group by 1