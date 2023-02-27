USE Student_db;

-- 1. Write a SQL query to retrieve the names of all customers
-- who have made at least one order in the "orders" table and
-- have not made any orders in the "returns" table.

SELECT DISTINCT o.customer_id, c.customer_name
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
LEFT JOIN returns r ON o.order_id = r.order_id AND o.customer_id = r.customer_id
WHERE r.order_id IS NULL

-- 2. Write a SQL query to retrieve the names of all customers
-- who have made orders in the "orders" table and have
-- returned at least one item in the "returns" table.

SELECT DISTINCT c.customer_name
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN returns r ON o.order_id = r.order_id AND o.customer_id = r.customer_id

-- 3. Write a SQL query to retrieve the names of all customers
-- who have made orders in the "orders" table and have not
-- returned any items in the "returns" table.

SELECT DISTINCT c.customer_name
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
LEFT JOIN returns r ON o.order_id = r.order_id AND o.customer_id = r.customer_id
WHERE r.order_id IS NULL

-- 4. Write a SQL query to retrieve the names of all customers
-- who have made orders in the "orders" table and have
-- returned more items than they have ordered.

SELECT c.customer_name
FROM customers c
WHERE c.customer_id IN (
  SELECT o.customer_id
  FROM orders o
  GROUP BY o.customer_id
  HAVING SUM(o.quantity) < (
    SELECT COALESCE(SUM(r.quantity), 0)
    FROM returns r
    WHERE r.customer_id = o.customer_id
  )
)

-- 5. Write a SQL query to retrieve the names of all customers
-- who have made orders in the "orders" table and have not
-- returned more items than they have ordered.

SELECT c.customer_name
FROM customers c
WHERE c.customer_id IN (
  SELECT o.customer_id
  FROM orders o
  GROUP BY o.customer_id
  HAVING SUM(o.quantity) <= (
    SELECT COALESCE(SUM(r.quantity), 0)
    FROM returns r
    WHERE r.customer_id = o.customer_id
  )
)

-- 6. Write a SQL query to retrieve the names of all customers
-- who have made orders in the "orders" table and have spent
-- more than $100 in total on all orders.

SELECT c.customer_name
FROM customers c
WHERE c.customer_id IN (
  SELECT o.customer_id
  FROM orders o
  GROUP BY o.customer_id
  HAVING SUM(o.order_total) > 100
)

-- 7. Write a SQL query to retrieve the names of all customers
-- who have made orders in the "orders" table and have spent
-- more than $100 in total on all orders, sorted by the total
-- amount spent in descending order.

SELECT c.customer_name
FROM customers c
WHERE c.customer_id IN (
  SELECT o.customer_id
  FROM orders o
  GROUP BY o.customer_id
  HAVING SUM(o.order_total) > 100
)
ORDER BY (
  SELECT SUM(o.order_total)
  FROM orders o
  WHERE o.customer_id = c.customer_id
) DESC


-- 8. Write a SQL query to retrieve the names of all customers
-- who have made orders in the "orders" table and have ordered
-- products in all categories.

SELECT c.customer_name
FROM customers c
WHERE NOT EXISTS (
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
