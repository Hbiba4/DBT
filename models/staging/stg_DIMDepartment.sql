{{ config(materialized='view') }}

WITH distinct_departments AS (
    SELECT DISTINCT
        {{ clean_string('department') }} AS unique_department
    FROM {{ source('employee_source', 'datadbt1') }}
)
SELECT
    ROW_NUMBER() OVER (ORDER BY unique_department) AS id,
    unique_department
FROM distinct_departments
WHERE unique_department IS NOT NULL
