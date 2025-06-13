create database milzon_belajar_sql;	

\c milzon_belajar_sql

--check struktur kolom
SELECT column_name
FROM information_schema.columns
WHERE table_name = 'students';

DROP TABLE IF EXISTS students;

CREATE TABLE students (
  StudentID SERIAL PRIMARY KEY,
  FirstName VARCHAR(50),
  LastName VARCHAR(50),
  Email VARCHAR(100),
  Semester1 DECIMAL(5,2),
  Semester2 DECIMAL(5,2),
  MarkGrowth DECIMAL(5,2)
);

INSERT INTO students (FirstName, LastName, Email, Semester1, Semester2, MarkGrowth)
VALUES
('Jose', 'Mohit', 'Jose_Mohit@gmail.com', 64.55, 72.60, -8.05),
('Lala', 'Karlina', 'lala.karlina@yahoo.com', 72.85, 65.35, 7.50),
('Sultan', 'Hadi', 'Sultan_Hadi@gmail.com', 45.32, 50.25, -4.93),
('Jaya', 'Usman', 'jaya.usman@yahoo.com', 86.73, 77.40, 9.33),
('Anjali', 'Wijaya', 'anjali.wijaya@yahoo.com', 92.25, 90.75, 1.50);


SELECT StudentID, FirstName, Lastname, Semester1, Semester2, ABS(MarkGrowth) as MarkGrowth
FROM students;

SELECT 
STudentID, 
FirstName,
LastName,
CEILING(Semester1) as Semester1,
CEILING(Semester2) as Semester2,
MarkGrowth
FROM Students;

SELECT 
STudentID, 
FirstName,
LastName,
FLOOR(Semester1) as Semester1,
FLOOR(Semester2) as Semester2,
MarkGrowth
FROM Students;

SELECT 
STudentID, 
FirstName,
LastName,
ROUND(Semester1,1) as Semester1,
ROUND(Semester2,0) as Semester2,
MarkGrowth
FROM Students;

SELECT 
StudentID, 
FirstName,
LastName,
SQRT(Semester1) as Semester1,
Semester2,
MarkGrowth
FROM Students;

SELECT
  StudentID,
  FirstName,
  LastName,
  MOD(Semester1, 2) AS Semester1,
  Semester2,
  EXP(MarkGrowth)
FROM students;

select 
  StudentID,
concat(FirstName, LastName) as Name, Semester1, Semester2,Markgrowth
from Students;

--select StudentID, Substring_index(Email,'@', 1) as Name
--from students;
--SQL Error [42883]: ERROR: function substring_index(character varying, unknown, integer) does not exist
--Hint: No function matches the given name and argument types. You might need to add explicit type casts.
--Position: 19
--PostgreSQL tidak punya fungsi SUBSTRING_INDEX(), sehingga error


SELECT
  StudentID,
  SPLIT_PART(Email, '@', 1) AS Name
FROM students;

select StudentID, substr(FirstName, 2, 3) as Initial
from students;

select StudentID, FIrstName, Length(FirstName) as Total_char
from Students;

select StudentID, Email, REPLACE(Email,'yahoo', 'gmail') as New_Email
from Students;

select 
	StudentID,
	FirstName,
	UPPER(FirstName) as FirstName_upper,
	LOWER(LastName) as LastName_lower
from students;

select 
	StudentID,
	UPPER(FirstName) as FirstName,
	LOWER(LastName) as LastName
from students;

select SUM(Semester1) as Total_1, SUM(Semester2) as Total_2
from students;


select count(FirstName) as Total_Student
from students;

select avg(Semester1) as AVG_1, avg(Semester2) as AVG_2
from Students;

select
	MIN(semester1) as Min1, Min(Semester2) as Min2,
	Max(Semester1) as Max1, Max(Semester2) as Max2
from students;

--berurut sesuai permintaan  

SELECT
	MIN(semester1) as Min1, MAX(Semester1) as Max1,
	MIN(Semester2) as Min2, MAX(Semester2) as Max2
FROM students;

CREATE TABLE province (
  province_id SERIAL PRIMARY KEY,
  province VARCHAR(30) UNIQUE,
  total_order INTEGER,
  total_price NUMERIC
);

