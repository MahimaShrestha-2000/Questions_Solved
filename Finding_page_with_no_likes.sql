-- Solution --
SELECT 
  p.page_id
FROM pages p
WHERE page_id NOT IN(
  SELECT page_id FROM page_likes
  WHERE page_id IS NOT NULL
)
;

-- Question --
/* Assume you're given two tables containing data about Facebook Pages and their respective likes (as in "Like a Facebook Page").

Write a query to return the IDs of the Facebook pages that have zero likes. The output should be sorted in ascending order based on the page IDs.

pages Table:
Column Name	Type
page_id	integer
page_name	varchar
pages Example Input:
page_id	page_name
20001	SQL Solutions
20045	Brain Exercises
20701	Tips for Data Analysts
page_likes Table:
Column Name	Type
user_id	integer
page_id	integer
liked_date	datetime
*/
