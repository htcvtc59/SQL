--Xây dựng một CSDL có tên BookStore 
CREATE DATABASE BookStore 
ON PRIMARY
(NAME='bookstore',FILENAME='C:\Assignment.MSSQL 6\bookstore_data.mdf',SIZE=4MB,MAXSIZE=4GB,FILEGROWTH=5MB),
FILEGROUP BookStore_ndf
(NAME='bookstore2',FILENAME='C:\Assignment.MSSQL 6\bookstore_data2.ndf',SIZE=2MB,MAXSIZE=2GB,FILEGROWTH=5MB)
LOG ON
(NAME='bookstore_log',FILENAME='C:\Assignment.MSSQL 6\bookstore_log.ldf',SIZE=2MB,MAXSIZE=2GB,FILEGROWTH=5MB)
COLLATE SQL_Latin1_General_CP1_CI_AS
GO
--Tạo bảng Sach
CREATE TABLE Sach (
MaSach varchar(30) PRIMARY KEY,
TenSach nvarchar(50) NOT NULL ,
MaTL    varchar(30) NOT NULL,
MaNXB   varchar(30) NOT NULL,
MaTG    varchar(30) NOT NULL,
TenTG  nvarchar(50) NOT NULL,
SoLuongTon  int  NOT NULL DEFAULT(0),
NDTomTat ntext NOT NULL 
)
GO
--Tạo bảng NhaXuatBan
CREATE TABLE NhaXuatBan(
MaNXB varchar(30) PRIMARY KEY ,
TenNXB nvarchar(50) NOT NULL,
DiaChiNXB ntext NOT NULL ,
NamXB int NOT NULL ,
LanXB int NOT NULL 
)
GO
--Tạo bảng TheLoai 
CREATE TABLE TheLoai (
MaTL varchar(30) PRIMARY KEY,
TenTL nvarchar(50)  UNIQUE NOT NULL
)
GO
--Tạo bảng ChiTiet
CREATE TABLE ChiTiet(
MaSach varchar(30) PRIMARY KEY,
MaTL varchar(50) NOT NULL ,
SoLuongBan int  NOT NULL ,
GiaBan int NOT NULL
)
GO

--Thêm khóa ngoại cho các bảng 
ALTER TABLE Sach
ADD FOREIGN KEY (MaNXB) REFERENCES NhaXuatBan(MaNXB)

ALTER TABLE Sach
ADD FOREIGN KEY (MaTL) REFERENCES TheLoai(MaTL)

ALTER TABLE ChiTiet
ADD FOREIGN KEY (MaSach) REFERENCES Sach(MaSach)

ALTER TABLE ChiTiet
ADD UNIQUE(MaSach)


--Tạo mã sách riêng cho từng cuốn sách
CREATE TRIGGER Sach_NEWID 
ON Sach 
FOR INSERT
AS
BEGIN
DECLARE @idsach varchar(10)
SET @idsach='MS' + LEFT(NEWID(),3)
--Lấy 3 kí tự phần bên trái của đoạn mã
WHILE (EXISTS (SELECT MaSach FROM Sach WHERE MaSach=@idsach))
BEGIN
SET @idsach='MS'+ LEFT(NEWID(),3)
END
UPDATE Sach SET MaSach=@idsach WHERE MaSach=''
END
GO

--Tạo mã riêng cho nhà xuất bản
CREATE TRIGGER NXB_NEWID
ON NhaXuatBan
FOR INSERT
AS
BEGIN
DECLARE @idNXB varchar(10)
SET @idNXB='NXB' + LEFT(NEWID(),3)
--Lấy 3 kí tự phần bên trái của đoạn mã
WHILE (EXISTS (SELECT MaNXB FROM Sach WHERE MaNXB=@idNXB))
BEGIN
SET @idNXB='NXB'+ LEFT(NEWID(),3)
END
UPDATE NhaXuatBan SET MaNXB=@idNXB WHERE MaNXB=''
END
GO
--Tạo mã riêng cho thể loại
CREATE TRIGGER TL_NEWID
ON TheLoai
FOR INSERT
AS
BEGIN
DECLARE @idTL varchar(10)
SET @idTL='TL' + LEFT(NEWID(),3)
--Lấy 3 kí tự phần bên trái của đoạn mã
WHILE (EXISTS (SELECT MaTL FROM Sach WHERE MaTL=@idTL))
BEGIN
SET @idTL='TL'+ LEFT(NEWID(),3)
END
UPDATE TheLoai SET MaTL=@idTL WHERE MaTL=''
END
GO

