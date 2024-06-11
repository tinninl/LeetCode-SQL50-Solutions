SELECT product_name, units_sold AS unit
FROM Products p

JOIN(

    SELECT product_id,
    SUM(unit) AS units_sold
    FROM Orders
    WHERE order_date BETWEEN '2020-02-01' AND '2020-02-29'
    GROUP BY product_id
    HAVING SUM(unit) >= 100
    
) sub
ON p.product_id = sub.product_id