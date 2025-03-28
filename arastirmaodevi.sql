--Bir tabloya yeni sütun nasýl eklenir? Bir sütun nasýl deðiþtirilir?

ALTER TABLE kitaplar
ADD yayin_tarihi DATE;

ALTER TABLE kitaplar
ALTER COLUMN yayin_tarihi DATETIME;

--Bu komutlarýn kullanýmý nasýldýr? Araþtýrýnýz.Örnekle açýklayýnýz.

UPDATE kitaplar
SET fiyat = 20.00
WHERE kitap_id = 1;

DELETE FROM kitaplar
WHERE kitap_id = 1;

--Ayný veride JOIN türlerine göre farklýlýklarý araþtýrýnýz ve  örnekle açýklayýnýz

--Her iki tabloda da eþleþen kayýtlarý getirir.
SELECT *
FROM kitaplar
INNER JOIN yazarlar ON kitaplar.yazar_id = yazarlar.yazar_id;

--Sol tablodaki tüm kayýtlarý ve sað tablodaki eþleþen kayýtlarý getirir.
SELECT *
FROM kitaplar
LEFT JOIN yazarlar ON kitaplar.yazar_id = yazarlar.yazar_id;

--Sað tablodaki tüm kayýtlarý ve sol tablodaki eþleþen kayýtlarý getirir.
SELECT *
FROM kitaplar
RIGHT JOIN yazarlar ON kitaplar.yazar_id = yazarlar.yazar_id;


--Her iki tablodaki tüm kayýtlarý getirir.
SELECT *
FROM kitaplar
FULL JOIN yazarlar ON kitaplar.yazar_id = yazarlar.yazar_id;

-- HAVING ve GROUP BY birlikte nasýl kullanýlýr?
--Verileri belirli bir sütuna göre gruplar.
SELECT yazar_id, COUNT(*)
FROM kitaplar
GROUP BY yazar_id;


--Gruplandýrýlmýþ veriler üzerinde koþul uygulamak için kullanýlýr.
SELECT yazar_id, COUNT(*)
FROM kitaplar
GROUP BY yazar_id
HAVING COUNT(*) > 5;

--TOP, OFFSET-FETCH kullanarak sýralý veri çekme (ilk 5 kitap gibi)

SELECT TOP 5 * 
FROM kitaplar
ORDER BY fiyat DESC;

SELECT * 
FROM kitaplar
ORDER BY fiyat
OFFSET 0 ROWS FETCH NEXT 5 ROWS ONLY;

--SUBQUERY örnekleri – alt sorgu kullanarak kitap veya kullanýcý bilgisi getirme
SELECT * 
FROM kitaplar
WHERE yazar_id IN (SELECT yazar_id FROM yazarlar WHERE ad = 'Ahmet');

--AND / OR mantýksal operatörleri ne iþe yarar? Koþullu sorgularda nasýl kullanýlýr?

--Her iki koþulun da doðru olduðu durumlarý getirir.
SELECT * 
FROM kitaplar
WHERE fiyat < 20 AND yayin_yili > 2020;

--Koþullardan en az birinin doðru olduðu durumlarý getirir.
SELECT * 
FROM kitaplar
WHERE fiyat < 20 OR yayin_yili > 2020;

-- BETWEEN ile aralýk filtrelemesi nasýl yapýlýr? Örnek: 2020 ile 2023 arasý kitaplar
SELECT * 
FROM kitaplar
WHERE yayin_yili BETWEEN 2020 AND 2023;

--IN ifadesiyle çoklu deðer karþýlaþtýrmasý nasýl yapýlýr? Örnek: Belirli kategorilerdeki kitaplar
SELECT * 
FROM kitaplar
WHERE kategori_id IN (1, 2, 3);

--LIKE operatörü nedir? '%' ve '_' karakterleriyle nasýl kullanýlýr? Örneklerle açýklayýnýz.
-- 'A' ile baþlayan kitaplar
SELECT * FROM kitaplar WHERE ad LIKE 'A%';

-- 'a' harfi olan kitaplar
SELECT * FROM kitaplar WHERE ad LIKE '%a%';

-- 'A' ile biten kitaplar
SELECT * FROM kitaplar WHERE ad LIKE '%A';

-- Ýki karakter uzunluðunda 'a' harfi olan kitaplar
SELECT * FROM kitaplar WHERE ad LIKE '__a%';


