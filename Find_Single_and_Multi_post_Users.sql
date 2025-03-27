-- solution 1
WITH cte AS (
    SELECT user_id, job_id, COUNT(*) AS post_count
    FROM job_postings
    GROUP BY user_id, job_id
),
multi_post_users AS (
    SELECT DISTINCT user_id 
    FROM cte 
    WHERE post_count > 1
)
SELECT 
    (SELECT COUNT(DISTINCT user_id) FROM cte WHERE user_id NOT IN (SELECT user_id FROM multi_post_users)) AS single_post_users,
    (SELECT COUNT(DISTINCT user_id) FROM multi_post_users) AS multi_post_users;

--  question
Single vs Repeat Job Posters
Medium
10 Points
Given a table of job postings, write a query to retrieve the number of users that have posted each job only once and the number of users that have posted at least one job multiple times.

Output Schema:

Column

Type

single_post_users

INT

multiple_post_users

INT