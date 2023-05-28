-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 18, 2023 at 12:55 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.2.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nha`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `MaAccount` int(11) NOT NULL,
  `Email` text NOT NULL,
  `hashPass` text NOT NULL,
  `role` tinyint(1) NOT NULL,
  `dateCreate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updateTime` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `verify` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`MaAccount`, `Email`, `hashPass`, `role`, `dateCreate`, `updateTime`, `verify`) VALUES
(34, 'lphoanglong1304@gmail.com', '$argon2i$v=19$m=65536,t=4,p=1$NVY2cXVCWC9meTAyN1A4Mw$Eu8cZ8AZ6HZmiFsaCnkYAcU9gLtHZQy/sMQfKjlU6+o', 0, '2023-04-03 13:32:22', '2023-04-11 07:47:56', 1),
(35, 'than.gio.kid@gmail.com', '$argon2i$v=19$m=65536,t=4,p=1$NVY2cXVCWC9meTAyN1A4Mw$Eu8cZ8AZ6HZmiFsaCnkYAcU9gLtHZQy/sMQfKjlU6+o', 1, '2023-04-03 13:32:53', '2023-04-11 07:47:56', 1),
(77, 'mine1342001@gmail.com', '$argon2i$v=19$m=65536,t=4,p=1$eEg2VUEzQzdYTVBBVy43ZQ$xmjnSOob7cGjzZjUuoUVrd8NYafva4jcBYRBwQsKsPs', 1, '2023-04-11 07:49:00', '2023-04-11 07:50:32', 1),
(78, 'lphoanglong130401@gmail.com', '$argon2i$v=19$m=65536,t=4,p=1$ZFNqaGRUa29KZUZuWFMxWA$szLhB7H5QCcHLy1eVTLx5rUjKkFYu219DVI4QaExHA8', 1, '2023-04-25 05:43:56', '2023-04-27 13:21:45', 1),
(79, 'thaibinh06102000@gmail.com', '$argon2i$v=19$m=65536,t=4,p=1$Tlc3aUxteGc3STNLaTRncA$cEQNknyNmd0G2xnX6y3ORE+GhgAgyNB/dy5q2/FY4PQ', 1, '2023-05-05 10:51:47', '2023-05-09 10:14:11', 1),
(80, 'kenkainguyettram@gmail.com', '$argon2i$v=19$m=65536,t=4,p=1$TzU5RFhDZ2pmMkJwMGRBQQ$Ztp+0bpjeQxlARDKYl1BuQs5RXOQYzlwdlEwSOu4RB4', 0, '2023-05-07 09:31:47', '2023-05-07 09:32:18', 1),
(81, 'miraikazuo2000@gmail.com', '$argon2i$v=19$m=65536,t=4,p=1$cVh0R3VST0dITlp6cld5SQ$v5l62Xc2PZaLg9ThLtchb0+h2uKLCdyjK0j1bEAFxxA', 1, '2023-05-09 12:25:09', '2023-05-09 12:25:09', 1),
(82, 'chemenhkheng@gmail.com', '$argon2i$v=19$m=65536,t=4,p=1$b3FNR05rT0VYQk5hd3ZUdA$0uvcH1uTiMI11THGpPTl/fP/nXEqou2dAcSrYT1LtPA', 0, '2023-05-17 06:37:46', '2023-05-17 06:37:46', 0),
(83, 'chemenhkhieng2k@gmail.com', '$argon2i$v=19$m=65536,t=4,p=1$YmZtZlo5aG4yUGxwLkVNcQ$rDqToqKBGZV9a1NSFpbPmFLDC3AEO8GlVq6iNOCWZUc', 1, '2023-05-17 07:00:35', '2023-05-17 07:01:20', 1),
(84, 'chemenhkhieng2000@gmail.com', '$argon2i$v=19$m=65536,t=4,p=1$YkNjbUI5TVBSVjNJVTBBNA$6Xw7850DWI0bzv/P5DfGaN4rJc9Cg9ozY7Lix4Rzs3A', 0, '2023-05-17 17:35:03', '2023-05-17 17:36:15', 1);

-- --------------------------------------------------------

--
-- Table structure for table `chutro`
--

CREATE TABLE `chutro` (
  `MaChuTro` int(11) NOT NULL,
  `MaAccount` int(11) NOT NULL,
  `Ten` text NOT NULL,
  `CMND` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `chutro`
--

INSERT INTO `chutro` (`MaChuTro`, `MaAccount`, `Ten`, `CMND`) VALUES
(7, 34, 'Long', '123'),
(17, 80, 'Nguyễn Thái Bình', '888'),
(18, 84, 'Tạ Minh Cường', '2042394023940');

-- --------------------------------------------------------

--
-- Table structure for table `hopdongthue`
--

CREATE TABLE `hopdongthue` (
  `id` int(11) NOT NULL,
  `MaPhongTro` int(11) NOT NULL,
  `MaChuTro` int(11) NOT NULL,
  `MaKhachTro` int(11) NOT NULL,
  `sothangthue` int(11) DEFAULT NULL,
  `thanhtien` text NOT NULL,
  `ngaylaphoadon` datetime NOT NULL,
  `ngaytraphong` datetime DEFAULT NULL,
  `ngaynhanphong` datetime DEFAULT NULL,
  `MaPhuongThuc` int(11) NOT NULL,
  `ngayhuyhopdong` datetime DEFAULT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT 1,
  `sdt` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hopdongthue`
--

INSERT INTO `hopdongthue` (`id`, `MaPhongTro`, `MaChuTro`, `MaKhachTro`, `sothangthue`, `thanhtien`, `ngaylaphoadon`, `ngaytraphong`, `ngaynhanphong`, `MaPhuongThuc`, `ngayhuyhopdong`, `visible`, `sdt`) VALUES
(3, 6, 7, 9, 1, '2100000', '2023-04-29 00:00:00', '2023-05-02 00:00:00', '2023-06-02 00:00:00', 1, NULL, 1, '0909298578'),
(5, 8, 17, 10, 1, '300000', '2023-05-09 00:00:00', '2023-06-12 00:00:00', '2023-05-12 00:00:00', 1, NULL, 2, '0123456'),
(13, 8, 17, 10, 1, '300000', '2023-05-12 00:00:00', '2023-06-15 00:00:00', '2023-05-15 00:00:00', 1, NULL, 1, '0123456'),
(18, 4, 7, 10, 4, '5400000', '2023-05-12 00:00:00', '2023-09-15 00:00:00', '2023-05-15 00:00:00', 1, NULL, 2, '0123456'),
(19, 15, 17, 10, 1, '2500000', '2023-05-13 00:00:00', '2023-06-16 00:00:00', '2023-05-16 00:00:00', 2, NULL, 2, '0123456'),
(20, 14, 17, 10, 5, '12500000', '2023-05-13 00:00:00', '2023-10-16 00:00:00', '2023-05-16 00:00:00', 1, NULL, 2, '0123456'),
(23, 29, 17, 10, 7, '17500000', '2023-05-16 00:00:00', '2023-12-16 00:00:00', '2023-05-09 00:00:00', 1, NULL, 1, '0123456'),
(24, 19, 17, 10, 2, '5000000', '2023-05-14 00:00:00', '2023-07-17 00:00:00', '2023-05-17 00:00:00', 1, NULL, 1, '789'),
(26, 35, 7, 10, 1, '1350000', '2023-05-14 00:00:00', '2023-06-17 00:00:00', '2023-05-17 00:00:00', 1, NULL, 1, '0123456'),
(27, 34, 17, 10, 1, '1300000', '2023-05-14 00:00:00', '2023-06-17 00:00:00', '2023-05-17 00:00:00', 1, NULL, 1, '0123456'),
(28, 4, 7, 11, 1, '1350000', '2023-05-17 00:00:00', '2023-06-20 00:00:00', '2023-05-20 00:00:00', 1, NULL, 1, '0834493904');

-- --------------------------------------------------------

--
-- Table structure for table `khachtro`
--

