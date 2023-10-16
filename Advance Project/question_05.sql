-- Level: Moderate

-- Topic: JOIN & GROUP BY

-- Task: Create an overview of the actors first and last names and in  how many movies they appear.

-- Question: Which actor is part of most movies??

-- Answer: Susan Davis with 54 movies

SELECT
first_name,
last_name,
COUNT(title)
FROM actor a
INNER JOIN film_actor fa
ON a.actor_id=fa.actor_id
INNER JOIN film f
ON fa.film_id=f.film_id
GROUP BY first_name,last_name
ORDER BY count(title) DESC



SELECT 
first_name,
last_name,
COUNT(*)
FROM actor a
LEFT JOIN film_actor fa
ON fa.actor_id=a.actor_id
LEFT JOIN film f
ON fa.film_id=f.film_id
GROUP BY first_name, last_name
ORDER BY COUNT(*) DESC