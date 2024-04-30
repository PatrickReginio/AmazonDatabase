--////DATA RETRIEVAL (DQL)////
--//Basic Queries//
--Retrieves all columns from the DimCustomer table.
SELECT *
FROM DimCustomer;


--------------------------------------------------------------------------------------------------------------------
--Retrieves all columns from the DimDate table.
SELECT *
FROM DimDate;


--------------------------------------------------------------------------------------------------------------------
--Retrieves all columns from the DimProduct table.
SELECT *
FROM DimProduct;


--------------------------------------------------------------------------------------------------------------------
--Retrieves all columns from the DimTerritory table.
SELECT * 
FROM DimTerritory;


--------------------------------------------------------------------------------------------------------------------
--Retrieves all columns from the FactSales table.
SELECT *
FROM SalesSchema.FactSales;


--------------------------------------------------------------------------------------------------------------------
--Provide a query of all Customers from the DimCustomer table where the names begin with the letter "N".
SELECT CustomerName
FROM DimCustomer
WHERE CustomerName LIKE 'N%';


--------------------------------------------------------------------------------------------------------------------
--Retrieve the OrderDate from the DimDate table for the year 2012.
SELECT OrderDate
FROM DimDate
WHERE YEAR(OrderDate) = 2012;


--------------------------------------------------------------------------------------------------------------------
--Retrieve the OrderDate from the DimDate table for the month of June.
SELECT OrderDate
FROM DimDate
WHERE MONTH(OrderDate) = 06;


--------------------------------------------------------------------------------------------------------------------
--Retrieve the OrderDate from the DimDate table for June 2012.
SELECT OrderDate
FROM DimDate
WHERE MONTH(OrderDate) = 06
  AND YEAR(OrderDate) = 2012;


  --------------------------------------------------------------------------------------------------------------------
--Retrieve the OrderDate from the DimDate table for 2011 or 2012.
SELECT OrderDate
FROM DimDate
WHERE YEAR(OrderDate) = 2011
  OR YEAR(OrderDate) = 2012;


--------------------------------------------------------------------------------------------------------------------
--Retrieve distinct product categories from the DimProduct table and sort them alphabetically.
SELECT DISTINCT ProductCategory
FROM DimProduct
ORDER BY ProductCategory;


--------------------------------------------------------------------------------------------------------------------
--Retrieve the names and categories of products from the DimProduct table where the category is Appliances.
SELECT ProductName, ProductCategory
FROM DimProduct
WHERE ProductCategory = 'Appliances';


--------------------------------------------------------------------------------------------------------------------
--Count how many products there are from the DimProduct table.
SELECT COUNT(ProductName) as 'ProductCount'
FROM DimProduct;


--------------------------------------------------------------------------------------------------------------------
--Count the number of orders from the state of California in the DimTerritory table.
SELECT COUNT(State) AS 'California Orders'
FROM DimTerritory
WHERE State = 'California';


--------------------------------------------------------------------------------------------------------------------
--Retrieve all the states from the DimTerritory table.
SELECT State
FROM DimTerritory
GROUP BY State;


--------------------------------------------------------------------------------------------------------------------
--Count how many states there are from DimTerritory table.
SELECT COUNT(DISTINCT(State)) as 'StateCount'
FROM DimTerritory;


--------------------------------------------------------------------------------------------------------------------
--Retrieve all the cities from the DimTerritory table.
SELECT City
FROM DimTerritory
GROUP BY City;


--------------------------------------------------------------------------------------------------------------------
--Count how many cities there are from DimTerritory table.
SELECT COUNT(DISTINCT(City)) as 'CityCount'
FROM DimTerritory;


--------------------------------------------------------------------------------------------------------------------
--Calculate the total sales from the FactSales table, rounded to two decimal places.
SELECT ROUND(SUM(Sales),2) as 'TotalSales'
FROM SalesSchema.FactSales;


--------------------------------------------------------------------------------------------------------------------
--Calculate the average sales from the FactSales table, rounded to two decimal places.
SELECT ROUND(AVG(Sales),2) as 'AvgSales'
FROM SalesSchema.FactSales;


--------------------------------------------------------------------------------------------------------------------
--Calculate the highest sales from the FactSales table, rounded to two decimal places.
SELECT MAX(Sales) as 'HighestSale'
FROM SalesSchema.FactSales;


--------------------------------------------------------------------------------------------------------------------
--Calculate the lowest sales from the FactSales table, rounded to two decimal places.
SELECT MIN(Sales) as 'LowestSale'
FROM SalesSchema.FactSales;


