# Phase 4: Business Pipeline

from pyspark.sql import SparkSession
from pyspark.sql.functions import col, sum, count, when

spark = SparkSession.builder.appName("Phase4").getOrCreate()

print("Pipeline Started...\n")

# Extract Data

customers = spark.read.option("header", "true").csv("/samples/customers.csv")
sales = spark.read.option("header", "true").csv("/samples/sales.csv")

print("Customers rows:", customers.count())
print("Sales rows:", sales.count())

customers.show()
sales.show()

# Clean Data

# Fix data types
customers = customers.withColumn("customer_id", col("customer_id").cast("int"))
sales = sales.withColumn("customer_id", col("customer_id").cast("int"))

# Remove nulls safely
customers = customers.filter(col("customer_id").isNotNull())
sales = sales.filter(col("customer_id").isNotNull())

# Convert amount
sales = sales.withColumn("total_amount", col("total_amount").cast("int"))

print("After cleaning:")
print("Customers:", customers.count())
print("Sales:", sales.count())

joined = customers.join(sales, "customer_id")
print("Join rows:", joined.count())
joined.show()

# Task 1: Daily Sales
print("\nDaily Sales\n")

daily_sales = sales.groupBy("sale_date") \
    .agg(sum("total_amount").alias("total_sales"))

daily_sales.show()

# Task 2: City-wise Revenue
print("\nCity-wise Revenue\n")

city_revenue = joined.groupBy("city") \
    .agg(sum("total_amount").alias("total_revenue"))

city_revenue.show()

# Task 3: Top 5 Customers
print("\nTop 5 Customers\n")

top_customers = joined.groupBy("customer_id", "first_name", "last_name") \
    .agg(sum("total_amount").alias("total_spend")) \
    .orderBy(col("total_spend").desc()) \
    .limit(5)

top_customers.show()

# Task 4: Repeat Customers (>1 order)

print("\nRepeat Customers\n")

repeat_customers = sales.groupBy("customer_id") \
    .agg(count("*").alias("order_count")) \
    .filter(col("order_count") > 1)

repeat_customers.show()

# Task 5: Customer Segmentation

print("\nCustomer Segmentation\n")

customer_spend = joined.groupBy(
    "customer_id", "first_name", "last_name", "city"
).agg(sum("total_amount").alias("total_spend"))

segmented = customer_spend.withColumn(
    "segment",
    when(col("total_spend") > 10000, "Gold")
    .when((col("total_spend") >= 5000) & (col("total_spend") <= 10000), "Silver")
    .otherwise("Bronze")
)

segmented.show()

# Task 6: Final Reporting Table

print("\nFinal Reporting Table\n")

final_df = segmented.join(repeat_customers, "customer_id", "left") \
    .fillna(0, subset=["order_count"])

final_df.select(
    "first_name", "last_name", "city",
    "total_spend", "order_count", "segment"
).show(truncate=False)

print("Final row count:", final_df.count())

# Task 7: Save Output
print("\nSaving output...")

final_df.write.mode("overwrite").csv("/tmp/report")

print("Pipeline Completed")