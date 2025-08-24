CREATE DATABASE mybasis_data;
USE Vehicle;

DROP DATABASE mybasis_data;

CREATE TABLE Mobil (
	IdMobil VARCHAR(6) PRIMARY KEY,
    NamaMobil VARCHAR(50) NOT NULL,
    PemilikMobil VARCHAR(50) NOT NULL,
    Alamat VARCHAR(100) NOT NULL,
    Kontak VARCHAR(50),
    CONSTRAINT CekMobil1 CHECK (CHAR_LENGTH(IdMobil)=5),
    CONSTRAINT CekMobil2 CHECK (IdMobil REGEXP '^MB[0-9][0-9][0-9]$') -- Regular Expression Ex: MB001
);
 
ALTER TABLE Mobil RENAME COLUMN Kontak TO Email;
DROP TABLE Mobil;

CREATE TABLE PemilikKendaraan(
	IdPemilik VARCHAR(6) PRIMARY KEY,
    NamaPemilik VARCHAR(50) NOT NULL,
    Jenis_Kelamin CHAR(1), -- L(Laki-laki)/P(Perempuan)
    Alamat VARCHAR(100) NOT NULL,
    No_Telepon VARCHAR(50),
    IdMobil VARCHAR(6),
    CONSTRAINT CekPemilik1 CHECK (CHAR_LENGTH(IdPemilik)=5),
    CONSTRAINT CekPemilik2 CHECK (IdPemilik REGEXP '^PM[0-9][0-9][0-9]$'),
    CONSTRAINT CekPemilik3 CHECK (Jenis_Kelamin IN ('L','P')),
    CONSTRAINT FK_PemilikKendraan_Mobil FOREIGN KEY(IdMobil) REFERENCES Mobil(IdMobil) ON UPDATE CASCADE ON DELETE SET NULL -- MB001 --> MB000
);
 
DROP TABLE PemilikKendaraan;

CREATE TABLE Service(
	IdService VARCHAR(6) PRIMARY KEY,
    Nama_Service VARCHAR(50) NOT NULL,
    Waktu_Service DATE NOT NULL,
    Etimasi_Biaya INT NOT NULL,
    IdMobil VARCHAR(6),
    CONSTRAINT CekService1 CHECK (CHAR_LENGTH(IdService)=5),
    CONSTRAINT CekService2 CHECK (IdService REGEXP '^SV[0-9][0-9][0-9]$'),
    CONSTRAINT FK_Service_Mobil FOREIGN KEY(IdMobil) REFERENCES Mobil(IdMobil) ON UPDATE CASCADE ON DELETE SET NULL
);

DROP TABLE Service;
ALTER TABLE Service ADD Nama_SparePart VARCHAR(50);
  
CREATE TABLE SparePart(
	IdSparePart VARCHAR(6) PRIMARY KEY , 
    Nama_SparePart VARCHAR(50) NOT NULL,
    Harga INT NOT NULL,
    Stock INT NOT NULL,
    IdService VARCHAR(6),
    CONSTRAINT CekSparePart1 CHECK (CHAR_LENGTH(IdSparePart)=5),
    CONSTRAINT CekSparePart2 CHECK (IdSparePart REGEXP '^SP[0-9][0-9][0-9]$'),
    CONSTRAINT FK_SparePart_Service FOREIGN KEY(IdService) REFERENCES Service(IdService) ON UPDATE CASCADE ON DELETE SET NULL
);

DROP TABLE SparePart;

INSERT INTO Mobil VALUES ('MB001', 'Honda Accord', 'Muhamad', 'Jakarta', 'muhamad@gamil.com');
INSERT INTO Mobil VALUES ('MB002', 'Honda Civic', 'Amir', 'Bogor', 'amir@gamil.com');
INSERT INTO Mobil VALUES ('MB003', 'Honda BRV', 'Arnah', 'Depok', 'arnah@gamil.com');
INSERT INTO Mobil VALUES ('MB004', 'Honda Brio', 'Fardan', 'Bekasi', 'fardan@gamil.com');
INSERT INTO Mobil VALUES ('MB005', 'Honda City', 'Faisal', 'Tangerang', 'faisal@gamil.com');
INSERT INTO Mobil VALUES ('MB006', 'Honda Freed', 'Nenah', 'Tangerang Selatan', 'nenah@gamil.com');
INSERT INTO Mobil VALUES ('MB007', 'Honda CR-V', 'Rifan', 'Sukabumi', 'rifan@gamil.com');
INSERT INTO Mobil VALUES ('MB008', 'Honda HR-V', 'Fadil', 'Cianjur', 'fadil@gamil.com');
INSERT INTO Mobil VALUES ('MB009', 'Honda WR-V', 'Nani', 'Depok', 'nani@gamil.com');
INSERT INTO Mobil VALUES ('MB010', 'Honda Mobilio', 'Rasyid', 'Bekasi', 'rasyid@gamil.com');
INSERT INTO Mobil VALUES ('MB011', 'Honda Odyssey', 'Rafina', 'Jakarta', 'rafina@gamil.com');
INSERT INTO Mobil VALUES ('MB012', 'Honda Stpwgn e:HEV', 'Siti', 'Bogor', 'siti@gamil.com');
INSERT INTO Mobil VALUES ('MB013', 'Honda Accord Turbo', 'Asep', 'Cianjur', 'asep@gamil.com');
INSERT INTO Mobil VALUES ('MB014', 'Honda CR-V Turbo', 'Endi', 'Bogor', 'endi@gamil.com');
INSERT INTO Mobil VALUES ('MB015', 'Honda HR-V Turbo', 'Misbah', 'Tangerang', 'misbah@gamil.com');
INSERT INTO Mobil VALUES ('MB016', 'Honda Civic Turbo', 'Zaelani', 'Tangerang Sealtan', 'zaelani@gamil.com');
INSERT INTO Mobil VALUES ('MB017', 'Honda CR-V e:HEV', 'Suamah', 'Sukabumi', 'suamah@gamil.com');
INSERT INTO Mobil VALUES ('MB018', 'Honda HR-V e:HEV', 'Rena', 'Sukabumi', 'rena@gamil.com');
INSERT INTO Mobil VALUES ('MB019', 'Honda Accord e:HEV', 'Dedi', 'Jakarta', 'dedi@gamil.com');
INSERT INTO Mobil VALUES ('MB020', 'Honda Jazz', 'Safitri', 'Jakarta', 'safitri@gamil.com');
INSERT INTO Mobil VALUES ('MB021', 'Honda e:N1', 'Muhammad', 'Bogor', 'muhammad@gamil.com');

SELECT * FROM Mobil;
SELECT * FROM Mobil WHERE Alamat = 'Bogor';
