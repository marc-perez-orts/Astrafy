{{ config(materialized='table') }}

-- Compute the number of past orders within 12 months for each order
with customer_orders as (
    select
        customer_id,
        order_id,
        date_date,
        -- Count how many previous orders (including current) in the last 12 months
        (
            select count(*)
            from {{ ref('stg_orders') }} o2
            where o2.customer_id = o1.customer_id
              and o2.date_date between date_sub(o1.date_date, interval 12 month) and o1.date_date
        ) as orders_last_12m
    from {{ ref('stg_orders') }} o1
    where extract(year from date_date) = 2023
)
select
    customer_id,
    order_id,
    date_date,
    case
        when orders_last_12m = 1 then 'New'
        when orders_last_12m between 2 and 4 then 'Returning'
        when orders_last_12m >= 5 then 'VIP'
    end as order_segment
from customer_orders
