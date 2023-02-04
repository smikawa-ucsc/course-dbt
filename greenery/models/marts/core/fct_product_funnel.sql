select SUM(page_view) as sessions_with_view, sum(add_to_cart) as sessions_with_cart, sum(checkout) as sessions_with_checkout
from int_session_events
