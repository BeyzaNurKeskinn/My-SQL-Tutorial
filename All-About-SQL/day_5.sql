--DECLARE @ProductID INT
--SET @ProductID = 5
--PRINT @ProductID

DECLARE @ProductID INT = 6
--PRINT @ProductID

IF @ProductID=5 BEGIN
	PRINT @ProductID
END ELSE BEGIN
	PRINT 'Beş Değil'
END


------------------------------------------


DECLARE @ProductID INT
DECLARE @ProductName VARCHAR(500)
DECLARE @CategoryID INT

SELECT @ProductID=ProductID, @ProductName=ProductName,@CategoryID=CategoryID  FROM Products WHERE ProductID=36

PRINT @ProductID
PRINT @ProductName
PRINT @CategoryID
 --SELECT * FROM Products



----------------------------------------------------------


 DECLARE @ProductID INT
DECLARE @ProductName VARCHAR(500)
DECLARE @CategoryID INT

DECLARE cursor1 CURSOR FOR SELECT ProductID,ProductName,CategoryID FROM Products
OPEN cursor1

FETCH cursor1 INTO @ProductID,@ProductName,@CategoryID

IF @@FETCH_STATUS=0 BEGIN
	PRINT @ProductID
	PRINT @ProductName
	PRINT @CategoryID
END

CLOSE cursor1
DEALLOCATE cursor1

 --SELECT * FROM Products


-----------------------------------------------------------------------


DECLARE @ProductID INT
DECLARE @ProductName VARCHAR(500)
DECLARE @CategoryID INT

DECLARE @tablo1 TABLE
(
	ProductID INT,
	ProductName VARCHAR(500),
	CategoryID INT,
	Quantity INT
)
DECLARE @Quantity INT

DECLARE cursor1 CURSOR FOR SELECT ProductID,ProductName,CategoryID FROM Products
OPEN cursor1

FETCH cursor1 INTO @ProductID,@ProductName,@CategoryID

WHILE @@FETCH_STATUS=0 BEGIN
	--PRINT @ProductID
	--PRINT @ProductName
	--PRINT @CategoryID
	--PRINT '***********'
	SELECT @Quantity = COUNT(*) FROM Products WHERE CategoryID=@CategoryID
	INSERT INTO @tablo1 (ProductID, ProductName, CategoryID, Quantity) VALUES (@ProductID, @ProductName, @CategoryID, @Quantity)
	FETCH cursor1 INTO @ProductID,@ProductName,@CategoryID
END

--SELECT COUNT(*) FROM Products WHERE CategoryID=8

CLOSE cursor1
DEALLOCATE cursor1

 SELECT * FROM @tablo1


--vs çalışma notları

 var p1 = {
    "adi": "ferhat",
    "soyadi": "kaygusuz",
    "maas" : 1000,
    "telefonlar": [
        "05321111111",
        "05322222222"
    ],
    "adresler" : [
        {
            "satir1" : "Necip Fazıl Mah",
            "satir2" : "yeşilhisar sokak",
            "postakodu" : "34000",
            "ilce": "Umraniye",
            "il" : "İstanbul"
        }
    ]
}

var p2 = {
    "adi": "sdfsdf",
    "soyadi": "kaygusuz",
    "maas" : 1000
}


console.log(p1.adi);
console.log(p12.adi);

console.log(p1.telefonlar[0]);
console.log(p1.telefonlar[1]);

console.log(p1.adresler[0].satir1)


--------------------------------------------------






--{
--"adi": "Adi1",
--"soyadi": "Soyad1",
--"maas" : 1000
--}

SELECT 
*,
JSON_VALUE(FormData,'$.adi') AS Adı,
JSON_VALUE(FormData,'$.soyadi') AS Soyadı,
JSON_VALUE(FormData,'$.maas') AS Maaş

FROM Ogrenciler



-------------------------------------------------------


--{
--"adi": "Adi1",
--"soyadi": "Soyad1",
--"maas" : 1000
--}

SELECT 
*,
JSON_VALUE(FormData,'$.adi') AS Adı,
JSON_VALUE(FormData,'$.soyadi') AS Soyadı,
JSON_VALUE(FormData,'$.maas') AS Maaş

