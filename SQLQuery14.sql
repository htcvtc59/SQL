USE AdventureWorks2014
SELECT* FROM Person.Address

DECLARE @sv int
SET @SV = 4
-- OR SELECT @sv = 4
SELECT AddressLine1,City,AddressID FROM Person.Address
WHERE AddressID = @sv

--HIEN THI THONG TIN BIEN TOAN CUC CUA HE THONG
SELECT @@VERSION
SELECT @@LANGUAGE
SELECT @@CONNECTIONS


select SUM(StandardCost) from Production.ProductCostHistory
select avg(StandardCost) from Production.ProductCostHistory
select count(*) from Production.ProductPhoto
select * from Production.ProductPhoto
select max(StandardCost) from Production.ProductCostHistory

--cac ham ngay , gio he thong
select year(GETDATE()) --Hàm này trả về năm 
select month(GETDATE()) --Hàm này trả về tháng 
select day(GETDATE()) --Hàm này trả ngày 
-- tên tháng hiện tại
select datename(M,getdate()) as [Tên tháng hiện tại]
-- năm hiện tại
select datename(YY,getdate()) as [Tên năm hiện tại]

-- Tên quý hiện tại
select datename(QQ,getdate()) as [Tên năm hiện tại]

-- Mấy tháng nữa thì đến 2/9/2013?

select datediff(MM,GETDATE(), '2013-09-02') as [Số tháng từ nay đến 2-09]

-- Mấy ngày nữa thì đến 2/9/2013?

select datediff(DD,GETDATE(), '2013-09-02') as [Số ngày từ nay đến 2-09]

-- Mấy giờ nữa thì đến 2/9/2013?

select datediff(HH,GETDATE(), '2013-09-02') as [Số giờ từ nay đến 2-09]

-- Mấy tuần nữa thì đến 2/9/2013?

select datediff(WW,GETDATE(), '2013-09-02') as [Số tuần từ nay đến 2-09]

-- Lấy năm của ngày hiện tại

select datepart(yy,GETDATE()) as Năm

-- lấy ngày của ngày hiện tại

select datepart(DD,GETDATE()) as Ngày

-- Lấy tháng của tháng hiện tại

select datepart(MM ,GETDATE()) as Tháng

-- Lấy thứ của ngày hiện tại

select datepart(DW ,GETDATE()) as Thứ -- kết quả 1 == Chủ nhật

-- Quý thứ mấy của năm

select datepart(QQ,GETDATE()) as Quý -- kết quả 1 == Chủ nhật

-- Câu query sau cho biết ngày hiện tại là ngày thứ mấy trong năm

select datepart(DY,GETDATE()) as [Ngày thứ mấy của năm] -- kết quả 1 == Chủ nhật

-- Ngày hiện tại thuộc tuần thứ mấy của năm

select datepart(WW,GETDATE()) as [Tuần thứ mấy của năm] -- kết quả 1 == Chủ nhật

select GETDATE();
select DATEPART(HH,GETDATE())
select CONVERT(varchar(50),GETDATE(),103)
SELECT DATEADD(MM,2,'01/04/99')
SELECT DATEDIFF(MM,'01/01/99','05/01/99')
SELECT DATENAME(DW,'03/01/2000')
SELECT DATEPART(DAY,'01/25/1912')
-- CAC HAM TOAN HOC
SELECT ABS(-43) --RETURN 43 // TRA VE GIA TRI TUYET DOI
SELECT CEILING(43.5) --RETURN 44  //TRA VE GIA TRI NHO NHAT LON HON HOAC BANG 
SELECT FLOOR(43.5) --RETURN 43   //TRA VE GIA TRI LON NHAT NHO HON HOAC BANG 
SELECT POWER(5,2) --RETURN 25   // HAM LUY THUA
SELECT ROUND(43.544,2)  --RETURN 43.540 // HAM LAM TRON
SELECT ROUND(43.543,1) --RETURN 43.500  // HAM LAM TRON
SELECT SIGN(-43) --RETURN -1   // TRA VE +1 NEU 43 LA SO DUONG , -1 NEU 43 LA SO AM , 0 NEU 43 LA O
SELECT SQRT(9)  --RETURN 3   //HAM CAN BAC HAI
-- tra ve du lieu he thong
SELECT DB_ID('AdventureWorks2014') --TRA VE SO DIHN DANH CSDL
SELECT DB_NAME(5) --TRA VE TEN CO SO SU LIEU
SELECT FILE_ID('AdventureWorks2014_Data') --//tra ve so id cua tap tin theo ten tap tin luan ly trong csdl
SELECT FILE_NAME(2)  --//tra ve ten luan ly cua tap tin theo so id cua tap tin cho truoc

