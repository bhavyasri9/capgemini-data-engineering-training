# Week 2 – Data Engineering (Pipelines, SQL, Delta & Medallion Architecture) & Mini Project

## Overview

Week 2 focused on building **strong foundations in Data Engineering**, covering:

* SQL (Subqueries, CTE, Window Functions)
* PySpark Data Processing
* Delta Lake & Data Pipelines
* Data Quality Checks
* Data Modeling (Star Schema)
* Medallion Architecture (Bronze → Silver → Gold)
* Team Project Implementation

# Topics Covered

## 1. SQL – Advanced Concepts

### Subqueries

* Scalar, Row, Table subqueries
* Used in `SELECT`, `FROM`, `WHERE`, `JOIN`

### Operators

* `IN`, `EXISTS`, `ANY`, `ALL`

### CTE (Common Table Expression)

* Temporary result sets
* Improves readability and modular queries

### Window Functions

* `ROW_NUMBER`, `RANK`, `DENSE_RANK`
* `LAG`, `LEAD` for trend analysis

## 2. PySpark & Data Processing

* DataFrame operations
* Filtering, aggregation, joins
* Handling null values
* Data transformations

## 3. Data Pipelines

### Pipeline Flow

```id="pipeline_flow"
Raw Data → Cleaning → Validation → Transformation → Output
```

### Key Steps:

* Data ingestion
* Cleaning and preprocessing
* Validation checks
* Transformation logic
* Output generation

## 4. Data Quality Checks

### Implemented Checks:

* No NULL values in critical fields
* No duplicate records
* No negative values
* Valid foreign key relationships
* Consistent aggregations

### Importance:

* Ensures reliable analytics
* Prevents incorrect business insights

## 5. Delta Lake

### Features:

* ACID transactions
* Schema enforcement
* Time travel (versioning)

### Operations:

* INSERT
* UPDATE
* DELETE
* MERGE (Upsert)

## 6. Data Modeling – Star Schema

### Star Schema Components:

* **Fact Table** → transactional data (sales, orders)
* **Dimension Tables** → descriptive data (customer, product, city)

### Benefits:

* Faster querying
* Better analytics performance
* Simplified reporting

## 7. Medallion Architecture

```id="medallion_flow"
Bronze → Silver → Gold
```

### Bronze:

* Raw data ingestion
* Stored as-is

### Silver:

* Data cleaning and validation
* Remove duplicates, nulls, invalid data

### Gold:

* Aggregated business insights
* Dashboard-ready data

# 👥 Team Project Progress (Day-wise)

## Day 1 (Project Start)

* Dataset collection
* Requirement analysis
* Understanding business use case
* Started Bronze layer
* Completed documentation

## Day 2

* Continued Bronze layer implementation
* Introduced Delta Lake
* Learned widgets for dynamic pipelines

## Day 3

* Worked on data cleaning concepts
* Planned Silver layer transformations
* Applied data quality checks
* Implemented Medallion Architecture

## Day 4 (Saturday)

* Designed pipeline structure and Gold layer insights
* Done with the Project Presentation

# Technologies Used

* Databricks
* PySpark
* SQL
* Delta Lake

# Challenges Faced

* Handling duplicate and updated records
* Managing data quality issues
* Writing optimized SQL queries
* Understanding proper data modeling

# Key Learnings

* Importance of data validation in pipelines
* SQL + PySpark integration
* Delta Lake for reliable storage
* Medallion architecture for scalable pipelines
* Star schema for efficient analytics

# Conclusion

Week 2 provided strong hands-on experience in:

* Advanced SQL concepts
* Data pipeline development
* Data quality validation
* Medallion architecture implementation
* Real-world team project execution
