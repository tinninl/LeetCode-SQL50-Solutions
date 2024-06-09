SELECT 'Low Salary' AS category,
COUNT(CASE WHEN income < 20000 THEN 1 ELSE NULL END) as accounts_count
FROM Accounts

UNION

SELECT 'Average Salary' AS category,
COUNT(CASE WHEN 50000 >= income AND income >= 20000 THEN 1 ELSE NULL END) as accounts_count
FROM Accounts

UNION

SELECT 'High Salary' AS category,
COUNT(CASE WHEN income > 50000 THEN 1 ELSE NULL END) as accounts_count
FROM Accounts