SELECT HOST_ID() --TRA VE SO DINH DANG CHO MAY
SELECT HOST_NAME() --TRA VE TEN MAY TRAM
SELECT ISNULL(NULL,2) -- NEU NULL LA NULL THI DUOC THAY THE BANG GIA TRI 2
SELECT OBJECT_ID('Person.Address') --SO DINH DANH DOI TUONG
SELECT OBJECT_NAME(373576369)  --TRA VE TEN DOI TUONG
SELECT USER_ID('BUILTIN\Users') --SO DINH DANH NGUOI DUNG
SELECT USER_NAME(1876) -- TEN NGUOI DUNG
USE AdventureWorks2014 
SELECT USER_ID('sa');  
GO 
-- row number 
--ROW_NUMBER ( )   
  --  OVER ( [ PARTITION BY value_expression , ... [ n ] ] order_by_clause )  
SELECT * FROM Person.Address
GO  
SELECT ROW_NUMBER() OVER(ORDER BY StateProvinceID DESC) AS Row  ,
AddressLine1,ROUND(StateProvinceID,1,1)   AS "ONE"  
FROM Person.Address

--dense_rank 
SELECT DENSE_RANK() OVER(ORDER BY StateProvinceID DESC) AS Row  ,
AddressLine1,ROUND(StateProvinceID,1,1)   AS "ONE"  
FROM Person.Address



--tao co so du lieu
create database example2
use example2
--tao bang trong co so du lieu
create table contacts
(MailID VARCHAR(20),
Name NTEXT,
telephoneNumber INT
)
--them mot cot vao bang da co
alter table contacts ADD Address NVARCHAR(50)
--them co so du lieu VAO BANG CUA COT
insert into contacts values('abc@yahoo.com',N'Nguyen Van A',999,N'Ha noi')
insert into contacts values('anhem@yahoo.com',N'Nguyen Van A',92213,N'Ha noi')
insert into contacts values('vippro@yahoo.com',N'Nguyen Van A',92213,N'Ha noi')

--lay ra gia tri trong bang
select * from contacts
--xoa ban ghi vippro@yahoo.com


delete from contacts where MailID='vippro@yahoo.com'
--sua ban ghi co mailid=vippro@yahoo.com

--SUA BAN GHI CO TEN VIPPRO@YAHOO.COM
update contacts set Name=N'Trịnh Hoàng Minh' where MailID='vippro@yahoo.com'


--tao acccount de gan grant
create login example2 with password='1234'

--tao user tu login account vua tao

create user example2 from login example2
--hủy bỏ tất cẩ các quyền user example2 trên bảng contact

revoke all on contacts from example2

--gán LAI quyền select trên bảng contact
grant select on contacts to example2

-- TONG HOP TAT CA DROP VS CSDL  WEB --https://msdn.microsoft.com/en-us/library/cc879259.aspx
DROP TABLE ProductVendor1 
DROP TABLE AdventureWorks2012.dbo.SalesPerson2 
DROP DATABASE Sales
DROP FUNCTION Sales.fn_SalesByStore
DROP PROCEDURE dbo.uspGetSalesbyMonth, dbo.uspUpdateSalesQuotes, dbo.uspGetSalesByYear
DROP PROCEDURE IF EXISTS dbo.uspMyProc
DROP VIEW dbo.Reorder 

USE AdventureWorks2014
SELECT * FROM Person.Address
SELECT City FROM Person.Address
SELECT DISTINCT City,AddressLine1 FROM Person.Address
SELECT * FROM Person.Address WHERE City='Bothell'
SELECT * FROM Person.Address WHERE AddressID = 30
SELECT * FROM Person.Address WHERE AddressID LIKE 5
SELECT * FROM Person.Address WHERE AddressID BETWEEN 10 AND 15
SELECT * FROM Person.Address WHERE AddressID IN ('30','45')
SELECT * FROM Person.Address WHERE City IN ('Detroit','Kenmore')
SELECT *FROM Person.Address WHERE City='Kenmore' AND PostalCode='98028'
SELECT *FROM Person.Address WHERE StateProvinceID='79' AND (City='Bothell' OR City='Monroe')
SELECT *FROM Person.Address ORDER BY City
SELECT *FROM Person.Address ORDER BY City,StateProvinceID
SELECT *FROM Person.Address ORDER BY City DESC
SELECT *FROM Person.Address ORDER BY City ASC , StateProvinceID DESC
SELECT *FROM Person.Address ORDER BY StateProvinceID DESC

SELECT * FROM Sales.Store 
INSERT INTO Sales.Store(BusinessEntityID,Name,SalesPersonID)
VALUES ('1000','One Direction','5123')
UPDATE Sales.Store 
SET Name='Next-Door Bike Store', SalesPersonID='279'
WHERE BusinessEntityID='292'
UPDATE Sales.Store 
SET Name='One Direction', SalesPersonID='279'
SELECT * FROM Sales.SalesPerson
DELETE FROM Sales.SalesPerson WHERE BusinessEntityID='274' AND Bonus='0.00'


