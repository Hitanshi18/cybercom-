-- Write an SQL query to report all customers who never order
-- anything. Return the result table in any order.

USE Student_db;

CREATE TABLE customers (
  customer_id INT PRIMARY KEY,
  name VARCHAR(50)
);
INSERT INTO customers
VALUES(1, 'joe');

INSERT INTO customers
VALUES(2, 'henry' );

INSERT INTO customers
VALUES(3, 'sam');

INSERT INTO customers
VALUES(4, 'max' );

SELECT * FROM customers;

CREATE TABLE orders (
  order_id INT PRIMARY KEY,
  customer_id INT
);

INSERT INTO orders
VALUES( '1', '3');

INSERT INTO orders
VALUES('2', '1');


select customers.name as 'Customers'
from customers
where customers.id not in
(
    select customerid from orders
);

