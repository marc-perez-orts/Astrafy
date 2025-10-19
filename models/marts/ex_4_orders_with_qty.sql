{{ config(materialized='table') }}

-- EX 4: One row per order with total product quantity (qty_product)
-- We aggregate sales lines per order to compute total qty and total line_sales.
with agg as (
  select
    order_id,
    sum(qty) as qty_product,
    sum(net_sales) as sales_from_lines
  from {{ ref('stg_sales') }}
  where extract(year from date_date) in (2022, 2023)
  group by order_id
)
select
  o.date_date,
  o.customer_id,
  o.order_id,
  o.net_sales as order_net_sales,   -- reported net sales at order-level
  coalesce(a.qty_product, 0) as qty_product,
  coalesce(a.sales_from_lines, 0) as sales_from_lines
from {{ ref('stg_orders') }} o
left join agg a using (order_id)
where extract(year from o.date_date) in (2022, 2023)
