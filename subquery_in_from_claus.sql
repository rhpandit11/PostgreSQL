SELECT
ROUND(AVG(total_amount),2) AS avg_lifetime_spent
FROM 
(SELECT customer_id, SUM(amount) AS total_amount FROM payment
GROUP BY customer_id) AS subquery  --in postgre sql subquery in from we have to use alias other wise it won't work.
