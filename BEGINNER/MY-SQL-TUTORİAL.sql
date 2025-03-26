SELECT * FROM Products;--ÜRÜNLER TABLOSUNU GETİRDİ.TÜM SÜTUNLARI SEÇ.
SELECT name,warehouseInfo FROM Products;--Ürünler tablosundan name ve warehouseInfo sutunlarını seç getir.
SELECT DISTINCT warehouseInfo FROM Products;-- ÜRÜNLER TABLOSUNDAN WAREHOUSEINFO SUTUNUNDAKİ FARKLI OLANLARI GETİR.
SELECT COUNT(DISTINCT warehouseInfo) FROM Products;--ÜRÜNLER TABLOSUNDAN warehouseInfo SUTUNUNDAKİ FARKLI OLANLARIN SAYISINI GETİRDİ.
--
SELECT * FROM Products
WHERE warehouseInfo='depo003';-- ürünler tablosundan warehouseInfo sutundaundaki değeri depo003 olan satırları getir.
--
SELECT name, warehouseInfo 
FROM Products WHERE warehouseInfo='depo002';--ürünlertablosundan name ve warehouseInfo sutunlarından warehousInfosu deepo002 olan satırları getir.
--
SELECT name FROM Products WHERE quantity BETWEEN 3 AND 9;
SELECT warehouseInfo FROM Products WHERE quantity BETWEEN 1 AND 3;--1 İLE 3 ARASINDA
--
SELECT * FROM Users WHERE name LIKE 'm%';-- users tablosunun tüm sutunlarını seç getir ama bunlardan ismi m ile başlayanaı ara bul ve o satırı sadece getir.
--
SELECT name, warehouseInfo FROM Products WHERE quantity IN(2,8);-- ÜRÜNLER TABLOSUNDAN İSİM VE DEPO BİLGİSİ SUTUNLARI ELİNDE TUT, VE BU TTABLODAN ADET SAYISI 2 VE 8 OLANLARI GETİR.
--
SELECT * FROM Products ORDER BY quantity;-- adaet sayısı küçükten büyüğe sıralanarak tablo geldi.
--
SELECT * FROM Products ORDER BY quantity DESC;--büyükten küçüğe sıralnmasını istersem , "ASC" İSE KÜÇÜKTEN BÜYÜĞE SIRALAR.
--
SELECT name FROM Users ORDER BY name;--ŞİMDİ İSE ALFABETİK SIRAYA GÖRE SIRALADI.
--
SELECT * FROM Products ORDER BY   name,quantity DESC ; -- ürünler tablosunda name öncelikli olarak quantity ile beraber büyükten küçüğe sıralama yapıldı.aynı değerlerde name önceliklendirildi.
SELECT * FROM Products ORDER BY   name ASC,quantity DESC ; --NAME KÜÇÜKTEN BÜYÜĞE, QUANTİTİY BÜYÜKTEN KÜÇÜĞE SIRALANDI.
--
SELECT * FROM Products WHERE  warehouseInfo= 'depo003' AND name LIKE '%5';-- ÜRÜNLER Tblosundan depo bilgisi 003 VE isminin sonu 5 ile biten satırları getir.
--
SELECT * FROM Users WHERE id LIKE '8%' AND ( name LIKE 'B%' OR name LIKE 'm%');--burada b ile başlayan name olmadığı için sadece m ile olan satırı getirdi.
SELECT * FROM Users WHERE id LIKE '8%' AND ( name LIKE 'a%' OR name LIKE 'm%');-- tüm tabloyu getirdi. çünkü orda iki ifade de sağlanınca ve görevi görüyor.
--
SELECT * FROM Products WHERE NOT warehouseInfo='depo003';--not ile tam tersini çağırıyoruz.
--
INSERT INTO table01(TABLENAME,id) VALUES('BEYZA',01); -- EKLENDİ.

INSERT INTO table01(TABLENAME,id) VALUES('AHMET',02),('beyza nur keskin',03);--birden fazla ekleme yapıldı.

UPDATE table01 SET TABLENAME= 'MERVE HORASAN' WHERE id=1;

DELETE FROM table01 WHERE TABLENAME='MERVE HORASAN';

--DELETE FROM table_name;SADEVE SATIRLARI SİLER SUTUNLARA DOKUNMAZ.
--DROP TABLE Customers;TAMAMEN TABLOYU KALDIRIR

