
CREATE DATABASE BAOCAO
GO
USE BAOCAO

CREATE TABLE KhachHang
(	MaKH varchar(20),
	TenKH nvarchar(100) not null,
	SDT char(10),
	primary key(MaKH)
)
GO

CREATE TABLE NhanVien
(	MaNV varchar(20),
	TenNV nvarchar(100) not null,
	SDT	CHAR(10) not null,
	DiaChi NVARCHAR(100) not null,
	primary key(MaNV)
)
GO

CREATE TABLE SanPham
(	MaSP varchar(20),
	TenSP nvarchar(100) not null,
	DonGia int not null,
	primary key (MaSP)
)
GO

CREATE TABLE NguyenVatLieu 
(	MaNVL varchar(20), 
	TenNVL nvarchar(100) not null,
	SoLuong int not null,
	DonVi nvarchar(20) not null, 
	KhoiLuongTinh int not null,
	DoViTinh varchar(20) not null,
	primary key(MaNVL)
)
GO

CREATE TABLE NhapNVL
(	MaPhieu varchar(20), 
	NgayNhap date not null, 
	TongTienHang int not null, 
	TongThanhToan int not null,
	CongNo int,
	MaNV varchar(20) not null,
	primary key (MaPhieu),
	foreign key (MaNV) references NhanVien

)
GO

CREATE TABLE ChiTietNhapNVL
(	MaPhieu varchar(20) not null, 
	TenNVL nvarchar(100) not null,
	SoLuongNhap int not null, 
	DonGia int not null,
	DVT nvarchar(20),
	ThanhTien int not null, 
	ChietKhau int, 
	MaNVL varchar(20) not null,
	foreign key (MaPhieu) references NhapNVL,
	foreign key (MaNVL) references NguyenVatLieu
)
GO

CREATE TABLE CongThuc
(	MaCT varchar(20) not null, 
	MaSP varchar(20) not null, 
	MaNVL varchar(20) not null,
	LuongNVL int not null,
	DonViTinh varchar(20) not null,
	foreign key (MaSP) references SanPham,
	foreign key (MaNVL) references NguyenVatLieu
)

CREATE TABLE HoaDon 
(	MaHD varchar(20), 
	NgayBan date not null, 
	GhiChu nvarchar(100), 
	TongTien int not null, 
	ChietKhau int,
	MaNV varchar(20) not null, 
	MaKH varchar(20) not null,
	primary key(MaHD),
	foreign key (MaNV) references NhanVien,
	foreign key (MaKH) references KhachHang
)
GO

CREATE TABLE ChiTietHoaDon 
(	MaHD varchar(20) not null, 
	TenSP nvarchar(50) not null,
	SoLuong int not null, 
	DonGia int not null, 
	ThanhTien int not null,
	MaSP varchar(20) not null,
	foreign key (MaHD) references HoaDon,
	foreign key (MaSP) references SanPham
)
GO


 -- THÊM DỮ LIỆU VÀO BẢNG KHACHHANG

 INSERT INTO KHACHHANG 
 VALUES 
	 ('0000000001',N'Trương Quang Hòa','0976308098'),
	 ('0000000002',N'Lê Anh Huy','0966654330'),
	 ('0000000003',N'Hồ Trần Nhật Khánh','0164843800'),
	 ('0000000004',N'Lê Minh Trí','0935700123'),
	 ('0000000005',N'Phan Công Diễn','0935604934')


--THÊM DỮ LIỆU VÀO BẢNG NHANVIEN
 
INSERT INTO NHANVIEN
VALUES
	('NV001',N'Nguyễn Trí Hùng','0905886802',N'HUỲNH HÙNG, THÔN 4, XÃ HÒA PHONG, KRÔNG BÔNG, ĐĂK LĂK'),
	('NV002',N'Dương Ngọc Long','0120877631',N'01 THOẠI NGỌC HẦU, TAM KỲ, QUẢNG NAM'),
	('NV003',N'Trương Nhật Minh','0165421777',N'TỔ 37B KHU VỰC 4, SỐ NHÀ 20/6A CHI LĂNG, QUY NHƠN, BÌNH ĐỊNH'),
	('NV004',N'Lê Nguyễn Hoàng Văn','0969590517',N'SỐ 31 ĐƯỜNG HÒA MINH 4, LIÊN CHIỂU, ĐÀ NẴNG'),
	('NV005',N'Nguyễn Văn Hoàng Long','0914660398',N'TỔ 45 ĐA PHƯỚC II, HÒA KHÁNH BẮC, LIÊN CHIỂU, ĐÀ NẴNG'),
	('NV006',N'Trần Phước Đạt','0914163750',N'11 THÚC TỀ, THANH KHÊ, TP. ĐÀ NẴNG'),
	('NV007',N'Phạm Duy Khánh','0164663603',N'08/38 TRẦN BÌNH TRỌNG - P. ĐÔNG SƠN - TP THANH HÓA')

