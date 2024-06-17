/*
We can use the LEAD Window Function to show us the next numbers in the sequence.
Then we use this as a subquery
*/
WITH nexts AS(

    SELECT *,
    LEAD(num,1) OVER () AS num1, 
    LEAD(num,2) OVER () AS num2,
    LEAD(id,1) OVER () AS id1, -- We also need the next ids to pass the testcases
    LEAD(id,2) OVER () AS id2 -- Since ids can be out of order and even skip some numbers just to be annoying
    FROM Logs
    ORDER BY id

)

SELECT DISTINCT num AS ConsecutiveNums
FROM nexts
WHERE num = num1 AND id = id1 - 1 AND num = num2 AND id = id2 - 2