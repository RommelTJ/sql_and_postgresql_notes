# How to build a 'Like' System

## Requirements of a Like System

* Each user can like a specific post a single time
* A user should be able to 'unlike' a post
* Need to be able to figure out how many users like a post
* Need to be able to list which users like a post
* Something besides a post might need to be likes (comments, maybe?)
* We might want to think about 'dislikes' or other kinds of interactions

## How to not design a Like system

* Add a comment of likes to posts table.

Bad because: 
* No way to form a relationship between a user and a post
* No way to make sure a user likes a post only once
* No way to make sure a user can only unlike a post they liked
* No way to figure out which users like a post
* No way to remove a like if a user gets deleted

