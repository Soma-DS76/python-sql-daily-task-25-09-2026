CREATE TABLE departments( department_id INT PRIMARY KEY, department_name VARCHAR(100) NOT NULL );

INSERT INTO departments
VALUES (1,'IT'), (2,'HR'), (3,'Finance');

SELECT e.employee_id, e.employee_name, e.salary, d.department_name
FROM employees e
INNER JOIN departments d
ON e.department_id = d.department_id;

SELECT e.employee_id, e.employee_name, e.salary, d.department_name
FROM employees e
LEFT JOIN departments d
ON e.department_id = d.department_id;

SELECT e.employee_id, e.employee_name, e.salary, d.department_name
FROM employees e
RIGHT JOIN departments d
ON e.department_id = d.department_id;