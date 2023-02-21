-- Create a database structure for employee leave application. It
-- should include all the employee's information as well as their
-- leave information.

USE Student_db;

USE Student_db;

CREATE TABLE employee (
  id INT PRIMARY KEY,
  first_name VARCHAR(256),
  last_name VARCHAR(256),
  email VARCHAR(256),
  phone_number INT,
  address VARCHAR(256)
);

INSERT INTO employee
VALUES (1 , "John" , 'Smith' , 'john.smith@email.com' , 123-456-7890 , '123 Main St');

INSERT INTO employee
VALUES (2 , 'Jane',	'Doe', 	'jane.doe@email.com', 	555-555-5555,	'456 Park Ave');

INSERT INTO employee
VALUES(3 , 'Mark', 'desuza', 'markdesuza@gmail.com', 444-335-8897, '239 ring road');

SELECT * FROM employee; 

CREATE TABLE leave_requests (
  id INT PRIMARY KEY,
  employee_id INT,
  start_date DATE,
  end_date DATE,
  reason TEXT,
  status VARCHAR(255),
  FOREIGN KEY (employee_id) REFERENCES employee(id)
);

INSERT INTO leave_requests
VALUES(1, 1 , '2022-10-01', '2022-10-05', 'Vacation','Pending' );

INSERT INTO leave_requests
VALUES(2, 2, '2022-10-10', '2022-10-12', 'Sick', 'Approved');

INSERT INTO leave_requests
VALUES(3, 3, '2022-10-20', '2022-10-30', 'Personal', 'Denied');

SELECT * FROM leave_requests; 
