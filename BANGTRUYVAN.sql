SELECT 
    SV.MASINHVIEN, SV.HOTEN AS HOTEN_SV, SV.NGAYSINH,
    LOP.MALOP, LOP.TENLOP,
    GV.MAGIAOVIEN, GV.HOTEN AS HOTEN_GV, BM.TENBOMON,
    MH.MAMON, MH.TENMON, MH.SOTINCHI,
    DK.DIEMTHANHPHAN, DK.DIEMTHI, DK.DIEMTONGKET
FROM SINHVIEN SV
LEFT JOIN LOPSINHVIEN LSV ON SV.MASINHVIEN = LSV.MASINHVIEN
LEFT JOIN LOP ON LSV.MALOP = LOP.MALOP
LEFT JOIN GIAOVIENCHUNHIEM GVCN ON LOP.MALOP = GVCN.MALOP
LEFT JOIN GIAOVIEN GV ON GVCN.MAGIAOVIEN = GV.MAGIAOVIEN
LEFT JOIN BOMON BM ON GV.MABOMON = BM.MABOMON
LEFT JOIN DANGKIMONHOC DK ON SV.MASINHVIEN = DK.MASINHVIEN
LEFT JOIN LOPHOCPHAN LHP ON DK.MALOPHOCPHAN = LHP.MALOPHOCPHAN
LEFT JOIN MONHOC MH ON LHP.MAMON = MH.MAMON
WHERE SV.MASINHVIEN = 'K225480106';