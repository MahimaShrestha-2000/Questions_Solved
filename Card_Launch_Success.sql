WITH CTE AS
(SELECT
  card_name,
  issued_amount,
  MAKE_DATE(issue_year,issue_month,1) as issue_date,
  MIN(MAKE_DATE(issue_year,issue_month,1)) OVER(PARTITION BY card_name) AS launch_date
FROM monthly_cards_issued
)

SELECT 
  card_name,
  issued_amount
FROM CTE
WHERE issue_date = launch_date
ORDER BY issued_amount desc
;
