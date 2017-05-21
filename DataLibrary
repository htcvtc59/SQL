	use master 
	go

	if(DB_ID('Project') is not null)
	drop database Project

	go

	create database Project
	go
	use Project
	go
	create table tblCategory (
		CategoryId varchar(10)  primary key,
		CategoryName nvarchar(100) not null
	)
	go
	insert into tblCategory values
	('TL01', N'Trinh Thám'),
	('TL02', N'Viễn Tưởng'),
	('TL03', N'Kinh Dị'),
	('TL04', N'Ngôn Tình'),
	('TL05', N'Kiếm Hiệp'),
	('TL06', N'Tâm Lý Tuổi Mới Lớn'),
	('TL07', N'Du Lịch'),
	('TL08', N'Chính Trị');
	go
	create table tblUser(
		UserName varchar(10) primary key,
		UserFullName nvarchar(100) not null,
		Password varchar(50) not null
	)
	go
	insert into tblUser values
	('admin', N'Đinh Văn Trơn', 'admin'),
	('vuong789', N'Nguyễn Văn Vương', '123465'),
	('hieu456', N'Đinh Huy Hiếu', '123456'),
	('vy321', N'Phạm Quang Vỹ', '123456'),
	('hung654', N'Phạm Thanh Hùng', '123456');
	go
	create table tblPublisher(
		PublisherId varchar(10) primary key,
		PublisherName nvarchar(100) not null,
		Address nvarchar(200),
		Phone varchar(15),
		Email varchar(100)
	)
	go
	insert into tblPublisher values
	('NXB01', N'NXB Kim Đồng', N'Số 55-Quang Trung-Đống Đa-Hà Nội', '(04)3943 4730', 'cnkimdong@nxbkimdong.com.vn'),
	('NXB02', N'NXB Phương Nam', N'496-Nguyễn Thị Minh Khai-P.2-Q.3-TP.HCM', '(28)3832 1849', ' info@phuongnambook.com.vn'),
	('NXB03', N'NXB Đại Học Quốc Gia HN', N'Nhà G4-144 Xuân Thủy Cầu Giấy-Hà Nội', '(04)3971 4899', 'nxb@vnu.edu.vn'),
	('NXB04', N'NXB Chính trị quốc gia', N'Số 24 Quang Trung Hoàn Kiếm-Hà Nội', '(04)3822 1633', 'suthat@nxbctqg.vn'),
	('NXB05', N'NXB Trẻ', N'161B Lý Chính Thắng-Phường 7-Quận 3-TP.HCM', '(28)3931 6289', 'hopthubandoc@nxbtre.com.vn'),
	('NXB06', N'NXB CTCP Sách Alpha', N'Số 31-Lô 1A-KĐT Trung Yên-Trung Kính-CG-HN', '(04)3722 6234', 'info@alphabooks.vn'),
	('NXB07', N'NXB Nhà Sách Việt', N'Số 2A CG-P. Ngọc Khánh-Q.Ba Đình-HN', '0989715656', 'xangnguyen@ibooks.vn'),
	('NXB08', N'NXB Dân Trí', N'Số 9-Ngõ 26 Hoàng Cầu-Đống Đa-Hà Nội', '(04)6686 0751', 'nxbdantri@gmail.com');
	go
	create table tblReader(
		ReaderId varchar(10) primary key,
		ReaderName nvarchar(100) not null,
		Briday datetime,
		Phone varchar(15) not null,
		Email varchar(100) not null,
		Address nvarchar(100) not null
	)
	go
	insert into tblReader values
	('R01', N'Đinh Văn Trơn', '1996-01-01', '0123456789', 'htcvtc59@gmail.com', N'Hà Nội- Việt Nam'),
	('R02', N'Nguyễn Văn Vương', '1992-02-25', '0909090909', 'vuong456@gmail.com', N'Cao Bằng-Bắc Cạn'),
	('R03', N'Đinh Huy Hiếu', '1995-03-29', '0986829201', 'hieudhd00204@fpt.edu.vn', N'Việt Bắc-Tây Bắc'),
	('R04', N'Phạm Quang Vỹ', '1992-04-26', '0987654321', 'vy789@gmail.com', N'Bắc Ninh-Việt Nam'),
	('R05', N'Phạm Thanh Hùng', '2016-05-12', '0456789321', 'hung654@gmail.com', N'Lào Cai-Việt Nam'),
	('R06', N'Trần Thị Mộng Mơ', '1999-12-06', '0123654781', 'ttmm999@gmail.com', N'Canada-Trái Đất'),
	('R07', N'Nguyễn Tài Vận Lộc Thọ', '1989-10-09', '084652139', 'ntvlt139@gmail.com', N'London-Anh'),
	('R08', N'Nguyễn Thị Y Nguyên', '1974-10-07', '097845369', 'ntyn9954@gmail.com', N'Mỹ Tho-Việt Nam'); 
	go
	create table tblDocument(
	
		DocumentId varchar(10) primary key,
		DocumentName nvarchar(100) not null,
		Description nvarchar(100),
		CategoryId varchar(10) foreign key references tblCategory(CategoryId),
		PublisherId varchar(10) foreign key references tblPublisher(PublisherId),
		Quantity int not null default 0,
		Price varchar(50) not null default 0,
		YearDocument varchar(20) not null,
		Edition int not null default 1,
		Author nvarchar(100) not null
		
	)
	go
	insert into tblDocument values
	('D01', N'Ring – Vòng Tròn Ác Nghiệt', N'Cái chết đến từ một cuộn băng. Hai đôi nam nữ vị thành niên lần lượt chết […]', 'TL03', 'NXB03', 10, 63510, '2011', 2, 'Suzuki Koji'),
	('D02', N'Điều Kỳ Diệu Của Tiệm Tạp Hóa', N'Một đêm vội vã lẩn trốn sau phi vụ khoắng đồ nhà người […]', 'TL02', 'NXB02', 4, 85500, '2012', 1, 'Higachino Keigo'),
	('D03', N'Bí Ẩn Quân Hậu Đen', N'Một bức tranh cổ với dòng chữ kỳ lạ ẩn sâu bên dưới lớp màu vẽ.[…]', 'TL01', 'NXB01', 5, 96400, '2013', 6, 'Arturo Pérez-Reverte'),
	('D04', N'Cuộc Gặp Gỡ Mùa Hè', N'Ai đó đã nói rằng mọi thứ đi qua cuộc đời chúng ta đều là duyên phận.[…]', 'TL04', 'NXB04', 9, 64550, '2010', 3, 'Takashi Hiraide'),
	('D05', N'Lai Rai Chén Rượu Giang Hồ', N'Tuyển tập những bài viết của tác giả về nhân vật và các khía cạnh khác trong tác phẩm kiếm hiệp', 'TL05', 'NXB05', 7, 89780, '2016', 2, N'Huỳnh Ngọc Chiến'),
	('D06', N'Điều Kỳ Diệu Của Tiệm Tạp Hóa', N'Một đêm vội vã lẩn trốn sau phi vụ khoắng đồ nhà người, Atsuya, Shota và Kouhei đã rẽ vào […]', 'TL02', 'NXB02', 11, 85560, '2012', 1, 'Higachino Keigo'),
	('D07', N'80 Lời Bố Gửi Con Trai', N'Tuổi dậy thì tràn đầy niềm vui: sự thay đổi về sinh lý báo hiệu một thiếu niên khờ dại […]', 'TL06', 'NXB06', 30, 71200, '2000', 7, 'Khánh Ngọc (Biên Soạn)'),
	('D08', N'100 Bí Quyết Nuôi Dạy Con Gái Thành Công', N'Trong cuộc sống, có một quan niệm bất thành văn rằng: con gái dễ nuôi dạy, bảo ban hơn con trai […]', 'TL06', 'NXB08', 25, 65300, '2003', 16, 'Higachino Keigo'),
	('D09', N'Du Học Trên Đất Mỹ', N'Cuốn sách này dành cho: Những ai sắp hoặc ước mơ tương lai sẽ bước trên con đường du học. […]', 'TL07', 'NXB07', 30, 79650, '2011', 11, 'Higachino Keigo'),
	('D10', N'A Đây Rồi Hà Nội 7 Món', N'A đây rồi Hà Nội 7 món là tuyển tập những bài viết của nhà văn Trần Chiến về Hà Nội […]', 'TL07', 'NXB01', 60, 99900, '2009', 9, 'Higachino Keigo'),
	('D11', N'Khổng Tử Mưu Lược Tung Hoành', N'Ở Trung Quốc, Khổng Tử được gọi là bậc “thánh nhân” […]', 'TL08', 'NXB03', 54, 89500, '2015', 20, 'Higachino Keigo');
	go
	create table tblBondReader(
		Id int identity primary key,
		ReaderId varchar(10) foreign key references tblReader(ReaderId),
		DocumentId varchar(10) foreign key references tblDocument(DocumentId),
		Quantity int not null,
		DateStart datetime not null default getdate(),
		DateFinish datetime not null
	)
	go
	insert into tblBondReader values
	('R01', 'D01', 3, '2017-03-01 00:00:00', '2017-03-20 00:00:00'),
	('R01', 'D03', 2, '2017-03-01 00:00:00', '2017-03-14 00:00:00'),
	('R01', 'D04', 2, '2017-03-05 00:00:00', '2017-03-09 00:00:00'),
	('R02', 'D02', 1, '2017-03-16 00:00:00', '2017-03-04 00:00:00'),
	('R03', 'D03', 3, '2017-03-03 00:00:00', '2017-03-06 00:00:00'),
	('R04', 'D04', 4, '2017-03-04 00:00:00', '2017-03-08 00:00:00'),
	('R05', 'D05', 2, '2017-03-06 00:00:00', '2017-03-14 00:00:00'),
	('R06', 'D08', 6, '2017-04-09 00:00:00', '2017-04-20 00:00:00'),
	('R08', 'D10', 1, '2017-09-15 00:00:00', '2017-09-30 00:00:00'),
	('R07', 'D11', 8, '2017-01-01 00:00:00', '2017-11-04 00:00:00'),
	('R08', 'D09', 3, '2017-12-20 00:00:00', '2017-03-13 00:00:00');


	go


	create table tblPayReader(
		Id int identity primary key,
		DocumentId varchar(10) foreign key references tblDocument(DocumentId),
		ReaderId varchar(10) foreign key references tblReader(ReaderId),
		QuantityPay int not null default 1,
		DatePay datetime not null default getdate(),
		MoneyBorrow varchar(50),
		MoneyReturn varchar(50),
		MoneyLost varchar(50)
	)
	go

	insert into tblPayReader(DocumentId,ReaderId,QuantityPay,DatePay,MoneyBorrow,MoneyReturn,MoneyLost)
	 values ('D01','R01',1,'2017-03-21',10000,20000,0),
			('D02','R02',1,'2017-03-18',20000,80000,0),
			('D03','R03',2,'2017-03-17',30000,50000,0),
			('D04','R04',2,'2017-03-20',70000,24000,0),
			('D03','R01',1,'2017-03-21',40000,160000,0),
			('D05','R05',2,'2017-03-26',40000,0,0),
			('D08','R06',2,'2017-04-20',0,0,10000),
			('D10','R08',1,'2017-12-01',0,0,20000),
			('D11','R07',2,'2017-11-05',34000,50000,0);
