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

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1;

OPEN CURSOR_listOfEmployees;
LOOP_PopulateList: LOOP
        FETCH CURSOR_listOfEmployees INTO employeeDetails;
        IF finished = 1 THEN
            LEAVE LOOP_PopulateList;
        END IF;
         SET employeeRank = employeeRank + 1;
        SELECT CONCAT("Rank #", employeeRank, ": ", employeeDetails) AS EmployeeInfo;
        END LOOP LOOP_PopulateList;

    -- Close the cursor after use
    CLOSE CURSOR_listOfEmployees;
END$$

DELIMITER ;
-- (ii) A Function called FUNC_LAB5
DELIMITER $$
CREATE FUNCTION FUNC_LAB5(salaryAmount DOUBLE)
RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
    DECLARE category VARCHAR(255);
    IF salaryAmount < 30000 THEN
        SET category = 'Low Salary';
    ELSEIF salaryAmount BETWEEN 30000 AND 70000 THEN
        SET category = 'Mid Salary';
-- (iii) A View called VIEW_LAB5
