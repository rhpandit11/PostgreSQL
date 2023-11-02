SELECT
*,
SUM(amount) OVER(PARTITION BY customer_id) 
FROM payment
ORDER BY amount DESC


/*
Write a query that returns the list of movies including
- film_id,
- title,
- length,
- category,
- average length of movies in that category.
Order the results by film_id.
*/

SELECT
f.film_id ,
title,
name AS category,
length AS length_of_movie,
ROUND(AVG(length) OVER(PARTITION BY name),2) AS average_length_of_movies
FROM film f
LEFT JOIN film_category fc
ON f.film_id=fc.film_id
LEFT JOIN category c
ON fc.category_id=c.category_id
ORDER BY 1

/*
Write a query that returns all payment details including
- the number of payments that were made by this customer
and that amount
Order the results by payment_id
*/

SELECT
*,
COUNT(*) OVER(PARTITION BY amount,customer_id)
FROM payment
ORDER BY customer_id

/*
Write a query that returns the running total of how late the flights are
(difference between actual_arrival and scheduled arrival) ordered by flight_id
including the departure airport.
As a second query, calculate the same running total but partition also by the
departure airport.
*/
SELECT
flight_id,
departure_airport,
actual_arrival - scheduled_arrival AS late_duration,
SUM(actual_arrival - scheduled_arrival) OVER (ORDER BY flight_id) AS running_total
FROM flights
ORDER BY flight_id;
---------------------------------------------------------------------------------------
SELECT
flight_id,
departure_airport,
actual_arrival - scheduled_arrival AS late_duration,
SUM(actual_arrival - scheduled_arrival) OVER (PARTITION BY departure_airport ORDER BY flight_id) AS running_total
FROM flights
ORDER BY flight_id;