select 
    user_guid,
    first_name,
    last_name,
    email,
    phone_number,
    created_at_utc,
    updated_at_utc,
    street_address,
    postal_code,
    state_fullname,
    country_fullname
from {{ ref('int_users')}}