# Astrafy Take-Home Challenge

## Part 1 – dbt + BigQuery
All dbt models are under `/models`.
They build the following datasets:

- `Astrafy_staging`: staging tables (cleaned raw data)
- `Astrafy_marts`: analytical tables for exercises 1–6

To run:
```bash
dbt run
