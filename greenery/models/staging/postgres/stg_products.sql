select 
    product_id as product_guid, 
    name as product_name, 
    price, 
    inventory as inventory_count
from {{ source('postgres','products')}}