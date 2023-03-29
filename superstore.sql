--delete the redundant columns

ALTER TABLE [Superstore-Copy]
	DROP COLUMN [Row ID];

ALTER TABLE [Superstore-Copy]
	DROP COLUMN [Order ID];

ALTER TABLE [Superstore-Copy]
	DROP COLUMN [Customer ID];

ALTER TABLE [Superstore-Copy]
	DROP COLUMN [Postal Code];

--fix the datatype of the columns

ALTER TABLE [Superstore-Copy]
	ALTER COLUMN [Order Date] DATE;

ALTER TABLE [Superstore-Copy]
	ALTER COLUMN [Ship Date] DATE;

ALTER TABLE [Superstore-Copy]
	ALTER COLUMN Sales FLOAT;

ALTER TABLE [Superstore-Copy]
	ALTER COLUMN Quantity FLOAT;

ALTER TABLE [Superstore-Copy]
	ALTER COLUMN Discount FLOAT;

ALTER TABLE [Superstore-Copy]
	ALTER COLUMN Profit FLOAT;


--Analyse the data 

--customers that bought the most quantities
SELECT TOP 5 [Customer Name], SUM(Quantity) AS quantity
FROM [Superstore-Copy]
GROUP BY [Customer Name]
ORDER BY quantity DESC;

--Top 5 customers by sales
SELECT TOP 5 [Customer Name], SUM(Sales) AS total_sales
FROM [Superstore-Copy]
GROUP BY [Customer Name]
ORDER BY total_sales DESC;

--Top 5 customers by profit
SELECT TOP 5 [Customer Name], SUM(Profit) AS profit
FROM [Superstore-Copy]
GROUP BY [Customer Name]
ORDER BY profit DESC;

--Profit by ship mode
SELECT [Ship Mode], SUM(Profit) AS profit
FROM [Superstore-Copy]
GROUP BY [Ship Mode]
ORDER BY Profit DESC;

--Profit by category
SELECT Category, SUM(Profit) AS profit
FROM [Superstore-Copy]
GROUP BY Category
ORDER BY profit DESC;

--Profit by sub-category
SELECT [Sub-Category], SUM(Profit) AS profit
FROM [Superstore-Copy]
GROUP BY [Sub-Category]
ORDER BY profit DESC;

--Profit by customer segment 
SELECT Segment, SUM(Profit) AS profit
FROM [Superstore-Copy]
GROUP BY Segment
ORDER BY profit DESC;

--Sales by region
SELECT Region, SUM(Sales) AS sales
FROM [Superstore-Copy]
GROUP BY Region
ORDER BY sales DESC;

--Sales by City
SELECT TOP 5 City, SUM(Sales) AS sales
FROM [Superstore-Copy]
GROUP BY City
ORDER BY sales DESC;

--Sales by state
SELECT TOP 5 State, City, SUM(Sales) AS sales
FROM [Superstore-Copy]
GROUP BY State, City
ORDER BY sales DESC;
