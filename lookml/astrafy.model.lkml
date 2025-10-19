# ==========================================================
# MODEL FILE: astrafy.model.lkml
# Project: Astrafy Conversational Analytics
# Defines the LookML model connection and explores.
# ==========================================================

connection: "bigquery_connection"

# Include all view files in the same directory
include: "*.view.lkml"

explore: orders {
  label: "Orders & Customers Analysis"
  description: "Explore order volume, revenue, and customer segmentation."
  always_filter: {
    filters: {
      order_date_year: "2023"
    }
  }
}
