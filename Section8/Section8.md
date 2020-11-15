# Unions and Intersections with Sets

## Union

Union appends two queries together.
Union ALL will include duplicates.
You don't need parenthesis, but they help provide context.
You can only use Union between two queries that have the same columns (same name and data types).

## Set operators

```
UNION -> Join together the results of two queries and remove duplicate rows
UNION ALL -> Join together results of two queries
INTERSECT -> Find the rows common in the results of two queries. Remove duplicates.
INTERSECT ALL -> Find the rows common in the results of two queries.
EXCEPT -> Find the rows that are present in first query but not second query. Remove duplicates.
EXCEPT ALL -> Find the rows that are present in first query but not second query.
```
