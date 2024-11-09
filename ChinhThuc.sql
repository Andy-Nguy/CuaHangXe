-- Bảng NhanVien
CREATE TABLE NhanVien (
    MaNhanVien NCHAR(10) PRIMARY KEY,
    TenNhanVien NVARCHAR(50),
    ChucVuNhanVien NVARCHAR(50),
    DiaChiNhanVien NVARCHAR(50),
    SoDienThoaiNhanVien NVARCHAR(15),
    EmailNhanVien NVARCHAR(100)
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
    HinhAnh NVARCHAR(200)
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


-- Bảng TaiKhoan
CREATE TABLE TaiKhoan (
    MaTaiKhoan NCHAR(10) PRIMARY KEY,
    TenDangNhap NVARCHAR(50),
    MatKhau NVARCHAR(50),
    VaiTro NVARCHAR(50),
    MaNhanVien NCHAR(10),
    FOREIGN KEY (MaNhanVien) REFERENCES NhanVien(MaNhanVien)
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
INSERT [dbo].[Xe] ([MaXe], [TenXe], [HangXe], [DongXe], [SoKhungXe], [MauSac], [NamSanXuat], [GiaBanXe], [HinhAnh]) VALUES (N'XE0011    ', N'2024 Lamborghini Urus', N'Lamborghini', N'SUV', N'la002', N'Vàng', 2024, CAST(241843 AS Decimal(20, 0)), N'renazzo-lamborghini-urus-performante-unveiled-thailand-motor-expo-2022-7-16699859694741013805461-crop-16699861242161368888932.jpg')
INSERT [dbo].[Xe] ([MaXe], [TenXe], [HangXe], [DongXe], [SoKhungXe], [MauSac], [NamSanXuat], [GiaBanXe], [HinhAnh]) VALUES (N'XE0012    ', N'2022 Lamborghini Aventador SVJ ', N'Lamborghini', N'Supercar', N'la003', N'Vàng', 2022, CAST(562000 AS Decimal(20, 0)), N'New-2020-Lamborghini-Aventador-SVJ-Roadster-1597949125 (1).jpg')
INSERT [dbo].[Xe] ([MaXe], [TenXe], [HangXe], [DongXe], [SoKhungXe], [MauSac], [NamSanXuat], [GiaBanXe], [HinhAnh]) VALUES (N'XE0013    ', N'2022 Lamborghini Revuelto', N'Lamborghini', N'Supercar', N'la004', N'Xanh', 2024, CAST(574495 AS Decimal(20, 0)), N'2024-lamborghini-revuelto-review.jpg')
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
select * from Xe