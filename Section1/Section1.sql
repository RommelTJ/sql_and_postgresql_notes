-- Create Table
CREATE TABLE cities (
  name VARCHAR(50),
  country VARCHAR(50),
  population INTEGER,
  area INTEGER
);

-- Inserting
INSERT INTO cities (name, country, population, area)
VALUES ('Tokyo', 'Japan', 38505000, 8223);

INSERT INTO cities (name, country, population, area)
VALUES
  ('Delhi', 'India', 28125000, 2240),
  ('Shanghai', 'China', 22125000, 4015),
  ('Sao Paulo', 'Brazil', 20935000, 3043);

-- Select
SELECT * from cities;
SELECT name, country FROM cities;

-- Calculated column
SELECT
  name,
  country,
  (population / area) AS population_density
FROM cities;

-- String Operators and Functions
SELECT (name || ', ' || country) AS location FROM cities;
SELECT CONCAT(name, ', ', country) AS location FROM cities;
SELECT
  CONCAT(UPPER(name), ', ', UPPER(country)) AS location
FROM
  cities;
SELECT
  LOWER(CONCAT(name, ', ', country)) AS location
from
  cities;
