select 
    order_guid, 
    user_guid, 
    promo_description, 
    address_guid, 
    created_at_utc, 
    order_cost, 
    shipping_cost, 
    order_total, 
    tracking_guid, 
    shipping_service, 
    estimated_delivery_at_utc, 
    delivered_at_utc, 
    order_status
from {{ref('stg_orders')}}