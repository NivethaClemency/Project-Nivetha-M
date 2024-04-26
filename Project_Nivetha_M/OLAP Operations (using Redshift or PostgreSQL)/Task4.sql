-- Task4
-- Project: OLAP Operations (using Redshift or PostgreSQL)
-- 1.Database Creation
Create table Sales_sample(Product_Id Integer Primary key, Region varchar(50),date_ Date, Sales_Amount Numeric);

--2.Data Creation
Insert into Sales_sample values
(2001, 'West', '2023-05-09', 1000),
(2002, 'East', '2023-05-09', 8000),
(2003, 'North', '2023-05-08', 5500),
(2004, 'South', '2023-05-07', 8500),
(2005, 'East', '2023-05-06', 8400),
(2006, 'North', '2023-05-05', 5500),
(2007, 'East', '2023-05-04', 8000),
(2008, 'West', '2023-05-03', 2000);


-- 3.Perform OLAP operations:
-- a) Drill Down
select region,product_id,sum(sales_amount) as total_sales from Sales_sample group bY region,product_id Order BY region,product_id;

--b) Rollup
Select Case When Product_Id Is Null Then 'Total' Else Region End As Region,Sum(Sales_Amount)   AS total_sales From sales_sample GROUP BY ROLLUP (Region, Product_Id) ORDER BY Region;

--c) Cube
SELECT CASE WHEN Product_Id IS NULL AND Region IS NULL AND Date_ IS NULL THEN 'Total'
WHEN Product_Id IS NULL AND Region IS NULL THEN 'Total by Date'
WHEN Product_Id IS NULL AND Date_ IS NULL THEN 'Total by Region'
WHEN Region IS NULL AND Date_ IS NULL THEN 'Total by Product'
WHEN Product_Id IS NULL THEN 'Total by Region, Date'
WHEN Region IS NULL THEN 'Total by Product, Date'
WHEN Date_ IS NULL THEN 'Total by Product, Region'
ELSE 'Detail'
END AS Perspective,Product_Id,Region,Date_, SUM(Sales_Amount) AS total_sales FROM sales_sample
GROUP BY CUBE (Product_Id, Region, Date_) ORDER BY Product_Id, Region, Date_;

--d) Slice 
SELECT *FROM Sales_sample WHERE Region = 'East' AND date_ BETWEEN '2023-05-01' AND '2023-05-09';

--e) Dice
  SELECT * FROM Sales_sample WHERE Product_Id = 2002 AND Region = 'East'
  AND date_ = '2023-05-09';

