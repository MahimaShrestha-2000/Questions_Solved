-- solution --
WITH CTE AS(
    select 
        id as id,  
        name as name,
        search_id as search_id,
        query as query,
        has_clicked as has_clicked,
        search_time as search_time,
        (search_time - birthdate) as age,
        CASE WHEN (search_time - birthdate) between 0 and 9 THEN '[0-9]' 
            WHEN (search_time - birthdate) between 10 and 19 THEN '[10-19]'
            WHEN (search_time - birthdate) between 20 and 29 THEN '[20-29]' 
            WHEN (search_time - birthdate) between 30 and 39 THEN '[30-39]' 
            WHEN (search_time - birthdate) between 40 and 49 THEN '[40-49]' 
            WHEN (search_time - birthdate) between 50 and 59 THEN '[50-59]' 
            WHEN (search_time - birthdate) between 60 and 69 THEN '[60-69]' 
            WHEN (search_time - birthdate) between 70 and 79 THEN '[70-79]' 
            WHEN (search_time - birthdate) between 80 and 89 THEN '[80-89]'
            WHEN (search_time - birthdate) between 90 and 99 THEN '[90-99]' 
        END AS age_group
    from users u
    join search_events s on
    u.id = s.user_id
    WHERE DATEPART(YEAR,search_time) =2021
),
WITH_AGE_GRP_CTE AS(
    SELECT
        age_group,
        ROUND(SUM(CASE WHEN has_clicked THEN 1 ELSE 0 END)/COUNT(*),4) as click_through_rate
    FROM CTE
    GROUP BY age_group
)

SELECT 
    * FROM WITH_AGE_GRP_CTE
    ORDER BY click_through_rate DESC, age_group DESC
    limit 3
;



--question--
Given two tables, search_events and users, write a query to find the three age groups 
(bucketed by decade: 0-9, 10-19, 20-29, …,80-89, 90-99, with the end point included) with 
the highest clickthrough rate in 2021. If two or more groups have the same clickthrough rate, 
the older group should have priority.

Hint: if a user that clicked the link on 1/1/2021 who is 29 years old on that day and has a 
birthday tomorrow on 2/1/2021, they fall into the [20-29] category. If the same user clicked 
on another link on 2/1/2021, he turned 30 and will fall into the [30-39] category.

Output Schema:
Column              Type
age_group           STRING
ctr                 FLOAT

--schema--
CREATE TABLE users (
id INTEGER PRIMARY KEY,
name VARCHAR(100),
birthdate DATETIME
);

INSERT INTO users (id, name, birthdate) VALUES
(1, 'Alice', '1995-05-15'),
(2, 'Bob', '1985-03-20'),
(3, 'Charlie', '2005-07-10'),
(4, 'David', '1955-11-30'),
(5, 'Eve', '2015-09-25'),
(6, 'Frank', '1935-02-14'),
(7, 'Grace', '1975-12-01');

CREATE TABLE search_events (
search_id INTEGER PRIMARY KEY,
query VARCHAR(255),
has_clicked BOOLEAN,
user_id INTEGER,
search_time DATETIME,
FOREIGN KEY (user_id) REFERENCES users(id)
);

INSERT INTO search_events (search_id, query, has_clicked, user_id, search_time) VALUES

(1, 'travel', TRUE, 1, '2021-03-15 10:00:00'),
(2, 'books', FALSE, 1, '2021-03-15 11:00:00'),
(3, 'cars', TRUE, 2, '2021-05-20 14:30:00'),
(4, 'tech', TRUE, 2, '2021-05-20 15:00:00'),
(5, 'games', FALSE, 3, '2021-07-10 16:45:00'),
(6, 'music', FALSE, 3, '2021-07-10 17:00:00'),
(7, 'retirement', TRUE, 4, '2021-09-05 09:15:00'),
(8, 'health', FALSE, 4, '2021-09-05 10:00:00'),
(9, 'toys', FALSE, 5, '2021-11-25 13:20:00'),
(10, 'genealogy', TRUE, 6, '2021-12-01 11:30:00'),
(11, 'history', TRUE, 6, '2021-12-01 12:00:00'),
(12, 'finance', TRUE, 7, '2021-02-15 08:45:00'),
(13, 'investing', FALSE, 7, '2021-02-15 09:00:00');

-- Do not modify the schema or data definitions above

-- Implement your SQL query below, utilizing the provided schema


