-- Bảng NhanVien
CREATE TABLE NhanVien (
    MaNhanVien NCHAR(10) PRIMARY KEY,
    TenNhanVien NVARCHAR(50),
    ChucVuNhanVien NVARCHAR(50),
    DiaChiNhanVien NVARCHAR(50),
    SoDienThoaiNhanVien NVARCHAR(15),
    EmailNhanVien NVARCHAR(100),
    TenDangNhap NVARCHAR(50),
    MatKhau NVARCHAR(50),
    VaiTro NVARCHAR(50),
);
-- Bảng KhachHang
CREATE TABLE KhachHang (
    MaKhachHang NCHAR(10) PRIMARY KEY,
    HoTenKhachHang NVARCHAR(50),
    DiaChiKhachHang NVARCHAR(50),
    SoDienThoaiKhachHang NVARCHAR(15),
    EmailKhachHang NVARCHAR(50)
);

-- Bảng NhaCungCap
CREATE TABLE NhaCungCap (
    MaNhaCungCap NCHAR(10) PRIMARY KEY,
    TenNhaCungCap NVARCHAR(50),
    DiaChiNhaCungCap NVARCHAR(50),
    SoDienThoaiNhaCungCap NVARCHAR(15),
    EmailNhaCungCap NVARCHAR(50)
);

-- Bảng Xe
CREATE TABLE Xe (
    MaXe NCHAR(10) PRIMARY KEY,
    TenXe NVARCHAR(100),
    HangXe NVARCHAR(50),
    DongXe NVARCHAR(50),
    SoKhungXe NVARCHAR(50),
    MauSac NVARCHAR(50),
    NamSanXuat int,
    GiaBanXe DECIMAL(20),
    HinhAnh NVARCHAR(200),
    HinhAnh2 NVARCHAR(200),
    HinhAnh3 NVARCHAR(200),
    HinhAnh4 NVARCHAR(200),
    MoTa NVARCHAR(500),
    TrangThai NVARCHAR(50)
);

-- Bảng PhieuNhapKho
CREATE TABLE PhieuNhapKho (
    MaPhieuNhap NCHAR(10) PRIMARY KEY,
    MaXe NCHAR(10),
    MaNhaCungCap NCHAR(10),
    NgayNhap DATE,
    SoLuongNhap INT,
    GiaNhap DECIMAL(20),
    FOREIGN KEY (MaXe) REFERENCES Xe(MaXe),
    FOREIGN KEY (MaNhaCungCap) REFERENCES NhaCungCap(MaNhaCungCap)
);

-- Bảng PhieuXuatKho
CREATE TABLE PhieuXuatKho (
    MaPhieuXuat NCHAR(10) PRIMARY KEY,
    MaXe NCHAR(10),
    MaKhachHang NCHAR(10),
    NgayXuat DATE,
    SoLuongXuat INT,
    GiaXuat DECIMAL(20),
    MaNhanVienKiemTra NCHAR(10),
    TrangThaiDonHang NVARCHAR(50),
    FOREIGN KEY (MaXe) REFERENCES Xe(MaXe),
    FOREIGN KEY (MaKhachHang) REFERENCES KhachHang(MaKhachHang),
    FOREIGN KEY (MaNhanVienKiemTra) REFERENCES NhanVien(MaNhanVien)
);

-- Bảng HopDongMuaBan
CREATE TABLE HopDongMuaBan (
    MaHopDong NCHAR(10) PRIMARY KEY,
    MaKhachHang NCHAR(10),
    MaXe NCHAR(10),
    NgayLapHopDong DATE,
    DieuKhoanHopDong TEXT,
    TongGiaTriHopDong DECIMAL(18,2),
    MaNhanVienPheDuyet NCHAR(10),
    TrangThaiHopDong NVARCHAR(50),
    FOREIGN KEY (MaKhachHang) REFERENCES KhachHang(MaKhachHang),
    FOREIGN KEY (MaXe) REFERENCES Xe(MaXe),
    FOREIGN KEY (MaNhanVienPheDuyet) REFERENCES NhanVien(MaNhanVien)
);

