from pyspark.sql import SparkSession
from pyspark.sql.functions import col, sum, avg, count
spark = SparkSession.builder.appName("Phase2").getOrCreate()

# Load the customers.csv and sales.csv datasets
customers = spark.read.format('csv').option('header', 'true').load('/samples/customers.csv')
sales = spark.read.format('csv').option('header', 'true').load('/samples/sales.csv')

customers = customers.dropna(subset=["customer_id"])
sales = sales.dropna(subset=["customer_id"])

sales = sales.withColumn("total_amount", col("total_amount").cast("int"))

# QUERY 1: Total order amount per customer
print("\nQuery 1: Total Spend per Customer\n")
customers.join(sales, "customer_id") \
    .groupBy("customer_id", "first_name", "last_name") \
    .agg(sum("total_amount").alias("total_spend")) \
    .show()

# QUERY 2: Top 3 customers by total spend
print("\nTop 3 Customers\n ")

customers.join(sales, "customer_id") \
    .groupBy("customer_id", "first_name", "last_name") \
    .agg(sum("total_amount").alias("total_spend")) \
    .orderBy(col("total_spend").desc()) \
    .limit(3) \
    .show()

# QUERY 3: Customers with no orders
print("\nCustomers with No Orders")

customers.join(sales, "customer_id", "left_anti") \
    .select("customer_id", "first_name", "last_name") \
    .show()

# QUERY 4: City-wise total revenue
print("\nCity-wise Revenue\n")

customers.join(sales, "customer_id") \
    .groupBy("city") \
    .agg(sum("total_amount").alias("total_revenue")) \
    .show()

# QUERY 5: Average order amount per customer
print("\nAverage Spend per Customer\n")

customers.join(sales, "customer_id") \
    .groupBy("customer_id", "first_name", "last_name") \
    .agg(avg("total_amount").alias("avg_spend")) \
    .show()

# QUERY 6: Customers with more than one order
print("\nCustomers with Multiple Orders\n")

customers.join(sales, "customer_id") \
    .groupBy("customer_id", "first_name", "last_name") \
    .agg(count("*").alias("order_count")) \
    .filter(col("order_count") > 1) \
    .show()

# QUERY 7: Sort customers by total spend
print("\nCustomers Sorted by Spend\n")

customers.join(sales, "customer_id") \
    .groupBy("customer_id", "first_name", "last_name") \
    .agg(sum("total_amount").alias("total_spend")) \
    .orderBy(col("total_spend").desc()) \
    .show()