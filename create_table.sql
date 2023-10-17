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

)

CREATE TABLE IF NOT EXISTS akun (
    
    norek INT NOT NULL, 
    saldo INT NOT NULL,
    nik INT NOT NULL,
    nama VARCHAR(255) NOT NULL,
    createAt TIMESTAMP NOT NULL DEFAULT NOW(),
    deletedAt TIMESTAMP NOT NULL DEFAULT NOW(),
    updateAt TIMESTAMP NOT NULL DEFAULT NOW(),
    PRIMARY KEY (norek)
)

CREATE TABLE IF NOT EXISTS transaksi (
    
    id_transaksi SERIAL PRIMARY KEY,
    jenis_transaksi VARCHAR(10) NOT NULL,
    nominal INT NOT NULL,
    norek INT NOT NULL
    
)