-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 06, 2025 at 10:11 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `waterstation`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `confirmPassword` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `username`, `email`, `password`, `confirmPassword`) VALUES
(1, 'admin', 'admin@gmail.com', '123', '123'),
(2, 'cyrus', 'cyrus@gmail.com', '123', '123\r\n'),
(3, 'joniel', 'joniel@gmail.com', '123', '123'),
(4, 'admin1', 'admin1@gmail.com', '$2y$10$voOWcRsbJYhWIsPgB.K0SuSuJqW/euBoqZH56EA3YOFtDDU1A5edu', '');

-- --------------------------------------------------------

--
-- Table structure for table `buyer`
--

CREATE TABLE `buyer` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `confirmPassword` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `buyer`
--

INSERT INTO `buyer` (`id`, `username`, `email`, `password`, `confirmPassword`) VALUES
(1, 'buyer', 'buyer@gmail.com', '$2y$10$Ff7zUcO0/cYtKix06qaqK.ayCHyXlSItzKL9AhBD.57KwJ5443kwa', ''),
(2, 'Trif', 'Trif@gmail.com', '$2y$10$6XaVIHI6okn0Uqdqo5Gc/e2MRP3SFAM2U9xVKRb/xEbAzi.n9T3wa', ''),
(3, 'Buyer123', 'buyer123@gmail.com', '$2y$10$5sWx755tcnPnZIljgCYUYu0.Zp5gfA1IFFlullJfGLIKles6G8ani', '');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `buyer_id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `users_name` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL,
  `info` text DEFAULT NULL,
  `profilePic` varchar(255) DEFAULT NULL,
  `amount` bigint(20) NOT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `method` enum('delivery','pickUp') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `discount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `address` varchar(255) NOT NULL,
  `contact` varchar(50) DEFAULT NULL,
  `delivery_message` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `buyer_id`, `seller_id`, `users_name`, `email`, `info`, `profilePic`, `amount`, `total`, `method`, `created_at`, `discount`, `address`, `contact`, `delivery_message`) VALUES
(86, 1, 15, 'Joniel', 'joniel@gmail.com', 'Nindot ni bred', '672c01e9bdb6e.png', 5, 49.00, 'delivery', '2024-11-06 23:56:29', 2.00, 'Sambag 2', NULL, NULL),
(127, 1, 4, 'Buyer123', 'Seller123@gmail.com', 'Clean Water', '6734512fb695d.jpg', 15, 374.00, 'delivery', '2024-11-13 07:16:55', 2.00, 'Panagdait Kasambagan', '932', NULL),
(128, 1, 4, 'Buyer123', 'Seller123@gmail.com', 'Clean Water', '6734512fb695d.jpg', 20, 499.00, 'delivery', '2024-11-13 07:27:37', 2.00, 'Leon Kilat St.', '932', NULL),
(129, 1, 13, 'Buyer123', 'Cha@gmail.com', 'NIndot ni nga water', '672881aaa4360.png', 20, 401.00, 'delivery', '2024-11-13 07:29:46', 2.00, 'Panagdait Kasambagan', '9327894856', NULL),
(130, 1, 22, 'Buyer123', 'Seller123@gmail.com', 'Clean Water', '673455dc705be.jpg', 5, 124.00, 'pickUp', '2024-11-13 07:32:13', 2.00, 'Leon Kilat St.', '932', NULL),
(133, 1, 22, 'Cute', 'Seller123@gmail.com', 'Clean Water', '673455dc705be.jpg', 5, 124.00, 'delivery', '2024-11-13 07:40:31', 2.00, 'Leon Kilat St.', '932', NULL),
(134, 1, 22, 'Jake', 'Seller123@gmail.com', 'Clean Water', '673455dc705be.jpg', 50, 1249.00, 'delivery', '2024-11-14 02:57:10', 2.00, 'Consolacion', '932', NULL),
(135, 1, 23, 'Cyrus', 'JonJon@gmail.com', 'Healthy Water!', '67356a13d00e4.jpg', 5, 75.00, 'delivery', '2024-11-14 03:11:44', 2.00, 'Panagdait Kasambagan', '932', 'Your Order Will be deliver in 4 pm'),
(136, 1, 23, 'jONIEL', 'JonJon@gmail.com', 'Healthy Water!', '67356a13d00e4.jpg', 45, 675.00, 'pickUp', '2024-11-14 04:20:10', 2.00, 'Sambag 2', '932', 'your order will arive at 5 pm\\r\\n'),
(137, 1, 23, 'Joniel Gesta', 'JonJon@gmail.com', 'Healthy Water!', '67356a13d00e4.jpg', 10, 150.00, 'delivery', '2024-11-14 04:24:37', 2.00, 'Sambag 2', '932', NULL),
(138, 1, 4, 'Joniel Gesta', 'Appare@gmail.com', 'Barata na! Lami Pa!', '67357c7a42b60.jpg', 5, 75.00, 'delivery', '2024-11-14 04:30:38', 2.00, 'Sambag 2', '932', NULL),
(139, 1, 4, 'Joniel', 'Appare@gmail.com', 'Barata na! Lami Pa!', '67357c7a42b60.jpg', 5, 75.00, 'delivery', '2024-11-14 04:33:37', 2.00, 'Laray', '932', NULL),
(140, 1, 23, 'Joniel Gesta', 'JonJon@gmail.com', 'Healthy Water!', '67356a13d00e4.jpg', 1, 15.00, 'delivery', '2024-11-14 06:07:11', 2.00, 'Sambag 2', '932', 'your order will arrive at 4 pm');

