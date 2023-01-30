select 
    prd.product_guid, 
    count(distinct session_guid) as session_checkouts
from {{ref('dim_products')}} prd 
    left join {{ref('stg_order_items')}} oit on prd.product_guid = oit.product_guid
    left join {{ref('stg_events')}} evt on oit.order_guid = evt.order_guid
group by 1