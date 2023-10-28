-- How To create a TABLE with column

CREATE TABLE director (
director_id SERIAL PRIMARY KEY,
director_account_name VARCHAR(20) UNIQUE,
first_name VARCHAR(50),
last_name VARCHAR(50) DEFAULT 'Not Specified',
date_of_birth DATE,
address_id INT REFERENCES address(address_id))


-- Challenge
/*
ALTER TABLE STEPS

1.director_account_name to VARCHAR(30)
2.drop the default on last_name
3.add the constraint not null to last_name
4.add the column email of data type VARCHAR(40)
5.rename the director_account_name to account_name
6.rename the table from director to directors

*/

ALTER TABLE director
ALTER COLUMN director_account_name TYPE VARCHAR(30),
ALTER COLUMN last_name DROP DEFAULT,
ALTER COLUMN last_name SET NOT NULL,
ADD COLUMN email VARCHAR(40)

-----------------------------------------------------
ALTER TABLE director
RENAME director_account_name TO account_name

ALTER TABLE director
RENAME TO directors

-- TRUNCATE (WORK only for tables)

-- Create table
CREATE TABLE emp_table 
(
	emp_id SERIAL PRIMARY KEY,
	emp_name TEXT
)

-- SELECT table
SELECT * FROM emp_table

-- Drop table
DROP TABLE emp_table

-- Insert rows
INSERT INTO emp_table
VALUES
(1,'Frank'),
(2,'Maria')

-- SELECT table
SELECT * FROM emp_table

-- Truncate table
TRUNCATE TABLE emp_table
