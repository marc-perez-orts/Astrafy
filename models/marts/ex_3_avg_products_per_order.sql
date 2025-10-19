-- ==============================================================
-- MART 3: Average Number of Products per Order
-- ==============================================================
SELECT
  COUNT(DISTINCT s.products_id) / COUNT(DISTINCT s.order_id) AS avg_products_per_order
FROM {{ ref('stg_sales') }} s;
