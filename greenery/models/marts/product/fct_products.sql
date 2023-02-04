with products as (
    select
        product_guid, 
        product_name, 
        price, 
        inventory_count 
    from {{ ref('dim_products')}}
),
events_calcs as (
    select 
        product_guid,
        product_views,
        product_added_to_cart,
        days_since_first_event
    from {{ ref('int_product_event_calcs')}}
),

order_item_calcs as (
    select
        product_guid,
        product_order_count
    from {{ref('int_product_order_item_calcs')}} 
),

session_calcs as (
    select product_guid,
        unique_session_views,
        unique_session_carts,
        unique_session_checkouts
    from {{ ref('int_product_session_calcs')}}
)


select 
    products.product_guid, 
    product_name,
    price,
    inventory_count,
    product_views,
    div0(product_views, days_since_first_event) as average_daily_views,
    product_added_to_cart,
    product_order_count,
    div0(product_order_count, days_since_first_event) as average_daily_orders,
    div0(product_order_count, product_views)  as orders_per_view,
    div0(unique_session_checkouts, unique_session_views) as conversion_rate,
    div0(unique_session_carts, unique_session_views) as cart_view_conversion,
    div0(unique_session_checkouts, unique_session_carts) as checkout_cart_conversion,
    unique_session_views,
    unique_session_carts,
    unique_session_checkouts
from products 
    left join events_calcs on products.product_guid = events_calcs.product_guid
    left join order_item_calcs on products.product_guid = order_item_calcs.product_guid
    left join session_calcs on products.product_guid = session_calcs.product_guid