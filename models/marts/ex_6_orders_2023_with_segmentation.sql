-- ==============================================================
-- MART 6: Orders 2023 with Segmentation
-- Combines order data with customer segmentation for year 2023.
-- ==============================================================
SELECT
  o.date_date,
  o.order_id,
  o.customer_id,
  s.order_segment,
  o.net_sales
FROM {{ ref('stg_orders') }} o
LEFT JOIN {{ ref('ex_5_order_segmentation') }} s
  ON o.customer_id = s.customer_id
WHERE EXTRACT(YEAR FROM o.date_date) = 2023;
