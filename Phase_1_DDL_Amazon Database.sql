--////DATABASE DESIGN (DDL)////
--///TASK 1: DATABASE///
--Creating the Amazon database.
CREATE DATABASE AmazonDatabase;

--------------------------------------------------------------------------------------------------------------------
--//TABLES//
--Creating the DimCustomer table.
CREATE TABLE DimCustomer (
CustomerKey INT,
CustomerName VARCHAR(50),
EmailID VARCHAR(50)
);


--------------------------------------------------------------------------------------------------------------------
--Creating the DimDate table.
CREATE TABLE DimDate (
DateKey INT,
OrderDateKey INT,
OrderDate DATE,
ShipDateKey INT,
ShipDate DATE
);


--------------------------------------------------------------------------------------------------------------------
--Creating the DimProduct table.
CREATE TABLE DimProduct (
ProductKey INT,
ProductName VARCHAR(200),
ProductCategory VARCHAR(50)
);


--------------------------------------------------------------------------------------------------------------------
--Creating the DimTerritory table.
CREATE TABLE DimTerritory (
TerritoryKey INT,
City VARCHAR(50),
State VARCHAR(50),
Country VARCHAR(50)
);


--------------------------------------------------------------------------------------------------------------------
--Creating the FactSales table.
CREATE TABLE FactSales (
SalesKey INT,
CustomerKey INT,
ProductKey INT,
TerritoryKey INT,
DateKey INT,
OrderID VARCHAR(50),
Sales FLOAT,
Quantity INT,
Profit FLOAT
);


--------------------------------------------------------------------------------------------------------------------
--///SCHEMA///
--Create a SCHEMA.
CREATE SCHEMA SalesSchema;

--Modify the dbo SCHEMA into SalesSchema for FactSales.
ALTER SCHEMA SalesSchema TRANSFER dbo.FactSales;


--------------------------------------------------------------------------------------------------------------------
--///TASK 2: SPECIFY KEYS AND CONSTRAINTS///
--//DimCustomer Table//
--Modify column to disallow NULL values.
ALTER TABLE dbo.DimCustomer
ALTER COLUMN CustomerKey INT NOT NULL;

ALTER TABLE dbo.DimCustomer
ALTER COLUMN CustomerName VARCHAR(50) NOT NULL;

ALTER TABLE dbo.DimCustomer
ALTER COLUMN EmailID VARCHAR(50) NOT NULL;

--Adding PRIMARY KEY CONSTRAINT.
ALTER TABLE dbo.DimCustomer
ADD CONSTRAINT PK_DimCustomer_CustomerKey PRIMARY KEY (CustomerKey);

--Adding UNIQUE CONSTRAINTS.
ALTER TABLE dbo.DimCustomer
ADD CONSTRAINT UC_CustomerKey UNIQUE (CustomerKey);


--------------------------------------------------------------------------------------------------------------------
--//DimDate Table//
--Modify column to disallow NULL values.
ALTER TABLE dbo.DimDate
ALTER COLUMN DateKey INT NOT NULL;

ALTER TABLE dbo.DimDate
ALTER COLUMN OrderDateKey INT NOT NULL;

ALTER TABLE dbo.DimDate
ALTER COLUMN OrderDate DATE NOT NULL;

ALTER TABLE dbo.DimDate
ALTER COLUMN ShipDateKey INT NOT NULL;

ALTER TABLE dbo.DimDate
ALTER COLUMN ShipDate DATE NOT NULL;

--Adding PRIMARY KEY CONSTRAINT.
ALTER TABLE dbo.DimDate
ADD CONSTRAINT PK_DimDate_DateKey PRIMARY KEY (DateKey);

--Adding UNIQUE CONSTRAINTS.
ALTER TABLE dbo.DimDate
ADD CONSTRAINT UC_DateKey UNIQUE (DateKey);


--------------------------------------------------------------------------------------------------------------------
--//DimProduct Table//
--Modify column to disallow NULL values.
ALTER TABLE dbo.DimProduct
ALTER COLUMN ProductKey INT NOT NULL;

