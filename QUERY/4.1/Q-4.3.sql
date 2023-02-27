USE Student_db;

CREATE TABLE user (
  id INTEGER PRIMARY KEY,
  name TEXT,
  email TEXT,
  password TEXT,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);

INSERT INTO user (id, name, email, password, created_at, updated_at)
VALUES (1, 'John Doe', 'john@example.com', 'password123', '2023-02-23 12:00:00', '2023-02-23 12:00:00'),
(2, 'Jane', 'jane@gmail.com', 'password345', '2023-01-12  11:30:20', '2023-01-12  11:30:20'),
(3, 'Sarah', 'sarah@example.com', 'pass3879', '2022-12-28 14:00:10', '2022-12-28 14:00:10'),
(4, 'bob', 'bob@example.com', '1239pass', '2023-02-10 16:15:00', '2023-02-10 16:15:00');


CREATE TABLE orderss (
  id INTEGER PRIMARY KEY,
  user_id INTEGER,
  amount FLOAT,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users(id)
);

INSERT INTO orderss (id, user_id, amount, created_at, updated_at)
VALUES (1, 1, 100.00, '2023-02-23 12:00:00', '2023-02-23 12:00:00');

-- 1. Create a new user with the following information:
-- name: John Doe
-- email: john.doe@example.com
-- password: 123456
-- created_at: current timestamp
-- updated_at: current timestamp

INSERT INTO user (name, email, password, created_at, updated_at)
VALUES ('John Doe', 'john.doe@example.com', '123456', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- 2. Retrieve the names and email addresses of all users who
-- have placed at least one order.

SELECT DISTINCT user.name, user.email
FROM user
INNER JOIN orders
ON user.id = orderss.user_id;

-- 3. Retrieve the total amount of orders placed by each user,
-- sorted in descending order of total amount.

SELECT users.id, users.name, SUM(orders.amount) AS total_amount
FROM users
LEFT JOIN orders
ON users.id = orders.user_id
GROUP BY users.id, users.name
ORDER BY total_amount DESC;

-- 4. Retrieve the email address of the user who has placed the
-- most orders.

SELECT users.email
FROM users
INNER JOIN (
  SELECT user_id, COUNT(*) AS num_orders
  FROM orders
  GROUP BY user_id
  ORDER BY num_orders DESC
  LIMIT 1
) AS top_user
ON users.id = top_user.user_id;

-- 5. Retrieve the user IDs and the total amount of orders placed
-- by users who have placed at least one order and whose total
-- amount of orders exceeds $100.

SELECT orders.user_id, SUM(orders.amount) AS total_amount
FROM orders
GROUP BY orders.user_id
HAVING total_amount > 100;

-- 6. Retrieve the number of users who have not placed any
-- orders.

SELECT COUNT(*) AS num_users_without_orders
FROM users
LEFT JOIN orders
ON users.id = orders.user_id
WHERE orders.id IS NULL;

-- 7. Update the user with ID 1 to change their email address to
-- "jane.doe@example.com".

UPDATE users
SET email = 'jane.doe@example.com', updated_at = CURRENT_TIMESTAMP
WHERE id = 1;

-- 8. Delete all orders placed by users whose email address
-- contains the string "test".

DELETE FROM orders
WHERE user_id IN (
  SELECT id
  FROM users
  WHERE email LIKE '%test%'
);

-- 9. Retrieve the total amount of orders placed on each day of
-- the current week, grouped by day.

SELECT DATE_TRUNC('day', created_at) AS order_date, SUM(amount) AS total_amount
FROM orders
WHERE created_at >= DATE_TRUNC('week', CURRENT_TIMESTAMP)
GROUP BY order_date
ORDER BY order_date;

-- 10. Retrieve the IDs and email addresses of users who have
-- placed an order in the current year and whose email address
-- is in the format "example.com".

SELECT users.id, users.email
FROM users
INNER JOIN orders
ON users.id = orders.user_id
WHERE users.email LIKE '%@example.com'
AND DATE_TRUNC('year', orders.created_at) = DATE_TRUNC('year', CURRENT_TIMESTAMP);