go
--Sach Da Muon
	create procedure SachDaMuon
	(
	 @NgayBD datetime,
	 @NgayKT datetime,
	 @MaSach varchar(20)=null,
	 @MaDG varchar(20) =null
	)
	as
	begin
	if @MaSach is null and @MaDG is null
	begin
	select distinct d.* from tblDocument as d 
	join tblBondReader as b on d.DocumentId=b.DocumentId
	where b.DateStart >= @NgayBD and b.DateStart <=@NgayKT 
	end
	else if @MaSach is not null and @MaDG is null
	begin
	select distinct d.* from tblDocument as d 
	join tblBondReader as b on d.DocumentId=b.DocumentId
	where b.DateStart >= @NgayBD and b.DateStart <=@NgayKT and b.DocumentId = @MaSach
	end
	else if @MaSach is null and @MaDG is not null
	begin
	select distinct d.* from tblDocument as d 
	join tblBondReader as b on d.DocumentId=b.DocumentId
	where b.DateStart >= @NgayBD and b.DateStart <=@NgayKT and b.ReaderId = @MaDG
	end
	else if @MaSach is not null and @MaDG is not null
	begin
	select distinct d.* from tblDocument as d 
	join tblBondReader as b on d.DocumentId=b.DocumentId
	where b.DateStart >= @NgayBD and b.DateStart <=@NgayKT and b.ReaderId = @MaDG and b.DocumentId =@MaSach
	end

	end

	go
