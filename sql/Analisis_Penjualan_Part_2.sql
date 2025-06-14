-- 4. Rata-rata total belanja per kode pelanggan--
SELECT 
  kode_pelanggan, 
  AVG(total) AS avg_total
FROM tr_penjualan
GROUP BY kode_pelanggan;
-- 5. Tambahkan kolom “kategori” berdasarkan nilai total.
SELECT 
  kode_transaksi,
  kode_pelanggan,
  no_urut,
  kode_produk,
  nama_produk,
  qty,
  total,
  CASE  
    WHEN total > 300000 THEN 'High'
    WHEN total < 100000 THEN 'Low'
    ELSE 'Medium'  
  END AS kategori
FROM tr_penjualan;

-----
SELECT 
  kode_transaksi,
  kode_pelanggan,
  no_urut,
  kode_produk,
  nama_produk,
  qty,
  total,
  CASE  
    WHEN total > 300000 THEN 'High'
    WHEN total < 100000 THEN 'Low'
    ELSE 'Medium'  
  END AS kategori
FROM tr_penjualan;


