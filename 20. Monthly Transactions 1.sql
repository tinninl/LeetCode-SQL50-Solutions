SELECT 
LEFT(trans_date, 7) AS month, -- How to extract the month (and year) from trans_date
country,
COUNT(*) AS trans_count,
COUNT(CASE WHEN state = 'approved' THEN 1 ELSE NULL END) AS approved_count,
SUM(amount) as trans_total_amount,
SUM(CASE WHEN state = 'approved' THEN amount ELSE 0 END) AS approved_total_amount
FROM Transactions
GROUP BY 1,2
