with numbered_rows as (
    select 
        *,
        --create primary key
        row_number() over (order by (select 1)) as id,
    from {{ source("country_sales","sales_data")}}
)
select 
    id,
    facility_id,
    country,
    city,
    sold_product_created_at as time_of_sale,
    quantity_sold,
    unit_price,
    api_sold_product as product_name
from numbered_rows

