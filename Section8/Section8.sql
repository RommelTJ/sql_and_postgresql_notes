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

-- Find the 4 products with the highest price and the 4 products with the highest price/weight ratio
(SELECT * FROM products ORDER BY price DESC LIMIT 4)
UNION
(SELECT * FROM products ORDER BY (price/weight) DESC LIMIT 4);

-- Intersect example
(SELECT * FROM products ORDER BY price DESC LIMIT 4)
INTERSECT
(SELECT * FROM products ORDER BY (price/weight) DESC LIMIT 4);

(SELECT * FROM products ORDER BY price DESC LIMIT 4)
INTERSECT ALL
(SELECT * FROM products ORDER BY (price/weight) DESC LIMIT 4);
