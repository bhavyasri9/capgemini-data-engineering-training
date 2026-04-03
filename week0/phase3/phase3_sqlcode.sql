-- remove null customer_id

select * from customers where customer_id is not null;

-- query 1: daily sales

select sale_date, sum(total_amount) as daily_sales from sales
group by sale_date;

-- query 2: city-wise revenue

select c.city, sum(s.total_amount) as total_revenue from customers c
join sales s
on c.customer_id = s.customer_id
group by c.city;

-- query 2: city-wise revenue

select c.city, sum(s.total_amount) as total_revenue from customers c
join sales s
on c.customer_id = s.customer_id
group by c.city;

-- query 3: repeat customers

select customer_id, count(*) as order_count from sales
group by customer_id
having count(*) > 2;

-- query 5: final report

select c.customer_id, c.city, sum(s.total_amount) as total_spend, count(*) as order_count from customers c
join sales s
on c.customer_id = s.customer_id
group by c.customer_id, c.city;