CREATE TABLE `khachtro` (
  `MaKhachTro` int(11) NOT NULL,
  `MaAccount` int(11) NOT NULL,
  `Ten` text NOT NULL,
  `CMND` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `khachtro`
--

INSERT INTO `khachtro` (`MaKhachTro`, `MaAccount`, `Ten`, `CMND`) VALUES
(1, 35, 'Phong', '123'),
(8, 77, 'Long Guest', '0792xxxxxxxx'),
(9, 78, 'Long Guest Test', '1'),
(10, 81, 'Nguyễn Thái Bình', '0792036'),
(11, 83, 'Ông Bụt', '0834493904');

-- --------------------------------------------------------

--
-- Table structure for table `nhatro`
--

CREATE TABLE `nhatro` (
  `MaNhaTro` int(11) NOT NULL,
  `DiaChi` text NOT NULL,
  `MoTaNhaTro` text NOT NULL,
  `MaChuTro` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `nhatro`
--

INSERT INTO `nhatro` (`MaNhaTro`, `DiaChi`, `MoTaNhaTro`, `MaChuTro`) VALUES
(23, '461c Bình Đông', 'Đẹp, có máy lạnh', 7),
(24, '2A Bình thạnh', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\r\n', 7),
(27, 'Lorem Ipsum', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\r\n', 7),
(28, '45/18 Lê Cơ , khu phố 4', 'Có bãi gửi xe rộng, có wifi miễn phí', 17),
(29, '45/32 Hoàng Văn Chiểu', 'Có bãi gửi xe rộng, có wifi miễn phí', 17),
(30, '96/56/2  Tran Hung Dao', 'Có bãi gửi xe rộng, có wifi miễn phí', 17),
(33, '10 Vĩnh Phú 41, Phường Vĩnh Phú, TP Thuận An, Tỉnh Bình Dương', 'Nhà mới xây, thoáng mát, sạch sẽ', 18),
(34, '20 Trần Hưng Đạo, Phường Lái Thiêu, TP Thuận An, Tỉnh Bình Dương', 'Nhà trọ homestay thích hợp cho 4 người ở', 18),
(35, '30 Ngô Gia Tự, Huyện Dĩ An, TP Dĩ An, Tỉnh Bình Dương', 'Nhà giá rẻ thích hợp cho sinh viên ở', 18),
(36, '40 Ngô Quyền, Huyện Dầu Tiếng, TP Thủ Dầu Một, Tỉnh Bình Dương', 'Nhà trọ sạch đẹp, giá rẻ, thích hợp cho công nhân', 18),
(37, '50 Điện Biên Phủ, Quận Bình Thạnh, TP Hồ Chí Minh', 'Nhà trọ giá rẻ, gần trường đại học Hutech, thích hợp cho sinh viên', 18),
(38, '60 Phạm Văn Đồng, TP Thủ Đức, TP Hồ Chí Minh', 'Nhà trọ giá rẻ bình dân', 18),
(39, '70 Bạch Đằng, Phường Cát Lái, TP Hồ Chí Minh', 'Nhà trọ giá rẻ thích hợp cho sinh viên', 18),
(40, '80 Sóng Thần, KCN Sóng Thần, Tỉnh Bình Dương', 'Nhà trọ thoáng mát, sạch sẽ thích hợp cho công nhân', 18),
(41, '15 Trần Não, Quận 2, TP Hồ Chí Minh', 'Nhà trọ sạch đẹp, giao thuận thuận tiện cho việc đi lại', 18),
(42, '25 Lương Định, Quận 2, TP Hồ Chí Minh', 'Nhà trọ chi phí thấp, sát bên trung tâm thành phố', 18),
(43, '35 Cách Mạng Tháng Tám, Phường An Thạnh, Tỉnh Bình Dương', 'Nhà trọ cao cấp', 18),
(44, '45 Hồ Hoàn Kiếm, Quận 1, TP Hồ Chí Minh', 'Nhà trọ thoáng mát, gần ngay công viên con rùa', 18),
(45, '55 Nhà bè, Quận 1, TP Hồ Chí Minh', 'Nhà trọ giá rẻ bình dân thoáng mát dành cho sinh viên', 18),
(46, '65 Cây Bàng, Quận Tân Bình, TP Hồ Chí Minh', 'Nhà trọ sạch đẹp, có đầy đủ tiện nghi', 18),
(47, '11 Thống Nhất, Quận Bình Thạnh, TP Hồ Chí Minh', 'Nhà trọ mới xây, giá rẻ, sạch đẹp, có đầy đủ tiện nghi', 18);

-- --------------------------------------------------------

--
-- Table structure for table `phieudanhgiakhachtro`
--

CREATE TABLE `phieudanhgiakhachtro` (
  `id` int(11) NOT NULL,
  `MaChuTro` int(11) NOT NULL,
  `MaKhachTro` int(11) NOT NULL,
  `MaPhongTro` int(11) NOT NULL,
  `DiemDanhGiaMoiTruong` int(11) DEFAULT NULL,
  `DiemDanhGiaAnNinh` int(11) DEFAULT NULL,
  `DiemDanhGiaLuatPhap` int(11) DEFAULT NULL,
  `DiemDanhGiaThaiDo` int(11) DEFAULT NULL,
  `DiemDanhGiaTienDungHen` int(11) DEFAULT NULL,
  `DiemDanhGiaTaiSanChung` int(11) DEFAULT NULL,
  `DiemDanhGiaVanHoaDaoDuc` int(11) DEFAULT NULL,
  `AvgKhachTro` int(11) DEFAULT NULL,
  `RoleEvalKhachTro` int(11) DEFAULT NULL,
  `TimeEvelAbove` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `phieudanhgiakhachtro`
--

INSERT INTO `phieudanhgiakhachtro` (`id`, `MaChuTro`, `MaKhachTro`, `MaPhongTro`, `DiemDanhGiaMoiTruong`, `DiemDanhGiaAnNinh`, `DiemDanhGiaLuatPhap`, `DiemDanhGiaThaiDo`, `DiemDanhGiaTienDungHen`, `DiemDanhGiaTaiSanChung`, `DiemDanhGiaVanHoaDaoDuc`, `AvgKhachTro`, `RoleEvalKhachTro`, `TimeEvelAbove`) VALUES
(3, 7, 9, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL),
(4, 17, 10, 8, 10, 8, 8, 10, 6, 6, 10, 6, 2, '2023-05-14 21:51:42'),
(5, 17, 10, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL),
(6, 7, 10, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL),
(7, 17, 10, 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL),
(8, 17, 10, 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL),
(9, 17, 10, 29, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL),
(11, 17, 10, 34, 10, 8, 8, 8, 10, 10, 8, 6, 2, '2023-05-14 21:51:06');

-- --------------------------------------------------------

--
-- Table structure for table `phieudanhgiaphongtro`
--

CREATE TABLE `phieudanhgiaphongtro` (
  `IdEval` int(11) NOT NULL,
  `MaKhachTro` int(11) NOT NULL,
  `MaPhongTro` int(11) NOT NULL,
  `DiemDanhGiaSachSe` int(11) DEFAULT NULL,
  `DiemDanhGiaNguonNuoc` int(11) DEFAULT NULL,
  `DiemDanhGiaKhongNgapNuoc` int(11) DEFAULT NULL,
  `DiemDanhGiaKhoaCua` int(11) DEFAULT NULL,
  `DiemDanhGiaCongToDien` int(11) DEFAULT NULL,
  `DiemDanhGiaNhaXe` int(11) DEFAULT NULL,
  `DiemDanhGiaHangXom` int(11) DEFAULT NULL,
  `DiemDanhGiaNhaChu` int(11) DEFAULT NULL,
  `DiemDanhGiaGiaNuocHopLy` int(11) DEFAULT NULL,
  `DiemDanhGiaGiaThueHopLy` int(11) DEFAULT NULL,
  `AvgPhongTro` int(11) DEFAULT NULL,
  `RoleEval` int(11) DEFAULT NULL,
  `TimeEval` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `phieudanhgiaphongtro`
--

INSERT INTO `phieudanhgiaphongtro` (`IdEval`, `MaKhachTro`, `MaPhongTro`, `DiemDanhGiaSachSe`, `DiemDanhGiaNguonNuoc`, `DiemDanhGiaKhongNgapNuoc`, `DiemDanhGiaKhoaCua`, `DiemDanhGiaCongToDien`, `DiemDanhGiaNhaXe`, `DiemDanhGiaHangXom`, `DiemDanhGiaNhaChu`, `DiemDanhGiaGiaNuocHopLy`, `DiemDanhGiaGiaThueHopLy`, `AvgPhongTro`, `RoleEval`, `TimeEval`) VALUES
(1, 9, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL),
(2, 10, 8, 8, 8, 6, 6, 6, 6, 10, 8, 10, 10, 8, 2, '2023-05-14 20:45:50'),
(3, 10, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL),
(4, 10, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL),
(5, 10, 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL),
(6, 10, 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL),
(7, 10, 29, 10, 8, 10, 8, 10, 8, 10, 8, 10, 8, 9, 2, '2023-05-14 20:26:50'),
(11, 10, 34, 10, 8, 10, 8, 10, 8, 10, 8, 10, 8, 9, 2, '2023-05-14 20:23:44');

-- --------------------------------------------------------

--
-- Table structure for table `phongtro`
--

CREATE TABLE `phongtro` (
  `MaPhongTro` int(11) NOT NULL,
  `MaNhaTro` int(11) NOT NULL,
  `MoTaPhongTro` text NOT NULL,
  `GiaThue` text NOT NULL,
  `DienTich` text NOT NULL,
  `SoPhong` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `phongtro`
--

INSERT INTO `phongtro` (`MaPhongTro`, `MaNhaTro`, `MoTaPhongTro`, `GiaThue`, `DienTich`, `SoPhong`) VALUES
(4, 24, '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\r\n', '1350000', '40', 'B01.02'),
(5, 24, 'có máy nước nóng', '1400000', '40', 'B01.03'),
(6, 23, 'có nước nóng\r\ncó máy lạnh\r\nbao bếp ga\r\ncó  lò sưởi khắp phòng\r\nthuê ngay 12 tháng được tặng 2 tháng', '2100000', '50', 'A05.03'),
(8, 29, '<p>Nh&agrave; tro nằm tr&ecirc;n đường&nbsp;45/32 Ho&agrave;ng Văn Chiểu. C&aacute;ch bệnh viện khoảng 2km, 10 ph&uacute;t đi bộ tới c&ocirc;ng vi&ecirc;n vui chơi.</p>\r\n<p><img src=\"https://s-housing.vn/wp-content/uploads/2022/09/thiet-ke-phong-tro-dep-7.jpg\" /></p>\r\n<p>H&igrave;nh ảnh 1: M&ocirc; tả ẩn dụ ph&ograve;ng trọ</p>\r\n<p>Ph&ograve;ng trọ c&oacute; g&aacute;c xếp 1 ph&ograve;ng bếp, 2 ph&ograve;ng ngủ, 1 ph&ograve;ng tắm , 1 ph&ograve;ng vệ sinh,&nbsp; c&oacute; 1 cửa sổ lớn để c&oacute; thể nh&igrave;n ra b&ecirc;n ngo&agrave;i</p>\r\n', '300000', '35', 'C02-22'),
(9, 29, '<p>Ph&ograve;ng trọ c&oacute; diện t&iacute;ch 25m2 gồm 1 g&aacute;c, 2 chỗ ngủ, một ph&ograve;ng vệ sinh,1 nh&agrave; bếp, 1 ph&ograve;ng kh&aacute;ch. Ngo&agrave;i ra ph&ograve;ng trọ c&oacute; 1 ban c&ocirc;ng ri&ecirc;ng rộng 3m2 kh&ocirc;ng được t&iacute;nh chung với diện t&iacute;ch ph&ograve;ng trọ, d&ugrave;ng dể phơi quần &aacute;o.</p>\r\n<p><img alt=\"\" src=\"https://taxitai.org/wp-content/uploads/2021/04/nha-tro22.jpg\" /></p>\r\n\r\n<p>H&igrave;nh ảnh 1: H&igrave;nh m&ocirc; t&agrave; ẩn dụ cho ph&ograve;ng trọ</p>\r\n\r\n<p>Ngo&agrave;i ra chủ nh&agrave; trọ c&ograve;n t&iacute;ch hợp cho mỗi ph&ograve;ng trọ c&oacute; t&iacute;ch hợp một m&aacute;y ph&aacute;t wifi cho người ở. Chi ph&iacute; gửi xe ở đ&acirc;y l&agrave; miễn ph&iacute; cho mỗi một ph&ograve;ng trọ 3 chiếc xe (ngoại trừ c&aacute;c loại xe cỡ lớn như xe hơi, xe tải,...).</p>\r\n\r\n<p>&nbsp;</p>', '1300000', '25', 'D22-07'),
(10, 28, '<p>Ph&ograve;ng n&agrave;y c&oacute; 1 g&aacute;c , 1 ph&ograve;ng ngủ 1 , 1 ph&ograve;ng vệ sinh, 1 ph&ograve;ng bếp. Khu vưc nh&agrave; trọ gần bệnh viện, gần đồn c&ocirc;ng an.</p>\r\n\r\n<p><img alt=\"\" src=\"https://img.meta.com.vn/Data/image/2020/11/24/mau-decor-trang-tri-phong-tro-sinh-vien-4.jpg\" style=\"height:458px; width:600px\" /></p>\r\n', '750000', '25', 'G22-026'),
(11, 29, '<p>Căn hộ n&agrave;y thuộc căn chung cư cao 70 tầng.</p>\r\n\r\n<p>Căn hộ n&aacute;y c&oacute; diện t&iacute;ch 50m2, bao gồm 2 ph&ograve;ng ngủ, 2 ph&ograve;ng vệ sinh, 1 ph&ograve;ng bếp, 1 ban c&ocirc;ng rộng 5m2. Phần ban c&ocirc;ng kh&ocirc;ng được t&iacute;nh v&agrave;o diện t&iacute;ch căn hộ.</p>\r\n\r\n<p><img alt=\"\" src=\"https://img.meta.com.vn/Data/image/2020/11/24/mau-decor-trang-tri-phong-tro-sinh-vien-4.jpg\" style=\"height:458px; width:600px\" /></p>\r\n', '1300000', '50', 'C59-22'),
(12, 30, '<p>Căn hộ thuộc t&ograve;a cao ốc ABCD.</p>\r\n\r\n<p>Căn họ n&agrave;y c&oacute; 3 ph&ograve;ng ngủ, 2 ph&ograve;ng vệ sinh, 1 ph&ograve;ng bếp, 1 ph&ograve;ng kh&aacute;ch, 1 ban c&ocirc;ng rộng 5m2 kh&ocirc;ng được t&iacute;nh v&agrave;o diện t&iacute;ch căn hộ.</p>\r\n\r\n<p><img alt=\"\" src=\"https://img.meta.com.vn/Data/image/2020/11/24/mau-decor-trang-tri-phong-tro-sinh-vien-4.jpg\" style=\"height:458px; width:600px\" /></p>\r\n', '1600000', '60', 'A07-01'),
(13, 30, '<p>Căn hộ thuộc t&ograve;a cao ốc ABCD.</p>\r\n\r\n<p>Căn họ n&agrave;y c&oacute; 3 ph&ograve;ng ngủ, 2 ph&ograve;ng vệ sinh, 1 ph&ograve;ng bếp, 1 ph&ograve;ng kh&aacute;ch, 1 ban c&ocirc;ng rộng 5m2 kh&ocirc;ng được t&iacute;nh v&agrave;o diện t&iacute;ch căn hộ.</p>\r\n\r\n<p><img alt=\"\" src=\"https://img.meta.com.vn/Data/image/2020/11/24/mau-decor-trang-tri-phong-tro-sinh-vien-4.jpg\" style=\"height:458px; width:600px\" /></p>\r\n', '2500000', '60', 'F93-03'),
(14, 30, '<p>Căn hộ thuộc t&ograve;a cao ốc ABCD.</p>\r\n\r\n<p>Căn họ n&agrave;y c&oacute; 3 ph&ograve;ng ngủ, 2 ph&ograve;ng vệ sinh, 1 ph&ograve;ng bếp, 1 ph&ograve;ng kh&aacute;ch, 1 ban c&ocirc;ng rộng 5m2 kh&ocirc;ng được t&iacute;nh v&agrave;o diện t&iacute;ch căn hộ.</p>\r\n\r\n<p><img alt=\"\" src=\"https://img.meta.com.vn/Data/image/2020/11/24/mau-decor-trang-tri-phong-tro-sinh-vien-4.jpg\" style=\"height:458px; width:600px\" /></p>\r\n', '2500000', '70', 'F97-03'),
(15, 30, '<p>Căn hộ thuộc t&ograve;a cao ốc ABCD.</p>\r\n\r\n<p>Căn họ n&agrave;y c&oacute; 3 ph&ograve;ng ngủ, 2 ph&ograve;ng vệ sinh, 1 ph&ograve;ng bếp, 1 ph&ograve;ng kh&aacute;ch, 1 ban c&ocirc;ng rộng 5m2 kh&ocirc;ng được t&iacute;nh v&agrave;o diện t&iacute;ch căn hộ.</p>\r\n\r\n<p><img alt=\"\" src=\"https://img.meta.com.vn/Data/image/2020/11/24/mau-decor-trang-tri-phong-tro-sinh-vien-4.jpg\" style=\"height:458px; width:600px\" /></p>\r\n', '2500000', '60', 'F57-03'),
(16, 30, '<p>Căn hộ thuộc t&ograve;a cao ốc ABCD.</p>\r\n\r\n<p>Căn họ n&agrave;y c&oacute; 3 ph&ograve;ng ngủ, 2 ph&ograve;ng vệ sinh, 1 ph&ograve;ng bếp, 1 ph&ograve;ng kh&aacute;ch, 1 ban c&ocirc;ng rộng 5m2 kh&ocirc;ng được t&iacute;nh v&agrave;o diện t&iacute;ch căn hộ.</p>\r\n\r\n<p><img alt=\"\" src=\"https://img.meta.com.vn/Data/image/2020/11/24/mau-decor-trang-tri-phong-tro-sinh-vien-4.jpg\" style=\"height:458px; width:600px\" /></p>\r\n', '2500000', '60', 'F37-03'),
(17, 30, '<p>Căn hộ thuộc t&ograve;a cao ốc ABCD.</p> <p>Căn họ n&agrave;y c&oacute; 3 ph&ograve;ng ngủ, 2 ph&ograve;ng vệ sinh, 1 ph&ograve;ng bếp, 1 ph&ograve;ng kh&aacute;ch, 1 ban c&ocirc;ng rộng 5m2 kh&ocirc;ng được t&iacute;nh v&agrave;o diện t&iacute;ch căn hộ.</p> <p><img alt=\"\" src=\"https://img.meta.com.vn/Data/image/2020/11/24/mau-decor-trang-tri-phong-tro-sinh-vien-4.jpg\" style=\"height:458px; width:600px\" /></p> ', '2500000', '80', 'B37-03'),
(18, 30, '<p>Căn hộ thuộc t&ograve;a cao ốc ABCD.</p> <p>Căn họ n&agrave;y c&oacute; 3 ph&ograve;ng ngủ, 2 ph&ograve;ng vệ sinh, 1 ph&ograve;ng bếp, 1 ph&ograve;ng kh&aacute;ch, 1 ban c&ocirc;ng rộng 5m2 kh&ocirc;ng được t&iacute;nh v&agrave;o diện t&iacute;ch căn hộ.</p> <p><img alt=\"\" src=\"https://img.meta.com.vn/Data/image/2020/11/24/mau-decor-trang-tri-phong-tro-sinh-vien-4.jpg\" style=\"height:458px; width:600px\" /></p> ', '2500000', '70', 'A37-03'),
(19, 30, '<p>Căn hộ thuộc t&ograve;a cao ốc ABCD.</p> <p>Căn họ n&agrave;y c&oacute; 3 ph&ograve;ng ngủ, 2 ph&ograve;ng vệ sinh, 1 ph&ograve;ng bếp, 1 ph&ograve;ng kh&aacute;ch, 1 ban c&ocirc;ng rộng 5m2 kh&ocirc;ng được t&iacute;nh v&agrave;o diện t&iacute;ch căn hộ.</p> <p><img alt=\"\" src=\"https://img.meta.com.vn/Data/image/2020/11/24/mau-decor-trang-tri-phong-tro-sinh-vien-4.jpg\" style=\"height:458px; width:600px\" /></p> ', '2500000', '90', 'C91-03'),
(20, 30, '<p>Căn hộ thuộc t&ograve;a cao ốc ABCD.</p> <p>Căn họ n&agrave;y c&oacute; 3 ph&ograve;ng ngủ, 2 ph&ograve;ng vệ sinh, 1 ph&ograve;ng bếp, 1 ph&ograve;ng kh&aacute;ch, 1 ban c&ocirc;ng rộng 5m2 kh&ocirc;ng được t&iacute;nh v&agrave;o diện t&iacute;ch căn hộ.</p> <p><img alt=\"\" src=\"https://img.meta.com.vn/Data/image/2020/11/24/mau-decor-trang-tri-phong-tro-sinh-vien-4.jpg\" style=\"height:458px; width:600px\" /></p> ', '2500000', '60', 'E31-09'),
(21, 30, '<p>Căn hộ thuộc t&ograve;a cao ốc ABCD.</p>\r\n\r\n<p>Căn họ n&agrave;y c&oacute; 3 ph&ograve;ng ngủ, 2 ph&ograve;ng vệ sinh, 1 ph&ograve;ng bếp, 1 ph&ograve;ng kh&aacute;ch, 1 ban c&ocirc;ng rộng 5m2 kh&ocirc;ng được t&iacute;nh v&agrave;o diện t&iacute;ch căn hộ.</p>\r\n\r\n<p><img alt=\"\" src=\"https://img.meta.com.vn/Data/image/2020/11/24/mau-decor-trang-tri-phong-tro-sinh-vien-4.jpg\" style=\"height:458px; width:600px\" /></p>\r\n', '2500000', '60', 'F37-03'),
(22, 29, '<p>Căn hộ n&agrave;y thuộc căn chung cư cao 70 tầng.</p>\r\n\r\n<p>Căn hộ n&aacute;y c&oacute; diện t&iacute;ch 50m2, bao gồm 2 ph&ograve;ng ngủ, 2 ph&ograve;ng vệ sinh, 1 ph&ograve;ng bếp, 1 ban c&ocirc;ng rộng 5m2. Phần ban c&ocirc;ng kh&ocirc;ng được t&iacute;nh v&agrave;o diện t&iacute;ch căn hộ.</p>\r\n\r\n<p><img alt=\"\" src=\"https://img.meta.com.vn/Data/image/2020/11/24/mau-decor-trang-tri-phong-tro-sinh-vien-4.jpg\" style=\"height:458px; width:600px\" /></p>\r\n', '1300000', '50', 'C59-22'),
(23, 30, '<p>Căn hộ thuộc t&ograve;a cao ốc ABCD.</p>\r\n\r\n<p>Căn họ n&agrave;y c&oacute; 3 ph&ograve;ng ngủ, 2 ph&ograve;ng vệ sinh, 1 ph&ograve;ng bếp, 1 ph&ograve;ng kh&aacute;ch, 1 ban c&ocirc;ng rộng 5m2 kh&ocirc;ng được t&iacute;nh v&agrave;o diện t&iacute;ch căn hộ.</p>\r\n\r\n<p><img alt=\"\" src=\"https://img.meta.com.vn/Data/image/2020/11/24/mau-decor-trang-tri-phong-tro-sinh-vien-4.jpg\" style=\"height:458px; width:600px\" /></p>\r\n', '1600000', '60', 'A07-01'),
(24, 30, '<p>Căn hộ thuộc t&ograve;a cao ốc ABCD.</p>\r\n\r\n<p>Căn họ n&agrave;y c&oacute; 3 ph&ograve;ng ngủ, 2 ph&ograve;ng vệ sinh, 1 ph&ograve;ng bếp, 1 ph&ograve;ng kh&aacute;ch, 1 ban c&ocirc;ng rộng 5m2 kh&ocirc;ng được t&iacute;nh v&agrave;o diện t&iacute;ch căn hộ.</p>\r\n\r\n<p><img alt=\"\" src=\"https://img.meta.com.vn/Data/image/2020/11/24/mau-decor-trang-tri-phong-tro-sinh-vien-4.jpg\" style=\"height:458px; width:600px\" /></p>\r\n', '2500000', '60', 'A37-03'),
(25, 30, '<p>Căn hộ thuộc t&ograve;a cao ốc ABCD.</p>\r\n\r\n<p>Căn họ n&agrave;y c&oacute; 3 ph&ograve;ng ngủ, 2 ph&ograve;ng vệ sinh, 1 ph&ograve;ng bếp, 1 ph&ograve;ng kh&aacute;ch, 1 ban c&ocirc;ng rộng 5m2 kh&ocirc;ng được t&iacute;nh v&agrave;o diện t&iacute;ch căn hộ.</p>\r\n\r\n<p><img alt=\"\" src=\"https://img.meta.com.vn/Data/image/2020/11/24/mau-decor-trang-tri-phong-tro-sinh-vien-4.jpg\" style=\"height:458px; width:600px\" /></p>\r\n', '1600000', '60', 'B07-01'),
(26, 30, '<p>Căn hộ thuộc t&ograve;a cao ốc ABCD.</p>\r\n\r\n<p>Căn họ n&agrave;y c&oacute; 3 ph&ograve;ng ngủ, 2 ph&ograve;ng vệ sinh, 1 ph&ograve;ng bếp, 1 ph&ograve;ng kh&aacute;ch, 1 ban c&ocirc;ng rộng 5m2 kh&ocirc;ng được t&iacute;nh v&agrave;o diện t&iacute;ch căn hộ.</p>\r\n\r\n<p><img alt=\"\" src=\"https://img.meta.com.vn/Data/image/2020/11/24/mau-decor-trang-tri-phong-tro-sinh-vien-4.jpg\" style=\"height:458px; width:600px\" /></p>\r\n', '1600000', '60', 'C07-01'),
(27, 29, '<p>Căn hộ n&agrave;y thuộc căn chung cư cao 70 tầng.</p>\r\n\r\n<p>Căn hộ n&aacute;y c&oacute; diện t&iacute;ch 50m2, bao gồm 2 ph&ograve;ng ngủ, 2 ph&ograve;ng vệ sinh, 1 ph&ograve;ng bếp, 1 ban c&ocirc;ng rộng 5m2. Phần ban c&ocirc;ng kh&ocirc;ng được t&iacute;nh v&agrave;o diện t&iacute;ch căn hộ.</p>\r\n\r\n<p><img alt=\"\" src=\"https://img.meta.com.vn/Data/image/2020/11/24/mau-decor-trang-tri-phong-tro-sinh-vien-4.jpg\" style=\"height:458px; width:600px\" /></p>\r\n', '1300000', '50', 'C69-22'),
(28, 29, '<p>Nh&agrave; tro nằm tr&ecirc;n đường&nbsp;45/32 Ho&agrave;ng Văn Chiểu. C&aacute;ch bệnh viện khoảng 2km, 10 ph&uacute;t đi bộ tới c&ocirc;ng vi&ecirc;n vui chơi.</p>\r\n<p><img src=\"https://s-housing.vn/wp-content/uploads/2022/09/thiet-ke-phong-tro-dep-7.jpg\" /></p>\r\n<p>H&igrave;nh ảnh 1: M&ocirc; tả ẩn dụ ph&ograve;ng trọ</p>\r\n<p>Ph&ograve;ng trọ c&oacute; g&aacute;c xếp 1 ph&ograve;ng bếp, 2 ph&ograve;ng ngủ, 1 ph&ograve;ng tắm , 1 ph&ograve;ng vệ sinh,&nbsp; c&oacute; 1 cửa sổ lớn để c&oacute; thể nh&igrave;n ra b&ecirc;n ngo&agrave;i</p>\r\n', '300000', '35', 'C42-22'),
(29, 29, '<p>Nh&agrave; tro nằm tr&ecirc;n đường&nbsp;45/32 Ho&agrave;ng Văn Chiểu. C&aacute;ch bệnh viện khoảng 2km, 10 ph&uacute;t đi bộ tới c&ocirc;ng vi&ecirc;n vui chơi.</p>\r\n<p><img src=\"https://s-housing.vn/wp-content/uploads/2022/09/thiet-ke-phong-tro-dep-7.jpg\" /></p>\r\n<p>H&igrave;nh ảnh 1: M&ocirc; tả ẩn dụ ph&ograve;ng trọ</p>\r\n<p>Ph&ograve;ng trọ c&oacute; g&aacute;c xếp 1 ph&ograve;ng bếp, 2 ph&ograve;ng ngủ, 1 ph&ograve;ng tắm , 1 ph&ograve;ng vệ sinh,&nbsp; c&oacute; 1 cửa sổ lớn để c&oacute; thể nh&igrave;n ra b&ecirc;n ngo&agrave;i</p>\r\n', '300000', '35', 'E42-11'),
(30, 29, '<p>Nh&agrave; tro nằm tr&ecirc;n đường&nbsp;45/32 Ho&agrave;ng Văn Chiểu. C&aacute;ch bệnh viện khoảng 2km, 10 ph&uacute;t đi bộ tới c&ocirc;ng vi&ecirc;n vui chơi.</p>\r\n<p><img src=\"https://s-housing.vn/wp-content/uploads/2022/09/thiet-ke-phong-tro-dep-7.jpg\" /></p>\r\n<p>H&igrave;nh ảnh 1: M&ocirc; tả ẩn dụ ph&ograve;ng trọ</p>\r\n<p>Ph&ograve;ng trọ c&oacute; g&aacute;c xếp 1 ph&ograve;ng bếp, 2 ph&ograve;ng ngủ, 1 ph&ograve;ng tắm , 1 ph&ograve;ng vệ sinh,&nbsp; c&oacute; 1 cửa sổ lớn để c&oacute; thể nh&igrave;n ra b&ecirc;n ngo&agrave;i</p>\r\n', '300000', '35', 'E12-22'),
(31, 29, '<p>Nh&agrave; tro nằm tr&ecirc;n đường&nbsp;45/32 Ho&agrave;ng Văn Chiểu. C&aacute;ch bệnh viện khoảng 2km, 10 ph&uacute;t đi bộ tới c&ocirc;ng vi&ecirc;n vui chơi.</p>\r\n<p><img src=\"https://s-housing.vn/wp-content/uploads/2022/09/thiet-ke-phong-tro-dep-7.jpg\" /></p>\r\n<p>H&igrave;nh ảnh 1: M&ocirc; tả ẩn dụ ph&ograve;ng trọ</p>\r\n<p>Ph&ograve;ng trọ c&oacute; g&aacute;c xếp 1 ph&ograve;ng bếp, 2 ph&ograve;ng ngủ, 1 ph&ograve;ng tắm , 1 ph&ograve;ng vệ sinh,&nbsp; c&oacute; 1 cửa sổ lớn để c&oacute; thể nh&igrave;n ra b&ecirc;n ngo&agrave;i</p>\r\n', '300000', '35', 'D12-11'),
(32, 24, '<p>c&oacute; m&aacute;y lạnh</p>\r\n', '1350000', '40`', 'C01.02'),
(33, 29, '<p>Nh&agrave; tro nằm tr&ecirc;n đường&nbsp;45/32 Ho&agrave;ng Văn Chiểu. C&aacute;ch bệnh viện khoảng 2km, 10 ph&uacute;t đi bộ tới c&ocirc;ng vi&ecirc;n vui chơi.</p>\r\n<p><img src=\"https://s-housing.vn/wp-content/uploads/2022/09/thiet-ke-phong-tro-dep-7.jpg\" /></p>\r\n<p>H&igrave;nh ảnh 1: M&ocirc; tả ẩn dụ ph&ograve;ng trọ</p>\r\n<p>Ph&ograve;ng trọ c&oacute; g&aacute;c xếp 1 ph&ograve;ng bếp, 2 ph&ograve;ng ngủ, 1 ph&ograve;ng tắm , 1 ph&ograve;ng vệ sinh,&nbsp; c&oacute; 1 cửa sổ lớn để c&oacute; thể nh&igrave;n ra b&ecirc;n ngo&agrave;i</p>\r\n', '300000', '35', 'D62-11'),
(34, 29, '<p>Căn hộ n&agrave;y thuộc căn chung cư cao 70 tầng.</p>\r\n\r\n<p>Căn hộ n&aacute;y c&oacute; diện t&iacute;ch 50m2, bao gồm 2 ph&ograve;ng ngủ, 2 ph&ograve;ng vệ sinh, 1 ph&ograve;ng bếp, 1 ban c&ocirc;ng rộng 5m2. Phần ban c&ocirc;ng kh&ocirc;ng được t&iacute;nh v&agrave;o diện t&iacute;ch căn hộ.</p>\r\n\r\n<p><img alt=\"\" src=\"https://img.meta.com.vn/Data/image/2020/11/24/mau-decor-trang-tri-phong-tro-sinh-vien-4.jpg\" style=\"height:458px; width:600px\" /></p>\r\n', '1300000', '50', 'C79-31'),
(35, 24, '<p>c&oacute; m&aacute;y lạnh</p>\r\n', '1350000', '40`', 'A21.02'),
(36, 33, '<p>Nhà trọ mới xây, thoáng mát, tiện nghi</p>\r\n', '500000', '40', 'B.05.01'),
(37, 34, '<p>Nh&agrave; homestay tho&aacute;ng m&aacute;t, rộng r&atilde;i, tiện lợi th&iacute;ch hợp cho 4 người ở</p>\r\n', '3000000', '50', 'G3.08'),
(38, 33, '<p>Phòng trọ thoáng mát, sạch sẽ</p>\r\n', '500000', '40', 'B.05.02'),
(39, 35, '<p>Nh&agrave; mới x&acirc;y th&iacute;ch hợp cho sinh vi&ecirc;n ở</p>\r\n', '700000', '40', 'C1.01'),
(40, 36, '<p>Nh&agrave; trọ sạch sẽ, tho&aacute;ng m&aacute;t, gi&aacute; rẻ th&iacute;ch hợp cho c&ocirc;ng nh&acirc;n</p>\r\n', '900000', '50', 'D1.01'),
(41, 37, '<p>Nh&agrave; trọ gi&aacute; rẻ d&agrave;nh cho sinh vi&ecirc;n</p>\r\n', '500000', '39', 'A01.03'),
(42, 38, '<p>Nh&agrave; trọ gi&aacute; rẻ b&igrave;nh d&acirc;n</p>\r\n', '600000', '40', '12'),
(43, 39, '<p>Nh&agrave; trọ gi&aacute; rẻ th&iacute;ch hợp cho sinh vi&ecirc;n</p>\r\n', '400000', '40', 'C2.04'),
(44, 40, '<p>Nh&agrave; trọ b&igrave;nh d&acirc;n th&iacute;ch hợp cho c&ocirc;ng nh&acirc;n v&agrave; gia đ&igrave;nh</p>\r\n', '1000000', '44', 'E01.01'),
(45, 41, '<p>Nh&agrave; trọ sạch đẹp, thuận tiện cho việc đi lại của kh&aacute;ch</p>\r\n', '500000', '40', 'A02.01'),
(46, 42, '<p>Nh&agrave; trọ sạch đẹp, gần ngay trung t&acirc;m th&agrave;nh phố</p>\r\n', '2000000', '50', 'R1.03'),
(47, 43, '<p>Nh&agrave; trọ cao cấp đầy đủ tiện nghi</p>\r\n', '2500000', '50', 'A03.01'),
(48, 44, '<p>Nh&agrave; trọ gần c&ocirc;ng vi&ecirc;n con r&ugrave;a</p>\r\n', '1000000', '40', 'A04.01'),
(49, 45, '<p>Nh&agrave; trọ gi&aacute; rẻ th&iacute;ch hợp d&agrave;nh cho 1 người ở, gi&aacute; sinh vi&ecirc;n</p>\r\n', '600000', '40', 'D02.01'),
(50, 46, '<p>Nh&agrave; trọ đầy đủ tiện nghi, tho&aacute;ng m&aacute;t</p>\r\n', '900000', '50', 'B01.01'),
(51, 47, '<p>Nh&agrave; trọ mới x&acirc;y gi&aacute; rẻ</p>\r\n', '1000000', '40', 'B02.03'),
(52, 34, '<p>Nh&agrave; trọ đầy đủ tiện nghi</p>\r\n', '3000000', '45', 'B1-217'),
(53, 35, '<p>Nh&agrave; trọ th&iacute;ch hợp cho cả gia đ&igrave;nh c&oacute; thu nhập trung b&igrave;nh</p>\r\n', '600000', '50', 'C03.01'),
(54, 36, '<p>Nh&agrave; trọ d&agrave;nh cho người c&oacute; thu nhập cao</p>\r\n', '3000000', '50', 'D3.01'),
(55, 37, '<p>Nh&agrave; trọ s&aacute;t ngay trung t&acirc;m thương mai AeonMall</p>\r\n', '900000', '30', 'E02.01'),
(56, 38, '<p>Nh&agrave; trọ gần ngay quốc lộ 1A</p>\r\n', '800000', '39', 'E03.01'),
(57, 39, '<p>Nh&agrave; trọ c&oacute; đầy đủ tiện nghi, giao th&ocirc;ng thuận lợi</p>\r\n', '1500000', '44', 'D04.01'),
(58, 40, '<p>Nhà trọ ở ghép thích hợp cho 2 người trở lên</p>\r\n', '300000', '40', 'C04.02'),
(59, 41, '<p>Nh&agrave; trọ th&iacute;ch hợp cho gi&agrave; đ&igrave;nh c&oacute; con nhỏ</p>\r\n', '700000', '44', 'C05.01'),
(60, 42, '<p>Nh&agrave; trọ c&oacute; kh&ocirc;ng gian y&ecirc;n tĩnh</p>\r\n', '900000', '50', 'R02.01'),
(61, 43, '<p>Nh&agrave; trọ s&aacute;t b&ecirc;n trường Hutech</p>\r\n', '3000000', '50', 'G3.08'),
(62, 44, '<p>Nh&agrave; trọ gi&aacute; rẻ th&iacute;ch hợp cho người lao động thu nhấp thấp</p>\r\n', '1000000', '44', 'D1.01'),
(63, 45, '<p>Kh&ocirc;ng gian y&ecirc;n tĩnh, kh&ocirc;ng bị &ocirc; nhiễm kh&oacute;i bụi</p>\r\n', '3000000', '40', 'D1.01'),
(64, 46, '<p>Nh&agrave; trọ tho&aacute;ng m&aacute;t, d&agrave;nh ri&ecirc;ng cho sinh vi&ecirc;n</p>\r\n', '1000000', '44', 'G3.08'),
(65, 47, '<p>Nh&agrave; trọ mới x&acirc;y, tho&aacute;ng m&aacute;t, y&ecirc;n tĩnh</p>\r\n', '900000', '39', 'C1.01'),
(66, 27, '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\r\n', '200000', '52', 'CCLemon');

-- --------------------------------------------------------

--
-- Table structure for table `phuongthucthanhtoan`
--

CREATE TABLE `phuongthucthanhtoan` (
  `MaPhuongThuc` int(11) NOT NULL,
  `tenphuongthuc` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `phuongthucthanhtoan`
--

INSERT INTO `phuongthucthanhtoan` (`MaPhuongThuc`, `tenphuongthuc`) VALUES
(1, 'Tiền mặt'),
(2, 'Chuyển khoản ngân hàng'),
(3, 'Thẻ tín dụng/thẻ ghi nợ'),
(4, 'Ví điện tử');

-- --------------------------------------------------------

--
-- Table structure for table `picture`
--

CREATE TABLE `picture` (
  `id` int(11) NOT NULL,
  `url` text NOT NULL,
  `MaPhongTro` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `picture`
--

INSERT INTO `picture` (`id`, `url`, `MaPhongTro`) VALUES
(8, 'https://storage.googleapis.com/project-motel.appspot.com/images/644c83bb76709.png?GoogleAccessId=firebase-adminsdk-gbzxz%40project-motel.iam.gserviceaccount.com&Expires=1685328060&Signature=AfuzY%2Fpu8TwJhhAC9AOrq6erOqad7CJIBoBb8bhdMpl4pT3hDaPjYpHl6aoxbZBoqvA9hFr5I2B3XdR2TuRWVgdGPDC%2BJlpP%2FG%2FQQkuqoQAS3lCbHcEZcXDis17M2Mpoq7owXQh7TzVMJ%2Fzo3sn0nBr8qrCif98hCuuHIpDYvic35nk54fd%2Fl2aKBusiUa81l4Ib0GScuZzEERFLGvKn%2FRwnhnaEXmRnxA8RsV9XGMgRotMm2kn3H9q8MA2%2Fwsp2uubZZd9F%2BgRXi7hgO1D6ekNj9Ejrde6gqbNUqXw49Utqf3%2Fl8F1wKkm4yDUFLAR2H5IG39Q5O%2FI0uUlJXsJKnw%3D%3D&generation=1682736061137012', 6),
(21, 'https://storage.googleapis.com/project-motel.appspot.com/images/64651f7fd0927.jpg?GoogleAccessId=firebase-adminsdk-gbzxz%40project-motel.iam.gserviceaccount.com&Expires=1687027203&Signature=CGYh%2FaaxkCli3nuLJVD3Tze3cVsPXpXIoewNRbdMykmLc1tsoo%2Fo88%2FTyLiTS0agxp3Ujt361i0FTj7ITCN4nJH4bqfTAI0GmE1QL23sNBQeZsLWyg5tNmwLv2XUrMbKAUF67hnRbWUpiIssA4bbjpqB26qxmXU%2B7KXzR2STi%2BxE4LTXGeQvZ4DNCfLXj41oUqsldrqPYHzMoCwFom6OuWPly7ZHFtS9l%2B1pxfGNf%2F38RALyByVReMay8iDCkekEKgISoc6Xm8affmMHMb%2BlAxWqT0xr3vQGE4mZaj8Vm70znorDTk8EInXdpIpMvxKe69HhH4XIw%2F2wyccjqkh5LQ%3D%3D&generation=1684348802879869', 36),
(22, 'https://storage.googleapis.com/project-motel.appspot.com/images/646522696ad4d.png?GoogleAccessId=firebase-adminsdk-gbzxz%40project-motel.iam.gserviceaccount.com&Expires=1687027948&Signature=V6%2B%2B7uwW%2FAwEq9vqpHyWvv%2Fro9e6CXzP9XXACtZ%2B3QDjiKFquJ8I00DbCMAxJa0JHyb%2BtKYm4MBhTuvq%2BMROzzMRK0TwEFfTk4psbucr7FACQUZOrzfQ%2B6u6Z6nuQa6%2BkoEL6kV0t8QD4k9JEEihMCi3StngX%2BWVcPzdK%2Bs1WNHhLIIJ7DSrqEyBTM28Ta91lMYhWGJzCJ7nVhE4rxOr%2BUz%2BrgGKXx1WeKdge2ZpHS3SO08zyJQVLuwC8EZrpJ3FVAIg%2BRQPXZ8HxXLUnWixQnZ1X1D7dZSHndzwYN34j9isLbMO%2FsCpo8%2BwMFViOwPyKcMLs%2FvXV80zaFLFxABnxw%3D%3D&generation=1684349547990998', 37),
(24, 'https://storage.googleapis.com/project-motel.appspot.com/images/646523572a634.jpg?GoogleAccessId=firebase-adminsdk-gbzxz%40project-motel.iam.gserviceaccount.com&Expires=1687028185&Signature=crvgKi6OgEGKuPnNy2veIOaHKOQFWWrMyyiTFYQedO%2BYM72UQlie1kg9dQ%2FWQgWUQ8dR7xf8MdvDGBCHythWYz8KdBRTgqX6pGK%2FVskKHlhovDuFP%2FKBEDKQrBXtYivJpoyGZivtZ66YAaGvweNGxl92oLx295Um7WGUfLlqKEUys7FgVm%2FhfLgq8qKNPuLr98Q%2F5R14DahbVwWB%2BTknD2EbDO%2BitQyqwrJMWvF8%2Fz9Rrt8EZGMVB5fGyxH8SN0Y513yV%2FYwfk3G1Vv%2BE%2FvtdW7tB8Zfl7Iwciul9HoISvgy7jKZz6%2BOE9Sw7Qtt529vwQeWl%2Bslnr9VdgF%2FhcniVg%3D%3D&generation=1684349785422374', 38),
(25, 'https://storage.googleapis.com/project-motel.appspot.com/images/64652595d8a38.jpg?GoogleAccessId=firebase-adminsdk-gbzxz%40project-motel.iam.gserviceaccount.com&Expires=1687028760&Signature=WwVUaep5Yu%2BBc32CWfBAKaVq5FGhJCmKu7t3Eb%2FWKMa4bG1MqwEU9O7vn1uC7IhaOeA5nxlhv%2BaqWuwxdulXu%2BOojHhd9wY6aPamLBFV%2Bz7TvtWT6B8bbsolKRmCx%2BfNDgWZyiBRdigHQrQYXjrcT6JJLLnrjIlAZJNvXLX3gXCIR%2FcKcYsoFYGSqetuhyjXn0kpvh4nb5OUDN%2B5oJxLgXP6UrPFDFyvp2u0VnBiIn%2FeFn0Opr6FkOJxiwyajiQSKD%2FfUfPRY%2BWeGjPwC2RDOhqZZoM9l3UzFAxTSoV3Kd5vBtmnF6Nvchq2A64uLum3uVYe0dBo4usrCCLgXhNj%2Bg%3D%3D&generation=1684350359950862', 39),
(26, 'https://storage.googleapis.com/project-motel.appspot.com/images/6465267d5e567.jpg?GoogleAccessId=firebase-adminsdk-gbzxz%40project-motel.iam.gserviceaccount.com&Expires=1687028991&Signature=K%2FSe6fHNgfDcNAK%2B4l4Ruiee4X2Fwgs6MlF2RGQGEuTDyYXM%2BBg0Rl%2FceQ1FIJswNksnXfnwuE%2FP7I9mBs70WK4QUiKsSGFDa%2B%2BrMTIEexxLU3MdCjiOBE%2BUMkFVujwHbUItLhf%2FJgMCpWBdhu8IFfDX1ytuN874hN1QtBus2HxgOuJI7woxqAl%2FFqybIaNFMQepk3pZrSK53fYn3kcbtHeRHwsY0s4X6w2sEv%2BM5%2Fs3gdazjihaELrO6eHAfBDd4tB5%2FlMljtmT0UgHdTZH4fF5KQIuxjncDx%2FBjy01ADSvptA%2FnA04aF2L4yrHgVPkhffAA2y5UPs7FTTir2n2Wg%3D%3D&generation=1684350591448133', 40),
(27, 'https://storage.googleapis.com/project-motel.appspot.com/images/6465279b6f281.jpg?GoogleAccessId=firebase-adminsdk-gbzxz%40project-motel.iam.gserviceaccount.com&Expires=1687029277&Signature=etANGVng9vZVFw2EQR02b%2Fv6sLY2QvciWWhGZoj113CL5OGbxgHZIYD%2BUJJ5FkPwnwWXsmXkQ4FgzwYXFey6Zw4qmnckQQvAQceQ3zV%2FwzHEQmYC6Dtir%2BChJmRt1FIilnSNRv5RFFu0Wjy4Qs627tEQBc0YkDyEXIJ3879jFYt9IvZ2nPZA9ZGJPPSpF0oADWAtJxiywESViLWzVcXXtq3ZL6isy0UPPb2KyXla73aJWajBU7PRAHE%2B2D5fIt5p3fGIdKOSr04QX%2BsujEHLfmoEGlBc0r%2Bv%2FvqNFAB9ewnOUM7hsm8pX0dDKeTDew2OSpW96ssUl2be8qqi2SaC1g%3D%3D&generation=1684350877687891', 41),
(28, 'https://storage.googleapis.com/project-motel.appspot.com/images/64658c8c7a5ae.jpg?GoogleAccessId=firebase-adminsdk-gbzxz%40project-motel.iam.gserviceaccount.com&Expires=1687055118&Signature=YAUrjj0FcofQ8I7A5oUmgBG%2FuxxvkUyGLCNvCxtKSINuTm8BN81RHq%2FrDFiKlOhI73soGiC3FLt6IB6Y%2Fcq7UXhrhfbKr5eot2eT2xu8HV%2BCpLF7vwOZ7SXPWNuYOx6GAlLlVRZrqbC12pqjU0sQfUCnJ8rsLI%2BgvT5X5c08LYablpBLDV8Gr%2F1j0Lrsub962hguI2Z5fQ7svXNcYj73at%2FBl6dMwVW5NSYkDGX69cXUTWX8gQrRB%2BY%2BlG6HIXcM9AyzJ274J1ddJLmu8j5dCvJwyXsB%2BjR1Q41NWlX51rv8L95hNCFBhZSFGg90pmXZlNVcsaPab2i0ZAL5QQeSvQ%3D%3D&generation=1684376717755411', 42),
(29, 'https://storage.googleapis.com/project-motel.appspot.com/images/64658d625ab9c.jpg?GoogleAccessId=firebase-adminsdk-gbzxz%40project-motel.iam.gserviceaccount.com&Expires=1687055332&Signature=Mcvljm6GaDQTmrEdjHPKw6vgflsVfYJau12VTqcI%2BvQHpV1e1JysYntA%2Fc2VFIinD8L0vCz0SJZEqcpbtq2E%2B6DBmndeYEHLA6UyThXefYreXGSa9muXf8dIdkfBBwCAKNWy6pD3FLf%2BIjGBWqvckxgFBzORxG8oVqV08JRW%2BZJIsZR5VyfRy3YILWl5q7Rp6zT%2FymJOw3OegyuDRoBWe04K6Nmkg3%2Fim2qn2Uq80IdaycdpbjMl%2Bf9%2FtbbA4AFbHo1fpkVsAvm%2BpNFS5uc5WxS4tWX6o%2BgAir5WRQ8%2FJFgIw1F8mrJSVWXUpBkeqsgy1oL2IHXvdg87pcc0CIsS4w%3D%3D&generation=1684376932002004', 43),
(30, 'https://storage.googleapis.com/project-motel.appspot.com/images/64658dfe40832.jpg?GoogleAccessId=firebase-adminsdk-gbzxz%40project-motel.iam.gserviceaccount.com&Expires=1687055488&Signature=Dg2gNcT%2F1%2BMK2vxGRiy%2BcCwkQuLoYRFHn8u57lv5G6TfRpI33ZvBupYhezn%2FSDl7mf5%2FIPCEpe3%2BAYiUASSsrAToZZSrcXflu6xTSAXfp8WduO9ywPgLK2glKF7xeknwlFkcAb6IwdXVpl%2BzsjBQeXVfDqiQi8ZRoC0iBKfZzpoIXjY5kc0r3d%2BnGIvYDeKbzkqjkImvj3khaLaMZ%2FV0wqEtx8gGbA2munYak7g%2FExHwIbNOonU%2Fm4ptMrUixhIlDmCQzcCvQzt%2B%2FwNwnFhZzN%2B1DzEaESkTwsbmqrqEK1YmKyMNk%2BkHT37K4Fdz4%2FzcgtLdUAjQ5Kehlt5%2BJ03o8g%3D%3D&generation=1684377087658665', 44),
(31, 'https://storage.googleapis.com/project-motel.appspot.com/images/64658ef19b3eb.jpg?GoogleAccessId=firebase-adminsdk-gbzxz%40project-motel.iam.gserviceaccount.com&Expires=1687055732&Signature=I8vftam%2BIinZHVS7woAmQEY6irX68hXPO4RLh5uv4S4KJrHL4AGvPS2WDU%2BKOb6EBiEjADVGaEILW49FLA%2FvW631myeSokx5LV8BKP%2B%2FINJB2x9U4Og9UdPH3id7L%2FXs08mROArpbrpf96zJVTtguCvPmrEARpm5WUEFmGLQ0OJ4AzVfZWzwGUum9eXccjyut%2Fyzg%2BhTKcLsYzQVzuqACZ37QOGyrALVsow30%2FxBxhXVf8PlrUiKAZy9PxyjwkJ%2FROctiPM2ewmMT36Upz4DgM478tNuV%2BleUEz0PqszCDt3jj54H9YVR3Q8x5cOtAdgqQv1xI7tjz4JyBLbmDIXQg%3D%3D&generation=1684377331310905', 45),
(32, 'https://storage.googleapis.com/project-motel.appspot.com/images/64658f7dbd992.jpg?GoogleAccessId=firebase-adminsdk-gbzxz%40project-motel.iam.gserviceaccount.com&Expires=1687055871&Signature=IDr8GTzVm38DefZssFpiYtr9%2FcuPIF7tEaX8A698mvn5wqkuQKv8WRV6SdK9e2ib6UivPL%2FRyQtC3SxBDLDxiwXVgmMxisl8EBZrx0bCSA00oqS97gcn0r4AYA503eABq1PcLCNJ%2BbpJ2wYmcfG%2FVEt3%2BJG3%2F67IVMxJQ%2F3%2FUd%2ByR%2B2O2x3SoXpP2qoXvVa6wdYLX0%2FjYaykmakQAwUUSAKRO8Jr0K0b0P6gYJCdpKmMIQ498F1NUFSyl7iVli4xvgVUHMghg20YaiGGgNDHyBOK1NtLHx9tBzIX2NRVFt7Qefl8SXVg7W%2BXo5PL%2F%2FhQOar1lwhZJi16tQqrSBT6CQ%3D%3D&generation=1684377471177703', 46),
(33, 'https://storage.googleapis.com/project-motel.appspot.com/images/6465903463e4c.png?GoogleAccessId=firebase-adminsdk-gbzxz%40project-motel.iam.gserviceaccount.com&Expires=1687056054&Signature=EoK9wchYkUWgkUoFMJD8BSvEYbUuAYRl0fiYRCF%2BICkxqIqeLtZY3LJt4STsZihHt92TtifUAJaAYJAuxWjXPH2ughvqIKjwiexBTqmrzAIoMO418k9vt5AuDp3p37gRmR8HeMKGoLwDKXW%2FDVPc6WlHFLftADabOg69ZJX5e2pQ7Y1zhWzn3h%2FE9V0csI%2BKOxzTUp3K7x8Lwtdo%2FfxPhx1F9oG6iFOL6UXL%2B5g3mk%2FunPz0O24z8yxeJ1FCq6d3K6AXG%2FIrJkYPRRBKgPT1Kbg8GkFXtZQJMAwP4gqKtiyrcFu7mAA3%2FVTymhqH3e7htsISAvhAGED%2F8ZdpX%2F%2Fgww%3D%3D&generation=1684377653933279', 47),
(34, 'https://storage.googleapis.com/project-motel.appspot.com/images/646590c586bab.jpg?GoogleAccessId=firebase-adminsdk-gbzxz%40project-motel.iam.gserviceaccount.com&Expires=1687056199&Signature=RaOZsPYQZVy2cQdKnjutFuQiqBinczlLcFrT1gz7MCmFVj5pN2RZ0bH9XSmcauuPlusrdwRUCH32XyitlQyAeU14rJ4I9IqEu8cn6iFV34%2FQlLI00VAZcObA%2FCG2Af9hCQeDIna640LzEfb9oczsGThtxC%2BzykYl%2FO1d4Q%2Ft4AltjkgN%2BCp6obKI1hk69c4PSVWyULHr5nhsOpWhPsNAZiZA4wEgi9%2FZSufrLdnoFFIss9kTTdfMwa%2FH3lDexsJM4t3dPY%2Bsuetq3RWvDyqwZFZ7sNG6emYlysCimuydJMGswqIhfU6UbGH2kC4gGtz3wHsPn6P4J%2FE9QyYVec1FAw%3D%3D&generation=1684377799090235', 48),
(35, 'https://storage.googleapis.com/project-motel.appspot.com/images/6465923448097.jpg?GoogleAccessId=firebase-adminsdk-gbzxz%40project-motel.iam.gserviceaccount.com&Expires=1687056566&Signature=D6gJ8FCieaIO5kfhX22gTbIPEZLS7f2pThEm7uDkCsAd%2Fwm80F7jelPT73ZyXN1qvOYETzKj7Gck7JGlpTu0SxkGWg8oCS%2F56Y%2B5jLC0w1ei70lw8BL%2FAje9DDO%2BO9LgVCivC5U%2FLMKyXdpzrHZGpvOw4l%2BDG9Ma50vNs4Mng05jFQ%2BBhlmsXqcQldmrK010sh1faT9VyocPuiy29pPzCwcFeFPOr2iowUhBUKifbnj%2B%2FFhllkx%2FNw6wHEb6IUQA2o9VR5wDulUj3u17lhdXIpBA0QB0Xknh4RE8VrGBEcx1Tu%2FXiN%2B2DhdkDnAw0lX2H3jMFDsNhR4ETgHvaVz7OQ%3D%3D&generation=1684378165927248', 49),
(36, 'https://storage.googleapis.com/project-motel.appspot.com/images/646592d81fe53.jpg?GoogleAccessId=firebase-adminsdk-gbzxz%40project-motel.iam.gserviceaccount.com&Expires=1687056730&Signature=CBCh1J7uLvT5diqzDoLrmjYamxHYFzk0XY%2FPbPWVoHMzzcgekWNWc0W2k%2BeIY4tt6pG0fEn3CtmReKGh2LcSdaRZBYW2LL9fCN%2FUhk%2F%2FuBzrGZBxmaJzHvtULg08izUxR6%2BxoaHxhDCpnFbm5Yx9E4zo9H%2FmRlkuiQjikOj0pEj8G99U6diKSUoWrWUy2CNBt36L%2Bbo%2FDaLKx7dPFNw2hAcoB7dbJKBtGwz3IzK2UDaHjbzTLkj2rNqjisyowApCZmUXIKgEwScqE6uoWN4yqhv39031Xvr%2FKzY%2BTMFF8iZ9dR2P4wCuj2MiZVDBjJchSKoUu5nuwQRcMzZjJBKnNg%3D%3D&generation=1684378329666981', 50),
(37, 'https://storage.googleapis.com/project-motel.appspot.com/images/6465935a1db5e.jpg?GoogleAccessId=firebase-adminsdk-gbzxz%40project-motel.iam.gserviceaccount.com&Expires=1687056860&Signature=ZRhLNAuK6rNB9Sj6ZEoOrP8yUSDnMrDaElMZWQfrBM4Qt4ZH%2Fz3RUlv%2F%2BZkLyNSNU2aY5TKINrV2G7nFm6BkgR8L%2F2WIPfiDML9Yf%2BG2z%2FNnfFa8jrzJnH10UAmgjSNgjJ9lQEwzwQ1zEfc%2B0CooJTf%2F8Ny3s9E0SCoFa1KHy2N%2BQckh5MW7naCdukwHkFEvtslskzbLjWiIwV0dpansSvz9WKpWRA%2Fjovx%2BL1hyLWj6V18bfvPKUlNyr1xIUO33oD4ed4Ly%2BIgCrUhzYqXfObvhElnIF0evkqpJq%2BkhV8wVg48CdQZjYa%2BYAUVT9y09p%2FXaFxaXURwomshf2Jwm5Q%3D%3D&generation=1684378459725443', 51),
(38, 'https://storage.googleapis.com/project-motel.appspot.com/images/646593a7a034d.jpg?GoogleAccessId=firebase-adminsdk-gbzxz%40project-motel.iam.gserviceaccount.com&Expires=1687056937&Signature=DtzjyaK5yR4yrb7myefncVHrUwgryuRWkYp5TTt6F7XIkANKDJicAcsQWCQ1wGLF8MisMJUBiN5569xrQOBAuLAqPKGQ7uQ1dS9nBHO2byoNOM1yWUw0izUCieKVWbuL2mEm19dnEyrX%2BOU6eYtPdrd4Kil0giAHJqe%2B20RKW104PYNXqIiBitDpxtpRoNALPanOI1VXMWUplVb%2F0dS3qG20PRuMja09cfbASVv%2FB2hAFEdIESkz54HlUrYrWGIXRQRbVtyZAU2pTOI6QMFrbr85SQ5GYyoPcUxFRPU3DlIyp6qhx2wN0yT4m42BTBbx6V0tpB3py2s%2BQdcmEeeghA%3D%3D&generation=1684378537437464', 52),
(39, 'https://storage.googleapis.com/project-motel.appspot.com/images/646593e69d4d4.jpg?GoogleAccessId=firebase-adminsdk-gbzxz%40project-motel.iam.gserviceaccount.com&Expires=1687057001&Signature=n%2Fs%2FfI8jJbZV2LfQFgAR3%2BcbcWYWi0TvKtYmctNIGCVKfXNUzLCwQdkj6lpRwV74gNaCVi8jiwbOG8KDpV849vVTBW6lWuXLe7P%2Bm%2F0ixnc9tWzWfaKMSCJmIYalnm57gyqn3LBXA02lVNfdIx%2FvDE4fgC2TdhaXLQ3SrqBXTRe28OzKbocvU0Ax3t10LYwFAYB5WS6zS8Tzg%2FkG1FZSy9qWjgaI%2FhVHmzCC5bq%2BLDxTMnOgBaauFxoUZiNEejazyWqvA%2FP1QwZ3mUknscIhi%2FDCir%2BLKKg0NDyAZ0OOBPTQCJ0CxMMk7Bh8SDPCDo3RE8lbpopF3fgykGHyxMOxlA%3D%3D&generation=1684378600504659', 53),
(40, 'https://storage.googleapis.com/project-motel.appspot.com/images/6465942b240b8.jpg?GoogleAccessId=firebase-adminsdk-gbzxz%40project-motel.iam.gserviceaccount.com&Expires=1687057069&Signature=hW8B3LmimWCnzX6TX3BMT7VDbJJGi6x7aCUGK9UXbzBY5Zy2Atv2EV5gaT1RKbjeg3bzx%2Bc5agJGchWGh%2FIpG4dgs6GJ%2BOaYDSswwRPkN%2BR0juJ1Ctz%2F6UNmKookRTLziFB6iJJs9lqsTb4Xe%2F4hob7kfXlXA8gjB0dMd9euf5Fgkh3NPUMI827MoIL70msf5vcahh2pYgHz3LdE9UO6AUNHLdRQEPgWsFo6Be8Q074Cc0LhN1dk4rgulyGUL2JCK%2F%2F75YSemfpLDlv%2BgHudfDxave3omEF4p%2BUM7QpLjzmKZEAI8Nhj2%2F5BBxANOAjryyG2uSiS9lQvP8JTLPZWvg%3D%3D&generation=1684378668903696', 54),
(41, 'https://storage.googleapis.com/project-motel.appspot.com/images/64659498ca93a.jpg?GoogleAccessId=firebase-adminsdk-gbzxz%40project-motel.iam.gserviceaccount.com&Expires=1687057179&Signature=a3ZZK0vd%2Fh3vTdNFuxnT5Tgu%2Fsj%2B16C6SHWlvkYDph2%2BTs3eEHpftD5pPMjSODpF11wrUM%2Fnp3ueInH7nNhiI11GcG9Hg5cV12BsCNEW5Uvr8W9%2BcXGcjOkLraq5ggoAS6jLvqf6BYNJJgYCu35ichvyHLeR9mMLoUT%2BERvWaXEITxoJYo61TaPctpOy0uPl0XwfBtFmHRN9rpTXId8zvUpe5BagVNEKWzjgzeHO2N%2BDxXU3mxJKOfFtr6qMuV07zlQcvleT2gsTh4DQlprSOwNxkKRjiNzSmJOWI0A5oolNY4jZsdhFjTNRFjti49Rw6t5UxDlLhK%2BNztnhKNoldA%3D%3D&generation=1684378778503455', 55),
(42, 'https://storage.googleapis.com/project-motel.appspot.com/images/646595088ad59.jpg?GoogleAccessId=firebase-adminsdk-gbzxz%40project-motel.iam.gserviceaccount.com&Expires=1687057290&Signature=WtfiCeT%2FDyODjxPw8Ygjufp67BUyfzILluZs8qTRSrlK7mbvlSY6nKh%2FGnnjvXZoWlW11u0JVACfiVw1XaeNZQl2WwGsgP%2Fdh4gm29k1nsc9IZn95Q6byCDvQUVVAcnLFnFo0makL6LQ6BS%2FnIPwWGAA6KmxDNwwnM9%2BKaNNQ6fIurp%2B4z3Jy7eB%2FYctO6CpSCOcMfBmlpe6iCNfWOXttb7vPZ78FbqAAPnNr4tQgqmL3zy3Jb8p0QD4pZx%2B4Nhki5VWJPWhqHEzDeGGpwqMwgwGiIvrn6ouF8xXCisjLv9UWP5iW4xOZomoxdE09HJP%2B036nlBDewSlR2%2FWQl89AA%3D%3D&generation=1684378890495507', 56),
(43, 'https://storage.googleapis.com/project-motel.appspot.com/images/6465957291494.jpg?GoogleAccessId=firebase-adminsdk-gbzxz%40project-motel.iam.gserviceaccount.com&Expires=1687057396&Signature=MbH%2FMLUAf%2B%2FHNMqboKIk6GBmQCdrbrK2%2BdHXaPk0LpL4qai9rK7uEU3gtNsY%2F6ej%2BLJ%2FH0N1UUV7gp18pWv3k4CcW3d4eXBgh%2FHgXU53PXDEtFE3m4aGkAD%2BGRlPo%2BgkCePnAneYpWySWrA6Kw3mP8dV0TFXDXx1MARyfd6GkCf3QZZccAwd2%2Btqj8l%2BzM%2BaoEqTVrvb82B60%2BWZSrWFuFWvhpJHErc4CvhC0h8rws57KSRU%2BejMZK6FaWDEbKj3Cirwk06F9Sy85epgFf0g%2FB9bCX%2FAhefq10nHqhILDTEpbj7pglIXwi8NfR6gaYqLrfgCiljxPLecEMuHkouPqw%3D%3D&generation=1684378996292150', 57),
(44, 'https://storage.googleapis.com/project-motel.appspot.com/images/646595d032a73.jpg?GoogleAccessId=firebase-adminsdk-gbzxz%40project-motel.iam.gserviceaccount.com&Expires=1687057490&Signature=niScpK%2FYNXeGymz2L1%2BhonBypmyFsx5xN61BY3m5GCYmgx5Pht%2BXXHVmY3x5X96BlrFP67JW5OPPtuZgNANuH08STR6bovtVJvSnOccsF%2BmAs5CSk1FIBvRSg0o%2FFD%2Bw6Ic2Kng7OHlF4lgcEOuhrfmqtaZNdoZsr%2BB6sJFJW%2FTfQ%2BKLrx%2Fl0HymwaLpI4K1UMpxQCqNGzw9PO28iPLFHky9J2472VcsEYsTmHNCgs0TV%2FZHrup7UkdwgbRPUOOo1KSyFCY5o5cdtXkTYruNu4HexVLMwBx1S%2BmqS2NIlVy5kxV2r30zIZHctRd%2BG20VJO2OW4hPzn%2FSqSlZAWRE5A%3D%3D&generation=1684379089971747', 58),
(45, 'https://storage.googleapis.com/project-motel.appspot.com/images/6465960fe1f57.jpg?GoogleAccessId=firebase-adminsdk-gbzxz%40project-motel.iam.gserviceaccount.com&Expires=1687057553&Signature=kNRNfSzTtGq8EuNuDyOt59PNjo6nklFOTKipkCRhSkxf3P4NPUppr0GWdpb68aa4E9pmwWlIT%2FFsFJtY9JYO3%2BI%2B53QQlzRSztbs%2BsyNH8bgKe6TkYTfS1ONRUiEb58u%2Fa00SoMFmed3ER7RfcjCS9DVBty5qDQSD0vpiuQyjwt0gfBXI7LLejrPsyucDiHTxR1%2F10ZVlKxaCpzqXczNAuayd15TCVzik7fWssR7cT8yDXxoaoFnuQD8PrqBQY7zywp90JwFDhISXS%2Fh9s0xpiPlrNseNOdzWeOJvoAFKYBq%2FjPma6opnJmEIHcIZOy%2BhOgsGqzSUeyc0OS%2BxgQQeQ%3D%3D&generation=1684379153479357', 59),
(46, 'https://storage.googleapis.com/project-motel.appspot.com/images/64659665c3a04.png?GoogleAccessId=firebase-adminsdk-gbzxz%40project-motel.iam.gserviceaccount.com&Expires=1687057639&Signature=Z0sjnbe%2F4o51dXUgj3wNLe5DrY%2BUqVUuE33sCg%2FnlrD%2BdsGeTf8jLfn5S8DiC%2BploRzV3TQ7t7KdN5ZRQYjlT8S8hP3Lsoclgsf%2FP7CsV9%2F1zCUezaWv%2BvNNuw0EIfQ5F7ZHTLV8KtYL4090WliS3c9R6fNV9IHGVamOllCiWgKt4aYymolcyKwJ8YHub5rnoX%2BnfAIOim9bDRTbceeoyvS6ly%2BwyZTuAYubjytwQqYZS4i2t4LoaZsncAGKpoVL1zbnFNBYHv%2BxnzXkgQo9tA0W3ByulYpvP8SZ49qWfIo8iR9zW4oigB0tBFZeZYb1FVSeS761QzcuaTHyWNI4dg%3D%3D&generation=1684379239429357', 60),
(47, 'https://storage.googleapis.com/project-motel.appspot.com/images/64659752df9e9.jpg?GoogleAccessId=firebase-adminsdk-gbzxz%40project-motel.iam.gserviceaccount.com&Expires=1687057878&Signature=EYZJCFlzsUxJ8lOCJJMQpuegs5SnAc82TSqmykohqinDUN2o96gz2eMO%2Fv9UIu0NWyrFrKGPKkkxWT0Qn0agYw0Dcrs4m39tyoQ8C1sqMBDG8yj4pSAd%2FjXtEteKjSnL1jymI6ip8bgNw9h6T%2BMYiEnVAkdjiD0CH7HkWnoX4hvfWa%2FpXC%2Bt4ddq5srkW%2FeVD9P2YgeMlt4h8SmPKppVesVS5PwprUCC83tUWpTOnA4qRcVGSaudTBsEpxSHEOMC2Z2Nc3U4XlScnwj%2BUFbpd6y5CF%2FYINfpYtRRzDJ9UHsO0k2mW9Dj5OTN7vprbieUZYDNzLw4ECiX1i7WIEbv9A%3D%3D&generation=1684379478007790', 61),
(48, 'https://storage.googleapis.com/project-motel.appspot.com/images/646597f68c807.png?GoogleAccessId=firebase-adminsdk-gbzxz%40project-motel.iam.gserviceaccount.com&Expires=1687058041&Signature=Wu551hA%2Be3D6fq2ay7xlce%2FsQh%2FVLu9yqL617iw3tbq5lYitG%2FswBnCd%2BXZXENhcGva41LUGpwfywkVsIn7VQxrOwu0idNiwKvmYnYrRFcGwUvu9Gk950gVmzoH1%2Bs%2Bf4CmhcdKYqOaf4p9hF6MuhYLx6PJcBzTtmcK%2F2v6J6vBrCiaWx8rUzAisJJ75dv2eSwFLIxtjJugj9kSU7UcGesj9fAEk0AQ932YIsOlhqkPRBJ%2BktVBZGw%2BjjJeCKRX3ficKdXWNZhsmxC1ubip9WZBDioKrwhzN%2FoP29m7UwcazYTSvYSdUUXidYM5wraU19Q%2FylDGoF4wXnGa%2B9JrlFw%3D%3D&generation=1684379640806618', 62),
(49, 'https://storage.googleapis.com/project-motel.appspot.com/images/646598545539e.jpeg?GoogleAccessId=firebase-adminsdk-gbzxz%40project-motel.iam.gserviceaccount.com&Expires=1687058134&Signature=dIXZZkehzcabxi1rBMO8fvkHSFex%2BuvuW0PpjsDDADZz4ypswOySQZuJ%2FbJOS7aWEk%2BpJMHC1raqIEz7iKPpWzfS%2BH6X32rQAz4OhqOEvP5k1YQ3BMuj5oeSw%2FdFuNBWkrjlAcPxoLG3VhaSlM0jVasrLQdI93SH%2FFyOfmb1rIKIWXQ9h4TVHxUquWEyxzkN8VePhFjTP6BJD9DtxeBIPN%2FxfykxaQvHxCP%2BAdwFB%2B84z6N26MZJ21aW9QX6uqiJtXRbGzYC545QVywEGOXRD1M3FEwMuU6s%2BImAGdP3ivkLEOBoVGxqE8BuYsdpEu%2F0QXFP2m9Lky2VjFZajkyY%2Fw%3D%3D&generation=1684379734534930', 63),
(50, 'https://storage.googleapis.com/project-motel.appspot.com/images/646598b181eea.jpg?GoogleAccessId=firebase-adminsdk-gbzxz%40project-motel.iam.gserviceaccount.com&Expires=1687058227&Signature=g4c7qiHhmsi4MNoPIAV%2F6vDvCK1S7MQI2NhYwH4Xb%2FM2j3F38Du6juLbJyD2pO7pvMBsJ2ks4XpvBTEkouyfosC2Rl0xTfXKlHgwBZg18xbLOPWpdl%2B5VPPwlVv2mO4MYVKAtZYcfqOT0FeLSKjU8L4DaLeuXR9r7DEkzYl7XPC4TTYAekdXPn9chWKI%2FS51cubjPj7T3EQ1trkaYSeId7KpDHErzpe2G8WfhKEnAIJaIcLHgGFJm85eT%2BtCSYWIu7pyMNs0Ch%2BMnCSEeLlotNHKUJQ%2B2f97vmypXARg54awG9t59j7XEYPrepqJT5NwHqBCYsPNU8X%2BPwZRcxgPag%3D%3D&generation=1684379827302783', 64),
(51, 'https://storage.googleapis.com/project-motel.appspot.com/images/646598f3acc63.jpg?GoogleAccessId=firebase-adminsdk-gbzxz%40project-motel.iam.gserviceaccount.com&Expires=1687058294&Signature=ZAgjP02Wo9G27Vysmd%2Bkn0rWSZL8ktf8DI2PgPTvAsh6zGFk2I%2F7Nkxmg9mhR8yWaoaJ%2FLlQpXfwPEnKue9Jk6%2FSsgcNiRXIdV86qdryLXjT0w4ogFzQLsbKuYDcaypP57dvk6x7fKtkO5EDtX6mw1TQ8u3QnyRdsaQ18wglpXLJRc9ZKFsihqnJr%2FIrcyAq11w1o%2F8b%2B1GWWSE3OQrXDdUEwZYxXGSKmKt7OrHT127LzGU0RmBEAc0vo508YAI%2FIG9N9N%2FveQSn4HwBPhfYQP%2BOfgf1%2FOHNnyOqtfFBlxdisih3zeksgX6klq7jhA%2BW3uwxX9juFCf81aKe1KwhVA%3D%3D&generation=1684379894138221', 65),
(52, 'https://storage.googleapis.com/project-motel.appspot.com/images/6465fa745d79f.jpg?GoogleAccessId=firebase-adminsdk-gbzxz%40project-motel.iam.gserviceaccount.com&Expires=1687083253&Signature=e4w3%2BnqV0m6Ztzhspv23ph1VU0lC3asvgMhRpX%2FPl3tTwudLxCd6OkJHaSHc%2BXkrQmhU7xZ38cLaLxUOarrdb%2BFJTMcf5O%2BFPAKgQlb3T%2FRLrvJaP33xkWlyighZF8quC26qczxB2%2BVv2AdsHAv85s71OUJPPLDGowKLIPd3NBv9nCZI0GY6A6wuZAgZuejq%2FbnaluoqbE2Rm30LMQ4ggeD0XUQgSUqPU4lZMJRhvkXO9mP54xjio71FLfBDPWZ0OaDeu8dYmc%2B4rs8jb8b9JPbmvw8U1%2FY4qCNedgRacACOQU%2B9OYzT%2B6QOrUdmqFHClje6X%2Fl%2Bg%2B3USNfk1LlKeA%3D%3D&generation=1684404853286219', 6);

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `MaReviews` int(11) NOT NULL,
  `MaPhongTro` int(11) DEFAULT NULL,
  `MaAccount` int(11) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `submit_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`MaReviews`, `MaPhongTro`, `MaAccount`, `content`, `submit_date`) VALUES
(15, 8, 81, 'Phòng này khá ổn', '2023-05-11 07:31:48'),
(16, 4, 83, 'không đúng với trong hình', '2023-05-17 14:02:31'),
(17, 6, 83, 'đẹp quá trời', '2023-05-17 23:33:02'),
(18, 45, 78, 'sheeeeshhhhhhhhhh', '2023-05-18 10:39:08'),
(19, 58, 78, 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', '2023-05-18 10:51:08'),
(20, 37, 78, '111111111111111111111111111111111111111111111111111111111111111', '2023-05-18 10:51:38'),
(21, 37, 78, '111111111111111111111111111111111111111111111111111111111111111', '2023-05-18 10:51:43'),
(22, 37, 78, 'dmcsdmcsdmcs', '2023-05-18 10:51:49'),
(23, 61, 78, 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', '2023-05-18 11:16:12');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`MaAccount`);

--
-- Indexes for table `chutro`
--
ALTER TABLE `chutro`
  ADD PRIMARY KEY (`MaChuTro`),
  ADD KEY `MaAccount` (`MaAccount`);

--
-- Indexes for table `hopdongthue`
--
ALTER TABLE `hopdongthue`
  ADD PRIMARY KEY (`id`),
  ADD KEY `MaChuTro` (`MaChuTro`),
  ADD KEY `MaKhachTro` (`MaKhachTro`),
  ADD KEY `MaPhongTro` (`MaPhongTro`),
  ADD KEY `MaPhuongThuc` (`MaPhuongThuc`);

--
-- Indexes for table `khachtro`
--
ALTER TABLE `khachtro`
  ADD PRIMARY KEY (`MaKhachTro`),
  ADD KEY `MaAccount` (`MaAccount`);

--
-- Indexes for table `nhatro`
--
ALTER TABLE `nhatro`
  ADD PRIMARY KEY (`MaNhaTro`),
  ADD KEY `MaChuTro` (`MaChuTro`);

--
-- Indexes for table `phongtro`
--
ALTER TABLE `phongtro`
  ADD PRIMARY KEY (`MaPhongTro`),
  ADD KEY `MaNhaTro` (`MaNhaTro`);

--
-- Indexes for table `phuongthucthanhtoan`
--
ALTER TABLE `phuongthucthanhtoan`
  ADD PRIMARY KEY (`MaPhuongThuc`);

--
-- Indexes for table `picture`
--
ALTER TABLE `picture`
  ADD PRIMARY KEY (`id`),
  ADD KEY `MaPhongTro` (`MaPhongTro`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`MaReviews`),
  ADD KEY `MaAccount` (`MaAccount`),
  ADD KEY `MaPhongTro` (`MaPhongTro`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account`
--
ALTER TABLE `account`
  MODIFY `MaAccount` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT for table `chutro`
--
ALTER TABLE `chutro`
  MODIFY `MaChuTro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `hopdongthue`
--
ALTER TABLE `hopdongthue`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `khachtro`
--
ALTER TABLE `khachtro`
  MODIFY `MaKhachTro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `nhatro`
--
ALTER TABLE `nhatro`
  MODIFY `MaNhaTro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `phongtro`
--
ALTER TABLE `phongtro`
  MODIFY `MaPhongTro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `phuongthucthanhtoan`
--
ALTER TABLE `phuongthucthanhtoan`
  MODIFY `MaPhuongThuc` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `picture`
--
ALTER TABLE `picture`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `MaReviews` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `chutro`
--
ALTER TABLE `chutro`
  ADD CONSTRAINT `chutro_ibfk_1` FOREIGN KEY (`MaAccount`) REFERENCES `account` (`MaAccount`);

--
-- Constraints for table `hopdongthue`
--
ALTER TABLE `hopdongthue`
  ADD CONSTRAINT `hopdongthue_ibfk_1` FOREIGN KEY (`MaChuTro`) REFERENCES `chutro` (`MaChuTro`),
  ADD CONSTRAINT `hopdongthue_ibfk_2` FOREIGN KEY (`MaKhachTro`) REFERENCES `khachtro` (`MaKhachTro`),
  ADD CONSTRAINT `hopdongthue_ibfk_3` FOREIGN KEY (`MaPhongTro`) REFERENCES `phongtro` (`MaPhongTro`),
  ADD CONSTRAINT `hopdongthue_ibfk_4` FOREIGN KEY (`MaPhuongThuc`) REFERENCES `phuongthucthanhtoan` (`MaPhuongThuc`);

--
-- Constraints for table `khachtro`
--
ALTER TABLE `khachtro`
  ADD CONSTRAINT `khachtro_ibfk_1` FOREIGN KEY (`MaAccount`) REFERENCES `account` (`MaAccount`);

--
-- Constraints for table `nhatro`
--
ALTER TABLE `nhatro`
  ADD CONSTRAINT `nhatro_ibfk_1` FOREIGN KEY (`MaChuTro`) REFERENCES `chutro` (`MaChuTro`);

--
-- Constraints for table `phongtro`
--
ALTER TABLE `phongtro`
  ADD CONSTRAINT `phongtro_ibfk_1` FOREIGN KEY (`MaNhaTro`) REFERENCES `nhatro` (`MaNhaTro`);

--
-- Constraints for table `picture`
--
ALTER TABLE `picture`
  ADD CONSTRAINT `picture_ibfk_1` FOREIGN KEY (`MaPhongTro`) REFERENCES `phongtro` (`MaPhongTro`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`MaAccount`) REFERENCES `account` (`MaAccount`) ON DELETE SET NULL,
  ADD CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`MaPhongTro`) REFERENCES `phongtro` (`MaPhongTro`) ON DELETE SET NULL;

DELIMITER $$
--
-- Events
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
