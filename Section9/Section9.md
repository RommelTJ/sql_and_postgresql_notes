# Assembling Queries with Subqueries

## Subqueries

Subqueries can be used as...  
* A source of a value (A)
* A source of rows (B)
* A source of a column (C)

```postgresql
SELECT 
  p1.name,
  (SELECT COUNT(name) FROM products) -- A
FROM (SELECT * FROM products) AS p1 -- B
JOIN (SELECT * FROM products) AS p2 ON p1.id = p2.id -- B
WHERE p1.id IN (SELECT id FROM products); -- C
```

## Understanding the shape of a query result

```
SELECT * FROM orders -> Many rows, many columns
SELECT id FROM orders -> Many rows, one column
SELECT COUNT(*) FROM orders -> One row, one column (single value - Scalar query)
```
