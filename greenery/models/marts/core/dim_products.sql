select 
    product_guid, 
    product_name, 
    price, 
    inventory_count
from {{ ref('stg_products')}}