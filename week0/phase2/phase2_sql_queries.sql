create table customers (
    customer_id int,
    first_name varchar(50),
    last_name varchar(50),
    email varchar(100),
    phone_number varchar(20),
    address varchar(100),
    city varchar(50)
);

insert into customers values
(1, 'ravi', 'kumar', 'ravi@gmail.com', '9876543210', 'hyderabad street', 'hyderabad'),
(2, 'sita', 'reddy', 'sita@gmail.com', '9123456780', 'chennai street', 'chennai'),
(3, 'arun', 'sharma', 'arun@gmail.com', '9988776655', 'hyderabad street', 'hyderabad'),
(4, 'meena', 'nair', 'meena@gmail.com', '9871234567', 'bengaluru street', 'bengaluru'),
(5, 'kiran', 'rao', 'kiran@gmail.com', '9012345678', 'chennai street', 'chennai');

create table sales (
    sale_id int,
    customer_id int,
    product_id int,
    sale_date date,
    quantity int,
    total_amount int
);

insert into sales values
(101, 1, 1001, '2026-03-01', 2, 2500),
(102, 2, 1002, '2026-03-02', 1, 1800),
(103, 1, 1003, '2026-03-03', 3, 3200),
(104, 3, 1004, '2026-03-04', 1, 1500),
(105, 5, 1005, '2026-03-05', 2, 2800);

-- query 1: total order amount per customer

select c.customer_id, c.first_name, c.last_name, sum(s.total_amount) as total_spend from customers c
join sales s
on c.customer_id = s.customer_id
group by c.customer_id, c.first_name, c.last_name;

-- query 2: top 3 customers by total spend

select c.customer_id, c.first_name, c.last_name, sum(s.total_amount) as total_spend
from customers c
join sales s
on c.customer_id = s.customer_id
group by c.customer_id, c.first_name, c.last_name
order by total_spend desc
limit 3;

-- query 3: customers with no orders

select c.customer_id, c.first_name, c.last_name from customers c
left join sales s
on c.customer_id = s.customer_id
where s.customer_id is null;

-- query 4: city-wise total revenue

select c.city, sum(s.total_amount) as total_revenue from customers c
join sales s
on c.customer_id = s.customer_id
group by c.city;

-- query 5: average order amount per customer

select c.customer_id, avg(s.total_amount) as avg_spend from customers c
join sales s
on c.customer_id = s.customer_id
group by c.customer_id;

-- query 6: customers with more than one order

select c.customer_id, count(*) as order_count from customers c
join sales s
on c.customer_id = s.customer_id
group by c.customer_id
having count(*) > 1;

-- query 7: sort customers by total spend

select c.customer_id, c.first_name, c.last_name, sum(s.total_amount) as total_spend from customers c
join sales s
on c.customer_id = s.customer_id
group by c.customer_id, c.first_name, c.last_name
order by total_spend desc;