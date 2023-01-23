with users as (
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
    from {{ref('dim_users')}}
),

order_calcs as (
    select
        user_guid,
        order_total, 
        order_first_utc, 
        order_last_utc,
        order_total_cost
    from {{ ref('int_user_order_calcs')}}
)

select 
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
    order_total, 
    order_first_utc,
    order_last_utc,
    order_total_cost
from users join order_calcs on users.user_guid = order_calcs.user_guid