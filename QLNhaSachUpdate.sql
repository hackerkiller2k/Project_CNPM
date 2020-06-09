CREATE DATABASE QuanLyNhaSach
GO

USE QuanLyNhaSach
GO


CREATE TABLE PHANQUYEN
(
	[MaPhanQuyen] INT IDENTITY PRIMARY KEY,
	[TenPhanQuyen] [varchar](50) NOT NULL,
)

GO

CREATE TABLE TAIKHOAN
(
	MaTaiKhoan INT IDENTITY PRIMARY KEY,
	UserName varchar(16) NOT NULL,
	MatKhau varchar(16) NULL,
	MaPhanQuyen int  NULL,
	FOREIGN KEY (MaPhanQuyen) REFERENCES dbo.PHANQUYEN(MaPhanQuyen)
)

GO

CREATE TABLE [dbo].[LOAINHANVIEN](
	[MaLoaiNhanVien] INT IDENTITY PRIMARY KEY,
	[TenLoaiNhanVien] [nvarchar](50) NULL,
)

GO 

CREATE TABLE NHANVIEN
(
	[MaNhanVien]  INT IDENTITY PRIMARY KEY,
	[TenNhanVien] [varchar](50) NOT NULL,
	[MaLoaiNhanVien] INT NOT NULL,
	[NgaySinh] [date] NULL,
	[GioiTinh] [varchar](15) NOT NULL,
	[DiaChi] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[SoDienThoai] [char](12) NULL,
	[MaTaiKhoan] int NULL,
	FOREIGN KEY (MaTaiKhoan) REFERENCES dbo.TAIKHOAN(MaTaiKhoan)	,
	FOREIGN KEY (MaLoaiNhanVien) REFERENCES dbo.LOAINHANVIEN(MaLoaiNhanVien),
	)
GO

CREATE TABLE KHACHHANG
(
		MaKhachHang INT IDENTITY PRIMARY KEY,
		TenKhachHang NVARCHAR(50) NOT NULL,
		DiaChi NVARCHAR(50) NOT NULL,
		Phone NVARCHAR(50) NOT NULL,
		Email NVARCHAR(50) NOT NULL,
		TienNo MONEY NOT NULL DEFAULT 0
)
GO

CREATE TABLE THELOAI
(
		MaTheLoai INT IDENTITY PRIMARY KEY,
		TenTheLoai NVARCHAR(50) NOT NULL
)
GO

CREATE TABLE TACGIA
(
		MaTacGia INT IDENTITY PRIMARY KEY,
		TenTacGia NVARCHAR(50) NOT NULL
)
GO

CREATE TABLE NHAXUATBAN
(
		MaNhaXuatBan INT IDENTITY PRIMARY KEY,
		TenNhaXuatBan NVARCHAR(50) NOT NULL
)
GO

CREATE TABLE NHAPKHO
(
		MaNhapKho INT IDENTITY PRIMARY KEY,
		MaNhanVien int not null,
		NgayNhapKho datetime not null,
		TongSoLuong int not null default 0,
		ThanhTien money not null
		FOREIGN KEY (MaNhanVien) REFERENCES dbo.NHANVIEN(MaNhanVien),
)


Go
CREATE TABLE SACH
(
		MaSach INT IDENTITY PRIMARY KEY,
		TenSach NVARCHAR(50) NOT NULL,
		SoLuong INT NOT NULL DEFAULT 0 ,
		GiaNhap MONEY NOT NULL,
		GiaBan MONEY NOT NULL,
		MaNhapKho int not null,
		MaTheLoai int not null,
		MaNhaXuatBan int not null,
		MaTacGia int not null,
		FOREIGN KEY (MaTheLoai) REFERENCES dbo.THELOAI(MaTheLoai)	,
		FOREIGN KEY (MaNhapKho) REFERENCES dbo.NHAPKHO(MaNhapKho),
		FOREIGN KEY (MaNhaXuatBan) REFERENCES dbo.NHAXUATBAN(MaNhaXuatBan),
		FOREIGN KEY (MaTacGia) REFERENCES dbo.TACGIA(MaTacGia)
)

