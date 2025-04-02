-- Finding a liker's like --
-- Solution --
SELECT 
  l1.liker_id AS user,
  COUNT(DISTINCT l2.liker_id) AS count
  FROM likes l1
JOIN likes l2 on l1.liker_id = l2.user_id
GROUP BY l1.liker_id;

-- QUESTION --
A dating website’s schema is represented by a table of people that like other people. The table has three columns. One column is the user_id, another column is the liker_id which is the user_id of the user doing the liking, and the last column is the date time that the like occurred.

Write a query to count the number of liker’s likers (the users that like the likers) if the liker has one.

Output Schema:
Column              Type
user                STRING
count               INT