-- TAO 1 CSFL 
CREATE DATABASE EXAMPLE
ON PRIMARY (
NAME= N'EXAMPLE_DB',
FILENAME = N'C:\TEMP\EXAMPLE.mdf'
)
LOG ON
(
NAME = N'EXAMPLE_DB_LOG',
FILENAME = N'C:\TEMP\EXAMPLE_DB_LOG.ldf'
)
COLLATE SQL_Latin1_General_CP1_CI_AS

-- thay doi csdl alter
-- alter database database_name
--{
--<add_or_modify_files>
--|<add_or_modify_filegroups>
--|<set_database_options>
--|MODIFY NAME = new_database_name
--|COLLATE collate_name
--}[;]
ALTER DATABASE EXAMPLE
MODIFY NAME = EXAMPLETEST
-- THAY DOI CHU CUA DATABASE
USE EXAMPLETEST
GO
EXECUTE sp_changedbowner @loginame= 'sa'
EXEC sp_changedbowner 'sa'

-- alter database 
--(auto_option)//chon lua tu dong// cac dieu khien tu dong cua csdl
--(cursor_option) //chon lua con tro // cac dieu khien doi xu con tro
-- (recovery_option)//chon lua phuc hoi// cac dieu khien cac mo hinh phuc hoi cua csdl
--(db_state_option)//chon lua trang thai //cac dieu khien trang thai cua csdl , nhu la tinh trang online/office va ket noi cua nguoi dung


--BAN CHUP CUA CSDL
CREATE DATABASE AdventureWorks_dbss1800 ON  
(
NAME = AdventureWorks_Data, FILENAME =   
'C:\TEMP\AdventureWorks_data_1800.ss' 
)
AS SNAPSHOT OF AdventureWorks2014;
GO
--NEU TON TAI CSDL  TEN LA EXAMPLETEST THI XOA DOI TUONG CSDL NAY DI
IF(DB_ID('EXAMPLETEST') IS NOT NULL)
DROP DATABASE EXAMPLETEST


-- TAO CSDL EXAMPLE VOI FILEGROUP
CREATE DATABASE EXAMPLE
ON PRIMARY 
(
NAME = N'EXAMPLE_PRIMARY',
FILENAME=N'C:\TEMP\TEST\EXAMPLE_DB.mdf',
SIZE=1MB,
MAXSIZE=10MB,
FILEGROWTH=1MB
),
FILEGROUP EXAMPLE_FS
(
NAME=N'EXAMPLE_FS_DATA1',
FILENAME=N'C:\TEMP\TEST\EXAMPLE_FS_1.ndf',
SIZE=1MB,
MAXSIZE=10MB,
FILEGROWTH=1MB
),
(
NAME=N'EXAMPLE_FS_DATA2',
FILENAME=N'C:\TEMP\TEST\EXAMPLE_FS_2.ndf',
SIZE=1MB,
MAXSIZE=10MB,
FILEGROWTH=1MB
)
LOG ON
(
NAME=N'EXAMPLE_LOG',
FILENAME=N'C:\TEMP\TEST\EXAMPLE_LOG.ldf',
SIZE=1MB,
MAXSIZE=10MB,
FILEGROWTH=1MB
)
USE EXAMPLE
-- TAO BANG CO TEN SINHVIEN
CREATE TABLE SinhVien(
MaSV int PRIMARY KEY,
TENSV VARCHAR(40),
MaLopHoc int , CONSTRAINT fk FOREIGN KEY (MaLopHoc) 
               REFERENCES LopHoc(MaLopHoc)
)

-- cot null trong tao bang
--NULL DUOC SU DUNG DE CHI RA RANG GI TRI NULL LA DUOC PHEP TRONG COT
--NOT NULL DUOC SU DUNG DE CHI RA RANG GIA TRI NULL LA KHONG DUOC PHEP
CREATE TABLE SanPham(

MaSP int NOT NULL,
TenSP varchar(40) NULL
)

USE EXAMPLE

-- SU DUNG DEFAULT 
CREATE TABLE HOCSINH(
SV VARCHAR(20) NOT NULL,
MAHOC INT NOT NULL,
Price money NOT NULL DEFAULT(100)
)
INSERT INTO HOCSINH(SV,MAHOC)
VALUES('Ries',21)
SELECT * FROM HOCSINH

--IDENTITYCOL //TIM GIA TRI COT NHAN DANG
--OBJECTPROERTY() //XAC DINH NEU MOT BANG CO MOT COT IDENTITY
--COLUMNPROERTY //TIM TEN CUA COT IDENTITY TRONG MOT BANG

CREATE TABLE ContactPhone(
Person_ID int IDENTITY(500,1) NOT NULL,
MobileNumber Bigint NOT NULL
)
SELECT * FROM ContactPhone

INSERT INTO ContactPhone(MobileNumber)
VALUES(16641)

--để tạo và làm việc với cột nhận dạng duy nhất tông thể , chúng ta sử dụng kết hợp từ khóa ROWGUIDCOL , kiểu dữ liệu uniqueidentifier và hàm NEWID

