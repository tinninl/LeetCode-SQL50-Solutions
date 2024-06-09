/*
Get every person who can fit on the bus (weight <= 1000)
Who was the last person to get on? What is max turn?
*/

SELECT 
person_name
FROM (

    SELECT *,
    SUM(weight) OVER (ORDER BY turn) as running_total_weight
    FROM Queue

) sub

WHERE sub.running_total_weight <= 1000
ORDER BY turn DESC
LIMIT 1