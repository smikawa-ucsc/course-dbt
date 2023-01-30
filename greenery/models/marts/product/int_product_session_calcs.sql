with product_session_views as (
    {{session_events(event_description='page_view')}}
),

product_session_checkouts as (
    {{session_events(event_description='checkout')}}
    )

select 
    v.product_guid, 
    v.unique_session_events as unique_sessions_with_view, 
    c.unique_session_events as session_checkouts
from product_session_views v left join product_session_checkouts c on v.product_guid = c.product_guid