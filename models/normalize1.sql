-- models/my_model.sql

-- Define the name of the model and the schema it belongs to
-- Replace `my_schema` and `my_model` with your own schema and model names
{{ config(
  materialized='view',
  schema='my_schema',
  alias='psql_dbt'
) }}

-- SQL query that defines the logic of the model
SELECT
  *
FROM
  _airbyte_raw_gainwellchild
-- WHERE
  -- Add any additional filtering or transformation logic here
  -- column1 > 0
