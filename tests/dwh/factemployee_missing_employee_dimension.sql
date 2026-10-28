SELECT f.id
FROM {{ ref('FactEmployee') }} AS f
LEFT JOIN {{ ref('DIMEmployee') }} AS d
    ON f.id_dimemployee = d.id
WHERE f.id_dimemployee IS NULL OR d.id IS NULL
