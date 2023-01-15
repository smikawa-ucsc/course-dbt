select 
    order_id as order_guid, 
    user_id as user_guid, 
    promo_id as promo_guid, 
    address_id as address_guid, 
    created_at::timestampntz as created_at_utc, 
    order_cost, 
    shipping_cost, 
    order_total, 
    tracking_id as tracking_guid, 
    shipping_service, 
    estimated_delivery_at::timestampntz as estimated_delivery_at_utc, 
    delivered_at::timestampntz as delivered_at_utc, 
    status as order_status
from {{ source('postgres','orders')}}