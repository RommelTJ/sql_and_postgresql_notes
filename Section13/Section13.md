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

## Times, Dates, and Timestamps

`DATE`
* `1980-11-20` -> 20 November 1980
* `Nov-20-1980` -> 20 November 1980
* `20-Nov-1980` -> 20 November 1980
* `1980-November-20` -> 20 November 1980
* `November 20, 1980` -> 20 November 1980

`TIME` (alias for `TIME WITHOUT TIME ZONE`)
* `01:23 AM` -> 01:23, no time zone
* `05:23 PM` -> 17:23, no time zone
* `20:34` -> 20:34, no time zone

`TIME WITH TIME ZONE`
* `01:23 AM EST` -> 01:23-05:00
* `05:23 PM PST` -> 17:23-08:00
* `05:23 PM UTC` -> 17:23+00:00

`TIMESTAMP` or `TIMESTAMP WITH TIME ZONE`
* `Nov-20-1980 05:23 PM PST` -> `1980-11-20 18:23:00-07`

## INTERVAL

Durations of time
* `1 day` -> 1 day
* `1 D` -> 1 day
* `1 D 1 M 1 S` -> 1 day 1 minute 1 second

Examples of using intervals:  
`SELECT ('1 D 20 H 30 M 45 S'::INTERVAL)` ->  `1 day 20:30:45`  

`SELECT ('1 D 20 H 30 M 45 S'::INTERVAL) - ('1 D'::INTERVAL)` -> `20:30:45`
  
`SELECT ('NOV-20-1980 1:23 AM EST'::TIMESTAMP WITH TIME ZONE) - ('1 D'::INTERVAL)` -> `"1980-11-18 22:23:00-08"`
  
`SELECT ('NOV-20-1980 1:23 AM EST'::TIMESTAMP WITH TIME ZONE) - ('NOV-10-1980 1:23 AM EST'::TIMESTAMP WITH TIME ZONE)` -> `"10 days"`

`SELECT ('NOV-20-1980 1:23 AM EST'::TIMESTAMP WITH TIME ZONE) - ('NOV-10-1980 5:43 AM PST'::TIMESTAMP WITH TIME ZONE)` -> `"9 days 16:40:00"`
