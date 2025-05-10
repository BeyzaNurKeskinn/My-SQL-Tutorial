SELECT sqltext.TEXT,
 ses.login_name,
               req.session_id,
               req.blocking_session_id,
               req.status,
               req.command,
               req.wait_type,
               req.wait_time,
               req.wait_resource,
               req.cpu_time,
               req.total_elapsed_time,
               con.client_net_address,
               ses.login_name,
               ses.host_name,
               DB_Name(req.database_id)
FROM sys.dm_exec_requests req
CROSS APPLY sys.dm_exec_sql_text(sql_handle) AS sqltext LEFT JOIN sys.dm_exec_sessions ses ON ses.session_id = req.session_id LEFT JOIN sys.dm_exec_connections con ON con.session_id = ses.session_id 
order by req.session_id,req.status, req.total_elapsed_time



--------------

INSERT INTO Puanlar (OgrenciID, Puan) VALUES (1,200)
DECLARE @PuanID INT
--SELECT @PuanID = @@IDENTITY
SET @PuanID = @@IDENTITY
PRINT @PuanID

---------------


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


 -----------------------


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

console.log(p1.adresler[0].satir1);



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
JSON_VALUE(FormData,'$.maas') AS Maaş

FROM Ogrenciler


--------------------------


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