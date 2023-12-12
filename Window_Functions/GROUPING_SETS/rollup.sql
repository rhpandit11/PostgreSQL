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


-------------------------------------------------
--Write a query that calculates a booking amount rollup for the hierarchy of
--quarter, month, week in month and day.

SELECT
EXTRACT (quarter from book_date) as quarter,
EXTRACT (month from book_date) as month,
TO_CHAR(book_date, 'W') as week_in_month,
DATE(book_date),
SUM(total_amount)
FROM bookings
GROUP BY 
ROLLUP (
EXTRACT (quarter from book_date),
EXTRACT (month from book_date),
TO_CHAR(book_date, 'W'),
DATE(book_date)
)
ORDER BY 1,2,3,4