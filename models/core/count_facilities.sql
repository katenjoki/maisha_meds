select 
    *,
    count(distinct facility_id) over(partition by city) as facility_count
from {{ ref("stg_sales") }}
