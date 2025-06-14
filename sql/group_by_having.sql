SELECT customer_id 
FROM subscription 
GROUP BY customer_id 
HAVING COUNT(customer_id) > 1;

SELECT COUNT(*) FROM subscription WHERE customer_id IS NULL;

SELECT table_name 
FROM information_schema.tables 
WHERE table_schema = 'public';

SELECT 
	customer_id,
    product_id,
    subscription_date
FROM Subscription 
WHERE customer_id IN 
	(SELECT 
    	customer_id 
     FROM Subscription 
     GROUP BY customer_id 
     HAVING COUNT(customer_id) > 1
  	) 
ORDER BY customer_id ASC;

SELECT 
	customer_id,
    product_id,
    subscription_date
FROM subscription  -- ganti sesuai nama tabelmu
WHERE customer_id IN 
	(SELECT 
    	customer_id 
     FROM subscription 
     GROUP BY customer_id 
     HAVING COUNT(customer_id) > 1
  	) 
ORDER BY customer_id ASC;

SELECT b.name,
       b.address,
       b.phone, 
       a.product_id, 
       a.subscription_date 
FROM subscription a 
JOIN customer b 
ON a.customer_id = b.id
WHERE b.id IN 
(
	SELECT 
    	customer_id 
        FROM subscription 
        GROUP BY customer_id 
        HAVING COUNT(customer_id) > 1
) 
ORDER BY b.id ASC;

CREATE TABLE sales (
    customer_id INT,
    product_id VARCHAR(10),
    quantity INT,
    price INT
);

INSERT INTO sales (customer_id, product_id, quantity, price) VALUES
(1, 'A', 2, 100),
(2, 'B', 1, 200),
(1, 'B', 3, 200),
(3, 'A', 4, 100);

SELECT customer_id, SUM(quantity) AS total_quantity
FROM sales
GROUP BY customer_id;

select product_id, 
MAX(total_price) as total
from invoice 
group by product_id;

SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'invoice';

SELECT * 
FROM information_schema.columns 
WHERE table_name = 'invoice';

select product_id, 
MAX(total_price) as total
from invoice 
group by product_id
having MAX(total_price) > 1000000;

SELECT product_id, MAX(total_price) AS total 
FROM invoice 
GROUP BY product_id;

SELECT product_id, MAX(total_price) AS total 
FROM invoice 
GROUP BY product_id 
HAVING MAX(total_price) > 1000000;

SELECT product_id, MAX(pinalty) AS total 
FROM invoice 
GROUP BY product_id 
HAVING MAX(pinalty) > 30000;

SELECT product_id,
       MIN(total_price) AS total
FROM invoice
GROUP BY product_id;

SELECT product_id, MIN(total_price) AS total 
FROM invoice 
GROUP BY product_id 
HAVING MIN(total_price) < 500000;

SELECT product_id, MIN(total_price) AS total 
FROM invoice 
GROUP BY product_id 
HAVING MIN(pinalty) < 50000;

SELECT product_id, MIN(total_price) AS total 
FROM invoice 
GROUP BY product_id 
HAVING MIN(total_price) < 100000;

SELECT customer_id, MIN(total_price) AS total 
FROM invoice 
GROUP BY customer_id 
HAVING MIN(total_price) < 50000;

SELECT product_id, 
	MIN(pinalty) AS min_pinalty
	MAX(total_price) as max_total
FROM invoice 
GROUP BY product_id 
HAVING MIN(pinalty) < 40000 and 
MAX(total_price) > 500000;

--1. Jika 2 kondisi pada kolom yang sama → langsung pakai AND
SELECT product_id, MAX(total_price) AS max_price
FROM invoice
GROUP BY product_id
HAVING MAX(total_price) > 50000 AND MAX(total_price) < 1000000;
--Kamu cukup pakai AND karena kedua kondisi memakai fungsi pada kolom yang sama (total_price)

--2. Jika 2 kondisi dari kolom yang berbeda 
--→ tampilkan kedua kolom agregat di SELECT, lalu filter di HAVING
SELECT product_id, 
       MAX(total_price) AS max_price,
       MIN(pinalty) AS min_pinalty
FROM invoice
GROUP BY product_id
HAVING MAX(total_price) > 50000 AND MIN(pinalty) < 700000;
--Karena kamu memfilter total_price dan pinalty, maka tampilkan keduanya di SELECT
-- lalu gunakan HAVING untuk masing-masing agregat.

--TIPS PENTING
--Selalu tampilkan kolom yang kamu filter di bagian SELECT
--Gunakan GROUP BY terhadap kolom non-agregat seperti product_id
--Alias (AS max_price) tidak bisa digunakan di HAVING
--jadi tetap gunakan fungsi aslinya seperti MAX(...)

--KESIMPULAN :
--2 kondisi di kolom yang sama :
--HAVING MAX(kolom) > x AND MAX(kolom) < y

--2 kondisi di kolom berbeda
--SELECT kolom1, MAX(kolom2), MIN(kolom3), lalu HAVING MAX(...) AND MIN(...)

select product_id,
AVG(total_price) as total
from invoice
group by product_id;

SELECT product_id, AVG(total_price) AS avg_price
FROM invoice
GROUP BY product_id
HAVING AVG(total_price) > 400000;

SELECT product_id, 
       AVG(total_price) AS avg_price,
       AVG(pinalty) AS avg_pinalty
FROM invoice
GROUP BY product_id
HAVING AVG(total_price) > 50000 AND AVG(pinalty) < 20000;

SELECT product_id,
AVG(total_price) AS total
FROM invoice
GROUP BY product_id;

SELECT product_id, AVG(total_price) AS total
FROM invoice
GROUP BY product_id
HAVING AVG(total_price) > 100000;

SELECT product_id, 
       AVG(pinalty) AS total
FROM invoice
GROUP BY product_id
HAVING AVG(pinalty) > 30000;

SELECT product_id,
	AVG(pinalty) as AVG_pinalty,
	COUNT(customer_id) as total
FROM invoice
GROUP BY product_id
HAVING COUNT(customer_id) > 20;
