select 
    facility_id,
    country,
    city,
    sold_product_created_at as time_of_sale,
    quantity_sold,
    unit_price,
    api_sold_product as product_name
from {{ source("country_sales","sales_data")}}

