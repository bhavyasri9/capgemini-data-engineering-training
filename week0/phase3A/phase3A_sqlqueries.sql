create table customers_dirty (
    customer_id int,
    name varchar(50),
    city varchar(50),
    age int
);

-- insert messy data

insert into customers_dirty values
(1, 'ravi', 'hyderabad', 25),
(2, null, 'chennai', 32),
(null, 'arun', 'hyderabad', 28),
(4, 'meena', null, 30),
(4, 'meena', null, 30),
(5, 'john', 'bangalore', -5);

-- null values
select * from customers_dirty where customer_id is null or name is null or city is null;

-- duplicate records
select customer_id, name, city, age, count(*) as cnt from customers_dirty 
group by customer_id, name, city, age
having count(*) > 1;

-- invalid age
select * from customers_dirty where age < 0;

-- clean data

-- remove null customer_id, name, city
create table customers_clean as
select * from customers_dirty where customer_id is not null and name is not null and city is not null;

-- remove duplicates
create table customers_nodup as
select distinct * from customers_clean;

-- remove invalid age
create table customers_final as
select * from customers_nodup where age > 0;

-- validate cleaning

-- before count
select count(*) as before_count from customers_dirty;

-- after count
select count(*) as after_count from customers_final;

-- aggregation

-- customers per city
select city, count(*) as customer_count from customers_final
group by city;