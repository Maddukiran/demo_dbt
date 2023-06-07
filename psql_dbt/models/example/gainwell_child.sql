-- models/my_model.sql

-- Define the name of the model and the schema it belongs to
-- Replace `my_schema` and `my_model` with your own schema and model names
{{ config(
  materialized='table'
) }}

-- SQL query that defines the logic of the model
SELECT
  _airbyte_ab_id AS ab_data_id,
  json_data."Name" AS name,
  json_data."code" AS code,
  json_data."Sales office" AS sales_office,
  json_data."Customer_Code" AS customer_code,
  _airbyte_emitted_at AS ab_emitted_at
FROM
  _airbyte_raw_gainwellchild,
  jsonb_to_record(_airbyte_raw_gainwellchild._airbyte_data) AS json_data("Name" TEXT, "code" TEXT, "Sales office" TEXT, "Customer_Code" TEXT)