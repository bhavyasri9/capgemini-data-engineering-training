from pyspark.sql import SparkSession
spark=SparkSession.builder.appName("practice").getOrCreate()
customers_data = [
    (1, "Ravi", "Hyderabad", 25),
    (2, "Sita", "Chennai", 32),
    (3, "Arun", "Hyderabad", 28),
    (4, "Meena", "Bengaluru", 35),
    (5, "Kiran", "Chennai", 22)
]
customers = spark.createDataFrame(customers_data, 
    ["customer_id","customer_name","city","age"])

# Query 1
customers.show()

# Query 2
customers.filter(customers.city=="Chennai").show()

# Query 3
customers.filter(customers.age>25).show()

# Query 4
customers.select("customer_name", "city").show()

# Query 5
customers.groupBy("city").count().show()