INSERT INTO province 
(province, total_order, total_price)
VALUES
('Aceh', 16, 575100000),
('Bali', 454, 12555567000),
('Bangka Belitung', 8, 378494000),
('Banten', 596, 14925141000),
('DKI Jakarta', 8332, 183872878000),
('Jambi', 55, 3030991000),
('Jawa Barat', 2831, 62982148000),
('Jawa Tengah', 1475, 40508136000),
('Jawa Timur', 1406, 28809529000),
('Kalimantan Barat', 18, 423139000),
('Kalimantan Selatan', 26, 1195590000),
('Kalimantan Tengah', 275, 13057098000),
('Lampung', 37, 1226267000),
('NTB', 5, 146872000),
('Riau', 91, 2138244000),
('Sulawesi Selatan', 384, 12822560000),
('Sulawesi Tengah', 53, 2326860000),
('Sulawesi Utara', 41, 1278392000),
('Sumatra Barat', 92, 1852032000),
('Sumatra Selatan', 121, 5224917000),
('Sumatra Utara', 145, 3710699000),
('unknown', 57, 8256525000),
('Yogyakarta', 1318, 27181441000);

CREATE TABLE province (
  province_id SERIAL PRIMARY KEY,
  province VARCHAR(30) UNIQUE,
  total_order INTEGER,
  total_price NUMERIC
);

create table ms_item_warna (
  nama_barangID SERIAL primary key,
  nama_barang varchar(30) unique,
  warna varchar(50)
);

INSERT INTO ms_item_warna (nama_barang, warna) VALUES
  ('apel',        'merah'),
  ('bayam',       'hijau'),
  ('daun bawang', 'hijau'),
  ('duku',        'kuning pekat'),
  ('durian',      'kuning'),
  ('gandum',      'coklat'),
  ('jambu air',   'merah'),
  ('jeruk',       'oranye');

CREATE TABLE IF NOT EXISTS ms_item_kategori (
    nama_item VARCHAR(100) NOT NULL,
    kategori  VARCHAR(50)  NOT NULL,
    PRIMARY KEY (nama_item)
);

INSERT INTO ms_item_kategori (nama_item, kategori) VALUES
  ('bayam',      'sayuran'),
  ('belimbing',  'buah'),
  ('duku',       'buah'),
  ('durian',     'buah'),
  ('gandum',     'buah'),
  ('jamur',      'sayuran'),
  ('jambu air',  'buah'),
  ('jeruk',      'buah');

SELECT table_name
  FROM information_schema.tables
 WHERE table_name ILIKE '%item_kategori%';

SELECT * FROM ms_item_kategori, ms_item_warna
WHERE nama_barang = nama_item;

SELECT * FROM ms_item_warna, ms_item_kategori
WHERE nama_barang = nama_item;

SELECT ms_item_kategori.*, ms_item_warna.*
FROM ms_item_warna, ms_item_kategori
WHERE nama_barang = nama_item;

select * from ms_item_kategori, ms_item_warna;

select * from ms_item_warna 
inner join ms_item_kategori
on ms_item_warna.nama_barang = ms_item_kategori.nama_item;

