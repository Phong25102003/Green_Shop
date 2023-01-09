-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th1 09, 2023 lúc 04:42 PM
-- Phiên bản máy phục vụ: 10.4.25-MariaDB
-- Phiên bản PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `da1-greenshop`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bill`
--

CREATE TABLE `bill` (
  `id` int(10) NOT NULL,
  `iduser` int(10) DEFAULT 0,
  `bill_name` varchar(255) NOT NULL,
  `bill_address` varchar(255) NOT NULL,
  `bill_tel` varchar(50) NOT NULL,
  `bill_email` varchar(100) NOT NULL,
  `bill_pttt` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1. Thanh toán trực tiếp\r\n2. Chuyển khoản\r\n',
  `ngaydathang` varchar(50) NOT NULL,
  `total` int(10) NOT NULL DEFAULT 0,
  `bill_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0.Chờ xác nhận\r\n1.Đang lấy hàng\r\n2.Đang giao hàng\r\n3.Đã giao hàng\r\n4.Hoàn tất\r\n5.Hủy',
  `receive_name` varchar(255) DEFAULT NULL,
  `receive_address` varchar(255) DEFAULT NULL,
  `receive_tel` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `bill`
--

INSERT INTO `bill` (`id`, `iduser`, `bill_name`, `bill_address`, `bill_tel`, `bill_email`, `bill_pttt`, `ngaydathang`, `total`, `bill_status`, `receive_name`, `receive_address`, `receive_tel`) VALUES
(141, 1, 'Dinh Van Tai', 'xóm 6, giaothuy, namdinh', '0916523894', 'taidvph20044@fpt.edu.vn', 2, '02:06:22pm 11/12/2022', 190000, 4, NULL, NULL, NULL),
(142, 1, 'Dinh Van Tai', 'xóm 6, giaothuy, namdinh', '0916523894', 'taidvph20044@fpt.edu.vn', 1, '02:18:01pm 11/12/2022', 1425000, 0, NULL, NULL, NULL),
(143, 447, 'Trang', 'giaothuy, namdinh', '0916523', 'anhnek033@gmail.com', 2, '07:44:09pm 11/12/2022', 130000, 0, NULL, NULL, NULL),
(144, 1, 'Dinh Van Tai', 'xóm 6, giaothuy, namdinh', '0916523894', 'taidvph20044@fpt.edu.vn', 1, '09:25:18pm 11/12/2022', 76000, 5, NULL, NULL, NULL),
(145, 467, 'Thuylinh', 'giaothuy, namdinh', '0916523', 'anhnek033@gmail.com', 2, '11:05:03pm 11/12/2022', 12000, 5, NULL, NULL, NULL),
(147, 469, 'nguyen phong', '7b ngo 15 phu kieu', '0327245794', 'phonglun.033@gmail.com', 1, '04:56:01pm 14/12/2022', 945000, 1, NULL, NULL, NULL),
(148, 1, 'Dinh Van Tai', 'xóm 6, giaothuy, namdinh', '0916523894', 'taidvph20044@fpt.edu.vn', 2, '08:18:09am 15/12/2022', 190000, 0, NULL, NULL, NULL),
(150, 1, 'Dinh Van Tai', 'xóm 6, giaothuy, namdinh', '0916523894', 'taidvph20044@fpt.edu.vn', 1, '08:25:00am 15/12/2022', 570000, 2, NULL, NULL, NULL),
(151, 471, 'nguyen phong', '7b ngo 15 phu kieu', '', 'phonglun.033@gmail.com', 1, '12:13:29pm 30/12/2022', 840000, 5, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `binhluan`
--

CREATE TABLE `binhluan` (
  `id` int(11) NOT NULL,
  `noidung` varchar(255) NOT NULL,
  `iduser` int(11) NOT NULL,
  `idpro` int(11) NOT NULL,
  `ngaybinhluan` varchar(30) NOT NULL,
  `nameuser` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `binhluan`
--

INSERT INTO `binhluan` (`id`, `noidung`, `iduser`, `idpro`, `ngaybinhluan`, `nameuser`) VALUES
(31, 'Mlem giá quá rẻ', 1, 26, '08/12/2022', 'Huyền xưn gái'),
(32, 'Đóng gói sản phẩm chu đáo', 1, 21, '08/12/2022', 'Hỳn'),
(37, 'Giao hàng chậm ghê', 1, 24, '09/12/2022', 'Tài'),
(40, 'Rau có sâu', 0, 23, '10/12/2022', 'Mai Linh'),
(41, 'Dâu này khá ngọt', 1, 31, '11/12/2022', 'Trang Nguyễn'),
(43, 'rau sạch', 1, 21, '15/12/2022', 'Tài');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart`
--

CREATE TABLE `cart` (
  `id` int(10) NOT NULL,
  `iduser` int(10) NOT NULL,
  `idpro` int(10) NOT NULL,
  `img` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` int(10) NOT NULL,
  `soluong` int(2) NOT NULL,
  `thanhtien` int(10) NOT NULL,
  `idbill` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `cart`
--

INSERT INTO `cart` (`id`, `iduser`, `idpro`, `img`, `name`, `price`, `soluong`, `thanhtien`, `idbill`) VALUES
(205, 1, 21, 'caikheoorganic_786f325d427d4137acf2d68174c2088e_master.jpg', 'Cải Kale', 95000, 2, 190000, 141),
(206, 1, 31, 'can_tay_sach__facebook_post___900___900_px___1__e7084f6692df484d8a40ae5636627cf1_master.png', 'Dâu Tây Đà Lạt', 285000, 5, 1425000, 142),
(207, 447, 23, 'raudenxanh_4df418f46cee4370976896c735237339_master.png', 'Dền xanh', 65000, 2, 130000, 143),
(208, 1, 30, 'chuoilaba_046fc9198e8e44f39e6177b54cc82d03_master.png', 'Chuối Laba', 38000, 2, 76000, 144),
(209, 467, 27, 'ca_rot_cong_tim_66d0e35aea50418985745406d20c64c1_master.png', 'Cà rốt cọng tím hữu cơ', 12000, 1, 12000, 145),
(210, 468, 30, 'chuoilaba_046fc9198e8e44f39e6177b54cc82d03_master.png', 'Chuối Laba', 38000, 2, 76000, 146),
(211, 469, 22, 'suploxanh_e0ecdc2b57994d548490c6bbc80fea5f_master.PNG', 'Bông Cải Xanh', 105000, 9, 945000, 147),
(212, 1, 21, 'caikheoorganic_786f325d427d4137acf2d68174c2088e_master.jpg', 'Cải Kale', 95000, 2, 190000, 148),
(213, 1, 28, 'dauhalan_d1e15712ade14d07b29ff83a9e08104f_master.png', 'Đậu Hà Lan', 180000, 4, 720000, 149),
(214, 1, 24, 'b-cuden_ff76e9575f9249db9bcb9b18603365d6_master.png', 'Củ dền', 65000, 3, 195000, 149),
(215, 1, 31, 'can_tay_sach__facebook_post___900___900_px___1__e7084f6692df484d8a40ae5636627cf1_master.png', 'Dâu Tây Đà Lạt', 285000, 2, 570000, 150),
(216, 471, 22, 'suploxanh_e0ecdc2b57994d548490c6bbc80fea5f_master.PNG', 'Bông Cải Xanh', 105000, 8, 840000, 151);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `danhmuc`
--

CREATE TABLE `danhmuc` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `danhmuc`
--

INSERT INTO `danhmuc` (`id`, `name`) VALUES
(19, 'Hoa quả'),
(20, 'Rau củ');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sanpham`
--

CREATE TABLE `sanpham` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` int(11) DEFAULT 0,
  `img` varchar(255) DEFAULT NULL,
  `mota` text DEFAULT NULL,
  `luotxem` int(11) DEFAULT 0,
  `iddm` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `sanpham`
--

INSERT INTO `sanpham` (`id`, `name`, `price`, `img`, `mota`, `luotxem`, `iddm`) VALUES
(21, 'Cải Kale', 95000, 'caikheoorganic_786f325d427d4137acf2d68174c2088e_master.jpg', 'Cải Kale còn được gọi với cái tên khác là cải xoăn, thuộc họ Brassica oleracea, cùng họ với rau cải bắp, súp lơ, bông cải xanh, rau xanh Collard hay cải Bruxen.\r\n\r\n', 0, 20),
(22, 'Bông Cải Xanh', 105000, 'suploxanh_e0ecdc2b57994d548490c6bbc80fea5f_master.PNG', 'Bông cải xanh còn được gọi là Súp lơ xanh hoặc Cải bông xanh (tên tiếng Anh là Broccoli) là loại cây thuộc loài Cải bắp dại, họ Brassica oleracea có nguồn gốc từ Ý. Hiện nay, ở Việt Nam, bông cải xanh được trồng ở những vùng có khí hậu mát mẻ như Đà Lạt và một số khu vực Tây Nguyên.', 0, 20),
(23, 'Dền xanh', 65000, 'raudenxanh_4df418f46cee4370976896c735237339_master.png', 'Rau dền được cho là có nguồn gốc Trung Mỹ và Nam Mỹ, nó có mặt tại nhiều nơi trên thế giới cả ôn đới lẫn nhiệt đới. Rau dền xanh cũng là 1 loại rau phổ biến của người dân Việt Nam. Dền xanh hữu cơ được trồng và thu hoạch hoàn toàn hữu cơ, không có các chất hóa học, không sử dụng thuốc tăng trưởng, biến đổi gen,…', 0, 20),
(24, 'Củ dền', 65000, 'b-cuden_ff76e9575f9249db9bcb9b18603365d6_master.png', 'Củ dền còn có tên khác là củ dền đỏ, thuộc loại củ cải ngọt, tên tiếng Anh là Beetroot. Củ dền trồng nhiều ở khu vực Bắc Mỹ, Trung Mỹ và nước Anh.\r\n\r\nCủ dền trồng nhiều ở Đà Lạt được trồng theo phương pháp hữu cơ, không chứa hóa chất nên an toàn cho người tiêu dùng.', 0, 20),
(27, 'Cà rốt cọng tím hữu cơ', 12000, 'ca_rot_cong_tim_66d0e35aea50418985745406d20c64c1_master.png', 'Cà rốt cọng tím có tên khoa học chung là Daucus carota. Đây là phiên bản đặc biệt, được phối giống từ Trung tâm Cải tiến Rau và Quả A&M AgriLife (Bang Texas, Hoa Kỳ).', 0, 20),
(28, 'Đậu Hà Lan', 180000, 'dauhalan_d1e15712ade14d07b29ff83a9e08104f_master.png', 'Đậu Hà Lan có 1 mảnh vỏ, màu xanh lục, bên trong có các hạt đậu hình tròn màu xanh giống như mảnh vỏ. Chiều dài và số lượng hạt trong đậu Hà Lan tùy thuộc vào giống và điều kiện phát triển. Thường thì mỗi tép có khoảng 5-10 hạt đậu.', 0, 20),
(29, 'Bắp cải', 170000, 'c-bapcai_930192e3be0d4e559f7b9e5f4afcac59_b4daf3f0acbe49d7a8bd0788dda78d44_master.png', 'Vitamin của bắp cải nhiều gấp 4,5 lần với lượng vitamin có trong cà rốt. Và nhiều hơn khoảng 3,6 lần so với khoai tây và hành tây. Cùng với 1 số khoáng chất và chất dinh dưỡng khác nên bắp cải giúp ích rất nhiều cho cơ thể. Bắp cải giúp giảm các dấu hiệu lão hóa, chống lại sự phát triển của các gốc tự do gây ung thư, tốt cho làn da, chống viêm, tốt cho hệ tiêu hóa, giảm cân,..', 0, 20),
(30, 'Chuối Laba', 38000, 'chuoilaba_046fc9198e8e44f39e6177b54cc82d03_master.png', 'Giống chuối này còn được biết đến với cái tên là “chuối Tiến Vua”. Vì trong lịch sử, đây chính là loại chuối được dùng để tiến lên Vua Bảo Đại. Chuối Laba  ngày càng được ưa chuộng nhờ hương vị thơm ngon và dẻo ngọt.', 0, 19),
(31, 'Dâu Tây Đà Lạt', 285000, 'can_tay_sach__facebook_post___900___900_px___1__e7084f6692df484d8a40ae5636627cf1_master.png', 'Dâu tây Đà Lạt là một loại trái cây thơm ngon và rất giàu dinh dưỡng, vì thế có rất nhiều người yêu thích loại quả này, nhất là trẻ nhỏ. Vậy khi muốn mua dâu tây ngon từ Đà Lạt mà bạn đang ở TP HCM thì nên mua ở đâu? Bài viết sau sẽ giới thiệu đến bạn nơi bán dâu tây uy tín, chất lượng, mời bạn đọc tham khảo.', 0, 19),
(32, 'Cam Mỹ Sweet Air', 160000, 'spnt_04_69075a96eee14254a366b58b0ae207d4_master.png', 'Cam Mỹ  Mỹ vốn là giống táo được lai chéo giữa hai giống táo Mỹ (Red Delicious) và giống Virginia Ralls Genet bởi những chuyên gia cây trồng tại Trạm nghiên cứu Tohoku thuộc thị trấn Fujisaki, Aomori, Nhật Bản và đã được đưa ra thị trường thương mại tại Mỹ vào những năm 1980.', 0, 19);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `taikhoan`
--

CREATE TABLE `taikhoan` (
  `id` int(10) NOT NULL,
  `user` varchar(50) NOT NULL,
  `pass` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `tel` varchar(20) DEFAULT NULL,
  `role` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0. Người dùng\r\n1.Admin'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `taikhoan`
--

INSERT INTO `taikhoan` (`id`, `user`, `pass`, `email`, `address`, `tel`, `role`) VALUES
(1, 'Dinh Van Tai', 'taidinhvani', 'taidvph20044@fpt.edu.vn', 'xóm 6, giaothuy, namdinh', '0916523894', 1),
(65, 'namcuong', 'taidinhvan', '', 'giaothuy, namdinh2', '0916523894', 0),
(470, 'admin1', '1', 'phonglun.033@gmail.com', NULL, NULL, 0),
(471, '1', '1', 'phonglun.033@gmail.com', NULL, NULL, 0);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `binhluan`
--
ALTER TABLE `binhluan`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `danhmuc`
--
ALTER TABLE `danhmuc`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lk_sanpham_danhmuc` (`iddm`);

--
-- Chỉ mục cho bảng `taikhoan`
--
ALTER TABLE `taikhoan`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `bill`
--
ALTER TABLE `bill`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=152;

--
-- AUTO_INCREMENT cho bảng `binhluan`
--
ALTER TABLE `binhluan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT cho bảng `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=217;

--
-- AUTO_INCREMENT cho bảng `danhmuc`
--
ALTER TABLE `danhmuc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT cho bảng `taikhoan`
--
ALTER TABLE `taikhoan`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=472;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  ADD CONSTRAINT `lk_sanpham_danhmuc` FOREIGN KEY (`iddm`) REFERENCES `danhmuc` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
