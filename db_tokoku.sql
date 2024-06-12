-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 14, 2022 at 09:16 AM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_tokoku`
--

-- --------------------------------------------------------

--
-- Table structure for table `penjual`
--

CREATE TABLE `penjual` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `id_kota` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `penjual`
--

INSERT INTO `penjual` (`id`, `nama`, `id_kota`, `created_at`) VALUES
(1, 'Miss Alicia Volkman', 355, '2022-04-14 04:11:12'),
(2, 'Mikel Hayes', 283, '2022-04-14 04:11:14'),
(3, 'Clair Leffler', 411, '2022-04-14 04:11:15'),
(4, 'Javier Goyette PhD', 414, '2022-04-14 04:11:17'),
(5, 'Mertie Murphy', 72, '2022-04-14 04:11:18'),
(6, 'Trinity DuBuque', 340, '2022-04-14 04:11:20'),
(7, 'Terence Harvey', 75, '2022-04-14 04:11:21'),
(8, 'Alexie Considine', 336, '2022-04-14 04:11:22'),
(9, 'Zackary Jast', 309, '2022-04-14 04:11:24'),
(10, 'Haskell Kutch', 411, '2022-04-14 04:11:26');

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `id` int(11) NOT NULL,
  `id_penjual` int(11) NOT NULL,
  `harga` double NOT NULL COMMENT 'satuan ribu rupiah',
  `berat` double NOT NULL COMMENT 'satuan gram',
  `nama` varchar(100) NOT NULL,
  `gambar` varchar(200) NOT NULL,
  `id_diskon` int(11) DEFAULT NULL,
  `id_promo` int(11) DEFAULT NULL,
  `stok` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `deskripsi` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`id`, `id_penjual`, `harga`, `berat`, `nama`, `gambar`, `id_diskon`, `id_promo`, `stok`, `created_at`, `deskripsi`) VALUES
(1, 10, 109.95, 726, 'Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops', 'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg', NULL, NULL, 196, '2022-04-14 04:14:06', 'Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday'),
(2, 3, 22.3, 753, 'Mens Casual Premium Slim Fit T-Shirts ', 'https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_.jpg', NULL, NULL, 228, '2022-04-14 04:14:07', 'Slim-fitting style, contrast raglan long sleeve, three-button henley placket, light weight & soft fabric for breathable and comfortable wearing. And Solid stitched shirts with round neck made for durability and a great fit for casual fashion wear and diehard baseball fans. The Henley style round neckline includes a three-button placket.'),
(3, 2, 55.99, 422, 'Mens Cotton Jacket', 'https://fakestoreapi.com/img/71li-ujtlUL._AC_UX679_.jpg', NULL, NULL, 138, '2022-04-14 04:14:08', 'great outerwear jackets for Spring/Autumn/Winter, suitable for many occasions, such as working, hiking, camping, mountain/rock climbing, cycling, traveling or other outdoors. Good gift choice for you or your family member. A warm hearted love to Father, husband or son in this thanksgiving or Christmas Day.'),
(4, 9, 15.99, 260, 'Mens Casual Slim Fit', 'https://fakestoreapi.com/img/71YXzeOuslL._AC_UY879_.jpg', NULL, NULL, 190, '2022-04-14 04:14:09', 'The color could be slightly different between on the screen and in practice. / Please note that body builds vary by person, therefore, detailed size information should be reviewed below on the product description.'),
(5, 10, 695, 855, 'John Hardy Women\'s Legends Naga Gold & Silver Dragon Station Chain Bracelet', 'https://fakestoreapi.com/img/71pWzhdJNwL._AC_UL640_QL65_ML3_.jpg', NULL, NULL, 173, '2022-04-14 04:14:10', 'From our Legends Collection, the Naga was inspired by the mythical water dragon that protects the ocean\'s pearl. Wear facing inward to be bestowed with love and abundance, or outward for protection.'),
(6, 1, 168, 762, 'Solid Gold Petite Micropave ', 'https://fakestoreapi.com/img/61sbMiUnoGL._AC_UL640_QL65_ML3_.jpg', NULL, NULL, 241, '2022-04-14 04:14:11', 'Satisfaction Guaranteed. Return or exchange any order within 30 days.Designed and sold by Hafeez Center in the United States. Satisfaction Guaranteed. Return or exchange any order within 30 days.'),
(7, 2, 9.99, 650, 'White Gold Plated Princess', 'https://fakestoreapi.com/img/71YAIFU48IL._AC_UL640_QL65_ML3_.jpg', NULL, NULL, 191, '2022-04-14 04:14:12', 'Classic Created Wedding Engagement Solitaire Diamond Promise Ring for Her. Gifts to spoil your love more for Engagement, Wedding, Anniversary, Valentine\'s Day...'),
(8, 4, 10.99, 394, 'Pierced Owl Rose Gold Plated Stainless Steel Double', 'https://fakestoreapi.com/img/51UDEzMJVpL._AC_UL640_QL65_ML3_.jpg', NULL, NULL, 190, '2022-04-14 04:14:13', 'Rose Gold Plated Double Flared Tunnel Plug Earrings. Made of 316L Stainless Steel'),
(9, 3, 64, 428, 'WD 2TB Elements Portable External Hard Drive - USB 3.0 ', 'https://fakestoreapi.com/img/61IBBVJvSDL._AC_SY879_.jpg', NULL, NULL, 175, '2022-04-14 04:14:14', 'USB 3.0 and USB 2.0 Compatibility Fast data transfers Improve PC Performance High Capacity; Compatibility Formatted NTFS for Windows 10, Windows 8.1, Windows 7; Reformatting may be required for other operating systems; Compatibility may vary depending on user’s hardware configuration and operating system'),
(10, 9, 109, 705, 'SanDisk SSD PLUS 1TB Internal SSD - SATA III 6 Gb/s', 'https://fakestoreapi.com/img/61U7T1koQqL._AC_SX679_.jpg', NULL, NULL, 152, '2022-04-14 04:14:15', 'Easy upgrade for faster boot up, shutdown, application load and response (As compared to 5400 RPM SATA 2.5” hard drive; Based on published specifications and internal benchmarking tests using PCMark vantage scores) Boosts burst write performance, making it ideal for typical PC workloads The perfect balance of performance and reliability Read/write speeds of up to 535MB/s/450MB/s (Based on internal testing; Performance may vary depending upon drive capacity, host device, OS and application.)'),
(11, 10, 109, 998, 'Silicon Power 256GB SSD 3D NAND A55 SLC Cache Performance Boost SATA III 2.5', 'https://fakestoreapi.com/img/71kWymZ+c+L._AC_SX679_.jpg', NULL, NULL, 156, '2022-04-14 04:14:16', '3D NAND flash are applied to deliver high transfer speeds Remarkable transfer speeds that enable faster bootup and improved overall system performance. The advanced SLC Cache Technology allows performance boost and longer lifespan 7mm slim design suitable for Ultrabooks and Ultra-slim notebooks. Supports TRIM command, Garbage Collection technology, RAID, and ECC (Error Checking & Correction) to provide the optimized performance and enhanced reliability.'),
(12, 1, 114, 480, 'WD 4TB Gaming Drive Works with Playstation 4 Portable External Hard Drive', 'https://fakestoreapi.com/img/61mtL65D4cL._AC_SX679_.jpg', NULL, NULL, 99, '2022-04-14 04:14:17', 'Expand your PS4 gaming experience, Play anywhere Fast and easy, setup Sleek design with high capacity, 3-year manufacturer\'s limited warranty'),
(13, 5, 599, 448, 'Acer SB220Q bi 21.5 inches Full HD (1920 x 1080) IPS Ultra-Thin', 'https://fakestoreapi.com/img/81QpkIctqPL._AC_SX679_.jpg', NULL, NULL, 218, '2022-04-14 04:14:18', '21. 5 inches Full HD (1920 x 1080) widescreen IPS display And Radeon free Sync technology. No compatibility for VESA Mount Refresh Rate: 75Hz - Using HDMI port Zero-frame design | ultra-thin | 4ms response time | IPS panel Aspect ratio - 16: 9. Color Supported - 16. 7 million colors. Brightness - 250 nit Tilt angle -5 degree to 15 degree. Horizontal viewing angle-178 degree. Vertical viewing angle-178 degree 75 hertz'),
(14, 8, 999.99, 163, 'Samsung 49-Inch CHG90 144Hz Curved Gaming Monitor (LC49HG90DMNXZA) – Super Ultrawide Screen QLED ', 'https://fakestoreapi.com/img/81Zt42ioCgL._AC_SX679_.jpg', NULL, NULL, 57, '2022-04-14 04:14:19', '49 INCH SUPER ULTRAWIDE 32:9 CURVED GAMING MONITOR with dual 27 inch screen side by side QUANTUM DOT (QLED) TECHNOLOGY, HDR support and factory calibration provides stunningly realistic and accurate color and contrast 144HZ HIGH REFRESH RATE and 1ms ultra fast response time work to eliminate motion blur, ghosting, and reduce input lag'),
(15, 10, 56.99, 978, 'BIYLACLESEN Women\'s 3-in-1 Snowboard Jacket Winter Coats', 'https://fakestoreapi.com/img/51Y5NI-I5jL._AC_UX679_.jpg', NULL, NULL, 250, '2022-04-14 04:14:20', 'Note:The Jackets is US standard size, Please choose size as your usual wear Material: 100% Polyester; Detachable Liner Fabric: Warm Fleece. Detachable Functional Liner: Skin Friendly, Lightweigt and Warm.Stand Collar Liner jacket, keep you warm in cold weather. Zippered Pockets: 2 Zippered Hand Pockets, 2 Zippered Pockets on Chest (enough to keep cards or keys)and 1 Hidden Pocket Inside.Zippered Hand Pockets and Hidden Pocket keep your things secure. Humanized Design: Adjustable and Detachable Hood and Adjustable cuff to prevent the wind and water,for a comfortable fit. 3 in 1 Detachable Design provide more convenience, you can separate the coat and inner as needed, or wear it together. It is suitable for different season and help you adapt to different climates'),
(16, 3, 29.95, 266, 'Lock and Love Women\'s Removable Hooded Faux Leather Moto Biker Jacket', 'https://fakestoreapi.com/img/81XH0e8fefL._AC_UY879_.jpg', NULL, NULL, 133, '2022-04-14 04:14:21', '100% POLYURETHANE(shell) 100% POLYESTER(lining) 75% POLYESTER 25% COTTON (SWEATER), Faux leather material for style and comfort / 2 pockets of front, 2-For-One Hooded denim style faux leather jacket, Button detail on waist / Detail stitching at sides, HAND WASH ONLY / DO NOT BLEACH / LINE DRY / DO NOT IRON'),
(17, 1, 39.99, 834, 'Rain Jacket Women Windbreaker Striped Climbing Raincoats', 'https://fakestoreapi.com/img/71HblAHs5xL._AC_UY879_-2.jpg', NULL, NULL, 76, '2022-04-14 04:14:22', 'Lightweight perfet for trip or casual wear---Long sleeve with hooded, adjustable drawstring waist design. Button and zipper front closure raincoat, fully stripes Lined and The Raincoat has 2 side pockets are a good size to hold all kinds of things, it covers the hips, and the hood is generous but doesn\'t overdo it.Attached Cotton Lined Hood with Adjustable Drawstrings give it a real styled look.'),
(18, 4, 9.85, 350, 'MBJ Women\'s Solid Short Sleeve Boat Neck V ', 'https://fakestoreapi.com/img/71z3kpMAYsL._AC_UY879_.jpg', NULL, NULL, 216, '2022-04-14 04:14:23', '95% RAYON 5% SPANDEX, Made in USA or Imported, Do Not Bleach, Lightweight fabric with great stretch for comfort, Ribbed on sleeves and neckline / Double stitching on bottom hem'),
(19, 5, 7.95, 360, 'Opna Women\'s Short Sleeve Moisture', 'https://fakestoreapi.com/img/51eg55uWmdL._AC_UX679_.jpg', NULL, NULL, 171, '2022-04-14 04:14:24', '100% Polyester, Machine wash, 100% cationic polyester interlock, Machine Wash & Pre Shrunk for a Great Fit, Lightweight, roomy and highly breathable with moisture wicking fabric which helps to keep moisture away, Soft Lightweight Fabric with comfortable V-neck collar and a slimmer fit, delivers a sleek, more feminine silhouette and Added Comfort');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `penjual`
--
ALTER TABLE `penjual`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `penjual`
--
ALTER TABLE `penjual`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
