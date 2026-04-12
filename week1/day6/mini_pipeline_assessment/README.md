# Day 6 – Car Sales Data Pipeline & SQL + PySpark Assessment

## Overview

Day 6 focused on building an **end-to-end data pipeline using PySpark and SQL**, along with evaluating our understanding through an **interview interaction session** and a **hands-on assessment exam**.

## Session 1: SQL & PySpark Interaction (Morning)

Today’s morning session involved an interactive discussion where students were evaluated on SQL basics and data engineering basics(databricks, pyspark, pipelines).

**Outcome:**
The interaction went well. Concepts were discussed clearly, and doubts were clarified effectively.

## Session 2: Car Sales Pipeline Implementation

We worked on a mini data engineering pipeline using the following tables:

* `customers`
* `cars`
* `sales`
* `dealers`
* `sales_dealer`

### Phase 1: Data Understanding

* Loaded datasets and checked schema
* Identified data issues:

  * Null values in `customers.name`
  * Negative values in `cars.price`
  * Invalid foreign keys (`customer_id = 99`)
  * Multiple sales per customer

### Phase 2: Data Cleaning

* Handled null values using replacement (`Unknown`)
* Removed negative prices
* Trimmed string values (e.g., `"John "` → `"John"`)
* Removed invalid foreign key records using joins

### Phase 3: Validation

* Counted total records before and after cleaning
* Identified:

  * Invalid records
  * Negative values
* Created a validation report:

  * Total records
  * Invalid records
  * Clean records

### Phase 4: Transformation

* Calculated **Revenue = price × quantity**
* Generated:

  * Revenue per customer
  * Brand-wise revenue
  * City-wise revenue

### Phase 5: SQL Analysis

Performed analytical queries using SQL:

* Top 3 customers per city (using window functions)
* Repeat customers (`COUNT > 1`)
* Monthly revenue trends-

## Session 3: Afternoon Assessment (Exam)

An evaluation test was conducted based on:

### SQL Queries

* Writing complex joins
* Aggregation-based problems
* Window functions
* Data filtering and grouping

### PySpark Queries

* DataFrame transformations
* Cleaning logic
* Join operations
* Aggregations and calculations

**Outcome:**
The exam tested practical understanding and application of concepts covered during training.

### Challenges Faced

* Handling invalid foreign keys correctly
* Avoiding double-counting during joins
* Applying proper validation checks
* Writing correct window functions

## Conclusion

Day 6 provided hands-on experience in:

* Building a real-world data pipeline
* Applying SQL and PySpark concepts
* Understanding data validation and transformation
* Performing analytical queries

The combination of **interactive discussion + practical implementation + assessment** made this session highly valuable for strengthening core data engineering skills.
