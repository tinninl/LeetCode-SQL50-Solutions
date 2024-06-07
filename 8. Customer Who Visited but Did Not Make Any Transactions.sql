/*
Step 1: Which JOIN should we use?
We want to examine the customers who made no transactions.
Therefore, we should look at the rows in the Transaction table where transaction_id IS NULL.
A LEFT JOIN should do the trick.
*/

SELECT *
FROM Visits v
LEFT JOIN Transactions t 
ON v.visit_id = t.visit_id

-- Step 2. Filter the rows with no transactions 
SELECT *
FROM Visits v
LEFT JOIN Transactions t 
ON v.visit_id = t.visit_id
WHERE t.transaction_id IS NULL 

-- Step 3. Apply COUNT and GROUP BY
SELECT 
v.customer_id, 
COUNT(*) as count_no_trans
FROM Visits v
LEFT JOIN Transactions t 
ON v.visit_id = t.visit_id
WHERE t.transaction_id IS NULL
GROUP BY 1


