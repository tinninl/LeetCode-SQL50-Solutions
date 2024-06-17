/*
Step One: Use JOIN or SUBQUERY?
Lets try to JOIN (won't work)
*/

SELECT *
FROM Users u
JOIN Register r
ON u.user_id = r.user_id

/*
We run into a problem. If we group by contest_id, we cannot calculate total users
*/
SELECT *,
COUNT(r.user_id) AS users_attended -- We need to divide this by total users
FROM Users u
JOIN Register r
ON u.user_id = r.user_id
GROUP BY r.contest_id

/*
To find total users, it is a simple query:
SELECT COUNT(user_id) FROM Users
We can use this as a SUBQUERY 
*/
SELECT contest_id,
COUNT(user_id) / (SELECT COUNT(user_id) FROM Users) as percentage
FROM Register
GROUP BY contest_id

/*
Tidy it up
Calulcate as a percentage (times 100), ROUND to 2 decimal spots,
ORDER BY clause
*/
SELECT contest_id,
ROUND((COUNT(user_id) / (SELECT COUNT(user_id) FROM Users)) * 100,2) as percentage
FROM Register
GROUP BY contest_id
ORDER BY percentage DESC, contest_id