-- --------------------------------------------------------

--
-- Table structure for table `profileseller`
--

CREATE TABLE `profileseller` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `profile` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `profileseller`
--

INSERT INTO `profileseller` (`id`, `name`, `email`, `contact`, `address`, `profile`) VALUES
(1, 'Chandria Ranque', 'cyrusranque.cr@gmail.com', '0932 5644 7894', '943 Panagdait Kasambagan Cebu City', '672f0bdf6b74d.png');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` int(11) NOT NULL,
  `shop_id` int(11) NOT NULL,
  `review_text` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `shop_id`, `review_text`, `created_at`) VALUES
(57, 26, 'Nindot inyo water', '2024-11-13 07:32:57'),
(58, 26, 'Nindot inyo water', '2024-11-13 07:33:22'),
(59, 2, 'Last time it is very goods', '2024-11-14 04:12:36');

-- --------------------------------------------------------

--
-- Table structure for table `seller`
--

CREATE TABLE `seller` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `confirmPassword` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `seller`
--

INSERT INTO `seller` (`id`, `username`, `email`, `password`, `confirmPassword`) VALUES
(1, 'cuteko ', 'cuteko@gmail.com', '$2y$10$OXYU/t4h1JBvdOB83II7luro2ZZDyFmW4cbiHvxI5ZQSFNxGU3HNi', ''),
(2, 'akoni', 'akoni@gmail.com', '$2y$10$fJqmBIhZs7A0hXsrHZZVh.Zjisc3KumpM72r0Oo95r3GWeMSFMN3C', ''),
(3, 'cyrus', 'cyrus@gmail.com', '$2y$10$9Zw2UiiC825UJIdPH6oJfeuRdvfYtRywknASEVILlu.OfEwtta5CO', ''),
(4, 'SDAFA', 'nkjns=@gmail.com', '$2y$10$bDExh3Uw/6TPOsTTJHMZE.kuNt.Sh69MsI.Coao.6f5X1FXI9g42K', ''),
(5, 'asfm', 'lklnoihn@gmail.com', '$2y$10$V8MkbIujLkttOrYb7Jz7OO0kpdaiH0UwMTmiRwBv73OeQgB6i.9wa', ''),
(6, 'asf', 'nlkn@gmai.com', '$2y$10$dQaaC9RTZFuh8Rlnnnjj3etQbSbmopYj8jpIDsXG6pzWE549VdQRW', ''),
(7, 'sfjansnk', 'soinoi@gmail.com', '$2y$10$5n4WaJ5QpUdYzrAD8K0rz.ZnK4pJDs2YBjPcYa8ROsKnwSHrLvNEK', ''),
(8, 'seller', 'seller@gmail.com', '$2y$10$NcaxF7kSw/MfQEJR4VM2aONh00So6KTtniVaohznmWdAdW5TkAgVW', ''),
(9, 'cute', 'cute@gmail.com', '$2y$10$1MatYp2/TsB.d1FtELzjK.lGyup4c1.G1DBarAUYjJY73EAZZfUn.', ''),
(10, 'CyrusRanque', 'CyrusRanque@gmail.com', '$2y$10$ORDPxVQr5dNLH2SsJDoime0XZmlV9e3y8gUIF4MoyzCcIFWIINYWu', ''),
(11, 'ambot', 'ambot@gmail.com', '$2y$10$wtGtz2JsYVXybS4khtrRduTauzzxjDcOzYZkSg/MG2brJ5seCf5ES', ''),
(12, 'try', 'try@gmail.com', '$2y$10$Ju6y3A0kDwu3YxqIOGHUGei875Cg2V48u0owEUfc/PnoYa7eei8sq', ''),
(13, 'Cha', 'cha@gmail.com', '$2y$10$TjXyT5BbClZkL8RAph5FT.jvkE6rYLQPMSPGLZlJEigGoumzl4xES', ''),
(14, 'admin1', 'admin1@gmail.com', '$2y$10$4.islO0d6Be2ud4TL7k8cubgjKyPiLyUgbghvJ6aZUPaqqX.IZCuO', ''),
(15, 'Jon', 'Jon@gmail.com', '$2y$10$4YJxe4E8jLug7bHK97TuAu90yVqn9rC3j3X4AUz3GCfdKyes4auCW', ''),
(16, 'Okee', 'Okee@gmail.com', '$2y$10$p0YDgwAZQC/9NG2BiO3BB.jc8ZBWOPEX1OyJERxyWsKX38nSATzHC', ''),
(17, 'Nindot', 'Nindot@gmail.com', '$2y$10$ALpfzqqVoG6nkU4D3ezqVu/xg8riBKoJ/30Z4wNiKf5ahfOhoJsYq', ''),
(18, 'Toto', 'Toto@gmail.com', '$2y$10$esgsDd3ObfF6I36dk7HpKuHhizaJpSk4rh1NF3zGqaOxhWZ9ky6uq', ''),
(19, 'Romero', 'Romero@gmai.com', '$2y$10$MArs.ruTm49XaS3lhmRa..OFyvC2yT2PbavQGKz/tX5l3DVMkOMpO', ''),
(20, 'Joniel', 'joniel@gmail.com', '$2y$10$Wcu10a65ZPvkpOr9if28pOtIfNUVqSCQ8/2qraSTqMCDY0RkbKF7m', ''),
(21, 'Seller123', 'Seller123@gmail.com', '$2y$10$Xjr3dj8oFKRjKqRlkpNLWeL9KRGg55DyJh5VZ4qh8uPy6XFWdmIOq', ''),
(22, 'Seller456', 'Seller456@gmail.com', '$2y$10$OqYVRpqjyQ7UbZ9/6P3Lzenqs.SSQzZRyYNuWuFotV7oQeIIh.Va2', ''),
(23, 'JonJon', 'JonJon@gmail.com', '$2y$10$i1eIH5rSlcU7Vkf4A7.5H.CXyoOwzsh.bLnRkZLxORO4rumYXoMe6', ''),
(24, 'Appare', 'Appare@gmail.com', '$2y$10$5rs0A3VaFSflMxt9NAWIauGa7vP265hvi8bhEolMjAMQjD3kqlyse', ''),
(25, 'Neri', 'Neri@gmail.com', '$2y$10$SwUMq1HTP2n2d.uowa3wRezCD1oB065R1GzGJbS7AuqnNSC4QVqfq', ''),
(26, 'andriee', 'andriee@gmail.com', '$2y$10$fHHRomkSXhjuSqOaHKO2iefwlzF1JdtHJPK7DQJ9T60qoGME.hIoq', '');

-- --------------------------------------------------------

--
-- Table structure for table `seller_profiles`
--

CREATE TABLE `seller_profiles` (
  `user_id` int(11) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `contact` varchar(15) DEFAULT NULL,
  `telephone` varchar(15) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `image_path` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `seller_profiles`
--

INSERT INTO `seller_profiles` (`user_id`, `full_name`, `email`, `contact`, `telephone`, `address`, `image_path`) VALUES
(18, 'Toto', 'Toto@gmail.com', '456123', '465123', 'Casals Village', 'Images/Thirstdrop (2).png'),
(3, 'Jon', 'buyer123@gmail.com', '0932 789 4562', '093258453 ', 'Sambag 2', 'Images/423161973_2187933094912920_8709449496584103728_n.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `shopinfo`
--

CREATE TABLE `shopinfo` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `profilePic` varchar(100) NOT NULL,
  `permit` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `contact` varchar(15) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `discount` decimal(10,2) NOT NULL,
  `deliveryFee` decimal(10,2) NOT NULL,
  `info` varchar(255) NOT NULL,
  `status` enum('pending','approved','rejected') DEFAULT 'pending',
  `notification` varchar(255) DEFAULT NULL,
  `seller_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `shopinfo`
