-- Những bảng database cần có trong quản lý quán cafe
-- Khu vực(KHU_VUC)
-- Bàn(BAN)
-- Hóa đơn(HOA_DON_BAN_HANG)
-- Chi tiết hóa đơn(CHI_TIET_HD_BAN_HANG)
-- Nhân viên liên quan(quản lý nhân viên)(NHAN_VIEN)
-- Khách hàng của hóa đơn(quản lý khách hàng)(KHACH_HANG)
-- Chi tiết khách hàng(loại khách hàng)(LOAI_KHACH_HANG)
-- Hàng hóa(HANG_HOA)
-- Loại hàng hóa(đồ uống, thức ăn)(LOAI_HANG_HOA)

CREATE DATABASE PBL_V1
GO
USE PBL_V1
GO
-- Cấp phát dữ liệu cho Khu vực
--INSERT INTO KHU_VUC(Ma_Khu_Vuc, Ten_Khu_Vuc, Trang_Thai) values 
--('KV1','Tầng 1',''),
--('KV2','Tầng 2',''),
--('KV3','Tầng 3','');
--GO
--SELECT *FROM dbo.KHU_VUC;
--GO
CREATE TABLE BAN
(
    Ma_Ban INT PRIMARY KEY  NOT NULL,
	Ten_Ban NVARCHAR(50) NOT NULL,
	--Ma_Khu_Vuc VARCHAR(50) NOT NULL,
	Trang_Thai NVARCHAR(70) NOT NULL,
    Tinh_Trang INT NOT NULL
	--CONSTRAINT fk_htk_Ma_Khu_Vuc FOREIGN KEY (Ma_Khu_Vuc) REFERENCES KHU_VUC (Ma_Khu_Vuc)
)
GO
-- THÊM dữ liệu cho data Bàn
INSERT INTO BAN(Ma_Ban, Ten_Ban, Trang_Thai, Tinh_Trang) values  
(1,'BAN_01',N'Trống', 1),
(2,'BAN_02',N'Trống', 1),
(3,'BAN_03',N'Trống', 1),
(4,'BAN_04',N'Đã có khách', 1),
(5,'BAN_05',N'Trống', 1),
(6,'BAN_06',N'Trống', 1),
(7,'BAN_07',N'Đã có khách', 1),
(8,'BAN_08',N'Trống', 1),
(9,'BAN_09',N'Trống', 1);
GO
SELECT *FROM dbo.BAN;
GO

CREATE TABLE NHAN_VIEN
(
    Ma_Nhan_Vien VARCHAR(50) PRIMARY KEY NOT NULL,
	Ten_Nhan_Vien NVARCHAR(100) NOT NULL,
	Gioi_Tinh NVARCHAR(50) NOT NULL,
	Chuc_Vu NVARCHAR(100) NOT NULL,
	Luong INT NOT NULL,
	Dia_Chi NVARCHAR(150) NOT NULL,
	SDT VARCHAR(20) NOT NULL,
	Mat_Khau VARCHAR(50) NOT NULL,
	Tinh_Trang INT NOT NULL,
)
GO
-- THÊM dữ liệu cho data Nhân Viên
INSERT INTO NHAN_VIEN(Ma_Nhan_Vien, Ten_Nhan_Vien, Gioi_Tinh, Chuc_Vu, Luong, Dia_Chi, SDT, Mat_Khau, Tinh_Trang) values
  ('NV01',N'Trần Văn Phúc',N'Nam',N'Quản lý', 20000000,N'111 - Nguyễn Lương Bằng', '0311112222','121212', 1),
  ('NV02',N'Trần Hương Giang', N'Nữ',N'Quản lý', 20000000, N'15 - Nguyễn Lương Bằng', '0987748835','142929', 1),
  ('NV03',N'Trần Thanh Tú', N'Nữ',N'Nhân Viên', 8000000, N'16 - Nguyễn Lương Bằng', '0987772835','173929', 1),
  ('NV04',N'Nguyễn Bảo Nhi', N'Nữ',N'Nhân Viên', 7000000, N'113 - Nguyễn Lương Bằng', '0987778836','171929', 1),
  ('NV05',N'Trần Văn Hoàng', N'Nam',N'Nhân Viên', 7000000, N'1333 - Nguyễn Lương Bằng', '0987578863','174921', 1);
