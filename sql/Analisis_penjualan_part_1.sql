-- 1. Total jumlah seluruh penjualan (total/revenue).
SELECT 
  SUM(total) AS total
FROM tr_penjualan;

-- 2. Total quantity seluruh produk yang terjual.
SELECT 
  SUM(qty) AS qty
FROM tr_penjualan;

-- 3. Total quantity dan total revenue untuk setiap kode produk.
SELECT 
  kode_produk,
  SUM(qty)   AS qty,
  SUM(total) AS total
FROM tr_penjualan
GROUP BY kode_produk;
