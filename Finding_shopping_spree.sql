--Solution--
WITH CTE AS (
  SELECT 
    user_id,
    amount,
    transaction_date,
  ROW_NUMBER() OVER(PARTITION BY user_id ORDER BY transaction_date asc) as date_number
  FROM transactions
),
Difference_CTE AS (
  SELECT 
    user_id,
    transaction_date,
    date_number,
    (transaction_date - (date_number || 'days')::INTERVAL):: DATE AS date_group
  FROM CTE
),

Final_CTE AS (
SELECT 
  DISTINCT user_id,
  COUNT(date_group) >=3 AS COUNT_OF_DATE
  FROM Difference_CTE
  GROUP BY user_id, date_group
  HAVING COUNT(date_group) >=3
)

SELECT 
  user_id
FROM Final_CTE;

-- Question --
In an effort to identify high-value customers, Amazon asked for your help to obtain data about users who go on shopping sprees. A shopping spree occurs when a user makes purchases on 3 or more consecutive days.

List the user IDs who have gone on at least 1 shopping spree in ascending order.

transactions Table:
Column Name	Type
user_id	integer
amount	float
transaction_date	timestamp
transactions Example Input:
user_id	amount	transaction_date
1	9.99	08/01/2022 10:00:00
1	55	08/17/2022 10:00:00
2	149.5	08/05/2022 10:00:00
2	4.89	08/06/2022 10:00:00
2	34	08/07/2022 10:00:00
