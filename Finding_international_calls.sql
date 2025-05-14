-- Solution --
SELECT 
    ROUND(100.0*SUM(CASE WHEN caller.country_id <> receiver.country_id THEN 1 ELSE NULL END)/
    COUNT(*),1 )
    AS international_calls_pct
FROM phone_calls calls
LEFT JOIN phone_info as caller ON calls.caller_id = caller.caller_id
LEFT JOIN phone_info as receiver ON calls.receiver_id = receiver.caller_id
;
