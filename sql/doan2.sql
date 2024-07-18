-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th6 20, 2022 lúc 05:57 PM
-- Phiên bản máy phục vụ: 10.4.22-MariaDB
-- Phiên bản PHP: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `doan2`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `productName` varchar(100) NOT NULL,
  `productPrice` decimal(10,0) NOT NULL,
  `productImage` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `cart`
--

INSERT INTO `cart` (`id`, `userId`, `productId`, `qty`, `productName`, `productPrice`, `productImage`) VALUES
(75, 34, 19, 50, 'hkjhk', '20000', 'trasua.jpg'),
(125, 1, 24, 1, 'Trà sữa cream cheese', '74000', 'ddf9d85239.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `name`, `status`) VALUES
(2, 'Trà sữa', 1),
(4, 'Món ăn', 1),
(5, 'Nước giải khát', 1),
(6, 'Bánh', 1),
(7, 'Ăn vặt', 1),
(8, 'ăn vặt1', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comment`
--

CREATE TABLE `comment` (
  `id` int(10) NOT NULL,
  `userid` int(10) NOT NULL,
  `productId` int(10) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `content` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `comment`
--

INSERT INTO `comment` (`id`, `userid`, `productId`, `date`, `content`, `status`) VALUES
(1, 31, 17, '2022-06-16 21:36:34', 'comment1', '1');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `customers`
--

CREATE TABLE `customers` (
  `id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `user_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_adress` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_mail` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `createdDate` date NOT NULL,
  `receivedDate` date DEFAULT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `userId`, `createdDate`, `receivedDate`, `status`) VALUES
(39, 31, '2021-12-07', '2021-12-07', 'Complete'),
(40, 1, '2022-06-11', '2022-06-17', 'Delivering'),
(41, 1, '2022-06-12', '2022-06-19', 'Processed'),
(42, 1, '2022-06-13', '2022-06-21', 'Processed'),
(43, 31, '2022-06-17', '2022-06-20', 'Processed'),
(44, 1, '2022-06-17', '2022-06-21', 'Delivering'),
(45, 1, '2022-06-17', '2022-06-20', 'Processed'),
(46, 1, '2022-06-17', NULL, 'Processing'),
(47, 1, '2022-06-17', NULL, 'Processing'),
(48, 1, '2022-06-17', NULL, 'Processing'),
(49, 31, '2022-06-17', NULL, 'Processing'),
(50, 31, '2022-06-17', NULL, 'Processing'),
(51, 31, '2022-06-18', '2022-06-18', 'Complete');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_details`
--

CREATE TABLE `order_details` (
  `id` int(11) NOT NULL,
  `orderId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `productPrice` decimal(10,0) NOT NULL,
  `productName` varchar(100) NOT NULL,
  `productImage` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `order_details`
--

INSERT INTO `order_details` (`id`, `orderId`, `productId`, `qty`, `productPrice`, `productName`, `productImage`) VALUES
(36, 39, 2, 2, '40000', 'Trà sữa truyền thống', 'trasua.jpg'),
(37, 39, 4, 1, '15000', 'Khoai tây chiên lắc phô mai', 'thanh-pham-292.jpg'),
(38, 39, 17, 3, '30000', 'Coca-Cola', 'cocacola.jpg'),
(39, 39, 18, 4, '40000', 'Sprite', 'index.jpg'),
(40, 40, 17, 1, '10000', 'Coca-Cola', 'cocacola.jpg'),
(41, 41, 2, 2, '18000', 'Trà sữa truyền thống', 'trasua.jpg'),
(42, 41, 4, 2, '15000', 'Khoai tây chiên lắc phô mai', 'thanh-pham-292.jpg'),
(43, 41, 17, 2, '10000', 'Coca-Cola', 'cocacola.jpg'),
(44, 42, 4, 3, '15000', 'Khoai tây chiên lắc phô mai', 'thanh-pham-292.jpg'),
(45, 42, 17, 3, '10000', 'Coca-Cola', 'cocacola.jpg'),
(46, 43, 4, 2, '15000', 'Khoai tây chiên lắc phô mai', 'thanh-pham-292.jpg'),
(47, 43, 18, 1, '10000', 'Sprite', 'sprite.png'),
(48, 43, 17, 1, '10000', 'Coca-Cola', 'cocacola.jpg'),
(49, 44, 24, 1, '74000', 'Trà sữa cream cheese', 'ddf9d85239.jpg'),
(50, 45, 60, 5, '139000', 'Bánh tart dâu tây', '9783cedc52.jpg'),
(51, 45, 25, 7, '30000', 'Trà sữa thái xanh', '1f3b4f9dc9.jpg'),
(52, 45, 26, 4, '50000', 'Trà dưỡng sinh cam quế', 'a4e5fa7c03.jpg'),
(53, 45, 19, 3, '25000', 'Gà rán', 'df7f2816af.jpg'),
(54, 46, 38, 5, '30000', 'Trà đào cam sả', 'f4d9bf3493.jpg'),
(55, 46, 41, 2, '35000', 'Trà sữa chocolate', 'b039fa530c.jpg'),
(56, 46, 42, 7, '40000', 'Trà sữa matcha', '76726dd87d.jpg'),
(57, 46, 43, 2, '32000', 'Trà sữa hoa đậu biếc', 'a49e3ca594.jpg'),
(58, 46, 31, 11, '65000', 'Pizza', 'bcfc8cab8b.jpg'),
(59, 46, 33, 5, '42000', 'Hamburger', 'bdcb889a04.jpg'),
(60, 46, 35, 2, '78000', 'Beefsteak', '1502d8aae7.jpg'),
(61, 46, 37, 3, '60000', 'Phở ', '61d600c490.jpg'),
(62, 46, 46, 3, '52000', 'Mỳ ý sốt bò bằm', 'f8f66100d6.jpg'),
(63, 46, 47, 3, '28000', 'Cơm tấm', '75524a0ac6.jpg'),
(64, 46, 39, 2, '15000', 'Trà tắc xí muội', '7ad9230639.jpg'),
(65, 46, 40, 1, '15000', 'Trà chanh', '295deb10d8.jpg'),
(66, 46, 63, 15, '82000', 'Nước ép dưa hấu', '86c9166d7c.jpg'),
(67, 46, 62, 7, '56000', 'Nước ép khóm', '160eeedc34.jpg'),
(68, 46, 61, 3, '24000', 'Trà ô long', '6dc861f3d9.jpg'),
(69, 46, 56, 9, '25000', 'Nước dừa tươi', '073fdfccdb.jpg'),
(70, 46, 30, 1, '40000', 'Bánh Tiramisu', 'bf45be28a9.jpg'),
(71, 46, 32, 4, '99000', 'Bánh Panna Cotta', '3ef6350ded.jpg'),
(72, 46, 34, 5, '69000', 'Bánh Mochi', '8c9c9b1769.jpg'),
(73, 46, 36, 7, '21000', 'Bánh dorayaki', '387112998b.jpg'),
(74, 46, 57, 17, '119000', 'Bánh donut', '96753b0db9.jpg'),
(75, 46, 58, 4, '80000', 'Bánh bông lan trứng muối phô mai chà bông', 'c536e3d0ba.jpg'),
(76, 46, 59, 4, '89000', 'Bánh bông lan phô mai tan chảy', '71d257becc.jpg'),
(77, 46, 60, 3, '139000', 'Bánh tart dâu tây', '9783cedc52.jpg'),
(78, 46, 27, 2, '25000', 'bánh tráng trộn', 'be0b90e912.jpg'),
(79, 46, 28, 5, '35000', 'Tré trộn', '5251236b95.jpg'),
(80, 46, 29, 2, '55000', 'Hàu nướng mỡ hành', '42042c8c07.jpg'),
(81, 46, 50, 3, '70000', 'Chân gà sả tắc', '5406d5def4.jpg'),
(82, 46, 51, 1, '22000', 'Bánh mì nướng muối ớt', '0cbf16b041.jpg'),
(83, 46, 52, 1, '18000', 'Cơm cháy chà bông', '6a57ecca12.jpg'),
(84, 46, 53, 6, '26000', 'Cá viên chiên', '2ef0ac50c3.jpg'),
(85, 46, 54, 1, '18000', 'Bao tử cá chiên giòn', '3fae952888.jpg'),
(86, 47, 32, 6, '99000', 'Bánh Panna Cotta', '3ef6350ded.jpg'),
(87, 47, 30, 6, '40000', 'Bánh Tiramisu', 'bf45be28a9.jpg'),
(88, 48, 35, 16, '78000', 'Beefsteak', '1502d8aae7.jpg'),
(89, 48, 26, 6, '50000', 'Trà dưỡng sinh cam quế', 'a4e5fa7c03.jpg'),
(90, 49, 2, 1, '18000', 'Trà sữa truyền thống', 'trasua.jpg'),
(91, 49, 4, 1, '15000', 'Khoai tây chiên lắc phô mai', 'thanh-pham-292.jpg'),
(92, 50, 32, 1, '99000', 'Bánh Panna Cotta', '3ef6350ded.jpg'),
(93, 51, 4, 1, '15000', 'Khoai tây chiên lắc phô mai', 'thanh-pham-292.jpg'),
(94, 51, 63, 2, '82000', 'Nước ép dưa hấu', '86c9166d7c.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `originalPrice` decimal(10,0) NOT NULL,
  `promotionPrice` decimal(10,0) NOT NULL,
  `image` varchar(50) NOT NULL,
  `createdBy` int(11) NOT NULL,
  `createdDate` date NOT NULL,
  `cateId` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `des` varchar(1000) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `soldCount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `name`, `originalPrice`, `promotionPrice`, `image`, `createdBy`, `createdDate`, `cateId`, `qty`, `des`, `status`, `soldCount`) VALUES
(2, 'Trà sữa truyền thống', '20000', '18000', 'trasua.jpg', 1, '0000-00-00', 2, 21, 'Trà sữa không chỉ là thức uống hấp dẫn giới trẻ, hương vị thơm béo đặc trưng của trà sữa còn là món “gây nghiện” với mỗi người, mỗi nhà!', 1, 13),
(4, 'Khoai tây chiên lắc phô mai', '15000', '15000', 'thanh-pham-292.jpg', 1, '0000-00-00', 4, 41, 'Món khoai tây chiên lắc phô mai với sắc màu vàng ngon, giòn rụm trông cực kỳ bắt mắt! Miếng khoai vừa bùi vừa thơm hòa quyện với vị béo béo của phô mai ngon khó cưỡng.', 1, 16),
(17, 'Coca-Cola', '10000', '10000', 'cocacola.jpg', 1, '2021-12-07', 5, 14, 'Nước giải khát Coca Colađược sản xuất tại Việt Nam trêndây chuyền, công nghệ hiện đại của Mỹ, đảm bảo tuyệt đối về chất lượng. Sản phẩm được chế biến từ những nguyên liệu không chứahóa chất độc hại, đảm bảo an toàn tuyệt đối khi sử dụng. Sản phẩmgiúp bạn nhanh chóng xua tan cơn khát, ngoài raNước giải khátCoca Colacòn kích thích vị giác, làm tăng hương vị cho các món ăn.Nước giải khát Coca Colađược đóng lontiện dụng, dễ bảo quản và dùng được lâu.', 1, 6),
(18, 'Sprite', '10000', '10000', 'sprite.png', 1, '2021-12-07', 5, 23, 'Hương vị được ưa chuộng tại hơn 190 quốc gia và lọt top những nước giải khát được yêu thích nhất toàn cầu. Với vị chanh tươi mát cùng những bọt ga sảng khoái tê đầu lưỡi giúp bạn đập tan cơn khát ngay tức thì. Sản phẩm cam kết chính hãng, chất lượng và an toàn từ nhà Sprite\r\n', 1, 1),
(19, 'Gà rán', '25000', '25000', 'df7f2816af.jpg', 1, '2022-06-12', 4, 9, 'Thịt gà chiên bên trong chín mềm và dai ngọt, lớp vỏ chiên giòn nở to và giòn tan, khi ăn cùng với một ít tương ớt sẽ làm món ăn thêm hấp dẫn và đậm vị.', 1, 3),
(24, 'Trà sữa cream cheese', '86000', '74000', 'ddf9d85239.jpg', 1, '2022-06-17', 2, 24, 'Trà sữa cookie oreo đậm vị trà, beo béo vị sữa cùng chút ngọt thơm, đắng nhẹ từ lớp cookie hứa hẹn sẽ là thức uống hấp dẫn cho cả nhà bạn thưởng thức.', 1, 1),
(25, 'Trà sữa thái xanh', '45000', '30000', '1f3b4f9dc9.jpg', 1, '2022-06-17', 2, 13, 'Trà sữa thái xanh (hay còn được gọi tắt là trà thái xanh) là một loại thức uống dùng nước trà kết hợp với sữa béo, cho ra hỗn hợp trà sữa béo ngậy và đậm vị mà người Thái Lan hay dùng. Điểm đặc biệt của loại trà này đó là chỉ có dùng gói trà Thái Lan mới mang lại mùi vị đặc trưng vốn có của món này, nhưng nếu bạn dùng trà khác sẽ thấy vị tạo ra rất khác, gần như khác hoàn toàn luôn ấy.', 1, 7),
(26, 'Trà dưỡng sinh cam quế', '55000', '50000', 'a4e5fa7c03.jpg', 1, '2022-06-17', 2, 0, 'Sắc vàng và nâu của Cam, Quế cùng hương vị ngọt ngào ấm nồng của hai loại trà này thực sự rất hợp với mùa đông, đem đến sự bình yên ấm áp cho mọi người.\r\n', 1, 10),
(27, 'bánh tráng trộn', '30000', '25000', 'be0b90e912.jpg', 1, '2022-06-17', 7, 17, 'Bánh tráng trộn thịt băm mỡ hành vô cùng thơm ngon, hấp dẫn và hợp khẩu vị của nhiều người. Bánh tráng kết hợp với vị cay cay của sa tế, vị bùi bùi của đậu phộng, vị thơm của tỏi phi, hành phi và đặc biệt là thịt bằm rất lạ miệng.\r\n\r\n', 1, 2),
(28, 'Tré trộn', '40000', '35000', '5251236b95.jpg', 1, '2022-06-17', 7, 23, 'Tré là một đặc sản của xứ Nẫu Bình Định, tré được xem. Tré truyền thống được làm từ thịt tai heo, thịt đầu heo, vừng, riềng, ớt hiểm, lá ổi non cuốn bên ngoài, sợi rơm để ủ và các gia vị khác. Tré khác với nem chua ở chỗ là nguyên liệu làm tré được nấu chín hoàn toàn, nên rất thơm ngon. Khi ăn có chút vị ngọt bùi của thính xen lẫn vị chua chua đặc trưng, ăn rất lạ miệng.', 1, 5),
(29, 'Hàu nướng mỡ hành', '55000', '55000', '42042c8c07.jpg', 1, '2022-06-17', 7, 19, 'Hàu nướng mỡ hành là một trong những món đặc sản Hạ Long mà ai thử qua cũng nhớ hoài hương vị. Món ăn thơm ngon, giàu giá trị dinh dưỡng này có thể thực hiện ngay tại nhà chỉ với những bước đơn giản nếu bạn nắm trọn bộ “bí kíp” chế biến hàu nướng thơm ngon được chia sẻ sau đây.', 1, 2),
(30, 'Bánh Tiramisu', '45000', '40000', 'bf45be28a9.jpg', 1, '2022-06-17', 6, 3, 'Loại bánh hấp dẫn này có nguồn gốc từ nước Ý thơ mộng. Cắn một miếng bánh với lớp bánh mềm mềm, hòa cùng mùi cà phê ca cao thơm phức, và đặc biệt là lớp kem béo ngậy nhưng không hề ngán. Món bánh này có thể chinh phục cả những người khó tính nhất.', 1, 7),
(31, 'Pizza', '65000', '65000', 'bcfc8cab8b.jpg', 1, '2022-06-17', 4, 6, 'Bánh pizza thơm ngon là món ăn yêu thích của nhiều người. Món bánh ngon với lớp đế giòn thơm, hòa quyện cùng nhân phô mai tan chảy và lớp topping đa dạng khẩu vị đã khiến pizza phổ biến trên rất nhiều quốc gia.', 1, 11),
(32, 'Bánh Panna Cotta', '119000', '99000', '3ef6350ded.jpg', 1, '2022-06-17', 6, 33, 'Panna cotta trong tiếng Ý có nghĩa là “kem nấu”, là loại bánh nấu kem, sữa, đường với gelatin rồi làm đông lại, tạo nên chiếc bánh mềm mịn, ngọt ngào, hương vị béo ngậy hấp dẫn. Panna cotta có độ sánh mịn như bánh flan nhưng có hương vị khác đặc trưng, khi đưa vào miệng có cảm giác mát lạnh, mềm mại như yaourt và tan nhanh trong miệng.', 1, 11),
(33, 'Hamburger', '45000', '42000', 'bdcb889a04.jpg', 1, '2022-06-17', 4, 11, 'Hamburger nói chung là món ăn được yêu thích trên toàn thế giới với hương vị thơm ngon. Một chiếc bánh hamburger cung cấp cho bạn đầy đủ dinh dưỡng gồm chất xơ, protein, tinh bột, chất béo, từ đó bạn có năng lượng và năng lượng cho cả ngày.', 1, 5),
(34, 'Bánh Mochi', '79000', '69000', '8c9c9b1769.jpg', 1, '2022-06-17', 6, 4, 'Bánh mochi loại bánh rất công phu, phức tạp đến từ Nhật Bản với lớp vỏ được làm bằng bột nếp, cùng với các loại nhân đa dạng bên trong và hình dạng bắt mắt thú vị bên ngoài. Một loại bánh ngọt truyền thống, thường được người Nhật dùng vào các dịp lễ, Tết hay đơn giản là những ngày họp mặt của gia đình với ý nghĩa mang lại mai mắn cho người dùng và mong ước một cuộc sống ấm no, dài lâu.', 1, 5),
(35, 'Beefsteak', '99000', '78000', '1502d8aae7.jpg', 1, '2022-06-17', 4, 26, 'Bò bít tết (Beefsteak trong tiếng Anh hoặc bifteck trong tiếng Pháp) được chế biến từ thịt thăn bò. Thịt được cắt ngang thớ, mỏng từ 1-5 cm, loại bỏ gân và làm mềm. Sau đó cho thêm các loại gia vị và nước dùng chuyên dụng và chiên hoặc nướng hai mặt. Món này thể ăn kèm sốt, hành tây, khoai tây chiên, salad,...', 1, 18),
(36, 'Bánh dorayaki', '26000', '21000', '387112998b.jpg', 1, '2022-06-17', 6, 22, 'Dorayaki là loại bánh ưa thích của mèo máy Doraemon trong bộ truyện tranh cùng tên. Nhiều người Việt Nam vẫn hay nhầm dorayaki với \"bánh rán\" do cách dịch sai của nhà xuất bản thời kỳ đầu. Tuy nhiên, món này thực chất là một biến thể của pancake, thường được ăn kèm cùng nhân đậu đỏ.', 1, 7),
(37, 'Phở ', '65000', '60000', '61d600c490.jpg', 1, '2022-06-17', 4, 25, 'Phở là một món ăn truyền thống của Việt Nam, có nguồn gốc từ Hà Nội và Nam Định, và được xem là một trong những món ăn tiêu biểu cho nền ẩm thực Việt Nam. Thành phần chính của phở là bánh phở và nước dùng cùng với thịt bò hoặc thịt gà cắt lát mỏng. Thịt bò thích hợp nhất để nấu phở là thịt, xương từ các giống bò ta.', 1, 3),
(38, 'Trà đào cam sả', '35000', '30000', 'f4d9bf3493.jpg', 1, '2022-06-17', 2, 25, 'Trà đào cam sả có màu sắc rất đẹp, vị thanh ngọt vừa đủ. Nước uống mát lạnh có mùi thơm của sả, cùng miếng đào mềm căng nước chính là đồ uống yêu thích rất nhiều người. Tuy nhiên, phần lớn chúng ta đều thưởng thức ở những quán cafe sang chảnh thay vì tự làm tại nhà. Tranh thủ thời gian này ở nhà, dù có khéo tay hay không thì bạn sẽ thực hành thành công với cách làm trà đào cam sả vô cùng đơn giản dưới đây.', 1, 5),
(39, 'Trà tắc xí muội', '15000', '15000', '7ad9230639.jpg', 1, '2022-06-17', 5, 23, 'Tắc dạng sợi, mềm, không nhũn. Xí muội mềm dầm nát.Dạng sánh, không có hiện tượng sủi bọt, không đóng váng, không tạp chất.Màu nâu vàng đến nâu sậm đặc trưng của sản phẩm. Mùi thơm đặc trưng của sản phẩm, không mùi lạ.Vị ngọt, mặn, chua nhẹ hòa hợp, hơi thanh đặc trưng của tắc, không có vị lạ.', 1, 2),
(40, 'Trà chanh', '15000', '15000', '295deb10d8.jpg', 1, '2022-06-17', 5, 13, 'Trà chanh là một đồ uống thơm ngon được sử dụng phổ biến, trà chanh là sự kết hợp giữa vị chanh tươi và cốt trà lài, trà chanh mang đến cảm giác sảng khoái mát lạnh giữa ngày nắng nóng giúp tinh thần thoải mái, mát lạnh, được sử dụng phổ biến vào những mùa nắng nóng', 1, 1),
(41, 'Trà sữa chocolate', '40000', '35000', 'b039fa530c.jpg', 1, '2022-06-17', 2, 27, 'Trà sữa vị chocolate đậm đà, trân châu đen dai dai, whipping cream, bánh oreo, bánh que choco và đặc biệt là nguyên cây kem Choco luôn. Uống vào một miếng là bùng nổ hương vị.', 1, 2),
(42, 'Trà sữa matcha', '45000', '40000', '76726dd87d.jpg', 1, '2022-06-17', 2, 5, 'Ngày nay, xu hướng sử dụng trà matcha thay cho các loại đồ uống như rượu, cafe hay đồ có cồn đang dần phổ biến hơn. Bởi vì matcha có rất nhiều công dụng tốt với sức khỏe, giúp xương chắc khỏe, giảm stress, tăng cường độ tập trung,… Và giờ đây, bạn hoàn toàn có thể kết hợp bột matcha vào các loại đồ uống khác như là trà sữa.', 1, 7),
(43, 'Trà sữa hoa đậu biếc', '40000', '32000', 'a49e3ca594.jpg', 1, '2022-06-17', 2, 8, 'Trà sữa hoa đậu biếc là một loại trà sữa thảo mộc, hấp dẫn giới trẻ trên thị trường bởi màu sắc tự nhiên và biến đổi màu sắc kỳ diệu.', 1, 2),
(44, 'Trà sữa dâu tây', '40000', '34000', '12a3f13b20.jpg', 1, '2022-06-17', 2, 22, 'Trà sữa dâu là một tên gọi của loại trà sữa từ những người yêu sự ngọt ngào. Hương vị của dâu tây phối hợp cùng trà sữa khiến chúng trở nên thật đặc biệt từ một chút ngọt nhẹ từ dâu và đậm vị của trà', 1, 0),
(45, 'Sữa tươi trân châu đường đen', '55000', '47000', '620ca5f7a4.jpg', 1, '2022-06-17', 2, 31, 'Trà sữa trân châu đường đen được yêu thích nhờ sự kết hợp hết sức hoàn hảo giữa vị trà sữa thơm béo và trân châu đường đen mềm, ngọt.', 1, 0),
(46, 'Mỳ ý sốt bò bằm', '60000', '52000', 'f8f66100d6.jpg', 1, '2022-06-17', 4, 24, 'Mì Ý hay còn gọi là Spaghetti là loại mì trứ danh có nguồn gốc từ đất nước Italia (Ý). Trong ẩm thực Ý, mì Spaghetti thường được ăn với xốt cà chua với nhiều loại gia vị như: húng, dầu ôliu, thịt hoặc rau… Đôi khi người ta cũng thường rắc thêm một số loại phô mai xay vào để làm tăng hương vị.', 1, 3),
(47, 'Cơm tấm', '35000', '28000', '75524a0ac6.jpg', 1, '2022-06-17', 4, 17, 'Từ một món ăn sáng đơn giản, cơm tấm dần trở thành món ngon không thể thiếu trong đời sống ẩm thực của người dân Nam Bộ nói chung, dần dà còn xuất hiện khắp 3 miền, thậm chí \"lấn sân\" sang cả nước ngoài. Mỗi nơi đều có cách biến tấu cho khác đi một tí.', 1, 3),
(48, 'Bánh mì sanndwich', '29000', '24000', 'a01a081cdd.jpg', 1, '2022-06-17', 4, 15, 'Sandwich tưởng chừng như chủ yếu phổ biến  ở các nước phương Tây, tuy nhiên hiện nay món ăn này được rất nhiều gia đình Việt lựa chọn cho bữa sáng do những ưu điểm sau: \r\n\r\nTiện lợi và tiết kiệm: Có thể nói, sandwich là món ăn sáng vô cùng nhanh gọn và thiết thực, phù hợp với những người bận rộn, không thích những thứ phức tạp. Vì nguyên liệu làm bánh mì gần như đã sẵn sàng nên mỗi sáng bạn có thể chỉ cần  5 đến 10 phút.\r\nCung cấp đầy đủ chất dinh dưỡng: Bạn hoàn toàn có thể yên tâm vì bánh mì sandwich có thể cung cấp cho bạn  nguồn  dưỡng chất dồi dào và cần thiết cho một buổi sáng năng động từ bánh mì, trứng, sữa, thịt,… \r\nDễ dàng thay đổi: Bạn có thể dễ dàng thay đổi món sandwich của mình Thực đơn với nhiều loại thực phẩm khác nhau  theo sở thích của bạn như thịt, trứng, sữa, xúc xích, tôm, rau củ, phô mai, v.v.', 1, 0),
(49, 'Bún riêu cua ', '60000', '53000', 'e75cc3415d.jpg', 1, '2022-06-17', 4, 12, 'Cua đồng là loại thực phẩm rất quen thuộc của nhân dân ta, nguồn thực phẩm dễ kiếm, sẵn có ngay ở đồng ruộng. Về giá trị dinh dưỡng, trong 100 g cua đồng bỏ mai và yếm có 74,4 g nước, 12,3 g protid, 3,3 g lipid, 2 g glucid. Lượng vitamin và muối khoáng, đặc biệt là canxi trong cua đồng rất cao. Trong 100g cua có tới 5,040 mg canxi, 430 mg photpho, 4,7 mg sắt, các loại vitamin B1, B2, PP...', 1, 0),
(50, 'Chân gà sả tắc', '76000', '70000', '5406d5def4.jpg', 1, '2022-06-17', 7, 14, 'Chân gà ngâm sả tắc là một trong những món ăn tuyệt vời, thích hợp để nhâm nhi cùng bạn bè, người thân trong những cuộc ăn nhậu hay đơn giản những lúc buồn miệng chẳng biết nên ăn gì.\r\n\r\nMón chân gà sả tắc với sự kết hợp đầy ăn ý giữ hương vị chua chua, thơm thơm của tắc; hòa cùng vị cay tê của ớt; mùi hương đặc trưng hấp dẫn của sả nên bắt miệng và dễ nghiện cực kỳ.', 1, 3),
(51, 'Bánh mì nướng muối ớt', '25000', '22000', '0cbf16b041.jpg', 1, '2022-06-17', 7, 19, 'Món ăn này có nguồn gốc chính từ người dân tộc Khơ Me, bánh mì nướng muối ớt ban đầu chỉ được chế biến đơn giản là quét muối ớt lên bánh mì rồi nướng trên bếp than. Sau này, người dân An Giang nhận thấy đây là một món ăn độc đáo và đã phát triển thành bánh mì nướng muối ớt có đầy đủ nguyên liệu, thơm ngon như hiện nay.', 1, 1),
(52, 'Cơm cháy chà bông', '25000', '18000', '6a57ecca12.jpg', 1, '2022-06-17', 7, 10, 'Cơm cháy chà bông là món ăn vặt rất quen thuộc đối với nhiều người hiện nay. Miếng cơm cháy thơm hương nếp cùng vị mặn, béo của mỡ hành và chà bông sẽ khiến bạn mê ly từ lúc nào chẳng hay.', 1, 1),
(53, 'Cá viên chiên', '30000', '26000', '2ef0ac50c3.jpg', 1, '2022-06-17', 7, 3, 'Cá viên hay những loại xiên que là món ăn được rất nhiều bạn trẻ yêu thích nhờ độ thơm ngon, phong phú hương vị. Một phần thập cẩm có đầy đủ nào là cá viên, thanh cua, tôm viên... làm người ta say mê với vị ngọt, cái dai giòn vô cùng thích miệng.', 1, 6),
(54, 'Bao tử cá chiên giòn', '20000', '18000', '3fae952888.jpg', 1, '2022-06-17', 7, 6, 'Bao tử cá dai giòn sần sật chấm cùng xốt me chua ngọt hấp dẫn sẽ là món ngon cho cả nhà dịp cuối tuần, nhất là khi thịt heo đang tăng giá như hiện nay', 1, 1),
(55, 'Bingsu trái cây', '52000', '52000', '02be8a0b95.jpg', 1, '2022-06-17', 7, 16, 'Bingsu có nguồn gốc từ đất nước Hàn Quốc xinh đẹp. Hiện nay đây là món ăn vặt hấp dẫn mà bất kỳ du khách nào đến đây cũng không thể bỏ qua. Khi du nhập đến các quốc gia, cách chế biến Bingsu cũng được thay đổi nhiều. Tùy vào sở thích và phong cách ẩm thực mỗi nơi sẽ tạo ra món ăn mang nét đặc biệt riêng.', 1, 0),
(56, 'Nước dừa tươi', '25000', '25000', '073fdfccdb.jpg', 1, '2022-06-17', 5, 21, 'Không chỉ được xem như một loại nước giải khát, tác dụng của nước dừa còn hỗ trợ giảm huyết áp, cấp nước cho làn da… Để giúp bạn tìm hiểu rõ hơn, trong bài viết hôm nay chúng tôi sẽ chia sẻ đến bạn những công dụng của nước dừa. Đừng bỏ lỡ nhé!', 1, 9),
(57, 'Bánh donut', '129000', '119000', '96753b0db9.jpg', 1, '2022-06-17', 6, 7, 'Donut từ lâu đã trở thành món tráng miệng và thức ăn vặt yêu thích của nhiều người. Miếng bánh xốp mềm cùng phần trang trí và hình dáng bắt mắt, bánh Donut hấp dẫn người thưởng thức từ những miếng cắn đầu tiên.', 1, 17),
(58, 'Bánh bông lan trứng muối phô mai chà bông', '89000', '80000', 'c536e3d0ba.jpg', 1, '2022-06-17', 6, 28, 'Bánh bông lan trứng muối phô mai chà bông là sự kết hợp giữa vị mặn mà của trứng muối, vị đậm đà của chà bông, vị béo ngậy của phô mai cùng lớp bánh mềm mại tạo nên một hương vị rất hấp dẫn. Món ăn ngon khó cưỡng này đã chinh phục không biết bao người, từ trẻ nhỏ đến những người cao tuổi hơn.', 1, 4),
(59, 'Bánh bông lan phô mai tan chảy', '109000', '89000', '71d257becc.jpg', 1, '2022-06-17', 6, 25, 'Bánh Mì Phô Mai Tan Chảy có lớp vỏ mịn màng, thơm đậm mùi sữa, sốt phô mai béo ngậy, có vị ngọt nhẹ, kết hợp với ruốc (chà bông) mặn đậm đà…hợp nhau đến lạ lùng. Khi tách đôi lớp bánh, phần nhân là sốt phô mai trắng đặc quánh chảy ra sẽ gây ấn tượng mạnh với người thưởng thức ngay từ phần nhìn, chỉ cần cắn nhẹ lớp bánh xốp giòn tan hoà cùng sự mềm mại của lớp phô mai beo béo, thơm lừng sẽ khiến bạn phải suýt xoa', 1, 4),
(60, 'Bánh tart dâu tây', '159000', '139000', '9783cedc52.jpg', 1, '2022-06-17', 6, 13, 'Bánh tart dâu tây có đặc điểm là đế bánh giòn thơm, phần kem mềm mại, mát ngọt nhẹ nhàng quyện với dâu tây chua chua rất dễ ăn nên vô cùng phù hợp cho mùa hè nóng bức', 1, 8),
(61, 'Trà ô long', '28000', '24000', '6dc861f3d9.jpg', 1, '2022-06-17', 5, 11, 'Trà ô long sen nhãn được decor siêu xinh với phần topping hạt sạt đầy ắp và thêm một bánh hoa sen hàu hồng mềm mại. Nếu bạn thuộc team thích béo thì có thể order thêm một lớp macchiato mặn mặn, béo béo thì vị vô cùng thơm bùi luôn.\r\n\r\n\r\n', 1, 3),
(62, 'Nước ép khóm', '69000', '56000', '160eeedc34.jpg', 1, '2022-06-17', 5, 15, 'Dứa là loại trái cây được nhiều người yêu thích. Với hương vị quyến rũ, nước dứa ép chứa nhiều các chất dinh dưỡng tốt cho cơ thể. ', 1, 7),
(63, 'Nước ép dưa hấu', '109000', '82000', '86c9166d7c.jpg', 1, '2022-06-17', 5, 19, 'Uống nước ép dưa hấu giúp tăng cường năng lượng, giảm đường huyết, phòng chống các bệnh mùa hè, cải thiện sức khỏe của mắt, giúp xương chắc khỏe, tốt cho da và tóc…Vì thế, đây là thức uống yêu thích của rất nhiều người, đặc biệt vào mùa hè. ', 1, 17),
(64, 'Bánh', '20000', '15000', '49eacf84f5.jpg', 1, '2022-06-18', 6, 20, 'rất ngon', 1, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `role`
--

INSERT INTO `role` (`id`, `name`) VALUES
(1, 'Admin'),
(2, 'User');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `dob` date NOT NULL,
  `password` varchar(255) NOT NULL,
  `role_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `address` varchar(500) NOT NULL,
  `isConfirmed` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `email`, `fullname`, `dob`, `password`, `role_id`, `status`, `address`, `isConfirmed`) VALUES
(1, 'admin@gmail.com', 'Admin', '2021-11-01', 'e10adc3949ba59abbe56e057f20f883e', 1, 1, '', 1),
(31, 'user1@gmail.com', 'Người Dùng 1', '2021-12-06', 'e10adc3949ba59abbe56e057f20f883e', 2, 1, 'CanTho', 1),
(34, 'admin2@gmail.com', 'admin2', '0000-00-00', 'e10adc3949ba59abbe56e057f20f883e', 1, 1, 'Cần Thơ', 1);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`userId`),
  ADD KEY `product_id` (`productId`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_productid` (`productId`),
  ADD KEY `fk_memberid` (`userid`);

--
-- Chỉ mục cho bảng `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_userid` (`user_id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`userId`);

--
-- Chỉ mục cho bảng `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`orderId`),
  ADD KEY `product_id` (`productId`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cate_id` (`cateId`);

--
-- Chỉ mục cho bảng `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=131;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT cho bảng `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT cho bảng `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `fk_memberid` FOREIGN KEY (`userid`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `fk_productid` FOREIGN KEY (`productId`) REFERENCES `products` (`id`);

--
-- Các ràng buộc cho bảng `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `fk_userid` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`orderId`) REFERENCES `orders` (`id`);

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`cateId`) REFERENCES `categories` (`id`);

--
-- Các ràng buộc cho bảng `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
