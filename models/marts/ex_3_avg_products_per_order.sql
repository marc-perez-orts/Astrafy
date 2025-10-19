{{ config(materialized='table') }}

-- Calculate average number of products per order for each month in 2023
with products_per_order as (
  select
    order_id,
    count(distinct product_id) as product_count
  from {{ ref('stg_sales') }}
  where extract(year from date_date) = 2023
  group by order_id
),
orders_monthly as (
  select
    extract(month from s.date_date) as month,
    p.product_count
  from {{ ref('stg_sales') }} s
  join products_per_order p using (order_id)
  where extract(year from s.date_date) = 2023
)
select
  month,
  avg(product_count) as avg_products_per_order
from orders_monthly
group by month
order by month
