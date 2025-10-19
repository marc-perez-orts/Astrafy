-- ==============================================================
-- MART 5: Customer Segmentation
-- Segments customers based on the number of orders they placed.
-- ==============================================================
WITH orders_per_customer AS (
  SELECT
    customer_id,
    COUNT(DISTINCT order_id) AS orders_count,
    SUM(net_sales) AS total_sales
  FROM {{ ref('stg_orders') }}
  GROUP BY 1
)
SELECT
  *,
  CASE
    WHEN orders_count = 1 THEN 'New'
    WHEN orders_count BETWEEN 2 AND 4 THEN 'Returning'
    ELSE 'VIP'
  END AS order_segment
FROM orders_per_customer;
