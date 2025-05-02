SELECT o.OgrenciAdi,p.Puan 
FROM Ogrenciler o, Paunlar p
WHERE o.OgrenciID=p.PuanID

SELECT o.OgrenciAdi,p.Puan 
FROM Ogrenciler o INNER JOIN Paunlar p
ON o.OgrenciID=p.PuanID

SELECT o.OgrenciAdi,p.Puan 
FROM Ogrenciler o LEFT JOIN Paunlar p
ON o.OgrenciID=p.PuanID

SELECT o.OgrenciAdi,p.Puan 
FROM Paunlar p INNER JOIN Ogrenciler o
ON o.OgrenciID=p.PuanID

SELECT o.OgrenciAdi,p.Puan 
FROM Paunlar p RIGHT JOIN Ogrenciler o 
ON o.OgrenciID=p.PuanID

SELECT OgrenciID,OgrenciAdi FROM Ogrenciler WHERE OgrenciID IN (1,2)
UNION
SELECT OgrenciID,OgrenciAdi FROM Ogrenciler WHERE OgrenciID IN (3,4)

SELECT OgrenciID,OgrenciAdi FROM Ogrenciler WHERE OgrenciID IN (1,2,3)
UNION
SELECT OgrenciID,OgrenciAdi FROM Ogrenciler WHERE OgrenciID IN (3,4)

SELECT OgrenciID,OgrenciAdi FROM Ogrenciler WHERE OgrenciID IN (1,2,3)
UNION ALL
SELECT OgrenciID,OgrenciAdi FROM Ogrenciler WHERE OgrenciID IN (3,4)

SELECT OgrenciID,OgrenciAdi FROM Ogrenciler WHERE OgrenciID IN (1,2,3)
UNION
SELECT 5, 'Beyza'

SELECT * INTO Products_Backup20250502 FROM Products

SELECT * INTO Products_BackupCategory120250502 FROM Products WHERE CategoryID=1

SELECT ABS(-5),ABS(0),ABS(+5)

SELECT PI()

SELECT SIN(0), COS(0)
SELECT SIN(PI()/2), COS(PI()/2)

SELECT ASIN(1), ACOS(0)

SELECT FLOOR(123.45), FLOOR(-123.45)

SELECT CEILING(123.45), CEILING(-123.45)

SELECT RAND()*100

SELECT POWER (3,3)

SELECT CHARINDEX('AKx','KAITEK AKADEMİ')

WHERE ProductName LIKE '%AK%'

WHERE CHARINDEX('AK',ProductName) > 0


SELECT CONCAT('KAITEK',' ','AKADEMİ')

SELECT CONCAT(OgrenciAdi,' ',OgrenciSoyadi) AS AdiSoyadi FROM Ogrenciler
SELECT CONCAT('Puan: ',STR(65))


SELECT ProductName, LEN(ProductName) FROM Products

SELECT SUBSTRING('KAITEK AKADEMİ',8,3)

SELECT LOWER('GĞ')

SELECT LTRIM(RTRIM(' KAITEK '))
SELECT LTRIM(' KAITEK')
SELECT * FROM STRING_SPLIT('KAITEK AKADEMİ',' ')
SELECT * FROM STRING_SPLIT('KAITEK,AKADEMİ,FERHAT',',')

SELECT RIGHT(CONCAT('000000',LTRIM(STR(Puan))),3) FROM Puanlar  

000080
SELECT 65
'000000'
1		000001
10		000010
100		000100

SELECT RIGHT(CONCAT('0000000000000000000',LTRIM(STR(12345))),6)
SELECT REPLACE(REPLACE(REPLACE('ÖĞRENCİ','Ö','O'),'Ğ','G'),'İ','I')

'00000012345'

SELECT GETDATE() 
SELECT 5*20+12
SELECT DAY(GETDATE())
SELECT MONTH(GETDATE())
SELECT YEAR(GETDATE())
SELECT DATEPART(year, GETDATE()) AS DatePartInt;

SELECT OrderID,ShippedDate, YEAR(ShippedDate),  MONTH(ShippedDate)
FROM Orders 
WHERE YEAR(ShippedDate) = 1997 AND MONTH(ShippedDate) = 4

SELECT DATEDIFF(year, '2017/08/25', '2011/08/25') AS DateDiff;
SELECT DATEDIFF(month, '2017/08/25', '2011/08/25') AS DateDiff;
SELECT DATEDIFF(hour, '2017/08/25 07:00', '2017/08/25 12:45') AS DateDiff;

SELECT OrderID,ShippedDate, YEAR(ShippedDate)
FROM Orders 
--WHERE ShippedDate>='1996-08-30 00:00:00.000' AND ShippedDate<'1996-08-31 00:00:00.000'
--WHERE ShippedDate>='1996-08-30 00:00:00.000' AND ShippedDate<='1996-08-30 23:59:59.999'
WHERE CAST(ShippedDate AS DATE) = '1996-08-30'
--WHERE ShippedDate='30/08/1996 00:00:00.000'
--WHERE ShippedDate='08/30/1996 00:00:00.000'

SELECT * FROM Products

SELECT COUNT(*) FROM Products
SELECT MIN(UnitPrice) FROM Products
SELECT MAX(UnitPrice) FROM Products
SELECT AVG(UnitPrice) FROM Products
SELECT SUM(UnitPrice) FROM Products

SELECT 
COUNT(*) AS Adet,
SUM(UnitPrice) AS Toplam,
MIN(UnitPrice) AS Minimum,
MAX(UnitPrice) AS Maksimum,
AVG(UnitPrice) AS Ortalama,
SUM(UnitPrice)/COUNT(*) AS Ortalama2
FROM Products

SELECT 
CategoryID, COUNT(*) AS Adet
FROM Products
GROUP BY CategoryID

SELECT 
CategoryID,
COUNT(*) AS Adet,
SUM(UnitPrice) AS Toplam,
MIN(UnitPrice) AS Minimum,
MAX(UnitPrice) AS Maksimum,
AVG(UnitPrice) AS Ortalama,
SUM(UnitPrice)/COUNT(*) AS Ortalama2
FROM Products
GROUP BY CategoryID

SELECT COUNT(*) FROM Customers

SELECT Country,COUNT(*) AS Adet FROM Customers GROUP BY Country

SELECT Country,City,COUNT(*) AS Adet 
FROM Customers 
GROUP BY Country,City 
ORDER BY Country,COUNT(*) DESC

SELECT COALESCE(ShipRegion,'') FROM Orders

SELECT *,
CASE
WHEN unitPrice<50 THEN 'Ucuz'
WHEN unitPrice>=50 AND unitPrice<80 THEN 'Orta'
ELSE 'Pahallı'
END AS UrunFiyatDurumu
FROM Products