GO

SELECT *FROM dbo.NHAN_VIEN;
GO

CREATE TABLE LOAI_KHACH_HANG
(
    Ma_Loai_Khach_Hang VARCHAR(20) PRIMARY KEY NOT NULL,
	Ten_Loai_Khach_Hang NVARCHAR(100) NOT NULL,
	Giam_gia INT NOT NULL
)
GO
-- THÊM dữ liệu cho data Loại Khách Hàng
INSERT INTO LOAI_KHACH_HANG(Ma_Loai_Khach_Hang, Ten_Loai_Khach_Hang, Giam_gia) values 
('LKH01',N'Tiềm năng', 0),
('LKH02',N'Bạc', 5),
('LKH03',N'Vàng', 10),
('LKH04',N'Kim cương', 20);
GO

SELECT *FROM dbo.LOAI_KHACH_HANG;
GO

CREATE TABLE KHACH_HANG
(
    Ma_Khach_Hang INT PRIMARY KEY  NOT NULL,
	Ma_Loai_Khach_Hang VARCHAR(20) NOT NULL,  -- Khóa ngoại
	Ten_Khach_Hang NVARCHAR(100) NOT NULL,
	Dia_Chi NVARCHAR(150) NOT NULL,
	SDT VARCHAR(20) NOT NULL,
	Diem_Tich_Luy INT NOT NULL, -- ĐIỂM TÍCH LŨY KHI MUA HÀNG
	CONSTRAINT fk_htk_Ma_Loai_Khach_Hang FOREIGN KEY (Ma_Loai_Khach_Hang) REFERENCES LOAI_KHACH_HANG (Ma_Loai_Khach_Hang)
)
GO

INSERT INTO KHACH_HANG(Ma_Khach_Hang, Ten_Khach_Hang, Ma_Loai_Khach_Hang, Dia_Chi, SDT, Diem_Tich_Luy) values 
(1, N'Trần Văn Phúc', 'LKH01', N'20 - Phan Rang', '0932345644', 0),
(2,N'Trần Văn Phước','LKH02', N'20 - Điện Biên Phủ', '0936656424', 0),
(3,N'Lê Tùng Duy','LKH02', N'28 - Điện Biên Phủ', '0932355654', 0),
(4,N'Hoàng Phước Dung','LKH01', N'20 - Ngô Sĩ Liên', '0932545634', 0),
(5,N'Trần Bích Phương','LKH03', N'05 - Ngô Sĩ Liên', '0932325461', 0),
(6,N'Đào Thị Bích Hằng','LKH04', N'192 - Nguyễn Lương Bằng', '0932341248', 0),
(7,N'Nguyễn Phước Duy','LKH04', N'120 - Điện Biên Phủ', '0932317598', 0),
(8,N'Phàm Ngọc Bích','LKH04', N'222 - Phan Rang', '0932387692', 0),
(9,N'Huỳnh Như Sương','LKH01', N'150 - Điện Biên Phủ', '0931578444', 0);

SELECT *FROM dbo.KHACH_HANG;
GO

CREATE TABLE LOAI_HANG_HOA
(
    Ma_Loai_Hang_Hoa VARCHAR(20) PRIMARY KEY NOT NULL,
	Ten_Loai_Hang_Hoa NVARCHAR(100) NOT NULL,
)
GO
INSERT INTO LOAI_HANG_HOA(Ma_Loai_Hang_Hoa, Ten_Loai_Hang_Hoa) values 
('LHH01',N'Cafe'),
('LHH02',N'Nước ép'),
('LHH03',N'Sinh tố hoa quả'),
('LHH04',N'Trà lạnh & trà nóng'),
('LHH05',N'Sữa chua');
GO

