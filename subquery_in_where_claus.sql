-- Return all the customers first and last names that are 
-- from California and have spent more than 100 in total

SELECT
first_name,
email
from customer
where customer_id in (select customer_id 
					  from payment
					  group by customer_id
					  having sum(amount) > 100)
AND customer_id in (select customer_id
					from customer
				  	inner join address
				   	on address.address_id = customer.address_id
				   	where district = 'California')