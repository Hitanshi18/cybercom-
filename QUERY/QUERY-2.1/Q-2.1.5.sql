-- Write an SQL query to report all customers who never order
-- anything. Return the result table in any order.

USE Student_db;

CREATE TABLE customers (
  id INT PRIMARY KEY,
  name VARCHAR(50)
);

INSERT INTO customers (id, name)
VALUES
  (1, 'John Smith'),
  (2, 'Jane Doe' ),
  (3, 'Bob Johnson' );

CREATE TABLE orders (
  id INT PRIMARY KEY,
  customer_id INT,
  FOREIGN KEY (customer_id) REFERENCES customers(id)
);

-- insert example data into the orders table
INSERT INTO orders (id, customer_id)
VALUES
  (1, 1),
  (2, 1),
  (3, 2);
  
SELECT customers.*
FROM customers
LEFT JOIN orders ON customers.id = orders.customer_id
WHERE orders.customer_id IS NULL;


