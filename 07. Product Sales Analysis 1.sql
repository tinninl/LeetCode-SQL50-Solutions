SELECT 
p.product_name, s.year, s.price
FROM Sales s
JOIN Product p
ON s.product_id = p.product_id

/*
Notes:
product_id in the Sales table is guaranteed to have a match in the Product table
Therefore, we could have used LEFT JOIN as well
*/