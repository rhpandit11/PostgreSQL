SELECT
f.title,
c.name,
f.length,
DENSE_RANK() OVER(PARTITION BY name ORDER BY length DESC)
FROM  film f
LEFT JOIN film_category fc ON f.film_id=fc.film_id
LEFT JOIN category c ON c.category_id=fc.category_id


--We cannot use where condition and window function in same
--So we have to give all query in a subquery

SELECT
*
FROM
(SELECT
f.title,
c.name,
f.length,
DENSE_RANK() OVER(PARTITION BY name ORDER BY length DESC) as rank
FROM  film f
LEFT JOIN film_category fc ON f.film_id=fc.film_id
LEFT JOIN category c ON c.category_id=fc.category_id) a
WHERE rank=1

/*
Write a query that returns the customers' name, the country and how many
payments they have. For that use the existing view customer_list
*/

SELECT
*
FROM
(SELECT 
name,
country,
COUNT(*)
RANK() OVER(PARTITION BY country ORDER BY count(*) DESC) AS rank
FROM customer_list cl
LEFT JOIN payment p 
ON cl.customer_id=p.customer_id
GROUP BY name, country)
WHERE rank BETWEEN 1 and 3