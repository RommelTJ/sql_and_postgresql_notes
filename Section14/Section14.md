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

## Multi-column uniqueness

`ALTER TABLE products ADD UNIQUE (name, department)`

## Adding a validation check

`price INTEGER CHECK (price > 0)` or `ALTER TABLE products ADD CHECK (price > 0)`

## Checks over multiple columns

```postgresql
CREATE TABLE orders (
	id SERIAL PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	created_at TIMESTAMP NOT NULL,
	est_delivery TIMESTAMP NOT NULL,
	CHECK (created_at < est_delivery)
);
```
