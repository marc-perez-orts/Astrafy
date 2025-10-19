# ==========================================================
# VIEW FILE: orders.view.lkml
# Defines dimensions and measures for the Orders model.
# Includes euro (€) formatting for all monetary fields.
# ==========================================================

view: orders {
  sql_table_name: `sage-tribute-474816-g2.Astrafy_marts.ex_6_orders_2023_with_segmentation` ;;

  # =========================
  # DIMENSIONS
  # =========================
  dimension: order_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.order_id ;;
    description: "Unique order identifier."
  }

  dimension: customer_id {
    type: number
    sql: ${TABLE}.customer_id ;;
    description: "Unique customer identifier."
  }

  dimension: order_segment {
    type: string
    sql: ${TABLE}.order_segment ;;
    description: "Customer segment: New, Returning, or VIP."
  }

  dimension_group: order_date {
    type: time
    timeframes: [date, week, month, quarter, year]
    sql: ${TABLE}.date_date ;;
    description: "Order date, available in multiple timeframes."
  }

  # =========================
  # MEASURES (€ formatting)
  # =========================
  measure: net_sales {
    type: sum
    sql: ${TABLE}.net_sales ;;
    value_format: "#,##0.00 €"
    description: "Total net sales amount in euros."
  }

  measure: total_revenue {
    type: sum
    sql: ${TABLE}.net_sales ;;
    value_format: "#,##0.00 €"
    description: "Total revenue (sum of net sales) in euros."
  }

  measure: total_orders {
    type: count_distinct
    sql: ${order_id} ;;
    description: "Distinct count of orders."
  }

  measure: total_customers {
    type: count_distinct
    sql: ${customer_id} ;;
    description: "Distinct count of customers."
  }

  measure: avg_order_value {
    type: number
    sql: ${total_revenue} / nullif(${total_orders}, 0) ;;
    value_format: "#,##0.00 €"
    description: "Average order value (AOV) calculated as revenue divided by orders."
  }
}
