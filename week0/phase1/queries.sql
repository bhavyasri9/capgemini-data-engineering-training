-- Query 1
select * from customers;

-- Query 2
select*from customers where city = 'Chennai';

-- Query 3
select * from customers where age > 25;

-- Query 4
select customer_name, city from customers;

-- Query 5
select city, count(*) from customers group by city;