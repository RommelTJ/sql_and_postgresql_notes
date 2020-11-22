# Database-Side Validation and Constraints

## Applying a null constraint

`price INTEGER NOT NULL` or `ALTER TABLE products ALTER COLUMN price SET NOT NULL`
`UPDATE products SET price = 999 WHERE price IS NULL;`

## Default Column Values

`price INTEGER DEFAULT 999` or `ALTER TABLE products ALTER COLUMN price SET DEFAULT 999`

## Unique constraints

`name VARCHAR(50) UNIQUE` or `ALTER TABLE products ADD UNIQUE (name)`

## Dropping a constraint

`ALTER TABLE products DROP CONSTRAINT products_name_key;`