SELECT *FROM dbo.LOAI_HANG_HOA;
GO

CREATE TABLE HANG_HOA
(
    Ma_Hang_Hoa INT PRIMARY KEY  NOT NULL,
	Ten_Hang_Hoa NVARCHAR(100) NOT NULL,
	Ma_Loai_Hang_Hoa VARCHAR(20) NOT NULL,-- KHÓA NGOẠI
	Hinh_Anh VARCHAR(50) NOT NULL,
	Gia_Hang_Hoa INT NOT NULL,
	Tinh_Trang INT NOT NULL
	CONSTRAINT fk_htk_Ma_Loai_Hang_Hoa FOREIGN KEY (Ma_Loai_Hang_Hoa) REFERENCES LOAI_HANG_HOA (Ma_Loai_Hang_Hoa)
)
GO
INSERT INTO HANG_HOA(Ma_Hang_Hoa, Ten_Hang_Hoa, Ma_Loai_Hang_Hoa, Hinh_Anh, Gia_Hang_Hoa, Tinh_Trang) values
(1,N'Cà phê Mocha','LHH01','STDB.jpg',120000, 1),
(2,N'Caramel Macchiato','LHH01','Caramel.jpg',100000, 1),
(3,N'Cà phê sữa lắc','LHH01','Cafesualac.jpg',15000, 1),
(4,N'Cà phê tiramisu','LHH01','Tiramisu.jpg',100000, 1),
(5,N'Cà phê Ireland','LHH01','Ireland.jpg',50000, 1),
(6,N'Cà phê sữa chua','LHH01','Cafesuachua.jpg',50000, 1),
(7,N'Cà phê sữa','LHH01','Cafesua.jpg',20000, 1),
(8,N'Cappuccino','LHH01',' Cappuccino.jpg',89000, 1),
(9,N'Marocchino','LHH01','Marocchino.jpg',89000, 1),
(10,N'Nước ép dưa hấu','LHH02','Nuocepduahau.jpg',15000, 1),
(11,N'Nước ép táo','LHH02','Nuoceptao.jpg',15000, 1),
(12,N'Nước ép cam','LHH02','Nuocepcam.jpg',20000, 1),
(13,N'Nước ép thanh long','LHH02','Nuocepthanhlong.jpg',20000, 1),
(14,N'Nước ép mít','LHH02','Nuocepmit.jpg',25000, 1),
(15,N'Sinh tố dâu tây','LHH03','Sinhtodautay.jpg',35000, 1),
(16,N'Sinh tố lê','LHH03','Sinhtole.jpg',25000, 1),
(17,N'Sinh tố đào','LHH03','Sinhtodao.jpg',25000, 1),
(18,N'Sinh tố thơm','LHH03','Sinhtothơm.jpg',25000, 1),
(19,N'Trà lạnh','LHH04','Tralanh.jpg',55000, 1),
(20,N'Trà trái cây','LHH04','Tratraicay.jpg',55000, 1),
(21,N'Trà hoa cúc mật ong','LHH04','Trahoacucmatong.jpg',55000, 1),
(22,N'Trà quế mật ong','LHH04','Traquematong.jpg',45000, 1),
(23,N'Sữa chua nếp cẩm','LHH05','Suachuanepcam.jpg',35000, 1),
(24,N'Sữa chua thạch trái cây','LHH05','Suachuathachtraicay.jpg',89000, 1),
(25,N'Sữa chua vị lá dứa','LHH05','Suachualadua.jpg',28000, 1);
GO
SELECT *FROM dbo.HANG_HOA;
GO

