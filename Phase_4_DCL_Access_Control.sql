--///ACCESS CONTROL (DCL)///
--//Admin Role//
USE AmazonDatabase;
CREATE ROLE AmazonDatabaseAdmin;

--CREATE users for specific roles.
USE master;
CREATE LOGIN amazonadminpatrick WITH PASSWORD = 'amazonadminpatrickpassword';
USE AmazonDatabase;
CREATE USER amazonadmin FOR LOGIN amazonadminpatrick;

--GRANT permissions to specific roles.
USE AmazonDatabase;
GRANT CREATE PROCEDURE, CREATE TABLE, EXECUTE, SELECT, INSERT, UPDATE, DELETE TO DatabaseAdmin;

EXEC sp_addrolemember 'AmazonDatabaseAdmin', 'amazonadmin';


--//User Role//
USE AmazonDatabase;
CREATE ROLE AmazonUser;

--CREATE users for specific roles.
USE master;
CREATE LOGIN amazonusermichaelscott WITH PASSWORD = 'amazonusermichaelscottpassword'
USE AmazonDatabase;
CREATE USER amazonuser#1 FOR LOGIN amazonusermichaelscott;

--GRANT permissions to specific roles.
USE AmazonDatabase;
GRANT SELECT, INSERT, UPDATE ON DimCustomer TO AmazonUser;
GRANT SELECT, INSERT, UPDATE ON DimDate TO AmazonUser;
GRANT SELECT, INSERT, UPDATE ON DimProduct TO AmazonUser;
GRANT SELECT, INSERT, UPDATE ON DimTerritory TO AmazonUser;
GRANT SELECT, INSERT, UPDATE ON SCHEMA:: SalesSchema TO AmazonUser;

EXEC sp_addrolemember 'AmazonUser', 'amazonuser#1';

--//Viewer Role//
USE AmazonDatabase;
CREATE ROLE AmazonViewer;

--CREATE users for specific roles.
USE master;
CREATE LOGIN amazonviewerdwightschrute WITH PASSWORD = 'amazonviewerdwightschrutepassword';
USE AmazonDatabase;
CREATE USER amazonviewer#1 FOR LOGIN amazonviewerdwightschrute;

--GRANT permissions to specific roles.
GRANT SELECT ON DimCustomer TO AmazonViewer;
GRANT SELECT ON DimDate TO AmazonViewer;
GRANT SELECT ON DimProduct TO AmazonViewer;
GRANT SELECT ON DimTerritory TO AmazonViewer;
GRANT SELECT ON SCHEMA:: SalesSchema TO AmazonViewer;

EXEC sp_addrolemember 'AmazonViewer', 'amazonviewer#1';