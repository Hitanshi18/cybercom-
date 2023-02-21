--  Write an SQL query to delete all the duplicate emails, keeping
-- only one unique email with the smallest id. Return the result
-- table in any order.


USE Student_db;

CREATE TABLE my_table (
  id INT NOT NULL AUTO_INCREMENT,
  mailid VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
);

INSERT INTO my_table
VALUES(1, 'john@example.com');
INSERT INTO my_table
VALUES(2, 'jane@example.com');
INSERT INTO my_table
VALUES(3, 'john@example.com');
INSERT INTO my_table
VALUES(4, 'bob@example.com ');
INSERT INTO my_table
VALUES(5, 'jane@example.com ');

SELECT * FROM my_table;

DELETE FROM my_table
WHERE id NOT IN (
  SELECT MIN(3)
  FROM my_table
  GROUP BY email
);


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
-- SELECT * FROM employees;