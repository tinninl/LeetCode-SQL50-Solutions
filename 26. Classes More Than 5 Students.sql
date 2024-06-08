/*
Step One: How many students does each class have?
*/
SELECT class,
COUNT(student) as num_students
FROM Courses
GROUP BY 1

/*
Step Two: Place our function in a HAVING clause
*/
SELECT class
FROM Courses
GROUP BY class
HAVING COUNT(student) >= 5