CREATE DATABASE ECommerceDB;
GO
 USE ECommerceDB;
 GO
 
 CREATE TABLE Customers(
      customerID INT PRIMARY KEY IDENTITY(1,1),
      FirstName NVARCHAR(50),
      LastName NVARCHAR(50),
      Email NVARCHAR(100) UNIQUE,
      Phone NVARCHAR(15),
      CreatedAt DATETİME DEFAULT GETDATE());
      GO
      
      CREATE TABLE Products (
    ProductID INT PRIMARY KEY IDENTITY(1,1),
    ProductName NVARCHAR(100),
    Price DECIMAL(10,2),
    Stock INT
);
GO

-- 4. Siparişler tablosu
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY IDENTITY(1,1),
    CustomerID INT,
    OrderDate DATETIME DEFAULT GETDATE(),
    TotalAmount DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
GO

-- 5. Sipariş detayları tablosu
CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY IDENTITY(1,1),
    OrderID INT,
    ProductID INT,
    Quantity INT,
    Price DECIMAL(10,2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
GO

-- Müşteriler ekleyelim
INSERT INTO Customers (FirstName, LastName, Email, Phone)
VALUES 
('Ahmet', 'Yılmaz', 'ahmet@gmail.com', '555-111-2222'),
('Merve', 'Kaya', 'merve@gmail.com', '555-333-4444'),
('Can', 'Demir', 'can@gmail.com', '555-555-6666');

-- Ürünler ekleyelim
INSERT INTO Products (ProductName, Price, Stock)
VALUES 
('Laptop', 15000, 10),
('Telefon', 12000, 20),
('Kulaklık', 500, 50);

-- Siparişler ekleyelim
INSERT INTO Orders (CustomerID, TotalAmount)
VALUES 
(1, 17000),
(2, 12000),
(3, 500);

-- Sipariş detayları ekleyelim
INSERT INTO OrderDetails (OrderID, ProductID, Quantity, Price)
VALUES 
(1, 1, 1, 15000),
(1, 3, 2, 1000),
(2, 2, 1, 12000),
(3, 3, 1, 500);

--INNER JOIN ile Müşteri Siparişlerini Getirme
SELECT c.FirstName, C.LastName,o.OrderID, o.OrderDate,o.TotalAmount
FROM  Customers c
INNER JOIN Orders o ON c.customerID =o.CustomerID;


-- GROUP BY ve HAVING ile Toplam Harcama Yapan Müşterileri Getirme

SELECT c.FirstName, c.LastName, SUM(o.TotalAmount) AS TotalSpent
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.FirstName, c.LastName
HAVING SUM(o.TotalAmount) > 10000;

--RANK Fonksiyonu ile En Çok Harcayan İlk 3 Müşteri

SELECT c.FirstName, c.LastName, SUM(o.TotalAmount) AS TotalSpent,
       RANK() OVER (ORDER BY SUM(o.TotalAmount) DESC) AS RankOrder
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.FirstName, c.LastName;


--PIVOT ile Siparişleri Ürün Bazlı Gruplama

SELECT * 
FROM (
    SELECT p.ProductName, o.TotalAmount 
    FROM OrderDetails od
    JOIN Orders o ON od.OrderID = o.OrderID
    JOIN Products p ON od.ProductID = p.ProductID
) AS SourceTable
PIVOT (
    SUM(TotalAmount) FOR ProductName IN ([Laptop], [Telefon], [Kulaklık])
) AS PivotTable;


--Belirli bir müşterinin siparişlerini getiren bir Stored Procedure

CREATE PROCEDURE GetCustomerOrders
    @CustomerID INT
AS
BEGIN
    SELECT o.OrderID, o.OrderDate, o.TotalAmount
    FROM Orders o
    WHERE o.CustomerID = @CustomerID;
END;

EXEC GetCustomerOrders @CustomerID = 1;

---Sipariş ekleme işlemi yapan bir Stored Procedure 

CREATE PROCEDURE AddOrder
    @CustomerID INT,
    @TotalAmount DECIMAL(10,2)
AS
BEGIN
    INSERT INTO Orders (CustomerID, TotalAmount) 
    VALUES (@CustomerID, @TotalAmount);
END;

EXEC AddOrder @CustomerID = 3, @TotalAmount = 35000;

--Sipariş eklenince ürün stoklarını düşüren bir AFTER INSERT Trigger

CREATE TRIGGER ReduceStockOnOrder
ON OrderDetails
AFTER INSERT
AS
BEGIN
    UPDATE p
    SET p.Stock = p.Stock - i.Quantity
    FROM Products p
    INNER JOIN inserted i ON p.ProductID = i.ProductID;
END;


INSERT INTO OrderDetails (OrderID, ProductID, Quantity, Price)
VALUES (1, 1, 2, 15000);


---AFTER DELETE Trigger (Sipariş iptal edilirse stoğu geri ekleyelim)


CREATE TRIGGER RestoreStockOnOrderCancel
ON OrderDetails
AFTER DELETE
AS
BEGIN
    UPDATE p
    SET p.Stock = p.Stock + d.Quantity
    FROM Products p
    INNER JOIN deleted d ON p.ProductID = d.ProductID;
END;

DELETE FROM OrderDetails WHERE OrderDetailID = 1;

-- Email üzerinden müşteri aramak için index oluşturalım.

CREATE INDEX idx_Customers_Email
ON Customers (Email);
-- Bu index sayesinde şu sorgu çok daha hızlı çalışır:

SELECT * FROM Customers WHERE Email = 'ahmet@gmail.com';


-- Bileşik (Composite) Index: Eğer Ad + Soyad ile arama yapacaksak:

CREATE INDEX idx_Customers_Name
ON Customers (FirstName, LastName);


/*Stored Procedure ile tekrarlayan işlemleri kolaylaştırdık.

Trigger ile stok güncelleme gibi işlemleri otomatikleştirdik.

Index kullanarak sorgu performansını artırdık.*/



--Her müşterinin toplam sipariş tutarını hesaplayalım.

SELECT CustomerID, SUM(TotalAmount) AS TotalSpent
FROM Orders
GROUP BY CustomerID;

-- Her müşterinin kaç sipariş verdiğini gösterir.

SELECT CustomerID, COUNT(OrderID) AS OrderCount
FROM Orders
GROUP BY CustomerID;


--HAVING, GROUP BY sonrası filtreleme yapmamızı sağlar (çünkü WHERE, gruplama SONRASI kullanılamaz).
--50000 TL’den fazla harcayan müşterileri bulalım.
SELECT CustomerID, SUM(TotalAmount) AS TotalSpent
FROM Orders
GROUP BY CustomerID
HAVING SUM(TotalAmount) > 50000;

--Müşterileri toplam harcamalarına göre en çoktan en aza sıralayalım.

SELECT CustomerID, SUM(TotalAmount) AS TotalSpent
FROM Orders
GROUP BY CustomerID
ORDER BY TotalSpent DESC;

--En az 2 sipariş vermiş müşterileri bul.

--Toplam harcaması 100.000 TL’den fazla olanları getir.

--Sonucu en çok harcayan müşteriden başlayarak sırala.

SELECT CustomerID, COUNT(OrderID) AS OrderCount, SUM(TotalAmount) AS TotalSpent
FROM Orders
GROUP BY CustomerID
HAVING COUNT(OrderID) >= 2 AND SUM(TotalAmount) > 100000
ORDER BY TotalSpent DESC;

/*✅ GROUP BY → Gruplama yapar.
✅ HAVING → Gruplardan belirli kriterlere uyanları alır.
✅ ORDER BY → Sonuçları sıralar.*/

------------------------------------------------------------------------------------------------------------------------
/*
Bir e-ticaret veritabanı düşünelim. Müşterilerin sipariş verdiği bir sistemde:
✅ En çok sipariş veren ilk 5 müşteriyi bulun.
✅ Toplam harcamaları 150.000 TL’den fazla olanları seçin.
✅ En çok harcama yapandan en az yapana doğru sıralayın.
✅ Siparişler eklenirken, stokları otomatik düşüren bir TRIGGER yazın.
✅ Sipariş ekleme işlemi için bir STORED PROCEDURE oluşturun.
✅ Sipariş sorgularını hızlandırmak için bir INDEX ekleyin.

*/


--En çok sipariş veren ilk 5 müşteriyi bulun.
--✅ Toplam harcamaları 150.000 TL’den fazla olanları seçin.
--✅ En çok harcama yapandan en az yapana doğru sıralayın.

SELECT TOP 5 c.CustomerID, c.FirstName, COUNT(o.OrderID) AS TotalOrders, SUM(o.TotalAmount) AS TotalSpent
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.FirstName
HAVING SUM(o.TotalAmount) > 150000
ORDER BY TotalSpent DESC;
/*GROUP BY → Müşterileri gruplayıp sipariş sayılarını hesaplıyor.

HAVING → Sadece 150.000 TL’den fazla harcayanları seçiyor.

ORDER BY → En çok harcayan ilk 5 kişiyi en başa alıyor.

TOP 5 → Sadece ilk 5 kişiyi gösteriyor.*/



--✅ Siparişler eklenirken, stokları otomatik düşüren bir TRIGGER yazın.

CREATE TRIGGER ReduceStockOnOrderInsert
ON OrderDetails
AFTER INSERT
AS
BEGIN
    UPDATE p
    SET p.Stock = p.Stock - i.Quantity
    FROM Products p
    INNER JOIN inserted i ON p.ProductID = i.ProductID;
END;


INSERT INTO OrderDetails (OrderID, ProductID, Quantity, Price)
VALUES (1, 3, 5, 20000);




--✅ Sipariş ekleme işlemi için bir STORED PROCEDURE oluşturun.



CREATE PROCEDURE AddOrderWithDetails
    @CustomerID INT,
    @ProductID INT,
    @Quantity INT,
    @Price DECIMAL(10,2)
AS
BEGIN
    DECLARE @OrderID INT;
    
    -- Yeni Siparişi Ekleyelim
    INSERT INTO Orders (CustomerID, TotalAmount)
    VALUES (@CustomerID, @Quantity * @Price);
    
    -- Son Eklenen Siparişin ID’sini Alalım
    SET @OrderID = SCOPE_IDENTITY();
    
    -- Sipariş Detaylarını Ekleyelim
    INSERT INTO OrderDetails (OrderID, ProductID, Quantity, Price)
    VALUES (@OrderID, @ProductID, @Quantity, @Price);
END;


EXEC AddOrderWithDetails @CustomerID = 1, @ProductID = 2, @Quantity = 3, @Price = 30000;



--✅ Sipariş sorgularını hızlandırmak için bir INDEX ekleyin.

CREATE INDEX idx_Orders_CustomerID
ON Orders (CustomerID);

SELECT * FROM Orders WHERE CustomerID = 1;

/*Şimdi Stored Procedure, Trigger, Index ve Zor SQL Sorgularını tek bir senaryoda kullanalım.

📌 Senaryo:
1️⃣ Yeni bir sipariş ekleyelim. (Stored Procedure)
2️⃣ Sipariş eklenince stoklar düşsün. (Trigger)
3️⃣ En çok sipariş veren ilk 5 müşteriyi çekelim. (GROUP BY, HAVING, ORDER BY)
4️⃣ Sipariş sorgularını hızlandırmak için INDEX ekleyelim.*/

EXEC AddOrderWithDetails @CustomerID = 1, @ProductID = 2, @Quantity = 3, @Price = 30000;

SELECT TOP 5 c.CustomerID, c.Name, COUNT(o.OrderID) AS TotalOrders, SUM(o.TotalAmount) AS TotalSpent
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.Name
HAVING SUM(o.TotalAmount) > 150000
ORDER BY TotalSpent DESC;

CREATE INDEX idx_Orders_CustomerID
ON Orders (CustomerID);














