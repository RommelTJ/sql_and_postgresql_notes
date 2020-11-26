# Optimizing Queries with Materialized Views

## Materialized Views

Views = Query that gets executed every time you refer to it.

Materialized Views = Query that gets executed only at very specific times, but the 
results are saved and can be referenced without rerunning the query.

We use materialized views when a query is very expensive so it doesn't have to re-run.

## Grouping by Week

For each week, show the number of likes that posts and comments received. Use the 
post and comment created_at date, not when the like was received.


