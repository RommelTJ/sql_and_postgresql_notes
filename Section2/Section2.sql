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
