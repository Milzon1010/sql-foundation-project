-- public.customers definition

-- Drop table

-- DROP TABLE public.customers;

CREATE TABLE public.customers (
	customerid int4 NOT NULL,
	customername varchar(100) NULL,
	contactname varchar(100) NULL,
	address varchar(255) NULL,
	city varchar(100) NULL,
	postalcode varchar(10) NULL,
	country varchar(100) NULL,
	CONSTRAINT customers_pkey PRIMARY KEY (customerid)
);

-- public.ms_item_kategori definition

-- Drop table

-- DROP TABLE public.ms_item_kategori;

CREATE TABLE public.ms_item_kategori (
	nama_item varchar(100) NOT NULL,
	kategori varchar(50) NOT NULL,
	CONSTRAINT ms_item_kategori_pkey PRIMARY KEY (nama_item)
);

-- public.ms_item_warna definition

-- Drop table

-- DROP TABLE public.ms_item_warna;

CREATE TABLE public.ms_item_warna (
	nama_barangid serial4 NOT NULL,
	nama_barang varchar(30) NULL,
	warna varchar(50) NULL,
	CONSTRAINT ms_item_warna_nama_barang_key UNIQUE (nama_barang),
	CONSTRAINT ms_item_warna_pkey PRIMARY KEY (nama_barangid)
);

-- public.ms_pelanggan definition

-- Drop table

-- DROP TABLE public.ms_pelanggan;

CREATE TABLE public.ms_pelanggan (
	no_urut int4 NOT NULL,
	kode_pelanggan varchar(20) NULL,
	nama_customer varchar(100) NULL,
	alamat varchar(255) NULL,
	CONSTRAINT ms_pelanggan_pkey PRIMARY KEY (no_urut)
);

-- public.ms_produk definition

-- Drop table

-- DROP TABLE public.ms_produk;

CREATE TABLE public.ms_produk (
	no_urut int4 NULL,
	kode_produk varchar(20) NOT NULL,
	nama_produk varchar(100) NULL,
	harga int4 NULL,
	CONSTRAINT ms_produk_pkey PRIMARY KEY (kode_produk)
);

-- public.ms_produk definition

-- Drop table

-- DROP TABLE public.ms_produk;

CREATE TABLE public.ms_produk (
	no_urut int4 NULL,
	kode_produk varchar(20) NOT NULL,
	nama_produk varchar(100) NULL,
	harga int4 NULL,
	CONSTRAINT ms_produk_pkey PRIMARY KEY (kode_produk)
);

-- public.ms_produk1 definition

-- Drop table

-- DROP TABLE public.ms_produk1;

CREATE TABLE public.ms_produk1 (
	no_urut int4 NOT NULL,
	kode_produk varchar(20) NULL,
	nama_produk varchar(100) NULL,
	harga int4 NULL,
	CONSTRAINT ms_produk1_pkey PRIMARY KEY (no_urut)
);

-- public.ms_produk2 definition

-- Drop table

-- DROP TABLE public.ms_produk2;

CREATE TABLE public.ms_produk2 (
	no_urut int4 NOT NULL,
	kode_produk varchar(20) NULL,
	nama_produk varchar(100) NULL,
	harga int4 NULL,
	CONSTRAINT ms_produk2_pkey PRIMARY KEY (no_urut)
);

-- public.province definition

-- Drop table

-- DROP TABLE public.province;

CREATE TABLE public.province (
	province_id serial4 NOT NULL,
	province varchar(30) NULL,
	total_order int4 NULL,
	total_price numeric NULL,
	CONSTRAINT province_pkey1 PRIMARY KEY (province_id),
	CONSTRAINT province_province_key1 UNIQUE (province)
);

-- public.province definition

-- Drop table

-- DROP TABLE public.province;

CREATE TABLE public.province (
	province_id serial4 NOT NULL,
	province varchar(30) NULL,
	total_order int4 NULL,
	total_price numeric NULL,
	CONSTRAINT province_pkey1 PRIMARY KEY (province_id),
	CONSTRAINT province_province_key1 UNIQUE (province)
);

-- public.students definition

-- Drop table

-- DROP TABLE public.students;

CREATE TABLE public.students (
	studentid serial4 NOT NULL,
	firstname varchar(50) NULL,
	lastname varchar(50) NULL,
	email varchar(100) NULL,
	semester1 numeric(5, 2) NULL,
	semester2 numeric(5, 2) NULL,
	markgrowth numeric(5, 2) NULL,
	CONSTRAINT students_pkey PRIMARY KEY (studentid)
);

-- public.suppliers definition

-- Drop table

-- DROP TABLE public.suppliers;

CREATE TABLE public.suppliers (
	supplierid int4 NOT NULL,
	contactname varchar(100) NULL,
	suppliername varchar(100) NULL,
	address varchar(255) NULL,
	city varchar(100) NULL,
	postalcode varchar(10) NULL,
	country varchar(100) NULL,
	CONSTRAINT supplier_pkey PRIMARY KEY (supplierid)
);

-- public.tabel_a definition

-- Drop table

-- DROP TABLE public.tabel_a;

CREATE TABLE public.tabel_a (
	kode_transaksi varchar(20) NULL,
	kode_pelanggan varchar(20) NULL,
	no_urut int4 NULL,
	kode_produk varchar(20) NULL,
	nama_produk varchar(100) NULL,
	qty int4 NULL,
	harga int4 NULL,
	total int4 NULL
);

-- public.tabel_b definition

-- Drop table

-- DROP TABLE public.tabel_b;

CREATE TABLE public.tabel_b (
	kode_transaksi varchar(20) NULL,
	kode_pelanggan varchar(20) NULL,
	no_urut int4 NULL,
	kode_produk varchar(20) NULL,
	nama_produk varchar(100) NULL,
	qty int4 NULL,
	harga int4 NULL,
	total int4 NULL
);

-- public.tr_penjualan definition

-- Drop table

-- DROP TABLE public.tr_penjualan;

CREATE TABLE public.tr_penjualan (
	kode_transaksi varchar(20) NULL,
	kode_pelanggan varchar(20) NULL,
	no_urut int4 NULL,
	kode_produk varchar(20) NULL,
	nama_produk varchar(100) NULL,
	qty int4 NULL,
	harga int4 NULL
);
