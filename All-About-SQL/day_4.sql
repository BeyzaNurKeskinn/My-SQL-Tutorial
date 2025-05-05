SELECT * FROM vOrderDetails 

SELECT a.* FROM (
	SELECT 
	od.OrderID,
	od.ProductID,
	p.ProductName,
	od.UnitPrice,
	od.Quantity,
	od.Discount,
	od.UnitPrice * od.Quantity AS Total
	FROM [Order Details] od LEFT JOIN Products p ON od.ProductID=p.ProductID
) a


SELECT od.*,o.CustomerID FROM vOrderDetails od LEFT JOIN Orders o ON od.OrderID = o.OrderID

SELECT od.*,o.CustomerID FROM (
	SELECT 
	od.OrderID,
	od.ProductID,
	p.ProductName,
	od.UnitPrice,
	od.Quantity,
	od.Discount,
	od.UnitPrice * od.Quantity AS Total
	FROM [Order Details] od LEFT JOIN Products p ON od.ProductID=p.ProductID
) od LEFT JOIN Orders o ON od.OrderID = o.OrderID

SELECT p.*,
(SELECT SUM(Quantity) FROM [Order Details] WHERE ProductID=p.ProductID) AS Quantity
FROM Products p


SELECT p.*, od.Quantity
FROM 
Products p 
LEFT JOIN
(SELECT ProductID, SUM(Quantity) AS Quantity FROM [Order Details] GROUP BY ProductID) od 
ON p.ProductID = od.ProductID

SELECT SUM(Quantity) FROM [Order Details] WHERE ProductID=11
SELECT SUM(Quantity) FROM [Order Details] WHERE ProductID=12

SELECT * FROM Products p
WHERE ProductID IN (1,2,3)

SELECT * FROM Products p
WHERE ProductID IN (SELECT DISTINCT ProductID FROM [Order Details] WHERE Quantity < 3)
--SELECT RIGHT('000000'+LTRIM(STR(123)),6)

ALTER FUNCTION PadRight6
(
	@Sayi int 
)
RETURNS varchar(6)
AS
BEGIN

	DECLARE @ResultVar varchar(6)
	SET @ResultVar =  RIGHT('000000'+LTRIM(STR(@Sayi)),6)
	--SELECT @ResultVar=RIGHT('000000'+LTRIM(STR(@Sayi)),6)
	RETURN @ResultVar

END
GO

SELECT dbo.PadRight6(1234)

SELECT dbo.PadRight6(ProductID),* FROM Products

ALTER FUNCTION FindQuantityByProductID
(
	@ProductID int
)
RETURNS int
AS
BEGIN
	DECLARE @ResultVar int
	--SET @ResultVar = @ProductID*2
	SELECT @ResultVar = SUM(Quantity) FROM [Order Details] WHERE ProductID=@ProductID


	RETURN @ResultVar

END
GO

SELECT dbo.FindQuantityByProductID(12) AS Quantity

SELECT p.*, dbo.FindQuantityByProductID(p.ProductID) AS Quantity 
FROM Products p

SELECT p.*,
(SELECT SUM(Quantity) FROM [Order Details] WHERE ProductID=p.ProductID) AS Quantity
FROM Products p

CREATE FUNCTION Orders1
(	
	@ProductID int
)
RETURNS TABLE 
AS
RETURN 
(
	SELECT * FROM [Order Details] WHERE ProductID=@ProductID
)
GO


SELECT * FROM dbo.Orders1(11)

SELECT o.*,p.ProductName
FROM dbo.Orders1(11) o 
LEFT JOIN Products p
ON o.ProductID=p.ProductID


CREATE TABLE #TemporaryTable          -- Local temporary table - starts with single #
(
    Col1 int,
    Col2 varchar(10)
    ....
);

CREATE TABLE ##GlobalTemporaryTable   -- Global temporary table - note it starts with ##.
(
    Col1 int,
    Col2 varchar(10)
    ....
);

declare @table table (id int)
create table #table (id int)
create table ##table (id int)
select * into #table from xyz


ALTER FUNCTION Orders2
(
	@ProductID int
)
RETURNS 
@Table1 TABLE 
(
Id int,
ProductName varchar(100)
)
AS
BEGIN

	INSERT INTO @Table1(Id,ProductName) VALUES(1,'Masa')
	INSERT INTO @Table1(Id,ProductName) VALUES(2,'Sandalye')
	INSERT INTO @Table1(Id,ProductName) VALUES(3,'TV')
	DECLARE @MaxId int
	SELECT @MaxId = MAX(Id) FROM @Table1
	--PRINT @MaxId

	DECLARE @Id int
	DECLARE @ProductName varchar(100)
	SET @Id = @MaxId+1
	SET @ProductName = 'Kapı'
	INSERT INTO @Table1(Id,ProductName) VALUES(@Id,@ProductName)
	--SELECT @MaxId = MAX(Id) FROM @Table1
	--PRINT @MaxId
		RETURN 
END
GO

SELECT * FROM dbo.Orders2(12)

DECLARE @sayi int = 6

IF @sayi = 5  BEGIN
	PRINT 'BEŞ'
END ELSE BEGIN
	PRINT 'BEŞ DEĞİL'
END