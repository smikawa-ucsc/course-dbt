with users as (
    select 
        {{dbt_utils.star(from=ref('stg_users'))}}
    from {{ ref('stg_users')}}
),
addresses as (
    select   
        {{dbt_utils.star(from=ref('stg_addresses'))}}
    FROM {{ref('stg_addresses')}}
),
user_sessions as (
    select 
        {{dbt_utils.star(from=ref('fct_user_sessions'))}}
    from {{ref('fct_user_sessions')}}
    

)

select 
    users.user_guid,
    first_name,
    last_name,
    email,
    phone_number,
    created_at_utc,
    updated_at_utc,
    street_address,
    postal_code,
    state_fullname,
    country_fullname,
    sessions_with_page_view,
    sessions_with_add_to_cart,
    sessions_with_checkout
from users 
    join addresses on users.address_guid = addresses.address_guid
    join user_sessions on users.user_guid = user_sessions.user_guid
