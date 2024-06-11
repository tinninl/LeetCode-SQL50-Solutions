SELECT user_id,
UPPER(LEFT(name,1)) || LOWER(SUBSTR(name,2)) AS name --cant pipeline to concat, have to use concat function
FROM Users
ORDER BY 1