--Tạo mã riêng cho tác giả
CREATE TRIGGER TG_NEWID
ON Sach
FOR INSERT
AS
BEGIN
DECLARE @idTG varchar(10)
SET @idTG='TG' + LEFT(NEWID(),3)
--Lấy 3 kí tự phần bên trái của đoạn mã
WHILE (EXISTS (SELECT MaTG FROM Sach WHERE MaTG=@idTG))
BEGIN
SET @idTG='TG'+ LEFT(NEWID(),3)
END
UPDATE Sach SET MaTG=@idTG WHERE MaTG=''
END
GO
--Nhập dữ liệu Sách
INSERT INTO Sach(MaSach,TenSach,MaTL,MaNXB,MaTG,TenTG,SoLuongTon,NDTomTat) 
VALUES('',N'Khoa học thách thức của thế kỷ 21',N'TL778',N'NXBDDB','',N'Claude Allègre',6,N'Những tiến bộ khoa học trong thế kỷ 21 sẽ còn to lớn hơn trong quá khứ, bởi khoa học sẽ liên quan đến trái đất, con người, sự sống, bộ não, sự sinh sản, cái chết, nghĩa là những vấn đề cơ bản. Nhưng con người có thể làm thay đổi sự sống, mà có thể cả sự chuyển động của hành tinh, khí hậu và chu trình của nước. Khoa học cho phép con người tiến ngày càng sâu hơn vào lãnh địa của Chúa Trời.')
SELECT * FROM Sach
DELETE FROM Sach WHERE MaSach LIKE 'MS7BF'
GO
--Nhập dữ liệu Nhà xuất bản
INSERT INTO NhaXuatBan(MaNXB,TenNXB,DiaChiNXB,NamXB,LanXB)
VALUES('',N'NXB Tri thức',N'53 Nguyễn Du, Hai Bà Trưng, Hà Nội',2012,1)
SELECT * FROM NhaXuatBan
GO
--Nhập dữ liệu cho bảng thể loại
INSERT INTO TheLoai(MaTL,TenTL) 
VALUES('',N'Sách Kỹ Năng')
SELECT * FROM TheLoai
GO
--Nhập dữ liệu cho bảng chi tiết
INSERT INTO ChiTiet(MaSach,MaTL,SoLuongBan,GiaBan) 
VALUES(N'MSA63',N'TL022',3,22000)
SELECT * FROM ChiTiet
DELETE FROM ChiTiet WHERE MaSach LIKE 'MSA63'
GO
-- Liệt kê các cuốn sách có năm xuất bản từ 2008 đến nay 
SELECT TenSach , NamXB FROM Sach
INNER JOIN NhaXuatBan ON Sach.MaNXB=NhaXuatBan.MaNXB
WHERE NamXB BETWEEN 2008 AND DATENAME(YY,GETDATE()) 
ORDER BY NamXB ASC
GO
--Liệt kê 10 cuốn sách có giá bán cao nhất 
SELECT TOP 10 TenSach , GiaBan  FROM Sach
INNER JOIN ChiTiet ON Sach.MaSach=ChiTiet.MaSach
ORDER BY GiaBan DESC
GO
--Tìm những cuốn sách có tiêu đề chứa từ “tin học”
SELECT * FROM Sach
WHERE TenSach LIKE N'%tin học%'
GO
--Liệt kê các cuốn sách có tên bắt đầu với chữ “T” theo thứ tự giá giảm dần 
SELECT * FROM Sach
WHERE TenSach LIKE N't%'
ORDER BY TenSach DESC
GO
--Liệt kê các cuốn sách của nhà xuất bản Tri thức 
SELECT S.MaSach,S.TenSach,S.TenTG,
N.TenNXB,N.DiaChiNXB,
C.GiaBan
FROM Sach AS S
INNER JOIN  NhaXuatBan AS N ON S.MaNXB=N.MaNXB
INNER JOIN ChiTiet AS C ON C.MaSach=S.MaSach
WHERE TenNXB = N'NXB Tri thức'
GO
-- Lấy thông tin chi tiết về nhà xuất bản xuất bản cuốn sách “Trí tuệ Do Thái” 
SELECT S.MaSach,S.TenSach,S.TenTG,T.TenTL,
N.TenNXB,N.DiaChiNXB,S.NDTomTat,
C.GiaBan
FROM Sach AS S
INNER JOIN  NhaXuatBan AS N ON S.MaNXB=N.MaNXB
INNER JOIN ChiTiet AS C ON C.MaSach=S.MaSach
INNER JOIN TheLoai AS T ON T.MaTL=S.MaTL
WHERE TenSach=N'Trí Tuệ Do Thái'
GO
/*Hiển thị các thông tin sau về các cuốn sách
: Mã sách, Tên sách, Năm xuất bản, Nhà xuất bản, Loại sách */
SELECT S.MaSach,S.TenSach,N.TenNXB,N.NamXB,T.TenTL
FROM Sach AS S 
INNER JOIN NhaXuatBan AS N ON N.MaNXB=S.MaNXB
INNER JOIN TheLoai AS T ON T.MaTL=S.MaTL
GO
--Tìm cuốn sách có giá bán đắt nhất 
SELECT TenSach,TenTG,NDTomTat,GiaBan 
FROM Sach
JOIN ChiTiet ON ChiTiet.MaSach=Sach.MaSach
WHERE GiaBan = (SELECT MAX(GiaBan) FROM ChiTiet)
GO
--Tìm cuốn sách có số lượng lớn nhất trong kho
SELECT TenSach,TenTG,NDTomTat,SoLuongTon,SoLuongBan
FROM Sach
JOIN ChiTiet ON Sach.MaSach = ChiTiet.MaSach
WHERE SoLuongTon = (SELECT MAX(SoLuongTon) FROM Sach,ChiTiet)
--OR
/*SELECT TOP 1 TenSach,TenTG,SoLuongTon,SoLuongBan,MAX(SoLuongTon-SoLuongBan) AS SoLuong FROM Sach
JOIN ChiTiet ON Sach.MaSach = ChiTiet.MaSach
GROUP BY TenSach,SoLuongTon,SoLuongBan,TenTG
ORDER BY SoLuong DESC
GO*/
--Tìm các cuốn sách của tác giả “Eran Katz” 
SELECT * FROM Sach
WHERE TenTG=N'Eran Katz'
--Giảm giá bán 10% các cuốn sách xuất bản từ năm 2008 trở về trước 
SELECT S.MaSach,S.TenSach ,S.TenTG,S.NDTomTat, N.NamXB,C.GiaBan,GiaBan*10/100 AS GiaBanGiam FROM Sach AS S
LEFT JOIN NhaXuatBan AS N ON S.MaNXB=N.MaNXB
FULL JOIN ChiTiet AS C ON C.MaSach=S.MaSach
WHERE NamXB <= 2008
ORDER BY NamXB ASC
GO
--Thống kê số đầu sách của mỗi nhà xuất bản

