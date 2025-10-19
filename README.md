# 💡 Astrafy Take-Home Challenge  
**Candidate:** Marc Pérez Orts  
**Position:** BI Engineer / Looker Engineer  

---

## 🧱 Part 1 – Data Modeling with dbt + BigQuery
This section builds the data foundations used for analysis.  
dbt models clean, transform, and aggregate raw data from two Excel sources uploaded into BigQuery:  
- `orders_recrutement`  
- `sales_recrutement`

### 🗂️ Key dbt Models
| Model | Description |
|--------|--------------|
| `stg_orders` | Staging view standardizing raw orders data. |
| `stg_sales` | Staging view standardizing raw sales data. |
| `ex_1_total_orders` | Aggregates the total count of orders. |
| `ex_2_orders_per_month` | Monthly revenue and order trends. |
| `ex_3_avg_products_per_order` | Calculates average products per order. |
| `ex_4_orders_with_qty` | Combines quantity and sales data per order. |
| `ex_5_order_segmentation` | Segments customers (New / Returning / VIP). |
| `ex_6_orders_2023_with_segmentation` | Final dataset combining segmentation + 2023 filter. |

### 🧾 Execution
```bash
dbt debug        # Verify connection to BigQuery
dbt build        # Build all models and run tests
