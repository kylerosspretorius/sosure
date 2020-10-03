-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Oct 03, 2020 at 08:42 PM
-- Server version: 5.7.31
-- PHP Version: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sosure`
--
CREATE DATABASE IF NOT EXISTS `sosure` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `sosure`;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `default_landing` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `default_landing`, `created_at`, `updated_at`) VALUES
(1, 'user', 'userPage.php', '2020-10-03 14:58:02', '2020-10-03 14:58:02'),
(2, 'admin', 'adminPage.php', '2020-10-03 14:58:02', '2020-10-03 14:58:02'),
(3, 'superadmin', 'superadminPage.php', '2020-10-03 14:58:32', '2020-10-03 14:58:32');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `display_name` varchar(200) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role_id` int(50) NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `display_name`, `username`, `password`, `role_id`, `created_at`, `updated_at`) VALUES
(1, 'Ben', 'ben', '$2y$10$4gOI.rNBqhPCGQ5ExXoK.uT1ZH4u.0NDIN2KBPgsyLMnbwPEOFFGO', 1, '2020-10-03 14:59:33', '2020-10-03 14:59:33'),
(2, 'Ed', 'ed', '$2y$10$2tOIc2Q.jIyuDZ7xh3tzy.uE2AbNGpPmYBg4WRqfVKZ2KiLcwyRCC', 3, '2020-10-03 14:59:33', '2020-10-03 14:59:33'),
(3, 'Matt', 'matt', '$2y$10$ScT1N4ym2ejMqqoh.1TClOSRdWd5RewDv5sI39Fh1MVkZsv1TKD8C', 2, '2020-10-03 15:00:16', '2020-10-03 15:00:16'),
(4, 'Simon', 'simon', '$2y$10$hRbo25IT6ygVels/EV/ob.FDPu4TnCR6STYLZqBL2/JWoFlKmiD36', 1, '2020-10-03 15:00:16', '2020-10-03 15:00:16'),
(5, 'Geoff', 'geoff', '$2y$10$u4VfCWW.ZdoZI6bLPVeSnO0vb6jc44asgnJAanoPxkKOUm1FT8zEO', 2, '2020-10-03 15:00:33', '2020-10-03 15:00:33');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