CREATE TABLE CellualerPhone(
Person_ID uniqueidentifier DEFAULT NEWID() NOT NULL,
PersonName varchar(60) NOT NULL
)

INSERT INTO CellualerPhone(PersonName) VALUES('WILLIAMFSF')
GO 
SELECT * FROM CellualerPhone

-- Ràng buộc UNIQUE cũng giống PRIMARY KEY nhưng khác cho phép giá trị NULL ,PRIMARY KEY không được trùng nhau , được sử dụng để tạo một khóa chính và đảm bảo sự toàn vẹn thực thể :
-- Cú pháp:
/*CREATE TABLE <table name> (
Column_name datatype PRIMARY KEY [,column_list]
)
hoặc 
CREATE TABLE <table_name>(
<column_name> <datatype>
[,column_list]
CONSTRAINT constraint_name PRIMARY KEY
)

*/
SELECT * FROM MAD
CREATE TABLE MAD(
Person_ID int PRIMARY KEY,
MobileNumber bigint,
ServiceProvider varchar(30),
LandlineNumber bigint UNIQUE
)
INSERT INTO MAD VALUES(104,8928193232,'PETDA',NULL)

/* Khóa ngoại là một cột có chứa tham chiếu đến một cột tong một bảng khác .
Cột được tham chiếu phải là một khóa chính hoặc có thuộc tính UNIQUE.
Ràng buộc khóa ngoại được sử dụng để đảm bảo toàn vẹn tham chiếu.

Cú pháp:
CREATE TABLE <table_name1>(
[column_list,]
<column_name><datatype> FOREIGN KEY REFERENCES
<table_name2> (pk_column_name) [, column_list]
)
*/
SELECT * FROM PhoneExpenses
CREATE TABLE PhoneExpenses (
Expense_ID int PRIMARY KEY,
MobileNumberd bigint FOREIGN KEY REFERENCES ContactPhone(MobileNumber),
 
Amount bigint CHECK(Amount > 0)
)
INSERT INTO PhoneExpenses values(102,01029123,500)

/* Thêm cột vào bảng cú pháp:
ALTER TABLE <table_name>
 ADD<column_name1><data_type1>[,<column_name2><data_type2>,...]
 */
 ALTER TABLE ContactPhone
 ADD Changed money
 -- Sửa cột với alter
 ALTER TABLE ContactPhone
 ALTER COLUMN Price int 

 ALTER TABLE ContactPhone
 DROP COLUMN Changed

-- THÊM RÀNG BUỘC 
 ALTER TABLE ContactPhone
 ADD CONSTRAINT Price CHECK (Price > 0 )
 --XÓA RÀNG BUỘC
ALTER TABLE ContactPhone
DROP CONSTRAINT Price 


CREATE TABLE LopHoc(
MaLopHoc INT PRIMARY KEY IDENTITY,
TenLopHoc VARCHAR(10)
)

CREATE TABLE SinhVien(
MaSV int PRIMARY KEY,
TenSv varchar(40),
MaLopHoc int,
CONSTRAINT fk FOREIGN KEY (MaLopHoc) REFERENCES LopHoc(MaLopHoc)
)
SELECT * FROM SinhVien

CREATE TABLE SanPham(
MaSP int NOT NULL, -- không cho phép để trống
TenSP varchar(40) NOT NULL
)

CREATE TABLE StoreProduct(
ProductID int NOT NULL,
Name varchar(40) NOT NULL,
Price money NOT NULL DEFAULT(100)
)

-- Tạo bảng với thuộc tính UNIQUE
CREATE TABLE ContactAddress(
Person_ID int PRIMARY KEY,
MobileNumber bigint UNIQUE,
ServiceProvider varchar(30),
Landline bigint UNIQUE
)
select * from ContactAddress
INSERT INTO ContactAddress VALUES(102,32313,'peter',332)


SELECT * FROM PhoneExpenses
CREATE TABLE PhoneExpenses (
Expense_ID int PRIMARY KEY,
MobileNumber bigint FOREIGN KEY REFERENCES ContactAddress(MobileNumber),
Amount bigint CHECK(Amount > 0)
)

-- Creating and Altering Tables

CREATE TABLE [dbo].[Aztech](
[AZ_ID] [numeric](18,0) NOT NULL,
[AZ_name] [varchar] (50) NOT NULL,
[AZ_number] [numeric] (18,0) NOT NULL
)
SELECT * FROM Aztech


--Index
CREATE DATABASE EXAMPASS

CREATE TABLE Classes(
ClassesID int IDENTITY,
ClassesName nvarchar(10),
CONSTRAINT PK_Classes PRIMARY KEY(ClassesID),
CONSTRAINT FK_ClassesClassesName UNIQUE(ClassesName)
)

CREATE TABLE Students(
RollNo varchar(6) CONSTRAINT PK_Students PRIMARY KEY,
FullName nvarchar(50) NOT NULL,
Email varchar(100) CONSTRAINT UQ_StudentsEmail UNIQUE,
ClassName nvarchar(10) CONSTRAINT FK_Students_Classes FOREIGN KEY REFERENCES Classes(ClassesName) ON UPDATE CASCADE
)

