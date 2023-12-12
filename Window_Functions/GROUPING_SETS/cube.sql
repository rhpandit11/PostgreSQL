 SELECT
customer_id,
staff_id,
DATE(payment_date),
SUM(amount)
FROM payment
GROUP BY 
CUBE(
customer_id,
staff_id,
DATE(payment_date)
)
ORDER BY 1,2,3