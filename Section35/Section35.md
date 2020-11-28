# Security Around PostgreSQL

## SQL Injection Exploits

We NEVER, EVER directly concatenate user-provided input into a SQL query

There are a variety of safe ways to get user-provided values into a string.
