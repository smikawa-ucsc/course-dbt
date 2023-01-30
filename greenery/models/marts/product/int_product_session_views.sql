select 
    product_guid, 
    count(distinct session_guid) as unique_sessions_with_view
from {{ref('stg_events')}}
where event_description = 'page_view'
group by 1