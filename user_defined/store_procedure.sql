CREATE OR REPLACE PROCEDURE sp_transfer
(tr_amount INT, sender INT, recipient INT)
LANGUAGE plplgsql
AS
$$
BEGIN
-- add balance
UPDATE acc_balance
SET amount = amount + tr_amount
WHERE id = recipient;

-- subtract balance
UPDATE acc_balance
SET amount = amount - tr_amount
WHERE id = sender;
COMMIT;
END;
$$

--call the procedure
CALL sp_transfer(500,1,2);

------------------------------------------------------
-- Create a stored procedure called emp_swap that accepts two parameters
-- emp1 and emp2 as input and swaps the two employees' position and salary.
-- Test the stored procedure with emp_id 2 and 3.
CREATE OR REPLACE PROCEDURE emp_swap
(emp1 INT, emp2 INT)    
LANGUAGE plplgsql
AS
$$
BEGIN
salary1 DECIMAL(8,2);
salary2 DECIMAL(8,2);
position1 TEXT;
position2 TEXT;
BEGIN

--store values in variable
SELECT salary
INTO salary1
FROM employees
WHERE emp_id=1;

SELECT salary
INTO salary2
FROM employees
WHERE emp_id=2;


SELECT position_title
INTO position1
FROM employee
WHERE emp_id=1;

SELECT position_title
INTO position2
FROM employees
WHERE emp_id=2;

--update values
UPDATE employees
SET salary = salary2
WHERE emp_id=1;

UPDATE employees
SET salary = salary1
WHERE emp_id=2;

--update titles
UPDATE employees
SET position_title = position2
WHERE emp_id=1;

UPDATE employees
SET position_title = position1
WHERE emp_id=2;

COMMIT;
END;
$$


CALL emp_swap (1,2);
