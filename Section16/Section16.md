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

## Designing a Like system

Add a third table called `likes` with a unique constraint for `UNIQUE(user_id, post_id)`

## Making a Reaction System instead

Add a third table called `reactions` with a unique constraint for `UNIQUE(user_id, post_id)` with a `type` column
like `like`, `love`, `care`, `sad`, etc.

## Polymorphic Associations

Allowing the user to like either a post or a comment.

Solution #1:
Not really recommended.
* A like can be a 'post like' or a 'comment like'.
* Requires your app to figure out the meaning of each like

Example: likes table has `id`, `user_id`, `liked_id`, `liked_type` where liked type can be post or comment

The downside with this approach is that `liked_id` can't be a foreign key column. It would be a plain integer.
We would lose all of the advantages of having foreign keys.
