# Optimizing Queries with Materialized Views

## Materialized Views

Views = Query that gets executed every time you refer to it.

Materialized Views = Query that gets executed only at very specific times, but the 
results are saved and can be referenced without rerunning the query.

We use materialized views when a query is very expensive so it doesn't have to re-run.

## Grouping by Week

For each week, show the number of likes that posts and comments received. Use the 
post and comment created_at date, not when the like was received.

```postgresql
SELECT 
  DATE_TRUNC('week', COALESCE(posts.created_at, comments.created_at)) AS week,
  COUNT(posts.id) AS num_likes_for_posts,
  COUNT(comments.id) AS num_likes_for_comments
FROM likes
LEFT JOIN posts ON (posts.id = likes.post_id)
LEFT JOIN comments ON (comments.id = likes.comment_id)
GROUP BY week
ORDER BY week;
```

Works, but it's very slow and inefficient.

## Creating and Refreshing Materialized Views

Creating a materialized view:  
```postgresql
CREATE MATERIALIZED VIEW weekly_likes AS (
  SELECT 
    DATE_TRUNC('week', COALESCE(posts.created_at, comments.created_at)) AS week,
    COUNT(posts.id) AS num_likes_for_posts,
    COUNT(comments.id) AS num_likes_for_comments
  FROM likes
  LEFT JOIN posts ON (posts.id = likes.post_id)
  LEFT JOIN comments ON (comments.id = likes.comment_id)
  GROUP BY week
  ORDER BY week
) WITH DATA;

SELECT * FROM weekly_likes;
```

If the comments and likes change, they don't automatically change. We have to tell 
Postgres to update them.

Refreshing data from materialized view:
```postgresql
DELETE FROM posts WHERE created_at < '2010-02-01';

REFRESH MATERIALIZED VIEW weekly_likes;
```

Refreshing is a very manual process. Only use them when things have to be done rarely.
