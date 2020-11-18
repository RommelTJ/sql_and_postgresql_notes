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

-- Embedding in Select
SELECT
    name,
    price,
    price / (SELECT MAX(price) FROM phones) AS price_ratio
FROM phones;

-- Subqueries in a FROM
-- Any subquery is ok, as long as the outer SELECTs/WHEREs/etc are compatible
-- You must apply an alias to the result of the subquery.
SELECT name, price / weight AS price_weight_ratio FROM products;
SELECT name, price_weight_ratio
FROM (SELECT name, price / weight AS price_weight_ratio FROM products) AS p
WHERE price_weight_ratio > 5;

-- From subqueries that return a value
SELECT MAX(price) FROM products;
SELECT * FROM (SELECT MAX(price) FROM products) AS p;

-- Find the average number of orders for all users.
SELECT user_id, COUNT(*) AS order_count FROM orders GROUP BY user_id;
SELECT AVG(o.order_count) FROM (SELECT user_id, COUNT(*) AS order_count FROM orders GROUP BY user_id) AS o;

-- Subquery From's
SELECT AVG(price) AS avg_price FROM phones GROUP BY manufacturer;
SELECT MAX(avg_price) AS max_average_price FROM (SELECT AVG(price) AS avg_price FROM phones GROUP BY manufacturer) as m;

-- Subqueries in a Join clause
SELECT user_id FROM orders WHERE product_id = 3;
SELECT first_name FROM users
JOIN (SELECT user_id FROM orders WHERE product_id = 3) as o
ON o.user_id = users.id;
