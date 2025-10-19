-- ==============================================================
-- MART 1: Total Orders
-- Returns the total number of distinct orders.
-- ==============================================================
SELECT
  COUNT(DISTINCT order_id) AS total_orders
FROM {{ ref('stg_orders') }};
