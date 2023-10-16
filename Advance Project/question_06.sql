-- Question 6:

-- Level: Moderate

-- Topic: LEFT JOIN & FILTERING

-- Task: Create an overview of the addresses that are not associated to any customer.

-- Question: How many addresses are that?

-- Answer: 4

select 
first_name
from address a
LEFT JOIN customer c
ON a.address_id=c.address_id
WHERE first_name is null