--Sach Trong Kho

	create procedure SachTrongKho
	( 
	
		@MaSach varchar(20)=null
	)
	as

	begin
	SET NOCOUNT ON
		DECLARE @MuonSach TABLE ( --  tao ra 1 bien table luu tru masach (Document ID, Soluong(Quantity))
					MaSach varchar(10),
					SoLuongMuon int
				);

				DECLARE @TraSach TABLE (  -- tao ra 1 bien table luu tru masach (Document ID, Soluong(Quantity))
					MaSach varchar(10),
					SoLuongTra int,
					LoaiTra varchar(50)
				);

		if @MaSach is null
			begin

				insert into @MuonSach -- lay du lieu vao bien table
				select b.DocumentId, SUM(b.Quantity)
				from tblDocument as d
				inner join tblBondReader as b on d.DocumentId = b.DocumentId
				group by b.DocumentId ;

				
				insert into @TraSach  -- lay du lieu vao bien table
				select b.DocumentId, SUM(b.QuantityPay),SUM(CONVERT(int,b.MoneyLost))
				from tblDocument as d
				inner join tblPayReader as b on d.DocumentId = b.DocumentId
				
				group by b.DocumentId ;
				-- lay du lieu tu bang tblDocument va 2 bien talbe da tao o tren 

			select d.DocumentId,d.DocumentName,d.Author,d.CategoryId,d.Description,
			d.Edition,d.Price,d.Quantity as DauKy, muontra.SoLuongMuon as Muon, muontra.SoLuongTra as Tra, 'TonKho'  = case 
			when muontra.SoLuongMuon  is null then d.Quantity
			when muontra.SoLuongTra is null  then d.Quantity - muontra.SoLuongMuon
			when muontra.LoaiTra > 0  then d.Quantity - muontra.SoLuongTra
			else d.Quantity + muontra.SoLuongTra - muontra.SoLuongMuon
				
			end
			
			
			from (
				select m.MaSach,m.SoLuongMuon,t.SoLuongTra,t.LoaiTra
				from @MuonSach  as m
				left join @TraSach as t
				on m.MaSach = t.MaSach ) as muontra
				right join tblDocument as d on d.DocumentId = muontra.MaSach



			end
		else
			begin
					
			
				insert into @MuonSach -- lay du lieu vao bien table
				select b.DocumentId, SUM(b.Quantity)
				from tblDocument as d
				inner join tblBondReader as b on d.DocumentId = b.DocumentId
				group by b.DocumentId ;

				insert into @TraSach  -- lay du lieu vao bien table
				select b.DocumentId, SUM(b.QuantityPay),SUM(CONVERT(int,b.MoneyLost))
				from tblDocument as d
				inner join tblPayReader as b on d.DocumentId = b.DocumentId
				group by b.DocumentId ;
				-- lay du lieu tu bang tblDocument va 2 bien talbe da tao o tren 

			select d.DocumentId,d.DocumentName,d.Author,d.CategoryId,d.Description,
			d.Edition,d.Price,d.Quantity as DauKy, muontra.SoLuongMuon as Muon, muontra.SoLuongTra as Tra,
			'TonKho'  = case 
			when muontra.SoLuongMuon  is null then d.Quantity
			when muontra.SoLuongTra is null then d.Quantity - muontra.SoLuongMuon
			when muontra.LoaiTra > 0  then d.Quantity - muontra.SoLuongTra
			else d.Quantity + muontra.SoLuongTra - muontra.SoLuongMuon
			
				
			end
			from (
				select m.MaSach,m.SoLuongMuon,t.SoLuongTra,t.LoaiTra
				from @MuonSach  as m
				full join @TraSach as t
				on m.MaSach = t.MaSach ) as muontra
				inner join tblDocument as d on d.DocumentId = muontra.MaSach and d.DocumentId = @MaSach
				

			
			end
	end
	go