--

INSERT INTO `shopinfo` (`id`, `name`, `profilePic`, `permit`, `address`, `email`, `contact`, `price`, `discount`, `deliveryFee`, `info`, `status`, `notification`, `seller_id`) VALUES
(2, 'afas', 'Cute.jpg', '6722e63b208c9.png', 'asdf', 'afsa@gmail.com', '54', 2351.00, 5131.00, 2051.00, 'sfaf', 'approved', NULL, NULL),
(4, 'afasf', '672438f7f0f56.png', '672438f7f1278.png', 'jbib', 'biuasbf@gmail.com', '4561', 86451.00, 8645213.00, 6523.00, 'dgsdbsida', 'rejected', NULL, NULL),
(5, 'sfasd', '67244069d1a0b.png', '67244069d1c8d.png', 'nlnsdlfn', 'maytaokayna@gmail.com', '23156132', 5623052.00, 56123.00, 56123.00, 'sdgas', 'approved', NULL, NULL),
(6, 'dfg', '672440a709d89.png', '672440a70a045.png', 'kjbjgd', 'dsgl@gmail.com', '4521', 4521.00, 4512.00, 4512.00, 'aga', 'approved', NULL, NULL),
(7, 'cgena', '672443403a0b4.png', '672443403a3eb.png', 'cgenaba', 'cgenaeyyy@gmail.com', '984651230', 8465123.00, 84652.00, 86532.00, 'gaihsd', 'pending', NULL, NULL),
(8, 'cgena', '6724436bb9aea.png', '6724436bb9f65.png', 'cgenaba', 'cgenaeyyy@gmail.com', '984651230', 8465123.00, 84652.00, 86532.00, 'gaihsd', 'pending', NULL, NULL),
(9, 'cgena', '672443a843e78.png', '672443a8442fd.png', 'cgenaba', 'cgenaeyyy@gmail.com', '984651230', 8465123.00, 84652.00, 86532.00, 'gaihsd', 'approved', NULL, NULL),
(10, 'akkoni', '6724495f69db5.png', '6724495f6a108.png', 'akoni', 'akoniakoani@gmail.con', '4521', 512.00, 512.00, 5123.00, 'awfsdsv', 'approved', NULL, NULL),
(11, 'asfn', '67244ac275f60.png', '67244ac2763af.png', 'lknslkf', 'lknlksfd@gmail.com', '4521', 4521.00, 45210.00, 4521.00, 'sfd', 'approved', NULL, NULL),
(12, 'nf', '67244ea22f330.png', '67244ea22f6c1.png', 'sdgfkl', 'oinhdisgfoi@gmail.com', '4512', 456123.00, 54213.00, 5213.00, 'aergsfd', 'approved', NULL, 8),
(13, 'Sa Mga Cute', '6725944be67ee.jpg', '6725944be6b45.jpg', '943 Panagdait Kasambagan Cebu City', 'CyrusRanque@gmail.com', '9355359875', 20.00, 25.00, 2.00, 'Fresh Drinking Waterr', 'approved', NULL, 10),
(14, 'ambot', '67273a860bf20.jpg', '67273a860c13b.png', 'ambot', 'ambot@gmail.com', '9225647895', 10.00, 1.00, 5.00, 'nindot ni', 'rejected', NULL, NULL),
(15, 'vjv', '67273bc6d00d8.png', '67273bc6d02ef.jpg', 'bk', 'ambot@gmail.com', '9225647895', 512.00, 231.00, 23.00, 'sfda', 'rejected', NULL, NULL),
(16, 'bhsdncm', '67273c3c31dbb.png', '67273c3c31fd4.jpg', 'lkmnsv,c', 'asdfn@gmail.com', '532', 12.00, 21.00, 231.00, 'fdscnm', 'approved', NULL, 11),
(19, 'af', '67273e79cf8e4.png', '67273e79cfb99.jpg', 'jkn', 'mfads@gmail.com', '4532145', 21.00, 12.00, 21.00, 'jksm', 'rejected', NULL, NULL),
(20, 'njk', '67273ede8fa24.jpg', '67273ede8fc74.png', 'nj', 'jkajfjns@gmail.com', '562384631', 32.00, 3151.00, 1.00, 'jksm', 'rejected', NULL, 12),
(21, 'bnm', '672749033fe44.png', '6727490340215.jpg', 'jlkn', 'san@gmail.com', '54656231', 54.00, 5.00, 5.00, 'gas', 'rejected', NULL, 12),
(22, 'Cha', '672881aaa4360.png', '672881aaa46cf.jpg', 'Panagdait Kasambagan', 'Cha@gmail.com', '9327894856', 20.00, 2.00, 3.00, 'NIndot ni nga water', 'approved', NULL, 13),
(23, 'Joniel', '672c01e9bdb6e.png', '672c01e9bdf21.png', 'Sambag 2', 'joniel@gmail.com', '932', 10.00, 2.00, 1.00, 'Nindot ni bred', 'approved', NULL, 15),
(26, 'Seller456', '673455dc705be.jpg', '673455dc7095f.png', 'Leon Kilat St.', 'Seller123@gmail.com', '932', 25.00, 2.00, 1.00, 'Clean Water', 'approved', NULL, 22);

