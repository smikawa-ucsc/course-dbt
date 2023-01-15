select 
    promo_id as promo_description, 
    discount as discount_percent, -- 1-100 
    status as active_status
from {{ source('postgres','promos')}}