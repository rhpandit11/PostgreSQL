-- Question 7:

-- Level: Moderate

-- Topic: JOIN & GROUP BY

-- Task: Create an overview of the cities and how much sales (sum of amount) have occured there.

-- Question: Which city has the most sales?

-- Answer: Cape Coral with a total amount of 221.55

SELECT
city,
SUM(amount)
FROM payment p
INNER JOIN customer c
ON p.customer_id=c.customer_id
INNER JOIN address a
ON c.address_id=a.address_id
INNER JOIN city ci
ON a.city_id=ci.city_id
GROUP BY city
ORDER BY 2 desc


SELECT 
city,
SUM(amount)
FROM payment p
LEFT JOIN customer c
ON p.customer_id=c.customer_id
LEFT JOIN address a
ON a.address_id=c.address_id
LEFT JOIN city ci
ON ci.city_id=a.city_id
GROUP BY city
ORDER BY city DESC