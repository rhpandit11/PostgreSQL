SELECT
'Q'||TO_CHAR(payment_date,'Q') as quarter,
EXTRACT (month from payment_date) as month,
DATE(payment_date),
SUM(amount)
FROM payment
GROUP BY
ROLLUP(
'Q'||TO_CHAR(payment_date,'Q'),
EXTRACT (month from payment_date),
DATE(payment_date))
ORDER BY 1,2,3