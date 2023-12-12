SELECT
first_name,
last_name,
staff_id,
SUM(amount)
FROM customer c
LEFT JOIN payment p
ON c.customer_id=p.customer_id
GROUP BY
	GROUPING SETS (
	(first_name,last_name),
	(first_name, last_name, staff_id))

-------------------------------------------

SELECT
TO_CHAR(payment_date,'Monthe') as Month,
staff_id,
SUM(amount)
FROM payment
GROUP BY
GROUPING SETS (
    (staff_id),
    (Month),
    (staff_id,Month)
)