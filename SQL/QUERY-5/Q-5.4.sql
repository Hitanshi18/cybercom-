create DATABASE IF NOT EXISTS user_db;
USE user_db;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50)
);

INSERT INTO customers VALUES
    (1, 'John'),
    (2, 'Jane'),
    (3, 'David');
    
    CREATE TABLE categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(50)
);

INSERT INTO categories VALUES
    (1, 'Category A'),
    (2, 'Category B'),
    (3, 'Category C');
    
    CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

INSERT INTO products VALUES
    (1, 'Product A1', 1),
    (2, 'Product A2', 1),
    (3, 'Product B1', 2),
    (4, 'Product B2', 2),
    (5, 'Product C1', 3);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
     product_id INT,
    order_date DATE,
    quantity int,
    price DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO orders VALUES
    (1, 1,1, '2022-01-01',15,500),
    (2, 1, 2,'2022-02-01',27,800),
    (3, 2, 3,'2022-01-01',8,200),
    (4, 2, 4,'2022-02-01',5,100),
    (5, 3, 3,'2022-01-01',10,900);

CREATE TABLE returns (
    return_id INT PRIMARY KEY,
    order_id INT,
    return_date DATE,
    quantity int,
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

INSERT INTO returns VALUES
    (1, 1, '2022-02-15',10),
    (2, 4, '2022-02-20',5),
    (3, 5, '2022-02-28',2);
    
    

-- 1. Write a SQL query to retrieve the names of all customers
-- who have made at least one order in the "orders" table and
-- have not made any orders in the "returns" table.

SELECT DISTINCT c.customer_name
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
LEFT JOIN returns r ON o.order_id = r.order_id
WHERE r.order_id IS NULL;


-- 2. Write a SQL query to retrieve the names of all customers
-- who have made orders in the "orders" table and have
-- returned at least one item in the "returns" table.

SELECT DISTINCT c.customer_name
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN returns r ON o.order_id = r.order_id;


-- 3. Write a SQL query to retrieve the names of all customers
-- who have made orders in the "orders" table and have not
-- returned any items in the "returns" table.

SELECT DISTINCT c.customer_name
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
LEFT JOIN returns r ON o.order_id = r.order_id
WHERE r.order_id IS NULL;


-- 4. Write a SQL query to retrieve the names of all customers
-- who have made orders in the "orders" table and have
-- returned more items than they have ordered.

SELECT DISTINCT c.customer_name
FROM customers c
JOIN (
    SELECT o.customer_id, SUM(o.quantity) AS ordered, SUM(r.quantity) AS returned
    FROM orders o
    LEFT JOIN returns r ON o.order_id = r.order_id
    GROUP BY o.customer_id
) t ON c.customer_id = t.customer_id
WHERE t.returned > t.ordered;


-- 5. Write a SQL query to retrieve the names of all customers
-- who have made orders in the "orders" table and have not
-- returned more items than they have ordered.

SELECT c.customer_name
FROM customers c
WHERE c.customer_id IN (
  SELECT o.customer_id
  FROM orders o
  GROUP BY o.customer_id
  HAVING SUM(o.quantity) <= COALESCE((
    SELECT SUM(r.quantity)
    FROM returns r
    WHERE r.customer_id = o.customer_id
  ), 0)
);
 


-- 6. Write a SQL query to retrieve the names of all customers
-- who have made orders in the "orders" table and have spent
-- more than $100 in total on all orders.

SELECT
    c.customer_name
FROM
    customers c
    JOIN orders o ON c.customer_id = o.customer_id
GROUP BY
    c.customer_name
HAVING
    SUM(o.quantity * o.price) > 100;


-- 7. Write a SQL query to retrieve the names of all customers
-- who have made orders in the "orders" table and have spent
-- more than $100 in total on all orders, sorted by the total
-- amount spent in descending order.

SELECT
    customers.customer_name,
    SUM(orders.price) AS total_spent
FROM
    customers
    INNER JOIN orders ON customers.customer_id = orders.customer_id
GROUP BY
    customers.customer_id
HAVING
    SUM(orders.price) > 100.00
ORDER BY
    total_spent DESC;

-- 8. Write a SQL query to retrieve the names of all customers
-- who have made orders in the "orders" table and have ordered
-- products in all categories.

SELECT c.customer_name
FROM (
    SELECT o.customer_id, p.category_id
    FROM orders o
    INNER JOIN products p ON o.product_id = p.product_id
    GROUP BY o.customer_id, p.category_id
    HAVING COUNT(DISTINCT p.category_id) = (SELECT COUNT(*) FROM categories)
) AS t
INNER JOIN customers c ON t.customer_id = c.customer_id;

-- 9. Write a SQL query to retrieve the names of all customers
-- who have made orders in the "orders" table and have not
-- ordered products in all categories.

SELECT c.customer_name
FROM customers c
WHERE EXISTS (
  SELECT *
  FROM categories
  WHERE NOT EXISTS (
    SELECT *
    FROM order_details od
    JOIN products p ON od.product_id = p.product_id
    WHERE od.order_id IN (
      SELECT o.order_id
      FROM orders o
      WHERE o.customer_id = c.customer_id
    )
    AND p.category_id = categories.category_id
  )
)

-- 10. Write a SQL query to retrieve the names of all
-- customers who have made orders in the "orders" table and
-- have ordered products in at least two different categories.

SELECT c.customer_name
FROM customers c
WHERE c.customer_id IN (
  SELECT o.customer_id
  FROM order_details od