CREATE TABLE tr_penjualan (
    kode_transaksi VARCHAR(20),
    kode_pelanggan VARCHAR(20),
    no_urut INTEGER,
    kode_produk VARCHAR(20),
    nama_produk VARCHAR(100),
    qty INTEGER,
    harga INTEGER
);
INSERT INTO tr_penjualan (kode_transaksi, kode_pelanggan, no_urut, kode_produk, nama_produk, qty, harga) VALUES
('tr-001', 'dqlabcust07', 1, 'prod-01', 'Kotak Pensil DQLab', 5, 62500),
('tr-001', 'dqlabcust07', 2, 'prod-03', 'Flash disk DQLab 32 GB', 1, 100000),
('tr-001', 'dqlabcust07', 3, 'prod-09', 'Buku Planner Agenda DQLab', 3, 92000),
('tr-001', 'dqlabcust07', 4, 'prod-04', 'Flashdisk DQLab 32 GB', 3, 40000),
('tr-002', 'dqlabcust01', 1, 'prod-03', 'Gift Voucher DQLab 100rb', 2, 100000),
('tr-002', 'dqlabcust01', 2, 'prod-10', 'Sticky Notes DQLab 500 sheets', 4, 55000),
('tr-002', 'dqlabcust01', 3, 'prod-07', 'Tas Travel Organizer DQLab', 1, 48000),
('tr-003', 'dqlabcust03', 1, 'prod-02', 'Flashdisk DQLab 64 GB', 2, 55000),
('tr-004', 'dqlabcust03', 1, 'prod-10', 'Sticky Notes DQLab 500 sheets', 5, 55000),
('tr-004', 'dqlabcust03', 2, 'prod-04', 'Flashdisk DQLab 32 GB', 4, 40000),
('tr-005', 'dqlabcust05', 1, 'prod-09', 'Buku Planner Agenda DQLab', 3, 92000),
('tr-005', 'dqlabcust05', 2, 'prod-01', 'Kotak Pensil DQLab', 1, 62500),
('tr-005', 'dqlabcust05', 3, 'prod-04', 'Flashdisk DQLab 32 GB', 2, 40000),
('tr-006', 'dqlabcust02', 1, 'prod-05', 'Gift Voucher DQLab 250rb', 4, 250000),
('tr-006', 'dqlabcust02', 2, 'prod-08', 'Gantungan Kunci DQLab', 2, 15800);

create table ms_produk(
	no_urut INTEGER,
	kode_produk varchar(20) primary key,
	nama_produk varchar(100),
	harga integer
);

INSERT INTO ms_produk (no_urut, kode_produk, nama_produk, harga) VALUES
(1, 'prod-01', 'Kotak Pensil DQLab', 62500),
(2, 'prod-02', 'Flashdisk DQLab 64 GB', 55000),
(3, 'prod-03', 'Gift Voucher DQLab 100rb', 100000),
(4, 'prod-04', 'Flashdisk DQLab 32 GB', 40000),
(5, 'prod-05', 'Gift Voucher DQLab 250rb', 250000),
(6, 'prod-06', 'Pulpen Multifunction + Laser DQLab', 92500),
(7, 'prod-07', 'Tas Travel Organizer DQLab', 48000),
(8, 'prod-08', 'Gantungan Kunci DQLab', 15800),
(9, 'prod-09', 'Buku Planner Agenda DQLab', 92000),
(10, 'prod-10', 'Sticky Notes DQLab 500 sheets', 55000);

SELECT * FROM tr_penjualan;
SELECT * FROM ms_produk;

select * from ms_produk
inner join tr_penjualan
on ms_produk.kode_produk = tr_penjualan.kode_produk;

SELECT 
	tr_penjualan.kode_transaksi,
	tr_penjualan.kode_pelanggan,
	tr_penjualan.kode_produk,
	ms_produk.nama_produk,
	ms_produk.harga,
	tr_penjualan.qty,
	(tr_penjualan.qty * ms_produk.harga) AS total
FROM tr_penjualan
INNER JOIN ms_produk
ON tr_penjualan.kode_produk = ms_produk.kode_produk;

CREATE TABLE tabel_A (
    kode_transaksi VARCHAR(20),
    kode_pelanggan VARCHAR(20),
    no_urut INTEGER,
    kode_produk VARCHAR(20),
    nama_produk VARCHAR(100),
    qty INTEGER,
    harga INTEGER,
    total INTEGER
);

INSERT INTO tabel_A 
(kode_transaksi, kode_pelanggan, no_urut, kode_produk, nama_produk, qty, harga, total)
VALUES
('tr-001', 'dqlabcust07', 1, 'prod-01', 'Kotak Pensil DQLab', 5, 62500, 312500),
('tr-001', 'dqlabcust07', 2, 'prod-03', 'Flash disk DQLab 32 GB', 1, 100000, 100000),
('tr-001', 'dqlabcust07', 3, 'prod-09', 'Buku Planner Agenda DQLab', 3, 92000, 276000),
('tr-001', 'dqlabcust07', 4, 'prod-04', 'Flashdisk DQLab 32 GB', 3, 40000, 120000),
('tr-002', 'dqlabcust01', 1, 'prod-03', 'Gift Voucher DQLab 100rb', 2, 100000, 200000),
('tr-002', 'dqlabcust01', 2, 'prod-10', 'Sticky Notes DQLab 500 sheets', 4, 55000, 220000),
('tr-002', 'dqlabcust01', 3, 'prod-07', 'Tas Travel Organizer DQLab', 1, 48000, 48000),
('tr-003', 'dqlabcust03', 1, 'prod-02', 'Flashdisk DQLab 64 GB', 2, 55000, 110000);