--Sach qua han
create procedure SachQuaHan
(
 @MaSach varchar(20)=null,
 @MaDG varchar(20) =null
)
as
begin
SET NOCOUNT ON
	declare @NgayMuon TABLE
	(
	 DocumentId varchar(20),
	 ReaderId varchar(20),
	 NgayQH int,
	 SoLgMuon int 
	)
	insert into @NgayMuon
	select b.DocumentId,b.ReaderId,SUM(DATEDIFF(DD,b.DateFinish,p.DatePay)),SUM(b.Quantity-p.QuantityPay)
	 from tblBondReader
	 as b left join tblPayReader as p on b.ReaderId=p.ReaderId and b.DocumentId=p.DocumentId
	 group by b.DocumentId ,b.ReaderId

if @MaSach is null and @MaDG is null
begin
select t.*,r.Email from tblReader as r
right join(select n.ReaderId,d.DocumentId,d.DocumentName,d.Description,d.Edition,d.YearDocument,d.Author from tblDocument as d
 left join @NgayMuon as n on d.DocumentId = n.DocumentId 
 where n.NgayQH>0 ) as t  on t.ReaderId =r.ReaderId
end
else if @MaSach is not null and @MaDG is null
begin
select t.*,r.Email from tblReader as r
right join(
select n.ReaderId,d.DocumentId,d.DocumentName,d.Description,d.Edition,d.YearDocument,d.Author from tblDocument as d
 left join @NgayMuon as n on d.DocumentId = n.DocumentId 
 where n.NgayQH>0 and n.DocumentId=@MaSach) as t  on t.ReaderId =r.ReaderId