-- --------------------------------------------------------

--
-- Table structure for table `status_logs`
--

CREATE TABLE `status_logs` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `status` varchar(50) NOT NULL,
  `changed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `status_logs`
--

INSERT INTO `status_logs` (`id`, `employee_id`, `status`, `changed_at`) VALUES
(1, 27, 'Available', '2024-11-06 09:15:30'),
(2, 26, 'Available', '2024-11-06 09:15:55'),
(3, 27, 'Not Available', '2024-11-06 09:16:37'),
(4, 27, 'Not Available', '2024-11-06 09:16:55'),
(5, 27, 'Available', '2024-11-06 09:19:57'),
(6, 26, 'Not Available', '2024-11-06 09:20:02'),
(7, 27, 'Available', '2024-11-06 09:20:36'),
(8, 27, 'Available', '2024-11-06 09:20:38'),
(9, 27, 'Not Available', '2024-11-06 09:20:39'),
(10, 27, 'Available', '2024-11-06 09:27:01'),
(11, 27, 'Not Available', '2024-11-06 09:27:05'),
(12, 27, 'Available', '2024-11-06 12:16:39'),
(13, 27, 'Available', '2024-11-06 13:00:37'),
(14, 27, 'Not Available', '2024-11-06 13:00:38'),
(15, 27, 'Available', '2024-11-06 13:00:39'),
(16, 26, 'Available', '2024-11-06 13:00:40'),
(17, 27, 'Not Available', '2024-11-06 23:45:44'),
(18, 27, 'Available', '2024-11-06 23:45:56'),
(19, 26, 'Available', '2024-11-09 04:49:21'),
(20, 26, 'Not Available', '2024-11-09 04:49:22'),
(21, 26, 'Available', '2024-11-09 04:49:24'),
(22, 26, 'Not Available', '2024-11-09 04:58:28'),
(23, 26, 'Available', '2024-11-09 04:58:30'),
(24, 27, 'Available', '2024-11-09 10:02:58'),
(25, 27, 'Not Available', '2024-11-09 10:03:01'),
(26, 27, 'Available', '2024-11-09 10:03:03'),
(27, 27, 'Not Available', '2024-11-09 10:03:05'),
(28, 27, 'Available', '2024-11-09 10:03:06'),
(29, 27, 'Not Available', '2024-11-09 10:05:13'),
(30, 27, 'Available', '2024-11-09 10:05:14'),
(31, 27, 'Not Available', '2024-11-09 10:05:16'),
(32, 27, 'Available', '2024-11-09 10:05:17'),
(33, 27, 'Not Available', '2024-11-09 10:37:11'),
(34, 27, 'Available', '2024-11-09 10:37:13'),
(35, 26, 'Not Available', '2024-11-09 13:02:10'),
(36, 27, 'Available', '2024-11-09 13:02:13'),
(37, 27, 'Not Available', '2024-11-09 13:02:14'),
(38, 27, 'Available', '2024-11-09 13:02:15'),
(39, 26, 'Not Available', '2024-11-09 13:02:17'),
(40, 27, 'Available', '2024-11-09 13:02:18'),
(41, 27, 'Not Available', '2024-11-09 13:02:19'),
(42, 27, 'Not Available', '2024-11-09 13:02:34'),
(43, 27, 'Available', '2024-11-09 13:02:35'),
(44, 27, 'Not Available', '2024-11-10 06:14:06'),
(45, 27, 'Available', '2024-11-10 06:14:08'),
(46, 27, 'Available', '2024-11-10 06:48:52'),
(47, 27, 'Not Available', '2024-11-10 06:48:53'),
(48, 27, 'Available', '2024-11-12 00:50:15'),
(49, 41, 'Available', '2024-11-13 07:16:38'),
(50, 42, 'Available', '2024-11-14 06:10:10');

-- --------------------------------------------------------

--
-- Table structure for table `tb_upload`
--

CREATE TABLE `tb_upload` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `image` varchar(60) NOT NULL,
  `info` varchar(500) NOT NULL,
  `availability_status` varchar(50) DEFAULT 'Not Available'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tb_upload`