CREATE TABLE tabel_B (
    kode_transaksi VARCHAR(20),
    kode_pelanggan VARCHAR(20),
    no_urut INTEGER,
    kode_produk VARCHAR(20),
    nama_produk VARCHAR(100),
    qty INTEGER,
    harga INTEGER,
    total INTEGER
);

INSERT INTO tabel_B 
(kode_transaksi, kode_pelanggan, no_urut, kode_produk, nama_produk, qty, harga, total)
VALUES
('tr-004', 'dqlabcust03', 1, 'prod-10', 'Sticky Notes DQLab 500 sheets', 5, 55000, 275000),
('tr-004', 'dqlabcust03', 2, 'prod-04', 'Flashdisk DQLab 32 GB', 4, 40000, 160000),
('tr-005', 'dqlabcust05', 1, 'prod-09', 'Buku Planner Agenda DQLab', 3, 92000, 276000),
('tr-005', 'dqlabcust05', 2, 'prod-01', 'Kotak Pensil DQLab', 1, 62500, 62500),
('tr-005', 'dqlabcust05', 3, 'prod-04', 'Flashdisk DQLab 32 GB', 2, 40000, 80000),
('tr-006', 'dqlabcust02', 1, 'prod-05', 'Gift Voucher DQLab 250rb', 4, 250000, 1000000),
('tr-006', 'dqlabcust02', 2, 'prod-08', 'Gantungan Kunci DQLab', 2, 15800, 31600);

select * from tabel_A
union ALL
select * from tabel_B;

--Perbedaan antara kode yang kamu ketik dan kode jawaban terletak pada penggunaan operator UNION ALL dan UNION.
--Pada kode yang kamu ketik, kamu menggunakan operator UNION ALL yang akan menggabungkan semua baris dari tabel_A dan tabel_B, 
--termasuk baris yang duplikat. Sedangkan pada kode jawaban, digunakan operator UNION yang akan menggabungkan semua baris dari tabel_A dan tabel_B, tetapi akan menghapus baris yang duplikat.
--Jadi, kesalahan dari kode yang kamu ketik adalah penggunaan operator UNION ALL yang tidak menghapus baris duplikat. Seharusnya menggunakan operator UNION agar baris duplikat dapat dihapus.

SELECT * FROM tabel_A
UNION 
SELECT * FROM tabel_B;

select * from tabel_A
where kode_produk = 'prod-04'
union
select * from tabel_B
where kode_produk = 'prod-04';

select * from tabel_A
where kode_pelanggan = 'dqlabcust03'
union
select * from tabel_B
where kode_pelanggan = 'dqlabcust03';

CREATE TABLE customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    ContactName VARCHAR(100),
    Address VARCHAR(255),
    City VARCHAR(100),
    PostalCode VARCHAR(10),
    Country VARCHAR(100)
);

INSERT INTO customers (CustomerID, CustomerName, ContactName, Address, City, PostalCode, Country)
VALUES
(1, 'Fransiska Maria', 'Maria', 'Jl Sudirman', 'Jakarta', '14450', 'Indonesia'),
(2, 'Ana Helena', 'Ana Helena', 'Jl Madura', 'Surabaya', '5021', 'Indonesia'),
(3, 'Lily Subari', 'Lili', 'Jl Sumba', 'Makassar', '5023', 'Indonesia');

CREATE TABLE supplier (
    SupplierID INT PRIMARY KEY,
    ContactName VARCHAR(100),
    SupplierName VARCHAR(100),
    Address VARCHAR(255),
    City VARCHAR(100),
    PostalCode VARCHAR(10),
    Country VARCHAR(100)
);

