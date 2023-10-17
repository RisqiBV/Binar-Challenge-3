--Indexing
CREATE INDEX idx_nik ON nasabah (nik)
CREATE INDEX idx_norek ON akun (norek)
CREATE INDEX idx_id_transaksi ON transaksi (id_transaksi)

--Retrieve All Data
SELECT * FROM nasabah;
SELECT * FROM akun;
SELECT * FROM transaksi;

--Retrieve Data with Condition
SELECT * FROM nasabah WHERE alamat='bantul';
SELECT * FROM transaksi WHERE nominal < 10000000;
SELECT * FROM akun WHERE saldo < 10000000;

--Retrieve 

--Update
UPDATE nasabah  
SET nama = 'Risqi Bagus Palevi'
WHERE nik = 4411;

UPDATE nasabah  
SET alamat = 'Jakarta Selatan'
WHERE nik = 4411;

UPDATE transaksi 
SET nominal = 9000000
WHERE nik = 4413;

--Delete
DELETE FROM nasabah WHERE nik = 4411;
DELETE FROM akun WHERE norek = 111111;

--Create
INSERT INTO nasabah (nik, nama, alamat)
VALUES (4416, 'Ronaldo', 'Portugal'); 