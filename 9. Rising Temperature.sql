/*
Step 1: SELF JOIN
What is the JOIN condition?
We want to compare dates 1 day apart
*/

SELECT *
FROM Weather present
JOIN Weather yesterday
ON DATEDIFF(present.recordDate, yesterday.recordDate) = 1

/*
Step 2: Filter the rows where present.temp > yesterday.temp
*/
SELECT *
FROM Weather present
JOIN Weather yesterday
ON DATEDIFF(present.recordDate, yesterday.recordDate) = 1
WHERE present.temperature > yesterday.temperature

/*
Step 3: SELECT
Show the ids of the PRESENT date
*/
SELECT present.id
FROM Weather present
JOIN Weather yesterday
ON DATEDIFF(present.recordDate, yesterday.recordDate) = 1
WHERE present.temperature > yesterday.temperature

/*
Alternative Solutions
*/
SELECT present.id
FROM Weather present
JOIN Weather yesterday
ON DATEDIFF(present.recordDate, yesterday.recordDate) = 1
AND present.temperature > yesterday.temperature -- Replace WHERE with AND

SELECT w1.id
FROM Weather w1, Weather w2 -- A quick way to SELF JOIN tables
WHERE DATEDIFF(w1.recordDate, w2.recordDate) = 1 AND w1.temperature > w2.temperature;

