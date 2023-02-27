CREATE  DATABASE IF NOT EXISTS employee_db;
USE employee_db;

-- 1.  Write a SQL query to retrieve the top 10 customers who have made
-- the most orders in the "orders" table, along with the total
-- number of orders they have made.
USE product_db;

CREATE TABLE customer (
  id INT PRIMARY KEY,
  name VARCHAR(255)
);

INSERT INTO customer (id, name)
VALUES
  (1, 'John'),
  (2, 'Jane'),
  (3, 'Bob'),
  (4, 'Alice');
  
CREATE TABLE orders (
  order_id INT PRIMARY KEY,
  customer_id INT,
  order_date DATE,
 amount DECIMAL (10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);

INSERT INTO orders (order_id, customer_id, order_date, amount, order_date) VALUES
(1, 1, '2022-01-01',1000),
(2, 2, '2022-01-02',500),
(3, 3, '2022-01-03',750),
(4, 1, '2022-01-04',500),
(5, 2, '2022-01-05',250),
(6, 1, '2022-01-06',3000),
(7, 3, '2022-01-07',2200),
(8, 2, '2022-01-08',1550),
(9, 1, '2022-01-09',1860),
(10, 2, '2022-01-10',480),
(11, 1, '2022-01-11',1200),
(12, 3, '2022-01-12',1000),
(13, 2, '2022-01-13',630),
(14, 1, '2022-01-14',3000),
(15, 3, '2022-01-15',1000);


SELECT customer_id, COUNT(*) as num_orders
FROM orders
GROUP BY customer_id
ORDER BY num_orders DESC
LIMIT 10;

-- 2. Write a SQL query to retrieve the names of all employees who have
-- sold more than $100,000 worth of products in the "order_details"
-- table, sorted by the amount sold in descending order.

CREATE TABLE employees (
  employee_id INT PRIMARY KEY,
  employee_name VARCHAR(50) NOT NULL,
  salary decimal (10,2),
  department_id INT
);

INSERT INTO employees (employee_id, employee_name, salary,department_id)
VALUES
  (1, 'John Doe',50000,1),
  (2, 'Jane Smith',60000,2),
  (3, 'Bob Johnson',45000,1),
  (4, 'Mary Wilson', 70000.00,3),
  (5, 'David Lee', 80000.00,2),
  (6, 'Karen Jones', 55000.00,3);

CREATE TABLE order_details (
  order_id INT PRIMARY KEY,
  employee_id INT NOT NULL,
  product_name VARCHAR(50) NOT NULL,
  quantity INT NOT NULL,
  price DECIMAL(10,2) NOT NULL,
  FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

INSERT INTO order_details (order_id, employee_id, product_name, quantity, price)
VALUES
  (1, 1, 'A', 10, 90000),
  (2, 1, 'B', 5, 190263),
  (3, 2, 'C', 20, 100000),
  (4, 2, 'D', 15, 140000),
  (5, 3, 'E', 25, 70000),
  (6, 3, 'F', 10, 25000),
  (7, 3, 'G', 5, 380000),
  (8, 3, 'H', 12, 95000),
  (9, 3, 'I', 8, 130000);

SELECT e.employee_name, SUM(od.quantity * od.price) AS total_sales
FROM employees e
JOIN order_details od ON e.employee_id = od.employee_id
GROUP BY e.employee_name
HAVING total_sales > 100000
ORDER BY total_sales DESC;



-- 3. Write a SQL query to retrieve the names of all customers who have
-- made orders in the "orders" table, along with the total amount
-- they have spent on all orders and the total amount they have
-- spent on orders made in the last 30 days.

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(50),
    phone VARCHAR(15)
);

INSERT INTO customers (id, name, email, phone)
VALUES (1, 'John Doe', 'john.doe@example.com', '123-456-7890'),
       (2, 'Jane Smith', 'jane.smith@example.com', '987-654-3210'),
       (3, 'Bob Johnson',  'bobjohnson@gmail.com','231-856-9875'),
  (4, 'Alice Brown', 'alicebrown@gmail.com','321-963-7895'),
  (5, 'Mark Davis','markdavis@gmail.com','157-983-7845');

-- SELECT c.name, SUM(o.amount) AS total_amount,
--        SUM(CASE WHEN o.order_date >= DATE_SUB(NOW(), INTERVAL 30 DAY) THEN o.amount ELSE 0 END) AS last_30_days_amount
-- FROM customers c
-- JOIN orders o ON c.id = o.customer_id
-- GROUP BY c.id;

SELECT c.name, 
       SUM(o.amount) AS total_amount, 
       SUM(CASE WHEN o.order_date >= DATE_SUB(NOW(), INTERVAL 30 DAY) 
                THEN o.amount ELSE 0 END) AS last_30_days_amount
FROM customers c 
JOIN orders o ON c.id = o.customer_id 
GROUP BY c.id;

-- 4. Write a SQL query to retrieve the names and salaries of all
-- employees who have a salary greater than the average salary of
-- all employees in the "employees" table, sorted by salary in
-- descending order.

SELECT employee_name, salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees)
ORDER BY salary DESC;

