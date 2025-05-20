-- Solution --

WITH CTE AS(
    SELECT
        -- income,
        CASE WHEN income < 20000 THEN "Low Salary"
             WHEN income >= 20000 AND income <=50000 THEN "Average Salary"
             ELSE "High Salary"
        END AS category,
        1 rep
FROM Accounts

UNION ALL
SELECT 'Low Salary', 0

UNION ALL
SELECT 'Average Salary', 0

UNION ALL
SELECT 'High Salary', 0
)
SELECT
    
    category,
    SUM(rep) as accounts_count
FROM CTE
GROUP BY category;