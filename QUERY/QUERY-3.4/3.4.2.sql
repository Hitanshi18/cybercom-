-- case-2 : Consider you’ve one employee database system.

USE Student_db;

CREATE TABLE emp1 (
  id INT NOT NULL PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  title VARCHAR(50) NOT NULL,
  salary FLOAT NOT NULL,
  department VARCHAR(50) NOT NULL,
  hire_date DATE NOT NULL
);

INSERT INTO emp1 (id, first_name, last_name, title, salary, department, hire_date) 
VALUES 
(1, 'John', 'Doe', 'Manager', 100000, 'Sales', '1999-10-15'),
(2, 'Jane', 'Doe', 'Salesperson', 50000, 'Sales', '2005-05-22'),
(3, 'Tom', 'Smith', 'Manager', 95000, 'Marketing', '2007-08-01'),
(4, 'Mary', 'Johnson', 'Marketing Coordinator', 60000, 'Marketing', '2012-02-12'),
(5, 'Mike', 'Brown', 'Salesperson', 55000, 'Sales', '2010-06-30'),
(6, 'Lisa', 'Jones', 'Marketing Coordinator', 65000, 'Marketing', '2008-03-22'),
(7, 'David', 'Lee', 'Manager', 120000, 'IT', '2002-12-05'),
(8, 'Kevin', 'Chen', 'Programmer', 80000, 'IT', '2014-09-08'),
(9, 'Emily', 'Wang', 'Programmer', 85000, 'IT', '2013-04-01'),
(10, 'Karen', 'Nguyen', 'Manager', 110000, 'Operations', '2006-10-19'),
(11, 'Steven', 'Tran', 'Operations Coordinator', 50000, 'Operations', '2015-08-30'),
(12, 'Jason', 'Pham', 'Operations Coordinator', 55000, 'Operations', '2018-02-28'),
(13, 'Maggie', 'Nguyen', 'Salesperson', 60000, 'Sales', '2019-05-10'),
(14, 'Alice', 'Truong', 'Programmer', 75000, 'IT', '2016-11-15'),
(15, 'Robert', 'Wilson', 'Manager', 105000, 'Finance', '2010-03-18'),
(16, 'Jennifer', 'Kim', 'Financial Analyst', 70000, 'Finance', '2017-01-01');

-- 1. Write a query that returns the first and last name of all
-- employees who have a title that contains the word
-- "Manager".
SELECT first_name, last_name
FROM emp1
WHERE title LIKE '%Manager%';

-- 2. Write a query that returns the department name and the
-- average salary of all employees in each department.

SELECT department, AVG(salary) AS average_salary
FROM emp1
GROUP BY department;

-- 3. Write a query that returns the number of employees who were
-- hired in each year, sorted by year.

SELECT YEAR(hire_date) AS hire_year, COUNT(*) AS num_emp1_hired
FROM emp1
GROUP BY hire_year
ORDER BY hire_year;

-- 4. Write a query that returns the first name, last name, and
-- salary of the top 10 highest-paid employees.

SELECT first_name, last_name, salary
FROM emp1
ORDER BY salary DESC
LIMIT 10;

-- 5. Write a query that updates the salary of all employees in
-- the "Sales" department to be 10% higher than their current
-- salary.

-- UPDATE emp1
-- SET salary = salary * 1.1
-- WHERE department = 'Sales';
UPDATE emp1
SET salary = salary * 1.1
WHERE department = 'Sales' AND emp1_id > 0;


-- 6. Write a query that deletes all employees who were hired
-- before the year 2000.

DELETE FROM emp1
WHERE hire_date < '2000-01-01';

-- 7. Write a query that creates a new table called
-- "employee_stats" that contains the following columns:
-- "department_name", "total_employees", and "average_salary".
-- The table should include one row for each department.
CREATE TABLE employee_stats (
  department_name VARCHAR(255),
  total_employees INT,
  average_salary DECIMAL(10,2)
);

INSERT INTO employee_stats (department_name, total_employees, average_salary)
SELECT department, COUNT(*), AVG(salary)
FROM emp1
GROUP BY department;

-- 8. Write a query that returns the first and last name of all
-- employees who have the same last name as their manager.

SELECT e1.first_name, e1.last_name
FROM emp1 e1
JOIN employees e2 ON e1.manager_id = e2.employee_id
WHERE e1.last_name = e2.last_name;

-- 9. Write a query that returns the top 5 departments with the
-- highest average salary.

SELECT department, AVG(salary) AS average_salary
FROM emp1
GROUP BY department
ORDER BY average_salary DESC
LIMIT 5;


-- 10. Write a query that returns the first and last name of
-- all employees who have at least one dependent. Sort the
-- results by last name

SELECT e.first_name, e.last_name
FROM emp1 e
JOIN dependents d ON e.emp1_id = d.emp1_id
GROUP BY e.emp1_id
HAVING COUNT(*) >= 1
ORDER BY e.last_name;

