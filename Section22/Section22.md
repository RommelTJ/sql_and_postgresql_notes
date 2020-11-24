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

## Heaps, Blocks and Tuples

Heap or Heap File:
File that contains all the data (rows) of our table

Tuple or Item:
Individual row from the table

Blocks or Page:
The heap file is divided into many different 'blocks' or 'pages'. Each page/block stores some number of rows.
Each block is 8kb in size.

## Block Data Layout

Each block has a section for: 
* Information about the block.
* Location of items in block
* Free space
* Data for tuples in block
