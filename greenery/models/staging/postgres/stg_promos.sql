select 
    promo_id as promo_guid, 
    discount as discount_percent, -- 1-100 
    status as active_status
from {{ source('postgres','promos')}}