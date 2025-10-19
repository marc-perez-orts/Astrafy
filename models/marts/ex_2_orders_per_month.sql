-- ==============================================================
-- MART 2: Orders per Month
-- Calculates total orders and total revenue aggregated by month.
-- ==============================================================
SELECT
  FORMAT_DATE('%Y-%m', date_date) AS month,
  COUNT(DISTINCT order_id) AS total_orders,
  SUM(net_sales) AS total_revenue
FROM {{ ref('stg_orders') }}
GROUP BY 1
ORDER BY 1;
