-- Bir tablodan tüm alanları seçmek
SELECT *
FROM Products

-- Bir tablodan bazı alanları seçmek
SELECT ProductName,UnitPrice
FROM Products

SELECT  
ProductName, 
QuantityPerUnit, UnitPrice, UnitsInStock,
UnitsOnOrder, ReorderLevel, Discontinued
FROM Products

-- Bir tablodan tüm alanları seçerek ilk 5 kaydı getir
SELECT TOP 5 *
FROM Products

-- Bir tablodan bazı alanları seçerek ilk 5 kaydı getir
SELECT TOP 5  ProductName,UnitPrice
FROM Products


SELECT DISTINCT CategoryID
FROM Products

SELECT *
FROM Customers

SELECT Country
FROM Customers

SELECT DISTINCT Country
FROM Customers

SELECT Country,City
FROM Customers

SELECT DISTINCT Country,City
FROM Customers

SELECT *
FROM Customers
ORDER BY Country

SELECT *
FROM Customers
ORDER BY Country DESC

SELECT *
FROM Customers
ORDER BY Country,City

SELECT *
FROM Customers
ORDER BY Country,City DESC

SELECT *
FROM Customers
WHERE Country = 'Germany'

SELECT *
FROM Products
WHERE CategoryID = 6

SELECT *
FROM Products
WHERE CategoryID = 6 AND SupplierID=25