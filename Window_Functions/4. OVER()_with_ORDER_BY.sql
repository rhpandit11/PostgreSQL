SELECT
*,
SUM(amount) 
    OVER(PARTITION BY customer_id
         ORDER BY payment_date,payment_date)
FROM payment

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
SUM(actual_arrival-scheduled_arrival) 
	OVER(ORDER BY flight_id )
FROM flights
-------------------------------------------------------------
SELECT
flight_id,
departure_airport,
SUM(actual_arrival-scheduled_arrival) 
	OVER(PARTITION BY departure_airport 
         ORDER BY flight_id DESC)
FROM flights