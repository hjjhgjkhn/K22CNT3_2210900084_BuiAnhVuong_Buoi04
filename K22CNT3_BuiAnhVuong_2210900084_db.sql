CREATE DATABASE K22CNT3_BuiAnhVuong_2210900084_db; 
USE K22CNT3_BuiAnhVuong_2210900084_db;

CREATE TABLE QUAN_TRI (
    ID INT PRIMARY KEY IDENTITY, 
    TaiKhoan VARCHAR(25) UNIQUE, 
    MatKhau VARCHAR(255), 
    TrangThai TINYINT
);

CREATE TABLE LOAI_DIEN_THOAI (
    ID INT PRIMARY KEY IDENTITY, 
    MaLoaiDienThoai VARCHAR(255) UNIQUE, 
    TheLoaiDienThoai NVARCHAR(255), 
    TrangThai TINYINT
);

CREATE TABLE DIEN_THOAI (
    ID INT PRIMARY KEY IDENTITY,
    MaDienThoai VARCHAR(255) UNIQUE, 
    TenDienThoai NVARCHAR(255), 
    HinhAnh NVARCHAR(255), 
    SoLuong INT, 
    DonGia FLOAT, 
    MaLoai INT REFERENCES LOAI_DIEN_THOAI(ID), 
    TrangThai TINYINT
);

CREATE TABLE KHACH_HANG (
    ID INT PRIMARY KEY IDENTITY,
    MaKhachHang VARCHAR(255) UNIQUE, 
    HoTenKhachHang NVARCHAR(255), 
    Email VARCHAR(255) UNIQUE, 
    MatKhau VARCHAR(255), 
    DienThoai VARCHAR(10) UNIQUE, 
    DiaChi NVARCHAR(255), 
    NgayDangKy DATETIME, 
    TrangThai TINYINT
);

CREATE TABLE DANH_GIA (
    ID INT PRIMARY KEY IDENTITY,
    DienThoaiID INT REFERENCES DIEN_THOAI(ID),
    KhachHangID INT REFERENCES KHACH_HANG(ID),
    NoiDungDanhGia VARCHAR(500),
    DanhGia TINYINT,
    NgayDanhGia DATETIME
);

CREATE TABLE HOA_DON (
    ID INT PRIMARY KEY IDENTITY, 
    MaHoaDon VARCHAR(255) UNIQUE, 
    KhachHangID INT REFERENCES KHACH_HANG(ID), 
    NgayHoaDon DATETIME, 
    NgayNhan DATETIME, 
    HoTenKhachHang NVARCHAR(255), 
    Email VARCHAR(255), 
    DienThoai VARCHAR(10), 
    DiaChi NVARCHAR(255), 
    TongTriGia FLOAT, 
    TrangThai TINYINT
);

CREATE TABLE CT_HOA_DON (
    ID INT PRIMARY KEY IDENTITY, 
    HoaDonID INT REFERENCES HOA_DON(ID), 
    DienThoaiID INT REFERENCES DIEN_THOAI(ID), 
    SoLuongMua INT, 
    DonGiaMua FLOAT, 
    ThanhTien FLOAT, 
    TrangThai TINYINT
);

INSERT INTO QUAN_TRI (TaiKhoan, MatKhau, TrangThai) VALUES
('BAV', '19062004', 1),
('admin2', 'password456', 1),
('admin3', 'password789', 1),
('admin4', 'password101', 1),
('admin5', 'password202', 1);

INSERT INTO LOAI_DIEN_THOAI (MaLoaiDienThoai, TheLoaiDienThoai, TrangThai) VALUES
('L001', 'Smartphone', 1),
('L002', 'Feature Phone', 0),
('L003', 'Gaming Phone', 1);

INSERT INTO DIEN_THOAI (MaDienThoai, TenDienThoai, HinhAnh, SoLuong, DonGia, MaLoai, TrangThai) VALUES
('P001', 'iPhone 13', 'iphone13.jpg', 50, 999.99, 1, 1),
('P002', 'Samsung Galaxy S21', 'galaxy_s21.jpg', 100, 799.99, 1, 1),
('P003', 'Nokia 3310', 'nokia_3310.jpg', 200, 59.99, 2, 1),
('P004', 'Xiaomi Black Shark 4', 'black_shark_4.jpg', 30, 499.99, 3, 1),
('P005', 'ASUS ROG Phone 5', 'rog_phone_5.jpg', 25, 999.99, 3, 1);

INSERT INTO KHACH_HANG (MaKhachHang, HoTenKhachHang, Email, MatKhau, DienThoai, DiaChi, NgayDangKy, TrangThai) VALUES
('KH001', 'Bui Anh Vuong', 'buianhvuong@gmail.com', 'password1', '0912345678', 'Ha Noi', '2022-10-01', 1),
('KH002', 'Nguyen Thi B', 'thib@gmail.com', 'password2', '0912345679', 'Ho Chi Minh', '2021-11-15', 1),
('KH003', 'Le Minh C', 'minhc@gmail.com', 'password3', '0912345680', 'Da Nang', '2023-01-25', 1),
('KH004', 'Pham Hong D', 'hongd@gmail.com', 'password4', '0912345681', 'Hai Phong', '2020-08-05', 1),
('KH005', 'Vo Van E', 'vane@gmail.com', 'password5', '0912345682', 'Can Tho', '2023-09-18', 1);

INSERT INTO DANH_GIA (DienThoaiID, KhachHangID, NoiDungDanhGia, DanhGia, NgayDanhGia) VALUES
(1, 1, 'Excellent phone, worth the price!', 5, '2023-10-10'),
(2, 2, 'Great performance and features!', 5, '2023-08-15'),
(3, 3, 'Classic phone, very durable.', 4, '2023-09-20'),
(4, 4, 'Amazing for gaming.', 5, '2023-07-30'),
(5, 5, 'High-end gaming phone, impressive!', 5, '2023-06-25');

INSERT INTO CT_HOA_DON (HoaDonID, DienThoaiID, SoLuongMua, DonGiaMua, ThanhTien, TrangThai) VALUES 
(1, 1, 2, 999.99, 1999.98, 1);


SELECT * FROM QUAN_TRI;
SELECT * FROM LOAI_DIEN_THOAI;
SELECT * FROM DIEN_THOAI;
SELECT * FROM KHACH_HANG;
SELECT * FROM DANH_GIA;
SELECT * FROM HOA_DON;
SELECT * FROM CT_HOA_DON;

DROP TABLE IF EXISTS CT_HOA_DON;
DROP TABLE IF EXISTS HOA_DON;
DROP TABLE IF EXISTS DANH_GIA;
DROP TABLE IF EXISTS KHACH_HANG;
DROP TABLE IF EXISTS DIEN_THOAI;
DROP TABLE IF EXISTS LOAI_DIEN_THOAI;
DROP TABLE IF EXISTS QUAN_TRI;

