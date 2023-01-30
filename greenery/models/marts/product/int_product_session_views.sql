select 
    prd.product_guid, 
    count(distinct session_guid) as unique_sessions_with_view
from {{ref('dim_products')}} prd 
    join {{ref('stg_events')}} evt on prd.product_guid = evt.product_guid
where event_description = 'page_view'
group by 1