CREATE TABLE HOA_DON_BAN_HANG
(
    Ma_Hoa_Don VARCHAR(50) PRIMARY KEY NOT NULL,
	Ma_Nhan_Vien VARCHAR(50) NOT NULL,-- KHÓA NGOẠI
	Ma_Ban INT NOT NULL,-- KHÓA NGOẠI
	Ma_Khach_Hang INT,-- ALLOW NULL VÀ LÀ KHÓA NGOẠI
	Date_HDBH DATETIME NOT NULL,
	Tong_Tien INT NOT NULL,
	Diem_Tich_Luy INT,-- ALLOW NULL
	Giam_Gia INT,-- ALLOW NULL
	CONSTRAINT fk_hdbh_Ma_Nhan_Vien FOREIGN KEY (Ma_Nhan_Vien) REFERENCES NHAN_VIEN (Ma_Nhan_Vien),
	CONSTRAINT fk_hdbh_Ma_Ban FOREIGN KEY (Ma_Ban) REFERENCES BAN (Ma_Ban),
    CONSTRAINT fk_hdbh_Ma_Khach_Hang FOREIGN KEY (Ma_Khach_Hang) REFERENCES KHACH_HANG (Ma_Khach_Hang)
)
GO
INSERT INTO HOA_DON_BAN_HANG(Ma_Hoa_Don, Ma_Nhan_Vien, Ma_Ban, Ma_Khach_Hang, Date_HDBH, Tong_Tien, Diem_Tich_Luy, Giam_Gia) values 
('HDBH01','NV01',3,1,'2022-04-25 07:35:24',150000, 10, 0),
('HDBH02','NV03',2,2,'2022-04-25 08:30:20',200000, 10, 0),
('HDBH03','NV02',1,3,'2022-04-25 08:35:24',289000, 10, 0),
('HDBH04','NV04',8,4,'2022-04-25 09:30:25',100000, 5, 0),
('HDBH05','NV03',8,5,'2022-04-25 10:35:24',300000, 10, 0),
('HDBH06','NV02',4,6,'2022-04-25 10:45:30',200000, 10, 0),
('HDBH07','NV03',5,7,'2022-04-25 11:00:24',35000, 0, 0),
('HDBH08','NV05',6,8,'2022-04-25 11:35:24',20000, 0, 0),
('HDBH09','NV02',9,9,'2022-04-25 13:32:11',150000, 10, 0);
GO
SELECT *FROM dbo.HOA_DON_BAN_HANG;
GO

CREATE TABLE CHI_TIET_HD_BAN_HANG
(
    Ma_CTHD INT PRIMARY KEY NOT NULL,-- MÃ CHI TIẾT HÓA ĐƠN BÁN HÀNG 
    Ma_Hoa_Don VARCHAR(50) NOT NULL,-- KHÓA NGOẠI
	Ma_Hang_Hoa INT NOT NULL,-- KHÓA NGOẠI
	So_Luong INT NOT NULL,
	CONSTRAINT fk_hdbh_Ma_Ma_Hoa_Don FOREIGN KEY (Ma_Hoa_Don) REFERENCES HOA_DON_BAN_HANG (Ma_Hoa_Don),
	CONSTRAINT fk_hdbh_Ma_Hang_Hoa FOREIGN KEY (Ma_Hang_Hoa) REFERENCES HANG_HOA (Ma_Hang_Hoa)
)
GO
--INSERT INTO CT_HDBH_TAI_CHO(Ma_CTHD, Ma_Hoa_Don, Ma_Hang_Hoa, So_Luong) values 
INSERT INTO CHI_TIET_HD_BAN_HANG(Ma_CTHD, Ma_Hoa_Don, Ma_Hang_Hoa, So_Luong) values 
(1, 'HDBH01',2, 1),
(2, 'HDBH01',5, 1),
(3, 'HDBH02',2, 1),
(4, 'HDBH02',4, 1),
(5, 'HDBH03',2, 1),
(6, 'HDBH03',4, 1),
(7, 'HDBH03',8, 1),
(8, 'HDBH04',2, 1),
(9, 'HDBH05',4, 3),
(10, 'HDBH06',18, 4),
(11, 'HDBH07',15, 1),
(12, 'HDBH08',13, 1),
(13, 'HDBH09',5, 1),
(14, 'HDBH09',6, 1),
(15, 'HDBH09',16, 1),
(16, 'HDBH09',17, 1);
SELECT *FROM dbo.CHI_TIET_HD_BAN_HANG;
GO

