SELECT f.id
FROM {{ ref('FactEmployee') }} AS f
LEFT JOIN {{ ref('DIMCountry') }} AS d
    ON f.id_dimcountry = d.id
WHERE f.id_dimcountry IS NULL OR d.id IS NULL
