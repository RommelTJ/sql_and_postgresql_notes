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

## Dropping an Index

```postgresql
DROP INDEX users_username_idx;
```

## Benchmarking Queries

```postgresql
EXPLAIN ANALYZE SELECT * FROM users WHERE username = 'Emil30';
```

With Index:
Planning Time: 0.088ms. Execution Time: 0.413ms.

Without Index: 
Planning Time: 0.177ms. Execution Time: 1.355ms. Over 3x slower.

## Downsides of Indexes

```postgresql
SELECT pg_size_pretty(pg_relation_size('users_username_idx'));
```

Size of users table: 872 kB  
Size of users_username_idx index: 184 kB

Downsides: 
* Can be large! Stores data from at least one column of the real table
* Slows down insert/update/delete. The index has to be updated!
* Index might not actually get used!

## Index Types

* BTree Index (most common). General purpose index. 99% of the time you want this.
* Hash. Speeds up simple equality checks.
* GiST. Geometry, full-text search.
* SP-GiST. Clustered data, such as dates. Many rows might have the same year.
* GIN. For columns that contain arrays or JSON data.
* BRIN. Specialized for really large datasets.

## Automatically Generated Indexes

* Postgres automatically creates an index for the primary key column of every table.
* Postgres automatically creates an index for any 'unique' constraint.
* These don't get listed under 'indexes' in pgAdmin!

To show all the indexes in the database: 
```postgresql
SELECT relname, relkind FROM pg_class WHERE relkind = 'i';
```

## Behind the Scenes of Indexes

Indexes also have 8kb pages, like Heap Files. They're also structured in the same manner.

You can use an extension to inspect the indexes:
```postgresql
CREATE EXTENSION pageinspect;
SELECT * FROM bt_metap('users_username_idx');
SELECT * FROM bt_page_items('users_username_idx', 3);
SELECT ctid, * FROM users WHERE username = 'Aaliyah.Hintz';
```
