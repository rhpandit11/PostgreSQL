-- Question 8:

-- Level: Moderate to difficult

-- Topic: JOIN & GROUP BY

-- Task: Create an overview of the revenue (sum of amount) grouped by a column in the format "country, city".

-- Question: Which country, city has the least sales?

-- Answer: United States, Tallahassee with a total amount of 50.85.

SELECT
country ||', '||city,
SUM(amount)
FROM payment p
INNER JOIN customer c
ON p.customer_id=c.customer_id
INNER JOIN address a
ON c.address_id=a.address_id
INNER JOIN city ci
ON a.city_id=ci.city_id
INNER JOIN country co
ON ci.country_id=co.country_id 
GROUP BY country ||', '||city
ORDER BY 2 asc
	
	


SELECT 
country ||', ' ||city,
SUM(amount)
FROM payment p
LEFT JOIN customer c
ON p.customer_id=c.customer_id
LEFT JOIN address a
ON a.address_id=c.address_id
LEFT JOIN city ci
ON ci.city_id=a.city_id
LEFT JOIN country co
ON co.country_id=ci.country_id
GROUP BY country ||', ' ||city
ORDER BY 2 ASC