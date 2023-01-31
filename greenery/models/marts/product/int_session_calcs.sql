-- distinct sessions with views per product
with product_session_views as(
Select 
    product_guid,
     COUNT(distinct session_guid) as unique_sessions
from {{ref('stg_events')}}
where event_description = 'page_view'
group by 1
),

product_session_checkouts as(
-- distinct sessions with checkouts per product
select oit.product_guid,
    count(distinct session_guid) as unique_sessions
from {{ref('stg_events')}} evt join {{ref('stg_order_items')}} oit on evt.order_guid = oit.order_guid
where event_description = 'checkout'
group by 1
)

select views.product_guid,
    views.unique_sessions as unique_session_views,
    checkouts.unique_sessions as unique_session_checkouts
from product_session_views views left join product_session_checkouts checkouts on views.product_guid = checkouts.product_guid 