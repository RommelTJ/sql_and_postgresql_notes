# Recursive Common Table Expressions

## Recursive CTE

Important Notes on Recursive CTEs:
* Very, very different from simple CTEs.
* Useful anytime you have a tree or graph-type data structure
* Must use a 'union' keyword. Simple CTEs don't have to use a union.
* This is super, super advanced.

```postgresql
WITH RECURSIVE countdown(val) AS (
  SELECT 3 AS val -- Initial or Non-Recursive Query
  UNION
  SELECT val - 1 FROM countdown WHERE val > 1 -- Recursive Query
)
SELECT * 
FROM countdown;
```

## Recursive CTE Step-by-Step

1. Define the results and working tables
2. Run the initial non-recursive statement, put the results into the results table and working table
3. Run the recursive statement, replacing the table name 'countdown' with a reference to the working table
4. If recursive statement returns some rows, append them to the results table and run recursion again
5. If recursive statement returns no rows, stop the recursion

## Why use recursive CTEs?

Example: Suggest who to follow based on who you already follow.  
1. I follow The Rock and Kevin Hart. The Rock follows Justin Beiber. Kevin Hart follows JLo and Snoop Dogg. 
2. Suggest Justin Beiber, JLo, Snoop Dogg.
3. If I don't like Justin Beiber, JLo, Snoop Dogg, get more suggestions.
4. Justin Beiber follows Miley Cyrus, JLo follows Justin Timberlake, Snoop follows Selena Gomez.
5. Suggest Miley Cyrus, Justin Timberlake, Selena Gomez.
6. And so on, recursively.
