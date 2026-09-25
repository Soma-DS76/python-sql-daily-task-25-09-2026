CREATE TABLE deleted_employees( log_id INT PRIMARY KEY AUTO_INCREMENT, employee_id INT, 
                                employee_name VARCHAR(100),
                                salary DECIMAL(10,2),
                                department_id INT,
                                deleted_at DATETIME );


-- Change delimiter to // because the trigger contains ; inside BEGIN and END
DELIMITER //

CREATE TRIGGER employee_delete
BEFORE DELETE ON employees
FOR EACH ROW
BEGIN
    INSERT INTO deleted_employees( employee_id, employee_name, salary, department_id, deleted_at )
    VALUES( OLD.employee_id, OLD.employee_name, OLD.salary, OLD.department_id, NOW() );
END //

DELIMITER ;

-- DELIMITER // is used to temporarily change the command ending symbol from ; 
-- to //, so MySQL treats the complete trigger as one command.