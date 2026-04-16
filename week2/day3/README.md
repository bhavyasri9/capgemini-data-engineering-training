# Flipkart Data Pipeline – Medallion Architecture (Bronze → Silver → Gold)

## Overview
This project implements a **data pipeline using Medallion Architecture** (Bronze, Silver, Gold layers) on a **Flipkart sales dataset**.

The pipeline demonstrates:

* Data ingestion and storage
* Data cleaning and validation
* Business-level transformations
* Creation of analytics-ready datasets
## 🧠 Medallion Architecture

```id="flow_med"
Bronze (Raw) → Silver (Cleaned) → Gold (Business Insights)
```
### Bronze Layer

* Raw data ingestion
* Stored as-is in Delta format

### Silver Layer

* Data cleaning and transformation
* Removes inconsistencies

### Gold Layer

* Aggregated, business-ready data
* Used for dashboards and analytics

## Business Requirements

### Sales Analysis

* Total sales by product
* Total sales by category
* Total sales by city

### Customer Insights

* Number of orders per customer
* Top customers by spending

### Data Quality

* No NULL values
* No duplicates
* No negative values

### Latest Data Handling

* Keep latest record for duplicate `order_id`

### Dashboard Ready Data

* Clean, aggregated data for BI tools

# Pipeline Implementation

## Bronze Layer (Raw Data)
* Load raw dataset
* Store data in **Delta format**
* Use **append mode**

```python id="bronze1"
df.write.format("delta").mode("append").save("/tmp/bronze")
```

## Silver Layer (Data Cleaning)
* Fill or remove NULLs (city, amount)
* Convert `amount` → integer
* Convert `date` → date format
* Identify duplicate `order_id`
* Keep only one record
* Remove negative `amount`
* 
## Gold Layer (Business Insights)

### Aggregations

#### Sales Metrics
### Customer Metrics
### Top Analysis

## Challenges Faced

* Handling duplicate records with updates
* Cleaning inconsistent data
* Maintaining data quality across layers

## Key Learnings

* Medallion architecture improves data reliability
* Data cleaning is critical in Silver layer
* Gold layer focuses on business insights
* Delta Lake enables efficient storage and updates
## Conclusion

This project demonstrates:

* End-to-end data pipeline design
* Implementation of Medallion Architecture
* Data cleaning, transformation, and aggregation
* Building analytics-ready datasets
