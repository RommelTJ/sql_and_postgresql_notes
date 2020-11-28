# Schema vs Data Migrations

## Schema vs Data Migrations

Let's say we want to take lat, lng columns of type numeric into "loc" of type point.  
We need to take millions of existing rows and merge them into a new point column.

* Add column loc (Schema migration)
* Copy lat/lng to loc (Data migration)
* Drop columns lat/lng (Schema migration)

Moving data around between different columns is a controversial topic.
