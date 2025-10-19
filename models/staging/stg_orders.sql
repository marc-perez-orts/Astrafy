{{ config(materialized='view') }}

-- Clean and normalize the orders table
select
  date_date,
  cast(customers_id as int64) as customer_id,
  cast(orders_id as int64) as order_id,
  cast(net_sales as float64) as net_sales
from {{ source('Astrafy', 'orders_recrutement') }}
where date_date is not null
