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
SELECT warehouseInfo FROM Products WHERE quantity BETWEEN 1 AND 3;--1İLE 3 ARASINDA
--
SELECT * FROM Users WHERE name LIKE 'm%';-- users tablosunun tüm sutunlarını seç getir ama bunlardan ismi m ile başlayanaı ara bul ve o satırı sadece getir.

