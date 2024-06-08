/*
Step One: LEFT JOIN
We want to look at every product in Prices table, so we should use LEFT JOIN.
Joining on product_id is rather intuitive, but remember to join the correct dates too
*/
SELECT *
FROM Prices p
JOIN UnitsSold us
ON p.product_id = us.product_id 
AND p.purchase_date BETWEEN us.start_date AND us.end_date

/*
Step Two: Setting up our calculations
As explained in the question desc., the average selling price is simply
total_profit / units_sold
*/
SELECT *,
SUM(p.price * us.units) AS total_profit,
SUM(us.units) AS units_sold
FROM Prices p
JOIN UnitsSold us
ON p.product_id = us.product_id 
AND purchase_date BETWEEN start_date AND end_date
GROUP BY p.product_id

/*
Step Three: Putting it together
We are asked to round to two decimal spots.
We use COALESCE to show the average price of products with no units sold as 0 
instead of a NULL value.
*/
SELECT p.product_id,
COALESCE(ROUND(SUM(p.price * us.units) / SUM(us.units),0),0) AS average_price
FROM Prices p
JOIN UnitsSold us
ON p.product_id = us.product_id 
AND purchase_date BETWEEN start_date AND end_date
GROUP BY p.product_id
