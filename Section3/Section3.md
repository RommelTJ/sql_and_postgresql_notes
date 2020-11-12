# Working with Tables

What Tables Should we make?
Common features are frequently built with conventional table names and columns.
Google: "sql schema upvote system".

What type of resources exist in your app? Create a separate table for each of these features.

Features that seem to indicate a relationship or ownership between two types of resources need to be reflected in our 
table design.

## One-to-Many Relationship
A user has many photos ("has many")

## Many-to-One Relationship
A photo has one user ("has one")

## One-to-One Relationship
A company has a CEO ("has a")

## Many-to-Many Relationship
A student has many classes. Classes have many students. ("has many" / "have many")

## Primary Key
* Uniquely identifies this record in this table.
* No other row in the same table has the same value.
* 99% of time its called 'id'.
* Either an integer or a UUID.
* Will never change.

## Foreign Key
* Identifies a record (usually in another table) that this row is associate with.
* Rows only have this if they belong to another record.
* Many rows in the same table can have the same foreign key.
* Name varies, usually called like 'xyz_id'.
* Exactly equal to the primary key of the referenced row.
* Will change if the relationship changes.

Example: 
A Photo has many comments, so the comments get a foreign key column pointing at a photo.  
A User has many comments, so the comments get a foreign key column pointing to a user.  
