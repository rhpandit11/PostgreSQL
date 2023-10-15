-- Level: Moderate

-- Topic: JOIN & GROUP BY

-- Task: Create an overview of how many movies (titles) there are in each category (name).

-- Questi: Which category (name) is the most comm among the films?

-- Answer: Sports with 74 titles

SELECT 
name,
count(title)
FROM film AS f
INNER JOIN film_category AS fc
ON f.film_id = fc.film_id
INNER JOIN category AS c
ON c.category_id = fc.category_id
GROUP BY name
ORDER BY count(title) desc

SELECT
name,
COUNT(title)
FROM film f
INNER JOIN film_category fc
ON f.film_id=fc.film_id
INNER JOIN category c
ON c.category_id=fc.category_id
GROUP BY name
ORDER BY 2 DESC