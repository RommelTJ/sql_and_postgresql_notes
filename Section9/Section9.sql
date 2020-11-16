-- Schemas
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR,
  last_name VARCHAR
);
CREATE TABLE products (
  id SERIAL PRIMARY KEY,
  name VARCHAR,
  department VARCHAR,
  price INTEGER,
  weight INTEGER
);
CREATE TABLE orders (
  id SERIAL PRIMARY KEY,
  user_id INTEGER REFERENCES users(id),
  product_id INTEGER REFERENCES products(id),
  paid BOOLEAN
);
CREATE TABLE phones (
  name VARCHAR(200),
  manufacturer VARCHAR(200),
  price INTEGER,
  units_sold INTEGER
);

-- List the name and price of all products that are more expensive than all products in the Toys department
SELECT name, price
FROM products
WHERE price > (
  SELECT MAX(price) FROM products WHERE department = 'Toys'
);

-- Understanding data
SELECT * FROM orders;
SELECT id FROM orders;
SELECT COUNT(*) FROM orders;

-- Subqueries in a Select
-- Subquery must result in a single value (one row, one column)
SELECT name, price, (SELECT MAX(price) FROM products)
FROM products
WHERE price > 876;

SELECT name, price, (SELECT price FROM products WHERE id = 3) AS id_3_price
FROM products
WHERE price > 876;
