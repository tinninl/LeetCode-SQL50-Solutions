SELECT d.name AS Department, e.name AS Employee, e.salary as Salary
FROM Employee e
JOIN Department d
ON d.id = e.departmentId

WHERE (e.id,e.salary) IN (

    SELECT id,salary
    FROM (

        SELECT *,
        DENSE_RANK() OVER (PARTITION BY departmentId ORDER BY salary DESC) AS salary_rank
        FROM Employee
        
    ) sub
    WHERE sub.salary_rank <= 3

)