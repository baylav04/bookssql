--Bir tabloya yeni s�tun nas�l eklenir? Bir s�tun nas�l de�i�tirilir?

ALTER TABLE kitaplar
ADD yayin_tarihi DATE;

ALTER TABLE kitaplar
ALTER COLUMN yayin_tarihi DATETIME;

--Bu komutlar�n kullan�m� nas�ld�r? Ara�t�r�n�z.�rnekle a��klay�n�z.

UPDATE kitaplar
SET fiyat = 20.00
WHERE kitap_id = 1;

DELETE FROM kitaplar
WHERE kitap_id = 1;

--Ayn� veride JOIN t�rlerine g�re farkl�l�klar� ara�t�r�n�z ve  �rnekle a��klay�n�z

--Her iki tabloda da e�le�en kay�tlar� getirir.
SELECT *
FROM kitaplar
INNER JOIN yazarlar ON kitaplar.yazar_id = yazarlar.yazar_id;

--Sol tablodaki t�m kay�tlar� ve sa� tablodaki e�le�en kay�tlar� getirir.
SELECT *
FROM kitaplar
LEFT JOIN yazarlar ON kitaplar.yazar_id = yazarlar.yazar_id;

--Sa� tablodaki t�m kay�tlar� ve sol tablodaki e�le�en kay�tlar� getirir.
SELECT *
FROM kitaplar
RIGHT JOIN yazarlar ON kitaplar.yazar_id = yazarlar.yazar_id;


--Her iki tablodaki t�m kay�tlar� getirir.
SELECT *
FROM kitaplar
FULL JOIN yazarlar ON kitaplar.yazar_id = yazarlar.yazar_id;

-- HAVING ve GROUP BY birlikte nas�l kullan�l�r?
--Verileri belirli bir s�tuna g�re gruplar.
SELECT yazar_id, COUNT(*)
FROM kitaplar
GROUP BY yazar_id;


--Grupland�r�lm�� veriler �zerinde ko�ul uygulamak i�in kullan�l�r.
SELECT yazar_id, COUNT(*)
FROM kitaplar
GROUP BY yazar_id
HAVING COUNT(*) > 5;

--TOP, OFFSET-FETCH kullanarak s�ral� veri �ekme (ilk 5 kitap gibi)

SELECT TOP 5 * 
FROM kitaplar
ORDER BY fiyat DESC;

SELECT * 
FROM kitaplar
ORDER BY fiyat
OFFSET 0 ROWS FETCH NEXT 5 ROWS ONLY;

--SUBQUERY �rnekleri � alt sorgu kullanarak kitap veya kullan�c� bilgisi getirme
SELECT * 
FROM kitaplar
WHERE yazar_id IN (SELECT yazar_id FROM yazarlar WHERE ad = 'Ahmet');

--AND / OR mant�ksal operat�rleri ne i�e yarar? Ko�ullu sorgularda nas�l kullan�l�r?

--Her iki ko�ulun da do�ru oldu�u durumlar� getirir.
SELECT * 
FROM kitaplar
WHERE fiyat < 20 AND yayin_yili > 2020;

--Ko�ullardan en az birinin do�ru oldu�u durumlar� getirir.
SELECT * 
FROM kitaplar
WHERE fiyat < 20 OR yayin_yili > 2020;

-- BETWEEN ile aral�k filtrelemesi nas�l yap�l�r? �rnek: 2020 ile 2023 aras� kitaplar
SELECT * 
FROM kitaplar
WHERE yayin_yili BETWEEN 2020 AND 2023;

--IN ifadesiyle �oklu de�er kar��la�t�rmas� nas�l yap�l�r? �rnek: Belirli kategorilerdeki kitaplar
SELECT * 
FROM kitaplar
WHERE kategori_id IN (1, 2, 3);

--LIKE operat�r� nedir? '%' ve '_' karakterleriyle nas�l kullan�l�r? �rneklerle a��klay�n�z.
-- 'A' ile ba�layan kitaplar
SELECT * FROM kitaplar WHERE ad LIKE 'A%';

-- 'a' harfi olan kitaplar
SELECT * FROM kitaplar WHERE ad LIKE '%a%';

-- 'A' ile biten kitaplar
SELECT * FROM kitaplar WHERE ad LIKE '%A';

-- �ki karakter uzunlu�unda 'a' harfi olan kitaplar
SELECT * FROM kitaplar WHERE ad LIKE '__a%';


