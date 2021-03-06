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

-- Investigating data
SELECT * FROM users;
SELECT * FROM products;
SELECT * FROM orders;

-- Group by review
SELECT paid, COUNT(*) FROM orders GROUP BY paid;

-- Inner Join review
SELECT first_name, last_name, paid
FROM users
JOIN orders o on users.id = o.user_id;
