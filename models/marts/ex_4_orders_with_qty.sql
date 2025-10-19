{{ config(materialized='table') }}

-- Orders (2022–2023) with total quantity of products per order
with product_counts as (
    select
        order_id,
        sum(qty) as qty_product
    from {{ ref('stg_sales') }}
    where extract(year from date_date) in (2022, 2023)
    group by order_id
)
select
    o.date_date,
    o.customer_id,
    o.order_id,
    o.net_sales,
    p.qty_product
from {{ ref('stg_orders') }} o
left join product_counts p using (order_id)
where extract(year from o.date_date) in (2022, 2023)