SELECT TOP 2 * FROM Users;-- userdaki ilk 2 kaydı getirdi.
SELECT TOP 50 PERCENT * FROM Users;--TABLONUN YARISINI GETİRDİ.
SELECT TOP 3 * FROM Products WHERE warehouseInfo='depo003';-- depo003 kaydından ne kadar varsa 3 ü aşmamak suretiyle getirdi.
SELECT TOP 3 * FROM Users ORDER BY name DESC;--İLK 3 VERİYİ BÜYÜKTEN KÜÇÜĞE SIRALADI.
--


/* MIN()- seçili sütundaki en küçük değeri döndürür
MAX()- seçili sütundaki en büyük değeri döndürür
COUNT()- bir kümedeki satır sayısını döndürür
SUM()- sayısal bir sütunun toplamını döndürür
AVG()- sayısal bir sütunun ortalama değerini döndürür */

SELECT * FROM Users WHERE password= ( SELECT MIN(password) FROM Users);
/*İçteki SELECT MIN(password) FROM Users sorgusu, şifrelerin en küçük olanını bulur.

Dıştaki sorgu ise, bu minimum şifreye sahip olan kullanıcıların tüm bilgilerini getirir.*/

SELECT MIN(password) AS SMALLPASWORD FROM Users;--TAKMA AD VERİLDİ.

SELECT COUNT(*) FROM Users;--SATIR SAYISI DÖNDÜ. * YERİNE SUTUN ADI BELİRTİRSEN NULL SAYILMAZ. ALTTA ÖRNEK VAR.
SELECT COUNT(password) FROM Users;-- SAYDI ÇÜNKÜ BENİM ŞİFREM NULL DEĞİL BOŞ.

SELECT COUNT(DISTINCT quantity) FROM Products;--AYNI DEĞERE SAHİP SATIRLAR BİR SAYILIP SONUÇ VERİLDİ.
select COUNT(DISTINCT quantity)  AS [NUMBER  OF RECORDS] FROM Products;-- SUTUNA BAŞLIK EKLEDİK


SELECT COUNT(DISTINCT password) AS [Number of records], id
FROM Users
GROUP BY id;-- IDEYE GÖRE GRUPLANDIRARAK PASSWORDU BİRİBİRİNDEN BENZERSİZ OLANLARIN SAYISINI YENİ TAKMA AD SUTUNUNDA VERDİ.


SELECT SUM(quantity) AS TOPLAM FROM Products;-- ADETİ TOPLADI.
SELECT AVG(quantity) FROM Products;--ORTALAMA ALDI.


SELECT * FROM Products WHERE quantity > (SELECT AVG(quantity) FROM Products);--Ortalama ADETTEN daha yüksek ADETE sahip tüm ürünler

SELECT * FROM Users
WHERE name LIKE '[bsM]%'; --"b", "s" veya "p" ile başlayan tüm müşterileri döndür
SELECT * FROM Users
WHERE name LIKE '[a-f]%'-- "a", "b", "c", "d", "e" veya "f" ile başlayan tüm müşterileri döndür;

SELECT * FROM Products WHERE quantity IN ('2','8');
SELECT * FROM Products WHERE QUANTİTY NOT IN ('2','8');

SELECT * FROM Users WHERE workingWarehouse IN (SELECT warehouseInfo FROM Products)--Products tablosunda bulunan depo bilgileriyle eşleşen depolarda çalışan kullanıcıları listelemek.

SELECT * FROM  Users WHERE workingWarehouse NOT IN (SELECT warehouseInfo FROM Products);--TAM TERSİNİ GETİRDİ.

SELECT * INTO CUSTOM FROM Users;--TABLOYU OLUŞTURDUĞUM YENİ TABLOYA KOPYALADI.

SELECT * INTO CUSTOM IN 'SELAM.DB' FROM Users;--EĞER BAŞKA BİR VERİ TABANINDA BİR TABLOYA KOPYALACAKSAK BÖYLE YAPILIR:


/*SELECT CustomerName, ContactName INTO CustomersBackup2017
FROM Customers;
SELECT * INTO CustomersGermany
FROM Customers
WHERE Country = 'Germany';
SELECT Customers.CustomerName, Orders.OrderID
INTO CustomersOrderBackup2017
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID;*/
/*

INSERT INTO Customers (CustomerName, ContactName, Address, City, PostalCode, Country)
SELECT SupplierName, ContactName, Address, City, PostalCode, Country FROM Suppliers;
INSERT INTO Customers (CustomerName, City, Country)
SELECT SupplierName, City, Country FROM Suppliers
WHERE Country='Germany';

SELECT OrderID, Quantity,
CASE
    WHEN Quantity > 30 THEN 'The quantity is greater than 30'
    WHEN Quantity = 30 THEN 'The quantity is 30'
    ELSE 'The quantity is under 30'
END AS QuantityText
FROM OrderDetails;


SELECT CustomerName, City, Country
FROM Customers
ORDER BY
(CASE
    WHEN City IS NULL THEN Country
    ELSE City
END);

  CREATE PROCEDURE SelectAllCustomers
AS
SELECT * FROM Customers
GO;  
    
    EXEC SelectAllCustomers;
    
 CREATE PROCEDURE SelectAllCustomers @City nvarchar(30)
AS
SELECT * FROM Customers WHERE City = @City
GO;   
 EXEC SelectAllCustomers @City = 'London';   
    

*/
SELECT Products.id, Products.name, Products.quantity, Users.workingWarehouse 
FROM Products 
INNER JOIN  Users 
ON Users.workingWarehouse=Products.warehouseInfo;-- Eğer Products.warehouseInfo değerine karşılık gelen Users.workingWarehouse değeri yoksa, o ürünler sonuç kümesine dahil edilmez.Sadece eşleşen kayıtlar döner 

SELECT Products.id, Products.name, Products.quantity,Users.workingWarehouse FROM Products LEFT JOIN Users ON Users.workingWarehouse=Products.warehouseInfo;-- Eğer sadece Products tablosundaki tüm ürünleri görmek ama Users tablosunda eşleşme olmayanları NULL olarak göstermek istiyorsan, LEFT JOIN kullanmalı.amaç: Products tablosundaki tüm ürünleri görmek, ancak Users tablosunda karşılığı olmayanları NULL olarak göstermek.


SELECT Products.id, Products.name, Products.quantity,Users.workingWarehouse FROM Products RIGHT JOIN  Users ON Users.workingWarehouse=Products.warehouseInfo;-- Eğer sadece users tablosundaki tüm ürünleri görmek ama Product tablosunda eşleşme olmayanları NULL olarak göstermek istiyorsan, rıght JOIN kullanmalı.amaç: Users tablosundaki tüm kullanıcıları görmek, ancak Products tablosunda karşılığı olmayanları NULL olarak göstermek.


SELECT Products.id, Products.name, Products.quantity,Users.workingWarehouse FROM Products FULL JOIN  Users ON Users.workingWarehouse=Products.warehouseInfo;-- Yani her iki tabloyu da eksiksiz birleştirir ve eksik eşleşmelerde NULL değerleri döndürür.


/* 
JOIN Türü	                   Hangi Kayıtları Döndürür?	      Eşleşmeyenler NULL Döndürür mü?
--------------------------------------------------------------------------------------------------------------------------
INNER JOIN	       Sadece eşleşen kayıtlar	                     ❌ Hayır

LEFT JOIN	         Products’taki tüm kayıtlar + eşleşen Users	   ✅ Evet (eşleşmeyen Users için)

RIGHT JOIN	       Users’taki tüm kayıtlar + eşleşen Products	   ✅ Evet (eşleşmeyen Products için)

FULL JOIN	         Products + Users'taki tüm kayıtlar	           ✅ Evet (her iki tarafta da eşleşmeyenler NULL olur)


CREATE PROCEDURE SelectAllCustomers @City nvarchar(30), @PostalCode nvarchar(10)
AS
SELECT * FROM Customers WHERE City = @City AND PostalCode = @PostalCode
GO;
XEC SelectAllCustomers @City = 'London', @PostalCode = 'WA1 1DP';
*/


SELECT p.id, p.name, p.quantity, u.name as 'Oluşturan Personel', w.name as 'depolar' FROM Products p 
INNER JOIN Users u ON p.created_from_user_id= u.id
INNER JOIN Warehouse w ON p.warehouse_id = w.id
--bu ürün hangi depoda


