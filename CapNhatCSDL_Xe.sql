use CuaHangXe_Test1

ALTER TABLE Xe
ADD 
    HinhAnh2 NVARCHAR(200),
    HinhAnh3 NVARCHAR(200),
    HinhAnh4 NVARCHAR(200),
    MoTa NVARCHAR(500),
    TrangThai NVARCHAR(50);

select * from Xe

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
select * from Xe




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
WHERE MaXe = N'XE0011';


UPDATE Xe
SET 
    HinhAnh2 = 'XE_0012_1.jpg',
    HinhAnh3 = 'XE_0012_2.jpg',
    HinhAnh4 = 'XE_0012_4.jpg',
    MoTa = N'6.5L V12,770Hp,880Nm',
    TrangThai = N'Xe mới'
WHERE MaXe = N'XE0012';

UPDATE Xe
SET 
    HinhAnh2 = 'Xe0013_1.jpg',
    HinhAnh3 = 'Xe0013_2.jpg',
    HinhAnh4 = 'Xe0013_4.jpg',
    MoTa = N'V12 Hybrid,1.001Hp,1.062Nm',
    TrangThai = N'Xe mới'
WHERE MaXe = N'XE0013';

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


select * from Xe