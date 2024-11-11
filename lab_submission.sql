-- (i) A Procedure called PROC_LAB5
DELIMITER $$
CREATE PROCEDURE `PROC_LAB5`()
BEGIN
    DECLARE employeeDetails TEXT DEFAULT "";
    DECLARE employeeRank INT DEFAULT 1;
    DECLARE finished INT DEFAULT 0;

DECLARE CURSOR_listOfEmployees CURSOR FOR
 SELECT 
        CONCAT(
            employees.firstName, ' ', employees.lastName, 
            ' (', employees.employeeNumber, ') ',
            ' from ', departments.departmentName,
            ' with salary: ', FORMAT(salaries.salary, 2)
        ) AS employee_info
    FROM employees
    INNER JOIN departments ON employees.departmentId = departments.departmentId
    INNER JOIN salaries ON employees.employeeNumber = salaries.employeeNumber
    ORDER BY salaries.salary DESC;

-- (ii) A Function called FUNC_LAB5


-- (iii) A View called VIEW_LAB5
