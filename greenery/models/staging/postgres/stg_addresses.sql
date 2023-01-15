select 
    address_id as address_guid, 
    address as street_address, 
    zipcode as postal_code, 
    state as state_fullname, 
    country as country_fullname
from {{ source('postgres','addresses')}}