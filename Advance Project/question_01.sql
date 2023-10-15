-- Level: Simple

-- Topic: DISTINCT

-- Task: Create a list of all the different (distinct) replacement costs of the films.

-- Question: Whats the lowest replacement cost?

-- Answer: 9.99

SELECT
DISTINCT(MIN(replacement_cost))
FROM film