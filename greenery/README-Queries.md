How many users do we have?
    select count(*) from stg_users
    *30

On average, how many orders do we receive per hour?
    select avg(*) from
    (select COUNT(*) from stg_orders
    GROUP BY datediff('h',current_timestamp(),created_at))
    *7.52

On average, how long does an order take from being placed to being delivered?
    select avg(*) from (select datediff('d',created_at,delivered_at) 
    from stg_orders
    where delivered_at is not null)
    *3.89 days; excluding orders that have been shipped, but not delivered.

How many users have only made one purchase? Two purchases? Three+ purchases?
    select count(*), ordercount
    from(
    select count(order_id) as ordercount, stg_users.user_id
    from stg_users join stg_orders on stg_users.user_id = stg_orders.user_id
    group by stg_users.user_id)
    group by ordercount
    order by ordercount
    1 - 25
    2 - 28
    3+ - 34+20+10+2+4+1= 71

Note: you should consider a purchase to be a single order. In other words, if a user places one order for 3 products, they are considered to have made 1 purchase.

On average, how many unique sessions do we have per hour?
    select avg(session_count)
    from
    (select count(distinct session_id) as session_count, datediff('h',current_timestamp,created_at) 
    from stg_events
    GROUP BY datediff('h',current_timestamp,created_at)) 
    *16.33