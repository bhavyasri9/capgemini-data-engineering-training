# Phase 2 – SQL to PySpark (Joins & Aggregations)

## Objective

In this phase, I understand how data operations like joins and aggregations are performed using both SQL and PySpark. It focused on bridging the gap between theoretical SQL knowledge and practical data processing using PySpark.

## Tasks Completed

* Loaded datasets from CSV files in Spark Playground
* Performed data cleaning using dropna()
* Converted data types for accurate calculations
* Implemented SQL queries and converted them into PySpark
* Executed joins between multiple datasets
* Performed aggregations like sum, average, and count
* Sorted and filtered data based on conditions

## Key Learnings

* Understood how joins work in PySpark
* Learned how aggregation functions like sum(), avg(), and count() are applied using groupBy()
* Learned how to debug common errors like missing columns and incorrect data types
* Improved understanding of working with structured datasets

## SQL to PySpark Mapping

* SELECT → select()
* WHERE → filter()
* JOIN → join()
* GROUP BY → groupBy()
* ORDER BY → orderBy()
* HAVING → filter() after aggregation

## Challenges Faced

* Faced issues with incorrect file paths while loading CSV files
* Encountered column name mismatches (like using the wrong column names)
* Had errors due to incorrect data types and unresolved columns

## How I Solved Them

* Verified schema using printSchema() before writing queries
* Carefully matched column names with the dataset
* Converted columns to correct data types using cast()
* Practiced multiple queries to understand join behavior

## Conclusion

This phase helped me gain confidence in working with real datasets and performing intermediate-level data transformations. I now have a better understanding of how SQL logic can be implemented in PySpark, which is essential for building data pipelines and handling large-scale data in real-world scenarios.
