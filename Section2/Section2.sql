-- Create Table
CREATE TABLE cities (
                        name VARCHAR(50),
                        country VARCHAR(50),
                        population INTEGER,
                        area INTEGER
);

-- Where
SELECT name, area FROM cities WHERE area > 4000;
SELECT name, area FROM cities WHERE area = 8223;
SELECT name, area FROM cities WHERE area <> 8223;
SELECT name, area FROM cities WHERE area != 8223;

-- Compound where
SELECT name, area FROM cities WHERE area BETWEEN 2000 AND 5000;
SELECT name, area FROM cities WHERE name IN ('Delhi', 'Shanghai');
SELECT name, area FROM cities WHERE name NOT IN ('Delhi', 'Shanghai');
SELECT
    name,
    area
FROM
  cities
WHERE
  area NOT IN (3043, 8223)
  AND name = 'Delhi';

SELECT
  name,
  area
FROM
  cities
WHERE
  area NOT IN (3043, 8223)
  OR name = 'Delhi';

-- Calculations in "Where" Clauses
SELECT
    name,
    country,
    (population / area) AS population_density
FROM cities
WHERE population / area > 6000;
