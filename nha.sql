-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th5 02, 2023 lúc 09:32 PM
-- Phiên bản máy phục vụ: 10.4.28-MariaDB
-- Phiên bản PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `nha`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `account`
--

CREATE TABLE `account` (
  `MaAccount` int(11) NOT NULL,
  `Email` text NOT NULL,
  `hashPass` text NOT NULL,
  `role` tinyint(1) NOT NULL,
  `dateCreate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updateTime` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `verify` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `account`
--

INSERT INTO `account` (`MaAccount`, `Email`, `hashPass`, `role`, `dateCreate`, `updateTime`, `verify`) VALUES
(34, 'lphoanglong1304@gmail.com', '$argon2i$v=19$m=65536,t=4,p=1$NVY2cXVCWC9meTAyN1A4Mw$Eu8cZ8AZ6HZmiFsaCnkYAcU9gLtHZQy/sMQfKjlU6+o', 0, '2023-04-03 13:32:22', '2023-04-11 07:47:56', 1),
(35, 'than.gio.kid@gmail.com', '$argon2i$v=19$m=65536,t=4,p=1$NVY2cXVCWC9meTAyN1A4Mw$Eu8cZ8AZ6HZmiFsaCnkYAcU9gLtHZQy/sMQfKjlU6+o', 1, '2023-04-03 13:32:53', '2023-04-11 07:47:56', 1),
(77, 'mine1342001@gmail.com', '$argon2i$v=19$m=65536,t=4,p=1$eEg2VUEzQzdYTVBBVy43ZQ$xmjnSOob7cGjzZjUuoUVrd8NYafva4jcBYRBwQsKsPs', 1, '2023-04-11 07:49:00', '2023-04-11 07:50:32', 1),
(78, 'lphoanglong130401@gmail.com', '$argon2i$v=19$m=65536,t=4,p=1$ZFNqaGRUa29KZUZuWFMxWA$szLhB7H5QCcHLy1eVTLx5rUjKkFYu219DVI4QaExHA8', 1, '2023-04-25 05:43:56', '2023-04-27 13:21:45', 1),
(79, 'thaibinh06102000@gmail.com', '$argon2i$v=19$m=65536,t=4,p=1$YmM4YWt4T1BWMUtmOFplZQ$D2AXHZWGbYR36yl1QiwQblf2aEjvQWG+iuY4AhIGOLs', 1, '2023-05-02 13:54:09', '2023-05-02 13:54:37', 1),
(80, 'thaibinh06102000@gmail.com', '$argon2i$v=19$m=65536,t=4,p=1$aXkxaWIzbFhqY1Z2NUFXLw$4+e5IVvIZj03UxQw0xia53xOffsilPkbbRKE+Fn0iuM', 0, '2023-05-02 19:06:57', '2023-05-02 19:06:57', 0),
(81, 'thaibinh6102000@gmail.com', '$argon2i$v=19$m=65536,t=4,p=1$VHgxcUJBd2NkWkVBQXIubw$OLo0SNu4GY/kqyifS2a2iyKK2XT3DnW0KhwyhORHEtU', 0, '2023-05-02 19:29:15', '2023-05-02 19:29:15', 0),
(82, 'thaibinh6102000@gmail.com', '$argon2i$v=19$m=65536,t=4,p=1$L3lGTzR0dkt1eXl1WjFQVA$2VPAhpjdDlCiAHxEd4z5GWQVcL6/FfmsGB3y/QoWusk', 1, '2023-05-02 19:30:01', '2023-05-02 19:30:01', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chutro`
--

CREATE TABLE `chutro` (
  `MaChuTro` int(11) NOT NULL,
  `MaAccount` int(11) NOT NULL,
  `Ten` text NOT NULL,
  `CMND` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `chutro`
--

INSERT INTO `chutro` (`MaChuTro`, `MaAccount`, `Ten`, `CMND`) VALUES
(7, 34, 'Long', '123'),
(17, 80, 'Nguyen Thai Binh', '0792896');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hopdongthue`
--

CREATE TABLE `hopdongthue` (
  `id` int(11) NOT NULL,
  `MaPhongTro` int(11) NOT NULL,
  `MaChuTro` int(11) NOT NULL,
  `MaKhachTro` int(11) NOT NULL,
  `thanhtien` text NOT NULL,
  `sothangthue` int(11) DEFAULT NULL,
  `ngaylaphoadon` datetime NOT NULL,
  `ngaynhanphong` datetime DEFAULT NULL,
  `ngaytraphong` datetime DEFAULT NULL,
  `MaPhuongThuc` int(11) NOT NULL,
  `ngayhuyhopdong` datetime DEFAULT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT 1,
  `sdt` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `hopdongthue`
--

INSERT INTO `hopdongthue` (`id`, `MaPhongTro`, `MaChuTro`, `MaKhachTro`, `thanhtien`, `sothangthue`, `ngaylaphoadon`, `ngaynhanphong`, `ngaytraphong`, `MaPhuongThuc`, `ngayhuyhopdong`, `visible`, `sdt`) VALUES
(3, 6, 7, 9, '2.100.000 VND', 1, '2023-04-29 00:00:00', '2023-05-02 00:00:00', '2023-06-02 00:00:00', 1, NULL, 1, '0909298578'),
(10, 4, 7, 10, '1.350.000 VND', 1, '2023-05-02 00:00:00', '2023-05-05 00:00:00', '2023-06-05 00:00:00', 1, NULL, 1, '0155545'),
(23, 5, 7, 10, '1.400.000 VND', 1, '2023-05-02 00:00:00', '2023-05-05 00:00:00', '2023-06-05 00:00:00', 1, NULL, 2, '0155545'),
(24, 5, 7, 10, '1.400.000 VND', 1, '2023-05-02 00:00:00', '2023-05-05 00:00:00', '2023-06-05 00:00:00', 1, NULL, 1, '0155545');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `khachtro`
--

CREATE TABLE `khachtro` (
  `MaKhachTro` int(11) NOT NULL,
  `MaAccount` int(11) NOT NULL,
  `Ten` text NOT NULL,
  `CMND` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `khachtro`
--

INSERT INTO `khachtro` (`MaKhachTro`, `MaAccount`, `Ten`, `CMND`) VALUES
(1, 35, 'Phong', '123'),
(8, 77, 'Long Guest', '0792xxxxxxxx'),
(9, 78, 'Long Guest Test', '1'),
(10, 79, 'Nguyễn Thái Bình', '0792888');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nhatro`
--

CREATE TABLE `nhatro` (
  `MaNhaTro` int(11) NOT NULL,
  `DiaChi` text NOT NULL,
  `MoTaNhaTro` text NOT NULL,
  `MaChuTro` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `nhatro`
--

INSERT INTO `nhatro` (`MaNhaTro`, `DiaChi`, `MoTaNhaTro`, `MaChuTro`) VALUES
(23, '461c Bình Đông', 'Đẹp, có máy lạnh', 7),
(24, '2A Bình thạnh', 'Oke', 7),
(27, 'oke', 'test oke\r\ncheck line test', 7),
(32, '39/18 Lê Lơi', 'Cần bệnh viện giá rẻ có điều hòa', 17);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `phieudanhgiakhachtro`
--

CREATE TABLE `phieudanhgiakhachtro` (
  `id` int(11) NOT NULL,
  `MaChuTro` int(11) NOT NULL,
  `MaKhachTro` int(11) NOT NULL,
  `starRating` tinyint(4) NOT NULL,
  `Comment` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `phongtro`
--

CREATE TABLE `phongtro` (
  `MaPhongTro` int(11) NOT NULL,
  `MaNhaTro` int(11) NOT NULL,
  `MoTaPhongTro` text NOT NULL,
  `GiaThue` text NOT NULL,
  `DienTich` text NOT NULL,
  `SoPhong` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `phongtro`
--

INSERT INTO `phongtro` (`MaPhongTro`, `MaNhaTro`, `MoTaPhongTro`, `GiaThue`, `DienTich`, `SoPhong`) VALUES
(4, 24, 'có máy lạnh', '1.350.000', '40 m2', 'B01.02'),
(5, 24, 'có máy nước nóng', '1.400.000', '40 m2', 'B01.03'),
(6, 23, 'có nước nóng\r\ncó máy lạnh\r\nbao bếp ga\r\ncó  lò sưởi khắp phòng\r\nthuê ngay 12 tháng được tặng 2 tháng', '2.100.000', '50 m2`', 'A05.03');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `phuongthucthanhtoan`
--

CREATE TABLE `phuongthucthanhtoan` (
  `MaPhuongThuc` int(11) NOT NULL,
  `tenphuongthuc` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `phuongthucthanhtoan`
--

INSERT INTO `phuongthucthanhtoan` (`MaPhuongThuc`, `tenphuongthuc`) VALUES
(1, 'Tiền mặt'),
(2, 'Chuyển khoản ngân hàng'),
(3, 'Thẻ tín dụng/thẻ ghi nợ'),
(4, 'Ví điện tử');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `picture`
--

CREATE TABLE `picture` (
  `id` int(11) NOT NULL,
  `url` text NOT NULL,
  `MaPhongTro` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `picture`
--

INSERT INTO `picture` (`id`, `url`, `MaPhongTro`) VALUES
(8, 'https://storage.googleapis.com/project-motel.appspot.com/images/644c83bb76709.png?GoogleAccessId=firebase-adminsdk-gbzxz%40project-motel.iam.gserviceaccount.com&Expires=1685328060&Signature=AfuzY%2Fpu8TwJhhAC9AOrq6erOqad7CJIBoBb8bhdMpl4pT3hDaPjYpHl6aoxbZBoqvA9hFr5I2B3XdR2TuRWVgdGPDC%2BJlpP%2FG%2FQQkuqoQAS3lCbHcEZcXDis17M2Mpoq7owXQh7TzVMJ%2Fzo3sn0nBr8qrCif98hCuuHIpDYvic35nk54fd%2Fl2aKBusiUa81l4Ib0GScuZzEERFLGvKn%2FRwnhnaEXmRnxA8RsV9XGMgRotMm2kn3H9q8MA2%2Fwsp2uubZZd9F%2BgRXi7hgO1D6ekNj9Ejrde6gqbNUqXw49Utqf3%2Fl8F1wKkm4yDUFLAR2H5IG39Q5O%2FI0uUlJXsJKnw%3D%3D&generation=1682736061137012', 6);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`MaAccount`);

--
-- Chỉ mục cho bảng `chutro`
--
ALTER TABLE `chutro`
  ADD PRIMARY KEY (`MaChuTro`),
  ADD KEY `MaAccount` (`MaAccount`);

--
-- Chỉ mục cho bảng `hopdongthue`
--
ALTER TABLE `hopdongthue`
  ADD PRIMARY KEY (`id`),
  ADD KEY `MaChuTro` (`MaChuTro`),
  ADD KEY `MaKhachTro` (`MaKhachTro`),
  ADD KEY `MaPhongTro` (`MaPhongTro`),
  ADD KEY `MaPhuongThuc` (`MaPhuongThuc`);

--
-- Chỉ mục cho bảng `khachtro`
--
ALTER TABLE `khachtro`
  ADD PRIMARY KEY (`MaKhachTro`),
  ADD KEY `MaAccount` (`MaAccount`);

--
-- Chỉ mục cho bảng `nhatro`
--
ALTER TABLE `nhatro`
  ADD PRIMARY KEY (`MaNhaTro`),
  ADD KEY `MaChuTro` (`MaChuTro`);

--
-- Chỉ mục cho bảng `phieudanhgiakhachtro`
--
ALTER TABLE `phieudanhgiakhachtro`
  ADD PRIMARY KEY (`id`),
  ADD KEY `MaChuTro` (`MaChuTro`),
  ADD KEY `MaKhachTro` (`MaKhachTro`);

--
-- Chỉ mục cho bảng `phongtro`
--
ALTER TABLE `phongtro`
  ADD PRIMARY KEY (`MaPhongTro`),
  ADD KEY `MaNhaTro` (`MaNhaTro`);

--
-- Chỉ mục cho bảng `phuongthucthanhtoan`
--
ALTER TABLE `phuongthucthanhtoan`
  ADD PRIMARY KEY (`MaPhuongThuc`);

--
-- Chỉ mục cho bảng `picture`
--
ALTER TABLE `picture`
  ADD PRIMARY KEY (`id`),
  ADD KEY `MaPhongTro` (`MaPhongTro`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `account`
--
ALTER TABLE `account`
  MODIFY `MaAccount` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT cho bảng `chutro`
--
ALTER TABLE `chutro`
  MODIFY `MaChuTro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT cho bảng `hopdongthue`
--
ALTER TABLE `hopdongthue`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT cho bảng `khachtro`
--
ALTER TABLE `khachtro`
  MODIFY `MaKhachTro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `nhatro`
--
ALTER TABLE `nhatro`
  MODIFY `MaNhaTro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT cho bảng `phieudanhgiakhachtro`
--
ALTER TABLE `phieudanhgiakhachtro`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `phongtro`
--
ALTER TABLE `phongtro`
  MODIFY `MaPhongTro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `phuongthucthanhtoan`
--
ALTER TABLE `phuongthucthanhtoan`
  MODIFY `MaPhuongThuc` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `picture`
--
ALTER TABLE `picture`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `chutro`
--
ALTER TABLE `chutro`
  ADD CONSTRAINT `chutro_ibfk_1` FOREIGN KEY (`MaAccount`) REFERENCES `account` (`MaAccount`);

--
-- Các ràng buộc cho bảng `hopdongthue`
--
ALTER TABLE `hopdongthue`
  ADD CONSTRAINT `hopdongthue_ibfk_1` FOREIGN KEY (`MaChuTro`) REFERENCES `chutro` (`MaChuTro`),
  ADD CONSTRAINT `hopdongthue_ibfk_2` FOREIGN KEY (`MaKhachTro`) REFERENCES `khachtro` (`MaKhachTro`),
  ADD CONSTRAINT `hopdongthue_ibfk_3` FOREIGN KEY (`MaPhongTro`) REFERENCES `phongtro` (`MaPhongTro`),
  ADD CONSTRAINT `hopdongthue_ibfk_4` FOREIGN KEY (`MaPhuongThuc`) REFERENCES `phuongthucthanhtoan` (`MaPhuongThuc`);

--
-- Các ràng buộc cho bảng `khachtro`
--
ALTER TABLE `khachtro`
  ADD CONSTRAINT `khachtro_ibfk_1` FOREIGN KEY (`MaAccount`) REFERENCES `account` (`MaAccount`);

--
-- Các ràng buộc cho bảng `nhatro`
--
ALTER TABLE `nhatro`
  ADD CONSTRAINT `nhatro_ibfk_1` FOREIGN KEY (`MaChuTro`) REFERENCES `chutro` (`MaChuTro`);

--
-- Các ràng buộc cho bảng `phieudanhgiakhachtro`
--
ALTER TABLE `phieudanhgiakhachtro`
  ADD CONSTRAINT `phieudanhgiakhachtro_ibfk_1` FOREIGN KEY (`MaChuTro`) REFERENCES `chutro` (`MaChuTro`),
  ADD CONSTRAINT `phieudanhgiakhachtro_ibfk_2` FOREIGN KEY (`MaKhachTro`) REFERENCES `khachtro` (`MaKhachTro`);

--
-- Các ràng buộc cho bảng `phongtro`
--
ALTER TABLE `phongtro`
  ADD CONSTRAINT `phongtro_ibfk_1` FOREIGN KEY (`MaNhaTro`) REFERENCES `nhatro` (`MaNhaTro`);

--
-- Các ràng buộc cho bảng `picture`
--
ALTER TABLE `picture`
  ADD CONSTRAINT `picture_ibfk_1` FOREIGN KEY (`MaPhongTro`) REFERENCES `phongtro` (`MaPhongTro`) ON DELETE NO ACTION ON UPDATE NO ACTION;

DELIMITER $$
--
-- Sự kiện
--
CREATE DEFINER=`root`@`localhost` EVENT `delete_unverified_accounts_event` ON SCHEDULE EVERY 1 MINUTE STARTS '2023-04-04 18:33:32' ON COMPLETION NOT PRESERVE ENABLE DO BEGIN
    DELETE FROM `account`
    WHERE `verify` = 0 AND TIMEDIFF(NOW(), `dateCreate`) > '00:15:00';
  END$$

DELIMITER ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
