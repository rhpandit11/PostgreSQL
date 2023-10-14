-- Correlated Subquery in SELECT
-- Show the maximum amount for every customer

SELECT *,
(SELECT MAX(amount) FROM payment p2
WHERE p1.customer_id = p2.customer_id)
FROM payment p1
ORDER BY customer_id


--Show all the payments plus the total amount for every customer as well as the
--number of payments of each customer.

SELECT 
payment_id, 
customer_id, 
staff_id, amount,
(SELECT SUM(amount) as sum_amount 
 FROM payment p2
 WHERE p1.customer_id=p2.customer_id),
(SELECT COUNT(amount) as count_payments
 FROM payment p2
 WHERE p1.customer_id=p2.customer_id)
FROM payment p1
ORDER BY customer_id,amount DESC

--Correlated Subquery in WHERE and SELECT
--SHOW only the highest replacement costs
--for each rating
--and their average

SELECT
title,
replacement_cost,
rating,
(SELECT AVG(replacement_cost) FROM film f2
		WHERE f1.rating=f2.rating)
FROM film f1
WHERE replacement_cost = (SELECT MAX(replacement_cost) FROM film f3
						 WHERE f1.rating=f3.rating)


--Correlated Subquery mit join
--Show the top payments for each customer including the payment_id

SELECT
first_name,
amount,
payment_id
FROM payment p1
INNER JOIN customer c
on p1.customer_id=c.customer_id
WHERE amount = (SELECT MAX(amount) FROM payment p2
			   WHERE p1.customer_id=p2.customer_id)

--How would you solve it if you would not used payment_id

SELECT
first_name,
MAX(amount)
FROM payment p1
INNER JOIN customer c
on p1.customer_id=c.customer_id
GROUP BY first_name