-- 5. Write a SQL query to retrieve the names of all customers who have
-- made orders in the "orders" table, but have not made any orders
-- in the last 90 days.

CREATE TABLE orders (
  order_id INT PRIMARY KEY,
  customer_name VARCHAR(50),
  order_date DATE,
  customer_id INT,
  product_id int,
FOREIGN KEY (customer_id) REFERENCES customers (customer_id),
  FOREIGN KEY (product_id) REFERENCES products (product_id)
);

INSERT INTO orders (order_id, customer_name,customer_id,product_id, order_date) 
VALUES 
  (1, 'John Doe',1, 1,'2022-01-01'),
  (2, 'Jane Smith',2, 2,'2021-12-15'),
  (3, 'Bob Johnson', 3,3,'2022-02-20'),
  (4, 'Alice Brown', 4,4,'2021-11-01'),
  (5, 'Mark Davis',5, 2,'2022-01-15');

SELECT DISTINCT customer_name 
FROM orders 
WHERE customer_name NOT IN (
  SELECT customer_name 
  FROM orders 
  WHERE order_date >= DATE_SUB(CURDATE(), INTERVAL 90 DAY)
);

-- 6. Write a SQL query to retrieve the names and salaries of all
-- employees who have a salary greater than the minimum salary of
-- their department in the "employees" table, sorted by department
-- ID and then by salary in descending order.

SELECT e.employee_name, e.salary
FROM employees e
WHERE e.salary > (
  SELECT MIN(s.salary)
  FROM employees s
  WHERE s.department_id = e.department_id
)
ORDER BY e.department_id ASC, e.salary DESC;




-- 7. Write a SQL query to retrieve the names and salaries of the five
-- highest paid employees in each department of the "employees"
-- table, sorted by department ID and then by salary in descending
-- order.

SELECT employee_name, salary, department_id
FROM (
   SELECT employee_name, salary, department_id,
          ROW_NUMBER() OVER (PARTITION BY department_id ORDER BY salary DESC) AS rn
   FROM employees
) AS emp
WHERE rn <= 5
ORDER BY department_id, salary DESC;


-- 8. Write a SQL query to retrieve the names of all customers who have
-- made orders in the "orders" table, but have not made any orders
-- for products in the "products" table with a price greater than
-- $100.

  
SELECT DISTINCT customers.name
FROM customers
INNER JOIN orders ON customers.customer_id = orders.customer_id
WHERE customers.customer_id NOT IN (
  SELECT DISTINCT orders.customer_id
  FROM orders
  INNER JOIN products ON orders.product_id = products.product_id
  WHERE products.price > 100.00
);




-- 9. Write a SQL query to retrieve the names of all customers who have
-- made orders in the "orders" table, along with the total amount
-- they have spent on all orders and the average amount they have
-- spent per order.

CREATE TABLE customers (
  customer_id INT PRIMARY KEY,
  name VARCHAR(50)
);

INSERT INTO customers (customer_id, name)
VALUES
  (1, 'Alice'),
  (2, 'Bob'),
  (3, 'Charlie'),
  (4, 'Dave');

CREATE TABLE products (
  product_id INT PRIMARY KEY,
  name VARCHAR(50),
  price DECIMAL(10,2)
);

