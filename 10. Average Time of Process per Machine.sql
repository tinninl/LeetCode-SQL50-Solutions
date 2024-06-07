/*
Step 1: SELF JOIN
*/

SELECT *
FROM Activity a1
JOIN Activity a2
ON a1.machine_id = a2.machine_id 
AND a2.process_id = a2.process_id

/*
Step 2: One of the tables should show start only, the other should show end only
*/

SELECT *
FROM Activity a1
JOIN Activity a2
ON a1.machine_id = a2.machine_id AND a2.process_id = a2.process_id
WHERE a1.activity_type = 'start' AND a2.activity_type = 'end'

/*
Step 3: Calculate the AVG processing time for each machine
This tells us that we should GROUP BY machine_id.
The question also asks us to round to 3 decimal places.
*/
SELECT 
a1.machine_id,
ROUND(AVG(a2.timestamp - a1.timestamp),3) as processing_time
FROM Activity a1
JOIN Activity a2
ON a1.machine_id = a2.machine_id AND a2.process_id = a2.process_id
WHERE a1.activity_type = 'start' AND a2.activity_type = 'end'
GROUP BY a1.machine_id

