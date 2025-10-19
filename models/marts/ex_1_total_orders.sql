{{ config(materialized='table') }}

-- Total number of unique orders placed in 2023
select
  count(distinct order_id) as total_orders_2023
from {{ ref('stg_orders') }}
where extract(year from date_date) = 2023