INSERT INTO products (product_id, name, price)
VALUES
  (1, 'Product A', 50.00),
  (2, 'Product B', 75.00),
  (3, 'Product C', 125.00),
  (4, 'Product D', 150.00);

CREATE TABLE orders (
  order_id INT PRIMARY KEY,
  customer_id INT,
  product_id INT,
  order_date DATE,
  quantity INT,
  FOREIGN KEY (customer_id) REFERENCES customers (customer_id),
  FOREIGN KEY (product_id) REFERENCES products (product_id)
);

INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity)
VALUES
  (1, 1, 1, '2022-01-01', 2),
  (2, 1, 2, '2022-01-02', 1),
  (3, 2, 3, '2022-01-03', 3),
  (4, 3, 4, '2022-01-04', 2),
  (5, 3, 1, '2022-01-05', 1),
  (6, 4, 2, '2022-01-06', 4),
  (7, 2, 1, '2022-01-07', 2),
  (8, 1, 4, '2022-01-08', 1),
  (9, 4, 3, '2022-01-09', 3),
  (10, 3, 2, '2022-01-10', 2);


SELECT
  customers.name,
  SUM(products.price * orders.quantity) AS total_spent,
  AVG(products.price * orders.quantity) AS avg_spent
FROM customers
INNER JOIN orders ON customers.customer_id = orders.customer_id
INNER JOIN products ON orders.product_id = products.product_id
GROUP BY customers.customer_id;


-- 10. Write a SQL query to retrieve the names of all products in
-- the "products" table that have been ordered by customers in more
-- than one country, along with the names of the countries where the
-- products have been ordered.

CREATE TABLE customers (
  customer_id INT PRIMARY KEY,
  name VARCHAR(50),
  country VARCHAR(50)
);

INSERT INTO customers (customer_id, name, country)
VALUES
  (1, 'Alice', 'USA'),
  (2, 'Bob', 'Canada'),
  (3, 'Charlie', 'Mexico'),
  (4, 'Dave', 'USA'),
  (5, 'Eve', 'Canada'),
  (6, 'Frank', 'USA'),
  (7, 'Grace', 'Mexico'),
  (8, 'Henry', 'Canada');

CREATE TABLE products (
  product_id INT PRIMARY KEY,
  name VARCHAR(50)
);

INSERT INTO products (product_id, name)
VALUES
  (1, 'Product A'),
  (2, 'Product B'),
  (3, 'Product C'),
  (4, 'Product D');

CREATE TABLE orders (
  order_id INT PRIMARY KEY,
  customer_id INT,
  product_id INT,
  order_date DATE,
  quantity INT,
  FOREIGN KEY (customer_id) REFERENCES customers (customer_id),
  FOREIGN KEY (product_id) REFERENCES products (product_id)
);

INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity)
VALUES
  (1, 1, 1, '2022-01-01', 2),
  (2, 1, 2, '2022-01-02', 1),
  (3, 2, 3, '2022-01-03', 3),
  (4, 3, 4, '2022-01-04', 2),
  (5, 3, 1, '2022-01-05', 1),
  (6, 4, 2, '2022-01-06', 4),
  (7, 2, 1, '2022-01-07', 2),
  (8, 1, 4, '2022-01-08', 1),
  (9, 4, 3, '2022-01-09', 3),
  (10, 3, 2, '2022-01-10', 2),
  (11, 5, 1, '2022-01-11', 1),
  (12, 5, 3, '2022-01-12', 1),
  (13, 6, 2, '2022-01-13', 1),
  (14, 6, 3, '2022-01-14', 2),
  (15, 7, 1, '2022-01-15', 3),
  (16, 8, 4, '2022-01-16', 1),
  (17, 8, 3, '2022-01-17', 2);


SELECT
  products.name,
  GROUP_CONCAT(DISTINCT customers.country ORDER BY customers.country) AS countries
FROM products
INNER JOIN orders ON products.product_id = orders.product_id
INNER JOIN customers ON orders.customer_id = customers.customer_id
GROUP BY products.product_id
HAVING COUNT(DISTINCT customers.country) > 1;

