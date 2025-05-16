-- Solution --
WITH FirstLogin as (
    SELECT 
        player_id,
        MIN(event_date) AS first_login
    FROM Activity
    GROUP BY player_id
),
NextLogin as (
    SELECT
        f.player_id,
        f.first_login
    FROM FirstLogin f
    JOIN Activity a ON f.player_id = a.player_id AND a.event_date = DATE_ADD(f.first_login,INTERVAL 1 DAY)
)

SELECT 
     ROUND(COUNT(DISTINCT n.player_id) / COUNT(DISTINCT f.player_id),2) as fraction
FROM FirstLogin f
LEFT JOIN NextLogin n ON
n.player_id = f.player_id
;

-- +--------------+---------+
-- | Column Name  | Type    |
-- +--------------+---------+
-- | player_id    | int     |
-- | device_id    | int     |
-- | event_date   | date    |
-- | games_played | int     |
-- +--------------+---------+
-- (player_id, event_date) is the primary key (combination of columns with unique values) of this table.
-- This table shows the activity of players of some games.
-- Each row is a record of a player who logged in and played a number of games (possibly 0) before logging out on someday using some device.
 

-- Write a solution to report the fraction of players that logged in again on the day after the day they first logged in, rounded to 2 decimal places. In other words, you need to count the number of players that logged in for at least two consecutive days starting from their first login date, then divide that number by the total number of players.