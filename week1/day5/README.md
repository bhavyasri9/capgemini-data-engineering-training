# Day 5 – Regex & Date Functions (Week 1)
## Overview

Day 5 focused on advanced SQL concepts used in **real-world data cleaning and validation**, including:

* Regular Expressions (Regex)
* Date & Timestamp Functions
* Continuation of SQL Functions (String, NULL, Numeric)

# 1. Regular Expressions (Regex)

Used for **pattern matching, data extraction, and validation** 

## Basic Patterns:

* `[0-9]` → digits
* `[A-Za-z]` → alphabets
* `^` → start of string
* `$` → end of string
* `{n}` → exact number of characters
* `+` → one or more occurrences

## Use Cases:

* Extract numbers from strings
* Validate email formats
* Extract domain names
* Clean structured text data

## Example:

```sql id="r1"
SELECT REGEXP_SUBSTR(email, '[a-zA-Z0-9._-]+')
FROM users;
```

---

## Practice Covered:

* Extract digits from start/end
* Extract email username & domain
* Extract country codes from phone numbers
* Extract numeric/alphabetic patterns

# 2. Date & Timestamp Functions

Used for **time-based analysis and calculations** 

## Current Date Functions:

* `CURDATE()`, `NOW()`
* `CURRENT_TIMESTAMP`

## Extract Functions:

* `YEAR()`, `MONTH()`, `DAY()`
* `EXTRACT()`

## Date Operations:

* `DATE_ADD()`, `DATE_SUB()`
* `DATEDIFF()`
* `TIMESTAMPDIFF()`

## Formatting:

* `DATE_FORMAT()`
* `STR_TO_DATE()`

## Use Cases:

* Calculate delivery time
* Filter records by date
* Identify weekends/weekdays
* Format dates for reports

# 3. SQL Functions (Revision & Application)

Continuation of Day 4 concepts:

### String Functions

* TRIM, LOWER, UPPER
* SUBSTRING, REPLACE

### NULL Functions

* COALESCE, IFNULL, NULLIF

### Numeric Functions

* ROUND, CEIL, FLOOR
* GREATEST, LEAST

# Common Mistakes

* Incorrect regex patterns
* Not handling NULL values in calculations
* Wrong date formats
* Ignoring edge cases in pattern matching

# Key Learnings

* Regex is powerful for **data validation and extraction**
* Date functions are essential for **time-based analytics**
* Combining SQL functions improves **data quality**
* These concepts are widely used in **real-world datasets**

# Conclusion

Day 5 focused on:

* Advanced data extraction using Regex
* Time-based data analysis using Date functions
* Applying SQL functions for real-world scenarios
