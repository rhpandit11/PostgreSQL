CREATE TABLE director (
director_id SERIAL PRIMARY KEY,
director_account_name VARCHAR(20) UNIQUE,
first_name VARCHAR(50),
last_name VARCHAR(50) DEFAULT 'Not Specified',
date_of_birth DATE,
address_id INT REFERENCES address(address_id))