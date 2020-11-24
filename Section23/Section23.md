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
