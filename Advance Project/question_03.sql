-- Question 3:

-- Level: Moderate

-- Topic: JOIN

-- Task: Create a list of the film titles including their title, length and category name ordered descendingly by the length. Filter the results to only the movies in the category 'Drama' or 'Sports'.

-- Question: In which category is the longest film and how long is it?

-- Answer: Sports and 184

SELECT 
title,
length,
name
FROM film AS f
INNER JOIN film_category AS c
ON f.film_id = c.film_id
INNER JOIN category AS ct
ON c.category_id = ct.category_id
WHERE name = 'Drama' or  name = 'Sports'
ORDER BY length DESC



SELECT 
title,
name,
length
FROM film f
LEFT JOIN film_category fc
ON f.film_id=fc.film_id
LEFT JOIN category c
ON c.category_id=fc.category_id
WHERE name = 'Sports' OR name = 'Drama'
ORDER BY length DESC


