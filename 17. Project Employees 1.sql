/*
Step One: LEFT JOIN
Just in case there are projects with 0 employees (which makes no sense),
we use LEFT JOIN for good practice, although INNER JOIN works too
*/
SELECT *
FROM Project p
LEFT JOIN Employee e
ON p.employee_id = e.employee_id

/*
Step Two: Calculating the average experience
*/
SELECT p.project_id,
ROUND(AVG(e.experience_years),2) as average_years
FROM Project p
LEFT JOIN Employee e
ON p.employee_id = e.employee_id
GROUP BY p.project_id
