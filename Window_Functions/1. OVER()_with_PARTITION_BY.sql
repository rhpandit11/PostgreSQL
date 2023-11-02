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
