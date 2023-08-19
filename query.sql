select month_of_order_date, sum(target) as total from sales_target
group by month_of_order_date 

--- Monthly Sales ------- Line graph
select
	category,
	to_char(order_date, 'Month') as order_month,
	sum(amount) as monthly_revenue, sum(profit) as monthly_profit
from order_details
join list_of_orders On order_details.order_id = list_of_orders.order_id
Group by category, order_month
order by order_month ASC
--- Monthly profit --- !Why the august in top 2 highest sale but has a negative profit?
--- radio button

-- What month was has the highest sales&profit?
select
	to_char(order_date, 'Month') as order_month,
	sum(amount) as monthly_revenue, sum(profit) as monthly_profit
from order_details
join list_of_orders On order_details.order_id = list_of_orders.order_id
Group by  order_month
order by monthly_revenue DESC
-- Answer: Month of January has the highest sales at 68,483 and profit at 5,359


---- Sales Performance on CITY
---- Bar graph
select city,category,
	count(category) as number_orders,
	sum(amount) as Total
from list_of_orders as A
join order_details as B ON A.order_id = B.order_id
group by  city, category
order by number_orders DESC
---What City has the highest sale
select city,
	sum(amount) as Total
from list_of_orders as A
join order_details as B ON A.order_id = B.order_id
group by  city
order by total DESC
--  Indore has accumulated 79,069 sales
--  Amritsar only accumulated 5,407

---- Sales per products
---- Bar
select category, subcategory, sum(amount) as Total_sales 
from order_details
group by category, subcategory
order by total_sales DESC
-- What Product has the highest sale
select subcategory, sum(amount) as Total_sales 
from order_details
group by subcategory
order by total_sales DESC
-- Printer had the highest sale at 58,252



---- profit vs sales
select amount, profit, category, to_char(order_date, 'Month') as order_month
from order_details as A
join list_of_orders as B on A.order_id = B.order_id
-- Despite positive sales in all three categories (Electronics, Furniture, Clothing), a significant number of instances within these categories exhibit negative profits. This suggests potential profitability challenges that need to be addressed, particularly in understanding the factors contributing to the divergence between sales and profit within each category.

select * from list_of_orders