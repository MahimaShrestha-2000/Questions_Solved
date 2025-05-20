-- Solution --
SELECT 
  ROUND(100.0*SUM(CASE WHEN call_category IS NULL OR call_category ='n/a' THEN 1 ELSE 0 END)/COUNT(*),1) as uncategorized_call_pct
FROM callers
;

-- Question --
/*Write a query to calculate the percentage of calls that cannot be categorised. Round your answer to 1 decimal place. For example, 45.0, 48.5, 57.7.

callers Table:
Column Name	Type
policy_holder_id	integer
case_id	varchar
call_category	varchar
call_date	timestamp
call_duration_secs	integer*/


