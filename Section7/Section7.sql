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

-- The basics of sorting
SELECT * FROM products ORDER BY price; -- default ascending
SELECT * FROM products ORDER BY price DESC;

-- Two variations on sorting
SELECT * FROM products ORDER BY name;
SELECT * FROM products ORDER BY name desc;

SELECT * FROM products ORDER BY price, weight;
SELECT * FROM products ORDER BY price ASC, weight DESC;

-- OFFSET
SELECT * FROM users OFFSET 40;

-- LIMIT
SELECT * FROM users OFFSET 40 LIMIT 2;

-- Sorting, Offsetting and Limiting
SELECT name FROM phones ORDER BY price DESC LIMIT 2 OFFSET 1;
