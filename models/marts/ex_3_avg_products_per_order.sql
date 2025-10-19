{{ config(materialized='table') }}

-- EX 3: Average number of distinct products per order (monthly)
-- Approach:
-- 1) count distinct product_id per order (product count per order)
-- 2) join to orders to associate month and compute average per month
with products_per_order as (
  select
    order_id,
    count(distinct product_id) as product_count
  from {{ ref('stg_sales') }}
  where extract(year from date_date) = 2023
  group by order_id
),
orders_with_month as (
  select
    o.order_id,
    format_date('%Y-%m', o.date_date) as month,
    p.product_count
  from {{ ref('stg_orders') }} o
  join products_per_order p using (order_id)
  where extract(year from o.date_date) = 2023
)
select
  month,
  avg(product_count) as avg_products_per_order
from orders_with_month
group by month
order by month
