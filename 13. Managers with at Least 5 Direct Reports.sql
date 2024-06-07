/*
Step 1: Decide which JOIN to use
We only want to look at employees with a manager, 
therefore we can use INNER JOIN
*/
SELECT *
FROM Employee m -- m for managers
JOIN Employee e
ON m.id = e.managerId

/*
Step 2: Show the number of direct reports each manager has
*/
SELECT *,
COUNT(m.id) as num_reports
FROM Employee m
JOIN Employee e
ON m.id = e.managerId
GROUP BY m.id

/*
Step 3: Finalize the SELECT and put our COUNT function in the HAVING clause
*/
Select m.name
FROM Employee m
JOIN Employee e
ON m.id = e.managerId
GROUP BY m.id -- Note: Do not GROUP BY manager name. Why not? What if two managers have the same name?
HAVING COUNT(m.id) >= 5