INSERT INTO supplier (SupplierID, ContactName, SupplierName, Address, City, PostalCode, Country)
VALUES
(1, 'Yulius', 'Yulius Syrup', 'Jl Jayakarta', 'Jakarta', '14450', 'Indonesia'),
(2, 'Sherly Ani', 'Bandung Bakery', 'Jalan Asia Afrika', 'Bandung', '70117', 'Indonesia'),
(3, 'Regina Tara', 'Tara Pastry', 'Jalan Merpati', 'Semarang', '48104', 'Indonesia');

SELECT 
    CustomerID,
    CustomerName,
    ContactName,
    Address,
    City,
    PostalCode,
    Country
FROM customers
UNION
SELECT 
    SupplierID AS CustomerID,
    SupplierName AS CustomerName,
    ContactName,
    Address,
    City,
    PostalCode,
    Country
FROM suppliers;

SELECT CustomerName, ContactName, City, PostalCode 
FROM Customers 
UNION 
SELECT SupplierName, ContactName, City, PostalCode 
FROM Suppliers;

ALTER TABLE supplier RENAME TO suppliers;

DELETE FROM tr_penjualan;

INSERT INTO tr_penjualan 
(kode_transaksi, kode_pelanggan, no_urut, kode_produk, nama_produk, qty, harga)
VALUES
('tr-001', 'dqlabcust07', 1, 'prod-01', 'Kotak Pensil DQLab', 5, 62500),
('tr-001', 'dqlabcust07', 2, 'prod-03', 'Flash disk DQLab 32 GB', 1, 100000),
('tr-001', 'dqlabcust07', 3, 'prod-09', 'Buku Planner Agenda DQLab', 3, 92000),
('tr-001', 'dqlabcust07', 4, 'prod-04', 'Flashdisk DQLab 32 GB', 3, 40000),
('tr-002', 'dqlabcust01', 1, 'prod-03', 'Gift Voucher DQLab 100rb', 2, 100000),
('tr-002', 'dqlabcust01', 2, 'prod-10', 'Sticky Notes DQLab 500 sheets', 4, 55000),
('tr-002', 'dqlabcust01', 3, 'prod-07', 'Tas Travel Organizer DQLab', 1, 48000),
('tr-003', 'dqlabcust03', 1, 'prod-02', 'Flashdisk DQLab 64 GB', 2, 55000),
('tr-004', 'dqlabcust03', 1, 'prod-10', 'Sticky Notes DQLab 500 sheets', 5, 55000),
('tr-004', 'dqlabcust03', 2, 'prod-04', 'Flashdisk DQLab 32 GB', 4, 40000),
('tr-005', 'dqlabcust05', 1, 'prod-09', 'Buku Planner Agenda DQLab', 3, 92000),
('tr-005', 'dqlabcust05', 2, 'prod-01', 'Kotak Pensil DQLab', 1, 62500),
('tr-005', 'dqlabcust05', 3, 'prod-04', 'Flashdisk DQLab 32 GB', 2, 40000),
('tr-006', 'dqlabcust02', 1, 'prod-05', 'Gift Voucher DQLab 250rb', 4, 250000),
('tr-006', 'dqlabcust02', 2, 'prod-08', 'Gantungan Kunci DQLab', 2, 15800);

CREATE TABLE ms_pelanggan (
    no_urut INT PRIMARY KEY,
    kode_pelanggan VARCHAR(20),
    nama_customer VARCHAR(100),
    alamat VARCHAR(255)
);

