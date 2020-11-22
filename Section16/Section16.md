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

## Polymorphic Association Alternative Implementation

Solution #2:
* Each possible type of relationship gets its own Foreign Key column
* We'd still want to make sure either post_id or comment_id is not null

Example: likes table has `id`, `user_id`, `post_id`, `comment_id` where post_id and comment_id are true foreign key 
columns.

Add check of:
```
(
  COALESCE((post_id)::BOOLEAN::INTEGER, 0)
  +
  COALESCE((comment_id)::BOOLEAN::INTEGER, 0)
) = 1
```

## The Simplest Alternative

Solution #3:
* Each type of like gets its own table
* Still want to write queries that will count up all likes? You can use a Union or a View.

Example: `posts_likes` table, `comments_likes` table, etc. 

## Our approach

Solution #2
When a user likes a post or a comment, we don't need to store post or comment specific logic so it's not necessary 
to create separate tables.

On dbdiagram.io: 
```
table users {
  id SERIAL [pk, increment]
  created_at timestamp
  updated_at timestamp
  username varchar(30)
}

table comments {
  id SERIAL [pk, increment]
  created_at timestamp
  updated_at timestamp
  contents varchar(240)
  user_id integer [ref: > users.id]
  post_id integer [ref: > posts.id]
}

table posts {
  id SERIAL [pk, increment]
  created_at timestamp
  updated_at timestamp
  url varchar(200)
  user_id integer [ref: > users.id]
}

table likes {
  id SERIAL [pk, increment]
  created_at timestamp
  user_id integer [ref: > users.id]
  post_id integer [ref: > posts.id]
  comment_id integer [ref: > comments.id]
}
```
