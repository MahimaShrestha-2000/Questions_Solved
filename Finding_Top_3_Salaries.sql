-- Solution --
WITH CTE_2 AS(
    SELECT 
    DISTINCT e.salary as salary,
    e.name as name,
    d.name as Department,
    DENSE_RANK() OVER(PARTITION BY d.name ORDER BY e.salary DESC ) as r
    From Employee e 
    JOIN Department d 
    ON e.departmentId = d.id
)

SELECT 
    Department as Department,
    name as Employee,
    salary as Salary
FROM CTE_2
WHERE r <= 3
ORDER BY Department, Salary
;