CREATE INDEX IX_EAMIL ON Students(Email)
drop table Subjects
CREATE TABLE Subjects(
SubjectID int,
SubjectName nvarchar(100)
)

-- Tạo chỉ mục Clustered
CREATE CLUSTERED INDEX IX_SubjectID
ON Subjects(SubjectID)

--Tạo chỉ mục Nonclustered
CREATE NONCLUSTERED INDEX IX_SubjectName
ON Subjects(SubjectName)

--Tạo chỉ mục duy nhất 
CREATE UNIQUE INDEX IX_UQ_SubjectName ON Subjects(SubjectName)
--Tạo chỉ mục kết hợp
CREATE INDEX IX_Name_Email ON Students(FullName,Email)
--Xóa chỉ mục IX_SubjectID
DROP INDEX IX_SubjectID ON Subjects

--Tạo chỉ mục IX_SubjectID mới với tùy chọn FILLFACTOR
CREATE CLUSTERED INDEX IX_SubjectID ON Subjects(SubjectID) WITH (FILLFACTOR=60)
--Xóa chỉ mục IX_SubjectID
DROP INDEX IX_SubjectID ON Subjects
--Tạo chỉ mục IX_SubjectID mới với tùy chọn PAD_INDEX và FILLFACTOR
CREATE CLUSTERED INDEX IX_SubjectID ON Subjects(SubjectID) WITH (PAD_INDEX=ON,FILLFACTOR=60)

--Xem định nghĩa chỉ mục dùng sp_helptext
EXEC sp_helpindex 'Subjects'
--hoặc
EXECUTE sp_helpindex 'Subjects'
GO
--Xây dựng lại chỉ mục IX_SubjectName
ALTER INDEX IX_SubjectName ON Subjects REBUILD
--Xây dựng lại chỉ mục IX_SubjectName với tùy chọn FILLFACTOR
ALTER INDEX IX_SubjectName ON Subjects REBUILD WITH (FILLFACTOR=60)
--Vô hiệu hóa chỉ mục IX_SubjectName
ALTER INDEX IX_SubjectName ON Subjects DISABLE
--Làm chỉ mục IX_SubjectName tổ chức lại
ALTER INDEX IX_SubjectName ON Subjects REORGANIZE
--Thay đổi chỉ mục IX_SubjectName Thành ONLINE chỉ áp dụng trên bản Enterprise
ALTER INDEX IX_SubjectName ON Subjects REBUILD WITH(ONLINE=ON)
--Thao tác với chỉ mục song song
ALTER INDEX IX_SubjectName ON Subjects REBUILD WITH(MAXDOP=4)
--Chỉ mục với nhiều cột 
CREATE INDEX IX_FullName_Include ON Students(FullName) INCLUDE(Email,ClassName)
--Truy vấn sau sẽ sử dụng chỉ mục IX_FullName_Include
SELECT FullName,Email,ClassName FROM Students WHERE FullName LIKE '%a%'
--Xóa chỉ mục 
DROP INDEX IX_FullName_Include ON Students
--Tạo thống kê chỉ mục
CREATE STATISTICS Statistics_Subjects ON Subjects(SubjectID)
--Cập nhật thống kê chỉ mục
UPDATE STATISTICS Subjects Statistics_Subjects
--Xem thống kê chỉ mục
DBCC SHOW_STATISTICS(Subjects,Statistics_Subjects)

-- view

