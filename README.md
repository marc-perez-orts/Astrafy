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
```
sage-tribute-474816-g2.Astrafy_marts
```

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
```

### ✅ Output
All dbt models are materialized into:
```
bigquery → dataset: Astrafy_marts
```
This final layer is used as the source for the LookML model and Looker Studio dashboard.

---

## 🧩 Part 2 – Semantic Layer in LookML

### 🎯 Objective
Define a semantic model in LookML to expose the dbt-transformed tables as reusable business-friendly datasets for analytics and visualization.

### 📁 Folder Structure
The LookML files are located in the **`lookml/`** directory:

```
lookml/
├── astrafy.model.lkml
└── orders.view.lkml
```

These files define:
- A **model** (`astrafy.model.lkml`) that connects to the BigQuery dataset and includes the necessary views.
- A **view** (`orders.view.lkml`) that defines dimensions, measures, and business logic derived from the final dbt model `ex_6_orders_2023_with_segmentation`.

### 💶 Currency Formatting
All monetary measures (`total_revenue`, `avg_order_value`, `net_sales`) are formatted in **euros (€)** for consistency across LookML and Looker Studio.


---

## 📊 Part 3 – BI Dashboard in Looker Studio

### 🎯 Objective
To visualize the analytical data through an interactive dashboard that provides insights into order volume, revenue, and customer segmentation for 2023.

### 🗂️ Files
In the **`dashboard_mockup/`** folder, you will find:
- **`Part_3__Design_Challenge.pdf`** → A visual mockup showing how the dashboard would look in Looker Studio, including layout, charts, and filters.

### 🔗 Live Dashboard
You can also view the published Looker Studio dashboard here:  
👉 [**Astrafy Looker Studio Report**](https://lookerstudio.google.com/reporting/e01e6a52-ddef-4eda-8928-0e7ded01eb76)


---

## ✅ Final Summary
| Component | Status | Notes |
|------------|---------|-------|
| dbt + BigQuery models | ✅ Completed | Data modeled and validated |
| LookML layer | ✅ Completed | Semantic definitions and euro formatting |
| Looker Studio dashboard | ✅ Completed | Mockup + live link provided |
| Documentation | ✅ Completed | End-to-end README |
| GitHub delivery | ✅ Completed | Repository ready for review |

---

**End of Challenge – Marc Pérez Orts (2025)**  
🚀 *End-to-end BI solution with dbt, BigQuery, LookML, and Looker Studio.*
