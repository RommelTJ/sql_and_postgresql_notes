# Managing Database Design with Schema Migrations

## A Story on Migrations

Big Lessons: 
1. Changes to the DB structure and changes to clients need to be made at precisely 
the same time.
2. When working with other engineers, we need a really easy way to tie the structure
of our database to our code.

## Migration Files

Schema Migration File:   
Code that describes a precise change to make to the database.  
They have an Apply (Up) and a Revert (Down) operation.  

## Issues Solved by Migrations

* Migration files let you automatically apply migrations during API deployments.
* Migration files let you sync the database for code review.

## A Few Notes on Migration Libraries

Many libraries for many languages.
