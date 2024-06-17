/*
We note that there are two ways that make a primary dept.
They are simple, 
but one way needs a aggregate function where the other needs the whole table

We can use UNION to combine two simple queries together
*/

SELECT employee_id, department_id 
FROM Employee
WHERE primary_flag = 'Y'

UNION

SELECT employee_id, department_id
FROM Employee
GROUP BY 1
HAVING COUNT(2) = 1



