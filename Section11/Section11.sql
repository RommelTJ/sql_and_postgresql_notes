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

-- The Greatest value in a list
SELECT GREATEST(20, 10, 30); -- 30

-- Compute the cost to ship each item
-- Shipping is maximum of (weight * 2) or 30
SELECT name, weight, GREATEST(30, weight * 2) AS cost_to_ship FROM products;

-- The least value in a list;
SELECT LEAST(20, 10, 30); -- 10

-- All products are on sale
-- Price is the least of the product's price * 0.5 or $400.
SELECT name, price, LEAST(400, price * 0.5) FROM products;

-- Print each product and its price. Also print a description of the price.
-- If price > 600, then 'high', If price > 300 'medium', else 'cheap'.
SELECT
  name,
  price,
  (CASE WHEN price > 600 THEN 'high'
        WHEN price > 300 THEN 'medium'
        ELSE 'cheap' END
  ) AS description
FROM products;