ALTER TABLE dbo.DimProduct
ALTER COLUMN ProductName VARCHAR(200) NOT NULL;

ALTER TABLE dbo.DimProduct
ALTER COLUMN ProductCategory VARCHAR(50) NOT NULL;

--Adding PRIMARY KEY CONSTRAINT.
ALTER TABLE dbo.DimProduct
ADD CONSTRAINT PK_DimProduct_ProductKey PRIMARY KEY (ProductKey);

--Adding UNIQUE CONSTRAINTS.
ALTER TABLE dbo.Dimproduct
ADD CONSTRAINT UC_ProductKey UNIQUE (ProductKey);


--------------------------------------------------------------------------------------------------------------------
--//DimTerritory Table//
--Modify column to disallow NULL values.
ALTER TABLE dbo.DimTerritory
ALTER COLUMN TerritoryKey INT NOT NULL;

ALTER TABLE dbo.DimTerritory
ALTER COLUMN City VARCHAR(50) NOT NULL;

ALTER TABLE dbo.DimTerritory
ALTER COLUMN State VARCHAR(50) NOT NULL;

ALTER TABLE dbo.DimTerritory
ALTER COLUMN Country VARCHAR(50) NOT NULL;

--Adding PRIMARY KEY CONSTRAINT.
ALTER TABLE dbo.DimTerritory
ADD CONSTRAINT PK_DimTerritory_TerritoryKey PRIMARY KEY (TerritoryKey);

--Adding UNIQUE CONSTRAINTS.
ALTER TABLE dbo.DimTerritory
ADD CONSTRAINT UC_TerritoryKey UNIQUE (TerritoryKey);


--------------------------------------------------------------------------------------------------------------------
--//FactSales Table//
--Modify column to disallow NULL values.
ALTER TABLE SalesSchema.FactSales
ALTER COLUMN SalesKey INT NOT NULL;

ALTER TABLE SalesSchema.FactSales
ALTER COLUMN CustomerKey INT NOT NULL;

ALTER TABLE SalesSchema.FactSales
ALTER COLUMN ProductKey INT NOT NULL;

ALTER TABLE SalesSchema.FactSales
ALTER COLUMN TerritoryKey INT NOT NULL;

ALTER TABLE SalesSchema.FactSales
ALTER COLUMN DateKey INT NOT NULL;

ALTER TABLE SalesSchema.FactSales
ALTER COLUMN OrderID VARCHAR(50) NOT NULL;

ALTER TABLE SalesSchema.FactSales
ALTER COLUMN Sales FLOAT NOT NULL;

ALTER TABLE SalesSchema.FactSales
ALTER COLUMN Quantity INT NOT NULL;

ALTER TABLE SalesSchema.FactSales
ALTER COLUMN Profit FLOAT NOT NULL;

--Adding PRIMARY KEY CONSTRAINT.
ALTER TABLE SalesSchema.FactSales
ADD CONSTRAINT PK_FactSales_SalesKey PRIMARY KEY (SalesKey);

--Adding FOREIGN KEY CONSTRAINT.
ALTER TABLE SalesSchema.FactSales
ADD CONSTRAINT FK_FactSales_DimCustomer FOREIGN KEY (CustomerKey)
REFERENCES dbo.DimCustomer(CustomerKey);

ALTER TABLE SalesSchema.FactSales
ADD CONSTRAINT FK_FactSales_DimProduct FOREIGN KEY (ProductKey)
REFERENCES dbo.DimProduct(ProductKey);

ALTER TABLE SalesSchema.FactSales
ADD CONSTRAINT FK_FactSales_DimTerritory FOREIGN KEY (TerritoryKey)
REFERENCES dbo.DimTerritory(TerritoryKey);

ALTER TABLE SalesSchema.FactSales
ADD CONSTRAINT FK_FactSales_DimDate FOREIGN KEY (DateKey)
REFERENCES dbo.DimDate(DateKey);

--Adding UNIQUE CONSTRAINTS.
ALTER TABLE SalesSchema.FactSales
ADD CONSTRAINT UC_SalesKey UNIQUE (SalesKey);