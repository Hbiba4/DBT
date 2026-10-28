{{ config(materialized='view') }}

SELECT DISTINCT
    ID AS id,
    {{ clean_string('first_name') }} AS first_name,
    {{ clean_string('last_name') }} AS last_name,
    {{ clean_string('email') }} AS email
FROM {{ source('employee_source', 'datadbt1') }}
