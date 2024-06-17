/*
Step One: Filter the single numbers (numbers that occur only once)
*/
SELECT num
FROM MyNumbers
GROUP BY num
HAVING COUNT(num) = 1

/*
Step Two: Among the single numbers, what is the biggest one? 
*/
SELECT MAX(num) as num -- A more fitting alias would be biggest_num
FROM (

    SELECT num
    FROM MyNumbers
    GROUP BY num
    HAVING COUNT(num) = 1

) single_nums