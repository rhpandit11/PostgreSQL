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