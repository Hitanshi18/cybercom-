--  Write an SQL query to delete all the duplicate emails, keeping
-- only one unique email with the smallest id. Return the result
-- table in any order.

-- USE Student_db;

-- CREATE TABLE IF NOT EXISTS employees(employee_id int, employee_name varchar(255), email_id varchar(255));
-- TRUNCATE TABLE employees;
-- INSERT INTO employees (employee_id,employee_name, email_id) VALUES ('101','Liam Alton', 'li.al@abc.com');
-- INSERT INTO employees (employee_id,employee_name, email_id) VALUES ('102','Josh Day', 'jo.da@abc.com');
-- INSERT INTO employees (employee_id,employee_name, email_id) VALUES ('103','Sean Mann', 'se.ma@abc.com');	
-- INSERT INTO employees (employee_id,employee_name, email_id) VALUES ('104','Evan Blake', 'ev.bl@abc.com');
-- INSERT INTO employees (employee_id,employee_name, email_id) VALUES ('105','Toby Scott', 'jo.da@abc.com');
-- SELECT * FROM employees;

-- DELETE e1 FROM employees e1,  employees e2
-- WHERE
--     e1.email_id = e2.email_id AND e1.employee_id > e2.employee_id;
-- SELECT 
--     *
-- FROM
--     employees; 
--     
--     
--     USE Student_db;
use Student_db;
CREATE TABLE IF NOT EXISTS employees (
    employee_id INT,
    employee_name VARCHAR(255),
    email_id VARCHAR(255)
);

TRUNCATE TABLE employees;

INSERT INTO employees (employee_id, employee_name, email_id)
VALUES ('101', 'Liam Alton', 'li.al@abc.com'),
       ('102', 'Josh Day', 'jo.da@abc.com'),
       ('103', 'Sean Mann', 'se.ma@abc.com'),
       ('104', 'Evan Blake', 'ev.bl@abc.com'),
       ('105', 'Toby Scott', 'jo.da@abc.com');

SELECT * FROM employees;

-- create temporary table to identify duplicate email_ids
CREATE TEMPORARY TABLE temp_employee_ids AS
    SELECT MIN(employee_id) AS employee_id, email_id
    FROM employees
    GROUP BY email_id
    HAVING COUNT(*) > 1;

-- delete duplicates from original table using temp table
DELETE e
FROM employees e
JOIN temp_employee_ids t
    ON e.employee_id > t.employee_id
    AND e.email_id = t.email_id;

SELECT * FROM employees;
