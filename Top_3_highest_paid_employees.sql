/** As part of an ongoing analysis of salary distribution within the company, your manager has requested a report identifying high earners in each department. A 'high earner' within a department is defined as an employee with a salary ranking among the top three salaries within that department.

You're tasked with identifying these high earners across all departments. Write a query to display the employee's name along with their department name and salary. In case of duplicates, sort the results of department name in ascending order, then by salary in descending order. If multiple employees have the same salary, then order them alphabetically.

Note: Ensure to utilize the appropriate ranking window function to handle duplicate salaries effectively.

**/

WITH CTE AS(
  SELECT 
  d.department_name as department_name,
  e.name as name,
  e.salary as salary,
  DENSE_RANK() OVER(PARTITION BY d.department_id ORDER BY e.salary) as row_num
  
FROM employee e INNER JOIN department d ON e.department_id = d.department_id
)

SELECT 
  department_name,
  name,
  salary
FROM CTE
WHERE row_num <=3
ORDER BY department_name ASC, salary DESC, name ASC;
/** can be done using DENSE_RANK too **/