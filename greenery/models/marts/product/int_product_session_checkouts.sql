select 
    oit.product_guid, 
    count(distinct session_guid) as session_checkouts
from {{ref('stg_order_items')}} oit
    join {{ref('stg_events')}} evt on oit.order_guid = evt.order_guid
where event_description = 'checkout'
group by 1