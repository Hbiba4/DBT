{{ config(materialized='view') }}

SELECT
    e.ID AS id,
    e.first_name,
    e.last_name,
    e.email,
    e.salary,
    e.DOB,
    e.gender,
    e.department,
    e.country,
    g.id AS id_dimgender,
    d.id AS id_dimdepartment,
    c.id AS id_dimcountry
FROM {{ source('employee_source', 'datadbt1') }} AS e
LEFT JOIN {{ ref('stg_DIMGender') }} AS g
    ON {{ clean_string('e.gender') }} = g.unique_gender
LEFT JOIN {{ ref('stg_DIMDepartment') }} AS d
    ON {{ clean_string('e.department') }} = d.unique_department
LEFT JOIN {{ ref('stg_DIMCountry') }} AS c
    ON {{ clean_string('e.country') }} = c.unique_country
