{{ config(materialized='table') }}

-- EX 1: Total number of unique orders in 2023
-- Returns a single-row table for easy consumption by dashboards/tests.
select
  count(distinct order_id) as total_orders_2023
from {{ ref('stg_orders') }}
where extract(year from date_date) = 2023
