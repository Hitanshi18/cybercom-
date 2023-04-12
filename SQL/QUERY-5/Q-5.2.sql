CREATE DATABASE IF NOT EXISTS employee_db;
USE employee_db;

CREATE TABLE customers (
  customer_id INT PRIMARY KEY,
  customer_name VARCHAR(50) NOT NULL,
  shipping_address VARCHAR(100),
    city VARCHAR(50)
);

 
INSERT INTO customers (customer_id, customer_name,shipping_address, city)
VALUES (1, 'Alice','123 Main St, New York', 'New York'),
       (2, 'Bob','456 Elm St, Los Angeles', 'Los Angeles'),
       (3, 'Charlie','789 Oak St, New York', 'New York'),
       (4, 'David','111 Pine St, Boston', 'Boston');

 
CREATE TABLE products (
  product_id INT PRIMARY KEY,
  product_name VARCHAR(50) NOT NULL,
  category VARCHAR(50) NOT NULL
);

INSERT INTO products (product_id, product_name, category)
VALUES (1, 'TV', 'Electronics'),
       (2, 'Laptop', 'Electronics'),
       (3, 'Book', 'Stationery'),
       (4, 'Pen', 'Stationery');

 
CREATE TABLE orders (
  order_id INT PRIMARY KEY,
  order_date DATE NOT NULL,
  customer_id INT NOT NULL,
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

 
INSERT INTO orders (order_id, order_date, customer_id)
VALUES (1, '2022-01-01', 1),
       (2, '2022-02-01', 2),
       (3, '2022-02-15', 1),
       (4, '2022-03-01', 3);

 
CREATE TABLE order_items (
  order_id INT NOT NULL,
  product_id INT NOT NULL,
  quantity INT NOT NULL,
  price DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (order_id, product_id),
  FOREIGN KEY (order_id) REFERENCES orders(order_id),
  FOREIGN KEY (product_id) REFERENCES products(product_id)
);

 
INSERT INTO order_items (order_id, product_id, quantity, price)
VALUES (1, 1, 2, 1000.00),
       (1, 2, 1, 1500.00),
       (2, 2, 1, 2000.00),
       (2, 3, 5, 10.00),
       (3, 1, 1, 500.00),
       (3, 2, 1, 1500.00),
       (3, 3, 2, 8.00),
       (4, 1, 3, 1500.00),
       (4, 4, 10, 1.00);
CREATE TABLE employees (
  employee_id INT PRIMARY KEY,
  employee_name VARCHAR(50)
);
INSERT INTO employees VALUES
  (1, 'John Smith'),
  (2, 'Jane Doe'),
  (3, 'Bob Johnson');
  
CREATE TABLE orders (
  order_id INT PRIMARY KEY,
  order_date DATE,
  employee_id INT,
  customer_id INT,
  product_id INT,
  quantity INT,
  FOREIGN KEY (employee_id) REFERENCES employees(id),
  FOREIGN KEY (customer_id) REFERENCES customers(id),
  FOREIGN KEY (product_id) REFERENCES products(id)
);

CREATE TABLE products (
  product_id INT PRIMARY KEY,
  product_name VARCHAR(50),
  category VARCHAR(50),
  price DECIMAL(10, 2)
);

CREATE TABLE order_items (
  order_id INT,
  product_id INT,
  quantity INT,
  price DECIMAL(10,2),
  FOREIGN KEY (order_id) REFERENCES orders(order_id),
  FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO orders VALUES
  (1, '2022-01-01', 1),
  (2, '2022-01-02', 2),
  (3, '2022-01-03', 3),
  (4, '2022-01-04', 1),
  (5, '2022-01-05', 2),
  (6, '2022-01-06', 3);

INSERT INTO products VALUES
  (1, 'Shirt', 'Clothing'),
  (2, 'Pants', 'Clothing'),
  (3, 'Shoes', 'Footwear'),
  (4, 'Watch', 'Accessories'),
  (5, 'Sunglasses', 'Accessories');

INSERT INTO order_items VALUES
  (1, 1, 2, 25.00),
  (1, 2, 1, 50.00),
  (2, 2, 1, 50.00),
  (3, 1, 1, 25.00),
  (4, 2, 2, 50.00),
  (5, 1, 3, 25.00),
  (5, 5, 1, 75.00),
  (6, 4, 1, 100.00),
  (6, 5, 2, 50.00);


CREATE TABLE customers (
    customer_id INTEGER PRIMARY KEY,
    name VARCHAR(50)
);

CREATE TABLE products (
    product_id INTEGER PRIMARY KEY,
    name VARCHAR(50),
    category VARCHAR(50)
);

CREATE TABLE orders (
    order_id INTEGER PRIMARY KEY,
    customer_id INTEGER,
    product_id INTEGER,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO customers (customer_id, name) VALUES
    (1, 'John'),
    (2, 'Jane'),
    (3, 'Mike'),
    (4, 'Sara');

INSERT INTO products (product_id, name, category) VALUES
    (1, 'Smartphone', 'Electronics '),
    (2, 'T-shirt', 'Clothing'),
    (3, 'Laptop', 'Electronics'),
    (4, 'Jeans', 'Clothing'),
    (5, 'Tablet', 'Electronics');

INSERT INTO orders (order_id, customer_id, product_id) VALUES
    (1, 1, 1),
    (2, 1, 2),
    (3, 2, 3),
    (4, 2, 1),
    (5, 3, 2),
    (6, 3, 5),
    (7, 4, 4),
    (8, 4, 1);
    
    CREATE TABLE employees (
    employee_id INTEGER PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50)
);

--  1. Write a SQL query to retrieve the names of all customers
-- who have placed orders for products in the "Electronics"
-- category, along with the total amount they have spent on
-- all orders. The output should be sorted by the total amount
-- spent in descending order.

SELECT c.customer_name, SUM(oi.quantity * oi.price) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
WHERE p.category = 'Electronics'
GROUP BY c.customer_name
ORDER BY total_spent DESC;



-- 2. Write a SQL query to retrieve the names of all employees
-- who have sold at least one product in the "Clothing"
-- category, along with the total revenue they have generated
-- from those sales. The output should be sorted by total
-- revenue generated in descending order.


SELECT e.employee_name, SUM(oi.quantity * oi.price) AS total_revenue
FROM employees e
JOIN orders o ON e.employee_id = o.employee_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
WHERE p.category = 'Clothing'
GROUP BY e.employee_id
HAVING SUM(oi.quantity) > 0
ORDER BY total_revenue DESC;


-- 3. Write a SQL query to retrieve the names of all customers
-- who have placed orders for products in both the
-- "Electronics" and "Clothing" categories. The output should
-- only include customers who have ordered products in both
-- categories.


SELECT c.name
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN products p ON o.product_id = p.product_id
WHERE p.category = 'Electronics'
AND c.customer_id IN (
    SELECT c2.customer_id
    FROM customers c2
    JOIN orders o2 ON c2.customer_id = o2.customer_id
    JOIN products p2 ON o2.product_id = p2.product_id
    WHERE p2.category = 'Clothing'
)
GROUP BY c.name
HAVING COUNT(DISTINCT p.category) = 2;


-- 4. Write a SQL query to retrieve the names of all employees
-- who have sold at least one product to a customer who has a
-- shipping address in the same city as the employee. The
-- output should only include employees who have made at least
-- one such sale.


SELECT DISTINCT e.employee_name
FROM employees e
JOIN orders o ON e.employee_id = o.employee_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN customers c ON o.customer_id = c.customer_id
JOIN addresses a ON c.shipping_address_id = a.address_id
WHERE a.city = e.city;



-- 5. Write a SQL query to retrieve the names of all customers
-- who have placed orders for products in the "Electronics"
-- category, but have never placed an order for products in
-- the "Clothing" category.

SELECT c.customer_name
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
WHERE p.category = 'Electronics'
AND c.customer_id NOT IN (
  SELECT DISTINCT c.customer_id
  FROM customers c
  JOIN orders o ON c.customer_id = o.customer_id
  JOIN order_items oi ON o.order_id = oi.order_id
  JOIN products p ON oi.product_id = p.product_id
  WHERE p.category = 'Clothing'
)
GROUP BY c.customer_id;


-- 6. Write a SQL query to retrieve the names of all employees
-- who have sold at least one product to customers who have
-- placed orders for products in the "Electronics" category,
-- but have never placed an order for products in the
-- "Clothing" category. The output should only include
-- employees who have made at least one such sale.

SELECT DISTINCT e.employee_name
FROM employees e
JOIN orders o ON e.employee_id = o.employee_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN customers c ON o.customer_id = c.customer_id
JOIN products p ON oi.product_id = p.product_id
WHERE p.category = 'Electronics'
AND c.customer_id NOT IN (
  SELECT DISTINCT c.customer_id
  FROM customers c
  JOIN orders o ON c.customer_id = o.customer_id
  JOIN order_items oi ON o.order_id = oi.order_id
  JOIN products p ON oi.product_id = p.product_id
  WHERE p.category = 'Clothing'
)
GROUP BY e.employee_id;


-- 7. Write a SQL query to retrieve the names of all customers
-- who have placed orders for more than five different
-- products in the "Electronics" category

SELECT c.customer_name
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
WHERE p.category = 'Electronics'
GROUP BY c.customer_id
HAVING COUNT(DISTINCT oi.product_id) > 5;

-- 8. Write a SQL query to retrieve the names of all employees
-- who have sold products to customers who have placed orders
-- for more than five different products in the "Electronics"
-- category. The output should only include employees who have
-- made at least one such sale.

SELECT e.employee_name
FROM employees e
JOIN orders o ON e.employee_id = o.employee_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
JOIN (
    SELECT c.customer_id
    FROM customers c
    JOIN orders o ON c.customer_id = o.customer_id
    JOIN order_items oi ON o.order_id = oi.order_id
    JOIN products p ON oi.product_id = p.product_id
    WHERE p.category = 'Electronics'
    GROUP BY c.customer_id
    HAVING COUNT(DISTINCT oi.product_id) > 5
) ec ON o.customer_id = ec.customer_id
WHERE p.category <> 'Clothing'
GROUP BY e.employee_id
HAVING COUNT(DISTINCT o.customer_id) >= 1;
