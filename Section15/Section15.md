# Database Structure Design Patterns

## SQL designers

* dbdiagram.io
* drawsql.app
* sqldbm.com
* quickdatabasediagrams.com
* ondras.zarovi.cz/sql/demo

## New schema

Using dbdiagram.io
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
```
