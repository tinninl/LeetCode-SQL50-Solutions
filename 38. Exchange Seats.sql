/*
Find the next and prev students
*/
SELECT *,
LEAD(student,1) OVER() as next,
LAG(student,1) OVER() as prev
FROM Seat

/*
Use a CASE WHEN to swap student positions
In the case of an odd number of ids, the last seat is NOT switched, so use COALESCE
*/
SELECT id,
    CASE 
        WHEN (id % 2 = 1) THEN COALESCE(LEAD(student,1) OVER(),student)
        ELSE LAG(student,1) OVER()
    END AS student
FROM Seat