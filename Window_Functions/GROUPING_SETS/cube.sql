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

-------------------------

--Write a query that returns all grouping 
--sets in all combinations of customer_id, date and title with the aggregation of the payment amount.

SELECT 
p.customer_id,
DATE(payment_date),
title,
SUM(amount) as total
FROM payment p
LEFT JOIN rental r
ON r.rental_id=p.rental_id
LEFT JOIN inventory i
ON i.inventory_id=r.inventory_id
LEFT JOIN film f
ON f.film_id=i.film_id
GROUP BY 
CUBE(
p.customer_id,
DATE(payment_date),
title
)
ORDER BY 1,2,3