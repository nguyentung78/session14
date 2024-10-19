use bai1;
INSERT INTO VatTu (maVT, tenVT) VALUES 
('VT001', 'Bút bi'),
('VT002', 'Giấy A4'),
('VT003', 'Bảng trắng'),
('VT004', 'Bút lông'),
('VT005', 'Ghim giấy');
INSERT INTO NhaCungCap (maNCC, tenNCC, DiaChi, SoDienThoai) VALUES
('NCC001', 'Công ty Văn phòng phẩm ABC', '123 Nguyễn Trãi', '0901234567'),
('NCC002', 'Công ty Văn phòng phẩm XYZ', '456 Lê Lợi', '0902345678'),
('NCC003', 'Công ty Văn phòng phẩm DEF', '789 Trần Hưng Đạo', '0903456789');
INSERT INTO DonDatHang (soDH, ngayDH, maNCC) VALUES
('1', '2024-01-12', 'NCC001'),
('2', '2024-02-15', 'NCC002'),
('3', '2024-02-20', 'NCC003');
INSERT INTO ChiTietDonHang (maVT, soDH) VALUES
('VT001', '1'),
('VT002', '1'),
('VT003', '2'),
('VT004', '3'),
('VT005', '3');
INSERT INTO PhieuNhap (soPN, ngayNhap) VALUES
('PN001', '2024-01-20'),
('PN002', '2024-02-18'),
('PN003', '2024-02-21');
INSERT INTO PhieuNhapChiTiet (soPN, maVT, DonGiaNhap, SoLuongNhap) VALUES
('PN001', 'VT001', 5000, 100),
('PN001', 'VT002', 3000, 200),
('PN002', 'VT003', 7000, 150),
('PN003', 'VT004', 10000, 50),
('PN003', 'VT005', 2000, 300);
INSERT INTO PhieuXuat (soPX, ngayXuat) VALUES
('PX001', '2024-01-25'),
('PX002', '2024-02-17'),
('PX003', '2024-02-22');
INSERT INTO PhieuXuatChiTiet (soPX, maVT, DonGiaXuat, SoLuongXuat) VALUES
('PX001', 'VT001', 6000, 80),
('PX001', 'VT002', 3500, 100),
('PX002', 'VT003', 7500, 120),
('PX003', 'VT004', 10500, 30),
('PX003', 'VT005', 2500, 200);
select vt.tenvt, pxct.soluongxuat
from vattu vt join phieuxuatchitiet pxct on vt.maVT = pxct.maVT
where pxct.soluongxuat = (select max(soluongxuat) from phieuxuatchitiet);
select vt.tenvt, pnct.soluongnhap
from vattu vt join phieunhapchitiet pnct on vt.maVT = pnct.maVT
where pnct.soluongnhap = (select max(soluongnhap) from phieunhapchitiet);
select ncc.tenNCC, ddh.ngayDH
from nhacungcap ncc join dondathang ddh on ncc.maNCC = ddh.maNCC
where ngayDH between '2024-02-12' and '2024-02-22';
select vt.maVT, vt.tenVT, ncc.tenNCC, ddh.soDH, ddh.ngayDH
from vattu vt join chitietdonhang ctdh on vt.maVT = ctdh.maVT 
				join dondathang ddh on ctdh.soDH = ddh.soDH
                join nhacungcap ncc on ddh.maNCC = ncc.maNCC
			where ngayDH between '2024-1-11' and '2024-2-22';