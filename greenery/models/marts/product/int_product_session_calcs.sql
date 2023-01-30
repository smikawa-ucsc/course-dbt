with product_session_views as (
    select 
        product_guid, 
        count(distinct session_guid) as unique_sessions_with_view
    from {{ref('stg_events')}}
    where event_description = 'page_view'
    group by 1
),
    product_session_checkouts as (
    select 
        oit.product_guid, 
        count(distinct session_guid) as session_checkouts
    from {{ref('stg_order_items')}} oit
        join {{ref('stg_events')}} evt on oit.order_guid = evt.order_guid
    where event_description = 'checkout'
    group by 1)

select v.product_guid, unique_sessions_with_view, session_checkouts
from product_session_views v left join product_session_checkouts c on v.product_guid = c.product_guid