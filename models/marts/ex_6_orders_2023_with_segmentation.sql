{{ config(materialized='table') }}

-- 2023 orders with customer segmentation
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
