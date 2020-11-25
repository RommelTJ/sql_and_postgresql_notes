# Basic Query Tuning

## The Query Processing Pipeline

What happens where you feed a query into postgres?

1. Parser. Parser makes sure that what you wrote out is actually valid SQL. Builds Query Tree.
2. Rewriter. Decompose views into underlying table references.
3. Planner. Look at query tree and decide on fastest strategy to look up records. Use index? Full Table scan? etc.
4. Execute. Run the query!

## Explain and Explain Analyze

Explain:  
Build a query and display info about it

Explain analyze:  
Build a query plan, run it, and display info about it.

These are for benchmarking and evaluating queries, not for use in real data fetching.

PGAdmin also has a built in feature.

## Solving an Explain Mystery

* Arrows are query nodes. Steps for accessing data or doing processing.
* Start from the inner-most node.
* Result of the query nodes passes up to the parent nodes.
* Hash Join is combining the output. This is the final result.

Even without `ANALYZE`, `EXPLAIN` can guess how many rows and width in bytes is going to retrieve.  
Postgres keeps detailed statistics that it can use to determine this.
```postgresql
SELECT * FROM pg_stats WHERE tablename = 'users';
```