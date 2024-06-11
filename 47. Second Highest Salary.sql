SELECT MIN(salary) AS SecondHighestSalary
FROM (
    SELECT DISTINCT salary
    FROM Employee 
    ORDER BY salary DESC
    LIMIT 2
) sub 
WHERE (SELECT COUNT(DISTINCT salary) FROM Employee) > 1

SELECT MAX(salary)
FROM Employee
WHERE salary < (SELECT max(salary) FROM Employee)