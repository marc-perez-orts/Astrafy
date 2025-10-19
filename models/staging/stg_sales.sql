-- ==============================================================
-- STAGING MODEL: stg_sales
-- Cleans and standardizes the sales_recrutement source table.
-- ==============================================================
{{ config(materialized='view') }}

SELECT
    date_date,
    customer_id,
    order_id,
    products_id,
    net_sales,
    qty
FROM {{ source('Astrafy', 'sales_recrutement') }};
