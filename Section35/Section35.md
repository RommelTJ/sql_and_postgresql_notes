# Security Around PostgreSQL

## SQL Injection Exploits

We NEVER, EVER directly concatenate user-provided input into a SQL query

There are a variety of safe ways to get user-provided values into a string.

## Handling SQL Injection with Prepared Statements

* Create a 'prepared' statement
* Execute the prepared statement

Postgres is then aware that it's expecting values and will protect around arbitrary sql
injection attacks.

You cannot specify columns or tables with prepared statements, only values.
