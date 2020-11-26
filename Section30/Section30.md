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

-- A Transaction
BEGIN;
UPDATE accounts SET balance = balance - 50 WHERE name = 'Alyson';
UPDATE accounts SET balance = balance + 50 WHERE name = 'Gia';
COMMIT; -- Finishing the Transaction
```

`COMMIT`: Merge changes back into main data pool.  
`ROLLBACK`: Dump all pending changes and delete the separate workspace.  

If a connection runs into an ERROR, the transactions enters into an 'aborted' state - 
you must rollback!

If we lose a connection (crashing), Postgres will automatically rollback the transaction.
