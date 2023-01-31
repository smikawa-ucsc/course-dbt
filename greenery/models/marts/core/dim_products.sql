select 
    {{ dbt_utils.star(from=ref('stg_products'))}}
from {{ ref('stg_products')}}