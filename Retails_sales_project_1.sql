---Sql Retail sales analysis.

create database sql_project_1;

create table retail_sales(
   transactions_id int,
   sale_date date,	
   sale_time time,
   customer_id int,
   gender	varchar(15),
   age	int,
   category	varchar(15),
   quantiy int,
   price_per_unit float,
   cogs float,
   total_sale float
);
select * from retail_sales
limit 10

select count(*) from retail_sales

---data Cleaning (Removing The dulicate value)

delete from retail_sales
where transactions_id is null
or

 sale_date is null
or
 sale_time is null
or
 customer_id is null
or
gender is null
or
age is null
or

category is null
or
quantiy is null
or
price_per_unit is null
or
cogs is null
or
total_sale is null

---Data exploration
select * from retail_sales
---How many unique customer  we have

select count(distinct customer_id) from  retail_sales

---How many Unique Catagory
select distinct category from retail_sales

---Data Analysis & Business Key Problem
---Q1: Write a SQl query to retrive all columns for sales made on "2022-11-05"

select * from retail_sales
where sale_date ='2022-11-05';

---Q2: Write a SQl query to retrive all transcation where category is 'clothing' and the quantity sold is more thean 4
---in the  month pf nov 2022.
select *
from retail_sales
where category='clothing'
and 
to_char(sale_date,'yyyy-mm')='2022-11'
and
quantiy	>=4
---Write A SQL Query to calculate the total sales for each category
select category,
sum(total_sale) as net_sales
from retail_sales
group by category

---Write a SQL query to find the avrage age of customers who purchased items from the 'beauty' category
select 
round(avg(age)) as avg_age
from retail_sales
where category = 'beauty'

---Sql Query to find all transcation where the total sales greater than 1000
select * from retail_sales
where total_sale >= 1000
---SQL query to find the total number of transcation  made by each gender and in each category
select category,gender,
count(transactions_id)
from retail_sales
group by gender,category

--Write a sql query to find the avrage sales for each month.To find the best selling month in each year
select 
extract(year from sale_date) as year,
extract(month from sale_date) as month,
round(avg(total_sale)) as avg_sale
from retail_sales
group by year,month
order by year,avg_sale desc

select * from retail_sales
----SQL query to find the top 5 customer based on the highest total sales
select 
customer_id,
sum(total_sale)
from retail_sales
group by 1
order by 2 desc
limit 5

----Write a SQL query to find the number of unique customers who purchased items from each category
select category,count(distinct customer_id)
from retail_sales
group by category
---Write sql query to create each shift and number of orders(eg morning <=12 ,afternoon between 12&17)

with hourly_sale
as
(
select *,
case
when extract(hour from sale_time)<12 then 'morning'
when extract(hour from sale_time)between 12 and 17 then 'afternoon'
else 'evening'
end as shift
from retail_sales
)
select shift ,
count(*) as total_orders
from hourly_sale
group by shift

select extract(hour from current_time)---To Extract The Current Time
 



   


















