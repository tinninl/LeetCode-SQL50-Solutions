SELECT 
ROUND(COUNT(sub.player_id) / COUNT(DISTINCT a.player_id),2) AS fraction
FROM Activity a
LEFT JOIN (

    SELECT player_id,
    MIN(event_date) as first_login
    FROM Activity 
    GROUP BY player_id

) sub
ON a.player_id = sub.player_id 
AND DATEDIFF(a.event_date, sub.first_login) = 1