-- TRUY VẤN SQL hiển thị loại đồ uống theo danh mục
-- Muốn hiển thị loại đồ uống, đồ uống và giá tiền:
SELECT LOAI_HANG_HOA.Ten_Loai_Hang_Hoa, HANG_HOA.Ten_Hang_Hoa, HANG_HOA.Gia_Hang_Hoa
FROM LOAI_HANG_HOA, HANG_HOA
WHERE LOAI_HANG_HOA.Ma_Loai_Hang_Hoa = HANG_HOA.Ma_Loai_Hang_Hoa
AND LOAI_HANG_HOA.Ma_Loai_Hang_Hoa = 'LHH02'

---------------------------------------------------
CREATE PROC PROC_XEM_MENU_THEO_DANH_MUC_Hang_Hoa
    @Ma_Loai_Hang_Hoa VARCHAR(50)
AS
BEGIN
      SELECT LOAI_HANG_HOA.Ten_Loai_Hang_Hoa, HANG_HOA.Ten_Hang_Hoa, HANG_HOA.Gia_Hang_Hoa
      FROM LOAI_HANG_HOA, HANG_HOA
      WHERE LOAI_HANG_HOA.Ma_Loai_Hang_Hoa = HANG_HOA.Ma_Loai_Hang_Hoa
          AND LOAI_HANG_HOA.Ma_Loai_Hang_Hoa = @Ma_Loai_Hang_Hoa
END

EXEC PROC_XEM_MENU_THEO_DANH_MUC_Hang_Hoa 'LHH01'

--- HIỂN THỊ danh mục đồ uống trong 1 đơn hàng
-- Ma_Hoa_Don,Ten_Nhan_Vien,Ten_Khach_Hang, Ten_hang_hoa,giá, số lượng, tổng tiền, ngày mua
--- dữ liệu từ Bảng Hóa đơn, Nhân viên, khách hàng, hàng hóa,chi tiết hóa đơn
SELECT HOA_DON_BAN_HANG.Ma_Hoa_Don, NHAN_VIEN.Ten_Nhan_Vien, KHACH_HANG.Ten_Khach_Hang, HANG_HOA.Ten_Hang_Hoa,HANG_HOA.Gia_Hang_Hoa,CHI_TIET_HD_BAN_HANG.So_Luong,HOA_DON_BAN_HANG.Tong_Tien,HOA_DON_BAN_HANG.Date_HDBH
FROM HOA_DON_BAN_HANG,NHAN_VIEN,KHACH_HANG,HANG_HOA,CHI_TIET_HD_BAN_HANG
WHERE HOA_DON_BAN_HANG.Ma_Hoa_Don = CHI_TIET_HD_BAN_HANG.Ma_Hoa_Don
   AND HOA_DON_BAN_HANG.Ma_Khach_Hang = KHACH_HANG.Ma_Khach_Hang
   AND HOA_DON_BAN_HANG.Ma_Nhan_Vien = NHAN_VIEN.Ma_Nhan_Vien
   AND CHI_TIET_HD_BAN_HANG.Ma_Hang_Hoa = HANG_HOA.Ma_Hang_Hoa

-- XEM ĐƠN HÀNG THEO MÃ HÓA ĐƠN
CREATE PROC PROC_XEM_HOA_DON
    @Ma_Hoa_Don VARCHAR(50)
AS
BEGIN
      SELECT HOA_DON_BAN_HANG.Ma_Hoa_Don, NHAN_VIEN.Ten_Nhan_Vien, KHACH_HANG.Ten_Khach_Hang, HANG_HOA.Ten_Hang_Hoa,HANG_HOA.Gia_Hang_Hoa,CHI_TIET_HD_BAN_HANG.So_Luong,HOA_DON_BAN_HANG.Tong_Tien,HOA_DON_BAN_HANG.Date_HDBH
