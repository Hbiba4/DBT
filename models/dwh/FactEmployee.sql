{{ config(materialized='table') }}

SELECT
    ROW_NUMBER() OVER (ORDER BY e.ID) AS id,
    emp.id AS id_dimemployee,
    c.id AS id_dimcountry,
    g.id AS id_dimgender,
    d.id AS id_dimdepartment,
    e.salary
FROM {{ source('employee_source', 'datadbt1') }} AS e
LEFT JOIN {{ ref('DIMEmployee') }} AS emp
    ON e.ID = emp.id
LEFT JOIN {{ ref('DIMCountry') }} AS c
    ON {{ clean_string('e.country') }} = c.unique_country
LEFT JOIN {{ ref('DIMGender') }} AS g
    ON {{ clean_string('e.gender') }} = g.unique_gender
LEFT JOIN {{ ref('DIMDepartment') }} AS d
    ON {{ clean_string('e.department') }} = d.unique_department