GO
CREATE TABLE CHITIETNHAPKHO
(
		MaChiTietNhapKho INT IDENTITY PRIMARY KEY,
		MaNhapKho int not null,
		MaSach int not null,
		SoLuong int not null default 0,
		GiaNhap money not null,
		TongTien money not null,
		FOREIGN KEY (MaSach) REFERENCES dbo.SACH(MaSach)  ,
		FOREIGN KEY (MaNhapKho) REFERENCES dbo.NHAPKHO(MaNhapKho) 
)

Go
CREATE TABLE HOADON
(
		MaHoaDon INT IDENTITY PRIMARY KEY,
		NgayHoaDOn datetime not null,
		TienTra money not null,
		TienNo money not null default 0,
		ThanhTien MONEY NOT NULL,		
		MaKhachHang int not null,
		MaNhanVien int not null,
		FOREIGN KEY (MaKhachHang) REFERENCES dbo.KHACHHANG(MaKhachHang),
		FOREIGN KEY (MaNhanVien) REFERENCES dbo.NHANVIEN(MaNhanVien)
)

GO

CREATE TABLE CHITIETHOADON
(
		MaChiTietHoaDon INT IDENTITY PRIMARY KEY,
		MaHoaDon int not null,
		MaSach int not null,
		SoLuong int not null default 0,
		TongTien money not null
		FOREIGN KEY (MaSach) REFERENCES dbo.SACH(MaSach),
		FOREIGN KEY (MaHoaDon) REFERENCES dbo.HOADON(MaHoaDon)
)

Go

CREATE TABLE PHIEUTHUTIEN
(
		MaPhieuThuTien INT IDENTITY PRIMARY KEY,
		MaKhachHang int not null,
		MaNhanVien int not null,
		NgayThuTien datetime not null,
		SoTienThu money not null,
		FOREIGN KEY (MaKhachHang) REFERENCES dbo.KHACHHANG(MaKhachHang)  ,
		FOREIGN KEY (MaNhanVien) REFERENCES dbo.NHANVIEN(MaNhanVien) 
)
Go

INSERT into [dbo].[PHANQUYEN] ([TenPhanQuyen]) VALUES (N'ADMIN')
INSERT into [dbo].[PHANQUYEN] ( [TenPhanQuyen]) VALUES (N'Ban Hang')

INSERT [dbo].[TAIKHOAN] ( [UserName], [MatKhau], [MaPhanQuyen]) VALUES ( N'admin', N'1', N'1')
INSERT [dbo].[TAIKHOAN] ([UserName], [MatKhau], [MaPhanQuyen]) VALUES ( N'user1', N'1', N'2')

INSERT [dbo].[LOAINHANVIEN] ( [TenLoaiNhanVien]) VALUES ( N'quan ly')
INSERT [dbo].[LOAINHANVIEN] ( [TenLoaiNhanVien]) VALUES ( N'ban hang')

INSERT [dbo].[NHANVIEN] ( [TenNhanVien], [MaLoaiNhanVien], [NgaySinh], [GioiTinh], [DiaChi], [Email], [SoDienThoai], [MaTaiKhoan]) VALUES ( N'Nguyen Van A', N'1', CAST(N'2000-05-18' AS Date), N'Nam', N'TpHCM', N'a@gmail.com', N'123         ', 1)
INSERT [dbo].[NHANVIEN] ( [TenNhanVien], [MaLoaiNhanVien], [NgaySinh], [GioiTinh], [DiaChi], [Email], [SoDienThoai], [MaTaiKhoan]) VALUES ( N'Nguyen Van B', N'2', CAST(N'1999-04-20' AS Date), N'Nu', N'Ha Noi', N'b@gmail.com', N'456         ', 2)


INSERT [dbo].[KHACHHANG] ( [TenKhachHang], [DiaChi], [Phone], [Email], [TienNo]) VALUES ( N'c', N'tphcm', N'123', N'c@gmail.com', 0.0000)
INSERT [dbo].[KHACHHANG] ([TenKhachHang], [DiaChi], [Phone], [Email], [TienNo]) VALUES ( N'd', N'Binh Dinh', N'456', N'd@gmail.com', 21.0000)


