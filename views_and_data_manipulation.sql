-- Update Command
UPDATE customer 
SET last_name='BROWN'
WHERE customer_id=1

UPDATE customer 
SET email=lower(email)

/*
Update all rental prices that are 0.99 to 1.99.
1. Add the column initials (data type varchar(10))
2. Update the values to the actual initials for example Frank Smith should be F.S.
The customer table needs to be altered as well
*/

UPDATE film
SET rental_rate=1.99
WHERE rental_rate=0.99

ALTER TABLE customer
ADD COLUMN initials VARCHAR(4)

UPDATE customer
SET initials=LEFT(first_name,1)||'.'||LEFT(last_name,1)||'.'


--Delete Command
DELETE FROM songs
WHERE song_id IN (4,5)
RETURNING song_name, song_id

DELETE FROM payment
WHERE payment_id IN (17064,17067)
RETURNING *

--Create Table as command

CREATE TABLE customer_address
As
SELECT first_name, last_name, email, address, city
FROM customer c
LEFT JOIN address a
ON c.address_id=a.address_id
LEFT JOIN city ci
ON ci.city_id=a.city_id

--Challenge
CREATE TABLE customer_spendings
AS
SELECT 
first_name ||' '|| last_name AS name,
SUM(amount) AS total_amount
FROM customer c
LEFT JOIN payment p
ON c.customer_id=p.customer_id
GROUP BY first_name ||' '|| last_name

/*
Create a view called films_category that shows a list of the film titles including their title, 
length and category name ordered descendingly by the length.

Filter the results to only the movies in the category 'Action' and 'Comedy'.
*/

CREATE VIEW films_category
AS
SELECT 
title,
name,
length
FROM film f
LEFT JOIN film_category fc
ON f.film_id=fc.film_id
LEFT JOIN category c
ON c.category_id=fc.category_id
WHERE name IN ('Action','Comedy')
ORDER BY length DESC

--Create a Materialized view

CREATE MATERIALIZED VIEW mv_film_category
AS
SELECT 
title,
name,
length
FROM film f 
LEFT JOIN film_category fc 
ON f.film_id=fc.film_id
LEFT JOIN category c
ON c.category_id=fc.category_id
WHERE name IN ('Action','comedy')
ORDER BY length DESC 

--Refresh a materialized view
REFRESH MATERIALIZED VIEW  mv_film_category

/*
In this challenge we use again the view v_customer_info lik this first:

CREATE VIEW v_customer_info
AS
SELECT cu.customer_id,
    cu.first_name || ' ' || cu.last_name AS name,
    a.address,
    a.postal_code,
    a.phone,
    city.city,
    country.country
     FROM customer cu
     JOIN address a ON cu.address_id = a.address_id
     JOIN city ON a.city_id = city.city_id
     JOIN country ON city.country_id = country.country_id
ORDER BY customer_id

You need to perform the following tasks:

1) Rename the view to v_customer_information.

2) Rename the customer_id column to c_id.

3) Add also the initial column as the third column to the view by replacing the view.
*/

--1) Rename the view to v_customer_information.

ALTER VIEW v_customer_info
RENAME TO v_customer_information


--2) Rename the customer_id column to c_id.

ALTER VIEW v_customer_information
RENAME COLUMN customer_id TO c_id


--3) Add also the initial column as the third column to the view by replacing the view.

CREATE OR REPLACE VIEW v_customer_information
AS
SELECT cu.customer_id,
    cu.first_name || ' ' || cu.last_name AS name,
    cu.initials,
	a.address,
    a.postal_code,
    a.phone,
    city.city,
    country.country
     FROM customer cu
     JOIN address a ON cu.address_id = a.address_id
     JOIN city ON a.city_id = city.city_id
     JOIN country ON city.country_id = country.country_id
ORDER BY customer_id