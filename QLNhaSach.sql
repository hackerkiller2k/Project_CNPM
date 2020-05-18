CREATE DATABASE QLNhaSach
GO

USE QLNhaSach
GO





CREATE TABLE Users
(
	id INT IDENTITY PRIMARY KEY,
	UserName NVARCHAR(100) ,
	FullName NVARCHAR(100),	
	PassWord NVARCHAR(1000) NOT NULL DEFAULT 0,
	Email NVARCHAR(100),	
	Phone NVARCHAR(100),
	Role INT NOT NULL  DEFAULT 0 -- 1: admin && 0: employee
)
GO

CREATE TABLE KhachHang
(
		id INT IDENTITY PRIMARY KEY,
		FullName NVARCHAR(50) NOT NULL,
		kAddress NVARCHAR(50) NOT NULL,
		Phone NVARCHAR(50) NOT NULL,
		Email NVARCHAR(50) NOT NULL,
		TienNo MONEY NOT NULL DEFAULT 0
)
GO

CREATE TABLE TheLoai
(
		id INT IDENTITY PRIMARY KEY,
		Name_TheLoai NVARCHAR(50) NOT NULL
)
GO

CREATE TABLE TacGia
(
		id INT IDENTITY PRIMARY KEY,
		Name_TacGia NVARCHAR(50) NOT NULL
)
GO

CREATE TABLE NhaXuatBan
(
		id INT IDENTITY PRIMARY KEY,
		Name_NXB NVARCHAR(50) NOT NULL
)
GO

CREATE TABLE Sach
(
		id INT IDENTITY PRIMARY KEY,
		Name_Sach NVARCHAR(50) NOT NULL,
		Amount INT NOT NULL DEFAULT 0 ,
		Price_Nhap MONEY NOT NULL,
		Price_Ban MONEY NOT NULL,
		id_NhapKho int not null,
		id_TheLoai int not null,
		id_NXB int not null,
		id_TacGia int not null,
		FOREIGN KEY (id_TheLoai) REFERENCES dbo.TheLoai(id)	,
		FOREIGN KEY (id_NhapKho) REFERENCES dbo.NhapKho(id),
		FOREIGN KEY (id_NXB) REFERENCES dbo.NhaXuatBan(id),
		FOREIGN KEY (id_TacGia) REFERENCES dbo.TacGia(id)
)
GO

CREATE TABLE HoaDon
(
		id INT IDENTITY PRIMARY KEY,
		Create_day datetime not null,
		Price_Tra money not null,
		Price_No money not null default 0,
		Total MONEY NOT NULL,		
		id_KhachHang int not null,
		id_User int not null,
		FOREIGN KEY (id_KhachHang) REFERENCES dbo.KhachHang(id),
		FOREIGN KEY (id_User) REFERENCES dbo.Users(id)
)
GO

CREATE TABLE CTHoaDon
(
		id INT IDENTITY PRIMARY KEY,
		id_Sach int not null,
		Amount int not null default 0,
		Total money not null
		FOREIGN KEY (id_Sach) REFERENCES dbo.Sach(id)
)
Go

CREATE TABLE NhapKho
(
		id INT IDENTITY PRIMARY KEY,
		id_User int not null,
		Date_NhapKho datetime not null,
		Total_Amount int not null default 0,
		Total_money money not null
		FOREIGN KEY (id_User) REFERENCES dbo.Users(id)
)
Go

CREATE TABLE CTNhapKho
(
		id INT IDENTITY PRIMARY KEY,
		id_NhapKho int not null,
		id_Sach int not null,
		Amount int not null default 0,
		money_Nhap money not null,
		Total money not null,
		FOREIGN KEY (id_Sach) REFERENCES dbo.Sach(id)  ,
		FOREIGN KEY (id_NhapKho) REFERENCES dbo.NhapKho(id) 
)
Go

CREATE TABLE PhieuThuTien
(
		id INT IDENTITY PRIMARY KEY,
		id_KhachHang int not null,
		id_User int not null,
		day_ThuTien datetime not null,
		Total_money money not null,
		FOREIGN KEY (id_KhachHang) REFERENCES dbo.KhachHang(id)  ,
		FOREIGN KEY (id_User) REFERENCES dbo.Users(id) 
)
Go