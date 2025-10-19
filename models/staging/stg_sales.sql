{{ config(materialized='view') }}

-- Clean and normalize the sales table
select
  date_date,
  cast(customer_id as int64) as customer_id,
  cast(order_id as int64) as order_id,
  cast(products_id as int64) as product_id,
  cast(net_sales as float64) as net_sales,
  cast(qty as int64) as qty
from {{ source('Astrafy', 'sales_recrutement') }}
where date_date is not null