--Tạo khung nhìn lấy ra thông tin cơ bản trong bảng Person.Person
CREATE VIEW V_contact_info AS
SELECT FirstName,MiddleName,LastName
FROM Person.Person
--Tạo khung nhìn lấy ra thông tin về nhân viên
CREATE VIEW V_Employee_Contact AS
SELECT p.FirstName,p.LastName,e.BusinessEntityID,e.HireDate
FROM HumanResources.Employee e
JOIN Person.Person AS p ON e.BusinessEntityID = p.BusinessEntityID
GO
--Xem một khung nhìn
SELECT * FROM V_Employee_Contact
--Thay đổi khung nhìn V_Employee_Contact bảng việt thêm cột Birthdate
ALTER VIEW V_Employee_Contact AS
SELECT p.FirstName,p.LastName,e.BusinessEntityID,e.HireDate
FROM HumanResources.Employee e
JOIN Person.Person AS p ON e.BusinessEntityID = p.BusinessEntityID
WHERE p.FirstName like'%B%'
GO
--Xóa một khung hình
DROP VIEW V_contact_Info
GO
--xem định nghĩa khung nhìn V_Employee_Contact
sp_helptext 'V_Employee_Contact'
--Xem các thành phần mà khung hình phụ thuộc
sp_depends 'V_Employee_Contact'
GO
--Tạo khung nhìn ẩn mà định nghĩa bị ẩn đi(không xem được định nghĩa khung nhìn)
CREATE VIEW OrderRejects
WITH ENCRYPTION
AS
SELECT PurchaseOrderID,ReceivedQty,RejectedQty,
RejectedQty / ReceivedQty AS RejectRatio,DueDate
FROM Purchasing.PurchaseOrderDetail
WHERE RejectedQty / ReceivedQty > 0
AND DueDate > CONVERT(DATETIME,'20010630',101)
--không xem được định nghĩa khung nhìn V_Contact_Info
sp_helptext 'OrderRejects'
GO
--Thay đổi khung nhìn thêm tùy chọn CHECK OPTION
ALTER VIEW V_Employee_Contact AS
SELECT p.FirstName,p.LastName,p.EmailPromotion,e.BusinessEntityID,e.HireDate
FROM HumanResources.Employee e
JOIN Person.Person AS p ON e.BusinessEntityID = p.BusinessEntityID
WHERE p.FirstName LIKE 'A%'
WITH CHECK OPTION
GO
--cập nhật được khung nhìn LastName bắt đầu bằng ký tự 'A'
UPDATE V_Employee_Contact SET FirstName='Alexx' WHERE LastName='Ciccu'
--không cập nhật được khung nhìn khi LastName bắt đầu bằng ký tự khác 'A'
UPDATE V_Employee_Contact SET FirstName='BCD' WHERE LastName='Alexx'
GO
--Phải xóa khung nhìn trước 
DROP VIEW V_contact_info
GO
--Tạo khung nhìn có giản đồ
CREATE VIEW V_Contact_Info WITH SCHEMABINDING AS
SELECT EmailAddress
FROM Person.EmailAddress
GO
--Không thể truy vấn được khung nhìn có tên là V_Contact_Info
SELECT * FROM V_Contact_Info
GO
--Tạo chỉ mục duy nhất trên cột EmailAddress trên khung nhìn V_Contact_Info
CREATE UNIQUE CLUSTERED INDEX IX_Contact_Email
ON V_Contact_Info(EmailAddress)
GO
--Thực hiện đổi tên khung nhìn
EXEC sp_rename V_Contact_Info,V_Contact_Information
--Truy vấn khung nhìn
SELECT * FROM V_Contact_Information
--Không thể thêm bản ghi vào khung nhìn vì có cột không cho phép NULL trong bảng Contact
INSERT INTO V_Contact_Information VALUES('ABC','DEF','GHI','abc@yahoo.com')
--Không thẻ xóa bản ghi của khung nhìn V_Contact_Information vì bảng Person.EmailAddress còn có khóa ngoại
DELETE FROM V_Contact_Information WHERE LastName='Gilbert' AND FirstName='Guy'
-- store procedure

/* MODULE */
--Tạo một thủ tục lưu trữ lấy ra toàn bộ nhân viên vào làm theo năm có tham số đầu vào là một năm
CREATE PROCEDURE sp_DisplayEmployeeHireYear
@HireYear int
AS
SELECT * FROM HumanResources.Employee
WHERE DATEPART(YY,HireDate) = @HireYear
GO
--Để chạy thủ tục này cần phải truyền tham số vào là năm mà nhân viên vào làm
EXECUTE sp_DisplayEmployeeHireYear 2009
GO
--Tạo thủ tục lưu trữ đếm số người vào làm trong một năm xác định có tham số đầu vào là một năm , tham số đầu ra sẽ là số người vào làm trong năm đó
CREATE PROCEDURE sp_EmployeesHireYearCount
@Hireyear int,
@Count int OUTPUT
AS
SELECT @Count = COUNT(*) FROM HumanResources.Employee
WHERE DATEPART(YY,HireDate)=@Hireyear
GO
--Chạy thủ tục lưu trữ cần phải truyền vào 1 tham số đầu vào và một tham số đầu ra
DECLARE @Number int
EXECUTE sp_EmployeesHireYearCount 2009 , @Number OUTPUT
PRINT @Number
GO
--Tạo thủ tục lưu trữ cần phải truyền vào 1 tham số đầu và lấy về số người làm trong năm đó
CREATE PROCEDURE sp_EmployeesHireYearCount2
@Hireyear int
AS
DECLARE @Count int
SELECT @Count = COUNT(*) FROM HumanResources.Employee
WHERE  DATEPART(YY,HireDate) = @Hireyear
RETURN @Count
GO
--Chạy thủ tục lưu trữ cần phải truyền vào 1 tham số đầu vào và một tham số đầu ra
DECLARE @Number int
EXECUTE @Number=sp_EmployeesHireYearCount2 2009 
PRINT @Number
GO
--Tạo bảng tạm #Students
CREATE TABLE #Students
(
RollNo varchar(6) CONSTRAINT PC_Students PRIMARY KEY,
FullName nvarchar(100),
BirthDay DATETIME CONSTRAINT DF_StudentsBirthDay DEFAULT DATEADD(YY,-18,GETDATE())
)
GO
--Tạo thủ tục lưu trữ tạm để chèn dữ liệu vào bảng tạm
CREATE PROCEDURE #spInsertStudents
@RollNo varchar(6),
@FullName nvarchar(100),
@BirthDay DATETIME
AS BEGIN
IF(@BirthDay IS NULL )
SET @BirthDay=DATEADD(YY,-18,GETDATE())
INSERT INTO #Students(RollNo,FullName,BirthDay)
VALUES(@RollNo,@FullName,@BirthDay)
END
GO
--Sử dụng thủ tục lưu trữ để chèn dữ liệu vào bảng tạm
EXEC #spInsertStudents 'A12345', 'abc',NULL
EXEC #spInsertStudents 'AS5421','abc','12/21/2011'
SELECT * FROM #Students
--Tạo thủ tục lưu trữ tạm để xóa dữ liệu từ bảng tạm RollNo
CREATE PROCEDURE #spDeleteStudents
@RollNo varchar(6)
AS BEGIN
DELETE FROM #Students WHERE RollNo=@RollNo
END
--Xóa dữ liệu sử dụng thủ tục lưu trữ 
EXECUTE #spDeleteStudents 'A1212'
GO
--Tạo một thủ tục lưu trữ sử dụng lệnh RETURN để trả về một số nguyên 
CREATE PROCEDURE Cal_Square @num int =  0 AS
BEGIN
RETURN(@num*@num);
END
GO
--Tạo một thủ tục lưu trữ 
DECLARE @square int;
EXEC @square = Cal_Square 10;
PRINT @square
GO
/*** MODULE B ***/
--Xem định nghĩa thủ tục lưu trữ bảng hàm OBJECT_DEPINITION
SELECT OBJECT_DEFINITION(OBJECT_ID('HumanResources.uspUpdateEmployeePersonalInfo')) AS DEFINITION
--Xem định nghĩa thủ tục lưu trữ bảng
SELECT DEFINITION FROM sys.sql_modules
WHERE OBJECT_ID=OBJECT_ID('HumanResources.uspUpdateEmployeePersonalInfo')
GO

