{{ config(materialized='table') }}

-- EX 2: Orders per month in 2023 + revenue
-- month is returned as yyyy-mm string for easy labeling in visualizations.
select
  format_date('%Y-%m', date_date) as month,
  count(distinct order_id) as orders_per_month,
  sum(net_sales) as revenue_per_month
from {{ ref('stg_orders') }}
where extract(year from date_date) = 2023
group by 1
order by 1