end
else if @MaSach is null and @MaDG is not null
begin
select t.*,r.Email from tblReader as r
right join(
select n.ReaderId,d.DocumentId,d.DocumentName,d.Description,d.Edition,d.YearDocument,d.Author from tblDocument as d
 left join @NgayMuon as n on d.DocumentId = n.DocumentId 
 where n.NgayQH>0 and n.ReaderId=@MaDG) as t  on t.ReaderId =r.ReaderId
end
else if @MaSach is not null and @MaDG is not null
begin
select t.*,r.Email from tblReader as r
right join(
select n.ReaderId,d.DocumentId,d.DocumentName,d.Description,d.Edition,d.YearDocument,d.Author from tblDocument as d
 left join @NgayMuon as n on d.DocumentId = n.DocumentId 
 where n.NgayQH>0 and n.DocumentId=@MaSach and n.ReaderId=@MaDG) as t  on t.ReaderId =r.ReaderId
end

end
go


--Sach bi mat
create procedure SachBiMat
(
 @MaSach varchar(20)=null,
 @MaDG varchar(20) =null
)
as
begin
SET NOCOUNT ON
declare @SachMat TABLE
 (
 DocumentId varchar(20),
 ReaderId varchar(20),
 TienMat int,
 SoLgMat int 
 )
 insert into @SachMat
 select b.DocumentId ,p.ReaderId,SUM(CONVERT(int,p.MoneyLost)),SUM(p.QuantityPay)
 from tblDocument
 as b left join tblPayReader as p on b.DocumentId=p.DocumentId
 group by b.DocumentId ,p.ReaderId

if @MaSach is null and @MaDG is null
begin
select d.*,m.SoLgMat from tblDocument as d
left join @SachMat as m on d.DocumentId = m.DocumentId
where m.TienMat>0 
end
else if @MaSach is not null and @MaDG is null
begin
select d.*,m.SoLgMat from tblDocument as d
left join @SachMat as m on d.DocumentId = m.DocumentId and m.DocumentId=@MaSach
where m.TienMat>0 
end
else if @MaSach is null and @MaDG is not null
begin
select d.*,m.SoLgMat from tblDocument as d
left join @SachMat as m on d.DocumentId = m.DocumentId and m.ReaderId=@MaDG
where m.TienMat>0 
end
else if @MaSach is not null and @MaDG is not null
begin
select d.*,m.SoLgMat from tblDocument as d
left join @SachMat as m on d.DocumentId = m.DocumentId and m.DocumentId=@MaSach and m.ReaderId=@MaDG
where m.TienMat>0 
end

end

go

--Doanh thu từ mượn sách và phạt quá hạn, mất 
create procedure DoanhThu
(
 @MaSach varchar(20)=null,
 @MaDG varchar(20) =null
)
as
begin
SET NOCOUNT ON
declare @TongTien TABLE
(
	MaSach varchar(20),
	MaDG varchar(20),
	TienMuon int,
	TienQuaHan int,
	TienMat int
)
insert into @TongTien
select DocumentId,ReaderId,SUM(CONVERT(int,MoneyBorrow)),SUM(CONVERT(int,MoneyReturn)),SUM(CONVERT(int,MoneyLost)) from tblPayReader
group by DocumentId,ReaderId

if @MaSach is null and @MaDG is null
begin
select d.DocumentId,t.MaDG,d.DocumentName,d.Price,t.TienMuon,t.TienQuaHan,t.TienMat
 from @TongTien as t join tblDocument as d on d.DocumentId=t.MaSach

