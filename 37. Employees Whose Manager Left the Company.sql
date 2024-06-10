/*
Using a subquery
*/
SELECT employee_id
FROM Employees
WHERE salary < 30000 AND manager_id NOT IN (

    SELECT employee_id
    FROM Employees

)
ORDER BY employee_id

/*
Using JOINS
*/
SELECT e.employee_id
FROM Employees e
LEFT JOIN Employees m
ON e.manager_id = m.employee_id -- match employees to their managers
WHERE e.manager_id IS NOT NULL AND m.employee_id IS NULL -- find managers that no longer exist
AND e.salary < 30000
ORDER BY 1