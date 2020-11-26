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
