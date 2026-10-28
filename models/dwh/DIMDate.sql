{{ config(materialized='table') }}

SELECT DISTINCT
    CONVERT(INT, CONVERT(CHAR(8), CAST(DOB AS DATE), 112)) AS date_key,
    CAST(DOB AS DATE) AS full_date,
    YEAR(CAST(DOB AS DATE)) AS year,
    MONTH(CAST(DOB AS DATE)) AS month,
    DAY(CAST(DOB AS DATE)) AS day
FROM {{ source('employee_source', 'datadbt1') }}
WHERE DOB IS NOT NULL
