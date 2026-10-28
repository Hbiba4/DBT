SELECT f.id
FROM {{ ref('FactEmployee') }} AS f
LEFT JOIN {{ ref('DIMGender') }} AS d
    ON f.id_dimgender = d.id
WHERE f.id_dimgender IS NULL OR d.id IS NULL
