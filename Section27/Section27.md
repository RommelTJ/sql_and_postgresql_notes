# Recursive Common Table Expressions

## Recursive CTE

Important Notes on Recursive CTEs:
* Very, very different from simple CTEs.
* Useful anytime you have a tree or graph-type data structure
* Must use a 'union' keyword. Simple CTEs don't have to use a union.
* This is super, super advanced.

```postgresql
WITH RECURSIVE countdown(val) AS (
  SELECT 3 AS val
  UNION
  SELECT val - 1 FROM countdown WHERE val > 1
)
SELECT * 
FROM countdown;
```
