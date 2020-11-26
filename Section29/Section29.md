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
