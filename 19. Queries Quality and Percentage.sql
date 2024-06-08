SELECT 
query_name, 
ROUND(AVG(rating / position),2) AS quality,
ROUND(AVG(CASE WHEN rating < 3 THEN 1 ELSE 0 END) * 100,2) AS poor_query_percentage
FROM Queries
WHERE query_name IS NOT NULL -- Pass last testcase where query_name has NULL values
GROUP BY query_name

/*
Calculate both quality and percentage using AVG
Use a CASE WHEN within the percentage calculation
*/