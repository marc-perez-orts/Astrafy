{{ config(materialized='table') }}

-- Monthly order count for 2023
select
  extract(year from date_date) as year,
  extract(month from date_date) as month,
  count(distinct order_id) as orders_per_month
from {{ ref('stg_orders') }}
where extract(year from date_date) = 2023
group by 1, 2
order by year, month
