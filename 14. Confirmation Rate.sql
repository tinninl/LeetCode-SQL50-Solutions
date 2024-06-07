SELECT *
FROM Signups s
LEFT JOIN Confirmations c
ON s.user_id = c.user_id 

SELECT s.user_id,
COUNT(CASE WHEN action = 'confirmed' THEN 1 ELSE NULL END) / COUNT(*) AS confirmation_rate
FROM Signups s
LEFT JOIN Confirmations c
ON s.user_id = c.user_id
GROUP BY s.user_id

SELECT s.user_id,
ROUND(COUNT((CASE WHEN action = 'confirmed' THEN 1 ELSE NULL END) / COUNT(*)),2) AS confirmation_rate
FROM Signups s
LEFT JOIN Confirmations c
ON s.user_id = c.user_id
GROUP BY s.user_id

-- Alternatively, we can use the AVG function
SELECT s.user_id,
ROUND(AVG(CASE WHEN action = 'confirmed' THEN 1 ELSE NULL END),2) AS confirmation_rate
FROM Signups s
LEFT JOIN Confirmations c
ON s.user_id = c.user_id
GROUP BY s.user_id

-- We can even shorthand the CASE WHEN stmnt
SELECT s.user_id,
ROUND(AVG(IF(c.action = 'confirmed'),1,0)),2) AS confirmation_rate
FROM Signups s
LEFT JOIN Confirmations c
ON s.user_id = c.user_id
GROUP BY s.user_id