-- Bảng HoaDonBanHang
CREATE TABLE HoaDonBanHang (
    MaHoaDon NCHAR(10) PRIMARY KEY,
    MaHopDong NCHAR(10),
    NgayLapHoaDon DATE,
    TongSoTien DECIMAL(20),
    ThueVAT DECIMAL(18,2),
    SoTienThanhToan DECIMAL(20),
    FOREIGN KEY (MaHopDong) REFERENCES HopDongMuaBan(MaHopDong)
);

-- Bảng DichVu
CREATE TABLE DichVu (
    MaDichVu NCHAR(10) PRIMARY KEY,
    TenDichVu NVARCHAR(100),
    MoTaDichVu NVARCHAR(255),
    ChiPhiDichVu DECIMAL(18,2),
    ThoiGianThucHien NVARCHAR(50),
    MaKhachHang NCHAR(10),
    NgaySuDungDichVu DATE,
    FOREIGN KEY (MaKhachHang) REFERENCES KhachHang(MaKhachHang)
);

-- Bảng BaoHanhXe
CREATE TABLE BaoHanhXe (
    MaBaoHanh NCHAR(10) PRIMARY KEY,
    MaXe NCHAR(10),
    MaKhachHang NCHAR(10),
    NgayBatDauBaoHanh DATE,
    NgayKetThucBaoHanh DATE,
    DieuKhoanBaoHanh TEXT,
    TrangThaiBaoHanh NVARCHAR(50),
    FOREIGN KEY (MaXe) REFERENCES Xe(MaXe),
    FOREIGN KEY (MaKhachHang) REFERENCES KhachHang(MaKhachHang)
);
INSERT [dbo].[NhaCungCap] ([MaNhaCungCap], [TenNhaCungCap], [DiaChiNhaCungCap], [SoDienThoaiNhaCungCap], [EmailNhaCungCap]) VALUES (N'NCC001    ', N'Mercedes-Benz', N'811 Nguyễn Văn Linh, quận 7,TP. Hồ Chí Minh', N'0123456789', N'mercedesq7@gmail.com')
INSERT [dbo].[NhaCungCap] ([MaNhaCungCap], [TenNhaCungCap], [DiaChiNhaCungCap], [SoDienThoaiNhaCungCap], [EmailNhaCungCap]) VALUES (N'NCC002    ', N'August Luxury Motorcars', N'3510 Spectrum Court - Kelowna, BC V1V 2Z1', N'250-860-0444', N'augustlm@gmail.com')
INSERT [dbo].[NhaCungCap] ([MaNhaCungCap], [TenNhaCungCap], [DiaChiNhaCungCap], [SoDienThoaiNhaCungCap], [EmailNhaCungCap]) VALUES (N'NCC003    ', N'Ferrari ViệtNam', N'D7,Tân Thuận,Q7,TpHCM,VietNam', N'84 283 622 0770', N'ferrarivn@gmail.com')
INSERT [dbo].[NhaCungCap] ([MaNhaCungCap], [TenNhaCungCap], [DiaChiNhaCungCap], [SoDienThoaiNhaCungCap], [EmailNhaCungCap]) VALUES (N'NCC004    ', N'Lamborghini Hồ Chí Minh', N'Ks.Hilton,11Công Trường Mê Kinh, Q1,TpHCM,Vietnam', N'84 859 180 088', N'lamborghinivnn@gmail.com')
GO
INSERT [dbo].[Xe] ([MaXe], [TenXe], [HangXe], [DongXe], [SoKhungXe], [MauSac], [NamSanXuat], [GiaBanXe], [HinhAnh]) VALUES (N'XE001     ', N'Ford GT Heritage Edition', N'Ford', N'Hypercar', N'fo001', N'Trắng', 2021, CAST(1436462 AS Decimal(20, 0)), N'fordgt.jpg')
INSERT [dbo].[Xe] ([MaXe], [TenXe], [HangXe], [DongXe], [SoKhungXe], [MauSac], [NamSanXuat], [GiaBanXe], [HinhAnh]) VALUES (N'XE011    ', N'2024 Lamborghini Urus', N'Lamborghini', N'SUV', N'la002', N'Vàng', 2024, CAST(241843 AS Decimal(20, 0)), N'renazzo-lamborghini-urus-performante-unveiled-thailand-motor-expo-2022-7-16699859694741013805461-crop-16699861242161368888932.jpg')
INSERT [dbo].[Xe] ([MaXe], [TenXe], [HangXe], [DongXe], [SoKhungXe], [MauSac], [NamSanXuat], [GiaBanXe], [HinhAnh]) VALUES (N'XE012    ', N'2022 Lamborghini Aventador SVJ ', N'Lamborghini', N'Supercar', N'la003', N'Vàng', 2022, CAST(562000 AS Decimal(20, 0)), N'New-2020-Lamborghini-Aventador-SVJ-Roadster-1597949125 (1).jpg')
INSERT [dbo].[Xe] ([MaXe], [TenXe], [HangXe], [DongXe], [SoKhungXe], [MauSac], [NamSanXuat], [GiaBanXe], [HinhAnh]) VALUES (N'XE013    ', N'2022 Lamborghini Revuelto', N'Lamborghini', N'Supercar', N'la004', N'Xanh', 2024, CAST(574495 AS Decimal(20, 0)), N'2024-lamborghini-revuelto-review.jpg')
INSERT [dbo].[Xe] ([MaXe], [TenXe], [HangXe], [DongXe], [SoKhungXe], [MauSac], [NamSanXuat], [GiaBanXe], [HinhAnh]) VALUES (N'XE002     ', N'Pagani Huayra', N'Pagani', N'Hypercar', N'pa001', N'Xám', 2014, CAST(4000125 AS Decimal(20, 0)), N'640-sieu-xe-Pagani-Huayra-BC.jpg')
INSERT [dbo].[Xe] ([MaXe], [TenXe], [HangXe], [DongXe], [SoKhungXe], [MauSac], [NamSanXuat], [GiaBanXe], [HinhAnh]) VALUES (N'XE003     ', N'Ferrari SF90 Stradale', N'Ferrari', N'Supercar', N'fe001', N'Đỏ', 2021, CAST(464900 AS Decimal(20, 0)), N'sf90.jpg')
INSERT [dbo].[Xe] ([MaXe], [TenXe], [HangXe], [DongXe], [SoKhungXe], [MauSac], [NamSanXuat], [GiaBanXe], [HinhAnh]) VALUES (N'XE004     ', N' 2024 Lamborghini Huracán Tecnica', N'Lamborghini', N'Supercar', N'la001', N'Đen', 2020, CAST(248995 AS Decimal(20, 0)), N'Screenshot 2024-11-07 211457.jpg')
INSERT [dbo].[Xe] ([MaXe], [TenXe], [HangXe], [DongXe], [SoKhungXe], [MauSac], [NamSanXuat], [GiaBanXe], [HinhAnh]) VALUES (N'XE005     ', N'Audi R8 V10 Performance', N'Audi', N'Supercar', N'ad001', N'Trắng', 2022, CAST(193492 AS Decimal(20, 0)), N'audiR8.jpg')
INSERT [dbo].[Xe] ([MaXe], [TenXe], [HangXe], [DongXe], [SoKhungXe], [MauSac], [NamSanXuat], [GiaBanXe], [HinhAnh]) VALUES (N'XE006     ', N'Chevrolet Corvette', N'Chevrolet', N'Supercar', N'cv001', N'Trắng', 2021, CAST(89907 AS Decimal(20, 0)), N'corvette.jpg')
INSERT [dbo].[Xe] ([MaXe], [TenXe], [HangXe], [DongXe], [SoKhungXe], [MauSac], [NamSanXuat], [GiaBanXe], [HinhAnh]) VALUES (N'XE007     ', N'Mercedes-Benz AMG® G 63', N'Mercedes-Benz', N'SUV', N'mc001', N'Trắng', 2022, CAST(162379 AS Decimal(20, 0)), N'g63.jpg')
INSERT [dbo].[Xe] ([MaXe], [TenXe], [HangXe], [DongXe], [SoKhungXe], [MauSac], [NamSanXuat], [GiaBanXe], [HinhAnh]) VALUES (N'XE008     ', N'Rolls-Royce Cullinan', N'Rolls-Royce', N'SUV', N'rr001', N'Đen', 2024, CAST(524575 AS Decimal(20, 0)), N'xehay-Rolls-Royce-Cullinan-review-270120 (4) (1).jpg')
INSERT [dbo].[Xe] ([MaXe], [TenXe], [HangXe], [DongXe], [SoKhungXe], [MauSac], [NamSanXuat], [GiaBanXe], [HinhAnh]) VALUES (N'XE009     ', N'Mercedes-Maybach S-Class', N'Mercedes-Benz', N'Luxury', N'mc002', N'Đen', 2025, CAST(270400 AS Decimal(20, 0)), N'mayback.jpg')
INSERT [dbo].[Xe] ([MaXe], [TenXe], [HangXe], [DongXe], [SoKhungXe], [MauSac], [NamSanXuat], [GiaBanXe], [HinhAnh]) VALUES (N'XE010     ', N'2025 Rolls Royce Ghost', N'Rolls-Royce', N'Luxury', N'rr002', N'Tím', 2025, CAST(264575 AS Decimal(20, 0)), N'Screenshot 2024-11-07 220012.jpg')
INSERT [dbo].[Xe] ([MaXe], [TenXe], [HangXe], [DongXe], [SoKhungXe], [MauSac], [NamSanXuat], [GiaBanXe], [HinhAnh]) VALUES (N'XE014     ', N'2023 Ferrari 812 GTS', N'Ferrari', N'Supercar', N'fe002', N'Đỏ', 2023, CAST(378995 AS Decimal(20, 0)), N'Screenshot 2024-11-07 212609.jpg')
INSERT [dbo].[Xe] ([MaXe], [TenXe], [HangXe], [DongXe], [SoKhungXe], [MauSac], [NamSanXuat], [GiaBanXe], [HinhAnh]) VALUES (N'XE015     ', N'2023 Ferrari 296 GTS', N'Ferrari', N'Supercar', N'fe004', N'Xanh', 2023, CAST(279995 AS Decimal(20, 0)), N'Screenshot 2024-11-07 213142.jpg')
INSERT [dbo].[Xe] ([MaXe], [TenXe], [HangXe], [DongXe], [SoKhungXe], [MauSac], [NamSanXuat], [GiaBanXe], [HinhAnh]) VALUES (N'XE016     ', N'2024 Ferrari Purosangue', N'Ferrari', N'SUV', N'fe003', N'Đỏ', 2024, CAST(439995 AS Decimal(20, 0)), N'Screenshot 2024-11-07 212831.jpg')
INSERT [dbo].[Xe] ([MaXe], [TenXe], [HangXe], [DongXe], [SoKhungXe], [MauSac], [NamSanXuat], [GiaBanXe], [HinhAnh]) VALUES (N'XE017     ', N'2023 Maserati GranCabrio', N'Maserati', N'Supercar', N'mc001', N'Xanh', 2023, CAST(203000 AS Decimal(20, 0)), N'hq720.jpg')
INSERT [dbo].[Xe] ([MaXe], [TenXe], [HangXe], [DongXe], [SoKhungXe], [MauSac], [NamSanXuat], [GiaBanXe], [HinhAnh]) VALUES (N'XE018     ', N'2024 Ferrari MC20', N'Maserati', N'Supercar', N'mc002', N'Trắng', 2024, CAST(243095 AS Decimal(20, 0)), N'mc20-hero.jpg')
INSERT [dbo].[Xe] ([MaXe], [TenXe], [HangXe], [DongXe], [SoKhungXe], [MauSac], [NamSanXuat], [GiaBanXe], [HinhAnh]) VALUES (N'XE019     ', N'2024 Maserati Levante Trofeo', N'Maserati', N'SUV', N'mc003', N'Trắng', 2024, CAST(839995 AS Decimal(20, 0)), N'ea047f6136a932aceb21459f111aa058.jpg')
GO


