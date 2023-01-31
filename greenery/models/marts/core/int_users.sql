with users as (
    select 
        {{dbt_utils.star(from=ref('stg_users'))}}
    from {{ ref('stg_users')}}
),
addresses as (
    select   
     {{dbt_utils.star(from=ref('stg_addresses'))}}
    FROM {{ref('stg_addresses')}}
)

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
from users join addresses on users.address_guid = addresses.address_guid