{{ config(materialized='table') }}

-- EX 6: Final 2023 orders table with customer segmentation
-- Join staging orders with segmentation table per order.
select
  o.date_date,
  o.customer_id,
  o.order_id,
  o.net_sales,
  s.order_segment
from {{ ref('stg_orders') }} o
left join {{ ref('ex_5_order_segmentation') }} s
  using (order_id, customer_id)
where extract(year from o.date_date) = 2023
