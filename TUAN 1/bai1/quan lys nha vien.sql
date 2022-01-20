create database quan_ly_nhan_vien;
use quan_ly_nhan_vien;
CREATE TABLE phong_ban (
    ma_pb VARCHAR(5) NOT NULL,
    ten_pb VARCHAR(25) NULL,
    ma_truongPhong INT NULL
);
CREATE TABLE nhan_vien (
    Id_NhanVien INT NOT NULL,
    Ho_NV VARCHAR(255) NOT NULL,
    Ten_NV VARCHAR(255) NOT NULL,
    Nam_Sinh_NV DATE NULL,
    Dia_chi VARCHAR(255) NULL,
    Gioi_Tinh BIT NOT NULL,
    Luong DOUBLE NULL,
    PHG VARCHAR(5) NULL
);
CREATE TABLE Du_an (
    Ma_DuAn VARCHAR(5) NOT NULL,
    Ten_DuAn VARCHAR(255) NULL,
    Ngay_KetThuc DATE NULL
);
CREATE TABLE QuanLy_DuAn (
    Ma_DuAn VARCHAR(255) NOT NULL,
    Ma_NV INT NOT NULL,
    Ngay_THam_Gia DATETIME NULL,
    Ngay_Ket_Thuc DATETIME NULL,
    So_Gio INT NULL,
    Vai_Tro VARCHAR(255) NULL
);
