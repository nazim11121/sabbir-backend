-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Sep 04, 2025 at 11:17 AM
-- Server version: 9.1.0
-- PHP Version: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `creed`
--

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

DROP TABLE IF EXISTS `packages`;
CREATE TABLE IF NOT EXISTS `packages` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` bigint UNSIGNED DEFAULT NULL COMMENT 'Foreign key referencing the id in the categories table',
  `price` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remarks` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=Active, 0=Inactive',
  `created_by` bigint UNSIGNED DEFAULT NULL COMMENT 'Stores the ID of the user who created the record',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Stores the creation time of the record',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Stores the last update time of the record',
  PRIMARY KEY (`id`),
  KEY `packages_category_id_foreign` (`category_id`),
  KEY `packages_created_by_foreign` (`created_by`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`id`, `name`, `category_id`, `price`, `image`, `remarks`, `status`, `created_by`, `created_at`, `updated_at`) VALUES
(2, 'Trusted Company Investment', 1, NULL, 'images/service/1756530595_68b287a3130bb.jpg', NULL, 1, 1, '2025-08-29 23:09:55', '2025-08-29 23:09:55'),
(3, 'Get Company Loan and Start Trading', 1, NULL, 'images/service/1756530708_68b2881480247.jpg', NULL, 1, 1, '2025-08-29 23:11:48', '2025-08-29 23:11:48'),
(4, 'Trusted Company Investment', 1, NULL, 'images/service/1756530595_68b287a3130bb.jpg', NULL, 1, 1, '2025-08-29 23:12:22', '2025-09-04 11:16:17'),
(5, '100$ fundad account', 2, '15', 'images/funded/1756530789_68b2886591ca3.jpg', NULL, 1, 1, '2025-08-29 23:13:09', '2025-08-29 23:13:09'),
(6, '200$ fundad account', 2, '30', 'images/funded/1756530828_68b2888c67f83.jpg', NULL, 1, 1, '2025-08-29 23:13:48', '2025-08-29 23:13:48'),
(7, '300$ fundad account', 2, '40', 'images/funded/1756530855_68b288a7c5c97.jpg', NULL, 1, 1, '2025-08-29 23:14:15', '2025-08-29 23:14:15'),
(8, '400$ fundad account', 2, '50', 'images/funded/1756530887_68b288c73b100.jpg', NULL, 1, 1, '2025-08-29 23:14:47', '2025-08-29 23:14:47'),
(9, '500$ fundad account', 2, '60', 'images/funded/1756530917_68b288e531579.jpg', NULL, 1, 1, '2025-08-29 23:15:17', '2025-08-29 23:15:17'),
(10, '1000$ fundad account', 2, '120', 'images/funded/1756530949_68b289050e000.jpg', NULL, 1, 1, '2025-08-29 23:15:49', '2025-08-30 00:56:46');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
