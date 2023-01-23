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
    from {{ ref('int_product_events')}}
),

order_item_calcs as (
    select
        product_guid,
        count(order_guid) as product_order_count
    from {{ref('stg_order_items')}} 
    group by 1
)

select 
    products.product_guid, 
    product_name,
    price,
    inventory_count,
    product_views,
    product_views / days_since_first_event as average_daily_views,
    product_added_to_cart,
    product_order_count,
    product_order_count / days_since_first_event as average_daily_orders
from products join events_calcs on products.product_guid = events_calcs.product_guid
    join order_item_calcs on products.product_guid = order_item_calcs.product_guid