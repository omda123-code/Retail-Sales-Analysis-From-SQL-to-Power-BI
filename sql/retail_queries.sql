use [Online Food Delivery Dataset]
select * from [List of Orders]
select * from [Order Details]
select * from [Sales target]

------- q01-Which city has the most orders?
select 
City ,
count(distinct(Order_ID)) as Total_Orders
from [List of Orders]
group by City
order by Total_Orders desc;

--------- q02 - Which category is the most sold?
select Category,
sum(Quantity) as Total_Quantity
from [Order Details]
group by Category
order by Total_Quantity desc;

---------- q03 - Which sub-category generates the highest profit?
select Sub_Category,
sum(Profit) as Total_Profit
from [Order Details]
group by Sub_Category
order by Total_Profit desc;

----------- q04 - How many orders are placed each month?
select st.Month_of_Order_Date,
count(distinct(od.Order_ID)) as Total_Orders
from [Sales target] st
join [Order Details] od on st.Category=od.Category
group by st.Month_of_Order_Date
order by Total_Orders;

---------- q05 - Who are the top customers by spending?
select lo.CustomerName,count(distinct(lo.Order_ID)) as Orders_count,
sum(od.Amount) as Total_Spend
from [List of Orders] lo
join [Order Details] od on lo.Order_ID=od.Order_ID
group by lo.CustomerName
order by Total_Spend desc;

------- q06 - What is the overall profit margin?
select sum(Profit) * 1.0 /nullif(sum(Amount),0) as Profit_Margin
from [Order Details] 

------- q07 - Which sub_categories are unprofitable or low profit?
select 
Sub_Category,
sum(Profit) as Total_Profit
from [Order Details]
group by Sub_Category 
having sum(Profit) <= 0
order by Total_Profit asc;

---------- q08 - Which states generate the most revenue?
select State,
sum(od.Amount) as Total_Revenue
from [List of Orders] lo
join [Order Details] od on lo.Order_ID=od.Order_ID
group by State 
order by Total_Revenue desc;

----------- q09 - Which sub-categories are ordered the most?
select Sub_Category,
sum(Quantity) as Total_Quantity
from [Order Details]
group by Sub_Category
order by Total_Quantity desc;

--------- q10 - Which categories are ordered the most?
select Category,
sum(Quantity) as Total_Quantity
from [Order Details]
group by Category
order by Total_Quantity desc;

--------- q11- What is the sales vs profit per category?
SELECT Category,
       SUM(Amount) AS Total_Sales,
       SUM(Profit) AS Total_Profit
FROM [Order Details]
GROUP BY Category
ORDER BY SUM(Amount) DESC;

----------- q 12 - What is the revenue contribution percentage by state?
SELECT O.State,
       SUM(od.Amount) AS Total_Revenue,
       CAST(SUM(od.Amount) * 100.0 / SUM(SUM(od.Amount)) OVER() AS DECIMAL(5,2)) AS Revenue_Percent
FROM [List of Orders] O
JOIN [Order Details] od  ON O.Order_ID = od.Order_ID
GROUP BY O.State
ORDER BY Total_Revenue DESC;

---------- q13 - What is the relationship between profit and quantity by sub-category?
SELECT Sub_Category,
       SUM(Quantity) AS Total_Quantity,
       SUM(Profit) AS Total_Profit
FROM [Order Details]
GROUP BY Sub_Category
ORDER BY Total_Quantity DESC;














