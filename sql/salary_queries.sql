CREATE TABLE employees( employee_id INT PRIMARY KEY, employee_name VARCHAR(100) NOT NULL,
                        salary DECIMAL(10,2) NOT NULL,
                        department_id INT NOT NULL );

INSERT INTO employees
VALUES (1,'Ravi',30000,1), (2,'Kiran',45000,2), (3,'Arun',60000,1), (4,'Manoj',55000,3),
       (5,'Ramesh',60000,2), (6,'Suresh',40000,3), (7,'Vijay',45000,1);

SELECT DISTINCT salary
FROM employees
ORDER BY salary DESC
LIMIT 3;

SELECT MAX(salary) AS second_highest_salary
FROM employees
WHERE salary <( SELECT MAX(salary) FROM employees);

SELECT employee_name,salary,COUNT(*) AS duplicate_count
FROM employees
GROUP BY employee_name,salary
HAVING COUNT(*) > 1;