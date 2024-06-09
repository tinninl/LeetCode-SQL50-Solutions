/*
Step One: INNER JOIN
*/
SELECT *
FROM Employee m -- Let m represent a table of managers
JOIN Employee e -- Let e represent a table of employees who report to the managers
ON m.employee_id = e.reports_to

/*
Step Two: Calulcating number of reports and average age
*/
SELECT 
m.employee_id, m.name,
COUNT(e.reports_to) as reports_count,
ROUND(AVG(e.age),0) as average_age
FROM Employees m
JOIN Employees e
ON m.employee_id = e.reports_to
GROUP BY m.employee_id
ORDER BY m.employee_id