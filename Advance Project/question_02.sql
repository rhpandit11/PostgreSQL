-- Question 2:

-- Level: Moderate

-- Topic: CASE + GROUP BY

-- Task: Write a query that gives an overview of how many films have replacements costs in the following cost ranges

--     low: 9.99 - 19.99

--     medium: 20.00 - 24.99

--     high: 25.00 - 29.99

-- Question: How many films have a replacement cost in the "low" group?

-- Answer: 514

SELECT
COUNT(*),
CASE 
WHEN replacement_cost <= 19.99 THEN 'Low'
WHEN replacement_cost <= 24.99 THEN 'Medium'
ELSE 'High'
END as ranges
from film	
GROUP BY ranges