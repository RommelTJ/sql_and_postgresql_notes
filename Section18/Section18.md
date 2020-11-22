# How to build a Hashtag System

## Designing a Hashtag System

* Hashtags occur in many locations
* Seeing hashtags in posts, comments, and bios might make you think we need some kind 
of relationship for each.
* We only have to model things that we expect to query.

Do we expect to query to see what posts/comments/users contain a given hashtag? You 
can search for posts that contain a hashtag, but can't search for users or comments 
that use a hashtag.

We only need a `hashtags_posts` table then.

## Tables for Hashtags

We might have a `hashtags` table with `id`, `title`, and `post_id` columns but
for performance reasons it will be done differently.

Table: `hashtags` -> `id`, `title`.
Table: `hashtags_posts` -> `id`, `hashtag_id`, `post_id`

## Including the Hashtag Table

On dbdiagram.io: 
```
table hashtags {
  id SERIAL [pk, increment]
  created_at timestamp
  title VARCHAR(20)
}

table hashtags_posts {
  id SERIAL [pk, increment]
  hashtag_id integer [ref: > hashtags.id]
  post_id integer [ref: > posts.id]
}
```

## A few more user columns

On dbdiagram.io: 
```
table users {
  id SERIAL [pk, increment]
  created_at timestamp
  updated_at timestamp
  username varchar(30)
  bio VARCHAR(400)
  avatar VARCHAR(200)
  phone VARCHAR(25)
  email VARCHAR(40)
  password VARCHAR(50)
  status VARCHAR(15)
}
```
