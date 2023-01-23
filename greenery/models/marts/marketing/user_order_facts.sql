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
orders as (
    select 
        order_guid, 
        user_guid, 
        promo_description, 
        address_guid, 
        created_at_utc, 
        order_cost, 
        shipping_cost, 
        order_total, 
        tracking_guid, 
        shipping_service, 
        estimated_delivery_at_utc, 
        delivered_at_utc, 
        order_status
    from {{ ref('fct_orders')}}
),

order_calcs as (
    select
        user_guid,
        count(order_guid, user_guid) as order_total, 
        min(created_at_utc) as order_first_utc, 
        max(created_at_utc) as order_last_utc,
        sum(order_cost) as order_total_cost
    from orders
    group by 1
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