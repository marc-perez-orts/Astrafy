view: orders {
  sql_table_name: `sage-tribute-474816-g2.Astrafy_marts.ex_6_orders_2023_with_segmentation` ;;

  dimension: order_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.order_id ;;
  }

  dimension: customer_id {
    type: number
    sql: ${TABLE}.customer_id ;;
  }

  dimension_group: order_date {
    type: time
    timeframes: [date, week, month, quarter, year]
    sql: ${TABLE}.date_date ;;
  }

  dimension: order_segment {
    type: string
    sql: ${TABLE}.order_segment ;;
  }

  measure: total_orders {
    type: count_distinct
    sql: ${order_id} ;;
  }

  measure: total_customers {
    type: count_distinct
    sql: ${customer_id} ;;
  }

  measure: total_revenue {
    type: sum
    sql: ${TABLE}.net_sales ;;
    value_format_name: "usd"
  }

  measure: avg_order_value {
    type: number
    sql: ${total_revenue} / nullif(${total_orders}, 0) ;;
    value_format_name: "usd"
  }
}
