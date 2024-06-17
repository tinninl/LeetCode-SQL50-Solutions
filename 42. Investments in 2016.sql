/*
We need two subtables, one with unique cities, the other that groups by tiv_2015
*/

SELECT lat,lon
FROM INSURANCE 
GROUP BY lat,lon 
HAVING COUNT(*) = 1 

SELECT tiv_2015
FROM Insurance 
GROUP BY tiv_2015
HAVING COUNT(*) >= 2 

/*
Step Two: Use the above two tables as subqueries for filtering
*/

SELECT ROUND(SUM(tiv_2016),2) as tiv_2016
FROM INSURANCE
WHERE (lat, lon) IN (

    SELECT lat,lon
    FROM Insurance
    GROUP BY lat, lon
    HAVING COUNT(*) = 1

)

AND tiv_2015 IN (

    SELECT tiv_2015
    FROM Insurance
    GROUP BY tiv_2015
    HAVING COUNT(*) >= 2

)

-- Alternatively, we could use a window function to solve this
SELECT ROUND(SUM(tiv_2016),2) as tiv_2016
FROM (

    SELECT *,
    COUNT(*) OVER(PARTITION BY TIV_2015) AS CNT1,
    COUNT(*) OVER(PARTITION BY LAT, LON) AS CNT2
    FROM INSURANCE
    
) sub
WHERE CNT1 >= 2 AND CNT2 = 1
