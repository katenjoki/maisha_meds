-- a single test to ensure prices are never less than 0
select 
    city,
    facility_id,
    unit_price
from {{ ref("stg_sales")}}
where unit_price <0