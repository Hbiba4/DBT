-- Salary must not be negative. A passing test returns no rows.
SELECT id, salary
FROM {{ ref('FactEmployee') }}
WHERE salary < 0
