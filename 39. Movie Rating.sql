/*
Step 1: How many ratings did each users create?
*/
SELECT *,
COUNT(mr.rating) as num_ratings
FROM Users u 
JOIN MovieRating mr
ON u.user_id = mr.user_id
GROUP by u.name

/*
Step 2: What are the avg ratings in Feb?
*/
SELECT *,
AVG(mr.rating) as avg_rating
FROM Movies m
JOIN MovieRating mr
ON m.movie_id = mr.movie_id
WHERE EXTRACT(YEAR_MONTH FROM created_at) = 202002
GROUP BY m.title

/*
Step Three: Move our functions into our sorting ORDER BY clause
to get the person with the most ratings and who is first alphabetically
*/

(SELECT u.name AS results
FROM Users u
JOIN MovieRating mr
ON u.user_id = mr.user_id
GROUP BY u.name
ORDER BY COUNT(mr.rating) DESC, u.name
LIMIT 1)

UNION ALL -- Step 4, UNION All our two solutions together

/*
Step 5: Do the same as in step 3
*/

(SELECT m.title AS results
FROM Movies m
JOIN MovieRating mr
ON m.movie_id = mr.movie_id
WHERE EXTRACT(YEAR_MONTH FROM created_at) = 202002
GROUP BY m.title
ORDER BY AVG(mr.rating) DESC, m.title 
LIMIT 1)