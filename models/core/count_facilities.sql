-- only facilities from cities containing more than 3 facilities should be included
select 
    *,
    count(distinct facility_id) over(partition by city) as facility_count
from {{ ref("stg_sales") }}



