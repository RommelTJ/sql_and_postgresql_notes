# A Look at Indexes for Performance

## Full Table Scans

For a query like  
`SELECT * FROM users WHERE username = 'Riann';`  
PostgreSQL has to load all the users up into memory.  

Then it has to search for a username called 'Riann' (Search each record one-by-one).     
Whenever possible, we try to minimize how much data is taken out of a Heap file into memory.

Full Table Scan:  
Postgres has to load many (or all) rows from the heap file to memory.    
Frequently (but not always) poor performance.  

## What's an Index

An index is a data structure that efficiently tells us what block/index a record is stored at.  

## How an Index Works

1. Decide which column we want to have very fast lookups on, i.e. 'username'.
2. Extract only the property we want to do fast lookups by and the block/index for each.
3. Sort in some meaningful way, e.g. Alphabetical for text, value for numbers, etc.
4. Organize into a tree data structure. Evenly distribute values in the leaf nodes, on order left to right.
5. Add helpers to Root Node, e.g. functions that help you determine which leaf node to go to.
6. Search index.
7. Go to Block / Index match in Heap File.

## Creating an Index

```postgresql
CREATE INDEX ON users (username);
```
