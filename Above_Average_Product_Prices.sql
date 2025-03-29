-- solution --

WITH CTE as (
  SELECT 
    product_id,
    AVG(amount) as Avg_transaction_price
  FROM transactions
  GROUP BY product_id
)
SELECT 
  p.product_id as product_id,
  p.price as product_price,
  c.Avg_transaction_price as avg_transaction_price
from products p
join CTE c on 
c.product_id = p.product_id
WHERE p.price > c.Avg_transaction_price
;

--questions --
Given a table of transactions and products, write a query to return the product ID, product price, and average transaction price of all products with a price greater than the average transaction price.

Output Schema:
Column                  Type
product_id              INT
product_price           FLOAT
avg_transaction_price   FLOAT

