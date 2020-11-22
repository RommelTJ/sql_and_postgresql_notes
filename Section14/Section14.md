# Database-Side Validation and Constraints

## Applying a null constraint

`price INTEGER NOT NULL` or `ALTER TABLE products ALTER COLUMN price SET NOT NULL`
`UPDATE products SET price = 999 WHERE price IS NULL;`
