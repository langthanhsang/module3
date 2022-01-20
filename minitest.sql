CREATE TABLE LOAITOUR(
	idLoaiTour INT AUTO_INCREMENT PRIMARY KEY,
    MaLoai VARCHAR(50) ,
    TenLoai VARCHAR(50) NOT NULL
);

CREATE TABLE THANHPHO(
	idThanhPho INT AUTO_INCREMENT PRIMARY KEY,
    nameThanhpho VARCHAR(50) NOT NULL
);

CREATE TABLE KHACHHANG(
	idKhachHang INT AUTO_INCREMENT PRIMARY KEY,
    nameKhachHang VARCHAR(50) NOT NULL,
    soCanCuoc INT ,
    namSinh INT,
    idThanhPho INT,
    FOREIGN KEY (idThanhPho) REFERENCES THANHPHO(idThanhPho)
);

CREATE TABLE DIEMDEN(
	idDiemDen INT AUTO_INCREMENT PRIMARY KEY,
    nameDiemDen VARCHAR(50) NOT NULL,
    moTaDiemDen VARCHAR(50),
    giaTrungBinh DOUBLE NOT NULL,
     idThanhPho INT,
    FOREIGN KEY (idThanhPho) REFERENCES THANHPHO(idThanhPho)
);

CREATE TABLE TOUR(
	idTour INT AUTO_INCREMENT PRIMARY KEY,
    maTour VARCHAR(50),
    idLoaiTour INT,
    idDiemDen INT,
    giaDiemDen DOUBLE NOT NULL,
    ngayBatDau DATETIME,
    ngayKetThuc DATETIME,
    FOREIGN KEY (idLoaiTour) REFERENCES LOAITOUR(idLoaiTour),
    FOREIGN KEY (idDiemDen) REFERENCES DIEMDEN(idDiemDen)
);


CREATE TABLE HOADON(
	idHoaDon INT AUTO_INCREMENT PRIMARY KEY,
    idTour INT,
    idKhachHang INT,
    trangThai INT DEFAULT 1,
    FOREIGN KEY (idTour) REFERENCES TOUR(idTour),
    FOREIGN KEY (idKhachHang) REFERENCES KHACHHANG(idKhachHang)
);

DROP TABLE HOADON;
DROP TABLE TOUR;
DROP TABLE LOAITOUR;
DROP TABLE DIEMDEN;
DROP TABLE THANHPHO;
DROP TABLE KHACHHANG;

INSERT INTO LOAITOUR(MaLoai, TenLoai) VALUES ('Ngan Ngay', 'HN-NB') , 
																			('Ngan Ngay', 'HN-TN') ,
                                                                            ('Ngan Ngay', 'HN-QN') ,
                                                                            ('Dai Ngay', 'HN-SG') ,
                                                                            ('Dai Ngay', 'HN-PQ') ;
                                                                            
  INSERT INTO THANHPHO(nameThanhPho) VALUES('Ninh Binh'), ('Thai Nguyen'), ('Quang Ninh'),
																		('Sai Gon'), ('Phu Quoc');
                                                                        
INSERT INTO DIEMDEN(nameDiemDen, moTaDiemDen, giaTrungBinh, idThanhPho)
VALUES('Ninh Binh', '90km', 2000000, 1), ('Thai Nguyen', '90km', 1000000, 2), ('Quang Ninh', '100km', 3000000, 3),
																		('Sai Gon', '1600km', 8000000, 4), ('Phu Quoc', '1800km', 10000000, 5);

INSERT INTO KHACHHANG(nameKhachHang, soCanCuoc, namSinh, idThanhPho)
VALUES ('Sang', 123456, 1992, 1), ('Tu', 123457, 1997, 2), ('Kien', 123458, 2003, 3), ('Mai', 123459, 1992, 4), ('Trung', 123460, 1992, 5);

INSERT INTO TOUR(maTour, idLoaiTour, idDiemDen, giaDiemDen, ngayBatDau, ngayKetThuc)
VALUES ('HN-NB', 1, 1, 5000000, '2021-01-06', '2021-01-07');
INSERT INTO TOUR(maTour, idLoaiTour, idDiemDen, giaDiemDen, ngayBatDau, ngayKetThuc)
VALUES ('HN-NB', 1, 1, 5000000, '2021-01-07', '2021-01-08');

INSERT INTO TOUR(maTour, idLoaiTour, idDiemDen, giaDiemDen, ngayBatDau, ngayKetThuc)
VALUES ('HN-TN', 2, 3, 5000000, '2021-01-06', '2021-01-07');
INSERT INTO TOUR(maTour, idLoaiTour, idDiemDen, giaDiemDen, ngayBatDau, ngayKetThuc)
VALUES ('HN-TN', 2, 2, 5000000, '2021-01-07', '2021-01-08');
INSERT INTO TOUR(maTour, idLoaiTour, idDiemDen, giaDiemDen, ngayBatDau, ngayKetThuc)
VALUES ('HN-QN', 3, 3, 7000000, '2021-01-07', '2021-01-08'),
('HN-QN', 3, 3, 7000000, '2021-01-08', '2021-01-09'),
('HN-QN', 3, 3, 7000000, '2021-01-09', '2021-01-10');

INSERT INTO TOUR(maTour, idLoaiTour, idDiemDen, giaDiemDen, ngayBatDau, ngayKetThuc)
VALUES ('HN-SG', 4, 4, 10000000, '2021-01-07', '2021-01-08'),
('HN-SG', 4, 4, 10000000, '2021-01-08', '2021-01-09'),
('HN-SG', 4, 4, 7000000, '2021-01-09', '2021-01-10');

INSERT INTO HoaDon(idTour, idKhachHang) VALUES(1, 1), (2, 2), (3, 3), (4, 4);
INSERT INTO HoaDon(idTour, idKhachHang) VALUES(1, 2), (2, 3), (4, 3);

SELECT tp.nameThanhPho, Count(tp.nameThanhPho), SUM(t.giaDiemDen)
FROM TOUR t 
JOIN DiemDen dd ON dd.idDiemDen = t.idDiemDen
JOIN THANHPHO tp On dd.idThanhPho = tp.idThanhPho
GROUP BY tp.nameThanhPho;

-- Cau 2
SELECT Sum(Month(t.ngayBatDau))
FROM TOUR t
WHERE Month(t.ngayBatDau) = 1;

-- Cau 3
SELECT Sum(Month(t.ngayBatDau))
FROM TOUR t
WHERE Month(t.ngayKetThuc) = 1;

-- Cau 4
SELECT SUM(t.giaDiemDen)
FROM TOUR t;

-- Cau5	

SELECT kh.nameKhachhang, COUNT(kh.idKhachhang)
FROM KHACHHANG kh
JOIN HOADON hd ON hd.idKHachhang = kh.idKhachhang
GROUP BY kh.idKhachHang
ORDER BY COUNT(kh.idKhachHang) DESC
LIMIT 1;
-- Cau 6

SET SQL_SAFE_UPDATES = 0;
DELETE FROM KHACHHANG kh WHERE NOT exists
(SELECT * FROM HOADON hd WHERE hd.idKhachHang = kh.idKhachHang);
SET SQL_SAFE_UPDATES = 1;










                
                
           
                


