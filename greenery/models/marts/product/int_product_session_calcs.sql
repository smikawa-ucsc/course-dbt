-- distinct sessions with views per product
with product_session_views as(
Select 
    product_guid,
     COUNT(distinct session_guid) as unique_sessions
from {{ref('stg_events')}}
where event_description = 'page_view'
group by 1
),

-- distinct sessions with add to cart per product
product_session_carts as(
select product_guid,
    count(distinct session_guid) as unique_sessions
from {{ref('stg_events')}}
where event_description = 'add_to_cart'
group by 1
),

-- distinct sessions with checkouts per product
product_session_checkouts as(
select oit.product_guid,
    count(distinct session_guid) as unique_sessions
from {{ref('stg_events')}} evt join {{ref('stg_order_items')}} oit on evt.order_guid = oit.order_guid
where event_description = 'checkout'
group by 1
)

select v.product_guid,
    v.unique_sessions as unique_session_views,
    ca.unique_sessions as unique_session_carts,
    co.unique_sessions as unique_session_checkouts
from product_session_views v 
    left join product_session_carts ca on v.product_guid = ca.product_guid
    left join product_session_checkouts co on ca.product_guid = co.product_guid 
    