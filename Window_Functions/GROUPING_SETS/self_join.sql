SELECT 
emp.employee_id,
emp.name as employee,
mng.name as manager,
mng2.name as manager_of_manager
FROM employee emp
LEFT JOIN employee mng
ON emp.manager_id=mng.employee_id
LEFT JOIN employee mng2
ON mng.manager_id=mng2.employee_id