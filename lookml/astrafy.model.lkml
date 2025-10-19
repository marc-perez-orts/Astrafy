# ==========================================================
# MODEL FILE: astrafy.model.lkml
# Project: Astrafy Conversational Analytics
# Part 2: Defines the LookML model connection and explores.
# ==========================================================

connection: "bigquery_connection"

# Include all view files in the same folder
include: "*.view.lkml"

explore: orders {
  label: "Orders & Customers Analysis"
  description: "Explore order volume, revenue, and customer segmentation."
  
  # Apply a default filter to focus on year 2023
  always_filter: {
    filters: {
      order_date_year: "2023"
    }
  }
}
