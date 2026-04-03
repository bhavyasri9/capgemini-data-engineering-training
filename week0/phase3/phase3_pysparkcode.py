from pyspark.sql import SparkSession
from pyspark.sql.functions import col, sum, count

spark = SparkSession.builder.appName("Phase3_ETL").getOrCreate()

print("ETL Pipeline Started")

# Extract (Load Data)
print("\n[Extract] Loading data from CSV...")

customers = spark.read.option("header", "true").csv("/samples/customers.csv")
sales = spark.read.option("header", "true").csv("/samples/sales.csv")

customers.show()
sales.show()

# Transform (Cleaning)
print("\n[Transform] cleaning data...")

customers = customers.dropna(subset=["customer_id"])
sales = sales.dropna(subset=["customer_id"])

sales = sales.withColumn("total_amount", col("total_amount").cast("int"))

# Transform (Business Logic)
# 1. Daily sales
print("\nDaily Sales:\n")
sales.groupBy("sale_date").agg(sum("total_amount").alias("daily_sales")).show()

# 2. City-wise revenue
print("\nCity-wise Revenue:\n")
customers.join(sales, "customer_id") \
    .groupBy("city") \
    .agg(sum("total_amount").alias("revenue")) \
    .show()

# 3. Repeat customers (>2 orders)
print("\nRepeat Customers:\n")
customers.join(sales, "customer_id") \
    .groupBy("customer_id") \
    .agg(count("*").alias("orders")) \
    .filter(col("orders") > 2) \
    .show()

# 4. Highest spending customer per city
print("\nHighest Spending Customer per City:\n")
customers.join(sales, "customer_id") \
    .groupBy("city", "customer_id") \
    .agg(sum("total_amount").alias("total_spend")) \
    .orderBy(col("total_spend").desc()) \
    .show()

# 5. Final reporting table
print("\nFinal Report:\n")
result = customers.join(sales, "customer_id") \
    .groupBy("customer_id", "city") \
    .agg(
        sum("total_amount").alias("total_spend"),
        count("*").alias("order_count")
    )

result.show()

# Load (Save Output)
print("\n[Load] Saving output...")

result.write.mode("overwrite").csv("/tmp/output_total_spend")

print("\nETL Pipeline Completed")