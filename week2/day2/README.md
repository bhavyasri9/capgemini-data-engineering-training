# Databricks Widgets & Delta Lake – Day 2 (Week 2)
## Overview

Day 2 of Week 2 focused on building interactive and production-ready data workflows using:

Databricks Widgets (for dynamic input)
Delta Lake Tables (for reliable data storage)
Delta Operations (for updates, deletes, and versioning)

This session helped in understanding how to create parameterized pipelines with efficient storage and processing.
## What are Widgets?

Widgets are **input controls in Databricks notebooks** that allow users to:

* Select values from dropdowns
* Enter custom input
* Pass parameters dynamically
User Input → Widget → Processing Logic → Output

## Types of Widgets Used

### 1. Combo Box

```python
dbutils.widgets.combobox(
    name="FruitsCB",
    choices=["Apple","Banana","Orange"],
    defaultValue="Apple",
    label="Fruits Combo Box"
)
```

**Features:**

* Dropdown + custom input allowed
* Flexible user selection

### 2. Dropdown

```python
dbutils.widgets.dropdown(
    name="FruitsDD",
    choices=["Apple","Banana","Orange"],
    defaultValue="Apple",
    label="Fruits Drop Down"
)
```

**Features:**

* Fixed options only
* No custom input

### 3. Multi Select

```python
dbutils.widgets.multiselect(
    name="FruitsMS",
    choices=["Apple","Banana","Orange"],
    defaultValue="Apple",
    label="Fruits Multi Select"
)
```

**Features:**

* Allows selecting multiple values
* Output is comma-separated string

### 4. Text Box

```python
dbutils.widgets.text(
    name="TextB",
    defaultValue="Enter Any Value",
    label="Text Box"
)
```

**Features:**

* Accepts free text input
* Useful for dynamic parameters

## Reading Widget Values

```python
fruit_cb = dbutils.widgets.get("FruitsCB")
fruit_dd = dbutils.widgets.get("FruitsDD")
fruit_ms = dbutils.widgets.get("FruitsMS")
text_val = dbutils.widgets.get("TextB")
```
## Handling Multi Select Values

```python
fruit_list = fruit_ms.split(",")
```

## Practical Usage

### Filtering Data Using Widget Input

```python
df.filter(col("fruit").isin(fruit_list)).show()
```
### What is Delta Lake?

Delta Lake is a **storage layer on top of data lakes** that provides:

* ACID transactions
* Schema enforcement
* Version control (Time Travel)

### Creating Delta Table

```python
df.write.format("delta").save("/tmp/delta_table")
```
### Read Delta Table

```python
df = spark.read.format("delta").load("/tmp/delta_table")
```

## Delta Table Operations

*INSERT
*UPDATE
*DELETE
*MERGE (UPSERT)
*TIME TRAVEL
*DESCRIBE HISTORY

## Common Mistakes

* Assigning wrong widget names
* Forgetting to use `.get()`
* Not splitting multi-select values
* Trying to use widgets outside Databricks

## Key Learnings

* Widgets enable **dynamic notebooks**
* Useful for **parameterized pipelines**
* Improve **user interaction and flexibility**
* Essential for **real-world data workflows**

## Conclusion

Day 2 provided hands-on experience in:

* Creating interactive notebooks using widgets
* Managing data with Delta Lake
* Performing advanced operations like update, delete, and merge
* Building scalable and production-ready data pipelines
