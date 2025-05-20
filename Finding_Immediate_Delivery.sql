-- Solution --
WITH CTE AS (
    SELECT 
    ROW_NUMBER() OVER(PARTITION BY customer_id ORDER BY order_date asc) as row_num ,
    (CASE WHEN customer_pref_delivery_date = order_date THEN 'immediate' ELSE 'scheduled' END) AS status
FROM Delivery
)

SELECT 
    ROUND(100.0 *SUM(CASE WHEN status = 'immediate' THEN 1 ELSE 0 END)/COUNT(*),2) AS immediate_percentage
FROM CTE
WHERE row_num = 1 ;

