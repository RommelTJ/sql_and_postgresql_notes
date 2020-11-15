# Aggregation of Records

## Grouping

* Reduces many rows down to fewer rows
* Done by using the 'GROUP BY' keyword
* Visualizing the result is key to use

## Aggregates

* Reduces many values down to one
* Done by using 'aggregate functions'

## Group By

* Find the set of all unique user_ids
* Take each row and assign it to a group based on its user_id

## Aggregate Functions

```
COUNT() -> Returns the number of values in a group of values
SUM() -> Finds the sum of a group of values
AVG() -> Find the average of a group of numbers
MIN() -> Returns the minimum value from a group of numbers
MAX() -> Returns the maximum value from a group of numbers 
```

When you make use of an aggregate function, you cannot just do a normal select next to it.
