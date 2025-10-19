-- ==============================================================
-- STAGING MODEL: stg_orders
-- Cleans and standardizes the orders_recrutement source table.
-- ==============================================================
{{ config(materialized='view') }}

SELECT
    date_date,
    customers_id AS customer_id,
    orders_id AS order_id,
    net_sales
FROM {{ source('Astrafy', 'orders_recrutement') }};
