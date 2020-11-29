# Fast Parallel Testing

## A Note On Testing

Main issue with testing:
* We will be using Jest.
* Jest tries to run tests in parallel, not sequential
* Tests could have conflicts with the database
* Main challenge is to make sure the tests don't run into issues with each other.

## Isolation With Schemas

* Schemas are like folders to organize things in a database
* Every database gets a default schema called 'public'
* Each schema can have its own separate copy of a table

## Creating and Accessing Schemas

```postgresql
CREATE SCHEMA test;
```

Creating a users table in test schema: 
```postgresql
CREATE TABLE test.users(
  id SERIAL PRIMARY KEY,
  username VARCHAR
);

INSERT INTO test.users (username) VALUES ('JohnDoe'), ('alex');
```

## Controlling Schema Access with Search Paths

To control which schema Postgres is going to access by default if we don't specifically
designate it inside of our query. It does that using the `search_path`:  

First try a schema with the same name as the current user, then fall back to public
```postgresql
SHOW search_path; -- "$user", public
```

Specifying a test schema: 
```postgresql
SET search_path TO test, public;
SELECT * FROM users; -- defaults to test.users
```
