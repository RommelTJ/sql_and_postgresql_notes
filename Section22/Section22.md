# Understanding the Internals of PostgreSQL

## Thinking about Performance

* You can get away with quick tips and hints
* Much easier to understand performance if you understand internals
* Take a look at how data is stored and accessed
* Investigate how indexes are stored and used
* Put these together to understand how queries are executed

## Where does Postgres Store Data?

`SHOW data_directory;` where data is kept on disk on base directory.

`SELECT oid, datname FROM pg_database;` shows database installed. There should be a folder with the same oid.

`SELECT * FROM pg_class;` contains information about the files on disk.