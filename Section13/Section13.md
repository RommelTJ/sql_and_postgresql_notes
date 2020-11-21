# PostgreSQL Complex Datatypes

## PGAdmin

* Tool to manage and inspect a Postgres database
* Can connect to local or remote databases
* Can view/change just about anything in PG

## Data Types

Categories: 
* Numbers
* Date/Time
* Character
* Boolean

Less important categories:
* Currency
* Binary
* JSON
* Geometric
* Range
* Arrays
* XML
* UUID

## Numeric Types

Numbers without any decimal points:
* smallint (-32,768 to 32,767)
* integer (-2,147,483,648 to 2,147,483,647)
* bigint (-REALLY BIG NUMBER to REALLY BIG NUMBER)

Numbers with decimal points:  
* decimal (131,072 digits before decimal point, 16,383 after)
* numeric (131,072 digits before decimal point, 16,383 after)
* real (1E-37 to 1E37 with at least 6 place precision)
* double precision (1E-307 to 1E308 with at least 15 place precision)
* float (Same as real or double precision)

No decimal point, auto increment:
* smallserial (1 to 32,767)
* serial (1 to 2,147,483,647)
* bigserial (1 to REALLY BIG NUMBER)

## Fast Rules on Numeric Data Types

* 'id' column -> `SERIAL`
* Need to store a number without a decimal -> `INTEGER`
* Bank balance, grams of gold, scientific calculations (needs to be accurate) -> `NUMERIC`
* Kilograms of trash, liters of water in a lake, air pressure in a tire (decimal doesn't make a big difference) -> `DOUBLE`

## More on Number Data Types

`SELECT (1.99999::REAL - 1.99998::REAL)` = `0.00001001358`

`SELECT (1.99999::NUMERIC - 1.99998::NUMERIC)` = `0.00001`

## Reminder on Character Types

* CHAR(5) -> Stores a fix length of characters
* VARCHAR -> Stores any length of string
* VARCHAR(40) -> Store a string up to 40 characters, automatically remove extra characters
* TEXT -> Store any length of string

## Boolean Data Types

* true, 'yes', 'on', 1, 't', 'y' -> `TRUE`
* false, 'no', 'off', 0, 'f', 'n' -> `FALSE`
* null -> `NULL`