--

INSERT INTO `tb_upload` (`id`, `name`, `image`, `info`, `availability_status`) VALUES
(26, 'Trif', '6720b09d5c5be.jpg', 'Hala!', 'Not Available'),
(27, 'First System', 'screenshot-1730337156418.png', 'Okay ra kay mas better', 'Available'),
(41, 'Cyrus ni', '6734524e2dca0.jpg', 'Cute kaayo ni sya', 'Available'),
(42, 'andrie romero', '673593f21b359.jpg', 'Gwapo ni sya bataa', 'Available');

-- --------------------------------------------------------

--
-- Table structure for table `user_profiles`
--

CREATE TABLE `user_profiles` (
  `id` int(11) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `contact` varchar(15) NOT NULL,
  `address` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `image_path` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `user_profiles`
--

INSERT INTO `user_profiles` (`id`, `full_name`, `email`, `contact`, `address`, `user_id`, `image_path`) VALUES
(0, 'Trif', 'Trif@gmail.com', '4523', 'Sindolan', 2, 'Images/Thirstdrop (2).png'),
(0, 'Joniel Gesta', 'buyer123@gmail.com', '0921210681', 'Sambag 2', 3, 'Images/423161973_2187933094912920_8709449496584103728_n.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `buyer`
--
ALTER TABLE `buyer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `profileseller`
--
ALTER TABLE `profileseller`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shop_id` (`shop_id`);

--
-- Indexes for table `seller`
--
ALTER TABLE `seller`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shopinfo`
--
ALTER TABLE `shopinfo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_seller` (`seller_id`);

--
-- Indexes for table `status_logs`
--
ALTER TABLE `status_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Indexes for table `tb_upload`
--
ALTER TABLE `tb_upload`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `buyer`
--
ALTER TABLE `buyer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=143;

--
-- AUTO_INCREMENT for table `profileseller`
--
ALTER TABLE `profileseller`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `seller`
--
ALTER TABLE `seller`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `shopinfo`
--
ALTER TABLE `shopinfo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `status_logs`
--
ALTER TABLE `status_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `tb_upload`
--
ALTER TABLE `tb_upload`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`shop_id`) REFERENCES `shopinfo` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `shopinfo`
--
ALTER TABLE `shopinfo`
  ADD CONSTRAINT `fk_seller` FOREIGN KEY (`seller_id`) REFERENCES `seller` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `status_logs`
--
ALTER TABLE `status_logs`
  ADD CONSTRAINT `status_logs_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `tb_upload` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
