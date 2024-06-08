/*
This question needs to join to a subquery
*/

/*
Step One: Creating the subquery.
We need the first orders for each customer. We can use the following as a subquery
*/
SELECT customer_id,
MIN(order_date) AS first_order
FROM Delivery
GROUP BY customer_id

/*
Joining the two tables
*/
SELECT *
FROM Delivery d 
JOIN (

    SELECT customer_id,
    MIN(order_date) AS first_order
    FROM Delivery
    GROUP BY customer_id

) sub
ON d.customer_id = sub.customer_id AND d.order_date = sub.first_order

/*
Step Three: Intermediate step: Displaying the immediate orders 
*/
SELECT *,
CASE WHEN d.order_date = d.customer_pref_delivery_date 
THEN 'immediate' ELSE 'scheduled' END as order_type
FROM Delivery d 
JOIN (

    SELECT customer_id,
    MIN(order_date) AS first_order
    FROM Delivery

) sub
ON d.customer_id = sub.customer_id AND d.order_date = sub.first_order

/*
Step Four: Finalize the solution
*/
SELECT 
ROUND(AVG(CASE WHEN d.order_date = d.customer_pref_delivery_date THEN 1 ELSE 0 END) * 100, 2)
AS immediate_percentage
FROM Delivery d 
JOIN (

    SELECT customer_id,
    MIN(order_date) AS first_order
    FROM Delivery
    GROUP BY customer_id

) sub
ON d.customer_id = sub.customer_id AND d.order_date = sub.first_order


-- alternatively, use IN instead of JOIN


