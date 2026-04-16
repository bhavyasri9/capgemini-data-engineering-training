# Databricks Widgets – Day 2 (Week 2)
## Overview

Day 2 of Week 2 focused on understanding and implementing **Databricks Widgets** to create **dynamic and interactive notebooks**. Widgets allow users to provide input values that can be used in **PySpark transformations and SQL queries**, making pipelines flexible and reusable.

## What are Widgets?

Widgets are **input controls in Databricks notebooks** that allow users to:

* Select values from dropdowns
* Enter custom input
* Pass parameters dynamically

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

Day 2 provided hands-on experience with:

* Creating different types of widgets
* Passing user input into notebooks
* Building dynamic and reusable workflows

Widgets play a crucial role in making **data pipelines interactive and production-ready**.
