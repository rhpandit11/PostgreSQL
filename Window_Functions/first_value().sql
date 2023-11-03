--Instead of rank we also use first_value function

SELECT
*
FROM
(SELECT 
name,
country,
COUNT(*)
FIRST_VALUE(count(*)) OVER(PARTITION BY country ORDER BY count(*) DESC) AS rank,
COUNT(*) - FIRST_VALUE(count(*)) OVER(PARTITION BY country ORDER BY count(*) DESC)
FROM customer_list cl
LEFT JOIN payment p 
ON cl.customer_id=p.customer_id
GROUP BY name, country)
WHERE rank BETWEEN 1 and 3