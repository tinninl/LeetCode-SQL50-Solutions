/*
Step One: LEFT JOIN
We want to include EVERY row from Employee in our JOIN, 
therefore we can LEFT JOIN Employee to Bonus
*/

SELECT *
FROM Employee e 
LEFT JOIN Bonus b 
ON e.empId = b.empId

/*
Step Two: SELECT and WHERE
*/
SELECT e.name,b.bonus
FROM Employee e
LEFT JOIN Bonus b
ON e.empId = b.empId
WHERE b.bonus < 1000 or b.bonus IS NULL