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
