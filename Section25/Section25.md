# Advanced Query Tuning

## Developing an Intuitive Understanding of Cost

**Cost**: The amount of time to execute some part of our query plan

Query Plan 1: Use the users_username_idx then get users.
1. Find the ID of user's who have username of 'Alyson14' (Probably just fetch one random page)
 -> Get root node  
 -> Jump to some random child page  
 -> Process the values in that node  
2. Open users heapfile 
3. Jump to each block that has the users we are looking for. (Probably just fetch one random page)

Query Plan 2: Fetch all users and search through them?
1. Open the users heap file
2. Load all users from the first block (Doing steps 2-4 for every page)
3. Process each user, see if it contains the correct username
4. Repeat the process for the next block (step 2).

Note: Loading data from random spots off a hard drive usually takes more time than loading data sequentially.
Let's assume that loading a random page of data takes 4 times longer than loading up pages sequentially.

Query Plan 1 = (2 pages * 4) = 8    
Query Plan 2 = (100 pages * 1) = 100  
Thus, Query Plan 1 is better.  

## Calculating Cost by Hand

Fetch all comments sequentially:  
` ->  Seq Scan on comments  (cost=0.00..1589.10 rows=60410 width=72) (actual time=0.010..10.512 rows=60410 loops=1)"`

* Open the comments heap file
* Load all comments from the first block
* Process each comment in some way (60410 rows)
* Repeat the process for the next block (985 pages)

Formula:   
`(#pages) * 1.0 + (#rows) * 0.01`  
Thus:  
`985 + 60410 * 0.01 = 1589.1`, 1589.1 is the same number estimated by `EXPLAIN ANALYZE`.

## A Touch More on Costs

See Planner Cost Constants in PosgreSQL documentation.

Cost =  
`(# pages read sequentially) * seq_page_cost`  
+ `(# pages read at random) * random_page_cost`  
+ `(# rows scanned) * cpu_tuple_cost`  
+ `(# index entries scanned) * cpu_index_tuple_cost`  
+ `(# times function/operator evaluated) * cpu_operator_cost`  

Cost is relative to sequential page cost.  
* random_page_cost = 4.0
* seq_page_cost = 1.0
* cpu_tuple_cost = .01
* cpu_index_tuple_cost = .005
* cpu_operator_cost = .0025

## Startup vs Total Costs

Why do we see 2 numbers in cost, i.e. `cost=0.00..1589.10`?

The first number is the cost to produce the first row.  
The second number is the cost for this step to produce all rows. 

If startup cost is lower than total cost, it means we can start parallel processing records. If it's the same, all rows 
have to be processed before passing on the results.  

## Costs Flow Up

The costs of a parent node are the sum of the costs of all its child nodes.  

## Use My Index

```postgresql
EXPLAIN ANALYZE SELECT *
FROM likes
WHERE created_at < '2013-01-01';
```

```
"Seq Scan on likes  (cost=0.00..14190.11 rows=63192 width=24) (actual time=0.631..269.713 rows=63150 loops=1)"
"  Filter: (created_at < '2013-01-01 00:00:00-08'::timestamp with time zone)"
"  Rows Removed by Filter: 688859"
"Planning Time: 0.155 ms"
"Execution Time: 273.787 ms"
```

There's no index, so we have to do a sequential scan.

```postgresql
CREATE INDEX likes_createdat_idx ON likes(created_at);
EXPLAIN ANALYZE SELECT *
FROM likes
WHERE created_at < '2013-01-01';
```

```
"Bitmap Heap Scan on likes  (cost=1186.16..6766.06 rows=63192 width=24) (actual time=14.817..77.413 rows=63150 loops=1)"
"  Recheck Cond: (created_at < '2013-01-01 00:00:00-08'::timestamp with time zone)"
"  Heap Blocks: exact=4790"
"  ->  Bitmap Index Scan on likes_createdat_idx  (cost=0.00..1170.37 rows=63192 width=0) (actual time=13.756..13.757 rows=63150 loops=1)"
"        Index Cond: (created_at < '2013-01-01 00:00:00-08'::timestamp with time zone)"
"Planning Time: 0.296 ms"
"Execution Time: 81.712 ms"
```

There's an index, so now it's much faster.  

```postgresql
EXPLAIN ANALYZE SELECT *
FROM likes
WHERE created_at > '2013-01-01';
```

```
"Seq Scan on likes  (cost=0.00..14190.11 rows=688816 width=24) (actual time=0.014..148.473 rows=688859 loops=1)"
"  Filter: (created_at > '2013-01-01 00:00:00-08'::timestamp with time zone)"
"  Rows Removed by Filter: 63150"
"Planning Time: 0.107 ms"
"Execution Time: 186.070 ms"
```

Now it's doing a sequential index! By changing to "greater than" we're trying to fetch like 90% of records, so the index
is no longer useful. Postgres is deciding to do a sequential scan instead because it's the better plan.

If you're not seeing your index to being used, that could be a sign to drop the index.
