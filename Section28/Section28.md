# Simplifying Queries with Views

## Most Popular Users

Show the most popular users; the users who are tagged the most.

```postgresql
SELECT username, COUNT(*) 
FROM users
JOIN (
  SELECT user_id FROM photo_tags
  UNION ALL
  SELECT user_id FROM caption_tags
) AS tags ON (tags.user_id = users.id)
GROUP BY users.username
ORDER BY COUNT(*) DESC;
```

Awkward: Have to take a union to do what we want to query.

## A Possible Solution For Merging Tables

Solution #1: Merge the two tables, delete the original ones.  
Downside: We can't copy over the IDs of photo_tags and caption_tags since they must be unique.
Downside: If we delete original tables, we break any existing queries that refer to them!

## Creating a View

Solution #2: Create a view!
* Create a fake table that has rows from other tables
* These can be exact rows as they exist on another table, or a computed value
* Can reference the view in any place we'd normally reference a table
* View doesn't actually create a new table or move any data around
* Doesn't have to be used for a union! Can compute absolutely any values.

```postgresql
CREATE VIEW tags AS (
  SELECT id, created_at, user_id, post_id, 'photo_tag' AS type FROM photo_tags
  UNION ALL
  SELECT id, created_at, user_id, post_id, 'caption_tag' AS type FROM caption_tags
);

SELECT * FROM tags;

SELECT username, COUNT(*) 
FROM users
JOIN tags ON (tags.user_id = users.id)
GROUP BY users.username
ORDER BY COUNT(*) DESC;
```

## When to use a view?

Show the 10 most recent posts:  
```postgresql
CREATE VIEW recent_posts AS (
  SELECT * FROM posts ORDER BY created_at DESC LIMIT 10
);

SELECT * FROM recent_posts;
```
