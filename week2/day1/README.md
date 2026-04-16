# SQL Subqueries & CTE – Day 1 (Week 2)

## Overview

Day 1 of Week 2 focused on understanding **advanced SQL concepts** including:

* Subqueries (Nested Queries)
* Types of Subqueries
* Operators (`IN`, `EXISTS`, `ANY`, `ALL`)
* Common Table Expressions (CTE)
* Analytical queries using window functions

## Subqueries

A **subquery** is a query inside another query.

```id="flow3"
Outer Query → Inner Query → Result
```
### Types of Subqueries

* Scalar Subquery (returns single value)
* Row Subquery
* Table Subquery

## Example

### Employees earning more than average salary

```sql
SELECT *
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
);
```
## Operators Used

| Operator | Purpose                 |
| -------- | ----------------------- |
| `IN`     | Match values from list  |
| `EXISTS` | Check existence         |
| `ANY`    | Compare with any value  |
| `ALL`    | Compare with all values |

## Window Functions 

### Month-over-Month Sales Analysis

### Customer Loyalty Analysis

Used:

* `LEAD()` function
* `DATEDIFF()`
* `RANK()`

## Common Table Expression (CTE)
CTE is a **temporary named result set** used to simplify complex queries.

### Syntax

```sql
WITH cte_name AS (
    SELECT ...
)
SELECT * FROM cte_name;
```
## Common Mistakes

* Using wrong subquery type
* Returning multiple values in scalar subquery
* Forgetting JOIN conditions in CTE
* Misusing `ANY` and `ALL`
* Not understanding correlation in subqueries

## Key Learnings

* Subqueries help in dynamic filtering
* `EXISTS` is efficient for existence checks
* `ALL` compares with maximum values
* CTE improves readability and structure
* Window functions enable advanced analytics

## Conclusion

Day 1 provided strong foundation in:

* Writing subqueries for dynamic conditions
* Using operators like EXISTS, ANY, ALL
* Structuring queries using CTE
* Performing analytical SQL operations
