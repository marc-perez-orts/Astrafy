-- ==============================================================
-- MART 4: Orders Enriched with Total Quantity and Sales
-- ==============================================================
SELECT
  o.order_id,
  o.customer_id,
  o.date_date,
  SUM(s.qty) AS total_qty,
  SUM(s.net_sales) AS total_sales
FROM {{ ref('stg_orders') }} o
LEFT JOIN {{ ref('stg_sales') }} s
  ON o.order_id = s.order_id
GROUP BY 1, 2, 3;
