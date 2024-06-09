/*
First, we need all products changed before the given date,
then we need to further filter the most recent change.
We can use the MAX function to help us.
*/
WITH MostRecentChanges AS (
    SELECT product_id,
    MAX(change_date) AS most_recent_change
    FROM Products
    WHERE change_date <= '2019-08-16'
    GROUP BY product_id
)

/*
Add all products in the table
*/
SELECT 
p.product_id, p.new_price AS price
FROM Products p
JOIN MostRecentChanges m
ON p.product_id = m.product_id AND p.change_date = m.most_recent_change

UNION

/*
Add the products that did not have any changes before the Given Date
*/
SELECT
product_id, 10 AS price -- The question tells us to treat the price as $10
From Products
GROUP BY product_id
HAVING MIN(change_date) > '2019-08-16'
