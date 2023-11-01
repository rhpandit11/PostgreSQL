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