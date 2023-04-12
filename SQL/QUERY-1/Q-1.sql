CREATE DATABASE IF NOT EXISTS Student_db;
USE Student_db;

CREATE TABLE categories (
  category_id INT PRIMARY KEY,
  category_name VARCHAR(255)
);
INSERT INTO categories
VALUES(1 , "TV Set");

INSERT INTO categories
VALUES(2 , "Laptop");

SELECT * FROM categories;

CREATE TABLE products (
  product_id INT PRIMARY KEY,
  product_name VARCHAR(255),
  price DECIMAL(10, 2)
);

INSERT INTO products
VALUES (1 , "Samsung" , 15000);

INSERT INTO products
VALUES (2 , "Dell" , 65000);

INSERT INTO products
VALUES (1 , "hp" , 45000);

SELECT * FROM products;

CREATE TABLE product_categories (
  product_id INT,
  category_id INT,
  PRIMARY KEY (product_id, category_id),
  FOREIGN KEY (product_id) REFERENCES products(product_id),
  FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

INSERT INTO product_categories
VALUES(1, 1, "USB PORT");

INSERT INTO product_categories
VALUES(2, 2, "Charger");

SELECT * FROM product_categories;