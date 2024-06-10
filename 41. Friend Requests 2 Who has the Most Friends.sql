/*
The Trick: However many times an id shows up in BOTH columns = num_friends
ie. if id7 shows up twice in requester and once in accepter, id7 has 3 friends
*/
SELECT requester_id AS id, -- OR select accepter_id, no diff
COUNT(*) AS num
FROM (

    SELECT requester_id FROM RequestAccepted
    UNION ALL
    SELECT accepter_id FROM RequestAccepted

) sub

GROUP BY id
ORDER BY COUNT(*) DESC
LIMIT 1