INSERT [dbo].[TACGIA] ( [TenTacGia]) VALUES ( N'e')
INSERT [dbo].[TACGIA] ( [TenTacGia]) VALUES ( N'd')


INSERT [dbo].[NHAXUATBAN] ( [TenNhaXuatBan]) VALUES ( N'cong ty sach')
INSERT [dbo].[NHAXUATBAN] ( [TenNhaXuatBan]) VALUES ( N'cong ty book')


INSERT [dbo].[THELOAI] ( [TenTheLoai]) VALUES ( N'truyen tranh')
INSERT [dbo].[THELOAI] ( [TenTheLoai]) VALUES ( N'thong tin')

INSERT [dbo].[NHAPKHO] ([MaNhanVien], [NgayNhapKho], [TongSoLuong], [ThanhTien]) VALUES ( 1, CAST(N'2020-06-08T00:00:00.000' AS DateTime), 30, 50.0000)
INSERT [dbo].[NHAPKHO] ( [MaNhanVien], [NgayNhapKho], [TongSoLuong], [ThanhTien]) VALUES ( 1, CAST(N'2020-06-07T00:00:00.000' AS DateTime), 20, 80.0000)


INSERT [dbo].[SACH] ( [TenSach], [SoLuong], [GiaNhap], [GiaBan], [MaNhapKho], [MaTheLoai], [MaNhaXuatBan], [MaTacGia]) VALUES ( N'lap trinh', 0, 0.0000, 0.0000, 1, 2, 2, 1)
INSERT [dbo].[SACH] ( [TenSach], [SoLuong], [GiaNhap], [GiaBan], [MaNhapKho], [MaTheLoai], [MaNhaXuatBan], [MaTacGia]) VALUES ( N'ConNan', 30, 5.0000, 15.0000, 2, 1, 1, 2)


INSERT [dbo].[CHITIETNHAPKHO] ( [MaNhapKho], [MaSach], [SoLuong], [GiaNhap], [TongTien]) VALUES ( 1, 1, 3, 5.0000, 15.0000)
INSERT [dbo].[CHITIETNHAPKHO] ( [MaNhapKho], [MaSach], [SoLuong], [GiaNhap], [TongTien]) VALUES ( 1, 2, 5, 4.0000, 20.0000)


INSERT [dbo].[HOADON] ( [NgayHoaDOn], [TienTra], [TienNo], [ThanhTien], [MaKhachHang], [MaNhanVien]) VALUES ( CAST(N'2020-06-08T00:00:00.000' AS DateTime), 20.0000, 2.0000, 22.0000, 1, 2)
INSERT [dbo].[HOADON] ( [NgayHoaDOn], [TienTra], [TienNo], [ThanhTien], [MaKhachHang], [MaNhanVien]) VALUES ( CAST(N'2020-05-06T00:00:00.000' AS DateTime), 2.0000, 2.0000, 2.0000, 2, 2)


INSERT [dbo].[CHITIETHOADON] ( [MaHoaDon], [MaSach], [SoLuong], [TongTien]) VALUES ( 1, 1, 2, 3.0000)
INSERT [dbo].[CHITIETHOADON] ([MaHoaDon], [MaSach], [SoLuong], [TongTien]) VALUES ( 2, 2, 1, 4.0000)

INSERT [dbo].[PHIEUTHUTIEN] ( [MaKhachHang], [MaNhanVien], [NgayThuTien], [SoTienThu]) VALUES ( 1, 1, CAST(N'2020-01-01T00:00:00.000' AS DateTime), 2.0000)
INSERT [dbo].[PHIEUTHUTIEN] ([MaKhachHang], [MaNhanVien], [NgayThuTien], [SoTienThu]) VALUES ( 2, 2, CAST(N'2020-02-02T00:00:00.000' AS DateTime), 3.0000)


