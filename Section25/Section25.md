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