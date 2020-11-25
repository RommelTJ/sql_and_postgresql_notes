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
