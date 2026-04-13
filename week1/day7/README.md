# Insurance Data Pipeline – PySpark & SQL

## Overview

This project implements an **end-to-end data engineering pipeline** in the Insurance domain using PySpark and SQL.

The pipeline focuses on:

* Data cleaning and validation
* Multi-table joins and relationship handling
* Business metrics computation (premium, claims, risk)
* Advanced SQL analysis using **CTE and Window Functions**

## Dataset Tables

* `customers (customer_id, name, age, city)`
* `policies (policy_id, customer_id, policy_type, premium, start_date)`
* `claims (claim_id, policy_id, claim_amount, claim_date, status)`
* `agents (agent_id, name, region)`
* `policy_agent (policy_id, agent_id)`

## Pipeline Architecture

Raw Data → Cleaning → Validation → Transformation → SQL Analysis → Output

## Phase 1: Data Understanding

* Loaded datasets using PySpark
* Checked schema and row counts
* Identified issues:

  * Negative `premium` values
  * Negative `claim_amount`
  * Invalid foreign keys
  * Null values in critical fields

## Phase 2: Data Cleaning

* Removed negative premium and claim values
* Handled null values
* Trimmed and standardized strings
* Converted columns to proper data types

## Phase 3: Data Validation

* Used **left_anti joins** to detect invalid records:

  * Policies without customers
  * Claims without policies
* Compared row counts before and after joins
* Generated validation report

## Phase 4: Transformation

* Aggregated:

  * Total premium per customer
  * Total claims per customer
* Computed:

  * **Risk Score = total_claim / total_premium**
* Generated city-wise metrics

## Phase 5: SQL Analysis (CTE)

Used **Common Table Expressions (CTE)** for structured queries:
```sql
with combined as (
    select p.customer_id, p.total_premium, c.total_claim from premium p
    left join claims c
    on p.customer_id = c.customer_id
),
risk as (
    select *, total_claim / total_premium as risk_score from combined
)
select * from risk;
```

## Phase 6: Window Functions

* Applied:

  * `ROW_NUMBER`
  * `RANK`
  * `DENSE_RANK`

### Use Cases:

* Top 3 risky customers per city
* Ranking agents by premium handled

## Phase 7: Agent Analytics

* Computed total premium handled by each agent
* Identified top-performing agents
* Validated totals against overall premium

## Phase 8: Output

* Saved final processed datasets

## Challenges Faced

* Handling multiple joins without duplication
* Ensuring correct foreign key relationships
* Writing structured SQL using CTE
* Applying correct window function partitioning

## Key Learnings

* Data validation is critical in real-world pipelines
* CTE improves SQL readability and structure
* Window functions enable advanced analytics
* Incorrect joins can lead to major data errors
