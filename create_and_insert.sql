CREATE TABLE IF NOT EXISTS nasabah (

    nik INT NOT NULL,
    nama VARCHAR(255) NOT NULL,
    alamat VARCHAR(255) NOT NULL,
    jenis_kelamin varchar(2) NOT NULL,
    tgl_lahir date NOT NULL,
    createAt TIMESTAMP NOT NULL DEFAULT NOW(),
    deletedAt TIMESTAMP NOT NULL DEFAULT NOW(),
    updateAt TIMESTAMP NOT NULL DEFAULT NOW(),
    PRIMARY KEY (nik)

);

CREATE TABLE IF NOT EXISTS akun (
    
    norek INT NOT NULL, 
    saldo INT NOT NULL,
    nik INT NOT NULL,
    createAt TIMESTAMP NOT NULL DEFAULT NOW(),
    deletedAt TIMESTAMP NOT NULL DEFAULT NOW(),
    updateAt TIMESTAMP NOT NULL DEFAULT NOW(),
    PRIMARY KEY (norek)
);

CREATE TABLE IF NOT EXISTS transaksi (
    
    id_transaksi SERIAL PRIMARY KEY,
    jenis_transaksi VARCHAR(10) NOT NULL,
    nominal INT NOT NULL,
    norek INT NOT NULL
    
);

--Add Foreign Key
ALTER TABLE akun
ADD CONSTRAINT akun_fkey
FOREIGN KEY (nik)
REFERENCES nasabah(nik);

ALTER TABLE transaksi
ADD CONSTRAINT norek_fk
FOREIGN KEY (norek)
REFERENCES akun(norek);

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

--Retrieve with CTE
WITH Gabungan_Nasabah_Akun AS (
    SELECT
        n.nik,
        n.nama AS nama_nasabah,
        n.alamat,
        n.jenis_kelamin,
        n.tgl_lahir,
        a.norek,
        a.saldo
    FROM
        nasabah n
    JOIN
        akun a ON n.nik = a.nik
),
Transaksi_Nasabah_Akun AS (
    SELECT
        t.id_transaksi,
        t.jenis_transaksi,
        t.nominal,
        t.norek,
        a.saldo
    FROM
        transaksi t
    JOIN
        akun a ON t.norek = a.norek
)
SELECT
    g.nik,
    g.nama_nasabah,
    g.alamat,
    g.jenis_kelamin,
    g.tgl_lahir,
    g.norek AS norek_akun,
    t.id_transaksi,
    t.jenis_transaksi,
    t.nominal,
    t.saldo AS saldo_akun
FROM
    Gabungan_Nasabah_Akun g
JOIN
    Transaksi_Nasabah_Akun t ON g.norek = t.norek;


--Update
UPDATE nasabah  
SET nama = 'Risqi Bagus Palevi'
WHERE nik = 13;

UPDATE nasabah  
SET alamat = 'Jakarta Selatan'
WHERE nik = 11;

UPDATE transaksi 
SET nominal = 9000000
WHERE id_transaksi = 3;

--Delete
DELETE FROM nasabah WHERE nik = 11;
DELETE FROM akun WHERE norek = 111111;

--Insert
INSERT INTO nasabah (nik, nama, alamat, jenis_kelamin, tgl_lahir)
VALUES 
 (13, 'Risqi', 'Bantul', 'L', '08-11-2021'), 
 (14, 'Nadia', 'Jakarta', 'P', '07-11-2004'), 
 (15, 'Arra', 'Sleman', 'P', '03-11-1999') ;

INSERT INTO akun (norek, saldo, nik)
VALUES 
    (111, 1000000, 11), 
    (112, 2000000, 12), 
    (113, 2000000, 12), 
    (114, 3000000, 13),
    (115, 3500000, 14),
    (116, 4000000, 14),
    (117, 4400000, 15);

INSERT INTO transaksi (jenis_transaksi, nominal, norek)
VALUES 
    ('masuk', 1200000, 111), 
    ('keluar', 2300000, 111), 
    ('masuk', 2400000, 112), 
    ('masuk', 3500000, 113),
    ('masuk', 3600000, 114),
    ('keluar', 4700000, 114),
    ('keluar', 4800000, 115);