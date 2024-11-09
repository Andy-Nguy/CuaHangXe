select * 
from Xe
where HangXe='Lamborghini'

use CuaHangXe_test1;
UPDATE Xe
SET TenXe = 'Lamborghini Huracán Tecnica', HangXe = 'Lamborghini', DongXe = 'Supercar', 
    SoKhungXe = 'la001', MauSac = N'Đen', NamSanXuat = 2024, GiaBanXe = 248995, HinhAnh = 'Screenshot 2024-11-07 211457.jpg'
WHERE MaXe = 'XE004';
INSERT INTO Xe (MaXe, TenXe, HangXe, DongXe, SoKhungXe, MauSac, NamSanXuat, GiaBanXe, HinhAnh) 
VALUES
('XE0011', '2024 Lamborghini Urus', 'Lamborghini', 'SUV', 'la002', N'Vàng', 2024,241843,'renazzo-lamborghini-urus-performante-unveiled-thailand-motor-expo-2022-7-16699859694741013805461-crop-16699861242161368888932.jpg');
INSERT INTO Xe (MaXe, TenXe, HangXe, DongXe, SoKhungXe, MauSac, NamSanXuat, GiaBanXe, HinhAnh) 
VALUES
('XE0012', '2022 Lamborghini Aventador SVJ ', 'Lamborghini', 'Supercar', 'la003', N'Vàng', 2022,562000,'New-2020-Lamborghini-Aventador-SVJ-Roadster-1597949125 (1).jpg');
INSERT INTO Xe (MaXe, TenXe, HangXe, DongXe, SoKhungXe, MauSac, NamSanXuat, GiaBanXe, HinhAnh) 
VALUES
('XE0013', '2022 Lamborghini Revuelto', 'Lamborghini', 'Supercar', 'la004', N'Xanh', 2024,574495,'2024-lamborghini-revuelto-review.jpg');

INSERT INTO Xe (MaXe, TenXe, HangXe, DongXe, SoKhungXe, MauSac, NamSanXuat, GiaBanXe, HinhAnh) 
VALUES 
('XE001', 'Ford GT Heritage Edition', 'Ford', 'Hypercar', 'fo001', N'Trắng', 2021, 1436462, 'fordgt.jpg'),
('XE002', 'Pagani Huayra', 'Pagani', 'Hypercar', 'pa001', N'Xám', 2014, 4000125, '640-sieu-xe-Pagani-Huayra-BC.jpg'),
('XE003', 'Ferrari SF90 Stradale', 'Ferrari', 'Supercar', 'fe001', N'Đỏ', 2021, 464900, 'sf90.jpg'),
('XE004', 'Lamborghini Aventador SVJ', 'Lamborghini', 'Supercar', 'la001', N'Trắng', 2020, 523000, 'Screenshot 2024-11-07 211457.jpg'), 
('XE005', 'Audi R8 V10 Performance', 'Audi', 'Supercar', 'ad001', N'Trắng', 2022, 193492, 'audiR8.jpg'),
('XE006', 'Chevrolet Corvette', 'Chevrolet', 'Supercar', 'cv001', N'Trắng', 2021, 89907, 'corvette.jpg'),
('XE007', 'Mercedes-Benz AMG® G 63', 'Mercedes-Benz', 'SUV', 'mc001', N'Trắng', 2022, 162379, 'g63.jpg'),
('XE008', 'Rolls-Royce Cullinan', 'Rolls-Royce', 'SUV', 'rr001', N'Đen', 2024, 524575, 'xehay-Rolls-Royce-Cullinan-review-270120 (4).jpg'),
('XE009', 'Mercedes-Maybach S-Class', 'Mercedes-Benz', 'Luxury', 'mc002', N'Đen', 2025, 270400, 'mayback.jpg'),
('XE010', 'Rolls Royce Ghost', 'Rolls-Royce', 'Luxury', 'rr002', N'Đen', 2025, 624575, 'rolls-royce-ghost-black.jpg');
INSERT INTO Xe (MaXe, TenXe, HangXe, DongXe, SoKhungXe, MauSac, NamSanXuat, GiaBanXe, HinhAnh) 
VALUES 
('XE008', 'Rolls-Royce Cullinan', 'Rolls-Royce', 'SUV', 'rr001', N'Đen', 2024, 524575, 'xehay-Rolls-Royce-Cullinan-review-270120 (4) (1).jpg')
INSERT INTO Xe (MaXe, TenXe, HangXe, DongXe, SoKhungXe, MauSac, NamSanXuat, GiaBanXe, HinhAnh) 
VALUES 
('XE010', '2025 Rolls Royce Ghost', 'Rolls-Royce', 'Luxury', 'rr002', N'Tím', 2025, 264575, 'Screenshot 2024-11-07 220012.jpg')

delete from Xe
where MaXe='XE004'
INSERT INTO Xe (MaXe, TenXe, HangXe, DongXe, SoKhungXe, MauSac, NamSanXuat, GiaBanXe, HinhAnh) 
VALUES 
('XE004', ' 2024 Lamborghini Huracán Tecnica', 'Lamborghini', 'Supercar', 'la001', N'Đen', 2020, 248995, 'Screenshot 2024-11-07 211457.jpg')




select * 
from Xe
where HangXe='Ferrari'
INSERT INTO Xe (MaXe, TenXe, HangXe, DongXe, SoKhungXe, MauSac, NamSanXuat, GiaBanXe, HinhAnh) 
VALUES 
('XE014', '2023 Ferrari 812 GTS', 'Ferrari', 'Supercar', 'fe002', N'Đỏ', 2023, 378995, 'Screenshot 2024-11-07 212609.jpg'),
('XE015', '2023 Ferrari 296 GTS', 'Ferrari', 'Supercar', 'fe004', N'Xanh', 2023, 279995, 'Screenshot 2024-11-07 213142.jpg'),
('XE016', '2024 Ferrari Purosangue', 'Ferrari', 'SUV', 'fe003', N'Đỏ', 2024, 439995, 'Screenshot 2024-11-07 212831.jpg')
INSERT INTO Xe (MaXe, TenXe, HangXe, DongXe, SoKhungXe, MauSac, NamSanXuat, GiaBanXe, HinhAnh) 
VALUES 
('XE017', '2023 Maserati GranCabrio', 'Maserati', 'Supercar', 'mc001', N'Xanh', 2023, 203000, 'hq720.jpg'),
('XE018', '2024 Ferrari MC20', 'Maserati', 'Supercar', 'mc002', N'Trắng', 2024, 243095, 'mc20-hero.jpg'),
('XE019', '2024 Maserati Levante Trofeo', 'Maserati', 'SUV', 'mc003', N'Trắng', 2024, 839995, 'ea047f6136a932aceb21459f111aa058.jpg')

WHERE MaXe = 'XE0019';
select * from Xe
