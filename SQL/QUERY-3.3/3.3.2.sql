-- Create a table called "employees" with the following columns:
-- "id" (integer, primary key), "name" (text), "age" (integer), and
-- "salary" (integer).

USE Student_db;

CREATE TABLE employee1 (
    id INTEGER PRIMARY KEY,
    name TEXT,
    age INTEGER,
    salary INTEGER
);

INSERT INTO employee1 (id, name, age, salary) VALUES
(1, 'John', 35, 60000),
(2, 'Mary', 27, 50000),
(3, 'Peter', 42, 75000),
(4, 'Olivia', 29, 55000),
(5, 'Michael', 38, 80000);

-- 1.  Write a SQL query to select all employee1 from the
-- "employees" table.

select * from employee1;

-- 2.  Write a SQL query to select the name and salary of all
-- employees with a salary greater than 60000.

SELECT name, salary FROM employee1 WHERE salary > 60000;

-- 3. Write a SQL query to update Peter's age to 43.

UPDATE employee1 SET age = 43 WHERE name = 'Peter' LIMIT 1;

-- 4. Write a SQL query to delete the employee with the id of 4.

DELETE from employee1 where id = 4;

-- 5.  Write a SQL query to calculate the average salary of all
-- employees.

SELECT AVG(salary) as average_salary FROM employee1;

-- 6. Write a SQL query to select the name and age of the oldest
-- employee.

SELECT name, age FROM employee1 ORDER BY age DESC LIMIT 1;

-- 7. Write a SQL query to select the name and age of the
-- youngest employee.

SELECT name, age FROM employee1 ORDER BY age  LIMIT 1;

-- 8. Write a SQL query to select the name of the employee with
-- the highest salary.

SELECT name FROM employee1 ORDER BY salary DESC LIMIT 1;



