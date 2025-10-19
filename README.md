# 💡 Astrafy Take-Home Challenge  
**Candidate:** Marc Pérez Orts  
**Position:** BI Engineer / Looker Engineer  
**Date:** October 2025  

---

## 🧩 Project Overview
This repository contains the complete solution for the **Astrafy BI Engineer / Looker Engineer Take-Home Challenge**.  
It demonstrates end-to-end analytics engineering skills — from data modeling in dbt and BigQuery, to semantic modeling in LookML, and visualization in Looker Studio.

The project is divided into **three main parts:**

1. **Part 1 – Data Modeling with dbt + BigQuery**  
2. **Part 2 – Semantic Layer in LookML**  
3. **Part 3 – BI Dashboard in Looker Studio**

Each part is fully developed, validated, and documented below.

---

## 🧱 Part 1 – Data Modeling with dbt + BigQuery

### 🎯 Objective
To clean, transform, and model the provided raw datasets (`orders_recrutement` and `sales_recrutement`) into a set of analytical tables that can be easily consumed by BI tools such as Looker or Looker Studio.

### 🗂️ Datasets
Two Excel files were imported into BigQuery:
- **`sage-tribute-474816-g2.Astrafy.orders_recrutement`**  
- **`sage-tribute-474816-g2.Astrafy.sales_recrutement`**

These tables were cleaned and joined to create the final analytics layer under the schema:

### 🧾 Key Models
| Model | Description |
|--------|--------------|
| `stg_orders` | Cleans and prepares order-level data |
| `stg_sales` | Cleans and prepares product sales data |
| `ex_1_total_orders` | Calculates overall order count |
| `ex_2_orders_per_month` | Monthly breakdown of orders |
| `ex_3_avg_products_per_order` | Calculates average products per order |
| `ex_4_orders_with_qty` | Joins order and product quantities |
| `ex_5_order_segmentation` | Defines segmentation logic (New / Returning / VIP) |
| `ex_6_orders_2023_with_segmentation` | Final analytical dataset for 2023 |

### ⚙️ Execution
Run the dbt pipeline:
```bash
dbt debug     # Validate BigQuery connection
dbt build     # Execute all transformations and tests