SELECT TenNXB,COUNT(TenNXB) AS TONGSACH
FROM NhaXuatBan 
WHERE TenNXB=TenNXB
GROUP BY TenNXB
GO
--Thống kê số đầu sách của mỗi loại sách
SELECT T.MaTL,T.TenTL,COUNT(S.MaTL) AS TONGSACH
FROM TheLoai T,Sach S
WHERE T.MaTL=S.MaTL
GROUP BY T.TenTL,T.MaTL
GO
--Đặt chỉ mục (Index) cho trường tên sách
CREATE INDEX IX_TenSach
ON Sach(TenSach)
--OR
/*-- Tạo chỉ mục Clustered
CREATE CLUSTERED INDEX IX_TenSach
ON Sach(TenSach)
GO
--Tạo chỉ mục Nonclustered
CREATE NONCLUSTERED INDEX IX_TenSach
ON Sach(TenSach)
GO
--Tạo chỉ mục duy nhất 
CREATE UNIQUE INDEX IX_UQ_TenSach ON Sach(TenSach)
GO
--Xóa chỉ mục IX_TenSach
DROP INDEX IX_TenSach ON Sach(TenSach)*/

GO
--Viết view lấy thông tin gồm: Mã sách, tên sách, tác giả, nhà xb và giá bán
CREATE VIEW V_THONGTIN AS
SELECT S.MaSach,S.TenSach,S.TenTG,N.TenNXB,C.GiaBan
FROM Sach AS S
JOIN NhaXuatBan AS N ON N.MaNXB=S.MaNXB
JOIN ChiTiet AS C ON C.MaSach = S.MaSach
GO
SELECT * FROM V_THONGTIN
--Xóa view
DROP VIEW V_THONGTIN
--Viết Store Procedure: 
--◦ SP_Them_Sach: thêm mới một cuốn sách 
--◦ SP_Tim_Sach: Tìm các cuốn sách theo từ khóa 
--◦ SP_Sach_ChuyenMuc: Liệt kê các cuốn sách theo mã chuyên mục

CREATE PROCEDURE SP_Them_Sach
@MaSach varchar(30) ,
@TenSach nvarchar(50) ,
@MaTG    varchar(30) ,
@TenTG  nvarchar(50) ,
@SoLuongTon  int  ,
@NDTomTat ntext , 
@MaNXB varchar(30) ,
@TenNXB nvarchar(50) ,
@DiaChiNXB ntext  ,
@NamXB int ,
@LanXB int  ,
@MaTL varchar(30) ,
@TenTL nvarchar(50)  ,
@SoLuongBan int  ,
@GiaBan int 

