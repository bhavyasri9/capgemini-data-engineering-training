# Bucketing
#1 conditional logic
from pyspark.sql import SparkSession
from pyspark.sql.functions import col, sum, when

spark = SparkSession.builder.appName("Phase4A").getOrCreate()

# sample data (or use your pipeline data)
customers = spark.read.option("header", "true").csv("/samples/customers.csv")
sales = spark.read.option("header", "true").csv("/samples/sales.csv")

# fix types
customers = customers.withColumn("customer_id", col("customer_id").cast("int"))
sales = sales.withColumn("customer_id", col("customer_id").cast("int"))
sales = sales.withColumn("total_amount", col("total_amount").cast("int"))

# total spend per customer
df = customers.join(sales, "customer_id") \
    .groupBy("customer_id", "first_name", "last_name") \
    .agg(sum("total_amount").alias("total_spend"))

# segmentation(Conditional_logic)
segmented = df.withColumn(
    "segment",
    when(col("total_spend") > 10000, "Gold")
    .when((col("total_spend") >= 5000) & (col("total_spend") <= 10000), "Silver")
    .otherwise("Bronze")
)

print("Segmentation (Conditional Logic):")
segmented.show()

# Task: Count Customers per Segment
segmented.groupBy("segment").count().show()

# Quantile-Based Segmentation
quantiles = df.approxQuantile("total_spend", [0.33, 0.66], 0)

q1 = quantiles[0]
q2 = quantiles[1]

quantile_segmented = df.withColumn(
    "segment",
    when(col("total_spend") <= q1, "Bronze")
    .when((col("total_spend") > q1) & (col("total_spend") <= q2), "Silver")
    .otherwise("Gold")
)

print("Quantile Segmentation:")
quantile_segmented.show()

# Window based segmentation
from pyspark.sql.window import Window
from pyspark.sql.functions import percent_rank

window = Window.orderBy("total_spend")

ranked = df.withColumn("rank_pct", percent_rank().over(window))

window_segmented = ranked.withColumn(
    "segment",
    when(col("rank_pct") <= 0.33, "Bronze")
    .when(col("rank_pct") <= 0.66, "Silver")
    .otherwise("Gold")
)

print("Window-based Segmentation:")
window_segmented.show()