UPDATE Xe
SET 
    HinhAnh2 = 'XE_001_1.jpg',
    HinhAnh3 = 'XE_001_2.jpg',
    HinhAnh4 = 'XE_001_4.jpg',
    MoTa = N'EcoBoost V6,647Hp,745Nm',
    TrangThai = N'Xe mới,Bản giới hạn'
WHERE MaXe = N'XE001';

UPDATE Xe
SET 
    HinhAnh2 = 'XE_003_1.jpg',
    HinhAnh3 = 'XE_003_2.jpg',
    HinhAnh4 = 'XE_003_4.jpg',
    MoTa = N'V8,hybrid,986Hp,800 Nm',
    TrangThai = N'Xe mới'
WHERE MaXe = N'XE003';

UPDATE Xe
SET 
    HinhAnh2 = 'XE_004_4.jpg',
    HinhAnh3 = 'XE_004_2.jpg',
    HinhAnh4 = 'XE_004_3.jpg',
    MoTa = N'V10,640 Hp,565 Nm',
    TrangThai = N'Xe mới'
WHERE MaXe = N'XE004';

UPDATE Xe
SET 
    HinhAnh2 = 'XE_005_1.jpg',
    HinhAnh3 = 'XE_005_2.jpg',
    HinhAnh4 = 'XE_005_4.jpg',
    MoTa = N'V10,620 Hp,585 Nm',
    TrangThai = N'Xe mới'
