select
    product_guid,
    count(order_guid) as product_order_count
from {{ref('stg_order_items')}} 
group by 1