# Day 4 – SQL Functions (Week 1)

## Overview

Day 4 focused on learning essential **SQL Functions** used for **data cleaning, transformation, and analysis**.

Topics covered:

* String Functions
* NULL Handling Functions
* Number (Numeric) Functions

# 1. String Functions

Used for **text processing and data cleaning** 

### Common Functions:

* `LENGTH()`, `CHAR_LENGTH()`
* `UPPER()`, `LOWER()`
* `TRIM()`, `LTRIM()`, `RTRIM()`
* `CONCAT()`, `CONCAT_WS()`
* `SUBSTRING()`, `LEFT()`, `RIGHT()`
* `REPLACE()`
* `INSTR()`, `LOCATE()`

### Use Cases:

* Remove extra spaces
* Convert text to uniform case
* Extract parts of strings
* Clean inconsistent data

# 2. NULL Functions

Used to handle missing or incomplete data 

### Important Functions:

* `IFNULL(col, value)`
* `COALESCE(a, b, c)`
* `NULLIF(a, b)`
* `IS NULL`, `IS NOT NULL`

### Use Cases:

* Replace NULL values
* Avoid calculation errors
* Handle real-world missing data

# 3. Number Functions

Used for numeric calculations and formatting 

### Common Functions:

* `ABS()`
* `ROUND()`
* `CEIL()`, `FLOOR()`
* `TRUNCATE()`
* `MOD()`
* `POWER()`, `SQRT()`
* `GREATEST()`, `LEAST()`

### Use Cases:

* Financial calculations
* Rounding values
* Mathematical operations
* Comparing numbers

# Common Mistakes

* Not handling NULL values properly
* Using string functions on numeric data
* Forgetting TRIM → leads to wrong results
* Ignoring NULL in calculations

# Key Learnings

* String functions are essential for **data cleaning**
* NULL handling is critical for **accurate outputs**
* Numeric functions help in **data transformation**
* These concepts are widely used in real-world SQL queries

# Conclusion

Day 4 focused on building a strong foundation in:

* SQL data cleaning techniques
* Handling missing data
* Performing numeric transformations
