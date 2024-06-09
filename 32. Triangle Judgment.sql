SELECT *,
CASE 
    WHEN x + y <= z THEN 'No'
    WHEN x + z <= y THEN 'No'
    WHEN y + z <= x THEN 'No'
    ELSE 'Yes'
END AS triangle
FROM Triangle

-- Alternatively:
-- This is faster bc of how sql reads AND stmnts
SELECT *,
CASE 
    WHEN x + y > z AND x + z > y AND y + z > x THEN 'Yes'
    ELSE 'No'
END AS triangle
FROM Triangle
