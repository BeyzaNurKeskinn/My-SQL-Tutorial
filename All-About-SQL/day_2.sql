SELECT *
FROM Customers
WHERE Country = 'Germany'

SELECT *
FROM Products
WHERE CategoryID = 6

SELECT *
FROM Products
WHERE CategoryID = 6 AND SupplierID=25


--0 False Kapalı 
--1 True  Açık

--A	B			A AND B
--0	0			0
--0	1			0
--1	0			0
--1	1			1

SELECT *
FROM Products
WHERE CategoryID = 6

SELECT *
FROM Products
WHERE CategoryID <> 6

SELECT *
FROM Products
WHERE NOT CategoryID = 6

SELECT *
FROM Products
WHERE CategoryID = 6 AND SupplierID=25

SELECT *
FROM Products
WHERE NOT (CategoryID = 6 AND SupplierID=25)

SELECT *
FROM Products
WHERE CategoryID = 6 OR CategoryID = 7 OR CategoryID = 8

--A		B			A OR B
--0		0			0		
--0		1			1
--1		0			1
--1		1			1

SELECT *
FROM Products
WHERE CategoryID IN (6,7,8) 

SELECT *
FROM Products
WHERE NOT (CategoryID = 6 OR CategoryID = 7 OR CategoryID = 8)

SELECT *
FROM Products
WHERE NOT CategoryID IN (6,7,8) 

SELECT *
FROM Products
WHERE CategoryID NOT IN (6,7,8) 

SELECT *
FROM Customers
WHERE Country = 'Germany' OR Country='UK'

SELECT *
FROM Customers
WHERE Country IN('Germany','UK')

SELECT *
FROM Products 
WHERE CategoryID >= 2 AND CategoryID <= 4  --IN (2,3,4)

SELECT *
FROM Products 
WHERE CategoryID BETWEEN 2 AND 4  --IN (2,3,4)

SELECT *
FROM Products 
WHERE UnitPrice >= 10 AND UnitPrice <= 20

SELECT *
FROM Products 
WHERE UnitPrice BETWEEN 10 AND 20 

SELECT *
FROM Customers
WHERE Region IS NULL

SELECT *
FROM Customers
WHERE Region IS NOT NULL


SELECT *
FROM Customers
WHERE CustomerID='ALFKI' AND Region IS NULL


SELECT *
FROM Customers
WHERE Country LIKE 'S%'

SELECT *
FROM Customers
WHERE Country LIKE '%n'

SELECT *
FROM Customers
WHERE Country LIKE '%n%'


SELECT GETDATE()

SELECT * FROM personel

--INSERT INTO personel(adi) VALUES('ferhat')
--INSERT INTO personel(adi,maas) VALUES('ferhat',1000)
--INSERT INTO personel(adi,maas,kayittarihi) VALUES('ferhat',2000,GETDATE())
--INSERT INTO personel(maas) VALUES(1000)

SELECT * FROM personel  WHERE adi='f'
--UPDATE personel SET maas=300,adi='z'  WHERE adi='f'

--UPDATE personel SET maas=maas*1.20

--UPDATE personel SET maas=maas+100 WHERE maas<500

--UPDATE personel SET adi2=adi+'x'

--DELETE personel WHERE id=11
--DELETE personel WHERE id IN (6,7)


--UPDATE personel SET maas=300,adi='z' 
--INSERT INTO personel2 SELECT * FROM personel
--INSERT INTO personel2 SELECT * FROM personel WHERE maas>=1000

SELECT od.OrderID, p.ProductName, od.UnitPrice, od.Quantity, od.Discount
FROM Products p,  [Order Details] od
WHERE p.ProductID=od.ProductID

SELECT od.OrderID, p.ProductName, od.UnitPrice, od.Quantity, od.Discount
FROM Products p JOIN [Order Details] od
ON p.ProductID=od.ProductID

SELECT od.OrderID, p.ProductName, od.UnitPrice, od.Quantity, od.Discount
FROM Products p INNER JOIN [Order Details] od
ON p.ProductID=od.ProductID

--https://www.instagram.com/reel/DIf0U4LR9_e/#