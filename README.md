[README (1).md](https://github.com/user-attachments/files/35332769/README.1.md)
# SQL Practice: DVD Rental Database

Hands-on SQL practice on the `dvdrental` sample database (PostgreSQL), written while preparing for a career in data analytics and data quality.

## Tools

- PostgreSQL
- DBeaver

## Setup

1. Download the `dvdrental` sample database and restore it in PostgreSQL (`dvdrental.tar`, via DBeaver's restore or `pg_restore`).
2. Open any `.sql` file from `queries/` in DBeaver and run it against the `dvdrental` database.

## Structure

```
queries/
├── 02_joins_aggregation.sql  -- JOINs, GROUP BY, HAVING
├── 04_set_operations.sql     -- UNION, INTERSECT, EXCEPT
├── 05_window_functions.sql   -- CTEs, LAG, NTILE
├── 06_data_quality.sql       -- NOT EXISTS, LEFT JOIN ... IS NULL, EXPLAIN
└── 07_cte_ranking.sql        -- CTEs, subqueries, RANK with PARTITION BY
```

## Topics covered

| Topic | Examples |
|---|---|
| Basics | SELECT, filtering, sorting, DISTINCT, NULLs |
| Aggregation | GROUP BY, HAVING |
| Joins | INNER / LEFT joins across several tables |
| Subqueries & CTEs | nested queries, `WITH` clauses, CASE expressions |
| Set operations | UNION, INTERSECT, EXCEPT |
| Advanced | window functions, views, query plans with EXPLAIN |

## Sample question

*Which customers rented films from both the Action and Comedy categories?*
See `queries/04_set_operations.sql`.

## Next steps

- DDL practice (CREATE, ALTER, constraints, indexes)
- Python for working with databases
