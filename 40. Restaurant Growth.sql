-- How to create a moving window? Need a window for 7 days
WITH sub AS (

    SELECT DISTINCT visited_on, -- What would happen if we did not include DISTINCT?
    SUM(amount) OVER (ORDER BY visited_on RANGE BETWEEN INTERVAL 6 DAY PRECEDING AND CURRENT ROW) AS weekly_amount
    FROM Customer

)

SELECT visited_on, weekly_amount AS amount,
ROUND(weekly_amount / 7, 2) AS average_amount
FROM sub
WHERE visited_on >= (SELECT MIN(visited_on) FROM Customer) + 6 
-- Only start on the rows where a week has passed