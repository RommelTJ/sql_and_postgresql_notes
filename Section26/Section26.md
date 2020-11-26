# Simple Common Table Expressions

## Common Table Expressions (CTE)

Show the username of users who were tagged in a caption or photo before 
January 7th, 2010. Show the date they were tagged.  
```postgresql
SELECT username, tags.created_at 
FROM users 
JOIN (
  SELECT user_id, created_at FROM caption_tags
  UNION ALL
  SELECT user_id, created_at FROM photo_tags
) AS tags ON tags.user_id = users.id
WHERE tags.created_at < '2010-01-07';
```

This can be simplified with a Common Table Expression. 

```postgresql
WITH tags AS (
  SELECT user_id, created_at FROM caption_tags
  UNION ALL
  SELECT user_id, created_at FROM photo_tags
)
SELECT username, tags.created_at 
FROM users 
JOIN tags ON tags.user_id = users.id
WHERE tags.created_at < '2010-01-07';
```

Common Table Expressions: 
* Defined with a 'with' before the main query
* Produces a table that we can refer to anywhere else
* Two forms  
* Simple form used to make a query easier to understand/read
* Recursive form used to write queries that are otherwise impossible to write!