WHERE MaXe = N'XE005';

UPDATE Xe
SET 
    HinhAnh2 = 'XE_006_1.jpg',
    HinhAnh3 = 'XE_006_2.jpg',
    HinhAnh4 = 'XE_006_3.jpg',
    MoTa = N'V8,490 Hp,630 Nm',
    TrangThai = N'Xe cũ,1200km'
WHERE MaXe = N'XE006';
UPDATE Xe
SET 
    HinhAnh2 = 'XE_007_1.jpg',
    HinhAnh3 = 'XE_007_2.jpg',
    HinhAnh4 = 'XE_007_4.jpg',
    MoTa = N'AMG V8,536 Hp,530 Nm',
    TrangThai = N'Xe cũ,1200km'
WHERE MaXe = N'XE007';

UPDATE Xe
SET 
    HinhAnh2 = 'XE008_1.jpg',
    HinhAnh3 = 'XE008__2.jpg',
    HinhAnh4 = 'XE008_3.jpg',
    MoTa = N'6.7L V12,572Hp,850Nm',
    TrangThai = N'Xe mới'
WHERE MaXe = N'XE008';
UPDATE Xe
SET 
    HinhAnh2 = 'XE_009_1.jpg',
    HinhAnh3 = 'XE_009_2.jpg',
    HinhAnh4 = 'XE_009_4.jpg',
    MoTa = N'V12,612Hp,900Nm',
    TrangThai = N'Xe mới'
