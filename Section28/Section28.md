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
