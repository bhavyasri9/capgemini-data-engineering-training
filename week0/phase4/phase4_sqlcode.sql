-- phase 4: business pipeline & analytics

-- task 1: daily sales

select sale_date, sum(total_amount) as total_sales from sales
group by sale_date;

-- task 2: city-wise revenue

select c.city, sum(s.total_amount) as total_revenue from customers c
join sales s
on c.customer_id = s.customer_id
group by c.city;

-- task 3: top 5 customers

select c.customer_id, c.first_name, c.last_name, sum(s.total_amount) as total_spend from customers c
join sales s
on c.customer_id = s.customer_id
group by c.customer_id, c.first_name, c.last_name
order by total_spend desc
limit 5;

-- task 4: repeat customers (>1 order)

select customer_id, count(*) as order_count from sales
group by customer_id
having count(*) > 1;

-- task 5: customer segmentation

select c.customer_id, c.first_name, c.last_name, c.city, sum(s.total_amount) as total_spend,
    case
        when sum(s.total_amount) > 10000 then 'gold'
        when sum(s.total_amount) between 5000 and 10000 then 'silver'
        else 'bronze'
    end as segment
from customers c
join sales s
on c.customer_id = s.customer_id
group by c.customer_id, c.first_name, c.last_name, c.city;

-- task 6: final reporting table

select c.first_name, c.last_name, c.city, sum(s.total_amount) as total_spend, count(*) as order_count,
    case
        when sum(s.total_amount) > 10000 then 'gold'
        when sum(s.total_amount) between 5000 and 10000 then 'silver'
        else 'bronze'
    end as segment
from customers c
join sales s
on c.customer_id = s.customer_id
group by c.first_name, c.last_name, c.city;
