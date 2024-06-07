/*
Step One: CROSS JOIN Students and Subjects
How can we connect the Exams table to Students and Subjects?
First, we need to JOIN the Students and Subjects tables
We can use CROSS JOIN to create the cartesian product of the two tables,
Since there is no key to JOIN them otherwise.
*/
SELECT *
FROM Students s
CROSS JOIN Subjects sub

/*
Step Two: LEFT JOIN using student_id and subject_name as our primary key
*/
SELECT *
FROM Students s
CROSS JOIN Subjects sub
LEFT JOIN Examinations e
ON e.student_id = s.student_id AND e.subject_name = sub.subject_name

/*
Step Three: SELECT and COUNT the number of exams each student attended
*/
SELECT s.student_id, s.student_name, sub.subject_name,
COUNT(e.student_id) as attended_exams -- We need to count a column in the Exams table
FROM Students s
CROSS JOIN Subjects sub
LEFT JOIN Examinations e
ON e.student_id = s.student_id AND e.subject_name = sub.subject_name
GROUP BY 1, 3 -- GROUP BY and ORDER BY student_id then subject_name
ORDER BY 1, 3



