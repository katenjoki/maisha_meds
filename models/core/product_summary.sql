{{
    config(
        materialised = 'table'
    )
}}

-- only facilities from cities containing more than 3 facilities should be included for data privacy reasons

with sales_data as (
    select * from {{ ref("count_facilities") }}
)

select 
    country,
    product_name,
    sum(quantity_sold) as total_sold,
    avg(unit_price) as average_price,
    min(time_of_sale) as first_sale,
    max(time_of_sale) as most_recent_sale 
from sales_data
where facility_count > 3
group by country, product_name