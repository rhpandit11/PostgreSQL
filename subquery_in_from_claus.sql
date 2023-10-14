SELECT
ROUND(AVG(total_amount),2) AS avg_lifetime_spent
FROM 
(SELECT customer_id, SUM(amount) AS total_amount FROM payment
GROUP BY customer_id) AS subquery  --in postgre sql subquery in from we have to use alias other wise it won't work.

--What is the average total amount spent per day(average daily revenue)?

SELECT 
ROUND(AVG(amount_per_day),2)
FROM 
(SELECT
SUM(amount) AS amount_per_day,
DATE(payment_date)
FROM payment
GROUP BY DATE(payment_date)) AS subquery
