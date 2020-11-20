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

-- What unique departments are there?
SELECT DISTINCT department FROM products;
SELECT COUNT(DISTINCT department) FROM products;
SELECT DISTINCT department, name FROM products;
-- You can only do a count on distinct with one column

-- Practice with distinct
SELECT COUNT(DISTINCT manufacturer) FROM phones;
