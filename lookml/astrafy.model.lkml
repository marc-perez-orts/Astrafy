connection: "bigquery_connection"
include: "*.view.lkml"

explore: orders {
  label: "Orders & Customers Analysis"
  description: "Explore order volume, revenue, and customer segmentation."
  always_filter: {
    filters: [order_date_year: "2023"]
  }
}
