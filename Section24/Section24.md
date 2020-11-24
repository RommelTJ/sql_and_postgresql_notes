# Basic Query Tuning

## The Query Processing Pipeline

What happens where you feed a query into postgres?

1. Parser. Parser makes sure that what you wrote out is actually valid SQL. Builds Query Tree.
2. Rewriter. Decompose views into underlying table references.
3. Planner. Look at query tree and decide on fastest strategy to look up records. Use index? Full Table scan? etc.
4. Execute. Run the query!