AS BEGIN
--Nhập dữ liệu
INSERT INTO NhaXuatBan(MaNXB,TenNXB,DiaChiNXB,NamXB,LanXB)
VALUES(@MaNXB,@TenNXB,@DiaChiNXB,@NamXB,@LanXB)

INSERT INTO TheLoai(MaTL,TenTL) 
VALUES(@MaTL,@TenTL)

INSERT INTO Sach(MaSach,TenSach,MaTL,MaNXB,MaTG,TenTG,SoLuongTon,NDTomTat) 
VALUES(@MaSach,@TenSach,@MaTL,@MaNXB,@MaTG,@TenTG,@SoLuongTon,@NDTomTat)

INSERT INTO ChiTiet(MaSach,MaTL,SoLuongBan,GiaBan) 
VALUES(@MaSach,@MaTL,@SoLuongBan,@GiaBan)
END
GO
--◦ SP_Tim_Sach: Tìm các cuốn sách theo từ khóa 
CREATE PROCEDURE SP_Tim_Sach
@TenSach nvarchar(50) ,
@TenTG  nvarchar(50) ,
@NamXB int 
AS 
SELECT S.TenSach,S.TenTG,S.NDTomTat,N.NamXB
FROM Sach AS S
JOIN NhaXuatBan AS N ON S.MaNXB=N.MaNXB
WHERE (@TenSach IS NULL OR S.TenSach LIKE '%'+@TenSach+'%')
AND(@TenTG IS NULL OR S.TenTG LIKE '%'+@TenTG+'%')
AND(@NamXB IS NULL OR N.NamXB=@NamXB)

GO
EXECUTE SP_Tim_Sach N'Khoa học thách thức của thế kỷ 21',NULL,NULL

--◦ SP_Sach_ChuyenMuc: Liệt kê các cuốn sách theo mã chuyên mục
CREATE PROCEDURE SP_Sach_ChuyenMuc
@MaTL varchar(30) 
AS
SELECT T.MaTL,T.TenTL,S.TenSach FROM TheLoai AS T
JOIN Sach AS S ON S.MaTL=T.MaTL
WHERE T.MaTL=@MaTL
GO
--Viết trigger không cho phép xóa các cuốn sách vẫn còn trong kho (số lượng > 0) 

CREATE TRIGGER No_Delete
ON Sach
INSTEAD OF DELETE
AS
UPDATE Sach SET Deleted = 1 WHERE SoLuongTon=0
PRINT N'Bạn được phép xóa những cuốn sách có Deleted=1
và không được phép xóa cuốn sách có Deleted=0' 
GO
--Chạy thử 
UPDATE Sach SET SoLuongTon=0 WHERE MaTL='TL022'
UPDATE Sach SET Deleted=0 WHERE  MaTL='TL022'
DELETE FROM Sach WHERE TenSach=N'Học Tốt Tin Học Lớp 12'
--Viết trigger chỉ cho phép xóa một danh mục sách khi không còn cuốn sách nào thuộc chuyên mục này.
CREATE TRIGGER ALLOW_DELETE
ON TheLoai
INSTEAD OF DELETE 
AS
BEGIN
DECLARE @SOLUONG INT , @TONG INT
SET @SOLUONG =(SELECT COUNT(S.MaTL) AS SOLUONG FROM TheLoai AS T
JOIN Sach AS S ON S.MaTL=T.MaTL
WHERE S.MaTL=T.MaTL 
GROUP BY S.MaTL,T.TenTL
HAVING COUNT(S.MaTL)=SUM(S.Deleted))
SET @TONG =(SELECT SUM(S.Deleted) AS TONG FROM TheLoai AS T
JOIN Sach AS S ON S.MaTL=T.MaTL
WHERE S.MaTL=T.MaTL 
GROUP BY S.MaTL,T.TenTL
HAVING COUNT(S.MaTL)=SUM(S.Deleted))
IF (@SOLUONG=@TONG)
BEGIN
UPDATE TheLoai SET DeletedTL=1 WHERE MaTL=(SELECT S.MaTL FROM Sach AS S
JOIN TheLoai AS T ON S.MaTL=T.MaTL
WHERE S.MaTL=T.MaTL AND SoLuongTon=0
GROUP BY S.MaTL,T.TenTL)
END
PRINT N'Bạn được phép xóa những danh mục có DeletedTL=1 vì không có 
cuốn sách nào ở thể loại này!'
END
GO
--Chạy thử
DELETE FROM TheLoai WHERE TenTL=N'Sách Tham Khảo'

UPDATE TheLoai SET DeletedTL=0 WHERE DeletedTL=1
SELECT * FROM Sach WHERE SoLuongTon=0
SELECT * FROM Sach ORDER BY MaTL ASC
SELECT * FROM ChiTiet
SELECT * FROM TheLoai
SELECT * FROM NhaXuatBan




  
