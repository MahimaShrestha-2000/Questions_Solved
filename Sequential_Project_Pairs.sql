-- Solution to finding the sequential project pairs"
-- Used CTEs and INNER JOIN -- 

WITH start_date_project as(
  select 
    start_date,
    title as title_start
from projects
),

end_date_project as (
  select 
    end_date,
    title as title_end
  from projects
)
select 
  title_end as project_title_end,
  title_start as project_title_start,
  DATE(e.end_date)as date
from end_date_project e
INNER JOIN start_date_project s on
e.end_date = s.start_date;

-- question --
Write a query to return pairs of projects where the end date of one project matches the start date of another project.

Output Schema:
Column                      Type
project_title_end           STRING
project_title_start         STRING
date                        DATE