--------------------------------------------------------------------------------------------------------------------
--Calculate the total quantity from the FactSales table, rounded to two decimal places.
SELECT SUM(Quantity) as 'TotalQuantity'
FROM SalesSchema.FactSales;


--------------------------------------------------------------------------------------------------------------------
--Calculate the total average from the FactSales table, rounded to two decimal places.
SELECT ROUND(AVG(Quantity),2) as 'AvgQuantity'
FROM SalesSchema.FactSales;


--------------------------------------------------------------------------------------------------------------------
--Calculate the highest quantity from the FactSales table, rounded to two decimal places.
SELECT ROUND(MAX(Quantity),2) as 'HighestQuantity'
FROM SalesSchema.FactSales;


--------------------------------------------------------------------------------------------------------------------
--Calculate the lowest quantity from the FactSales table, rounded to two decimal places.
SELECT ROUND(MIN(Quantity),2) as 'LowestQuantity'
FROM SalesSchema.FactSales;


--------------------------------------------------------------------------------------------------------------------
--Calculate the total profit from the FactSales table, rounded to two decimal places.
SELECT ROUND(SUM(Profit),2) as 'TotalProfit'
FROM SalesSchema.FactSales;


--------------------------------------------------------------------------------------------------------------------
--Calculate the avg profit from the FactSales table, rounded to two decimal places.
SELECT ROUND(AVG(Profit),2) as 'AvgProfit'
FROM SalesSchema.FactSales;


--------------------------------------------------------------------------------------------------------------------
--Calculate the highest profit from the FactSales table, rounded to two decimal places.
SELECT ROUND(MAX(Profit),2) as 'HighestProfit'
FROM SalesSchema.FactSales;


--------------------------------------------------------------------------------------------------------------------
--Calculate the lowest profit from the FactSales table, rounded to two decimal places.
SELECT MIN(Profit) as 'LowestProfit'
FROM SalesSchema.FactSales;


--------------------------------------------------------------------------------------------------------------------
--Retrieve the OrderID and the total quantity of items ordered for each order from the FactSales table.
SELECT OrderID, COUNT(Quantity) as 'TotalQuantity'
FROM SalesSchema.FactSales
GROUP BY OrderID
HAVING COUNT(Quantity) > 3


--------------------------------------------------------------------------------------------------------------------
--List the top 10 customers based on their total purchases.
SELECT TOP 10 dc.CustomerName,
              SUM(fs.Sales) as 'TotalPurchase'
FROM SalesSchema.FactSales as fs
JOIN DimCustomer as dc
  ON fs.CustomerKey = dc.CustomerKey
GROUP BY dc.CustomerName
ORDER BY TotalPurchase DESC;


--------------------------------------------------------------------------------------------------------------------
--//ADVANCED Queries//
--Retrieve all products that have been ordered by customer Aaron Bergman.
SELECT ProductName, ProductCategory
FROM DimProduct
WHERE ProductKey IN (SELECT ProductKey
					 FROM SalesSchema.FactSales
					 WHERE CustomerKey IN (SELECT CustomerKey
										   FROM DimCustomer
										   WHERE CustomerName = 'Aaron Bergman'
										   )
					 )
;


--------------------------------------------------------------------------------------------------------------------
--Provide a list of customers categorized based on their sales performance, distinguishing between those with the highest, moderate, and low sales.
WITH AvgSalesCTE as (
	SELECT ROUND(AVG(Sales),2) as 'AvgSales'
	FROM SalesSchema.FactSales
)
SELECT fs.OrderID,
       dc.CustomerName,
	   dc.EmailID,
	   fs.Sales,
	   CASE
	       WHEN fs.Sales > (SELECT AvgSales FROM AvgSalesCTE) * 1.5 THEN 'HighSales'
		   WHEN fs.Sales >= (SELECT AvgSales FROM AvgSalesCTE) THEN 'ModerateSales'
		   ELSE 'LowSales'
	   END as SalesCategory
FROM DimCustomer as dc
JOIN SalesSchema.FactSales as fs
  ON dc.CustomerKey = fs.CustomerKey
ORDER BY fs.Sales DESC;


--------------------------------------------------------------------------------------------------------------------
--Retrieve the customers and order date, while assigning a rank to each record based on the order date.
SELECT CustomerName,
	   OrderDate,
	   ROW_NUMBER() OVER (ORDER BY OrderDate ASC) as Rank
FROM SalesSchema.FactSales as fs
JOIN DimCustomer as dc
  ON fs.CustomerKey = dc.CustomerKey
JOIN DimDate as dd
  ON fs.DateKey = dd.DateKey