FROM HOA_DON_BAN_HANG,NHAN_VIEN,KHACH_HANG,HANG_HOA,CHI_TIET_HD_BAN_HANG
WHERE HOA_DON_BAN_HANG.Ma_Hoa_Don = CHI_TIET_HD_BAN_HANG.Ma_Hoa_Don
   AND HOA_DON_BAN_HANG.Ma_Khach_Hang = KHACH_HANG.Ma_Khach_Hang
   AND HOA_DON_BAN_HANG.Ma_Nhan_Vien = NHAN_VIEN.Ma_Nhan_Vien
   AND CHI_TIET_HD_BAN_HANG.Ma_Hang_Hoa = HANG_HOA.Ma_Hang_Hoa
   AND HOA_DON_BAN_HANG.Ma_Hoa_Don = @Ma_Hoa_Don
END

EXEC PROC_XEM_HOA_DON 'HDBH02'

-- XEM ĐƠN HÀNG THEO MÃ KHÁCH HÀNG
CREATE PROC PROC_XEM_HOA_DON_THEO_MA_KH_
    @Ma_Khach_Hang INT
AS
BEGIN
      SELECT HOA_DON_BAN_HANG.Ma_Hoa_Don, NHAN_VIEN.Ten_Nhan_Vien, KHACH_HANG.Ten_Khach_Hang, HANG_HOA.Ten_Hang_Hoa,HANG_HOA.Gia_Hang_Hoa,CHI_TIET_HD_BAN_HANG.So_Luong,HOA_DON_BAN_HANG.Tong_Tien,HOA_DON_BAN_HANG.Date_HDBH
FROM HOA_DON_BAN_HANG,NHAN_VIEN,KHACH_HANG,HANG_HOA,CHI_TIET_HD_BAN_HANG
WHERE HOA_DON_BAN_HANG.Ma_Hoa_Don = CHI_TIET_HD_BAN_HANG.Ma_Hoa_Don
   AND HOA_DON_BAN_HANG.Ma_Khach_Hang = KHACH_HANG.Ma_Khach_Hang
   AND HOA_DON_BAN_HANG.Ma_Nhan_Vien = NHAN_VIEN.Ma_Nhan_Vien
   AND CHI_TIET_HD_BAN_HANG.Ma_Hang_Hoa = HANG_HOA.Ma_Hang_Hoa
   AND KHACH_HANG.Ma_Khach_Hang = @Ma_Khach_Hang
END

EXEC PROC_XEM_HOA_DON_THEO_MA_KH_ 1

-- TRUY VẤN HIỂN THỊ DOANH THU TỪ NGÀY - ĐẾN NGÀY
-- thống kê doanh thu
SELECT HOA_DON_BAN_HANG.Ma_Hoa_Don, NHAN_VIEN.Ten_Nhan_Vien, KHACH_HANG.Ten_Khach_Hang, HANG_HOA.Ten_Hang_Hoa,HANG_HOA.Gia_Hang_Hoa,CHI_TIET_HD_BAN_HANG.So_Luong,HOA_DON_BAN_HANG.Tong_Tien,HOA_DON_BAN_HANG.Date_HDBH
FROM HOA_DON_BAN_HANG,NHAN_VIEN,KHACH_HANG,HANG_HOA,CHI_TIET_HD_BAN_HANG
WHERE HOA_DON_BAN_HANG.Ma_Hoa_Don = CHI_TIET_HD_BAN_HANG.Ma_Hoa_Don
   AND HOA_DON_BAN_HANG.Ma_Khach_Hang = KHACH_HANG.Ma_Khach_Hang
   AND HOA_DON_BAN_HANG.Ma_Nhan_Vien = NHAN_VIEN.Ma_Nhan_Vien
   AND CHI_TIET_HD_BAN_HANG.Ma_Hang_Hoa = HANG_HOA.Ma_Hang_Hoa
   AND HOA_DON_BAN_HANG.Date_HDBH >= '2022-04-25'
   AND HOA_DON_BAN_HANG.Date_HDBH <= '2022-04-30'