end
else if @MaSach is not null and @MaDG is null
begin
select d.DocumentId,t.MaDG,d.DocumentName,d.Price,t.TienMuon,t.TienQuaHan,t.TienMat
 from @TongTien as t join tblDocument as d on d.DocumentId=t.MaSach
 where t.MaSach =@MaSach
end
else if @MaSach is null and @MaDG is not null
begin
select d.DocumentId,t.MaDG,d.DocumentName,d.Price,t.TienMuon,t.TienQuaHan,t.TienMat
 from @TongTien as t join tblDocument as d on d.DocumentId=t.MaSach
 where t.MaDG =@MaDG

end
else if @MaSach is not null and @MaDG is not null
begin
select d.DocumentId,t.MaDG,d.DocumentName,d.Price,t.TienMuon,t.TienQuaHan,t.TienMat
 from @TongTien as t join tblDocument as d on d.DocumentId=t.MaSach
 where t.MaSach =@MaSach and t.MaDG = @MaDG
end
end
go

--Tan suat muon tung cuon sach 
create procedure TuanSuatMuon
(
 @NgayBD datetime,
 @NgayKT datetime,
 @MaSach varchar(20)
)
as
begin
select d.DocumentId ,d.DocumentName,b.DateStart,b.Quantity
from tblDocument as d
left join tblBondReader as b on d.DocumentId = b.DocumentId
where b.DocumentId = @MaSach and b.DateStart>=@NgayBD and b.DateStart<=@NgayKT
end

go
--XepHang
create procedure XepHangSach
as
begin
SET NOCOUNT ON
declare @NgayDauKy datetime
set @NgayDauKy = DATEADD(DD,-30,GETDATE())
declare @XepHang TABLE
(
DocumentId varchar(20),
SoLg int
)
insert into @XepHang 
select DocumentId,SUM(Quantity) from tblBondReader where DateStart >= @NgayDauKy and DateStart <=GETDATE()
group by DocumentId
select top 5 x.DocumentId ,d.DocumentName,d.PublisherId,d.Description,d.Author,d.Price,x.SoLg from @XepHang as x
join tblDocument as d on x.DocumentId = d.DocumentId  order by SoLg DESC
end
go
--Doc Gia den han tra sach
create procedure HanTraSach 
as
 begin
	select b.ReaderId ,r.ReaderName,r.Email,d.DocumentName ,d.DocumentId, CONVERT(varchar,b.DateFinish,103) as DateFinish
	from tblDocument as d
	join tblBondReader as b on d.DocumentId=b.DocumentId
	join tblReader as r on r.ReaderId = b.ReaderId
	where DATEDIFF(DD,DateFinish,GETDATE()) between 0 and 3
 end
go
--Khi an mat sach se cap nhat tien mat
create procedure TienMatSach
(
@MaSach varchar(30),
@SoLg int
)
as
declare @TienMat int
begin
select @TienMat = (Price * @SoLg) from tblDocument where DocumentId=@MaSach
return @TienMat
end
go

--Tien Phai Tra
create procedure TienTra
(
@MaSach varchar(30),
@SoLg int
)
as
declare @TienSach int
begin
select @TienSach = (Price*@SoLg*10/100) from tblDocument where DocumentId = @MaSach
return @TienSach
end
go

--Tien Qua Han
create procedure TienQuaHan
(
@NgayTra datetime,
@MaSach varchar(30),
@MaDG varchar(30),
@SoLg int
)
as
declare @TienQH int 
declare @DateFinish datetime
set @DateFinish = (select DateFinish from tblBondReader where DocumentId=@MaSach and ReaderId = @MaDG)
begin
if DATEDIFF(DD,@DateFinish,@NgayTra)>0
begin
select @TienQH = (Price * @SoLg * 35/100) from tblDocument where DocumentId = @MaSach
end
return @TienQH
end
go
--Tong Tien Phai Tra
create procedure TongTienTra
(
@NgayTra datetime,
@MaDG varchar(30)
)
as
declare @Tien int
begin
select @Tien = SUM(CONVERT(int,MoneyBorrow)+CONVERT(int,MoneyReturn)+CONVERT(int,MoneyLost))
 from tblPayReader where ReaderId=@MaDG and DatePay = @NgayTra
group by ReaderId
return @Tien
end



