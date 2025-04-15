## BÀI TẬP VỀ NHÀ 02 - 03 - MÔN HỆ QUẢN TRỊ CSDL:

## DEADLINE: 23H59 NGÀY 30/03/2025

## ĐIỀU KIỆN: (ĐÃ LÀM XONG BÀI 2)

## BÀI TOÁN: Sửa bài 2 để có csdl như sau:
  + SinhVien(#masv,hoten,NgaySinh)
  + Lop(#maLop,tenLop)
  + GVCN(#@maLop,#@magv,#HK)
  + LopSV(#@maLop,#@maSV,ChucVu)
  + GiaoVien(#magv,hoten,NgaySinh,@maBM)
  + BoMon(#MaBM,tenBM,@maKhoa)
  + Khoa(#maKhoa,tenKhoa)
  + MonHoc(#mamon,Tenmon,STC)
  + LopHP(#maLopHP,TenLopHP,HK,@maMon,@maGV)
  + DKMH(#id_dk, @maLopHP,@maSV,DiemThi,PhanTramThi)
  + Diem(#id, @id_dk, diem)

## YÊU CẦU:
1. Sửa bảng DKMH và bảng Điểm từ bài tập 2 để có các bảng như yêu cầu.
2. Nhập dữ liệu demo cho các bảng (nhập có kiểm soát từ tính năng Edit trên UI của mssm)
3. Viết lệnh truy vấn để: Tính được điểm thành phần của 1 sinh viên đang học tại 1 lớp học phần.


# CODE 
-- Xóa b?ng n?u dã t?n t?i tru?c khi t?o l?i
DROP TABLE IF EXISTS DIEM, DANGKIMONHOC, GIAOVIENCHUNHIEM, LOPSINHVIEN, SINHVIEN, LOPHOCPHAN, LOP, MONHOC, GIAOVIEN, BOMON, KHOA;
GO

-- Tạo bảng khoa
CREATE TABLE KHOA(
  MAKHOA NVARCHAR(10) PRIMARY KEY,
  TENKHOA NVARCHAR(50) NOT NULL
);
GO

-- Tạo bảng bộ môn
CREATE TABLE BOMON (
  MABOMON NVARCHAR(10) PRIMARY KEY,
  TENBOMON NVARCHAR(100) NOT NULL,
  MAKHOA NVARCHAR(10) FOREIGN KEY REFERENCES KHOA(MAKHOA)
);
GO

-- Tạo bảng giáo viên
CREATE TABLE GIAOVIEN (
  MAGIAOVIEN NVARCHAR(10) PRIMARY KEY,
  HOTEN NVARCHAR(100) NOT NULL,
  NGAYSINH DATE NOT NULL,
  MABOMON NVARCHAR(10) FOREIGN KEY REFERENCES BOMON(MABOMON)
);
GO

-- Tạo bảng môn học
CREATE TABLE MONHOC(
  MAMON NVARCHAR(10) PRIMARY KEY,
  TENMON NVARCHAR(100) NOT NULL,
  SOTINCHI INT NOT NULL
);
GO

-- Tạo bảng lớp
CREATE TABLE LOP(
  MALOP NVARCHAR(10) PRIMARY KEY,
  TENLOP NVARCHAR(100) NOT NULL
);
GO

-- Tạo bảng lớp học phần 
CREATE TABLE LOPHOCPHAN(
  MALOPHOCPHAN NVARCHAR(10) PRIMARY KEY,
  TENLOPHOCPHAN NVARCHAR(100) NOT NULL,
  HOCKI INT NOT NULL,
  MAMON NVARCHAR(10) FOREIGN KEY REFERENCES MONHOC(MAMON),
  MAGIAOVIEN NVARCHAR(10) FOREIGN KEY REFERENCES GIAOVIEN(MAGIAOVIEN)
);
GO

-- Tạo bảng sinh viên
CREATE TABLE SINHVIEN(
  MASINHVIEN NVARCHAR(13) PRIMARY KEY,
  HOTEN NVARCHAR(100) NOT NULL,
  NGAYSINH DATE NOT NULL
);
GO

-- Tạo bảng lớp sinh viên
CREATE TABLE LOPSINHVIEN(
  MALOP NVARCHAR(10),
  MASINHVIEN NVARCHAR(13),
  CHUCVU NVARCHAR(50),
  PRIMARY KEY (MALOP, MASINHVIEN),
  FOREIGN KEY (MALOP) REFERENCES LOP(MALOP),
  FOREIGN KEY (MASINHVIEN) REFERENCES SINHVIEN(MASINHVIEN)
);
GO

-- Tạo bảng giáo viên chủ nhiệm
CREATE TABLE GIAOVIENCHUNHIEM(
  MALOP NVARCHAR(10),
  MAGIAOVIEN NVARCHAR(10),
  HOCKI INT,
  PRIMARY KEY (MALOP, MAGIAOVIEN, HOCKI),
  FOREIGN KEY (MALOP) REFERENCES LOP(MALOP),
  FOREIGN KEY (MAGIAOVIEN) REFERENCES GIAOVIEN(MAGIAOVIEN)
);
GO

-- Tạo bảng đăng kí môn học 
CREATE TABLE DANGKIMONHOC(
  MALOPHOCPHAN NVARCHAR(10),
  MASINHVIEN NVARCHAR(13),
  PRIMARY KEY (MALOPHOCPHAN, MASINHVIEN),
  FOREIGN KEY (MALOPHOCPHAN) REFERENCES LOPHOCPHAN(MALOPHOCPHAN),
  FOREIGN KEY (MASINHVIEN) REFERENCES SINHVIEN(MASINHVIEN)
);
GO

-- Tạo bảng điểm
CREATE TABLE DIEM(
  MALOPHOCPHAN NVARCHAR(10),
  MASINHVIEN NVARCHAR(13),
  DIEMTHANHPHAN FLOAT CHECK (DIEMTHANHPHAN BETWEEN 0 AND 10),
  DIEMTHI FLOAT CHECK (DIEMTHI BETWEEN 0 AND 10),
  PHANTRAMTHI FLOAT CHECK (PHANTRAMTHI BETWEEN 0 AND 100),
  DIEMTONGKET AS (DIEMTHANHPHAN * 0.4 + DIEMTHI * 0.6),
  PRIMARY KEY (MALOPHOCPHAN, MASINHVIEN),
  FOREIGN KEY (MALOPHOCPHAN, MASINHVIEN) REFERENCES DANGKIMONHOC(MALOPHOCPHAN, MASINHVIEN)
);
GO

# CÂU LỆNH TRUY VẤN
SELECT 
    SV.MASINHVIEN,
    SV.HOTEN AS TEN_SINH_VIEN,
    LHP.MALOPHOCPHAN,
    LHP.TENLOPHOCPHAN,
    MH.TENMON AS TEN_MON_HOC,
    GVCN_GV.HOTEN AS TEN_GV_CHU_NHIEM,  
    GV.HOTEN AS TEN_GV_DAY,
    D.DIEMTHANHPHAN,
    D.DIEMTHI,
    D.DIEMTONGKET
FROM DIEM D
JOIN SINHVIEN SV ON D.MASINHVIEN = SV.MASINHVIEN
JOIN LOPHOCPHAN LHP ON D.MALOPHOCPHAN = LHP.MALOPHOCPHAN
JOIN MONHOC MH ON LHP.MAMON = MH.MAMON
JOIN GIAOVIEN GV ON LHP.MAGIAOVIEN = GV.MAGIAOVIEN
JOIN DANGKIMONHOC DK ON D.MALOPHOCPHAN = DK.MALOPHOCPHAN 
    AND D.MASINHVIEN = DK.MASINHVIEN
JOIN LOPSINHVIEN LSV ON SV.MASINHVIEN = LSV.MASINHVIEN
JOIN GIAOVIENCHUNHIEM GVCN ON LSV.MALOP = GVCN.MALOP
JOIN GIAOVIEN GVCN_GV ON GVCN.MAGIAOVIEN = GVCN_GV.MAGIAOVIEN  
WHERE SV.MASINHVIEN = 'K225480106032' 
AND LHP.MALOPHOCPHAN = 'K58';

## ẢNH THAO TÁC
tạo bảng bộ môn
![image](https://github.com/user-attachments/assets/f372404e-a74d-40ba-a9f5-a109f1b8a865)
tạo bảng khoa
![image](https://github.com/user-attachments/assets/720b4e7f-218b-4627-97f4-9c2fb69f6091)
tạo bảng giáo viên
![image](https://github.com/user-attachments/assets/a7167d5e-2513-49c7-b742-130b2709bcb6)
tạo bảng giáo viên chủ nhiệm 
![image](https://github.com/user-attachments/assets/5dbba616-d593-4963-99e0-cf67a8f6e96c)
tạo bảng lớp
![image](https://github.com/user-attachments/assets/fe7b4287-692e-41c1-8afd-f13de8c152aa)
tạo bảng lớp học phần 
![image](https://github.com/user-attachments/assets/19665ed6-d6a9-4186-9b2c-fbc16d450d69)
tạo bảng lớp sinh viên
![image](https://github.com/user-attachments/assets/ef96b5c8-d1b2-4f63-ac6a-af27f8f1e8f9)
tạo bảng môn học
![image](https://github.com/user-attachments/assets/dc7922dd-1b81-4029-9ed4-41c35be1e9ae)
tạo bảng sinh viên 
![image](https://github.com/user-attachments/assets/8fd7f8e0-784b-4fe9-86b4-dee24b674a0c)
tạo bảng điểm 
![image](https://github.com/user-attachments/assets/9b8893b5-e76c-4fd6-bdfa-4571e5913da3)
tạo bảng đăng kí môn học
![image](https://github.com/user-attachments/assets/e2722e54-a22e-4ecb-83fb-def3602e9830)

![image](https://github.com/user-attachments/assets/8e585628-e685-417b-a6c4-3999c5dd847d)
![image](https://github.com/user-attachments/assets/d966ab06-c3e6-4f39-9eb5-449b43286055)
![image](https://github.com/user-attachments/assets/79647897-20b6-4a14-ac13-13a3dd05ce1e)
![image](https://github.com/user-attachments/assets/bfdc9b9d-d452-4c1c-ab39-71f0425af39e)
![image](https://github.com/user-attachments/assets/60c7fd64-6c14-410b-af14-def22c41abc3)




