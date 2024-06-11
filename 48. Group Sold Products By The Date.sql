SELECT sell_date,
COUNT(DISTINCT product) as num_sold,
GROUP_CONCAT(DISTINCT product ORDER BY product ASC SEPARATOR ',') AS products
FROM Activities
GROUP BY 1
ORDER BY 1