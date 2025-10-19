{{ config(materialized='table') }}

-- EX 5: Customer segmentation for each order in 2023
-- Segments:
--  - New: only 1 order in the last 12 months (including current)
--  - Returning: 2-4 orders in the last 12 months
--  - VIP: 5+ orders in the last 12 months
--
-- Implementation notes:
--  - BigQuery does not allow RANGE BETWEEN '12 months' on DATE in the same way as numeric offsets.
--  - Use a correlated subquery to count orders for the same customer within [order_date - 12 months, order_date].
--  - This approach is clear and correct for dataset sizes used in take-home challenges.
with orders_in_2023 as (
  select
    o1.customer_id,
    o1.order_id,
    o1.date_date,
    (
      select count(*)
      from {{ ref('stg_orders') }} o2
      where o2.customer_id = o1.customer_id
        and o2.date_date between date_sub(o1.date_date, interval 12 month) and o1.date_date
    ) as orders_last_12m
  from {{ ref('stg_orders') }} o1
  where extract(year from o1.date_date) = 2023
)
select
  customer_id,
  order_id,
  date_date,
  case
    when orders_last_12m = 1 then 'New'
    when orders_last_12m between 2 and 4 then 'Returning'
    when orders_last_12m >= 5 then 'VIP'
    else 'Unknown'
  end as order_segment
from orders_in_2023
