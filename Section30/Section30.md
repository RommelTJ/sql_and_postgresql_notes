# Handling Concurrency and Reversibility with Transactions

## What are Transactions Used For?

Transactions are used when we want to run some kind of updates in series and we need 
to make sure that all of them are executed in series, or none of them and they should be
rolled back / undone.

## Opening and Closing Transactions

```postgresql
CREATE TABLE accounts(
  id SERIAL PRIMARY KEY,
  name VARCHAR(20) NOT NULL,
  balance INTEGER NOT NULL 
);

INSERT INTO accounts(name, balance) VALUES ('Gia', 100), ('Alyson', 100);

SELECT * FROM accounts;
```