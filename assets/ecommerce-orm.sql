-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 01, 2024 at 10:37 AM
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
-- Database: `ecommerce-orm`
--

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` int(11) NOT NULL,
  `item_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `item_id`, `user_id`, `qty`, `createdAt`, `updatedAt`) VALUES
(1, 6, 2, 2, '2024-02-01 08:54:42', '2024-02-01 08:46:10'),
(2, 2, 2, 1, '2024-02-01 08:27:26', '2024-02-01 08:27:26'),
(3, 2, 2, 1, '2024-02-01 08:28:29', '2024-02-01 08:28:29'),
(4, 1, 3, 1, '2024-02-01 08:30:40', '2024-02-01 08:30:40'),
(5, 5, 2, 8, '2024-02-01 08:33:33', '2024-02-01 08:33:33'),
(6, 7, 3, 1, '2024-02-01 08:33:53', '2024-02-01 08:33:53');

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `author_id` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `name`, `price`, `stock`, `author_id`, `createdAt`, `updatedAt`) VALUES
(1, 'Vivo Z1 Pro', 4000000, 3, 1, '2024-02-01 04:08:49', '2024-02-01 04:08:49'),
(2, 'Iphone 11 Black', 7000000, 12, 1, '2024-02-01 04:09:58', '2024-02-01 04:09:58'),
(3, 'Iphone 12 Purple', 9000000, 10, 1, '2024-02-01 04:12:48', '2024-02-01 04:12:48'),
(4, 'Iphone 13 Green', 12000000, 2, 1, '2024-02-01 04:13:40', '2024-02-01 04:13:40'),
(5, 'Iphone 14 Blue', 13000000, 19, 1, '2024-02-01 04:34:07', '2024-02-01 04:34:07'),
(6, 'Iphone 15 Black', 16000000, 1, 1, '2024-02-01 04:34:22', '2024-02-01 07:28:51'),
(7, 'Iphone 14 Blue', 13000000, 19, 1, '2024-02-01 04:34:46', '2024-02-01 04:34:46');

-- --------------------------------------------------------

--
-- Table structure for table `sequelizemeta`
--

CREATE TABLE `sequelizemeta` (
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sequelizemeta`
--

INSERT INTO `sequelizemeta` (`name`) VALUES
('20240201023108-create-user.js'),
('20240201023431-create-item.js'),
('20240201023528-create-cart.js');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `username`, `address`, `phone`, `role`, `createdAt`, `updatedAt`) VALUES
(1, 'raihanworks461@gmail.com', 'RaihanPutro040601', 'raihanptro', 'Jl. Cipedak Raya', '085156637952', 'admin', '2024-02-01 03:28:49', '2024-02-01 03:28:49'),
(2, 'farras@gmail.com', 'farras123', 'farras11', 'Jl. Kemuning', '083352518362', 'customer', '2024-02-01 03:29:47', '2024-02-01 03:29:47'),
(3, 'fahmi@gmail.com', 'fahmi123', 'fahmi12', 'Jl. Bambu Apus', '083416517962', 'customer', '2024-02-01 03:30:18', '2024-02-01 03:42:48');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sequelizemeta`
--
ALTER TABLE `sequelizemeta`
  ADD PRIMARY KEY (`name`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