FROM Ogrenciler
WHERE JSON_VALUE(FormData,'$.adi') ='Adi1'


-------------------------------


--{
--"adi": "Adi1",
--"soyadi": "Soyad1",
--"maas" : 1000
--}

SELECT 
*,
JSON_VALUE(FormData,'$.adi') AS Adı,
JSON_VALUE(FormData,'$.soyadi') AS Soyadı,
JSON_VALUE(FormData,'$.maas') AS Maaş,
JSON_VALUE(FormData,'$.telefonlar[0]') AS Telefon1,
JSON_VALUE(FormData,'$.telefonlar[1]') AS Telefon2,
JSON_VALUE(FormData,'$.adresler[0].satir1') AS Adres1Satir1,
JSON_VALUE(FormData,'$.adresler[0].satir2') AS Adres1Satir2,
JSON_VALUE(FormData,'$.adresler[0].postakodu') AS Adres1PostaKodu,
JSON_VALUE(FormData,'$.adresler[0].ilce') AS Adres1İlçe,
JSON_VALUE(FormData,'$.adresler[0].il') AS Adres1İl,
JSON_VALUE(FormData,'$.adresler[1].satir1') AS Adres2Satir1,
JSON_VALUE(FormData,'$.adresler[1].satir2') AS Adres2Satir2,
JSON_VALUE(FormData,'$.adresler[1].postakodu') AS Adres2PostaKodu,
JSON_VALUE(FormData,'$.adresler[1].ilce') AS Adres2İlçe,
JSON_VALUE(FormData,'$.adresler[1].il') AS Adres2İl
FROM Ogrenciler


-------------------------

--{
--"adi": "Adi1",
--"soyadi": "Soyad1",
--"maas" : 1000
--}

SELECT 
*,
JSON_VALUE(FormData,'$.adi') AS Adı,
JSON_VALUE(FormData,'$.soyadi') AS Soyadı,
JSON_VALUE(FormData,'$.maas') AS Maaş,
JSON_VALUE(FormData,'$.telefonlar[0]') AS Telefon1,
JSON_VALUE(FormData,'$.telefonlar[1]') AS Telefon2,
JSON_VALUE(FormData,'$.adresler[0].satir1') AS Adres1Satir1,
JSON_VALUE(FormData,'$.adresler[0].satir2') AS Adres1Satir2,
JSON_VALUE(FormData,'$.adresler[0].postakodu') AS Adres1PostaKodu,
JSON_VALUE(FormData,'$.adresler[0].ilce') AS Adres1İlçe,
JSON_VALUE(FormData,'$.adresler[0].il') AS Adres1İl,
JSON_VALUE(FormData,'$.adresler[1].satir1') AS Adres2Satir1,
JSON_VALUE(FormData,'$.adresler[1].satir2') AS Adres2Satir2,
JSON_VALUE(FormData,'$.adresler[1].postakodu') AS Adres2PostaKodu,
JSON_VALUE(FormData,'$.adresler[1].ilce') AS Adres2İlçe,
JSON_VALUE(FormData,'$.adresler[1].il') AS Adres2İl
FROM Ogrenciler


--{
--"adi": "adi2",
--"soyadi": "soyad2",
--"maas" : 1000, 
--	"telefonlar": [
--		"009053422134",
--		"009032853598",
--		"009011111111",
--		"009022222222"
--	]
--}

SELECT value AS telno FROM Ogrenciler
CROSS APPLY OPENJSON (FormData,'$.telefonlar')
WHERE OgrenciID=2

{
	"EmployeeData" : [
		{
			"firstname" : "Heater",
			"lastname" : "Banks"
		},
		{
			"firstname" : "Tina",
			"lastname" : "Young"
		}
	]
}

--BİRİNCİL ANAHTAR (PRIMARY KEY)
--▸ PRIMARY KEY kısıtlaması, bir tablodaki her kaydı benzersiz şekilde tanımlar.
--▸ Birincil anahtarlar BENZERSİZ değerler içermelidir ve NULL değerler içeremez.
--▸ Bir tabloda yalnızca BİR birincil anahtar bulunabilir; ve tabloda, bu birincil
--anahtar tek veya birden fazla sütundan (alandan) oluşabilir.