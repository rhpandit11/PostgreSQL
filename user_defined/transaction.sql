
BEGIN;
UPDATE acc_balance
SET amount = amount - 100
WHERE id = 1;
UPDATE acc_balance
SET amount = amount +100
WHERE id = 2;
COMMIT;