--Thủ tục lưu trữ hệ thống xem các thành phần mà thủ tục lưu trữ phụ thuộc
sp_depends 'HumanResources.uspUpdateEmployeePersonalInfo'
GO
--Tạo thủ tục lưu trữ sp_DisplayEmployee
CREATE PROCEDURE sp_DisplayEmployees AS
SELECT * FROM HumanResources.Employee
GO
--Thay đổi lưu trữ sp_DispalyEmployees
ALTER PROCEDURE sp_DisplayEmployees AS 
SELECT * FROM HumanResources.Employee
WHERE Gender='F'
GO
--Chạy thủ tục lưu trữ sp_DisplayEmployees
EXEC sp_DisplayEmployees
GO
--Xóa một thủ tục lưu trữ
DROP PROCEDURE sp_DisplayEmployees

CREATE PROCEDURE sp_EmployeeHire
AS
BEGIN
--Hiển thị
EXECUTE sp_DisplayEmployeesHireYear 2009
DECLARE @Number int
EXECUTE sp_EmployeesHireYearCount 2009,@Number OUTPUT
PRINT N'Số nhân viên vào làm năm 2009 là : ' + CONVERT(varchar(3),@Number)
END
GO
--Chạy thử thủ tục lưu trữ
EXEC sp_EmployeeHire
GO

--Thay đổi thủ tục lưu trữ sp_EmployeeHire có khối TRY ...CATCH
ALTER PROCEDURE sp_EmployeeHire
@HireYear int
AS
BEGIN
BEGIN TRY
EXECUTE sp_DisplayEmployeeHireYear @HireYear
DECLARE @Number int
--Lỗi xảy ra ở đây có thủ tục sp_EmployeeHireYearCount chỉ truyền 2 tham số mà ta truyền 3
EXECUTE sp_EmployeesHireYearCount @HireYear , @Number OUTPUT,'123'
PRINT N'Số nhân viên vào làm năm là : ' + CONVERT(varchar(3),@Number)
END TRY
BEGIN CATCH
PRINT N'Có lỗi xảy ra trong khi thực hiện thủ tục lưu trữ'
END CATCH
PRINT N'Kết thúc thủ tục lưu trữ'
END 
GO
--Chạy thủ tục sp_EmployeeHire
EXEC sp_EmployeeHire 2009
--Xem thông báo lỗi bên Messages không phải bên Result
GO
--Thay đổi thủ tục lưu trữ sp_EmployeeHire sử dụng hàm @@ERROR
ALTER PROCEDURE sp_EmployeeHire
@HireYear int
AS
BEGIN
EXECUTE sp_DisplayEmployeeHireYear @HireYear
DECLARE @Number int
-- Lỗi xảy ra ở đây có thủ tục sp_EmployeeHireYearCount chỉ truyền 2 tham số mà ta truyền 3
EXECUTE sp_EmployeesHireYearCount @HireYear , @Number OUTPUT,'123'
IF @@ERROR <> 0
PRINT N'Có lỗi xảy ra trong khi thực hiện thủ tục lưu trữ'
PRINT N'Số nhân viên vào làm năm là: ' + CONVERT(varchar(3),@Number)
END
GO
--Chạy thủ tục sp_EmployeeHire
EXEC sp_EmployeeHire 2009 
--Xem thông báo lỗi bên Messages không phải bên Result

