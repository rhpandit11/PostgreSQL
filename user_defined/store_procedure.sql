CREATE OR REPLACE PROCEDURE sp_transfer
(tr_amount INT, sender INT, recipient INT)
LANGUAGE plplgsql
AS
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

--call the procedure
CALL sp_transfer(500,1,2);