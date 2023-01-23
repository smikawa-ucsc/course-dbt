    select
        user_guid,
        count(order_guid, user_guid) as order_total, 
        min(created_at_utc) as order_first_utc, 
        max(created_at_utc) as order_last_utc,
        sum(order_cost) as order_total_cost
    from {{ ref('fct_orders')}}
    group by 1