WHERE MaXe = N'XE009';

UPDATE Xe
SET 
    HinhAnh2 = 'XE_010_1.jpg',
    HinhAnh3 = 'XE_010_2.jpg',
    HinhAnh4 = 'XE_010_4.jpg',
    MoTa = N'6.6L V12,562Hp,780Nm',
    TrangThai = N'Xe mới'
WHERE MaXe = N'XE010';

UPDATE Xe
SET 
    HinhAnh2 = 'XE_0011_1.jpg',
    HinhAnh3 = 'XE_0011_2.jpg',
    HinhAnh4 = 'XE_0011_3.jpg',
    MoTa = N'4.0L V10,650Hp,850Nm',
    TrangThai = N'Xe mới'
WHERE MaXe = N'XE011';


UPDATE Xe
SET 
    HinhAnh2 = 'XE_0012_1.jpg',
    HinhAnh3 = 'XE_0012_2.jpg',
    HinhAnh4 = 'XE_0012_4.jpg',
    MoTa = N'6.5L V12,770Hp,880Nm',
    TrangThai = N'Xe mới'
WHERE MaXe = N'XE012';

UPDATE Xe
SET 
    HinhAnh2 = 'Xe0013_1.jpg',
    HinhAnh3 = 'Xe0013_2.jpg',
    HinhAnh4 = 'Xe0013_4.jpg',
    MoTa = N'V12 Hybrid,1.001Hp,1.062Nm',
    TrangThai = N'Xe mới'
