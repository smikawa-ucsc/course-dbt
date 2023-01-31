select 
    {{ dbt_utils.star(from=ref('int_users'))}}
from {{ ref('int_users')}}