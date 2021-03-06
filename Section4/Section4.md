# Relating Records with Joins

## Joins

* Produces values by merging together rows from different related tables.
* Use a join most times that you're asked to find data that involves multiple resources.

## Aggregation

* Looks at many rows and calculates a single value.
* Words like 'most', 'average', 'least' are a sign that you need to use an aggregation.

## Notes on Joins

* Table order between FROM and JOIN frequently makes a difference.
* We must give context if column names collide.
* Tables can be renamed using the 'AS' keyword.
* There are a few kinds of joins.

## Four kinds of Joins

### Inner Join (default)

![Inner Join](inner_join.png)

```postgresql
SELECT url, username FROM photos JOIN users on users.id = photos.user_id;
```

Order matters doesn't matter for inner join.

### Left Outer Join

![Left Outer Join](left_outer_join.png)

```postgresql
SELECT url, username FROM photos LEFT JOIN users on users.id = photos.user_id;
```

Order matters for left outer join.

### Right Outer Join

![Right Outer Join](right_outer_join.png)

```postgresql
SELECT url, username FROM photos RIGHT JOIN users on users.id = photos.user_id;
```

Order matters for right outer join.

### Full Join

![Full Join](full_join.png)

```postgresql
SELECT url, username FROM photos FULL JOIN users on users.id = photos.user_id;
```

Order matters doesn't matter for full joins.
