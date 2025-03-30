-- solution --
SELECT COUNT(DISTINCT user_id) as upsold_customer_count
  FROM(
      select
        user_id
      from transactions 
      group by user_id 
      having count(distinct DATE(created_at)) >1  
  )
;

-- question --
We’re given a table of product purchases. Each row in the table represents an individual user product purchase.

Write a query to get the number of customers that were upsold by purchasing additional products.

Note: If a customer purchased multiple products on the same day, it does not count as an upsell. An upsell is considered only if they made purchases on separate days

Output Schema:

Column                      Type
upsold_customer_count       INT

