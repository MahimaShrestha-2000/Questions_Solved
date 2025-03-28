-- solution --
WITH cte as(
  SELECT
    DATE(created_at) as date,
    COUNT(CASE WHEN action = 'post_enter' THEN 1 END) as enter_count,
    COUNT(CASE WHEN action = 'post_submit' THEN 1 END) as submit_count
from events
WHERE date(created_at)  >= '2020-01-01' and date(created_at)  <'2020-02-01'
GROUP BY date)

SELECT
    date,
    SUM(enter_count) as total_enters,
    SUM(submit_count) as total_submits,
    (SUM(submit_count) *100.00)/ NULLIF(SUM(enter_count),0) as success_rate
  from cte
;

--question -- 
Consider the events table, which contains information about the phases of writing a new social media post.
The action column can have values post_enter, post_submit, or post_canceled for when a user starts to write (post_enter), ends up canceling their post (post_cancel), or posts it (post_submit). Write a query to get the post-success rate for each day in the month of January 2020.
Note: Post Success Rate is defined as the number of posts submitted (post_submit) divided by the number of posts entered (post_enter) for each day.

Output Schema:
Column         Type
date            DATE
total_enters    INT
total_submits   INT
success_rate    FLOAT