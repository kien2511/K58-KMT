# K58-KMT
Bài tập số 2 của sinh viên:K225480106032 - Nguyễn Trung Kiên - Môn hệ quản trị cơ sở dữ liệu
## DEADLINE: 23H59 NGÀY 25/03/2025

## ĐIỀU KIỆN: (ĐÃ LÀM XONG BÀI 1)
1. Đã cài đặt SQL Server 2022 Dev.
2. Đã cài đặt SQL Managerment Studio bản mới nhất.
3. Đã kết nối từ SQL Managerment Studio vào SQL Server.
4. Đã có tài khoản github, biết cách tạo repository(kho lưu trữ) cho phép truy cập public.

## BÀI TOÁN:
- Tạo csdl quan hệ với tên QLSV gồm các bảng sau:
  + SinhVien(#masv,hoten,NgaySinh)
  + Lop(#maLop,tenLop)
  + GVCN(#@maLop,#@magv,#HK)
  + LopSV(#@maLop,#@maSV,ChucVu)
  + GiaoVien(#magv,hoten,NgaySinh,@maBM)
  + BoMon(#MaBM,tenBM,@maKhoa)
  + Khoa(#maKhoa,tenKhoa)
  + MonHoc(#mamon,Tenmon,STC)
  + LopHP(#maLopHP,TenLopHP,HK,@maMon,@maGV)
  + DKMH(#@maLopHP,#@maSV,DiemTP,DiemThi,PhanTramThi)

## YÊU CẦU:
1. Thực hiện các hành động sau trên giao diện đồ hoạ để tạo cơ sở dữ liệu cho bài toán:
  + Tạo database mới, mô tả các tham số(nếu có) trong quá trình.
  + Tạo các bảng dữ liệu với các trường như mô tả, chọn kiểu dữ liệu phù hợp với thực tế (tự tìm hiểu)
  + Mỗi bảng cần thiết lập PK, FK(s) và CK(s) nếu cần thiết. (chú ý dấu # và @: # là chỉ PK, @ chỉ FK)
2. Chuyển các thao tác đồ hoạ trên thành lệnh SQL tương đương. lưu tất cả các lệnh SQL trong file: Script_DML.sql
## HÌNH ẢNH PASTE 
![image](https://github.com/user-attachments/assets/75d47975-c89d-4a76-a570-74d459c29e57)
![image](https://github.com/user-attachments/assets/1d8fae93-95b6-49c6-9b01-23af78e604b9)
![image](https://github.com/user-attachments/assets/ca8ea7a0-0a2b-4010-b116-3a92ed997941)

BẢNG - TABLE

BẢNG BỘ MÔN

![image](https://github.com/user-attachments/assets/361b3a1b-58a9-4c10-9941-19151662ca8a)

BẢNG KHOA

![image](https://github.com/user-attachments/assets/585d84d2-9000-4517-a279-b28307b27643)

BẢNG GIÁO VIÊN

![image](https://github.com/user-attachments/assets/132d7466-f06b-4291-82a9-c47a7a68a0b5)

BẢNG GIÁO VIÊN CHỦ NHIỆM

![image](https://github.com/user-attachments/assets/1c652ae2-325c-43d5-8ba8-83d5f6205b77)

BẢNG LỚP HỌC PHẦN 

![image](https://github.com/user-attachments/assets/393e3ed3-4dae-4b16-a0cf-60f2044f1cb6)

BẢNG LỚP SINH VIÊN

![image](https://github.com/user-attachments/assets/62d0ef36-3d54-48c1-95c3-17cd3bebed29)

BẢNG LỚP

![image](https://github.com/user-attachments/assets/32398f41-0dc3-43f6-9726-7ad02e5719ce)

BẢNG SINH VIÊN

![image](https://github.com/user-attachments/assets/21f4b5f7-2355-4f8f-acbd-156805826e48)

BẢNG MÔN HỌC

![image](https://github.com/user-attachments/assets/4b57f5c9-87e0-42f3-b5fe-0b9a45523608)

BẢNG ĐĂNG KÍ MÔN HỌC 

![image](https://github.com/user-attachments/assets/36f45bda-f18b-4684-a589-732e40828fda)

BẢNG LIÊN KẾT KHÓA CHÍNH KHÓA NGOẠI 

![image](https://github.com/user-attachments/assets/7b52aab1-155f-4f00-ad01-40394bcbffa2)
![image](https://github.com/user-attachments/assets/c649603a-8e21-4949-bd6b-69c308ce29fe)

BẢNG TRUY VẤN DỮ LIỆU
![image](https://github.com/user-attachments/assets/cce83d84-242e-491a-9123-41ad04590de7)


2.Chuyển các thao tác đồ hoạ trên thành lệnh SQL tương đương. lưu tất cả các lệnh SQL trong file: Script_DML.sq

![image](https://github.com/user-attachments/assets/a2e1a829-a4a4-4c4d-83b2-e0ef9c3c1156)

KẾT QUẢ

![image](https://github.com/user-attachments/assets/69f55a98-727b-4768-84bc-149cd5995900)


