WHERE MaXe = N'XE013';

UPDATE Xe
SET 
    HinhAnh2 = 'XE_014_1.jpg',
    HinhAnh3 = 'XE_014_3.jpg',
    HinhAnh4 = 'XE_014_4.jpg',
    MoTa = N'V12,789 Hp,718 Nm',
    TrangThai = N'Xe cũ,8000Miles'
WHERE MaXe = N'XE014';


UPDATE Xe
SET 
    HinhAnh2 = 'XE015_1.jpg',
    HinhAnh3 = 'XE015_2.jpg',
    HinhAnh4 = 'XE015_3.jpg',
    MoTa = N'V6 Hybrid,819Hp,740Nm',
    TrangThai = N'Xe mới'
WHERE MaXe = N'XE015';

UPDATE Xe
SET 
    HinhAnh2 = 'XE_016_1.jpg',
    HinhAnh3 = 'XE_016_2.jpgg',
    HinhAnh4 = 'XE_016_3.jpg',
    MoTa = N'6.5L V12,715 Hp,716 Nm',
    TrangThai = N'Xe mới'
WHERE MaXe = N'XE016';

UPDATE Xe
SET 
    HinhAnh2 = 'XE_017_1.jpg',
    HinhAnh3 = 'XE_017_2.jpgg',
    HinhAnh4 = 'XE_017_3.jpg',
    MoTa = N'4.7L V8,460 Hp,550 Nm',
    TrangThai = N'Xe cũ,2200Miles'
WHERE MaXe = N'XE017';


UPDATE Xe
SET 
    HinhAnh2 = 'XE_018_1.jpg',
    HinhAnh3 = 'XE_018__3.jpg',
    HinhAnh4 = 'XE_018_4.jpg',
    MoTa = N'3.0L V6,621 Hp,730 Nm',
    TrangThai = N'Xe mới'
WHERE MaXe = N'XE018';

UPDATE Xe
SET 
    HinhAnh2 = 'XE_019_1.jpg',
    HinhAnh3 = 'XE_019_2.jpgg',
    HinhAnh4 = 'XE_019_4.jpg',
    MoTa = N'3.0L V6.,350 Hp,500 Nm',
    TrangThai = N'Xe mới'
WHERE MaXe = N'XE019';

UPDATE Xe
SET 
    HinhAnh2 = 'XE_002_1.jpg',
    HinhAnh3 = 'XE_002_2.jpg',
    HinhAnh4 = 'XE_002_3.jpg',
    MoTa = N'V12 6.0L.,730Hp1000 Nm',
    TrangThai = N'Xe cũ,bản giới hạn'
WHERE MaXe = N'XE002';

