#Basic group By queries
#1 
select department, sum(salary) as total_salary from Employee 
group By department;

#2 
select department, count(emp_id) as number_of_employees from Employee
group By department; 

#3
select department, avg(salary) as average_salary from Employee
group By department;

#4
select department, max(salary) as maximum_salary from Employee
group By department;

#5
select department, min(salary) as minimum_salary from Employee
group By department;

# group By with conditions
#6
select department, sum(salary) as total_salary from Employee 
group By department
having total_salary>100000;

#7
select department, count(emp_id) as number_of_employees from Employee
group By department
having number_of_employees>2;

#8
select department, avg(salary) as average_salary from Employee where 'joining_date'>'2022-01-01' 
group By department;

#9
select department, max(salary) as maximum_salary from Employee
group By department
having maximum_salary>75000;

#10
select department, sum(salary) as total_salary from Employee 
group By department
having total_salary<150000;

# group By with having
#11
select department, count(emp_id) as number_of_employees from Employee
group By department
having number_of_employees>1;

#12
select department, sum(salary) as total_salary from Employee 
group By department
having total_salary>125000;

#13
select department, count(emp_id) as number_of_employees from Employee
group By department
having number_of_employees>2;

#14
select department, avg(salary) as average_salary from Employee
group By department
having average_salary>60000;

#15
select department, sum(salary) as total_salary from Employee 
group By department
having total_salary between 100000 and 200000;

# group By with joins
#16
select e.emp_name, sum(s.amount) as total_sales from Employee e
join Sales s
on e.emp_id=s.emp_id
group By e.emp_name;

#17
select e.emp_name, count(s.sales_id) as number_of_sales from Employee e
join Sales s
on e.emp_id=s.emp_id
group By e.emp_name;

#18
select product, sum(amount) as total_sales_amount from Sales
group By product;

#19
select product, avg(amount) as avg_sales_amount from Sales
group By product;

#20
select e.emp_name, count(s.sales_id) as no_of_sales from Employee e
join Sales s
on e.emp_id=s.emp_id
group By e.emp_name 
having no_of_sales>2;

# Advanced group By
#21
select e.emp_name, sum(e.salary) as total_salary, sum(s.amount) as total_sales_amount from Employee e
join Sales s
on e.emp_id=s.emp_id
group By e.emp_name;

#22
select e.emp_name, count(distinct s.product) as unique_product from Employee e
join Sales s
on e.emp_id=s.emp_id
group By emp_name;

#23
select e.emp_name, max(s.amount) as highest_sales_amount from Employee e
join Sales s
on e.emp_id=s.emp_id
group By emp_name;

#24
select product, sum(amount) as total_sales_amount from Sales 
group By product
having total_sales_amount>50000;

#25
select e.department, avg(s.amount) as highest_average from Employee e
join Sales s 
on e.emp_id=s.emp_id
group By e.department
order By highest_average Desc
limit 1;

# Real world scenarios
#26
select e.department, sum(s.amount) as highest_total from Employee e
join Sales s 
on e.emp_id=s.emp_id
group By e.department
order By highest_total Desc
limit 1;

#27
select e.department, sum(s.amount) as highest_total from Employee e
join Sales s 
on e.emp_id=s.emp_id
group By e.department
order By highest_total Desc
limit 3;

#28
select year(joining_date), count(emp_id), avg(salary) from Employee
group By year(joining_date);

#29
select e.department, sum(s.amount) as total_sales_amount from Employee e
join Sales s 
on e.emp_id=s.emp_id
group By e.department;

#30
select e.department, e.emp_name, count(s.sales_id) as sales from Employee e
join Sales s
on e.emp_id=s.emp_id
group By e.department, e.emp_name
having sales=0;