--THÊM DỮ LIỆU VÀO BẢNG SANPHAM

INSERT INTO SANPHAM
VALUES
	('SP0001',N'Café trứng',35000),
	('SP0002',N'Matcha đá xay',40000),
	('SP0003',N'Trà sữa olong',25000),
	('SP0004',N'Sinh tố xoài',30000),
	('SP0005',N'Soda việt quất',20000),
	('SP0006',N'Trà đào cam sả',25000),
	('SP0007',N'Ép cam',20000)

--THÊM DỮ LIỆU VÀO BẢNG NGUYÊN VẬT LIỆU

INSERT INTO NGUYENVATLIEU
VALUES
	('NL0001',N'Kem sữa béo',10,N'Hộp',5000,'GAM'),
	('NL0002',N'Trà đen Lộc Phát',10,N'Bịch',5000,'GAM'),
	('NL0003',N'Cam xanh',10,'KG',10000,'GAM'),
	('NL0004',N'Xoài',10,'KG',10000,'GAM'),
	('NL0005',N'Soda',5,N'Thùng',24,'LON'),
	('NL0006',N'Cafe',50,N'KG',50000,'GAM'),
	('NL0007',N'Siro việt quất',10,N'Chai',2000,'ML'),
	('NL0008',N'Bột matcha',10,N'Bịch',5000,'GAM')

--THÊM DỮ LIỆU VÀO BẢNG NHAPNVL

INSERT INTO NHAPNVL
VALUES
	('P00001','2021/12/27',1950000,1000000,950000,'NV001'),
	('P00002','2022/01/31',200000,200000,'','NV005'),
	('P00003','2022/06/16',750000,750000,'','NV001'),
	('P00004','2002/11/15',500000,500000,'','NV002')

-- THÊM DỮ LIỆU VÀO BẢNG CHITIETNHAPNVL
INSERT INTO CHITIETNHAPNVL
VALUES
	('P00003',N'Bột matcha',5,150000,N'Bịch',750000,0,'NL0008'),
	('P00004',N'Kem sữa béo',10,50000,N'Bịch',500000,0,'NL0001'),
	('P00001',N'Trà đen Lộc Phát',10,120000,N'Bịch',1200000,0,'NL0002'),
	('P00001',N'Bột matcha',5,150000,N'Bịch',750000,0,'NL0008'),
	('P00002',N'Xoài',10,20000,'KG',200000,0,'NL0004')
		
--THÊM DỮ LIỆU VÀO BẢNG CONGTHUC
INSERT INTO CONGTHUC
VALUES
	('CT0001','SP0003','NL0002',50,'GAM'),
	('CT0001','SP0003','NL0001',300,'GAM'),
	('CT0002','SP0005','NL0005',1,'LON'),
	('CT0002','SP0005','NL0007',50,'ML'),
	('CT0003','SP0007','NL0003',200,'ML')

--THÊM DỮ LIỆU VÀO BẢNG HOADON
INSERT INTO HOADON
VALUES
	('HD0001','2022-10-1',N'ít đá','50000','','NV001','0000000001'),
	('HD0002','2022-10-2',N'nhiều đá','75000','','NV003','0000000002'),
	('HD0003','2022-10-3',N'nhiều xoài','60000','','NV004','0000000003'),
	('HD0004','2022-10-5','','110000','','NV005','0000000004'),
	('HD0005','2022-10-6','','25000','','NV002','0000000005')

--THÊM DỮ LIỆU VÀO BẢNG CHITIETHOADON
INSERT INTO CHITIETHOADON
VALUES
	('HD0001',N'Trà sữa olong',2,25000,50000,'SP0003'),
	('HD0002',N'Trà sữa olong',3,75000,75000,'SP0003'),
	('HD0003',N'Sinh tố xoài',2,30000,60000,'SP0004'),
	('HD0004',N'Sinh tố xoài',2,30000,60000,'SP0004'),
	('HD0004',N'Trà sữa olong',2,25000,50000,'SP0003'),
	('HD0005',N'Trà sữa olong',1,25000,25000,'SP0003')
	