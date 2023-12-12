SELECT
staff_id,
store.staff_id,
last_name,
store.store_id*staff_id
FROM staff
CROSS JOIN store