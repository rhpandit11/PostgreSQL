CREATE FUNCTION count_rr (min_r decimal(4,2),max_r decimal(4,2))
RETURNS INT
LANGUAGE plpgsql
AS
$$
DECLARE 
movie_count INT;
BEGIN
SELECT COUNT(*)
INTO movie_count
FROM film
WHERE rental_rate BETWEEN min_r AND max_r;
RETURN	movie_count;
END;
$$

SELECT count_rr(3,6)


--------------------------------------------------------------------------
--Create a function that expects the customer's first and last name
--and returns the total amount of payments this customer has made.

CREATE FUNCTION name_searchs(f_name varchar(20),l_name varchar(20))
RETURNS decimal(6,2)
LANGUAGE plpgsql
AS 
$$
DECLARE 
total decimal(6,2);
BEGIN
SELECT
SUM(amount)
INTO total
FROM payment
NATURAL LEFT JOIN customer
WHERE first_name = f_name
AND
last_name = l_name;
RETURN total;
END;
$$