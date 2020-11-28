# Schema vs Data Migrations

## Schema vs Data Migrations

Let's say we want to take lat, lng columns of type numeric into "loc" of type point.  
We need to take millions of existing rows and merge them into a new point column.

* Add column loc (Schema migration)
* Copy lat/lng to loc (Data migration)
* Drop columns lat/lng (Schema migration)

Moving data around between different columns is a controversial topic.

## Dangers Around Data Migrations

There are several reasons to not run data migrations at the same time as schema migrations.

Should we do everything in a single migration or split over separate migrations?

1. One problem with a single migration is that it can take a really long time. 
2. A transaction can be created to snapshot the table that is being changed. 
3. But our API server is currently running with the current schema. 
4. Our transaction completes, but what about what was inserted in the meantime? 
5. We lose data (probably turns into null values) that happened between steps 2 and 4.
