/*Assume you're given a table containing data on Amazon customers and their spending on products 
in different category, write a query to identify the top two highest-grossing products within 
each category in the year 2022. The output should include the category, product, and total spend.*/

WITH cte as (
    SELECT
        category,
        product,
        SUM(spend) AS total_spend,
        ROW_NUMBER() OVER(PARTITION BY category ORDER BY total_spend DESC) AS row_number
    FROM product_spend
    WHERE DATEPART(year,transaction_date) = 2022
)

SELECT 
    category,
    product,
    total_spend

FROM cte 
WHERE row_number <= 2
ORDER BY category, total_spend ;

/* can also be done using RANK() and DENSE_RANK()