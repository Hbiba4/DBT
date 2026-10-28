SELECT f.id
FROM {{ ref('FactEmployee') }} AS f
LEFT JOIN {{ ref('DIMDepartment') }} AS d
    ON f.id_dimdepartment = d.id
WHERE f.id_dimdepartment IS NULL OR d.id IS NULL