--Triggers

--Nếu CSDL test đã tồn tại thì xóa nó đi
IF EXISTS (SELECT * FROM sys.databases WHERE name='test')
DROP DATABASE test
GO
--Tạo một CSDL có tên là test
CREATE DATABASE test
GO
USE test
GO
--Tạo bảng Class
CREATE TABLE Class(
ID INT PRIMARY KEY IDENTITY,
Names VARCHAR(10),
Deleted INT NOT NULL DEFAULT(0)
)
--Tạo bảng Student
CREATE TABLE Student(
ID INT PRIMARY KEY IDENTITY,
Names VARCHAR(30),
Age INT,
ClassID INT FOREIGN KEY REFERENCES Class(ID),
Deleted INT NOT NULL DEFAULT (0)
)
GO
INSERT INTO Class(Names) VALUES('C1605I')
GO
SELECT * FROM Class
GO
--Tạo một INSERT Trigger nhằm đảm bảo giá trị của cột tuổi khi chèn vào là luôn luôn lớn hơn 16
CREATE TRIGGER CheckAgeInsert
ON Student
FOR INSERT
AS
BEGIN
IF EXISTS (SELECT * FROM inserted WHERE Age<16)
BEGIN
PRINT N'TUOI KHONG THE NHO HON 16';
ROLLBACK TRANSACTION;
END
END
GO
--Kiểm ttra sự hoạt động của insert trigger vừa tạo ở trên
--Câu lệnh sau sẽ không thể chè vào vì có tuổi nhỏ hơn 16
INSERT INTO Student VALUES('NGUYEN AN',15,1,0)
--Thỏa mãn điều kiện mới dược insert
GO
/*Tạo một UPDATE trigger nhằm đảm bảo rằng khi tiến hành cập nhật dữ liệu thì tuổi mới phải 
phải luôn lớn hơn  tuổi cũ
*/
CREATE TRIGGER CheckAgeUpdate
ON Student
FOR UPDATE
AS
BEGIN
IF EXISTS (SELECT * FROM inserted I INNER JOIN deleted D
                      ON I.ID=D.ID WHERE D.Age>I.Age)
BEGIN
PRINT N'TUOI MOI KHONG THE NHO HON TUOI TRUOC DO';
ROLLBACK TRANSACTION;
END
END
GO
SELECT * FROM Student
--Kiểm tra hoạt động của trigger vừa tạo
-- Chèn một sinh viên có tuổi là 20 vào bảng Student
INSERT INTO Student VALUES('NGUYEN AN D',21,1,0)
--Tiến hành cập nhật tuoir cho sinh viên trên ,câu lệnh nay sẽ cập nhật được tuổi của sinh viên
--Bởi vì tuoir mới là 19 , trong khi tuổi cũ là 20
UPDATE Student SET Age = 21 WHERE Names LIKE 'NGUYEN AN D'
GO
--Tạo một delete trigger nhằm không cho phép xóa hẳn một student khỏi bảng student
-- thay vào đó ta sẽ chuyển giá trị của cột deleted thành 1
CREATE TRIGGER DeleteStudent
ON Student
FOR DELETE
AS
BEGIN
DECLARE @ID INT;
SELECT @ID = ID FROM deleted;
ROLLBACK TRANSACTION;
UPDATE Student SET Deleted = 1 WHERE ID=@ID;
END
GO

DELETE  FROM Student WHERE Age=21 
/* Kiểm tra sự hoạt động của trigger vừa tạo 
INSERT INTO Student VALUES ('tao',20,1)
Thực hiện xóa một sinh viên có ID =1 , sau khi thực hiện câu lệnh bên dưới thì
bản ghi của sinh viên này không bị xóa đi,mà thay vào đó thì giá trị của cột Deleted
của bản ghi này sẽ có giá trị là 1
*/
--Trigger áp dụng cho xóa nhiều bản ghi
ALTER TRIGGER DeletEStudent
ON Student
FOR DELETE
AS
BEGIN
UPDATE Student SET Deleted=1 WHERE ID IN (SELECT ID FROM deleted);
ROLLBACK TRANSACTION;
END
GO
INSERT INTO Student VALUES('TEO',15,1,0)
SELECT * FROM Student
DELETE FROM Student WHERE Age=20
GO

SELECT * FROM Class
SELECT * FROM Student
CREATE TRIGGER NOT_DELETE
ON Student
FOR DELETE
AS
BEGIN
IF EXISTS (SELECT Age FROM Student WHERE Age>15)

PRINT N'Không được xóa'
ROLLBACK TRANSACTION;

END
GO


