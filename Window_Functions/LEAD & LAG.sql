--LEAD()

SELECT
*
FROM
(SELECT 
name,
country,
COUNT(*)
LEAD(count(*)) OVER(PARTITION BY country ORDER BY count(*) DESC) AS rank,
LEAD(count(*)) OVER(PARTITION BY country ORDER BY count(*) DESC) - COUNT(*) 
FROM customer_list cl
LEFT JOIN payment p 
ON cl.customer_id=p.customer_id
GROUP BY name, country)
WHERE rank BETWEEN 1 and 3


--LAG()

SELECT
*
FROM
(SELECT 
name,
country,
COUNT(*)
LAG(count(*)) OVER(PARTITION BY country ORDER BY count(*) DESC) AS rank,
LAG(count(*)) OVER(PARTITION BY country ORDER BY count(*) DESC) - COUNT(*) 
FROM customer_list cl
LEFT JOIN payment p 
ON cl.customer_id=p.customer_id
GROUP BY name, country)
WHERE rank BETWEEN 1 and 3

/*
Write a query that returns the revenue of the day and the revenue of the
previous day.
*/

SELECT
SUM(amount),
DATE(payment_date) AS day,
LAG(SUM(amount)) OVER(ORDER BY DATE(payment_date)) AS previous_day,
SUM(amount) - LAG(SUM(amount)) OVER(ORDER BY DATE(payment_date)) AS difference,
ROUND((SUM(amount) - LAG(SUM(amount)) OVER(ORDER BY DATE(payment_date)))
/ 
LAG(SUM(amount)) OVER(ORDER BY DATE(payment_date))*100,2) AS percentage_growth
FROM payment
GROUP BY DATE(payment_date)
