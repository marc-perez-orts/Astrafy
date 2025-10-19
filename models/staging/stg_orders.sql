{{ config(materialized='view') }}

-- STG: orders
-- Purpose: Normalize and type-cast raw orders_recrutement source.
-- Notes: keep minimal transformations here (type casting, null filtering).
select
  date_date,                                  -- source date column (kept as date)
  cast(customers_id as int64) as customer_id, -- normalize to int64
  cast(orders_id as int64) as order_id,       -- normalize to int64
  cast(net_sales as float64) as net_sales     -- normalize to numeric
from {{ source('Astrafy', 'orders_recrutement') }}
where date_date is not null                    -- safety: exclude rows without date
