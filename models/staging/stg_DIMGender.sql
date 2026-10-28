{{ config(materialized='view') }}

WITH distinct_genders AS (
    SELECT DISTINCT
        {{ clean_string('gender') }} AS unique_gender
    FROM {{ source('employee_source', 'datadbt1') }}
)
SELECT
    ROW_NUMBER() OVER (ORDER BY unique_gender) AS id,
    unique_gender
FROM distinct_genders
WHERE unique_gender IS NOT NULL