INSERT INTO ms_pelanggan (no_urut, kode_pelanggan, nama_customer, alamat)
VALUES
(1, 'dqlabcust01', 'Eva Novianti, S.H.', 'Vila Sempilan, No. 67 - Kota B'),
(2, 'dqlabcust02', 'Heidi Goh', 'Vila Sempilan, No. 11 - Kota B'),
(3, 'dqlabcust03', 'Unang Handoko', 'Vila Sempilan, No. 1 - Kota B'),
(4, 'dqlabcust04', 'Jokolono Sukarman', 'Vila Permata Intan Berkilau, Blok C5-7'),
(5, 'dqlabcust05', 'Tommy Sinaga', 'Vila Permata Intan Berkilau, Blok A1/2'),
(6, 'dqlabcust06', 'Irwan Setianto', 'Vila Gunung Seribu, Blok O1 - No. 1'),
(7, 'dqlabcust07', 'Agus Cahyono', 'Vila Gunung Seribu, Blok F4 - No. 8'),
(8, 'dqlabcust08', 'Maria Sirait', 'Vila Bukit Sagitarius, Gang. Sawit No. 3'),
(9, 'dqlabcust09', 'Ir. Ita Nugraha', 'Vila Bukit Sagitarius, Gang Kelapa No. 6'),
(10, 'dqlabcust10', 'Djoko Wardoyo, Drs.', 'Vila Bukit Sagitarius, Blok A1 No. 1'),
(11, 'dqlabcust11', 'Unang Handoko', 'Vila Sempilan, No. 1 - Kota B'),
(12, 'dqlabcust12', 'Tommy Sinaga', 'Vila Permata Intan Berkilau, Blok A1/2');

SELECT DISTINCT 
    p.kode_pelanggan,
    p.nama_customer,
    p.alamat
FROM ms_pelanggan p
JOIN tr_penjualan t ON p.kode_pelanggan = t.kode_pelanggan
WHERE t.nama_produk IN (
    'Kotak Pensil DQLab',
    'Flashdisk DQLab 32 GB',
    'Sticky Notes DQLab 500 sheets'
);

SELECT DISTINCT 
    ms_pelanggan.kode_pelanggan,
    ms_pelanggan.nama_customer,
    ms_pelanggan.alamat
FROM ms_pelanggan
JOIN tr_penjualan ON ms_pelanggan.kode_pelanggan = tr_penjualan.kode_pelanggan
WHERE tr_penjualan.nama_produk IN (
    'Kotak Pensil DQLab',
    'Flashdisk DQLab 32 GB',
    'Sticky Notes DQLab 500 sheets'
);

CREATE TABLE ms_produk1 (
    no_urut INT PRIMARY KEY,
    kode_produk VARCHAR(20),
    nama_produk VARCHAR(100),
    harga INT
);

INSERT INTO ms_produk1 (no_urut, kode_produk, nama_produk, harga)
VALUES
(1, 'prod-01', 'Kotak Pensil DQLab', 62500),
(2, 'prod-02', 'Flashdisk DQLab 64 GB', 55000),
(3, 'prod-03', 'Gift Voucher DQLab 100rb', 100000),
(4, 'prod-04', 'Flashdisk DQLab 32 GB', 40000),
(5, 'prod-05', 'Gift Voucher DQLab 250rb', 250000);

CREATE TABLE ms_produk2 (
    no_urut INT PRIMARY KEY,
    kode_produk VARCHAR(20),
    nama_produk VARCHAR(100),
    harga INT
);

INSERT INTO ms_produk2 (no_urut, kode_produk, nama_produk, harga)
VALUES
(6, 'prod-06', 'Pulpen Multifunction + Laser DQLab', 92500),
(7, 'prod-07', 'Tas Travel Organizer DQLab', 48000),
(8, 'prod-08', 'Gantungan Kunci DQLab', 15800),
(9, 'prod-09', 'Buku Planner Agenda DQLab', 92000),
(10, 'prod-10', 'Sticky Notes DQLab 500 sheets', 55000);

SELECT kode_produk, nama_produk, harga
FROM ms_produk1
WHERE kode_produk IN ('prod-01', 'prod-02', 'prod-03', 'prod-04', 'prod-05')
  AND harga < 100000

UNION

SELECT kode_produk, nama_produk, harga
FROM ms_produk2
WHERE kode_produk IN ('prod-06', 'prod-07', 'prod-08', 'prod-09', 'prod-10')
  AND harga < 50000;

SELECT nama_produk, kode_produk, harga
FROM ms_produk1
WHERE harga < 100000

UNION

SELECT nama_produk, kode_produk, harga
FROM ms_produk2
WHERE harga < 50000;