-- hiển thị hoanh thu
SELECT Tong_Tien
FROM HOA_DON_BAN_HANG
WHERE HOA_DON_BAN_HANG.Date_HDBH >= '2022-04-25'
   AND HOA_DON_BAN_HANG.Date_HDBH <= '2022-04-30'

-- HIỂN THỊ TỔNG DOANH THU
SELECT SUM(Tong_Tien) 'Tong_Doanh_Thu'
FROM HOA_DON_BAN_HANG
WHERE HOA_DON_BAN_HANG.Date_HDBH >= '2022-04-25'
   AND HOA_DON_BAN_HANG.Date_HDBH <= '2022-04-30'

CREATE PROC PROC_XEM_TONG_DOANH_THU
    @StartDate DATE,
	@EndDate DATE
AS
BEGIN
    SELECT SUM(Tong_Tien) 'Tong_Doanh_Thu'
    FROM HOA_DON_BAN_HANG
    WHERE HOA_DON_BAN_HANG.Date_HDBH >= @StartDate
      AND HOA_DON_BAN_HANG.Date_HDBH <= @EndDate
END

EXEC PROC_XEM_TONG_DOANH_THU '2022-04-25','2022-04-30'


-- Tính tổng tiền của từng đơn hàng.
-- Bao gồm: Mã đơn hàng, Tên nhân viên, Tên Khách hàng, Ngày mua, Tổng tiền
SELECT HOA_DON_BAN_HANG.Ma_Hoa_Don, NHAN_VIEN.Ten_Nhan_Vien, KHACH_HANG.Ten_Khach_Hang, HOA_DON_BAN_HANG.Date_HDBH 'Ngay mua',SUM(CHI_TIET_HD_BAN_HANG.So_Luong * HANG_HOA.Gia_Hang_Hoa) 'Tong Tien'
FROM HOA_DON_BAN_HANG, NHAN_VIEN, KHACH_HANG, CHI_TIET_HD_BAN_HANG, HANG_HOA
WHERE HOA_DON_BAN_HANG.Ma_Khach_Hang = KHACH_HANG.Ma_Khach_Hang
  AND NHAN_VIEN.Ma_Nhan_Vien = HOA_DON_BAN_HANG.Ma_Nhan_Vien
  AND HOA_DON_BAN_HANG.Ma_Hoa_Don = CHI_TIET_HD_BAN_HANG.Ma_Hoa_Don
  AND CHI_TIET_HD_BAN_HANG.Ma_Hang_Hoa = HANG_HOA.Ma_Hang_Hoa
GROUP BY HOA_DON_BAN_HANG.Ma_Hoa_Don, NHAN_VIEN.Ten_Nhan_Vien, KHACH_HANG.Ten_Khach_Hang, HOA_DON_BAN_HANG.Date_HDBH
GO
CREATE PROC UP_GetListTable
AS SELECT * FROM DBO.BAN
GO
EXEC UP_GetListTable
GO 

CREATE PROC UP_AddTable
@name NVARCHAR(100)
AS INSERT DBO.BAN(Ten_Ban) VALUES(@name)
GO

CREATE PROC UP_ModifyTable
@ID INT, @name NVARCHAR(100)
AS UPDATE DBO.BAN SET Ten_Ban = @name WHERE Ma_Ban = @ID
GO

CREATE PROC UP_DeleteTable
@ID INT
AS BEGIN
	DELETE DBO.HANG_HOA WHERE Ma_Hang_Hoa = @ID
	IF(@@ROWCOUNT <= 0)
	UPDATE DBO.BAN SET Tinh_Trang = N'Không khả dụng' WHERE Ma_Ban = @ID
	END
GO