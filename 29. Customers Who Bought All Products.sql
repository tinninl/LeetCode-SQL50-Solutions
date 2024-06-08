/*
Step One: How many products are there?
*/
SELECT COUNT(DISTINCT product_key) 
FROM Product -- We are told that product_keys are unique, but use DISTINCT for good practice

/*
Step Two: How many UNIQUE products has each customer bought?
*/
SELECT customer_id,
COUNT(DISTINCT product_key) as num_unique_products_bought
FROM Customer

/*
Step Three: Show customers where num_unique_products_bought = num products
Move our function into a sorting clause and combine it with our subquery
*/
SELECT customer_id
FROM Customer
GROUP BY customer_id
HAVING COUNT(DISTINCT product_key) = (SELECT COUNT(DISTINCT product_key) FROM Product)