-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Sep 30, 2025 at 10:02 AM
-- Server version: 8.3.0
-- PHP Version: 8.3.6

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
-- Table structure for table `activity_log`
--

DROP TABLE IF EXISTS `activity_log`;
CREATE TABLE IF NOT EXISTS `activity_log` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `log_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `event` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject_id` bigint UNSIGNED DEFAULT NULL,
  `causer_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `causer_id` bigint UNSIGNED DEFAULT NULL,
  `properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `batch_uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subject` (`subject_type`,`subject_id`),
  KEY `causer` (`causer_type`,`causer_id`),
  KEY `activity_log_log_name_index` (`log_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `binance_deposits`
--

DROP TABLE IF EXISTS `binance_deposits`;
CREATE TABLE IF NOT EXISTS `binance_deposits` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `user_wallet` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `binance_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(10,4) DEFAULT NULL,
  `coin` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `network` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `binance_status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `txId` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `insertTime` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `completeTime` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `confirmTimes` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `binance_deposits_txid_unique` (`txId`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `binance_deposits`
--

INSERT INTO `binance_deposits` (`id`, `user_id`, `user_wallet`, `binance_id`, `amount`, `coin`, `network`, `binance_status`, `address`, `txId`, `insertTime`, `completeTime`, `confirmTimes`, `status`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL, '4703459968106855936', 1.0000, 'USDT', 'TRX', '1', 'TAPRhxNnfCZYSW9rkzGoE26kV5Q2qa3PQk', 'Off-chain transfer 297815515270', '2025-09-19 18:27:41', '2025-09-19 18:28:15', '1/1', 'Confirmed', '2025-09-19 13:31:26', '2025-09-27 18:10:11'),
(2, NULL, NULL, '4706223602042109441', 1.0000, 'USDT', 'TRX', '1', 'TAPRhxNnfCZYSW9rkzGoE26kV5Q2qa3PQk', 'Off-chain transfer 298564119363', '2025-09-21 16:13:06', '2025-09-21 16:13:15', '1/1', 'Confirmed', '2025-09-21 10:13:57', '2025-09-27 18:10:11'),
(3, NULL, NULL, '4706234244165762561', 1.0000, 'USDT', 'TRX', '1', 'TAPRhxNnfCZYSW9rkzGoE26kV5Q2qa3PQk', 'Off-chain transfer 298568044989', '2025-09-21 16:23:40', '2025-09-21 16:24:15', '1/1', 'Confirmed', '2025-09-21 10:24:20', '2025-09-27 18:10:11'),
(4, NULL, NULL, '4713420367472328193', 1.0000, 'USDT', 'TRX', '1', 'TAPRhxNnfCZYSW9rkzGoE26kV5Q2qa3PQk', 'Off-chain transfer 301010636071', '2025-09-26 15:22:27', '2025-09-26 15:22:35', '1/1', 'Confirmed', '2025-09-26 09:23:04', '2025-09-27 18:10:11');

-- --------------------------------------------------------

--
-- Table structure for table `buy_packages`
--

DROP TABLE IF EXISTS `buy_packages`;
CREATE TABLE IF NOT EXISTS `buy_packages` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `package_id` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `payment_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1=Success, 0=Processing, 2=Failed',
  `remarks` mediumtext COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=Active, 0=Inactive',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Stores the creation time of the record',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Stores the last update time of the record',
  PRIMARY KEY (`id`),
  KEY `buy_packages_user_id_index` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `buy_packages`
--

INSERT INTO `buy_packages` (`id`, `user_id`, `package_id`, `amount`, `payment_status`, `remarks`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, '9', 60.00, 0, NULL, 1, '2025-09-05 22:50:33', '2025-09-05 22:50:33'),
(2, 52, '5', 15.00, 2, NULL, 1, '2025-09-07 09:41:13', '2025-09-13 02:05:31'),
(4, 88, '5', 15.00, 0, NULL, 1, '2025-09-07 22:35:52', '2025-09-07 22:35:52'),
(5, 37, '5', 15.00, 2, NULL, 1, '2025-09-07 23:57:24', '2025-09-13 02:05:46'),
(6, 32, '5', 15.00, 2, NULL, 1, '2025-09-08 01:24:02', '2025-09-13 02:06:00'),
(8, 92, '5', 15.00, 2, NULL, 1, '2025-09-08 22:38:21', '2025-09-13 02:06:21'),
(12, 140, '5', 15.00, 2, NULL, 1, '2025-09-12 07:09:22', '2025-09-19 09:54:11'),
(13, 93, '5', 15.00, 2, NULL, 1, '2025-09-13 00:50:07', '2025-09-19 09:54:16'),
(14, 70, '5', 15.00, 0, NULL, 1, '2025-09-17 04:35:15', '2025-09-17 04:35:15'),
(15, 150, '5', 15.00, 0, NULL, 1, '2025-09-23 12:01:30', '2025-09-23 12:01:30'),
(16, 3, '12', 15.00, 2, NULL, 1, '2025-09-25 02:55:35', '2025-09-25 03:08:01'),
(17, 3, '13', 30.00, 1, NULL, 1, '2025-09-25 03:02:06', '2025-09-25 03:10:04'),
(18, 3, '12', 15.00, 1, NULL, 1, '2025-09-25 03:08:29', '2025-09-25 03:10:09'),
(19, 3, '12', 15.00, 2, NULL, 1, '2025-09-25 03:10:26', '2025-09-25 03:12:39'),
(20, 3, '12', 15.00, 2, NULL, 1, '2025-09-25 03:12:52', '2025-09-25 04:13:10'),
(31, 3, '19', 50.00, 0, NULL, 1, '2025-09-28 14:47:48', '2025-09-28 14:47:48'),
(30, 3, '12', 15.00, 0, NULL, 1, '2025-09-28 14:46:48', '2025-09-28 14:46:48'),
(29, 3, '18', 30.00, 0, NULL, 1, '2025-09-28 14:42:57', '2025-09-28 14:42:57');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
CREATE TABLE IF NOT EXISTS `cache` (
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('illuminate:queue:restart', 'i:1758990908;', 2074350908),
('spatie.permission.cache', 'a:3:{s:5:\"alias\";a:8:{s:1:\"a\";s:2:\"id\";s:1:\"b\";s:4:\"name\";s:1:\"c\";s:10:\"guard_name\";s:1:\"d\";s:14:\"permission_key\";s:1:\"e\";s:10:\"group_name\";s:1:\"f\";s:11:\"description\";s:1:\"g\";s:11:\"priority_id\";s:1:\"r\";s:5:\"roles\";}s:11:\"permissions\";a:75:{i:0;a:8:{s:1:\"a\";i:13;s:1:\"b\";s:9:\"Dashboard\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:9:\"dashboard\";s:1:\"e\";N;s:1:\"f\";N;s:1:\"g\";i:1;s:1:\"r\";a:1:{i:0;i:1;}}i:1;a:8:{s:1:\"a\";i:17;s:1:\"b\";s:19:\"Customer Management\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:8:\"customer\";s:1:\"e\";N;s:1:\"f\";N;s:1:\"g\";i:3;s:1:\"r\";a:1:{i:0;i:1;}}i:2;a:8:{s:1:\"a\";i:18;s:1:\"b\";s:17:\"Business Settings\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:17:\"business-settings\";s:1:\"e\";N;s:1:\"f\";N;s:1:\"g\";i:2;s:1:\"r\";a:1:{i:0;i:1;}}i:3;a:8:{s:1:\"a\";i:19;s:1:\"b\";s:15:\"User Management\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:4:\"user\";s:1:\"e\";N;s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:4;a:8:{s:1:\"a\";i:20;s:1:\"b\";s:13:\"Company Info \";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:12:\"company-info\";s:1:\"e\";N;s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:5;a:7:{s:1:\"a\";i:21;s:1:\"b\";s:10:\"Import CSV\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:10:\"import-csv\";s:1:\"e\";N;s:1:\"f\";N;s:1:\"g\";N;}i:6;a:8:{s:1:\"a\";i:22;s:1:\"b\";s:15:\"Database Backup\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:9:\"db-backup\";s:1:\"e\";N;s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:7;a:8:{s:1:\"a\";i:23;s:1:\"b\";s:13:\"dashboard one\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:13:\"dashboard-one\";s:1:\"e\";s:9:\"Dashboard\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:8;a:8:{s:1:\"a\";i:24;s:1:\"b\";s:13:\"dashboard two\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:13:\"dashboard-two\";s:1:\"e\";s:9:\"Dashboard\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:9;a:8:{s:1:\"a\";i:25;s:1:\"b\";s:10:\"creed tags\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:10:\"creed-tags\";s:1:\"e\";s:17:\"Business Settings\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:10;a:8:{s:1:\"a\";i:26;s:1:\"b\";s:13:\"business type\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:13:\"business-type\";s:1:\"e\";s:17:\"Business Settings\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:11;a:8:{s:1:\"a\";i:27;s:1:\"b\";s:17:\"business category\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:17:\"business-category\";s:1:\"e\";s:17:\"Business Settings\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:12;a:8:{s:1:\"a\";i:28;s:1:\"b\";s:20:\"business subcategory\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:20:\"business-subcategory\";s:1:\"e\";s:17:\"Business Settings\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:13;a:8:{s:1:\"a\";i:29;s:1:\"b\";s:13:\"business tags\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:13:\"business-tags\";s:1:\"e\";s:17:\"Business Settings\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:14;a:8:{s:1:\"a\";i:30;s:1:\"b\";s:10:\"restaurant\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:10:\"restaurant\";s:1:\"e\";s:17:\"Business Settings\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:15;a:8:{s:1:\"a\";i:31;s:1:\"b\";s:11:\"affliations\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:11:\"affliations\";s:1:\"e\";s:17:\"Business Settings\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:16;a:8:{s:1:\"a\";i:46;s:1:\"b\";s:13:\"customer list\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:13:\"customer-list\";s:1:\"e\";s:19:\"Customer Management\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:17;a:8:{s:1:\"a\";i:47;s:1:\"b\";s:13:\"archieve list\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:13:\"archieve-list\";s:1:\"e\";s:19:\"Customer Management\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:18;a:8:{s:1:\"a\";i:48;s:1:\"b\";s:10:\"admin user\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:10:\"admin-user\";s:1:\"e\";s:15:\"User Management\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:19;a:8:{s:1:\"a\";i:49;s:1:\"b\";s:4:\"role\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:4:\"role\";s:1:\"e\";s:15:\"User Management\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:20;a:8:{s:1:\"a\";i:50;s:1:\"b\";s:10:\"permission\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:10:\"permission\";s:1:\"e\";s:15:\"User Management\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:21;a:8:{s:1:\"a\";i:51;s:1:\"b\";s:5:\"about\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:5:\"about\";s:1:\"e\";N;s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:22;a:8:{s:1:\"a\";i:52;s:1:\"b\";s:17:\"subscription plan\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:17:\"subscription-plan\";s:1:\"e\";s:17:\"Business Settings\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:23;a:8:{s:1:\"a\";i:53;s:1:\"b\";s:18:\"creed tags add btn\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:18:\"creed-tags-add-btn\";s:1:\"e\";s:17:\"Business Settings\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:24;a:8:{s:1:\"a\";i:54;s:1:\"b\";s:19:\"creed tags edit btn\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:19:\"creed-tags-edit-btn\";s:1:\"e\";s:17:\"Business Settings\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:25;a:8:{s:1:\"a\";i:55;s:1:\"b\";s:21:\"creed tags delete btn\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:21:\"creed-tags-delete-btn\";s:1:\"e\";s:17:\"Business Settings\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:26;a:8:{s:1:\"a\";i:56;s:1:\"b\";s:21:\"business type add btn\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:21:\"business-type-add-btn\";s:1:\"e\";s:17:\"Business Settings\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:27;a:8:{s:1:\"a\";i:57;s:1:\"b\";s:22:\"business type edit btn\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:22:\"business-type-edit-btn\";s:1:\"e\";s:17:\"Business Settings\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:28;a:8:{s:1:\"a\";i:58;s:1:\"b\";s:24:\"business type delete btn\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:24:\"business-type-delete-btn\";s:1:\"e\";s:17:\"Business Settings\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:29;a:8:{s:1:\"a\";i:59;s:1:\"b\";s:25:\"business category add btn\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:25:\"business-category-add-btn\";s:1:\"e\";s:17:\"Business Settings\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:30;a:8:{s:1:\"a\";i:60;s:1:\"b\";s:26:\"business category edit btn\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:26:\"business-category-edit-btn\";s:1:\"e\";s:17:\"Business Settings\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:31;a:8:{s:1:\"a\";i:61;s:1:\"b\";s:28:\"business category delete btn\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:28:\"business-category-delete-btn\";s:1:\"e\";s:17:\"Business Settings\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:32;a:8:{s:1:\"a\";i:62;s:1:\"b\";s:28:\"business subcategory add btn\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:28:\"business-subcategory-add-btn\";s:1:\"e\";s:17:\"Business Settings\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:33;a:8:{s:1:\"a\";i:63;s:1:\"b\";s:29:\"business subcategory edit btn\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:29:\"business-subcategory-edit-btn\";s:1:\"e\";s:17:\"Business Settings\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:34;a:8:{s:1:\"a\";i:64;s:1:\"b\";s:31:\"business subcategory delete btn\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:31:\"business-subcategory-delete-btn\";s:1:\"e\";s:17:\"Business Settings\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:35;a:8:{s:1:\"a\";i:65;s:1:\"b\";s:21:\"business tags add btn\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:21:\"business-tags-add-btn\";s:1:\"e\";s:17:\"Business Settings\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:36;a:8:{s:1:\"a\";i:66;s:1:\"b\";s:22:\"business tags edit btn\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:22:\"business-tags-edit-btn\";s:1:\"e\";s:17:\"Business Settings\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:37;a:8:{s:1:\"a\";i:67;s:1:\"b\";s:24:\"business tags delete btn\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:24:\"business-tags-delete-btn\";s:1:\"e\";s:17:\"Business Settings\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:38;a:8:{s:1:\"a\";i:68;s:1:\"b\";s:18:\"restaurant add btn\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:18:\"restaurant-add-btn\";s:1:\"e\";s:17:\"Business Settings\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:39;a:8:{s:1:\"a\";i:69;s:1:\"b\";s:19:\"restaurant edit btn\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:19:\"restaurant-edit-btn\";s:1:\"e\";s:17:\"Business Settings\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:40;a:8:{s:1:\"a\";i:70;s:1:\"b\";s:21:\"restaurant delete btn\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:21:\"restaurant-delete-btn\";s:1:\"e\";s:17:\"Business Settings\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:41;a:8:{s:1:\"a\";i:71;s:1:\"b\";s:19:\"affliations add btn\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:19:\"affliations-add-btn\";s:1:\"e\";s:17:\"Business Settings\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:42;a:8:{s:1:\"a\";i:72;s:1:\"b\";s:20:\"affliations edit btn\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:20:\"affliations-edit-btn\";s:1:\"e\";s:17:\"Business Settings\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:43;a:8:{s:1:\"a\";i:73;s:1:\"b\";s:22:\"affliations delete btn\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:22:\"affliations-delete-btn\";s:1:\"e\";s:17:\"Business Settings\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:44;a:8:{s:1:\"a\";i:74;s:1:\"b\";s:25:\"subscription plan add btn\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:25:\"subscription-plan-add-btn\";s:1:\"e\";s:17:\"Business Settings\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:45;a:8:{s:1:\"a\";i:75;s:1:\"b\";s:26:\"subscription plan edit btn\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:26:\"subscription-plan-edit-btn\";s:1:\"e\";s:17:\"Business Settings\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:46;a:8:{s:1:\"a\";i:76;s:1:\"b\";s:28:\"subscription plan delete btn\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:28:\"subscription-plan-delete-btn\";s:1:\"e\";s:17:\"Business Settings\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:47;a:8:{s:1:\"a\";i:77;s:1:\"b\";s:22:\"customers list add btn\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:22:\"customers-list-add-btn\";s:1:\"e\";s:19:\"Customer Management\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:48;a:8:{s:1:\"a\";i:78;s:1:\"b\";s:23:\"customers list edit btn\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:23:\"customers-list-edit-btn\";s:1:\"e\";s:19:\"Customer Management\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:49;a:8:{s:1:\"a\";i:79;s:1:\"b\";s:25:\"customers list delete btn\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:25:\"customers-list-delete-btn\";s:1:\"e\";s:19:\"Customer Management\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:50;a:8:{s:1:\"a\";i:80;s:1:\"b\";s:26:\"archieve list retrieve btn\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:26:\"archieve-list-retrieve-btn\";s:1:\"e\";s:19:\"Customer Management\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:51;a:8:{s:1:\"a\";i:82;s:1:\"b\";s:18:\"admin user add btn\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:18:\"admin-user-add-btn\";s:1:\"e\";s:15:\"User Management\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:52;a:8:{s:1:\"a\";i:83;s:1:\"b\";s:19:\"admin user edit btn\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:19:\"admin-user-edit-btn\";s:1:\"e\";s:15:\"User Management\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:53;a:8:{s:1:\"a\";i:84;s:1:\"b\";s:21:\"admin user delete btn\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:21:\"admin-user-delete-btn\";s:1:\"e\";s:15:\"User Management\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:54;a:8:{s:1:\"a\";i:85;s:1:\"b\";s:13:\"roles add btn\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:13:\"roles-add-btn\";s:1:\"e\";s:15:\"User Management\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:55;a:8:{s:1:\"a\";i:86;s:1:\"b\";s:14:\"roles edit btn\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:14:\"roles-edit-btn\";s:1:\"e\";s:15:\"User Management\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:56;a:8:{s:1:\"a\";i:87;s:1:\"b\";s:16:\"roles delete btn\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:16:\"roles-delete-btn\";s:1:\"e\";s:15:\"User Management\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:57;a:8:{s:1:\"a\";i:88;s:1:\"b\";s:19:\"permissions add btn\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:19:\"permissions-add-btn\";s:1:\"e\";s:15:\"User Management\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:58;a:8:{s:1:\"a\";i:89;s:1:\"b\";s:20:\"permissions edit btn\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:20:\"permissions-edit-btn\";s:1:\"e\";s:15:\"User Management\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:59;a:8:{s:1:\"a\";i:90;s:1:\"b\";s:22:\"permissions delete btn\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:22:\"permissions-delete-btn\";s:1:\"e\";s:15:\"User Management\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:60;a:8:{s:1:\"a\";i:91;s:1:\"b\";s:13:\"contact creed\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:13:\"contact-creed\";s:1:\"e\";N;s:1:\"f\";N;s:1:\"g\";i:4;s:1:\"r\";a:1:{i:0;i:1;}}i:61;a:8:{s:1:\"a\";i:92;s:1:\"b\";s:24:\"contact creed delete btn\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:24:\"contact-creed-delete-btn\";s:1:\"e\";s:13:\"contact creed\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:62;a:8:{s:1:\"a\";i:93;s:1:\"b\";s:13:\"Business List\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:13:\"business-list\";s:1:\"e\";s:19:\"Customer Management\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:63;a:8:{s:1:\"a\";i:94;s:1:\"b\";s:13:\"Business Note\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:13:\"business-note\";s:1:\"e\";N;s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:64;a:8:{s:1:\"a\";i:95;s:1:\"b\";s:25:\"Apps Terms and Conditions\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:25:\"apps-terms-and-conditions\";s:1:\"e\";N;s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:65;a:8:{s:1:\"a\";i:96;s:1:\"b\";s:16:\"Reviews List btn\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:16:\"reviews-list-btn\";s:1:\"e\";s:19:\"Customer Management\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:66;a:8:{s:1:\"a\";i:97;s:1:\"b\";s:14:\"Privacy Policy\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:14:\"privacy-policy\";s:1:\"e\";N;s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:67;a:8:{s:1:\"a\";i:98;s:1:\"b\";s:12:\"Pricing Plan\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:12:\"pricing-plan\";s:1:\"e\";N;s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:68;a:8:{s:1:\"a\";i:99;s:1:\"b\";s:27:\"Add Listing Form Management\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:27:\"add-listing-form-management\";s:1:\"e\";s:17:\"Business Settings\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:69;a:8:{s:1:\"a\";i:100;s:1:\"b\";s:27:\"Add Listing Form Delete btn\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:27:\"add-listing-form-delete-btn\";s:1:\"e\";s:17:\"Business Settings\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:70;a:8:{s:1:\"a\";i:101;s:1:\"b\";s:20:\"Pricing Plan Add btn\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:20:\"pricing-plan-add-btn\";s:1:\"e\";s:12:\"Pricing Plan\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:71;a:8:{s:1:\"a\";i:102;s:1:\"b\";s:21:\"Pricing Plan Edit btn\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:21:\"pricing-plan-edit-btn\";s:1:\"e\";s:12:\"Pricing Plan\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:72;a:8:{s:1:\"a\";i:103;s:1:\"b\";s:23:\"Pricing Plan Delete btn\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:23:\"pricing-plan-delete-btn\";s:1:\"e\";s:12:\"Pricing Plan\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:73;a:8:{s:1:\"a\";i:104;s:1:\"b\";s:19:\"Accounts Management\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:19:\"accounts-management\";s:1:\"e\";N;s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:74;a:8:{s:1:\"a\";i:105;s:1:\"b\";s:6:\"Income\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:6:\"income\";s:1:\"e\";s:19:\"Accounts Management\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}}s:5:\"roles\";a:1:{i:0;a:3:{s:1:\"a\";i:1;s:1:\"b\";s:5:\"Admin\";s:1:\"c\";s:3:\"web\";}}}', 1759299336);

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
CREATE TABLE IF NOT EXISTS `cache_locks` (
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remarks` mediumtext COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=Active, 0=Inactive',
  `created_by` bigint UNSIGNED DEFAULT NULL COMMENT 'Stores the ID of the user who created the record',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Stores the creation time of the record',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Stores the last update time of the record',
  PRIMARY KEY (`id`),
  KEY `categories_created_by_foreign` (`created_by`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `remarks`, `status`, `created_by`, `created_at`, `updated_at`) VALUES
(1, '𝗕𝗗 𝗙𝗨𝗡𝗗 𝗜𝗡𝗩𝗘𝗦𝗧 𝗖𝗢𝗠𝗣𝗔𝗡𝗬\n', NULL, 1, 1, '2025-08-29 22:22:55', '2025-09-27 18:31:43'),
(2, 'BD FUNDED PACKAGES', NULL, 1, 1, '2025-08-29 22:23:13', '2025-09-27 18:32:54'),
(6, '𝗕𝗗 𝗤𝗨𝗢𝗧𝗘𝗫 𝗙𝗨𝗡𝗗\n', NULL, 1, 1, '2025-09-24 10:51:08', '2025-09-27 18:32:14'),
(7, '𝗕𝗗 𝗙𝗢𝗥𝗘𝗫 𝗙𝗨𝗡𝗗\n', NULL, 1, 1, '2025-09-24 10:51:24', '2025-09-27 18:32:33');

-- --------------------------------------------------------

--
-- Table structure for table `commissions`
--

DROP TABLE IF EXISTS `commissions`;
CREATE TABLE IF NOT EXISTS `commissions` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `commission_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `percentage` bigint UNSIGNED DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT 'Commission amount',
  `remarks` mediumtext COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=Active, 0=Inactive',
  `created_by` bigint UNSIGNED DEFAULT NULL COMMENT 'Stores the ID of the user who created the record',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Stores the creation time of the record',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Stores the last update time of the record',
  PRIMARY KEY (`id`),
  KEY `commissions_created_by_foreign` (`created_by`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `commissions`
--

INSERT INTO `commissions` (`id`, `user_id`, `commission_type`, `percentage`, `amount`, `remarks`, `status`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 2, 'For FTD', NULL, 2.00, NULL, 1, NULL, '2025-09-25 02:55:35', '2025-09-25 02:55:35'),
(2, 2, 'For FTD', NULL, 2.00, NULL, 1, NULL, '2025-09-25 03:02:06', '2025-09-25 03:02:06'),
(3, 2, 'For FTD', NULL, 2.00, NULL, 1, NULL, '2025-09-25 03:08:29', '2025-09-25 03:08:29'),
(4, 2, 'For FTD', NULL, 2.00, NULL, 1, NULL, '2025-09-25 03:10:26', '2025-09-25 03:10:26'),
(5, 2, 'For FTD', NULL, 2.00, NULL, 1, NULL, '2025-09-25 03:12:52', '2025-09-25 03:12:52'),
(6, 2, 'For FTD', NULL, 2.00, NULL, 1, NULL, '2025-09-25 04:15:18', '2025-09-25 04:15:18'),
(7, 2, 'For FTD', NULL, 2.00, NULL, 1, NULL, '2025-09-25 05:05:30', '2025-09-25 05:05:30'),
(8, 2, 'For FTD', NULL, 2.00, NULL, 1, NULL, '2025-09-25 05:10:01', '2025-09-25 05:10:01'),
(9, 2, 'For FTD', NULL, 2.00, NULL, 1, NULL, '2025-09-25 05:26:59', '2025-09-25 05:26:59'),
(10, 2, 'For FTD', NULL, 2.00, NULL, 1, NULL, '2025-09-25 05:31:36', '2025-09-25 05:31:36'),
(11, 2, 'For FTD', NULL, 2.00, NULL, 1, NULL, '2025-09-25 05:36:33', '2025-09-25 05:36:33'),
(12, 3, 'flexible', NULL, 4.00, 'For flexible share', 1, NULL, '2025-09-27 17:01:10', '2025-09-27 17:01:10'),
(13, 2, 'For FTD', NULL, 2.00, NULL, 1, NULL, '2025-09-28 14:40:31', '2025-09-28 14:40:31'),
(14, 2, 'For FTD', NULL, 2.00, NULL, 1, NULL, '2025-09-28 14:41:31', '2025-09-28 14:41:31'),
(15, 2, 'For FTD', NULL, 2.00, NULL, 1, NULL, '2025-09-28 14:42:57', '2025-09-28 14:42:57'),
(16, 2, 'For FTD', NULL, 2.00, NULL, 1, NULL, '2025-09-28 14:46:48', '2025-09-28 14:46:48'),
(17, 2, 'For FTD', NULL, 2.00, NULL, 1, NULL, '2025-09-28 14:47:48', '2025-09-28 14:47:48'),
(18, 3, 'copy', NULL, 5.00, 'Return of copy investment', 1, 1, '2025-09-30 08:39:36', '2025-09-30 08:39:36'),
(19, 3, 'copy', NULL, -50.00, 'Return of copy investment', 1, 1, '2025-09-30 08:43:04', '2025-09-30 08:43:04'),
(20, 3, 'copy', NULL, -50.00, 'Return of copy investment', 1, 1, '2025-09-30 08:45:19', '2025-09-30 08:45:19');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=MyISAM AUTO_INCREMENT=205 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`id`, `queue`, `payload`, `attempts`, `reserved_at`, `available_at`, `created_at`) VALUES
(200, 'default', '{\"uuid\":\"f23c8fe3-e735-4d40-9dc7-d2c90d8b82d9\",\"displayName\":\"App\\\\Mail\\\\PurchasePackageMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":16:{s:8:\\\"mailable\\\";O:28:\\\"App\\\\Mail\\\\PurchasePackageMail\\\":3:{s:4:\\\"user\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:3;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:25:\\\"nazimuddin11121@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:3:\\\"job\\\";N;}\"},\"createdAt\":1759070435,\"delay\":null}', 0, NULL, 1759070435, 1759070435),
(201, 'default', '{\"uuid\":\"311dd1cb-b4dd-488d-aca1-45b7e8ac3087\",\"displayName\":\"App\\\\Mail\\\\PurchasePackageMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":16:{s:8:\\\"mailable\\\";O:28:\\\"App\\\\Mail\\\\PurchasePackageMail\\\":3:{s:4:\\\"user\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:3;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:25:\\\"nazimuddin11121@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:3:\\\"job\\\";N;}\"},\"createdAt\":1759070491,\"delay\":null}', 0, NULL, 1759070491, 1759070491),
(202, 'default', '{\"uuid\":\"4841188e-985c-465a-94f7-2ac3c0ecba92\",\"displayName\":\"App\\\\Mail\\\\PurchasePackageMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":16:{s:8:\\\"mailable\\\";O:28:\\\"App\\\\Mail\\\\PurchasePackageMail\\\":3:{s:4:\\\"user\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:3;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:25:\\\"nazimuddin11121@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:3:\\\"job\\\";N;}\"},\"createdAt\":1759070577,\"delay\":null}', 0, NULL, 1759070577, 1759070577),
(203, 'default', '{\"uuid\":\"9e3b01ce-0f4a-4028-8484-df73cdc427bb\",\"displayName\":\"App\\\\Mail\\\\PurchasePackageMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":16:{s:8:\\\"mailable\\\";O:28:\\\"App\\\\Mail\\\\PurchasePackageMail\\\":3:{s:4:\\\"user\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:3;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:25:\\\"nazimuddin11121@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:3:\\\"job\\\";N;}\"},\"createdAt\":1759070808,\"delay\":null}', 0, NULL, 1759070808, 1759070808),
(204, 'default', '{\"uuid\":\"0a16ebb8-f5b2-4161-9db2-d64791461b24\",\"displayName\":\"App\\\\Mail\\\\PurchasePackageMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":16:{s:8:\\\"mailable\\\";O:28:\\\"App\\\\Mail\\\\PurchasePackageMail\\\":3:{s:4:\\\"user\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:3;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:25:\\\"nazimuddin11121@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:3:\\\"job\\\";N;}\"},\"createdAt\":1759070869,\"delay\":null}', 0, NULL, 1759070869, 1759070869);

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
CREATE TABLE IF NOT EXISTS `job_batches` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mail_accounts`
--

DROP TABLE IF EXISTS `mail_accounts`;
CREATE TABLE IF NOT EXISTS `mail_accounts` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `host` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'imap.gmail.com',
  `port` int NOT NULL DEFAULT '993',
  `encryption` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ssl',
  `validate_cert` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'true',
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quotex_password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `to_mail` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remarks` mediumtext COLLATE utf8mb4_unicode_ci,
  `connection_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1=Active, 0=Inactive',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=Active, 0=Inactive',
  `created_by` bigint UNSIGNED DEFAULT NULL COMMENT 'Stores the ID of the user who created the record',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Stores the creation time of the record',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Stores the last update time of the record',
  PRIMARY KEY (`id`),
  KEY `mail_accounts_created_by_foreign` (`created_by`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mail_accounts`
--

INSERT INTO `mail_accounts` (`id`, `name`, `host`, `port`, `encryption`, `validate_cert`, `username`, `password`, `quotex_password`, `user_id`, `to_mail`, `remarks`, `connection_status`, `status`, `created_by`, `created_at`, `updated_at`) VALUES
(2, 'Quotex', 'imap.gmail.com', 993, 'ssl', 'true', 'bdfundedtrader007@gmail.com', 'dydd tbhe fenu scgj', '@quotex123@', 3, 'nazimuddin11121@gmail.com', NULL, 1, 0, NULL, '2025-09-22 07:26:34', '2025-09-28 14:32:23'),
(3, 'Quotex', 'imap.gmail.com', 993, 'ssl', 'true', 'bdfundedtrader008@gmail.com', 'ojqm geik jftd wgjn', '@quotex123@', 3, 'nazimuddin11121@gmail.com', NULL, 1, 0, NULL, '2025-09-24 07:43:00', '2025-09-28 14:40:31'),
(4, 'Quotex', 'imap.gmail.com', 993, 'ssl', 'true', 'bdfundedtrader009@gmail.com', 'fxko naco hrrg oydg', '@quotex123@', 3, 'nazimuddin11121@gmail.com', NULL, 1, 0, NULL, '2025-09-24 07:43:35', '2025-09-28 14:46:48');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_11_24_044710_create_t_admin_users_table', 1),
(5, '2024_11_24_063750_create_personal_access_tokens_table', 1),
(6, '2024_11_24_090535_create_t_business_types_table', 1),
(7, '2024_11_24_110746_create_t_business_categories_table', 1),
(8, '2024_11_24_114105_create_t_business_tags_table', 1),
(9, '2024_11_24_114954_create_t_business_sub_categories_table', 1),
(10, '2024_11_25_051230_create_permission_tables', 1),
(11, '2024_11_27_101108_create_t_business_owner_infos_table', 1),
(12, '2024_11_28_035449_create_t_businesses_table', 1),
(13, '2024_11_28_052007_create_t_generic_codes_table', 1),
(14, '2024_11_30_163708_add_business_id_foreign_key_to_t_business_owner_infos', 1),
(15, '2024_12_03_064954_create_t_admin_countries_table', 1),
(16, '2024_12_03_065017_create_t_admin_states_table', 1),
(17, '2024_12_03_065029_create_t_admin_cities_table', 1),
(18, '2024_12_04_045705_create_t_creed_tags_table', 1),
(19, '2024_12_04_045816_create_t_operation_hours_table', 1),
(20, '2024_12_05_093150_create_t_days_table', 1),
(21, '2024_12_08_063208_create_t_admin_restaurants_table', 1),
(22, '2024_12_09_061803_create_t_admin_affiliations_table', 1),
(23, '2024_12_10_033647_create_t_admin_subscription_plans_table', 1),
(24, '2024_12_10_040552_create_t_company_infos_table', 1),
(25, '2024_12_11_071008_add_business_tags_id_foreign_key_to_t_businesses', 1),
(26, '2024_12_17_092057_create_t_about_us_table', 1),
(27, '2024_12_18_091357_create_t_business_galleries_table', 1),
(28, '2024_12_26_100828_create_t_payments_table', 1),
(29, '2024_12_29_042713_create_t_business_ratings_table', 1),
(30, '2024_12_29_101128_create_t_app_terms_and_conditions_table', 1),
(31, '2025_01_14_044434_create_t_save_businesses_table', 2),
(32, '2025_01_15_054154_create_t_creed_visitors_table', 2),
(33, '2025_01_15_054211_create_t_business_profile_visitors_table', 2),
(34, '2025_01_15_070425_create_t_call_mes_table', 2),
(35, '2025_01_15_070509_create_t_quotes_table', 2),
(36, '2025_01_20_091709_create_activity_log_table', 3),
(37, '2025_01_20_091710_add_event_column_to_activity_log_table', 3),
(38, '2025_01_20_091711_add_batch_uuid_column_to_activity_log_table', 3),
(39, '2025_01_22_082440_create_t_checkout_text_data_table', 3),
(40, '2025_02_13_091400_create_t_contact_creeds_table', 3),
(41, '2025_02_19_034642_create_t_admin_versions_table', 3),
(42, '2025_03_03_063941_create_t_admin_notes_table', 3),
(43, '2025_03_19_031447_create_t_admin_privacy_policies_table', 3),
(44, '2025_03_19_040452_create_t_admin_pricing_plans_table', 3),
(45, '2025_03_20_031236_create_t_admin_add_listing_form_management_table', 3),
(46, '2025_03_23_053711_create_t_halal_certificate_data_table', 3),
(47, '2025_04_16_070754_create_t_dashboard_todo_lists_table', 3),
(48, '2025_04_29_085614_create_t_business_category_keywords_table', 3),
(49, '2025_04_29_102600_create_t_admin_mosque_data_table', 3),
(50, '2025_08_23_045910_create_user_nid_images_table', 3),
(51, '2025_08_24_143957_create_t_deposits_table', 4),
(52, '2025_08_25_175615_create_buy_packages_table', 5),
(53, '2025_08_26_174141_create_t_invests_table', 6),
(54, '2025_08_28_172842_create_todo_lists_table', 7),
(55, '2025_08_29_143742_create_withdraws_table', 8),
(58, '2025_08_30_034634_create_categories_table', 9),
(59, '2025_08_30_035934_create_packages_table', 9),
(61, '2025_08_30_071730_create_sliders_table', 10),
(62, '2025_08_30_071837_create_notices_table', 10),
(63, '2025_09_01_154706_create_commissions_table', 11),
(64, '2025_09_02_083234_create_reviews_table', 12),
(65, '2025_09_18_171526_create_binance_deposits_table', 13),
(66, '2025_09_19_051938_create_notifications_table', 13),
(67, '2025_09_22_121633_create_mail_accounts_table', 14);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

DROP TABLE IF EXISTS `model_has_permissions`;
CREATE TABLE IF NOT EXISTS `model_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

DROP TABLE IF EXISTS `model_has_roles`;
CREATE TABLE IF NOT EXISTS `model_has_roles` (
  `role_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\Admin\\TAdminUser', 1);

-- --------------------------------------------------------

--
-- Table structure for table `notices`
--

DROP TABLE IF EXISTS `notices`;
CREATE TABLE IF NOT EXISTS `notices` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `remarks` mediumtext COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=Active, 0=Inactive',
  `created_by` bigint UNSIGNED DEFAULT NULL COMMENT 'Stores the ID of the user who created the record',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Stores the creation time of the record',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Stores the last update time of the record',
  PRIMARY KEY (`id`),
  KEY `notices_created_by_foreign` (`created_by`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notices`
--

INSERT INTO `notices` (`id`, `remarks`, `status`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'ফান্ডিং অ্যাকাউন্ট সম্পর্কে আরও বিস্তারিত জানতে চাইলে আমাদের Telegram এ নক দিন। তবে মনে রাখবেন আবেদনকারীর বয়স অবশ্যই ন্যূনতম 16+ হতে হবে। আপনার ট্রেডিং একিউরেসি অন্তত 60%–70% হতে হবে। বাংলাদেশে ১০০% ট্রাস্টেড প্ল্যাটফর্ম – লোন, ফান্ডিং, ইনভেস্টমেন্ট ও টুর্নামেন্টের সব সুবিধা একসাথে।', 1, 1, '2025-08-30 02:05:50', '2025-08-30 11:02:21');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
CREATE TABLE IF NOT EXISTS `notifications` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remarks` mediumtext COLLATE utf8mb4_unicode_ci,
  `read_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=Active, 0=Inactive',
  `created_by` bigint UNSIGNED DEFAULT NULL COMMENT 'Stores the ID of the user who created the record',
  `updated_by` bigint UNSIGNED DEFAULT NULL COMMENT 'Stores the ID of the user who updated the record',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Stores the creation time of the record',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Stores the last update time of the record',
  PRIMARY KEY (`id`),
  KEY `notifications_created_by_foreign` (`created_by`),
  KEY `notifications_updated_by_foreign` (`updated_by`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `user_id`, `type`, `category`, `image`, `remarks`, `read_at`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 3, NULL, 'commission', NULL, 'Your Share Commission 4$ added successfully.', '2025-09-27 17:47:39', 1, NULL, NULL, '2025-09-27 17:01:10', '2025-09-27 17:47:39'),
(2, 3, 'Auto', 'Return from copy investment', NULL, 'Your Return 55$ added successfull', '2025-09-30 08:50:43', 1, NULL, NULL, '2025-09-30 08:45:19', '2025-09-30 08:50:43');

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

DROP TABLE IF EXISTS `packages`;
CREATE TABLE IF NOT EXISTS `packages` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` bigint UNSIGNED DEFAULT NULL COMMENT 'Foreign key referencing the id in the categories table',
  `price` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remarks` mediumtext COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=Active, 0=Inactive',
  `created_by` bigint UNSIGNED DEFAULT NULL COMMENT 'Stores the ID of the user who created the record',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Stores the creation time of the record',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Stores the last update time of the record',
  PRIMARY KEY (`id`),
  KEY `packages_category_id_foreign` (`category_id`),
  KEY `packages_created_by_foreign` (`created_by`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`id`, `name`, `category_id`, `price`, `image`, `remarks`, `status`, `created_by`, `created_at`, `updated_at`) VALUES
(2, 'Trusted Company Flexible Share Buy', 1, NULL, 'images/service/1757161547_68bc284be4cde.jpg', NULL, 1, 1, '2025-08-29 23:09:55', '2025-09-24 11:05:20'),
(3, 'Get Company Loan&Start Trading', 1, NULL, 'images/service/1756530708_68b2881480247.jpg', NULL, 0, 1, '2025-08-29 23:11:48', '2025-09-30 06:19:09'),
(4, 'Trusted Company Locked Share Buy', 1, NULL, 'images/service/1757161526_68bc2836b32f6.jpg', NULL, 1, 1, '2025-08-29 23:12:22', '2025-09-24 11:05:01'),
(5, '100$ funded account', 2, '15', 'images/funded/1757139319_68bbd177c8adf.jpg', NULL, 0, 1, '2025-08-29 23:13:09', '2025-09-27 18:09:42'),
(6, '200$ funded account', 2, '30', 'images/funded/1757139295_68bbd15fcd038.jpg', NULL, 0, 1, '2025-08-29 23:13:48', '2025-09-27 18:05:30'),
(7, '300$ funded account', 2, '40', 'images/funded/1757139266_68bbd1429eb41.jpg', NULL, 0, 1, '2025-08-29 23:14:15', '2025-09-27 18:05:15'),
(8, '400$ funded account', 2, '50', 'images/funded/1757139223_68bbd1179a34e.jpg', NULL, 0, 1, '2025-08-29 23:14:47', '2025-09-27 18:04:53'),
(9, '500$ funded account', 2, '60', 'images/funded/1757139178_68bbd0eabf486.jpg', NULL, 0, 1, '2025-08-29 23:15:17', '2025-09-27 18:03:42'),
(10, '1000$ funded account', 2, '120', 'images/funded/1757139115_68bbd0ab99e11.jpg', NULL, 0, 1, '2025-08-29 23:15:49', '2025-09-27 18:03:10'),
(12, '100$ quotex account', 6, '15', 'images/funded/1758733007_68d422cfa49c5.jpg', NULL, 1, 1, '2025-09-24 10:56:47', '2025-09-24 10:56:47'),
(13, '200$ quotex account', 6, '30', 'images/funded/1758733081_68d42319544cb.jpg', NULL, 1, 1, '2025-09-24 10:58:01', '2025-09-24 10:58:01'),
(14, '300$ quotex account', 6, '40', 'images/funded/1758733174_68d42376274a8.jpg', NULL, 1, 1, '2025-09-24 10:59:34', '2025-09-24 10:59:34'),
(15, '400$ quotex account', 6, '50', 'images/funded/1758733218_68d423a20b327.jpg', NULL, 1, 1, '2025-09-24 11:00:18', '2025-09-24 11:00:18'),
(16, '500$ quotex account', 6, '50', 'images/funded/1758733246_68d423beb9860.jpg', NULL, 1, 1, '2025-09-24 11:00:46', '2025-09-24 11:00:46'),
(17, '600$ quotex account', 6, '120', 'images/funded/1758733283_68d423e3993e4.jpg', NULL, 1, 1, '2025-09-24 11:01:23', '2025-09-24 11:01:23'),
(18, '300$ forex account', 7, '30', 'images/funded/1758733332_68d42414406e9.jpg', NULL, 1, 1, '2025-09-24 11:02:12', '2025-09-24 11:03:31'),
(19, '500$ forex account', 7, '50', 'images/funded/1758733395_68d42453e9dd9.jpg', NULL, 1, 1, '2025-09-24 11:03:15', '2025-09-24 11:03:15'),
(20, '1000$ forex account', 7, '100', 'images/funded/1758733439_68d4247f09cbf.jpg', NULL, 1, 1, '2025-09-24 11:03:59', '2025-09-24 11:03:59'),
(21, 'Copy Account', 1, NULL, 'images/service/1759213200_68db7690d798d.jpg', NULL, 1, 1, '2025-09-30 06:20:00', '2025-09-30 06:20:00');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_reset_tokens`
--

INSERT INTO `password_reset_tokens` (`email`, `token`, `created_at`) VALUES
('nazimuddin11121@gmail.com', '$2y$12$Sc7IXs3ni9L8212rVQ9MseG1/QwIkZa.UD6TroKjQ8d4GfCBFaqMC', '2025-09-27 17:03:00'),
('minhazul9090@gmail.com', '$2y$12$pIvl/PiavZ5WUlIHV.Wrt.1WSMD2U9WwBYQWDVzCJcA6w/FOG9ndG', '2025-09-04 23:59:33'),
('nazim85.cse@gmail.com', '$2y$12$OmE8vS5xWVuSt83rD7hEBuB7AkZ3NxOpyek7wK1YxLO5E9sFm11WS', '2025-09-25 03:36:29');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permission_key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `group_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `priority_id` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `permission_key`, `group_name`, `description`, `priority_id`, `created_at`, `updated_at`) VALUES
(13, 'Dashboard', 'web', 'dashboard', NULL, NULL, 1, '2025-01-28 23:47:33', '2025-01-28 23:47:33'),
(17, 'Customer Management', 'web', 'customer', NULL, NULL, 3, '2025-01-29 01:02:25', '2025-01-29 01:02:25'),
(18, 'Business Settings', 'web', 'business-settings', NULL, NULL, 2, '2025-01-29 01:02:40', '2025-01-29 01:02:40'),
(19, 'User Management', 'web', 'user', NULL, NULL, NULL, '2025-01-29 01:03:57', '2025-01-29 01:03:57'),
(20, 'Company Info ', 'web', 'company-info', NULL, NULL, NULL, '2025-01-29 01:04:10', '2025-01-29 01:04:10'),
(21, 'Import CSV', 'web', 'import-csv', NULL, NULL, NULL, '2025-01-29 01:04:31', '2025-01-29 01:04:31'),
(22, 'Database Backup', 'web', 'db-backup', NULL, NULL, NULL, '2025-01-29 01:04:41', '2025-01-29 01:04:41'),
(23, 'dashboard one', 'web', 'dashboard-one', 'Dashboard', NULL, NULL, '2025-01-29 01:05:03', '2025-01-29 01:05:03'),
(24, 'dashboard two', 'web', 'dashboard-two', 'Dashboard', NULL, NULL, '2025-01-29 02:21:59', '2025-01-29 02:21:59'),
(25, 'creed tags', 'web', 'creed-tags', 'Business Settings', NULL, NULL, '2025-01-29 02:28:44', '2025-01-29 02:28:44'),
(26, 'business type', 'web', 'business-type', 'Business Settings', NULL, NULL, '2025-01-29 02:29:01', '2025-01-29 02:29:01'),
(27, 'business category', 'web', 'business-category', 'Business Settings', NULL, NULL, '2025-01-29 02:29:14', '2025-01-29 02:29:14'),
(28, 'business subcategory', 'web', 'business-subcategory', 'Business Settings', NULL, NULL, '2025-01-29 02:29:25', '2025-01-29 02:29:25'),
(29, 'business tags', 'web', 'business-tags', 'Business Settings', NULL, NULL, '2025-01-29 02:29:43', '2025-01-29 02:29:43'),
(30, 'restaurant', 'web', 'restaurant', 'Business Settings', NULL, NULL, '2025-01-29 02:30:02', '2025-01-29 02:30:02'),
(31, 'affliations', 'web', 'affliations', 'Business Settings', NULL, NULL, '2025-01-29 02:30:15', '2025-01-29 02:30:15'),
(46, 'customer list', 'web', 'customer-list', 'Customer Management', NULL, NULL, '2025-01-30 10:18:09', '2025-01-30 10:18:09'),
(47, 'archieve list', 'web', 'archieve-list', 'Customer Management', NULL, NULL, '2025-01-30 10:19:18', '2025-01-30 10:19:18'),
(48, 'admin user', 'web', 'admin-user', 'User Management', NULL, NULL, '2025-01-30 10:19:37', '2025-01-30 10:19:37'),
(49, 'role', 'web', 'role', 'User Management', NULL, NULL, '2025-01-30 10:19:55', '2025-01-30 10:19:55'),
(50, 'permission', 'web', 'permission', 'User Management', NULL, NULL, '2025-01-30 10:20:10', '2025-01-30 10:20:10'),
(51, 'about', 'web', 'about', NULL, NULL, NULL, '2025-01-30 10:20:37', '2025-01-30 10:20:37'),
(52, 'subscription plan', 'web', 'subscription-plan', 'Business Settings', NULL, NULL, '2025-01-30 10:32:05', '2025-01-30 10:32:05'),
(53, 'creed tags add btn', 'web', 'creed-tags-add-btn', 'Business Settings', NULL, NULL, '2025-02-06 03:56:45', '2025-02-06 03:56:45'),
(54, 'creed tags edit btn', 'web', 'creed-tags-edit-btn', 'Business Settings', NULL, NULL, '2025-02-06 03:56:56', '2025-02-06 03:56:56'),
(55, 'creed tags delete btn', 'web', 'creed-tags-delete-btn', 'Business Settings', NULL, NULL, '2025-02-06 03:57:07', '2025-02-06 03:57:07'),
(56, 'business type add btn', 'web', 'business-type-add-btn', 'Business Settings', NULL, NULL, '2025-02-06 03:57:37', '2025-02-06 03:57:37'),
(57, 'business type edit btn', 'web', 'business-type-edit-btn', 'Business Settings', NULL, NULL, '2025-02-06 03:57:47', '2025-02-06 03:57:47'),
(58, 'business type delete btn', 'web', 'business-type-delete-btn', 'Business Settings', NULL, NULL, '2025-02-06 03:58:00', '2025-02-06 03:58:00'),
(59, 'business category add btn', 'web', 'business-category-add-btn', 'Business Settings', NULL, NULL, '2025-02-06 03:58:23', '2025-02-06 03:58:23'),
(60, 'business category edit btn', 'web', 'business-category-edit-btn', 'Business Settings', NULL, NULL, '2025-02-06 03:58:34', '2025-02-06 03:58:34'),
(61, 'business category delete btn', 'web', 'business-category-delete-btn', 'Business Settings', NULL, NULL, '2025-02-06 03:58:46', '2025-02-06 03:58:46'),
(62, 'business subcategory add btn', 'web', 'business-subcategory-add-btn', 'Business Settings', NULL, NULL, '2025-02-06 03:59:17', '2025-02-06 03:59:17'),
(63, 'business subcategory edit btn', 'web', 'business-subcategory-edit-btn', 'Business Settings', NULL, NULL, '2025-02-06 04:01:11', '2025-02-06 04:01:11'),
(64, 'business subcategory delete btn', 'web', 'business-subcategory-delete-btn', 'Business Settings', NULL, NULL, '2025-02-06 04:01:51', '2025-02-06 04:02:03'),
(65, 'business tags add btn', 'web', 'business-tags-add-btn', 'Business Settings', NULL, NULL, '2025-02-06 04:02:27', '2025-02-06 04:02:27'),
(66, 'business tags edit btn', 'web', 'business-tags-edit-btn', 'Business Settings', NULL, NULL, '2025-02-06 04:02:38', '2025-02-06 04:02:38'),
(67, 'business tags delete btn', 'web', 'business-tags-delete-btn', 'Business Settings', NULL, NULL, '2025-02-06 04:02:49', '2025-02-06 04:02:49'),
(68, 'restaurant add btn', 'web', 'restaurant-add-btn', 'Business Settings', NULL, NULL, '2025-02-06 04:03:10', '2025-02-06 04:03:10'),
(69, 'restaurant edit btn', 'web', 'restaurant-edit-btn', 'Business Settings', NULL, NULL, '2025-02-06 04:03:21', '2025-02-06 04:03:21'),
(70, 'restaurant delete btn', 'web', 'restaurant-delete-btn', 'Business Settings', NULL, NULL, '2025-02-06 04:03:31', '2025-02-06 04:03:31'),
(71, 'affliations add btn', 'web', 'affliations-add-btn', 'Business Settings', NULL, NULL, '2025-02-06 04:03:59', '2025-02-06 04:03:59'),
(72, 'affliations edit btn', 'web', 'affliations-edit-btn', 'Business Settings', NULL, NULL, '2025-02-06 04:04:10', '2025-02-06 04:04:10'),
(73, 'affliations delete btn', 'web', 'affliations-delete-btn', 'Business Settings', NULL, NULL, '2025-02-06 04:04:30', '2025-02-06 04:04:30'),
(74, 'subscription plan add btn', 'web', 'subscription-plan-add-btn', 'Business Settings', NULL, NULL, '2025-02-06 04:05:07', '2025-02-06 04:05:07'),
(75, 'subscription plan edit btn', 'web', 'subscription-plan-edit-btn', 'Business Settings', NULL, NULL, '2025-02-06 04:05:28', '2025-02-06 04:05:28'),
(76, 'subscription plan delete btn', 'web', 'subscription-plan-delete-btn', 'Business Settings', NULL, NULL, '2025-02-06 04:05:45', '2025-02-06 04:05:45'),
(77, 'customers list add btn', 'web', 'customers-list-add-btn', 'Customer Management', NULL, NULL, '2025-02-06 04:06:20', '2025-02-06 04:06:20'),
(78, 'customers list edit btn', 'web', 'customers-list-edit-btn', 'Customer Management', NULL, NULL, '2025-02-06 04:06:30', '2025-02-06 04:06:30'),
(79, 'customers list delete btn', 'web', 'customers-list-delete-btn', 'Customer Management', NULL, NULL, '2025-02-06 04:06:44', '2025-02-06 04:06:44'),
(80, 'archieve list retrieve btn', 'web', 'archieve-list-retrieve-btn', 'Customer Management', NULL, NULL, '2025-02-06 04:12:07', '2025-02-06 04:12:07'),
(82, 'admin user add btn', 'web', 'admin-user-add-btn', 'User Management', NULL, NULL, '2025-02-06 04:13:20', '2025-02-06 04:13:20'),
(83, 'admin user edit btn', 'web', 'admin-user-edit-btn', 'User Management', NULL, NULL, '2025-02-06 04:13:29', '2025-02-06 04:13:29'),
(84, 'admin user delete btn', 'web', 'admin-user-delete-btn', 'User Management', NULL, NULL, '2025-02-06 04:13:39', '2025-02-06 04:13:39'),
(85, 'roles add btn', 'web', 'roles-add-btn', 'User Management', NULL, NULL, '2025-02-06 04:15:16', '2025-02-06 04:15:16'),
(86, 'roles edit btn', 'web', 'roles-edit-btn', 'User Management', NULL, NULL, '2025-02-06 04:15:28', '2025-02-06 04:15:28'),
(87, 'roles delete btn', 'web', 'roles-delete-btn', 'User Management', NULL, NULL, '2025-02-06 04:15:38', '2025-02-06 04:15:38'),
(88, 'permissions add btn', 'web', 'permissions-add-btn', 'User Management', NULL, NULL, '2025-02-06 04:16:04', '2025-02-06 04:16:04'),
(89, 'permissions edit btn', 'web', 'permissions-edit-btn', 'User Management', NULL, NULL, '2025-02-06 04:16:15', '2025-02-06 04:16:15'),
(90, 'permissions delete btn', 'web', 'permissions-delete-btn', 'User Management', NULL, NULL, '2025-02-06 04:16:29', '2025-02-06 04:16:29'),
(91, 'contact creed', 'web', 'contact-creed', NULL, NULL, 4, '2025-02-17 10:20:37', '2025-02-17 10:20:37'),
(92, 'contact creed delete btn', 'web', 'contact-creed-delete-btn', 'contact creed', NULL, NULL, '2025-02-17 10:20:37', '2025-02-17 10:20:37'),
(93, 'Business List', 'web', 'business-list', 'Customer Management', NULL, NULL, '2025-02-17 10:20:37', '2025-02-17 10:20:37'),
(94, 'Business Note', 'web', 'business-note', NULL, NULL, NULL, '2025-01-30 10:32:05', '2025-01-30 10:32:05'),
(95, 'Apps Terms and Conditions', 'web', 'apps-terms-and-conditions', NULL, NULL, NULL, '2025-01-30 10:32:05', '2025-01-30 10:32:05'),
(96, 'Reviews List btn', 'web', 'reviews-list-btn', 'Customer Management', NULL, NULL, '2025-02-17 10:20:37', '2025-02-17 10:20:37'),
(97, 'Privacy Policy', 'web', 'privacy-policy', NULL, NULL, NULL, '2025-03-20 10:20:37', '2025-03-20 10:20:37'),
(98, 'Pricing Plan', 'web', 'pricing-plan', NULL, NULL, NULL, '2025-03-20 10:20:37', '2025-03-20 10:20:37'),
(99, 'Add Listing Form Management', 'web', 'add-listing-form-management', 'Business Settings', NULL, NULL, '2025-03-20 10:20:37', '2025-03-20 10:20:37'),
(100, 'Add Listing Form Delete btn', 'web', 'add-listing-form-delete-btn', 'Business Settings', NULL, NULL, '2025-03-20 10:20:37', '2025-03-20 10:20:37'),
(101, 'Pricing Plan Add btn', 'web', 'pricing-plan-add-btn', 'Pricing Plan', NULL, NULL, '2025-03-20 10:20:37', '2025-03-20 10:20:37'),
(102, 'Pricing Plan Edit btn', 'web', 'pricing-plan-edit-btn', 'Pricing Plan', NULL, NULL, '2025-03-20 10:20:37', '2025-03-20 10:20:37'),
(103, 'Pricing Plan Delete btn', 'web', 'pricing-plan-delete-btn', 'Pricing Plan', NULL, NULL, '2025-03-20 10:20:37', '2025-03-20 10:20:37'),
(104, 'Accounts Management', 'web', 'accounts-management', NULL, NULL, NULL, '2025-05-08 09:20:31', '2025-05-08 09:20:31'),
(105, 'Income', 'web', 'income', 'Accounts Management', NULL, NULL, '2025-05-08 09:20:41', '2025-05-08 09:20:41');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=MyISAM AUTO_INCREMENT=746 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`, `deleted_at`) VALUES
(297, 'App\\Models\\User', 32, 'API Token', '71be76a2ea44c6d0a1bb5f3c0229b2ce6386bc98571b19c48a65a592553a09be', '[\"*\"]', NULL, NULL, '2025-09-07 20:57:24', '2025-09-07 20:57:24', '2025-09-08 02:57:24'),
(296, 'App\\Models\\User', 81, 'API Token', 'da56c3a32dbe2ec3adf174e2406a8d2cbb8225631e51cc0b8a5eb9d802a17059', '[\"*\"]', NULL, NULL, '2025-09-07 20:33:52', '2025-09-07 20:33:52', '2025-09-08 02:33:52'),
(295, 'App\\Models\\User', 80, 'API Token', 'd884bd71cbc012dd76f43b905560b2e3d5e8aa68138baf4120f5ac1619beee91', '[\"*\"]', NULL, NULL, '2025-09-07 19:59:29', '2025-09-07 19:59:29', '2025-09-08 01:59:29'),
(294, 'App\\Models\\User', 43, 'API Token', '55c936e63d83ceaa0ad4cc586f65d3e1ff970466c31864b791f3c9421c208dcb', '[\"*\"]', NULL, NULL, '2025-09-07 19:57:51', '2025-09-07 19:57:51', '2025-09-08 01:57:51'),
(293, 'App\\Models\\User', 43, 'API Token', '9e68783b87a87e7eaef9d2721764118d568d680328b3604effc30c93da95793d', '[\"*\"]', NULL, NULL, '2025-09-07 19:57:49', '2025-09-07 19:57:49', '2025-09-08 01:57:49'),
(292, 'App\\Models\\User', 61, 'API Token', 'd013d40959177ac24ecfd42b297f4e8d725bceaf258037dd0726d569f43ba0bc', '[\"*\"]', NULL, NULL, '2025-09-07 19:20:46', '2025-09-07 19:20:46', '2025-09-08 01:20:46'),
(291, 'App\\Models\\User', 61, 'API Token', 'c2e666da50ce33e44385bd20ecedb79e451cf9fdd3f1347118a15a00130a7f2f', '[\"*\"]', NULL, NULL, '2025-09-07 18:53:00', '2025-09-07 18:53:00', '2025-09-08 00:53:00'),
(290, 'App\\Models\\User', 61, 'API Token', '9678eadf55b8fa595613882b8c5174629aefa893a8a9e581f6eb6ea9abb338e0', '[\"*\"]', NULL, NULL, '2025-09-07 18:41:59', '2025-09-07 18:41:59', '2025-09-08 00:41:59'),
(289, 'App\\Models\\User', 61, 'API Token', '95e130799ce4b4ecb2a76a7f007efa119a939214cdfe74a6e9c9ea01bdc451c0', '[\"*\"]', NULL, NULL, '2025-09-07 18:41:12', '2025-09-07 18:41:12', '2025-09-08 00:41:12'),
(288, 'App\\Models\\User', 61, 'API Token', 'db6a77c24f490b3123a72b6609710ef57c3e7680b27a13ba606818f6bc580e7e', '[\"*\"]', NULL, NULL, '2025-09-07 18:41:12', '2025-09-07 18:41:12', '2025-09-08 00:41:12'),
(287, 'App\\Models\\User', 61, 'API Token', '1e97f87956fb681f3911213b44d481b81afb92add940c56bd0fe83ae69fcdd14', '[\"*\"]', NULL, NULL, '2025-09-07 18:41:12', '2025-09-07 18:41:12', '2025-09-08 00:41:12'),
(286, 'App\\Models\\User', 61, 'API Token', '9e6b5e0cb82493db0cf460faeca2b4ea7b9e05bcd1776af9357a2341bac744d1', '[\"*\"]', NULL, NULL, '2025-09-07 18:41:12', '2025-09-07 18:41:12', '2025-09-08 00:41:12'),
(285, 'App\\Models\\User', 76, 'API Token', 'b097ed190beabd3408f01989edc8f467e6b79e2074b77701023419daac362ead', '[\"*\"]', NULL, NULL, '2025-09-07 13:58:49', '2025-09-07 13:58:49', '2025-09-07 19:58:49'),
(284, 'App\\Models\\User', 64, 'API Token', 'c1fd80c079d63f01d91d94d9afe0091d8b5519c02155ea8f107d09c7182e8605', '[\"*\"]', NULL, NULL, '2025-09-07 13:58:48', '2025-09-07 13:58:48', '2025-09-07 19:58:48'),
(283, 'App\\Models\\User', 64, 'API Token', '0e758731690a426ff183228787e4ce20233c8484475453b1770efc0be7b4d00f', '[\"*\"]', NULL, NULL, '2025-09-07 13:58:48', '2025-09-07 13:58:48', '2025-09-07 19:58:48'),
(282, 'App\\Models\\User', 76, 'API Token', '7efcda0ced2cfc9a67a7a18e305439e189624b80c20b05fdffe003e31e36a2ce', '[\"*\"]', NULL, NULL, '2025-09-07 13:44:57', '2025-09-07 13:44:57', '2025-09-07 19:44:57'),
(281, 'App\\Models\\User', 63, 'API Token', 'fd7a5d83c594324f95698a887a3171d9d2f971452a60a7fafb6983624b120bb6', '[\"*\"]', NULL, NULL, '2025-09-07 12:05:05', '2025-09-07 12:05:05', '2025-09-07 18:05:05'),
(280, 'App\\Models\\User', 21, 'API Token', '3a1d130479f703deb150bd4280fdfad71d812c0e6fcd0b02d0f66e9d47eb89d9', '[\"*\"]', NULL, NULL, '2025-09-07 11:59:29', '2025-09-07 11:59:29', '2025-09-07 17:59:29'),
(279, 'App\\Models\\User', 70, 'API Token', '1f4118ecda4e507370b306198d193fd1766adbaa1d613c8efd0982b38b095443', '[\"*\"]', NULL, NULL, '2025-09-07 11:29:00', '2025-09-07 11:29:00', '2025-09-07 17:29:00'),
(278, 'App\\Models\\User', 70, 'API Token', 'a6fcc03597c1a9e6c8e6fa9935a00f521afbebf2f30419e1aaf9b32cdb976e5f', '[\"*\"]', NULL, NULL, '2025-09-07 11:27:35', '2025-09-07 11:27:35', '2025-09-07 17:27:35'),
(277, 'App\\Models\\User', 37, 'API Token', 'f85c36e9c1343fbab19eff1097be9583bce07f118b26d1d42f1c203d90a012a8', '[\"*\"]', NULL, NULL, '2025-09-07 10:58:59', '2025-09-07 10:58:59', '2025-09-07 16:58:59'),
(276, 'App\\Models\\User', 37, 'API Token', '695a5446974967fb7b8b9c5c1e1bc246b74cae5925c98a828b0117ec0cee8e6f', '[\"*\"]', NULL, NULL, '2025-09-07 10:58:59', '2025-09-07 10:58:59', '2025-09-07 16:58:59'),
(275, 'App\\Models\\User', 37, 'API Token', 'a07f893cf8fe31a4bd727c1aa5d1b2e8cdcd6d066a264f71f7f155cbc0a4ff53', '[\"*\"]', NULL, NULL, '2025-09-07 10:58:59', '2025-09-07 10:58:59', '2025-09-07 16:58:59'),
(274, 'App\\Models\\User', 37, 'API Token', 'b636a6e0496aa25d8576959029f991c2ebdf47777eaa8e4d44828a8e597f9d32', '[\"*\"]', NULL, NULL, '2025-09-07 10:58:58', '2025-09-07 10:58:58', '2025-09-07 16:58:58'),
(273, 'App\\Models\\User', 37, 'API Token', 'e0db825de5e13237c6fb4a39036fd85564560d8cab83435b2554f164a6ac04c9', '[\"*\"]', NULL, NULL, '2025-09-07 10:58:55', '2025-09-07 10:58:55', '2025-09-07 16:58:55'),
(272, 'App\\Models\\User', 65, 'API Token', '1f992a066855481ff7d7d704491d97f396b50f5ea4316153de72f3eec8f2cd7e', '[\"*\"]', NULL, NULL, '2025-09-07 10:52:32', '2025-09-07 10:52:32', '2025-09-07 16:52:32'),
(271, 'App\\Models\\User', 63, 'API Token', '4ffa2b35d6f64d7e5f3bcfab8492473b17d7b839c0693751e8dc1f24def9b18e', '[\"*\"]', NULL, NULL, '2025-09-07 10:46:29', '2025-09-07 10:46:29', '2025-09-07 16:46:29'),
(270, 'App\\Models\\User', 63, 'API Token', '7f7dc6c26cc375037859c38dd4627c21bcc6decee571ef8554dda7a273344ff6', '[\"*\"]', NULL, NULL, '2025-09-07 10:43:37', '2025-09-07 10:43:37', '2025-09-07 16:43:37'),
(269, 'App\\Models\\User', 63, 'API Token', '7a11fbb2987a51bf41020a357aeb9e973f73e40ac8719abb65513f822c2ec320', '[\"*\"]', NULL, NULL, '2025-09-07 10:40:43', '2025-09-07 10:40:43', '2025-09-07 16:40:43'),
(268, 'App\\Models\\User', 52, 'API Token', '4f8cb92d59dbbf13fdd5dc2579561213c28bd429cf37c75fc135015acbf91e74', '[\"*\"]', NULL, NULL, '2025-09-07 10:05:09', '2025-09-07 10:05:09', '2025-09-07 16:05:09'),
(267, 'App\\Models\\User', 58, 'API Token', '6b74f2e8db9f9f53113e6dfc03b86e2725aa5ce3ab0f996d72eced9a56352bd9', '[\"*\"]', NULL, NULL, '2025-09-07 09:57:43', '2025-09-07 09:57:43', '2025-09-07 15:57:43'),
(266, 'App\\Models\\User', 58, 'API Token', '6fe7d7d416a5f377a9e07ac75ac1352fd274646784ec1d57242e08788be51192', '[\"*\"]', NULL, NULL, '2025-09-07 09:57:42', '2025-09-07 09:57:42', '2025-09-07 15:57:42'),
(265, 'App\\Models\\User', 35, 'API Token', '51ba0546f6c5beadf0c342bde1926879297408cd0c22f523645702cbeccfc689', '[\"*\"]', NULL, NULL, '2025-09-07 09:49:58', '2025-09-07 09:49:58', '2025-09-07 15:49:58'),
(264, 'App\\Models\\User', 52, 'API Token', '962e0c435e609c6b75f396022135ecd040f1279c5a7070aa3a02f57e6b5464a1', '[\"*\"]', NULL, NULL, '2025-09-07 09:42:49', '2025-09-07 09:42:49', '2025-09-07 15:42:49'),
(263, 'App\\Models\\User', 54, 'API Token', 'e2d0a2ecb090012991a831f33a176bd22bca942c0bc7c9e016531318d5fd7f8c', '[\"*\"]', NULL, NULL, '2025-09-07 09:40:05', '2025-09-07 09:40:05', '2025-09-07 15:40:05'),
(262, 'App\\Models\\User', 1, 'API Token', 'f7a97bc46de97fde73de370c01c91e533ffda87e1bc2c532ee465f245401a3af', '[\"*\"]', NULL, NULL, '2025-09-07 09:19:58', '2025-09-07 09:19:58', '2025-09-07 15:19:58'),
(261, 'App\\Models\\User', 1, 'API Token', 'f9740175ac5287a41e180a14d55bc37d4a22b3ca4a59d36fbda4692ad7581d65', '[\"*\"]', NULL, NULL, '2025-09-07 09:19:58', '2025-09-07 09:19:58', '2025-09-07 15:19:58'),
(260, 'App\\Models\\User', 29, 'API Token', '661e25df54def1cef4fe1e36ffb735360dbed36a490c32eb9ea55350954e2a86', '[\"*\"]', NULL, NULL, '2025-09-07 09:15:12', '2025-09-07 09:15:12', '2025-09-07 15:15:12'),
(259, 'App\\Models\\User', 32, 'API Token', 'aa574300e063e9a75ca7272bc8b7c77f67b1dca767b53efe449e64176e4a25bd', '[\"*\"]', NULL, NULL, '2025-09-07 09:14:48', '2025-09-07 09:14:48', '2025-09-07 15:14:48'),
(258, 'App\\Models\\User', 32, 'API Token', '21dd76eac9d23c7a2763c0c3b1bc5b958113258b22c77adb586148eaeff5b9b4', '[\"*\"]', NULL, NULL, '2025-09-07 09:14:48', '2025-09-07 09:14:48', '2025-09-07 15:14:48'),
(257, 'App\\Models\\User', 32, 'API Token', 'dce2e8bc69791f0ccc9adc2cc728b0b84a1971f085d5345a14390ec8f1424d53', '[\"*\"]', NULL, NULL, '2025-09-07 09:05:07', '2025-09-07 09:05:07', '2025-09-07 15:05:07'),
(256, 'App\\Models\\User', 43, 'API Token', 'a64a121892d0db81e226a0672b7ea549da532867a20d3acfbee9a98f696c02bb', '[\"*\"]', NULL, NULL, '2025-09-07 09:04:49', '2025-09-07 09:04:49', '2025-09-07 15:04:49'),
(255, 'App\\Models\\User', 38, 'API Token', 'c8f04604f7af6573f9f78d6fb172382a67f389e43f326730243d387d064b5b23', '[\"*\"]', NULL, NULL, '2025-09-07 08:56:48', '2025-09-07 08:56:48', '2025-09-07 14:56:48'),
(254, 'App\\Models\\User', 37, 'API Token', '2ec206a27849dda72b9af40f69be529dfb5c24c27584d362f4ddaa3ad3109618', '[\"*\"]', NULL, NULL, '2025-09-07 08:55:29', '2025-09-07 08:55:29', '2025-09-07 14:55:29'),
(253, 'App\\Models\\User', 37, 'API Token', '2f02287687dc33b0ecf3d8fe9dff4581ed7ab832de218b01a8edc2c880119cab', '[\"*\"]', NULL, NULL, '2025-09-07 08:55:27', '2025-09-07 08:55:27', '2025-09-07 14:55:27'),
(252, 'App\\Models\\User', 37, 'API Token', '9b3124371b98517dd0aaf477f89c486e6b690e335eeae3b24da686d0c3cf21b1', '[\"*\"]', NULL, NULL, '2025-09-07 08:55:20', '2025-09-07 08:55:20', '2025-09-07 14:55:20'),
(251, 'App\\Models\\User', 38, 'API Token', '3547f8fc94d2fd25828b91453ce45cd349dacc1d93f46641ec68d13e0e7a9bf4', '[\"*\"]', NULL, NULL, '2025-09-07 08:55:09', '2025-09-07 08:55:09', '2025-09-07 14:55:09'),
(250, 'App\\Models\\User', 37, 'API Token', '53e38f8310c76725811c8bc4c0dad4afd2151d86174c46545b87229c783bf638', '[\"*\"]', NULL, NULL, '2025-09-07 08:53:19', '2025-09-07 08:53:19', '2025-09-07 14:53:19'),
(249, 'App\\Models\\User', 23, 'API Token', 'b2da9eed42258e5d53dfe2e8cd61be42f22ff1889fd6f90b687289a5895fbfb5', '[\"*\"]', NULL, NULL, '2025-09-07 08:53:14', '2025-09-07 08:53:14', '2025-09-07 14:53:14'),
(248, 'App\\Models\\User', 23, 'API Token', '82435c21cffdd2c57f05a5b4363e50a5003469444ac06e220ff356d140bb737e', '[\"*\"]', NULL, NULL, '2025-09-07 08:50:23', '2025-09-07 08:50:23', '2025-09-07 14:50:23'),
(247, 'App\\Models\\User', 29, 'API Token', 'ad3d24f005ea515cfa73859541d9e99395ec0d89ff81c605e861e0eda816fedd', '[\"*\"]', NULL, NULL, '2025-09-07 08:47:30', '2025-09-07 08:47:30', '2025-09-07 14:47:30'),
(246, 'App\\Models\\User', 29, 'API Token', '8267c02ef7af8f5261aaa82c0ecd5efd2769b4bd2f4f4b4c1db2fa67c3cf8fc2', '[\"*\"]', NULL, NULL, '2025-09-07 08:47:28', '2025-09-07 08:47:28', '2025-09-07 14:47:28'),
(245, 'App\\Models\\User', 32, 'API Token', 'f3ec54aa314c0c59c2cbf496a1a1d2816b1fde2ebd46815ba8542c99edd512c5', '[\"*\"]', NULL, NULL, '2025-09-07 08:46:55', '2025-09-07 08:46:55', '2025-09-07 14:46:55'),
(244, 'App\\Models\\User', 32, 'API Token', '1f2889d73d8b617ee76342f0d15869692e4930cae35d7a1065a2d924f575d6cd', '[\"*\"]', NULL, NULL, '2025-09-07 08:46:53', '2025-09-07 08:46:53', '2025-09-07 14:46:53'),
(243, 'App\\Models\\User', 31, 'API Token', '18d7fe7f68d4057d919dab5c4c11ef65e90198dfc094667b12f798b34601242f', '[\"*\"]', NULL, NULL, '2025-09-07 08:46:22', '2025-09-07 08:46:22', '2025-09-07 14:46:22'),
(242, 'App\\Models\\User', 31, 'API Token', '36b3b288b48ccc8b7e5613ef3b32ce0cb204f8a5945b6382bd2603c7138d3784', '[\"*\"]', NULL, NULL, '2025-09-07 08:46:22', '2025-09-07 08:46:22', '2025-09-07 14:46:22'),
(241, 'App\\Models\\User', 31, 'API Token', 'd7a09f951bc9a473830ad7c48ba208eccd7929dcf422bd20fb7940760fe9f8f5', '[\"*\"]', NULL, NULL, '2025-09-07 08:46:21', '2025-09-07 08:46:21', '2025-09-07 14:46:21'),
(240, 'App\\Models\\User', 31, 'API Token', 'd4d5c8608b0fcc3b67c506b075da5d9137a2f2e2344d028a9d61508365916c26', '[\"*\"]', NULL, NULL, '2025-09-07 08:46:05', '2025-09-07 08:46:05', '2025-09-07 14:46:05'),
(239, 'App\\Models\\User', 23, 'API Token', '59f43ad63eb73a33af9c676404f6070ff0c162b43586c9c8c31f7e21e87d3a35', '[\"*\"]', NULL, NULL, '2025-09-07 08:45:30', '2025-09-07 08:45:30', '2025-09-07 14:45:30'),
(238, 'App\\Models\\User', 31, 'API Token', '52470b6a93fec94e21d09efe9ac889371b7010c4d02c3972e0b673b0138aa1af', '[\"*\"]', NULL, NULL, '2025-09-07 08:44:54', '2025-09-07 08:44:54', '2025-09-07 14:44:54'),
(237, 'App\\Models\\User', 23, 'API Token', '2839e5c7ccf9b34400d33829bd944266aa32cb424c67a3e43ca2f76323870676', '[\"*\"]', NULL, NULL, '2025-09-07 08:40:16', '2025-09-07 08:40:16', '2025-09-07 14:40:16'),
(236, 'App\\Models\\User', 16, 'API Token', '95158e961fd9d1ca1664f052dcaa9bf15f7c83745e53a579246253809650f7d4', '[\"*\"]', NULL, NULL, '2025-09-07 08:39:54', '2025-09-07 08:39:54', '2025-09-07 14:39:54'),
(235, 'App\\Models\\User', 19, 'API Token', '7c2c88b7215eabaa5f641ed5afa2390917e7079f450e20fc3582d66990e20346', '[\"*\"]', NULL, NULL, '2025-09-07 08:36:25', '2025-09-07 08:36:25', '2025-09-07 14:36:25'),
(234, 'App\\Models\\User', 19, 'API Token', '04b2a2ea9fcd13bb0b807161278b649edeb2de4172ac8aad2cb4c5b953ffdea0', '[\"*\"]', NULL, NULL, '2025-09-07 08:36:24', '2025-09-07 08:36:24', '2025-09-07 14:36:24'),
(233, 'App\\Models\\User', 23, 'API Token', '0fc1019aac8ff623bec11c341446e65de7a792f8f18cf41b359bf15efdc2fec1', '[\"*\"]', NULL, NULL, '2025-09-07 08:35:36', '2025-09-07 08:35:36', '2025-09-07 14:35:36'),
(232, 'App\\Models\\User', 19, 'API Token', '591104c5b8688b2bef1c032026e857004c06b3e7f59b133a00d2aa07b0c37a31', '[\"*\"]', NULL, NULL, '2025-09-07 08:35:25', '2025-09-07 08:35:25', '2025-09-07 14:35:25'),
(231, 'App\\Models\\User', 15, 'API Token', '866386ea8f8faafd9c39188385accd11eb68f32c39398abd37b1dc251fcc4b24', '[\"*\"]', NULL, NULL, '2025-09-07 08:34:16', '2025-09-07 08:34:16', '2025-09-07 14:34:16'),
(230, 'App\\Models\\User', 1, 'API Token', '826fd9dff95b400f515aaf16686212997e60fe02cf6da40d6c3877cb517f4dcf', '[\"*\"]', NULL, NULL, '2025-09-07 08:26:40', '2025-09-07 08:26:40', '2025-09-07 14:26:40'),
(229, 'App\\Models\\User', 1, 'API Token', '6918e9545634989e157473bd2f7cc52ad4f041c546ea309b260cf265222296b8', '[\"*\"]', NULL, NULL, '2025-09-07 08:18:26', '2025-09-07 08:18:26', '2025-09-07 14:18:26'),
(228, 'App\\Models\\User', 1, 'API Token', 'c993f34e9091c8b15de426181b3cc4f6c82c6ce8fa0a467a07440b33ba61c151', '[\"*\"]', NULL, NULL, '2025-09-07 08:18:26', '2025-09-07 08:18:26', '2025-09-07 14:18:26'),
(227, 'App\\Models\\User', 11, 'API Token', 'b78d4e57388d194f37aa547d99297505aef6eb20aa3dafa589524247d024cf8c', '[\"*\"]', NULL, NULL, '2025-09-07 06:47:23', '2025-09-07 06:47:23', '2025-09-07 12:47:23'),
(226, 'App\\Models\\User', 1, 'API Token', '4c219bd7d7dad0c4b8909f1a4831d5fc2a39e70827800d8dd92bb90bb8fcf646', '[\"*\"]', NULL, NULL, '2025-09-07 04:54:15', '2025-09-07 04:54:15', '2025-09-07 10:54:15'),
(225, 'App\\Models\\User', 1, 'API Token', 'd8f1e930447c37096d586d9cee67270af561008c6f0ee64fe58e328b102fc501', '[\"*\"]', NULL, NULL, '2025-09-07 04:50:45', '2025-09-07 04:50:45', '2025-09-07 10:50:45'),
(224, 'App\\Models\\User', 1, 'API Token', '0e0d9aaa19454054f168f89791623c58cf13cf6e2bcf0c6cf6611d5f23e6acf1', '[\"*\"]', NULL, NULL, '2025-09-07 04:35:41', '2025-09-07 04:35:41', '2025-09-07 10:35:41'),
(223, 'App\\Models\\User', 1, 'API Token', 'e8eb7350e3ead92762c433093e44a0c7ac5beaec18cae6e1938737533b0b8e11', '[\"*\"]', NULL, NULL, '2025-09-05 21:28:21', '2025-09-05 21:28:21', '2025-09-06 03:28:21'),
(222, 'App\\Models\\User', 1, 'API Token', 'c12a2d8fb0ce679d5fc3f0b8c7175d22081f20f4309808e3acef718880306dec', '[\"*\"]', NULL, NULL, '2025-09-05 21:27:58', '2025-09-05 21:27:58', '2025-09-06 03:27:58'),
(221, 'App\\Models\\User', 1, 'API Token', 'b3e2ae9d903d6071c22cfc530e4b26d3d686ca7410e199faf6b773a24f331979', '[\"*\"]', NULL, NULL, '2025-09-05 21:27:53', '2025-09-05 21:27:53', '2025-09-06 03:27:53'),
(220, 'App\\Models\\User', 1, 'API Token', 'bd70d41475ea9e00a42618ae6ec315b69cc1e0668da32c26cc8b3bfd293c788e', '[\"*\"]', NULL, NULL, '2025-09-05 09:09:45', '2025-09-05 09:09:45', '2025-09-05 15:09:45'),
(219, 'App\\Models\\User', 1, 'API Token', '4f8753541aa6793e37ff0c604c46ab4a617f8f8a08bc9cd5c5a57e621b16b46f', '[\"*\"]', NULL, NULL, '2025-09-05 09:09:45', '2025-09-05 09:09:45', '2025-09-05 15:09:45'),
(218, 'App\\Models\\User', 1, 'API Token', 'b358efc1f12881b49b9b0277146d54f3d26d4b6b0e03a11f71dad677436f9f93', '[\"*\"]', NULL, NULL, '2025-09-05 09:09:10', '2025-09-05 09:09:10', '2025-09-05 15:09:10'),
(298, 'App\\Models\\User', 32, 'API Token', 'b8ad4416d9c02db78c1a5db5a3a96a0470cce899c68752eb5c1c292e406bf2a7', '[\"*\"]', NULL, NULL, '2025-09-07 20:57:26', '2025-09-07 20:57:26', '2025-09-08 02:57:26'),
(299, 'App\\Models\\User', 32, 'API Token', '5dbe393f8005531acdf69ad044a7506c830f548d3ddb2ec1d5010f1a6264c0d8', '[\"*\"]', NULL, NULL, '2025-09-07 20:58:28', '2025-09-07 20:58:28', '2025-09-08 02:58:28'),
(300, 'App\\Models\\User', 32, 'API Token', '1338629d91d170cf23136821281449b1ebfcc30ab676eecaa9f407abe35318e8', '[\"*\"]', NULL, NULL, '2025-09-07 20:58:30', '2025-09-07 20:58:30', '2025-09-08 02:58:30'),
(301, 'App\\Models\\User', 1, 'API Token', '8baab401df198781e47edb7bf60e41403830117116c0ff18d047864a11b01a73', '[\"*\"]', NULL, NULL, '2025-09-07 21:00:28', '2025-09-07 21:00:28', '2025-09-08 03:00:28'),
(302, 'App\\Models\\User', 1, 'API Token', '616f6141ef29c1c03b01375d304d370a591730a4bc6c9bb35ea9f94699cacfc2', '[\"*\"]', NULL, NULL, '2025-09-07 21:00:28', '2025-09-07 21:00:28', '2025-09-08 03:00:28'),
(303, 'App\\Models\\User', 1, 'API Token', '7da3f563bc62d618541a263ffd99673ff2079e12a4eb7adb3155869c7681df11', '[\"*\"]', NULL, NULL, '2025-09-07 21:01:37', '2025-09-07 21:01:37', '2025-09-08 03:01:37'),
(304, 'App\\Models\\User', 23, 'API Token', '7cb4a444b5c1ac782ef528d8061cccb12c26aab313326613ce9d6e3ed164b51d', '[\"*\"]', NULL, NULL, '2025-09-07 21:29:08', '2025-09-07 21:29:08', '2025-09-08 03:29:08'),
(305, 'App\\Models\\User', 23, 'API Token', '6907a65c0ecd447d44d0933e9b63d6a28c4720cfae703ccac2bdd257eaa8568c', '[\"*\"]', NULL, NULL, '2025-09-07 21:29:11', '2025-09-07 21:29:11', '2025-09-08 03:29:11'),
(306, 'App\\Models\\User', 23, 'API Token', 'd2fbd6acc7c61d3da83762da492c917e27a285148fca56f4f23a6c61b1db5a47', '[\"*\"]', NULL, NULL, '2025-09-07 21:29:16', '2025-09-07 21:29:16', '2025-09-08 03:29:16'),
(307, 'App\\Models\\User', 23, 'API Token', '22780ce1a89c0122f9482bf4afa28f5bc14e427419be2d49b59f4c7ade727951', '[\"*\"]', NULL, NULL, '2025-09-07 21:29:16', '2025-09-07 21:29:16', '2025-09-08 03:29:16'),
(308, 'App\\Models\\User', 23, 'API Token', '4dc11489d38e3b44292572fbacce2ffdc52d614b55387f8f41cfe8671d984904', '[\"*\"]', NULL, NULL, '2025-09-07 21:30:27', '2025-09-07 21:30:27', '2025-09-08 03:30:27'),
(309, 'App\\Models\\User', 23, 'API Token', '40175f9506ce2096b29eed86fc765704c87bcdc54ed385ea122fa19e0da932a6', '[\"*\"]', NULL, NULL, '2025-09-07 21:30:35', '2025-09-07 21:30:35', '2025-09-08 03:30:35'),
(310, 'App\\Models\\User', 26, 'API Token', '3d0092e5a89029c55c935bf720762830af344d32e8e68867974dfda7bb5d8a81', '[\"*\"]', NULL, NULL, '2025-09-07 21:50:43', '2025-09-07 21:50:43', '2025-09-08 03:50:43'),
(311, 'App\\Models\\User', 26, 'API Token', '5a5a6c796f09de067fe722092b9a29675c58c93afd2f530368ec1a23b79aeab2', '[\"*\"]', NULL, NULL, '2025-09-07 21:50:43', '2025-09-07 21:50:43', '2025-09-08 03:50:43'),
(312, 'App\\Models\\User', 26, 'API Token', 'af7576ffa0bb72346f65939234ed0bcaf9c648d11fbb527182631c07517ffd43', '[\"*\"]', NULL, NULL, '2025-09-07 21:50:47', '2025-09-07 21:50:47', '2025-09-08 03:50:47'),
(313, 'App\\Models\\User', 26, 'API Token', '8fa01ad2e1ca5f64e9ff4322775282bd6443cb99af660af47a45ab6a49fcce38', '[\"*\"]', NULL, NULL, '2025-09-07 21:51:01', '2025-09-07 21:51:01', '2025-09-08 03:51:01'),
(314, 'App\\Models\\User', 26, 'API Token', '984b6ffdd1566cbce39790b28fe6cb8f0febd7ac1b2f8bedff235837961a2d12', '[\"*\"]', NULL, NULL, '2025-09-07 21:51:01', '2025-09-07 21:51:01', '2025-09-08 03:51:01'),
(315, 'App\\Models\\User', 26, 'API Token', '8553ec8c6a79cf366d4f62594311b555bae60eec68efdd7d3c27c2d5b952e63e', '[\"*\"]', NULL, NULL, '2025-09-07 21:51:01', '2025-09-07 21:51:01', '2025-09-08 03:51:01'),
(316, 'App\\Models\\User', 26, 'API Token', '320aa73d79bafe5196be3b5aef7d23f156ac8b8076c0292133688d24643f551e', '[\"*\"]', NULL, NULL, '2025-09-07 21:51:01', '2025-09-07 21:51:01', '2025-09-08 03:51:01'),
(317, 'App\\Models\\User', 26, 'API Token', 'e80235bdefffadb9ed6a3cb76e9e98d3d2a13feb26f2a07fd54239b8527a9b5b', '[\"*\"]', NULL, NULL, '2025-09-07 21:51:06', '2025-09-07 21:51:06', '2025-09-08 03:51:06'),
(318, 'App\\Models\\User', 26, 'API Token', '52c190d26b3c9eacf49d9a66f60586648ccabc88b9d8a254869af723ba8169a3', '[\"*\"]', NULL, NULL, '2025-09-07 21:51:26', '2025-09-07 21:51:26', '2025-09-08 03:51:26'),
(319, 'App\\Models\\User', 26, 'API Token', '2075db5a80f9f87b2e04ac178f3251c31f4d281b2cdfad0cd5a01ad003234f28', '[\"*\"]', NULL, NULL, '2025-09-07 21:51:26', '2025-09-07 21:51:26', '2025-09-08 03:51:26'),
(320, 'App\\Models\\User', 26, 'API Token', 'cf1a03d23d4d00ba3360bb0641dddffe02f455f7720aeb752de43ad93cb62730', '[\"*\"]', NULL, NULL, '2025-09-07 21:51:26', '2025-09-07 21:51:26', '2025-09-08 03:51:26'),
(321, 'App\\Models\\User', 26, 'API Token', 'ba25041ab72cfbc49642d394505a6bfd445158b8761affc2a61f87323e199510', '[\"*\"]', NULL, NULL, '2025-09-07 21:51:26', '2025-09-07 21:51:26', '2025-09-08 03:51:26'),
(322, 'App\\Models\\User', 26, 'API Token', '540565b9c9236874b4809b8b9f1300e984fbe27a59a8db1d1fdd2a31823852c4', '[\"*\"]', NULL, NULL, '2025-09-07 21:52:14', '2025-09-07 21:52:14', '2025-09-08 03:52:14'),
(323, 'App\\Models\\User', 15, 'API Token', 'a30ba953a953eaa67aaf468642e7136daf5eb65e6e97fec66be55564163d5157', '[\"*\"]', NULL, NULL, '2025-09-07 22:23:35', '2025-09-07 22:23:35', '2025-09-08 04:23:35'),
(324, 'App\\Models\\User', 15, 'API Token', '9783ad1742817c42a644a7b818780c33f02b51cc790377ab445015e89fec8723', '[\"*\"]', NULL, NULL, '2025-09-07 22:23:36', '2025-09-07 22:23:36', '2025-09-08 04:23:36'),
(325, 'App\\Models\\User', 15, 'API Token', '68fc29054ad9c0278b385d73c7a888293fc3503c47292f55a325b224813637dc', '[\"*\"]', NULL, NULL, '2025-09-07 22:23:43', '2025-09-07 22:23:43', '2025-09-08 04:23:43'),
(326, 'App\\Models\\User', 15, 'API Token', '89478c1d30358f319e247669372c6bfacb88cd4a4c86d3b9c964871b06502187', '[\"*\"]', NULL, NULL, '2025-09-07 22:23:53', '2025-09-07 22:23:53', '2025-09-08 04:23:53'),
(327, 'App\\Models\\User', 15, 'API Token', '9638ba2a5ee76598bf2a7d5726a0ceec065d33a611df754f79ddb117ccaa00c3', '[\"*\"]', NULL, NULL, '2025-09-07 22:23:53', '2025-09-07 22:23:53', '2025-09-08 04:23:53'),
(328, 'App\\Models\\User', 15, 'API Token', '3e5dd56d07483cf233cb3c7d334bb903b9e00ca4c37606159c591c3e60078b4a', '[\"*\"]', NULL, NULL, '2025-09-07 22:23:55', '2025-09-07 22:23:55', '2025-09-08 04:23:55'),
(329, 'App\\Models\\User', 15, 'API Token', 'a56c0c08b507d2bb72f99b4be198ffd64bca7433e88e3e1c542b69c724d8d77d', '[\"*\"]', NULL, NULL, '2025-09-07 22:23:55', '2025-09-07 22:23:55', '2025-09-08 04:23:55'),
(330, 'App\\Models\\User', 15, 'API Token', '254f3a9d610a76f4e7e178e021d63687132467f7578663c1583c1e37c47dbe21', '[\"*\"]', NULL, NULL, '2025-09-07 22:23:59', '2025-09-07 22:23:59', '2025-09-08 04:23:59'),
(331, 'App\\Models\\User', 11, 'API Token', '657f55d1ae8898aa6e81d9599b936fc68343d82f8f6b11d25ea4cfdb7c2258a7', '[\"*\"]', NULL, NULL, '2025-09-07 22:34:14', '2025-09-07 22:34:14', '2025-09-08 04:34:14'),
(332, 'App\\Models\\User', 76, 'API Token', '8d4be8afe90523823edcb1594970c7e8886c2107461f89aa0e9ca379b94dcd61', '[\"*\"]', NULL, NULL, '2025-09-07 23:19:19', '2025-09-07 23:19:19', '2025-09-08 05:19:19'),
(333, 'App\\Models\\User', 37, 'API Token', 'e721aac521c055edabb96a8b48d75a16582d6f2e01062c8f058801083699af86', '[\"*\"]', NULL, NULL, '2025-09-07 23:52:28', '2025-09-07 23:52:28', '2025-09-08 05:52:28'),
(334, 'App\\Models\\User', 37, 'API Token', 'e7940ba9239cd63a9fc10e633437d4add4ac1b7f5b64830cdc62c6652b022f65', '[\"*\"]', NULL, NULL, '2025-09-07 23:52:29', '2025-09-07 23:52:29', '2025-09-08 05:52:29'),
(335, 'App\\Models\\User', 90, 'API Token', '0fa95b7078aefffab85719fe7ffa8a745c4b3ac445f7ea4fdbf48ec1f0e95b6e', '[\"*\"]', NULL, NULL, '2025-09-08 00:14:52', '2025-09-08 00:14:52', '2025-09-08 06:14:52'),
(336, 'App\\Models\\User', 90, 'API Token', '10f126af5935887396e79b12e190843b86ca333df97dca505112ba86bac347d8', '[\"*\"]', NULL, NULL, '2025-09-08 00:29:17', '2025-09-08 00:29:17', '2025-09-08 06:29:17'),
(337, 'App\\Models\\User', 90, 'API Token', 'e39152d7333cb1b47a6c85faebae9c9a2b80a4a105c6b022b0de1edd1962de13', '[\"*\"]', NULL, NULL, '2025-09-08 00:29:37', '2025-09-08 00:29:37', '2025-09-08 06:29:37'),
(338, 'App\\Models\\User', 90, 'API Token', '122629400f2b999d3fb76771c573e0be43002ce38c2792bf23c6d59b5d358843', '[\"*\"]', NULL, NULL, '2025-09-08 00:42:38', '2025-09-08 00:42:38', '2025-09-08 06:42:38'),
(339, 'App\\Models\\User', 90, 'API Token', 'fbdf4f963fe1961a39c074b935ec33c3c07491fe9eafd2ddc489047714852b6a', '[\"*\"]', NULL, NULL, '2025-09-08 00:42:39', '2025-09-08 00:42:39', '2025-09-08 06:42:39'),
(340, 'App\\Models\\User', 32, 'API Token', '6213373b363b66a814faea01b7ca99ac842750d3e161ac0bfc10d6818013be52', '[\"*\"]', NULL, NULL, '2025-09-08 00:52:45', '2025-09-08 00:52:45', '2025-09-08 06:52:45'),
(341, 'App\\Models\\User', 32, 'API Token', '791819f076da7b1c6ec0d4646a7595666911d0dafeb56e1ffbf9ecd50ddc4bae', '[\"*\"]', NULL, NULL, '2025-09-08 00:52:45', '2025-09-08 00:52:45', '2025-09-08 06:52:45'),
(342, 'App\\Models\\User', 32, 'API Token', 'be139fcdc9d80b826ab4129eb244e113177113acffb00b36aa01706c89d2142e', '[\"*\"]', NULL, NULL, '2025-09-08 00:52:49', '2025-09-08 00:52:49', '2025-09-08 06:52:49'),
(343, 'App\\Models\\User', 32, 'API Token', '415d3edbcbc8e7541931eef7abb4ba5bcafa98bf26d849f684a380676cf8fb9a', '[\"*\"]', NULL, NULL, '2025-09-08 00:52:52', '2025-09-08 00:52:52', '2025-09-08 06:52:52'),
(344, 'App\\Models\\User', 32, 'API Token', '77b91df88a03e5569d620840c010dc2670e3d6b226b90a8901099787891c087a', '[\"*\"]', NULL, NULL, '2025-09-08 00:52:52', '2025-09-08 00:52:52', '2025-09-08 06:52:52'),
(345, 'App\\Models\\User', 32, 'API Token', '5f16414f046f9cfdedf04c2dfc60aac273d9878d3f0631a99caabef3d8fcfc1c', '[\"*\"]', NULL, NULL, '2025-09-08 00:52:53', '2025-09-08 00:52:53', '2025-09-08 06:52:53'),
(346, 'App\\Models\\User', 32, 'API Token', 'c4a2ad7a8f7652fbcd030f97e7be8c89b960233d171a11ad40782a822984d303', '[\"*\"]', NULL, NULL, '2025-09-08 00:52:53', '2025-09-08 00:52:53', '2025-09-08 06:52:53'),
(347, 'App\\Models\\User', 32, 'API Token', 'a5847015946d1fa5237dc023acfef1d826dadae479fe232c82a675191365c622', '[\"*\"]', NULL, NULL, '2025-09-08 00:52:53', '2025-09-08 00:52:53', '2025-09-08 06:52:53'),
(348, 'App\\Models\\User', 15, 'API Token', '7a537cf3340768ec03792ebeb31a28e64483aa0af034db010b756e62ffad8800', '[\"*\"]', NULL, NULL, '2025-09-08 01:10:58', '2025-09-08 01:10:58', '2025-09-08 07:10:58'),
(349, 'App\\Models\\User', 15, 'API Token', '1e01be056655fa99251254097468440f6248aace1bf26ff04291003152c6e60d', '[\"*\"]', NULL, NULL, '2025-09-08 01:10:58', '2025-09-08 01:10:58', '2025-09-08 07:10:58'),
(350, 'App\\Models\\User', 15, 'API Token', 'b81823d62756c32f823e6f9343486c0f5eb06922cf789c60065057083e41da16', '[\"*\"]', NULL, NULL, '2025-09-08 01:10:58', '2025-09-08 01:10:58', '2025-09-08 07:10:58'),
(351, 'App\\Models\\User', 15, 'API Token', 'cc6cb7e0767d7df78e6e2f22a7b71dc2ac50ee39f5ce8e029f8f2b3eb1e485db', '[\"*\"]', NULL, NULL, '2025-09-08 01:11:21', '2025-09-08 01:11:21', '2025-09-08 07:11:21'),
(352, 'App\\Models\\User', 15, 'API Token', '9b4dade208d75845664bb1f53502476d8a06bdc7920cbca0870314da24ae2c11', '[\"*\"]', NULL, NULL, '2025-09-08 01:11:21', '2025-09-08 01:11:21', '2025-09-08 07:11:21'),
(353, 'App\\Models\\User', 43, 'API Token', '6ed06ea6be5dba419de1977b280471972adbb439151363a97f2b6ea4af61223d', '[\"*\"]', NULL, NULL, '2025-09-08 01:16:12', '2025-09-08 01:16:12', '2025-09-08 07:16:12'),
(354, 'App\\Models\\User', 43, 'API Token', 'dcf3451ba7b989f92c90ea3bec3b0b31bf8daeae7011b121460737d791873b55', '[\"*\"]', NULL, NULL, '2025-09-08 01:16:12', '2025-09-08 01:16:12', '2025-09-08 07:16:12'),
(355, 'App\\Models\\User', 43, 'API Token', 'dc06ecf5db3c768a86e9021b575a662e44def19564a117a9251d099db4e723ea', '[\"*\"]', NULL, NULL, '2025-09-08 01:16:14', '2025-09-08 01:16:14', '2025-09-08 07:16:14'),
(356, 'App\\Models\\User', 43, 'API Token', '7b1006d2fd8ba7082e37fcbecdcadad97d2907a10d9314e5f482c8c745547c45', '[\"*\"]', NULL, NULL, '2025-09-08 01:16:17', '2025-09-08 01:16:17', '2025-09-08 07:16:17'),
(357, 'App\\Models\\User', 43, 'API Token', 'c229985f12f56a76107465650eb3646128d6db857cd2eb3f59cb635550cbcce9', '[\"*\"]', NULL, NULL, '2025-09-08 01:16:17', '2025-09-08 01:16:17', '2025-09-08 07:16:17'),
(358, 'App\\Models\\User', 43, 'API Token', '95fdbb3fe0f3e0795f71e77de3176d2cdab17930b3b238ca49eb8585878271eb', '[\"*\"]', NULL, NULL, '2025-09-08 01:16:18', '2025-09-08 01:16:18', '2025-09-08 07:16:18'),
(359, 'App\\Models\\User', 43, 'API Token', '89ac393ea8432e543a3d75a76fd8d9c54d1e18882dd7193ed97093103cae9d4e', '[\"*\"]', NULL, NULL, '2025-09-08 01:16:20', '2025-09-08 01:16:20', '2025-09-08 07:16:20'),
(360, 'App\\Models\\User', 43, 'API Token', 'd2c099b39a15b506db435a1eaec5375e1dc600a054f5ce65c421970fe458ded4', '[\"*\"]', NULL, NULL, '2025-09-08 01:16:20', '2025-09-08 01:16:20', '2025-09-08 07:16:20'),
(361, 'App\\Models\\User', 43, 'API Token', '91fce67be47b19bc225bb4c39dd8d23ca96799885f14591500637a8389735c9f', '[\"*\"]', NULL, NULL, '2025-09-08 01:16:20', '2025-09-08 01:16:20', '2025-09-08 07:16:20'),
(362, 'App\\Models\\User', 43, 'API Token', '9340ad8a3999ddc5fdb833d290cae48664836b2a1aca4401b61fa9770308904b', '[\"*\"]', NULL, NULL, '2025-09-08 01:16:27', '2025-09-08 01:16:27', '2025-09-08 07:16:27'),
(363, 'App\\Models\\User', 43, 'API Token', 'f2b38a11cc0313965d5db4d21e2e2edf022476a7d6e2b2f95c0cac31a4925f6c', '[\"*\"]', NULL, NULL, '2025-09-08 01:16:27', '2025-09-08 01:16:27', '2025-09-08 07:16:27'),
(364, 'App\\Models\\User', 43, 'API Token', '04cdadd15b4f256b7638f8205ecd0780b56a52f041adae1b5d999438757ab82b', '[\"*\"]', NULL, NULL, '2025-09-08 01:16:27', '2025-09-08 01:16:27', '2025-09-08 07:16:27'),
(365, 'App\\Models\\User', 43, 'API Token', 'bac607e8e32471538f02c94a80107cf0fb7171f7dc9b468b59500e7a8c418189', '[\"*\"]', NULL, NULL, '2025-09-08 01:16:29', '2025-09-08 01:16:29', '2025-09-08 07:16:29'),
(366, 'App\\Models\\User', 43, 'API Token', 'c1253b1934abc6ba1c95adae21426b4804b8b6da9fb49734e530f79c52188902', '[\"*\"]', NULL, NULL, '2025-09-08 01:16:29', '2025-09-08 01:16:29', '2025-09-08 07:16:29'),
(367, 'App\\Models\\User', 43, 'API Token', '71911f9450ab132d35686c1f6ba33fa27c30ea514a52630f6b5230a0866b9cb0', '[\"*\"]', NULL, NULL, '2025-09-08 01:16:29', '2025-09-08 01:16:29', '2025-09-08 07:16:29'),
(368, 'App\\Models\\User', 43, 'API Token', '078a753180de0f321381c3d9375fabca2d39cd0b57b4f5ed5ff4310191fa5f37', '[\"*\"]', NULL, NULL, '2025-09-08 01:16:29', '2025-09-08 01:16:29', '2025-09-08 07:16:29'),
(369, 'App\\Models\\User', 43, 'API Token', 'ca13e934495d52201fbc019158c96e8ae5b75b2b896a4d88f314fc28ed64fff0', '[\"*\"]', NULL, NULL, '2025-09-08 01:16:29', '2025-09-08 01:16:29', '2025-09-08 07:16:29'),
(370, 'App\\Models\\User', 43, 'API Token', 'd205e837d2498a9ddc4618ca395e241a3c7eb3defe5eba337704fed0c35f3a2b', '[\"*\"]', NULL, NULL, '2025-09-08 01:16:30', '2025-09-08 01:16:30', '2025-09-08 07:16:30'),
(371, 'App\\Models\\User', 43, 'API Token', '63fbe51848a39192fd2e3b8ee9c233a64ef8d8127a1151f463f2182d7adee5a6', '[\"*\"]', NULL, NULL, '2025-09-08 01:16:30', '2025-09-08 01:16:30', '2025-09-08 07:16:30'),
(372, 'App\\Models\\User', 43, 'API Token', 'fd058e55003f7509d07bc50c24a48664d17ca59fd515508bbda33cc436e7520f', '[\"*\"]', NULL, NULL, '2025-09-08 01:16:37', '2025-09-08 01:16:37', '2025-09-08 07:16:37'),
(373, 'App\\Models\\User', 43, 'API Token', 'b174996243b9001385234c95db02c4c8fbbcb3ae91bd5fb1d3846befc74f80ab', '[\"*\"]', NULL, NULL, '2025-09-08 01:16:38', '2025-09-08 01:16:38', '2025-09-08 07:16:38'),
(374, 'App\\Models\\User', 43, 'API Token', '6268622d3af413bc950b37e007825aa60c1826fd434a886d235c9cb4055c4fa9', '[\"*\"]', NULL, NULL, '2025-09-08 01:16:38', '2025-09-08 01:16:38', '2025-09-08 07:16:38'),
(375, 'App\\Models\\User', 43, 'API Token', 'd49646834e3856d2e19bd2d235409ea7c8204e1d83345e4c873a0450c46d8cf7', '[\"*\"]', NULL, NULL, '2025-09-08 01:16:38', '2025-09-08 01:16:38', '2025-09-08 07:16:38'),
(376, 'App\\Models\\User', 43, 'API Token', 'e80c4e3d5b0db000f3f0fab7e3f1176149e7e52d1ddd622768e3eaea9f139cb3', '[\"*\"]', NULL, NULL, '2025-09-08 01:16:38', '2025-09-08 01:16:38', '2025-09-08 07:16:38'),
(377, 'App\\Models\\User', 43, 'API Token', 'fc8a9f0a839b4b093b07ca3440d75bc43b48e30315c1c0087b25d0b32045adf2', '[\"*\"]', NULL, NULL, '2025-09-08 01:16:38', '2025-09-08 01:16:38', '2025-09-08 07:16:38'),
(378, 'App\\Models\\User', 43, 'API Token', 'c2c4df405cded96fa1112f92b514a569af9f2756655c904806aee13dbeec93ec', '[\"*\"]', NULL, NULL, '2025-09-08 01:16:38', '2025-09-08 01:16:38', '2025-09-08 07:16:38'),
(379, 'App\\Models\\User', 43, 'API Token', '024e549350698dbfec47c1c3cca3cb520fa1425689418c5176930b99bca593ac', '[\"*\"]', NULL, NULL, '2025-09-08 01:16:38', '2025-09-08 01:16:38', '2025-09-08 07:16:38'),
(380, 'App\\Models\\User', 43, 'API Token', 'b8ebafcf049bd98c87d7f870189641eb6d000970eef09a0fc1789ffb7d4096df', '[\"*\"]', NULL, NULL, '2025-09-08 01:16:38', '2025-09-08 01:16:38', '2025-09-08 07:16:38'),
(381, 'App\\Models\\User', 43, 'API Token', 'bddecaed0bf994f915fe56ba877bfe46a311e5f52c6f6fb71e64ec6ca0825ccc', '[\"*\"]', NULL, NULL, '2025-09-08 01:16:38', '2025-09-08 01:16:38', '2025-09-08 07:16:39'),
(382, 'App\\Models\\User', 43, 'API Token', '6d726d69d37bf5bcf9725d58d815af1d6f540ec7147ad56ebb2c7d8ae5854ea3', '[\"*\"]', NULL, NULL, '2025-09-08 01:16:42', '2025-09-08 01:16:42', '2025-09-08 07:16:42'),
(383, 'App\\Models\\User', 43, 'API Token', '711f4e75992100d43e62bdc414ff5005fc394dec817c82069b4777ad0fafdaca', '[\"*\"]', NULL, NULL, '2025-09-08 01:16:43', '2025-09-08 01:16:43', '2025-09-08 07:16:43'),
(384, 'App\\Models\\User', 43, 'API Token', 'b90a3f4e93da691424df91d065158ce3b56e06a9be5f9a43ad51761874171545', '[\"*\"]', NULL, NULL, '2025-09-08 01:16:43', '2025-09-08 01:16:43', '2025-09-08 07:16:43'),
(385, 'App\\Models\\User', 43, 'API Token', 'e759d06d1dd6b3a4b74764a1637b2b8a260aaacf2b1cb3c9bf4fb6ef7758911b', '[\"*\"]', NULL, NULL, '2025-09-08 01:16:43', '2025-09-08 01:16:43', '2025-09-08 07:16:43'),
(386, 'App\\Models\\User', 43, 'API Token', '6533b90711f27169cb782e1092a53ac128de8cac3fd563b13107c023c3ce68e8', '[\"*\"]', NULL, NULL, '2025-09-08 01:16:43', '2025-09-08 01:16:43', '2025-09-08 07:16:43'),
(387, 'App\\Models\\User', 43, 'API Token', 'e0eb030c53d9494f95992d95886000b4ec6a9e77d05c08c9aeefdef23b6faa58', '[\"*\"]', NULL, NULL, '2025-09-08 01:16:43', '2025-09-08 01:16:43', '2025-09-08 07:16:43'),
(388, 'App\\Models\\User', 43, 'API Token', 'a9c35db60f120be94ac1853705aea33bbc80cf2b691dcf988793e009b63e6610', '[\"*\"]', NULL, NULL, '2025-09-08 01:16:43', '2025-09-08 01:16:43', '2025-09-08 07:16:43'),
(389, 'App\\Models\\User', 43, 'API Token', '60ff03a01c605b2d09c3a1d88a208df8f6c4dbdb14f7616be5bd51c955b4a581', '[\"*\"]', NULL, NULL, '2025-09-08 01:16:44', '2025-09-08 01:16:44', '2025-09-08 07:16:44'),
(390, 'App\\Models\\User', 43, 'API Token', 'c33c0f95e42d764ae0721d9774be6237355d48ffbbfe565ae357a680c27a7329', '[\"*\"]', NULL, NULL, '2025-09-08 01:16:45', '2025-09-08 01:16:45', '2025-09-08 07:16:45'),
(391, 'App\\Models\\User', 43, 'API Token', '92159f95e84dcc8e7ae79ea09184203cadfd6259e287fbdfddb53b02b8253f0c', '[\"*\"]', NULL, NULL, '2025-09-08 01:16:45', '2025-09-08 01:16:45', '2025-09-08 07:16:45'),
(392, 'App\\Models\\User', 43, 'API Token', 'e2936e78457e36b0dcb3f8cf1e315aa79bd5f1a2ec3f028d0f5b00441162b317', '[\"*\"]', NULL, NULL, '2025-09-08 01:16:47', '2025-09-08 01:16:47', '2025-09-08 07:16:47'),
(393, 'App\\Models\\User', 43, 'API Token', 'af1da35691d4812166493fa30888773d53685e0cd2fb84fe27c8f8062f247749', '[\"*\"]', NULL, NULL, '2025-09-08 01:16:48', '2025-09-08 01:16:48', '2025-09-08 07:16:48'),
(394, 'App\\Models\\User', 43, 'API Token', '59c10ffea22ea3688f6b4ab22ff804c01a480ad6da9b98c64f70ef57ff343942', '[\"*\"]', NULL, NULL, '2025-09-08 01:16:48', '2025-09-08 01:16:48', '2025-09-08 07:16:48'),
(395, 'App\\Models\\User', 43, 'API Token', '051c0d6626e0dbc805650879b4fb4375a6a4df08b518eb6686aa7ad9034e1dc1', '[\"*\"]', NULL, NULL, '2025-09-08 01:16:49', '2025-09-08 01:16:49', '2025-09-08 07:16:49'),
(396, 'App\\Models\\User', 43, 'API Token', '8cd4d13df2e010f32c339945c4a4cbc248d6af51a097a350a8e9be53c0cd72ee', '[\"*\"]', NULL, NULL, '2025-09-08 01:16:49', '2025-09-08 01:16:49', '2025-09-08 07:16:49'),
(397, 'App\\Models\\User', 43, 'API Token', 'f8b873c735a7cd6f5ac0be31f5afa6ba634481139c501b0a5ddaa170f0085d70', '[\"*\"]', NULL, NULL, '2025-09-08 01:16:49', '2025-09-08 01:16:49', '2025-09-08 07:16:49'),
(398, 'App\\Models\\User', 43, 'API Token', 'd03ec17d6cea8fdaa2b52ed20c11d15133f3102413651777f10ac7481c822f9f', '[\"*\"]', NULL, NULL, '2025-09-08 01:16:49', '2025-09-08 01:16:49', '2025-09-08 07:16:49'),
(399, 'App\\Models\\User', 43, 'API Token', '073190da4423de3c82f8ac9f5565acf023b19ab2bab89262de77dfe1b96957ce', '[\"*\"]', NULL, NULL, '2025-09-08 01:16:50', '2025-09-08 01:16:50', '2025-09-08 07:16:50'),
(400, 'App\\Models\\User', 43, 'API Token', '7cc72d69ff97197e19737336154f7ac3cf311342ceb9847661e2d31b2a6b7c50', '[\"*\"]', NULL, NULL, '2025-09-08 01:16:51', '2025-09-08 01:16:51', '2025-09-08 07:16:51'),
(401, 'App\\Models\\User', 43, 'API Token', 'f4f457b092965c27f0229f58d70a9c62ccd9e634cb9b539e2d6a6dd91639db91', '[\"*\"]', NULL, NULL, '2025-09-08 01:16:51', '2025-09-08 01:16:51', '2025-09-08 07:16:51'),
(402, 'App\\Models\\User', 43, 'API Token', '9724d0c2e659864904b70878c0be78cc2c07c505bc044aa1c12dd5783952957b', '[\"*\"]', NULL, NULL, '2025-09-08 01:16:52', '2025-09-08 01:16:52', '2025-09-08 07:16:52'),
(403, 'App\\Models\\User', 43, 'API Token', 'c0f8390d5bbb19862324d32d88470dc1802d6bee11d3e2bb831da1cdaf86d469', '[\"*\"]', NULL, NULL, '2025-09-08 01:16:52', '2025-09-08 01:16:52', '2025-09-08 07:16:52'),
(404, 'App\\Models\\User', 43, 'API Token', '7516b97ad429b367ec73f945e5bd214fc289ccc90f76a54a8fbabefa3614fd88', '[\"*\"]', NULL, NULL, '2025-09-08 01:16:53', '2025-09-08 01:16:53', '2025-09-08 07:16:53'),
(405, 'App\\Models\\User', 43, 'API Token', '0693e05f0453f3e38bf62d7c90e9f4a6cf33365fd68cd1a459162713b2f79cd4', '[\"*\"]', NULL, NULL, '2025-09-08 01:16:54', '2025-09-08 01:16:54', '2025-09-08 07:16:54'),
(406, 'App\\Models\\User', 43, 'API Token', '398095d977bce31e3a9b29ed1a5d510e552d5a10b90dcd6cbfe40f4a56bc6e37', '[\"*\"]', NULL, NULL, '2025-09-08 01:16:55', '2025-09-08 01:16:55', '2025-09-08 07:16:55'),
(407, 'App\\Models\\User', 43, 'API Token', '470edb270fa8a710bbe4f9361fe35fff7292877f68fdd395de4676aa549d93b7', '[\"*\"]', NULL, NULL, '2025-09-08 01:16:56', '2025-09-08 01:16:56', '2025-09-08 07:16:56'),
(408, 'App\\Models\\User', 43, 'API Token', 'c2d534ec6a9821159123a4751095f6dd7f267b1e1f758305444370e11ab49859', '[\"*\"]', NULL, NULL, '2025-09-08 01:16:56', '2025-09-08 01:16:56', '2025-09-08 07:16:56'),
(409, 'App\\Models\\User', 43, 'API Token', '34bb62f84a24c24b54a5b094cdbe315bc766c719653c3526dc83e2a39605286f', '[\"*\"]', NULL, NULL, '2025-09-08 01:16:56', '2025-09-08 01:16:56', '2025-09-08 07:16:56'),
(410, 'App\\Models\\User', 43, 'API Token', 'e8cc426d78542b0e9e3a948956e3e6615b16c449a07817459c81450e1e942a42', '[\"*\"]', NULL, NULL, '2025-09-08 01:16:56', '2025-09-08 01:16:56', '2025-09-08 07:16:56'),
(411, 'App\\Models\\User', 43, 'API Token', '0784ebb27437cd8676c76b1e657de126fbca950606b7f84177da5834d08c74f5', '[\"*\"]', NULL, NULL, '2025-09-08 01:16:57', '2025-09-08 01:16:57', '2025-09-08 07:16:57'),
(412, 'App\\Models\\User', 43, 'API Token', '60080b8e7eb0810add461611d64b926ab9d53b3b4ad2495592112c9fbcb3c035', '[\"*\"]', NULL, NULL, '2025-09-08 01:16:57', '2025-09-08 01:16:57', '2025-09-08 07:16:58'),
(413, 'App\\Models\\User', 43, 'API Token', '6b7bee70919184785c3ac8502712dd0ab1501e8249b514a8839a40686ae5f701', '[\"*\"]', NULL, NULL, '2025-09-08 01:16:59', '2025-09-08 01:16:59', '2025-09-08 07:16:59'),
(414, 'App\\Models\\User', 43, 'API Token', 'fa4183b1c5da3622003b646254df13b7062623c8dae53befc115a1ca0aa62efa', '[\"*\"]', NULL, NULL, '2025-09-08 01:16:59', '2025-09-08 01:16:59', '2025-09-08 07:16:59'),
(415, 'App\\Models\\User', 43, 'API Token', 'edeca805c7b78ed0bff8241521d0d3f0466dbc47e1652704ded28c5a798804d1', '[\"*\"]', NULL, NULL, '2025-09-08 01:17:01', '2025-09-08 01:17:01', '2025-09-08 07:17:01'),
(416, 'App\\Models\\User', 43, 'API Token', '61c50d90eefa6db2c5582f66b5f18c67529aa2620ba88ff5b18844eb4b8c3ee8', '[\"*\"]', NULL, NULL, '2025-09-08 01:17:01', '2025-09-08 01:17:01', '2025-09-08 07:17:01'),
(417, 'App\\Models\\User', 43, 'API Token', 'b4bd98b5d2174eaa221c27a1a13dcd2e2b3759ab793a993420373eab0fb3a71c', '[\"*\"]', NULL, NULL, '2025-09-08 01:17:02', '2025-09-08 01:17:02', '2025-09-08 07:17:02'),
(418, 'App\\Models\\User', 43, 'API Token', 'fff413c09794f9017a541c0ecf3cf8420897c9de6db3fae72ae7ae521201bf66', '[\"*\"]', NULL, NULL, '2025-09-08 01:17:02', '2025-09-08 01:17:02', '2025-09-08 07:17:02'),
(419, 'App\\Models\\User', 43, 'API Token', '950f22ba78e29e4c86c4cb9f316d48a2e3f7b2bd7f1d044c12e85c1714c04b80', '[\"*\"]', NULL, NULL, '2025-09-08 01:17:04', '2025-09-08 01:17:04', '2025-09-08 07:17:04'),
(420, 'App\\Models\\User', 43, 'API Token', '3fab42c0867206b14238febbbaaae17e076d4f81e49c38667a297982f767c330', '[\"*\"]', NULL, NULL, '2025-09-08 01:17:05', '2025-09-08 01:17:05', '2025-09-08 07:17:05'),
(421, 'App\\Models\\User', 43, 'API Token', '535ec98eb83b348434943d892a87acbb63de0e34f5c84e9f69e2c00cadc13101', '[\"*\"]', NULL, NULL, '2025-09-08 01:17:05', '2025-09-08 01:17:05', '2025-09-08 07:17:05'),
(422, 'App\\Models\\User', 43, 'API Token', '4476db13388b881d63b9a892e2327e5ba2ba94c968809000852201206a00d9a2', '[\"*\"]', NULL, NULL, '2025-09-08 01:17:07', '2025-09-08 01:17:07', '2025-09-08 07:17:07'),
(423, 'App\\Models\\User', 43, 'API Token', '42b3550e602b91de865947ff8d1b765858e05ca1ca81cfbeffb598c40d5e09da', '[\"*\"]', NULL, NULL, '2025-09-08 01:17:07', '2025-09-08 01:17:07', '2025-09-08 07:17:07'),
(424, 'App\\Models\\User', 43, 'API Token', '68c3c7fbe6929ee40e12234c76f416794560b11d728d1fe490b62e4d17935555', '[\"*\"]', NULL, NULL, '2025-09-08 01:17:07', '2025-09-08 01:17:07', '2025-09-08 07:17:07'),
(425, 'App\\Models\\User', 43, 'API Token', 'a8794e2e6698485d09efc034e211787951694c335e044259b9170e165775c3ad', '[\"*\"]', NULL, NULL, '2025-09-08 01:17:07', '2025-09-08 01:17:07', '2025-09-08 07:17:07'),
(426, 'App\\Models\\User', 43, 'API Token', '70cc9eb9889524a7641a5b3c497d9d31800474ebbf7f939881ade89f8f36231e', '[\"*\"]', NULL, NULL, '2025-09-08 01:17:08', '2025-09-08 01:17:08', '2025-09-08 07:17:08'),
(427, 'App\\Models\\User', 43, 'API Token', 'd13845b7083549bdf09dfaf88830af72a43bdb5ef8759f7849c71dd713f57f73', '[\"*\"]', NULL, NULL, '2025-09-08 01:17:08', '2025-09-08 01:17:08', '2025-09-08 07:17:08'),
(428, 'App\\Models\\User', 43, 'API Token', 'd7d94ef6b3133acce416d0ff29f827e5ea677850ba708d884bedfc2599e804cf', '[\"*\"]', NULL, NULL, '2025-09-08 01:17:08', '2025-09-08 01:17:08', '2025-09-08 07:17:08'),
(429, 'App\\Models\\User', 43, 'API Token', '766f553826fbedeb648fa24dd675e17b880fa9ccabb9e6556395202216d5f96e', '[\"*\"]', NULL, NULL, '2025-09-08 01:17:09', '2025-09-08 01:17:09', '2025-09-08 07:17:09'),
(430, 'App\\Models\\User', 43, 'API Token', 'cb7bcd56373ffcbd4f471a01e9af6017faca835fd003a4e4028c1f0ae3b29cb0', '[\"*\"]', NULL, NULL, '2025-09-08 01:17:13', '2025-09-08 01:17:13', '2025-09-08 07:17:13'),
(431, 'App\\Models\\User', 43, 'API Token', 'bc71fb936ff3f22e6eab18e38730399d854ef13b98178ab04abbab727f226145', '[\"*\"]', NULL, NULL, '2025-09-08 01:17:13', '2025-09-08 01:17:13', '2025-09-08 07:17:13'),
(432, 'App\\Models\\User', 43, 'API Token', 'c18b55ea8d294139b4754f0e4eea5e1a0b57e5af6bc055efd784704cf177fb61', '[\"*\"]', NULL, NULL, '2025-09-08 01:17:13', '2025-09-08 01:17:13', '2025-09-08 07:17:13'),
(433, 'App\\Models\\User', 43, 'API Token', '8f447ffa2295f0f09b9f369a1cb7091a457fce6ac380882b7364d452cd649ae8', '[\"*\"]', NULL, NULL, '2025-09-08 01:17:13', '2025-09-08 01:17:13', '2025-09-08 07:17:13'),
(434, 'App\\Models\\User', 43, 'API Token', 'f49868c22eb9f2d888e299176aba65aa5dfff761cf1eeb371d580257e92ecdd2', '[\"*\"]', NULL, NULL, '2025-09-08 01:17:13', '2025-09-08 01:17:13', '2025-09-08 07:17:13'),
(435, 'App\\Models\\User', 91, 'API Token', 'b6f6e60c907407980fb94bf26e059c8ee34eb8aa3d8b569ab3ea3e1698cbaf3d', '[\"*\"]', NULL, NULL, '2025-09-08 01:24:48', '2025-09-08 01:24:48', '2025-09-08 07:24:48'),
(436, 'App\\Models\\User', 32, 'API Token', '4bab45730255909ad5e11c571acbef502d3d19a27f87b62af3e9d6d1030a2568', '[\"*\"]', NULL, NULL, '2025-09-08 02:32:16', '2025-09-08 02:32:16', '2025-09-08 08:32:16'),
(437, 'App\\Models\\User', 76, 'API Token', 'ec98f8cefc3f213df34a1ded85aa6e7fdc02cf3b8647492e29d5a7f4c52145e1', '[\"*\"]', NULL, NULL, '2025-09-08 02:49:21', '2025-09-08 02:49:21', '2025-09-08 08:49:21'),
(438, 'App\\Models\\User', 91, 'API Token', '756e1f8543500bde28c439be74fa36d2efc2111cf1c4afb2f75636e5b3914c48', '[\"*\"]', NULL, NULL, '2025-09-08 04:42:19', '2025-09-08 04:42:19', '2025-09-08 10:42:19'),
(439, 'App\\Models\\User', 91, 'API Token', '250857bf141a812e0f19d04c6c38e2fefddd13f97a64857580d65962869ce5ad', '[\"*\"]', NULL, NULL, '2025-09-08 04:42:21', '2025-09-08 04:42:21', '2025-09-08 10:42:21'),
(440, 'App\\Models\\User', 91, 'API Token', 'afa4f7f302a0323608356359aa42c3aaa68efc087c657b425e020c4880da5cdc', '[\"*\"]', NULL, NULL, '2025-09-08 04:42:21', '2025-09-08 04:42:21', '2025-09-08 10:42:21'),
(441, 'App\\Models\\User', 42, 'API Token', '5bc1a969cb963228a5a849848c2b0bfadfffc400caf7bb30ca19155660595212', '[\"*\"]', NULL, NULL, '2025-09-08 06:04:13', '2025-09-08 06:04:13', '2025-09-08 12:04:13'),
(442, 'App\\Models\\User', 65, 'API Token', 'cc7370928815a4f80b7dfa6a438993718e0138fc7b01fae44b5026378ebacc67', '[\"*\"]', NULL, NULL, '2025-09-08 07:26:33', '2025-09-08 07:26:33', '2025-09-08 13:26:33'),
(443, 'App\\Models\\User', 65, 'API Token', '803408eaab9b892fa352a25d8f173f43c4721d697be6c91a5c965898da356986', '[\"*\"]', NULL, NULL, '2025-09-08 07:26:33', '2025-09-08 07:26:33', '2025-09-08 13:26:33'),
(444, 'App\\Models\\User', 65, 'API Token', '8c6bde0c46d8db69c2fe987510b3201db12dddc148154c73a1c2073473be2031', '[\"*\"]', NULL, NULL, '2025-09-08 07:26:44', '2025-09-08 07:26:44', '2025-09-08 13:26:44'),
(445, 'App\\Models\\User', 65, 'API Token', '306cd06646d03f5202188eac6eacb67069dbebfb51095c06c0ca733e5c3a4737', '[\"*\"]', NULL, NULL, '2025-09-08 07:26:44', '2025-09-08 07:26:44', '2025-09-08 13:26:44'),
(446, 'App\\Models\\User', 35, 'API Token', '79c40755a7aacc93f9a9658472ff31638fc6e85d48dd6ab769438364a1156f1b', '[\"*\"]', NULL, NULL, '2025-09-08 08:02:35', '2025-09-08 08:02:35', '2025-09-08 14:02:35'),
(447, 'App\\Models\\User', 32, 'API Token', '0a87ad876897aabd461b0baa9df2fc9b469054dfd296de8d4e2b472daf7103ab', '[\"*\"]', NULL, NULL, '2025-09-08 08:38:09', '2025-09-08 08:38:09', '2025-09-08 14:38:09'),
(448, 'App\\Models\\User', 32, 'API Token', '3f22bad383438f5e945a8fe75c842b60c5d385704ad37bff22ac48cd2ac0d625', '[\"*\"]', NULL, NULL, '2025-09-08 08:38:10', '2025-09-08 08:38:10', '2025-09-08 14:38:10'),
(449, 'App\\Models\\User', 15, 'API Token', '4677cff1756e77f4355b35a8e4388cf2ba1a0c79cb8b1d913bd22522c28a853a', '[\"*\"]', NULL, NULL, '2025-09-08 09:09:34', '2025-09-08 09:09:34', '2025-09-08 15:09:34'),
(450, 'App\\Models\\User', 15, 'API Token', '45288bf49016af39d8463c19dd84d0a1dc6a9f487f1b08a67af979fcd3dd97e4', '[\"*\"]', NULL, NULL, '2025-09-08 09:09:34', '2025-09-08 09:09:34', '2025-09-08 15:09:34'),
(451, 'App\\Models\\User', 15, 'API Token', '582f4de46b6c7b7553683c45f7520d153a359c79090d1024332ff98f783d0764', '[\"*\"]', NULL, NULL, '2025-09-08 09:09:34', '2025-09-08 09:09:34', '2025-09-08 15:09:34'),
(452, 'App\\Models\\User', 15, 'API Token', '66872c1d575e8a9df357e93f4f0fd7709572f4592c62f6d5dc7833ec11888b9b', '[\"*\"]', NULL, NULL, '2025-09-08 09:09:34', '2025-09-08 09:09:34', '2025-09-08 15:09:35'),
(453, 'App\\Models\\User', 15, 'API Token', '74ccb935a8c4628dcd5357cb5ebfc6357bef6bfeb2a89a18238adb70fe8306ca', '[\"*\"]', NULL, NULL, '2025-09-08 09:09:35', '2025-09-08 09:09:35', '2025-09-08 15:09:35'),
(454, 'App\\Models\\User', 61, 'API Token', '1b4d01e8c624701ca0f27f3d3e918717518dede13b1fda52f1c9ac7a11d90c83', '[\"*\"]', NULL, NULL, '2025-09-08 10:25:51', '2025-09-08 10:25:51', '2025-09-08 16:25:51'),
(455, 'App\\Models\\User', 70, 'API Token', '90f25b5963930677af021ddb6973d74a30b386b727e17b629c0fe3f3b6da8611', '[\"*\"]', NULL, NULL, '2025-09-08 10:37:50', '2025-09-08 10:37:50', '2025-09-08 16:37:50'),
(456, 'App\\Models\\User', 70, 'API Token', 'fe651abc6a634c6d141c0df3e6454ab251e3f70640bec9cc1579ab0deaa5fb73', '[\"*\"]', NULL, NULL, '2025-09-08 10:56:48', '2025-09-08 10:56:48', '2025-09-08 16:56:48'),
(457, 'App\\Models\\User', 23, 'API Token', 'bc709f0542b5777605d2682e4baefea5317075257e7055834974badc276e5aba', '[\"*\"]', NULL, NULL, '2025-09-08 17:59:59', '2025-09-08 17:59:59', '2025-09-08 23:59:59'),
(458, 'App\\Models\\User', 23, 'API Token', 'ac28faadfc8cb25a11a222998c67ffbf8791c73d9fd01b064866359054430c64', '[\"*\"]', NULL, NULL, '2025-09-08 18:00:00', '2025-09-08 18:00:00', '2025-09-09 00:00:00'),
(459, 'App\\Models\\User', 23, 'API Token', '1cf2bda271433458846ad42b205d13fcbda8abbfc2eb7291c6c8ff57f56e8c8d', '[\"*\"]', NULL, NULL, '2025-09-08 18:00:02', '2025-09-08 18:00:02', '2025-09-09 00:00:02'),
(460, 'App\\Models\\User', 23, 'API Token', 'b64f98b679a8f4f45f17625c83f5592b7b785eaa8d4f49bf45e58ab521930e27', '[\"*\"]', NULL, NULL, '2025-09-08 18:00:04', '2025-09-08 18:00:04', '2025-09-09 00:00:04'),
(461, 'App\\Models\\User', 32, 'API Token', 'f5b697a793f9ac709ab4a96b4d6117c71676b948886f649d8f7e0c5b9258b7ae', '[\"*\"]', NULL, NULL, '2025-09-08 19:08:07', '2025-09-08 19:08:07', '2025-09-09 01:08:07'),
(462, 'App\\Models\\User', 32, 'API Token', 'c15224b7134114bc7bc3c19d9b3c0dfac70ef16a6a6eecbb72aa312ed071f160', '[\"*\"]', NULL, NULL, '2025-09-08 19:08:42', '2025-09-08 19:08:42', '2025-09-09 01:08:42');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`, `deleted_at`) VALUES
(463, 'App\\Models\\User', 32, 'API Token', '2795b8e949ca8d3ac700de0846fd4716d34626bd34532470bc52bea10c684c76', '[\"*\"]', NULL, NULL, '2025-09-08 21:35:20', '2025-09-08 21:35:20', '2025-09-09 03:35:20'),
(464, 'App\\Models\\User', 3, 'API Token', '160dae704c30cee3fc2d2e5c0dd7d82e42ec2440ee61fc6fafc2787541cd4d75', '[\"*\"]', NULL, NULL, '2025-09-08 21:53:07', '2025-09-08 21:53:07', '2025-09-09 03:53:07'),
(465, 'App\\Models\\User', 3, 'API Token', 'cf4c56c0705167e1f10d23ae14df31f8827f490a0dea9b168f5dc1ab205a5ef8', '[\"*\"]', NULL, NULL, '2025-09-08 21:56:21', '2025-09-08 21:56:21', '2025-09-09 03:56:21'),
(466, 'App\\Models\\User', 32, 'API Token', 'cc3f9a3e46febc2df48bad9d31354b81a14dc3988b07c753afd1d13e94bdb1c8', '[\"*\"]', NULL, NULL, '2025-09-09 00:18:48', '2025-09-09 00:18:48', '2025-09-09 06:18:48'),
(467, 'App\\Models\\User', 32, 'API Token', '879511142ec22a971cec276af453a7bb87322b4f67f047db3fa76be79609efee', '[\"*\"]', NULL, NULL, '2025-09-09 00:18:48', '2025-09-09 00:18:48', '2025-09-09 06:18:48'),
(468, 'App\\Models\\User', 32, 'API Token', '3ea29c6c0ae43ae9e168cf9714ec2ebdd8ef2a24730850a6147c672056314797', '[\"*\"]', NULL, NULL, '2025-09-09 00:18:53', '2025-09-09 00:18:53', '2025-09-09 06:18:53'),
(469, 'App\\Models\\User', 37, 'API Token', '0c092e56177f58ca38fc4a72e2aee7dcbe25a9da803f8b896fcbcbb21d7270b3', '[\"*\"]', NULL, NULL, '2025-09-09 00:20:40', '2025-09-09 00:20:40', '2025-09-09 06:20:40'),
(470, 'App\\Models\\User', 15, 'API Token', '025049e012d84ec71145eda175d484082647a8e199ef25302e29dca21a995650', '[\"*\"]', NULL, NULL, '2025-09-09 01:46:10', '2025-09-09 01:46:10', '2025-09-09 07:46:10'),
(471, 'App\\Models\\User', 15, 'API Token', 'e428f1db765632c2f1e629129391ed719ce2c1b1adb81abeecb4adef6e5a4e8a', '[\"*\"]', NULL, NULL, '2025-09-09 01:46:12', '2025-09-09 01:46:12', '2025-09-09 07:46:12'),
(472, 'App\\Models\\User', 15, 'API Token', '4b778749017997978b30cfcd27cae1f810a5a3fb4f1ef3849851c280e47ddb39', '[\"*\"]', NULL, NULL, '2025-09-09 01:46:12', '2025-09-09 01:46:12', '2025-09-09 07:46:12'),
(473, 'App\\Models\\User', 15, 'API Token', '1482b92f394974158f175afc53e5c4ae6975bd4972d96ff4a3c3541027f5c5e4', '[\"*\"]', NULL, NULL, '2025-09-09 01:46:12', '2025-09-09 01:46:12', '2025-09-09 07:46:12'),
(474, 'App\\Models\\User', 15, 'API Token', '2371a3295686029d51f42b3efef883d615e631b36bbfc582873e86a9e2d8ce9d', '[\"*\"]', NULL, NULL, '2025-09-09 01:46:12', '2025-09-09 01:46:12', '2025-09-09 07:46:12'),
(475, 'App\\Models\\User', 15, 'API Token', '409f50de83ace6f49e61065b0a6ee4889b9b8536b728beb6238d1a739ed8c6ae', '[\"*\"]', NULL, NULL, '2025-09-09 01:46:12', '2025-09-09 01:46:12', '2025-09-09 07:46:12'),
(476, 'App\\Models\\User', 83, 'API Token', '6eb1c35d5f28f38a145d26758cf7f42a93d94122af375e198e00da4edf31659b', '[\"*\"]', NULL, NULL, '2025-09-09 02:18:25', '2025-09-09 02:18:25', '2025-09-09 08:18:25'),
(477, 'App\\Models\\User', 32, 'API Token', '3e1918e708d9d626ade333f4df40d6593263bb7b95fc7303aa7ecdfe9f5b290e', '[\"*\"]', NULL, NULL, '2025-09-09 07:38:38', '2025-09-09 07:38:38', '2025-09-09 13:38:38'),
(478, 'App\\Models\\User', 32, 'API Token', '9c5c5e11c944c3196dd2f67069eed666312bc957d012e40b7e907ba6341a9d60', '[\"*\"]', NULL, NULL, '2025-09-09 07:38:38', '2025-09-09 07:38:38', '2025-09-09 13:38:38'),
(479, 'App\\Models\\User', 32, 'API Token', 'c0923399f0a1cff2c6b6b90b3ad4a38a33260c0aa8282daf01f7e6b0403f3691', '[\"*\"]', NULL, NULL, '2025-09-09 07:39:18', '2025-09-09 07:39:18', '2025-09-09 13:39:18'),
(480, 'App\\Models\\User', 32, 'API Token', 'eb946c1069897e556767c8b6dc25bd99b0b9162a9625be8b01202e4d0cb23a4f', '[\"*\"]', NULL, NULL, '2025-09-09 07:39:23', '2025-09-09 07:39:23', '2025-09-09 13:39:24'),
(481, 'App\\Models\\User', 32, 'API Token', '8ba99ebb28ac4e2bb302ee84b907285672853d148a5a2e402ad1183954685983', '[\"*\"]', NULL, NULL, '2025-09-09 07:39:24', '2025-09-09 07:39:24', '2025-09-09 13:39:24'),
(482, 'App\\Models\\User', 32, 'API Token', 'b84d3bd86c098215f4c016103908db060ae34b67aca8db46d56803d9f1356826', '[\"*\"]', NULL, NULL, '2025-09-09 07:39:25', '2025-09-09 07:39:25', '2025-09-09 13:39:25'),
(483, 'App\\Models\\User', 105, 'API Token', 'ed53f1be0ba0ed24040b8dd77b8eb8e61d119ab5f3a97b02b2ab6a0c18d4eae4', '[\"*\"]', NULL, NULL, '2025-09-09 08:48:50', '2025-09-09 08:48:50', '2025-09-09 14:48:50'),
(484, 'App\\Models\\User', 83, 'API Token', '736cf73feb5b7eb3c67600f4111f539b5fcbf64ae017d67fb79023b9014298fe', '[\"*\"]', NULL, NULL, '2025-09-09 08:50:17', '2025-09-09 08:50:17', '2025-09-09 14:50:17'),
(485, 'App\\Models\\User', 30, 'API Token', '96cdc76d70c0f9d4682dcda6ff1bad5fe6a8286528a2c337d998bd8fc3194a58', '[\"*\"]', NULL, NULL, '2025-09-09 10:16:29', '2025-09-09 10:16:29', '2025-09-09 16:16:29'),
(486, 'App\\Models\\User', 61, 'API Token', 'e37deb42c29449f8244f477e11fb423f9064c9fda2231e0d338c84b47e042a39', '[\"*\"]', NULL, NULL, '2025-09-09 11:06:18', '2025-09-09 11:06:18', '2025-09-09 17:06:18'),
(487, 'App\\Models\\User', 35, 'API Token', '8f638a89bfa9b1a2cb558d1f6318ecb06d359bb54ab0e469dc8f34be5e17ed84', '[\"*\"]', NULL, NULL, '2025-09-09 12:49:21', '2025-09-09 12:49:21', '2025-09-09 18:49:21'),
(488, 'App\\Models\\User', 32, 'API Token', 'bc8ecaca748a48b7426c23f57c4d5ea6e46c6dd22585d3a8f0ae3a423316a216', '[\"*\"]', NULL, NULL, '2025-09-09 18:06:20', '2025-09-09 18:06:20', '2025-09-10 00:06:20'),
(489, 'App\\Models\\User', 32, 'API Token', '69f8efa2669e3869207d04493817d94731130e9b004d8b34f08d39ac9df68733', '[\"*\"]', NULL, NULL, '2025-09-09 21:21:18', '2025-09-09 21:21:18', '2025-09-10 03:21:18'),
(490, 'App\\Models\\User', 32, 'API Token', '99764ecd828e2b13aca1f18a76d2410eddb8bf482f406adde5a786cdddb1c419', '[\"*\"]', NULL, NULL, '2025-09-09 21:21:20', '2025-09-09 21:21:20', '2025-09-10 03:21:20'),
(491, 'App\\Models\\User', 15, 'API Token', '7ecf700f0d98f8a4b1ad3f6f0944692de2dcffc5ac672ce9e3cab3640f0ad581', '[\"*\"]', NULL, NULL, '2025-09-09 22:52:06', '2025-09-09 22:52:06', '2025-09-10 04:52:06'),
(492, 'App\\Models\\User', 15, 'API Token', 'b508b81c6c13765c826878447f92de6f4339bd3d0900042908f7defe95f68eed', '[\"*\"]', NULL, NULL, '2025-09-09 22:52:06', '2025-09-09 22:52:06', '2025-09-10 04:52:06'),
(493, 'App\\Models\\User', 61, 'API Token', '4079c1cb4a4ad51e2851a77fb2cee93dab82c29986cd9fc43e340d5a68e1e8ec', '[\"*\"]', NULL, NULL, '2025-09-10 01:10:48', '2025-09-10 01:10:48', '2025-09-10 07:10:48'),
(494, 'App\\Models\\User', 115, 'API Token', '321432966b12648cfb75d8b4cd6d139dec7709341dd9b35b70eb326a550b27eb', '[\"*\"]', NULL, NULL, '2025-09-10 01:20:56', '2025-09-10 01:20:56', '2025-09-10 07:20:56'),
(495, 'App\\Models\\User', 15, 'API Token', 'cee691546af7c7ab085f68971db00d55ad2db357935a4beaa51431eb18a9a68a', '[\"*\"]', NULL, NULL, '2025-09-10 01:53:35', '2025-09-10 01:53:35', '2025-09-10 07:53:35'),
(496, 'App\\Models\\User', 15, 'API Token', '96e65d5820c86dd696ad4d88116b941bc51e99d80d3f0c744dd82d01c62aed85', '[\"*\"]', NULL, NULL, '2025-09-10 01:53:36', '2025-09-10 01:53:36', '2025-09-10 07:53:36'),
(497, 'App\\Models\\User', 15, 'API Token', '57a826bc3c15eb998812947820037b60a8e5d3d2d5477c6687f6661982ad5a9a', '[\"*\"]', NULL, NULL, '2025-09-10 01:54:33', '2025-09-10 01:54:33', '2025-09-10 07:54:33'),
(498, 'App\\Models\\User', 70, 'API Token', '77d8e0349d5fb05b3550f24bec7011345fe3bd4be0b3c22bfbf32f96b37e4348', '[\"*\"]', NULL, NULL, '2025-09-10 02:40:29', '2025-09-10 02:40:29', '2025-09-10 08:40:29'),
(499, 'App\\Models\\User', 57, 'API Token', '3cb833bb64caf8215472723fa77c2740d6715432cf8cf49b165fe9ead4898d93', '[\"*\"]', NULL, NULL, '2025-09-10 03:56:49', '2025-09-10 03:56:49', '2025-09-10 09:56:49'),
(500, 'App\\Models\\User', 37, 'API Token', 'd85031c6c380c423d21e97a59068cf59df0bf2445b4df8ef1fd5387bb44c48e4', '[\"*\"]', NULL, NULL, '2025-09-10 05:33:32', '2025-09-10 05:33:32', '2025-09-10 11:33:32'),
(501, 'App\\Models\\User', 107, 'API Token', 'cf8318da217c95e9ab7c1d45893e78b71dcdf568364d58c724c897940b4b9e12', '[\"*\"]', NULL, NULL, '2025-09-10 05:56:23', '2025-09-10 05:56:23', '2025-09-10 11:56:23'),
(502, 'App\\Models\\User', 61, 'API Token', '2618a175116d6da31b42a20d76df0cf8d3300da77b31b1303124dfaa43c17f6b', '[\"*\"]', NULL, NULL, '2025-09-10 07:36:10', '2025-09-10 07:36:10', '2025-09-10 13:36:10'),
(503, 'App\\Models\\User', 32, 'API Token', 'b227c60ba10222a3f967389ca5a2dd2288c6e3d843480354861cfa233305e3aa', '[\"*\"]', NULL, NULL, '2025-09-10 08:32:01', '2025-09-10 08:32:01', '2025-09-10 14:32:01'),
(504, 'App\\Models\\User', 32, 'API Token', 'b869341dc877412f8ea3d295844734b82ef059ebcdd98556c0a868f917f996a0', '[\"*\"]', NULL, NULL, '2025-09-10 08:32:02', '2025-09-10 08:32:02', '2025-09-10 14:32:02'),
(505, 'App\\Models\\User', 26, 'API Token', '5d6131f3f088491f2a7616d501f1292bc0f0d3d77dde3d85bb09e0a8b2b0dc7f', '[\"*\"]', NULL, NULL, '2025-09-10 11:30:50', '2025-09-10 11:30:50', '2025-09-10 17:30:50'),
(506, 'App\\Models\\User', 26, 'API Token', 'dd57a52d09f0c12c31a021e80429f2248b53c6d5b2027c0cb2092e96930f8ae3', '[\"*\"]', NULL, NULL, '2025-09-10 11:31:13', '2025-09-10 11:31:13', '2025-09-10 17:31:13'),
(507, 'App\\Models\\User', 120, 'API Token', 'ce30ba9f50ce5cc14b403c5f02962a5b955b42aeaf224743b04cdfc71591255a', '[\"*\"]', NULL, NULL, '2025-09-10 12:41:51', '2025-09-10 12:41:51', '2025-09-10 18:41:51'),
(508, 'App\\Models\\User', 120, 'API Token', 'bbd6f91f35e9a63c09b1997734fd678cdcf6779922b0c692e4e8f30f46071c1d', '[\"*\"]', NULL, NULL, '2025-09-10 12:45:22', '2025-09-10 12:45:22', '2025-09-10 18:45:22'),
(509, 'App\\Models\\User', 121, 'API Token', '8998e7a0d2c3e6ba639fb321cb9e1080e81493ae388fee516be4175becc96643', '[\"*\"]', NULL, NULL, '2025-09-10 13:56:52', '2025-09-10 13:56:52', '2025-09-10 19:56:52'),
(510, 'App\\Models\\User', 32, 'API Token', 'c8fe99b0191d08cef49f2521e5282082eafab8672c6d21a9288822b2e2210215', '[\"*\"]', NULL, NULL, '2025-09-10 19:14:54', '2025-09-10 19:14:54', '2025-09-11 01:14:54'),
(511, 'App\\Models\\User', 35, 'API Token', 'b4a271d029d14925fcdbe752bb01c03145138a742b4c97ad8b0be20db741eb33', '[\"*\"]', NULL, NULL, '2025-09-10 19:52:46', '2025-09-10 19:52:46', '2025-09-11 01:52:46'),
(512, 'App\\Models\\User', 115, 'API Token', 'c463a0020a29a5209c39f6f94266c7a70f7f14cd28991e1ce7387d7132acdc2b', '[\"*\"]', NULL, NULL, '2025-09-10 22:50:37', '2025-09-10 22:50:37', '2025-09-11 04:50:37'),
(513, 'App\\Models\\User', 43, 'API Token', '83b3e94d27c18d05c84e3d01f82fbc3fa8948b677365b6b2bc17b3088ceccbfa', '[\"*\"]', NULL, NULL, '2025-09-11 01:34:05', '2025-09-11 01:34:05', '2025-09-11 07:34:05'),
(514, 'App\\Models\\User', 43, 'API Token', '6311c0b5469e57e6adfeda7dc2b392afb308bb37fbf234cd1d9a2a061d77c563', '[\"*\"]', NULL, NULL, '2025-09-11 01:34:05', '2025-09-11 01:34:05', '2025-09-11 07:34:05'),
(515, 'App\\Models\\User', 43, 'API Token', '5e0eeb98e8769a47ca3ea00451f24e423887146367392c9201c7875e4e517db4', '[\"*\"]', NULL, NULL, '2025-09-11 01:34:12', '2025-09-11 01:34:12', '2025-09-11 07:34:12'),
(516, 'App\\Models\\User', 43, 'API Token', '252e4be9ce8ab7cf6d97e9b2be1f45cddc42d2c3fa9150a3655836afc086431d', '[\"*\"]', NULL, NULL, '2025-09-11 01:34:12', '2025-09-11 01:34:12', '2025-09-11 07:34:12'),
(517, 'App\\Models\\User', 43, 'API Token', '0b6b62ea46fef6247478be868a5912ace8b5df0334839508bffe321cfdcf01eb', '[\"*\"]', NULL, NULL, '2025-09-11 01:34:13', '2025-09-11 01:34:13', '2025-09-11 07:34:13'),
(518, 'App\\Models\\User', 43, 'API Token', 'f709de40fba1ee8b3d0db23837eb18ff1355bc898d7ecbd4f5cae4c2dfe86c4e', '[\"*\"]', NULL, NULL, '2025-09-11 01:34:17', '2025-09-11 01:34:17', '2025-09-11 07:34:17'),
(519, 'App\\Models\\User', 43, 'API Token', 'c443b64d568ef338762992d0e2cfe95ccaea81b7d77f538ab244c35de8778e84', '[\"*\"]', NULL, NULL, '2025-09-11 01:34:17', '2025-09-11 01:34:17', '2025-09-11 07:34:17'),
(520, 'App\\Models\\User', 115, 'API Token', '47f295e6d422603bff2453456d5e2db8292a767acb2e5909a4d96d6c6a8c4321', '[\"*\"]', NULL, NULL, '2025-09-11 02:15:46', '2025-09-11 02:15:46', '2025-09-11 08:15:46'),
(521, 'App\\Models\\User', 115, 'API Token', 'df06847a1d51d55459ba98b9600fdf2d8b1e0322e4054f0839d1bf8b6a0b212b', '[\"*\"]', NULL, NULL, '2025-09-11 02:19:49', '2025-09-11 02:19:49', '2025-09-11 08:19:49'),
(522, 'App\\Models\\User', 115, 'API Token', 'caa49fc4cb3bb49e0fc02c33afafdeac794a4ccb162bc72abc2fba0cd97b1076', '[\"*\"]', NULL, NULL, '2025-09-11 02:24:01', '2025-09-11 02:24:01', '2025-09-11 08:24:01'),
(523, 'App\\Models\\User', 115, 'API Token', '14face19a816fc18dea55f9c23e89d74e8a568b30eedf8cc80920479f9228c60', '[\"*\"]', NULL, NULL, '2025-09-11 02:24:05', '2025-09-11 02:24:05', '2025-09-11 08:24:05'),
(524, 'App\\Models\\User', 64, 'API Token', '96eccb8bf136c6cd90177b78c7a9e15bf6b9c3f4ec0a72475e17f89a5b3a5b0b', '[\"*\"]', NULL, NULL, '2025-09-11 03:46:32', '2025-09-11 03:46:32', '2025-09-11 09:46:32'),
(525, 'App\\Models\\User', 64, 'API Token', 'd9fb0ae6b76f9d412c264dc7efbed022b9de56288d770e2e686a46cc4878aa75', '[\"*\"]', NULL, NULL, '2025-09-11 03:46:46', '2025-09-11 03:46:46', '2025-09-11 09:46:46'),
(526, 'App\\Models\\User', 64, 'API Token', 'd7ecada4f08218b7ecc617f6603bb9b69c04ffd2a4ee438815b4c3d38cc90b7c', '[\"*\"]', NULL, NULL, '2025-09-11 03:47:16', '2025-09-11 03:47:16', '2025-09-11 09:47:16'),
(527, 'App\\Models\\User', 64, 'API Token', '02eb181d507fd7fedbf8b970204d0fd637879fb94319431a705e808cbc6b0182', '[\"*\"]', NULL, NULL, '2025-09-11 03:47:32', '2025-09-11 03:47:32', '2025-09-11 09:47:32'),
(528, 'App\\Models\\User', 64, 'API Token', 'bdeefb6860d9bba318d9f48ad5e2e11fb1fd904a342867629a59e14a6dcef25c', '[\"*\"]', NULL, NULL, '2025-09-11 03:48:54', '2025-09-11 03:48:54', '2025-09-11 09:48:54'),
(529, 'App\\Models\\User', 32, 'API Token', '61b8a3fc2b37034a8b33a6d3c8c2099bdf359f6da6c2b4079206ca282f209f86', '[\"*\"]', NULL, NULL, '2025-09-11 03:53:22', '2025-09-11 03:53:22', '2025-09-11 09:53:22'),
(530, 'App\\Models\\User', 32, 'API Token', '41881c6c9e4761f75a6cc552e329113d906a1ac46bbf99aae6baef232ed32a0c', '[\"*\"]', NULL, NULL, '2025-09-11 03:53:22', '2025-09-11 03:53:22', '2025-09-11 09:53:22'),
(531, 'App\\Models\\User', 15, 'API Token', 'fd7bea960133062e5e979654bf22b90a2eee1f0d8a6bd26d9446433029b253ca', '[\"*\"]', NULL, NULL, '2025-09-11 04:01:31', '2025-09-11 04:01:31', '2025-09-11 10:01:31'),
(532, 'App\\Models\\User', 15, 'API Token', '90891333cfced83e89fad1ed36e00e90c53ad7250a9a2faaa691c715698a6143', '[\"*\"]', NULL, NULL, '2025-09-11 04:02:44', '2025-09-11 04:02:44', '2025-09-11 10:02:44'),
(533, 'App\\Models\\User', 64, 'API Token', '880bdd1d6a8266cef0231801e25a5ab3dad64e95240f1e7c0f56db4129eb1837', '[\"*\"]', NULL, NULL, '2025-09-11 04:06:46', '2025-09-11 04:06:46', '2025-09-11 10:06:46'),
(534, 'App\\Models\\User', 64, 'API Token', 'a2cca06b1a6e428466744a22db4489201c81f2e85deead427e506967e500fe82', '[\"*\"]', NULL, NULL, '2025-09-11 04:06:57', '2025-09-11 04:06:57', '2025-09-11 10:06:57'),
(535, 'App\\Models\\User', 64, 'API Token', 'f6b6c6336ab683b68b848a21e9660c3bd08713c599968cb50133ee82d3de3602', '[\"*\"]', NULL, NULL, '2025-09-11 04:13:18', '2025-09-11 04:13:18', '2025-09-11 10:13:18'),
(536, 'App\\Models\\User', 64, 'API Token', 'e69ca4d6178ea8dc40d094d54a839a7fa76e01624914ee75591a79b417e1d069', '[\"*\"]', NULL, NULL, '2025-09-11 04:20:40', '2025-09-11 04:20:40', '2025-09-11 10:20:40'),
(537, 'App\\Models\\User', 64, 'API Token', 'a519f76120c40d7c4b69b3788de67a7c1469950743d37353c43b532d98d0a84d', '[\"*\"]', NULL, NULL, '2025-09-11 04:20:41', '2025-09-11 04:20:41', '2025-09-11 10:20:41'),
(538, 'App\\Models\\User', 69, 'API Token', 'afc7b5bade870dedd0e85ec0ad55444318e7fc95c8eb458b07f8ac6afb92d57c', '[\"*\"]', NULL, NULL, '2025-09-11 04:38:01', '2025-09-11 04:38:01', '2025-09-11 10:38:01'),
(539, 'App\\Models\\User', 69, 'API Token', 'a5930d7044df8f6c3d62d5ada531c24180541492b77a263c8ff210bab2027f54', '[\"*\"]', NULL, NULL, '2025-09-11 04:38:09', '2025-09-11 04:38:09', '2025-09-11 10:38:09'),
(540, 'App\\Models\\User', 95, 'API Token', 'bd3183c81f92ba0b5dc1033650d228c99ca1a5f1bfed3c5dc65085eb87e3c11d', '[\"*\"]', NULL, NULL, '2025-09-11 07:10:16', '2025-09-11 07:10:16', '2025-09-11 13:10:16'),
(541, 'App\\Models\\User', 95, 'API Token', 'f6f46a7908bddadecf8520f3dab130052fe0f9d991bf967285f0b3673fda75c7', '[\"*\"]', NULL, NULL, '2025-09-11 07:10:16', '2025-09-11 07:10:16', '2025-09-11 13:10:16'),
(542, 'App\\Models\\User', 95, 'API Token', 'b7657e824bf6466314ef60022dce8b7307692c4aeaae8579bf53fd17b0407c42', '[\"*\"]', NULL, NULL, '2025-09-11 07:10:26', '2025-09-11 07:10:26', '2025-09-11 13:10:26'),
(543, 'App\\Models\\User', 70, 'API Token', '2f87ba590cfcf92e97c4d809d847cbc5904a2a24d4b10cf7e21fcdb9c7960654', '[\"*\"]', NULL, NULL, '2025-09-11 12:05:30', '2025-09-11 12:05:30', '2025-09-11 18:05:30'),
(544, 'App\\Models\\User', 70, 'API Token', '0fe7721b05ceacb4c799a2f35e1040c8ba8f668a26f59315afedc19501ac017f', '[\"*\"]', NULL, NULL, '2025-09-11 12:07:20', '2025-09-11 12:07:20', '2025-09-11 18:07:20'),
(545, 'App\\Models\\User', 70, 'API Token', 'b28a5ef0f4f5734d3c4d992d20d2f64549fda4ce200a71840584bae41d749d38', '[\"*\"]', NULL, NULL, '2025-09-11 12:08:30', '2025-09-11 12:08:30', '2025-09-11 18:08:30'),
(546, 'App\\Models\\User', 32, 'API Token', '1fe498ffa34bbd5cf3b4911d56498157e31e8ae2a52f0045b16d265263919ed4', '[\"*\"]', NULL, NULL, '2025-09-11 19:25:47', '2025-09-11 19:25:47', '2025-09-12 01:25:47'),
(547, 'App\\Models\\User', 32, 'API Token', '2759b81aca723ad226955d6a25de32cc7fc5cab007cdd46b20cb69ffa0c6138c', '[\"*\"]', NULL, NULL, '2025-09-11 19:25:47', '2025-09-11 19:25:47', '2025-09-12 01:25:47'),
(548, 'App\\Models\\User', 32, 'API Token', '798090ec300ffcb1d5bc1907653f8e1172cf4eaeeefff50d1c5c1b9c8fda8d7f', '[\"*\"]', NULL, NULL, '2025-09-11 19:25:49', '2025-09-11 19:25:49', '2025-09-12 01:25:49'),
(549, 'App\\Models\\User', 32, 'API Token', 'a36cbe2457ffc945189eb22063acf14e2e4ed943a21b2ed81dc93d2cc9fb29d1', '[\"*\"]', NULL, NULL, '2025-09-11 21:28:26', '2025-09-11 21:28:26', '2025-09-12 03:28:26'),
(550, 'App\\Models\\User', 32, 'API Token', 'd9dded0e5eb1d692cbbd324f80e4196923ff73358686e0ccad6bf8d707f0dfa8', '[\"*\"]', NULL, NULL, '2025-09-11 21:28:35', '2025-09-11 21:28:35', '2025-09-12 03:28:36'),
(551, 'App\\Models\\User', 32, 'API Token', '2ca2863046cec2e81aa701ecdc0f1c323f8a1ebf1dd7a78a068006d42f20309c', '[\"*\"]', NULL, NULL, '2025-09-11 21:28:36', '2025-09-11 21:28:36', '2025-09-12 03:28:36'),
(552, 'App\\Models\\User', 32, 'API Token', 'd5366fcad70e6cba5355f4995e1a4c4042f7721ac64d26ccb7cb90c4b2986571', '[\"*\"]', NULL, NULL, '2025-09-11 21:28:39', '2025-09-11 21:28:39', '2025-09-12 03:28:39'),
(553, 'App\\Models\\User', 3, 'API Token', 'e20165fe73f27e17313db0e78626f73370c91af9bfe22e814e618557e8d944ba', '[\"*\"]', NULL, NULL, '2025-09-11 23:31:42', '2025-09-11 23:31:42', '2025-09-12 05:31:42'),
(554, 'App\\Models\\User', 3, 'API Token', 'e6034c8d29b97e706261de4afd9ef6382ead03021bd85f60109683a555d8ceb0', '[\"*\"]', NULL, NULL, '2025-09-11 23:37:48', '2025-09-11 23:37:48', '2025-09-12 05:37:48'),
(555, 'App\\Models\\User', 64, 'API Token', 'e6f38551a05bf4918403a5af8bad6cafd5d60d250478e792ad798bc9da616ab1', '[\"*\"]', NULL, NULL, '2025-09-12 02:37:57', '2025-09-12 02:37:57', '2025-09-12 08:37:57'),
(556, 'App\\Models\\User', 64, 'API Token', 'e1a1a7c960a3768d75deabd7a7dcdd0808d0ddcd21d89589cf12a314b6a7576b', '[\"*\"]', NULL, NULL, '2025-09-12 02:37:57', '2025-09-12 02:37:57', '2025-09-12 08:37:57'),
(557, 'App\\Models\\User', 64, 'API Token', 'ad22afc8ff4d0f60cdf74350ff5ab6d210a6aecdfa8285f4d5eef95f93f158c4', '[\"*\"]', NULL, NULL, '2025-09-12 02:37:58', '2025-09-12 02:37:58', '2025-09-12 08:37:58'),
(558, 'App\\Models\\User', 64, 'API Token', 'ec2160466c1a0e67fe3f8442b104848ee43d6383170976b4e3edaf28a2beb59d', '[\"*\"]', NULL, NULL, '2025-09-12 02:37:59', '2025-09-12 02:37:59', '2025-09-12 08:37:59'),
(559, 'App\\Models\\User', 64, 'API Token', '8027453c01a34cc6e77426c3aea9ac8140836f7e0387c15af4989e9284e8e63f', '[\"*\"]', NULL, NULL, '2025-09-12 02:38:00', '2025-09-12 02:38:00', '2025-09-12 08:38:00'),
(560, 'App\\Models\\User', 64, 'API Token', '5c4b79ea1df1f39bbe8cdd79385047f8066482c0c7bd7447d16f25eb46641aa5', '[\"*\"]', NULL, NULL, '2025-09-12 02:38:03', '2025-09-12 02:38:03', '2025-09-12 08:38:03'),
(561, 'App\\Models\\User', 64, 'API Token', '4d91827a1ccadb6ed55689fd8c790b6ed266c8ef406b89c1c51883e9d8f81a5a', '[\"*\"]', NULL, NULL, '2025-09-12 02:38:03', '2025-09-12 02:38:03', '2025-09-12 08:38:03'),
(562, 'App\\Models\\User', 64, 'API Token', '1915fe845a3679ad9221245977b1041ef2538775122535b288f4208b99f6fa95', '[\"*\"]', NULL, NULL, '2025-09-12 02:38:05', '2025-09-12 02:38:05', '2025-09-12 08:38:05'),
(563, 'App\\Models\\User', 64, 'API Token', '5453ad130ba5092be1e0e0b542fe4fe51b49788ddf4f0fa2e86350ce86ab0fc7', '[\"*\"]', NULL, NULL, '2025-09-12 02:38:05', '2025-09-12 02:38:05', '2025-09-12 08:38:05'),
(564, 'App\\Models\\User', 64, 'API Token', 'd387c33307c39e2ada90b02af2558957ababaa1662bfb4ec1a0bfd535a541213', '[\"*\"]', NULL, NULL, '2025-09-12 02:38:09', '2025-09-12 02:38:09', '2025-09-12 08:38:09'),
(565, 'App\\Models\\User', 64, 'API Token', 'f34ebed9b398b3c2860779ed46797829514b681ebccdc6b53d7aed90f68d7b9d', '[\"*\"]', NULL, NULL, '2025-09-12 02:38:10', '2025-09-12 02:38:10', '2025-09-12 08:38:10'),
(566, 'App\\Models\\User', 64, 'API Token', '509ce18998da416aed2ee42614044f8963ea2b44952c28c803c351bb8ea4a25e', '[\"*\"]', NULL, NULL, '2025-09-12 02:38:10', '2025-09-12 02:38:10', '2025-09-12 08:38:10'),
(567, 'App\\Models\\User', 64, 'API Token', 'd77a2263216b2ea8a3dba27d79523749ad41aaff1b2bc4526d76740146fdc8eb', '[\"*\"]', NULL, NULL, '2025-09-12 02:38:13', '2025-09-12 02:38:13', '2025-09-12 08:38:13'),
(568, 'App\\Models\\User', 64, 'API Token', 'fe5a585a1d413dd9a8173146099eb1b30df7db703bcaa527859500f545104a57', '[\"*\"]', NULL, NULL, '2025-09-12 02:38:13', '2025-09-12 02:38:13', '2025-09-12 08:38:13'),
(569, 'App\\Models\\User', 64, 'API Token', '581e51b4fe902b7d69ec431aa220aa6557542bb73bf565def8a0189c887763b2', '[\"*\"]', NULL, NULL, '2025-09-12 02:38:13', '2025-09-12 02:38:13', '2025-09-12 08:38:13'),
(570, 'App\\Models\\User', 64, 'API Token', '803ae8d94060b17072f4ef097f5782b1d723226844421e25fd5132538c4c0978', '[\"*\"]', NULL, NULL, '2025-09-12 02:38:13', '2025-09-12 02:38:13', '2025-09-12 08:38:13'),
(571, 'App\\Models\\User', 64, 'API Token', '3a85b8583e84b3ac1fba155b52622c1f939f369a25a2212d5f32407a8f73b7e4', '[\"*\"]', NULL, NULL, '2025-09-12 02:38:13', '2025-09-12 02:38:13', '2025-09-12 08:38:13'),
(572, 'App\\Models\\User', 64, 'API Token', '50c39ddb00730a88a43eb995e1251dc1568bc3fe341c04c3de722b90223e4339', '[\"*\"]', NULL, NULL, '2025-09-12 02:38:17', '2025-09-12 02:38:17', '2025-09-12 08:38:17'),
(573, 'App\\Models\\User', 64, 'API Token', '1fc4c1a96486c76e2e2e3a5986b5c23a53e0ec3864bff9d072301cfc677eb352', '[\"*\"]', NULL, NULL, '2025-09-12 02:38:18', '2025-09-12 02:38:18', '2025-09-12 08:38:18'),
(574, 'App\\Models\\User', 64, 'API Token', 'cc8a7933b0871cc6f71b42925f18d98b6a2f10cdf23ff6139ac1c40c2a54dc05', '[\"*\"]', NULL, NULL, '2025-09-12 02:38:18', '2025-09-12 02:38:18', '2025-09-12 08:38:18'),
(575, 'App\\Models\\User', 64, 'API Token', 'b1a854feb7099874c9774a16e5bda56402247c8e2b8c0dbdd5350bbb3a3d687a', '[\"*\"]', NULL, NULL, '2025-09-12 02:38:18', '2025-09-12 02:38:18', '2025-09-12 08:38:18'),
(576, 'App\\Models\\User', 64, 'API Token', 'ccb508baa68dfad1ee0caf68da2387dc058ec9e45614cf77d1e28d623fcb6a58', '[\"*\"]', NULL, NULL, '2025-09-12 02:38:19', '2025-09-12 02:38:19', '2025-09-12 08:38:19'),
(577, 'App\\Models\\User', 64, 'API Token', '02a50108984403805c9412a0271e1827ed1a3c73aacd6a9dc6a4c2b1d8812c73', '[\"*\"]', NULL, NULL, '2025-09-12 02:38:19', '2025-09-12 02:38:19', '2025-09-12 08:38:19'),
(578, 'App\\Models\\User', 64, 'API Token', '5a2aeb5cc32707685baad05ba5dd93996cc20913d2ec270028c7d2895c354da3', '[\"*\"]', NULL, NULL, '2025-09-12 02:38:19', '2025-09-12 02:38:19', '2025-09-12 08:38:19'),
(579, 'App\\Models\\User', 64, 'API Token', 'c11c7d30a5c2851e64eac17f153e8b57ed7f798b81bc0ce8bf33d947347d8123', '[\"*\"]', NULL, NULL, '2025-09-12 02:38:20', '2025-09-12 02:38:20', '2025-09-12 08:38:20'),
(580, 'App\\Models\\User', 64, 'API Token', 'ed216222b58aea8b2da1f94918297cf5184b65855676f1568385c35726dec8f3', '[\"*\"]', NULL, NULL, '2025-09-12 02:38:19', '2025-09-12 02:38:19', '2025-09-12 08:38:20'),
(581, 'App\\Models\\User', 64, 'API Token', 'dde5d30f66069c5c70a17f4c4b7f5a8f0acd5d079266b5d5b74113594b7f7b74', '[\"*\"]', NULL, NULL, '2025-09-12 02:38:20', '2025-09-12 02:38:20', '2025-09-12 08:38:20'),
(582, 'App\\Models\\User', 64, 'API Token', 'e014007d07c553359cf5d98f1a9d3133064ac5247da6d2b187f3d67f19602f61', '[\"*\"]', NULL, NULL, '2025-09-12 02:38:21', '2025-09-12 02:38:21', '2025-09-12 08:38:21'),
(583, 'App\\Models\\User', 64, 'API Token', '1c6b239d68f59d65314483b868022c55044ecb0dc25095e38c04078043b6aef1', '[\"*\"]', NULL, NULL, '2025-09-12 02:38:24', '2025-09-12 02:38:24', '2025-09-12 08:38:24'),
(584, 'App\\Models\\User', 64, 'API Token', '1063da2e032772062fdf6c2c175d3273c182a9970b41102b55e591ed470ea967', '[\"*\"]', NULL, NULL, '2025-09-12 02:38:24', '2025-09-12 02:38:24', '2025-09-12 08:38:24'),
(585, 'App\\Models\\User', 64, 'API Token', '52138bcb2b50cb8fd016785ae6c965afcd211016a981d5e2f80c74e6205697cb', '[\"*\"]', NULL, NULL, '2025-09-12 02:38:24', '2025-09-12 02:38:24', '2025-09-12 08:38:24'),
(586, 'App\\Models\\User', 64, 'API Token', '825af0481a7ee98eb8dcdb8e6277e68edc4a94c07186942f9cad1588f1437b45', '[\"*\"]', NULL, NULL, '2025-09-12 02:38:24', '2025-09-12 02:38:24', '2025-09-12 08:38:24'),
(587, 'App\\Models\\User', 64, 'API Token', 'a4655915b629210328d664f5df91a0de415ac134a3d0885e2f0e3e06d2561e3b', '[\"*\"]', NULL, NULL, '2025-09-12 02:38:27', '2025-09-12 02:38:27', '2025-09-12 08:38:27'),
(588, 'App\\Models\\User', 64, 'API Token', 'c071e950b8ed370af6bc1b007107b122eb3f497505acfd60b31fed58c386b926', '[\"*\"]', NULL, NULL, '2025-09-12 02:38:27', '2025-09-12 02:38:27', '2025-09-12 08:38:27'),
(589, 'App\\Models\\User', 64, 'API Token', '1260d3094c8c1a034044f5a908c4d698954e0f2b8f6a1c04a8adee5ccbdde087', '[\"*\"]', NULL, NULL, '2025-09-12 02:38:27', '2025-09-12 02:38:27', '2025-09-12 08:38:27'),
(590, 'App\\Models\\User', 64, 'API Token', '4041bfce0355841de98171d1b986e95f9d72b3f1f264477e333f0290ef06f55f', '[\"*\"]', NULL, NULL, '2025-09-12 02:38:27', '2025-09-12 02:38:27', '2025-09-12 08:38:27'),
(591, 'App\\Models\\User', 64, 'API Token', '6e41db7923e097b9903e1d62d96580e06a5ffd614c276521372e0d3483c5dddf', '[\"*\"]', NULL, NULL, '2025-09-12 02:38:27', '2025-09-12 02:38:27', '2025-09-12 08:38:27'),
(592, 'App\\Models\\User', 64, 'API Token', '2c809e8ebb5cca0eb1c50dc462e6f945ac0d919bd4203d9c319241dcf64e6f32', '[\"*\"]', NULL, NULL, '2025-09-12 02:38:27', '2025-09-12 02:38:27', '2025-09-12 08:38:27'),
(593, 'App\\Models\\User', 15, 'API Token', '5546465c400c147e7a9781bb2005b6278e964f66480daab52737cbc411a6270f', '[\"*\"]', NULL, NULL, '2025-09-12 07:25:47', '2025-09-12 07:25:47', '2025-09-12 13:25:47'),
(594, 'App\\Models\\User', 15, 'API Token', '1dc6f69172625f2c338cc3f42c0b0455eec723ff4b3ee861a0686648885de577', '[\"*\"]', NULL, NULL, '2025-09-12 07:25:47', '2025-09-12 07:25:47', '2025-09-12 13:25:47'),
(595, 'App\\Models\\User', 23, 'API Token', 'fd17d961627488bb44dfadf9c3d86587df2962135d4e03dc6903d5a3548dff0e', '[\"*\"]', NULL, NULL, '2025-09-12 07:29:59', '2025-09-12 07:29:59', '2025-09-12 13:29:59'),
(596, 'App\\Models\\User', 23, 'API Token', 'c08c1a3844a66518863357d6e01b96ba1682a3af32e3ba9546e0d6c0d5fd6ea0', '[\"*\"]', NULL, NULL, '2025-09-12 07:29:59', '2025-09-12 07:29:59', '2025-09-12 13:29:59'),
(597, 'App\\Models\\User', 61, 'API Token', 'd501f96a16bf5dba09c725c2289fab316bbf606bf37711a5894ff0746657aeca', '[\"*\"]', NULL, NULL, '2025-09-12 18:26:57', '2025-09-12 18:26:57', '2025-09-13 00:26:57'),
(598, 'App\\Models\\User', 32, 'API Token', 'f7d6b1ad67385dd45f18e9d29d77a923e75502a36a952e0cb97f33104bff0426', '[\"*\"]', NULL, NULL, '2025-09-12 19:19:28', '2025-09-12 19:19:28', '2025-09-13 01:19:28'),
(599, 'App\\Models\\User', 32, 'API Token', '1ad72cde4e47c9e0c767d9fea8adbc69fc651e2ef7bc9d70c4c16e8f4b82028e', '[\"*\"]', NULL, NULL, '2025-09-12 19:19:28', '2025-09-12 19:19:28', '2025-09-13 01:19:28'),
(600, 'App\\Models\\User', 32, 'API Token', '746026585e6ea4bc2dda6a78ff8f5c49633e5a45216ca0b74c92291de2cc601b', '[\"*\"]', NULL, NULL, '2025-09-12 19:19:34', '2025-09-12 19:19:34', '2025-09-13 01:19:34'),
(601, 'App\\Models\\User', 32, 'API Token', '7d2ce46aec69780d1584e35d547ae26a0efe1bb1d6894fcbb1a85224e241b180', '[\"*\"]', NULL, NULL, '2025-09-12 19:19:34', '2025-09-12 19:19:34', '2025-09-13 01:19:34'),
(602, 'App\\Models\\User', 15, 'API Token', 'd439284634961c9dea34100658210b84451c2ce15d5a60519fd98d8a9a947f71', '[\"*\"]', NULL, NULL, '2025-09-12 22:14:16', '2025-09-12 22:14:16', '2025-09-13 04:14:16'),
(603, 'App\\Models\\User', 15, 'API Token', '505af837bdf4a564b3bdda53663bf1ceef721ee818f557cce07bba21cf5b7e18', '[\"*\"]', NULL, NULL, '2025-09-12 22:14:16', '2025-09-12 22:14:16', '2025-09-13 04:14:16'),
(604, 'App\\Models\\User', 32, 'API Token', 'df3d631e1b617f10cd4be1deb9ca86f11a73b4a56f39b0e7ee870a080a0ab58f', '[\"*\"]', NULL, NULL, '2025-09-12 22:25:13', '2025-09-12 22:25:13', '2025-09-13 04:25:13'),
(605, 'App\\Models\\User', 93, 'API Token', 'c5a1fce96f2ea8bce0e2eb7ce9f594771db2b44af137749d0b783b537bb7d9f4', '[\"*\"]', NULL, NULL, '2025-09-13 00:27:15', '2025-09-13 00:27:15', '2025-09-13 06:27:15'),
(606, 'App\\Models\\User', 93, 'API Token', '83f8f1c5eb20a076ff22c3eb57394a0e8c941b99cddbc88125b88b829f78732d', '[\"*\"]', NULL, NULL, '2025-09-13 00:27:15', '2025-09-13 00:27:15', '2025-09-13 06:27:15'),
(607, 'App\\Models\\User', 85, 'API Token', 'f02bb8305fd043d1f0f207ed29124355bbb630014f508b45265fe7af64e4071c', '[\"*\"]', NULL, NULL, '2025-09-13 00:39:11', '2025-09-13 00:39:11', '2025-09-13 06:39:11'),
(608, 'App\\Models\\User', 15, 'API Token', '380290074c63aa976017bc47060f754350c1f6507b0639d6a67afbfd9a9a01f6', '[\"*\"]', NULL, NULL, '2025-09-13 02:33:16', '2025-09-13 02:33:16', '2025-09-13 08:33:16'),
(609, 'App\\Models\\User', 15, 'API Token', '987c993684bda77c901590b449b7a3ec5e184c125f02c3b1361fa2d1d030de3c', '[\"*\"]', NULL, NULL, '2025-09-13 02:33:16', '2025-09-13 02:33:16', '2025-09-13 08:33:16'),
(610, 'App\\Models\\User', 142, 'API Token', '315630ca03b73acb1405bc4885372133888149087311ecbaa6ac4a1c9df539bc', '[\"*\"]', NULL, NULL, '2025-09-13 04:33:55', '2025-09-13 04:33:55', '2025-09-13 10:33:55'),
(611, 'App\\Models\\User', 142, 'API Token', 'f052f4e06a09d2564e9af479c166b248c83ae39e1b6cb7add8096e03f702c35d', '[\"*\"]', NULL, NULL, '2025-09-13 04:33:55', '2025-09-13 04:33:55', '2025-09-13 10:33:55'),
(612, 'App\\Models\\User', 142, 'API Token', '27e857efa62c3f6b396a1917479ed49a9eeb91f95ca21a7fd297e102ab6d2a15', '[\"*\"]', NULL, NULL, '2025-09-13 04:37:00', '2025-09-13 04:37:00', '2025-09-13 10:37:00'),
(613, 'App\\Models\\User', 32, 'API Token', '2dba293065f5a37131a3c8ff1ac93c1f2b1a0580f003598394b98adc829a1329', '[\"*\"]', NULL, NULL, '2025-09-13 05:51:10', '2025-09-13 05:51:10', '2025-09-13 11:51:10'),
(614, 'App\\Models\\User', 32, 'API Token', '378007efa54563fde5592148753347b3dcc4a165e0ddff3e2ad4eb4301e625f1', '[\"*\"]', NULL, NULL, '2025-09-13 05:53:45', '2025-09-13 05:53:45', '2025-09-13 11:53:45'),
(615, 'App\\Models\\User', 32, 'API Token', '51cf68df3b072bd7279ff1074e3581f29bd94d465222defdd6d83b2961f306a3', '[\"*\"]', NULL, NULL, '2025-09-13 09:41:54', '2025-09-13 09:41:54', '2025-09-13 15:41:54'),
(616, 'App\\Models\\User', 32, 'API Token', '701f71f8b4577a443712a7dd86c3c03fa7c7d8ba20f2bd6fcc50edbdbc7787a0', '[\"*\"]', NULL, NULL, '2025-09-13 09:41:54', '2025-09-13 09:41:54', '2025-09-13 15:41:54'),
(617, 'App\\Models\\User', 32, 'API Token', '71419e9ad9bc0e01711b4dc2d18820033f89fd65d135904a383fa1f2df84f37d', '[\"*\"]', NULL, NULL, '2025-09-13 18:32:16', '2025-09-13 18:32:16', '2025-09-14 00:32:16'),
(618, 'App\\Models\\User', 32, 'API Token', '0bbb6f262b82886027a398ff95b474a75aa9fe1609ccf288e6ac0686ba7bf742', '[\"*\"]', NULL, NULL, '2025-09-13 18:32:16', '2025-09-13 18:32:16', '2025-09-14 00:32:16'),
(619, 'App\\Models\\User', 32, 'API Token', '61c9addbbcec279af6c5fdeec62cb01194c44a60c26c5fee2e2f340b77a582ba', '[\"*\"]', NULL, NULL, '2025-09-13 18:32:17', '2025-09-13 18:32:17', '2025-09-14 00:32:17'),
(620, 'App\\Models\\User', 32, 'API Token', '1b59eb5b03e4780a0498dec97d76bedc8b4f00861a66802db11598c1ca68739b', '[\"*\"]', NULL, NULL, '2025-09-13 18:32:20', '2025-09-13 18:32:20', '2025-09-14 00:32:20'),
(621, 'App\\Models\\User', 32, 'API Token', 'ea384229b71e4209d536df8b50d0106533119a9f174653353bf307c4ab357f81', '[\"*\"]', NULL, NULL, '2025-09-13 18:32:20', '2025-09-13 18:32:20', '2025-09-14 00:32:20'),
(622, 'App\\Models\\User', 32, 'API Token', '62b6077847bcf24ddc5eba066d0fc46f471d4cc5ab77554ececeb6ec0e2bcd9a', '[\"*\"]', NULL, NULL, '2025-09-13 18:32:22', '2025-09-13 18:32:22', '2025-09-14 00:32:22'),
(623, 'App\\Models\\User', 61, 'API Token', '9e6c8b4318ccd651e1ecc6de3cc3b6787690ca16ee570fa7cbe397f2dabd7115', '[\"*\"]', NULL, NULL, '2025-09-13 19:25:33', '2025-09-13 19:25:33', '2025-09-14 01:25:33'),
(624, 'App\\Models\\User', 61, 'API Token', '51901dfbda1beab5efb8a77b39a90dfde9537ad9d3d5201ebb1d1fd71902caa4', '[\"*\"]', NULL, NULL, '2025-09-13 19:25:34', '2025-09-13 19:25:34', '2025-09-14 01:25:34'),
(625, 'App\\Models\\User', 32, 'API Token', 'ce51e396636b3063d6905f79416bc72ebf9d41c24fd440443efbec191848653c', '[\"*\"]', NULL, NULL, '2025-09-13 21:00:35', '2025-09-13 21:00:35', '2025-09-14 03:00:36'),
(626, 'App\\Models\\User', 32, 'API Token', '471729b22752a2025d50cffbb70fe508c283541b02538ef48f7b812a9f46679a', '[\"*\"]', NULL, NULL, '2025-09-13 21:00:36', '2025-09-13 21:00:36', '2025-09-14 03:00:36'),
(627, 'App\\Models\\User', 15, 'API Token', '5e036e590024c74a0a72abd553326386686426861941bc35e1d410f9640745bc', '[\"*\"]', NULL, NULL, '2025-09-13 22:33:53', '2025-09-13 22:33:53', '2025-09-14 04:33:53'),
(628, 'App\\Models\\User', 15, 'API Token', 'c022dcd64d4bf0426d394c679f9b9606ce70f1695989dd1a6a5158547dac4d90', '[\"*\"]', NULL, NULL, '2025-09-13 22:33:54', '2025-09-13 22:33:54', '2025-09-14 04:33:54'),
(629, 'App\\Models\\User', 15, 'API Token', '566a27f3f8bef88f0fa632be6f718c2c4175ad8958f73e52ee131835b1b95d64', '[\"*\"]', NULL, NULL, '2025-09-14 00:07:22', '2025-09-14 00:07:22', '2025-09-14 06:07:22'),
(630, 'App\\Models\\User', 15, 'API Token', '1d367109194fe7d9d8ae2b532c2c88e1761ee82945d49397465432d565e58ec0', '[\"*\"]', NULL, NULL, '2025-09-14 00:07:22', '2025-09-14 00:07:22', '2025-09-14 06:07:22'),
(631, 'App\\Models\\User', 15, 'API Token', '0aef065c69a7fb99568d61c06c36608b9089bf901b2bc5e988ce704c016e3796', '[\"*\"]', NULL, NULL, '2025-09-14 02:25:49', '2025-09-14 02:25:49', '2025-09-14 08:25:49'),
(632, 'App\\Models\\User', 15, 'API Token', '1928606287930554ad771e0d39f25199f08bc84a5407a4242bcf03fe5c1be8d1', '[\"*\"]', NULL, NULL, '2025-09-14 02:25:50', '2025-09-14 02:25:50', '2025-09-14 08:25:50'),
(633, 'App\\Models\\User', 32, 'API Token', '7a8b816e7fb8ac742eb50a94336a79543459adbd66c8189373f95b9a6a534622', '[\"*\"]', NULL, NULL, '2025-09-14 18:02:08', '2025-09-14 18:02:08', '2025-09-15 00:02:08'),
(634, 'App\\Models\\User', 32, 'API Token', 'a049e0589524db42397763c6ee39c927a478ab5ef835e80a6feaf5ff468e0642', '[\"*\"]', NULL, NULL, '2025-09-14 18:02:09', '2025-09-14 18:02:09', '2025-09-15 00:02:09'),
(635, 'App\\Models\\User', 32, 'API Token', '2e38d5aa56a81c20298fe5d127845e5ec459bd4238d35e2417f355c9142f2c36', '[\"*\"]', NULL, NULL, '2025-09-14 18:02:18', '2025-09-14 18:02:18', '2025-09-15 00:02:18'),
(636, 'App\\Models\\User', 32, 'API Token', '5c9c193494a3583db1ca1be42aafaf68f5734290e3f91203fb125ef8197d0ce8', '[\"*\"]', NULL, NULL, '2025-09-14 18:02:19', '2025-09-14 18:02:19', '2025-09-15 00:02:19'),
(637, 'App\\Models\\User', 15, 'API Token', '84bd2d188b65b96371b4794a44e4d722069260bebe6303c7b057c7d28cbbb10a', '[\"*\"]', NULL, NULL, '2025-09-15 07:06:30', '2025-09-15 07:06:30', '2025-09-15 13:06:30'),
(638, 'App\\Models\\User', 15, 'API Token', 'a647035110dfeb62b49d0a158dd5453eb1482e1735cb72b3dfb859dda36aaf37', '[\"*\"]', NULL, NULL, '2025-09-15 07:06:30', '2025-09-15 07:06:30', '2025-09-15 13:06:30'),
(639, 'App\\Models\\User', 32, 'API Token', 'b7c402402dca51e61e27ac12f49b6a063b0d16eae2f4e9d70f6eb6da0950a16c', '[\"*\"]', NULL, NULL, '2025-09-15 18:33:15', '2025-09-15 18:33:15', '2025-09-16 00:33:15'),
(640, 'App\\Models\\User', 61, 'API Token', '46c96f94c4d3978e6f4860ef044510fa64e9cf6b5c4862062fb0cb12f8f82f7f', '[\"*\"]', NULL, NULL, '2025-09-15 21:18:04', '2025-09-15 21:18:04', '2025-09-16 03:18:04'),
(641, 'App\\Models\\User', 30, 'API Token', 'e742206ff5565ebc7ef9e3a52ed4693602bc09ae05010cc85d8312bde1c01555', '[\"*\"]', NULL, NULL, '2025-09-15 22:17:46', '2025-09-15 22:17:46', '2025-09-16 04:17:46'),
(642, 'App\\Models\\User', 30, 'API Token', '5b4ac6ca62412967d6d1dcf58c9b790841d7a82d2fa58647c26a4c92782d478d', '[\"*\"]', NULL, NULL, '2025-09-15 22:17:46', '2025-09-15 22:17:46', '2025-09-16 04:17:46'),
(643, 'App\\Models\\User', 15, 'API Token', '9a0d22f164f95c28e8a99c817167e9fedda754fa938104ba7fa36866f002a338', '[\"*\"]', NULL, NULL, '2025-09-16 00:04:08', '2025-09-16 00:04:08', '2025-09-16 06:04:08'),
(644, 'App\\Models\\User', 15, 'API Token', '0a1d884d90b2f6c92ec6ee336b0c93bcf18937f26cae564a0b0dbe63cc71abad', '[\"*\"]', NULL, NULL, '2025-09-16 00:04:11', '2025-09-16 00:04:11', '2025-09-16 06:04:11'),
(645, 'App\\Models\\User', 15, 'API Token', '7e9e335347c8f2fe6c1d07ac7e9becb66ce0d75a9ad4691f67889c14cbf753b8', '[\"*\"]', NULL, NULL, '2025-09-16 08:02:13', '2025-09-16 08:02:13', '2025-09-16 14:02:13'),
(646, 'App\\Models\\User', 15, 'API Token', '150dd7a187b25e95fa366311a341185fcb29334a632ee9a54e1be4dd52ef2089', '[\"*\"]', NULL, NULL, '2025-09-16 08:02:13', '2025-09-16 08:02:13', '2025-09-16 14:02:13'),
(647, 'App\\Models\\User', 15, 'API Token', 'ff33946158b72ac23ffddc5266ca6413cb5fcddea3d67d0e72e1e933ecd59ae1', '[\"*\"]', NULL, NULL, '2025-09-16 08:16:44', '2025-09-16 08:16:44', '2025-09-16 14:16:44'),
(648, 'App\\Models\\User', 3, 'API Token', 'e019b426d526487791b3d23a3853c53509ec37354ad31696edd16723b89f9e6a', '[\"*\"]', NULL, NULL, '2025-09-16 10:49:49', '2025-09-16 10:49:49', '2025-09-16 16:49:49'),
(649, 'App\\Models\\User', 70, 'API Token', 'acd12d21442fcc7e3398981c7327b4ffb3250bebc6de477f83ffb244e5424598', '[\"*\"]', NULL, NULL, '2025-09-17 02:18:56', '2025-09-17 02:18:56', '2025-09-17 08:18:56'),
(650, 'App\\Models\\User', 70, 'API Token', '10426500dcbc723953c715a963204e215421f73df1747d91c279af77f672ee28', '[\"*\"]', NULL, NULL, '2025-09-17 02:24:25', '2025-09-17 02:24:25', '2025-09-17 08:24:25'),
(651, 'App\\Models\\User', 70, 'API Token', '33efb9621e5466da7965d8cf8b3f935614d7e9bb9a8c9f6189344404ce08b5e3', '[\"*\"]', NULL, NULL, '2025-09-17 02:29:29', '2025-09-17 02:29:29', '2025-09-17 08:29:29'),
(652, 'App\\Models\\User', 70, 'API Token', '98a2ee547c32b13fa97762fc57bdae830e178bba3ffd2359c61381cb4b67bd53', '[\"*\"]', NULL, NULL, '2025-09-17 02:32:40', '2025-09-17 02:32:40', '2025-09-17 08:32:40'),
(653, 'App\\Models\\User', 70, 'API Token', 'b34662231f58aa2ddc5ca1c24df8cf28f0c03da4f588973b7c2536c2e24941fe', '[\"*\"]', NULL, NULL, '2025-09-17 02:32:40', '2025-09-17 02:32:40', '2025-09-17 08:32:40'),
(654, 'App\\Models\\User', 15, 'API Token', 'a29b200a5cdc67633cf0e84e27f9c930f7c7b1d9237c7708a3a5e375aedb3da4', '[\"*\"]', NULL, NULL, '2025-09-17 03:44:02', '2025-09-17 03:44:02', '2025-09-17 09:44:02'),
(655, 'App\\Models\\User', 15, 'API Token', 'b2a84ae1f79e428e2e09129ed077d12f30fa301a5c9763cb84975ae9c717fbfc', '[\"*\"]', NULL, NULL, '2025-09-17 04:53:50', '2025-09-17 04:53:50', '2025-09-17 10:53:50'),
(656, 'App\\Models\\User', 15, 'API Token', '369475ef47562fd8aed0ef079d7964f2a0f190852dbc9a8d1fa0d5fabdd7a167', '[\"*\"]', NULL, NULL, '2025-09-17 06:22:38', '2025-09-17 06:22:38', '2025-09-17 12:22:38'),
(657, 'App\\Models\\User', 15, 'API Token', 'fce80eb7eeb35926b69a22740c4c8fd0421b4566cfb12609d71d6ec1496f3f6b', '[\"*\"]', NULL, NULL, '2025-09-17 06:43:19', '2025-09-17 06:43:19', '2025-09-17 12:43:19'),
(658, 'App\\Models\\User', 15, 'API Token', '43464d90fdf202f1d148e0f5898e77dd9dfe145adf8923dab99edaa111aa0902', '[\"*\"]', NULL, NULL, '2025-09-17 06:44:52', '2025-09-17 06:44:52', '2025-09-17 12:44:53'),
(659, 'App\\Models\\User', 15, 'API Token', '694c8f379553157edb271d0d45c78b55db4bda3cc658fe01097f0db36a025983', '[\"*\"]', NULL, NULL, '2025-09-17 06:44:55', '2025-09-17 06:44:55', '2025-09-17 12:44:55'),
(660, 'App\\Models\\User', 26, 'API Token', '5b424c52cd7f6ca25cf9d35f93f89d3359eab12b68e8a58f13bb13b02378e9b7', '[\"*\"]', NULL, NULL, '2025-09-17 07:39:37', '2025-09-17 07:39:37', '2025-09-17 13:39:37'),
(661, 'App\\Models\\User', 26, 'API Token', '06915936ab4e2f497f10ad92edb780cf06b0fde704547a270655ea7ef9cf677c', '[\"*\"]', NULL, NULL, '2025-09-17 07:39:43', '2025-09-17 07:39:43', '2025-09-17 13:39:43'),
(662, 'App\\Models\\User', 26, 'API Token', '51afdd8fb6c436713a9b5775669069dae98fda1183afe8cd35739cef0ff525bd', '[\"*\"]', NULL, NULL, '2025-09-17 07:39:43', '2025-09-17 07:39:43', '2025-09-17 13:39:43'),
(663, 'App\\Models\\User', 95, 'API Token', '6e602c33b4c6e36a77c870666c754f4ab807fb7c9a86e4ef59854ffa046f8d17', '[\"*\"]', NULL, NULL, '2025-09-17 07:55:36', '2025-09-17 07:55:36', '2025-09-17 13:55:36'),
(664, 'App\\Models\\User', 95, 'API Token', '994b8ec4141235b3a5192f82f0c85dea7d58257697bfc4110aa65854c7021da6', '[\"*\"]', NULL, NULL, '2025-09-17 07:55:36', '2025-09-17 07:55:36', '2025-09-17 13:55:36'),
(665, 'App\\Models\\User', 95, 'API Token', '7bf88aefd24fca73bebfe3a0909477f164e66d72cd651d7d0dc9674c6081d0cf', '[\"*\"]', NULL, NULL, '2025-09-17 07:55:41', '2025-09-17 07:55:41', '2025-09-17 13:55:41'),
(666, 'App\\Models\\User', 95, 'API Token', 'ca13cbdeb8edeb2d4e79afbb10bf9bee03ad8fc3b59e3790ff9226484d01551f', '[\"*\"]', NULL, NULL, '2025-09-17 07:55:41', '2025-09-17 07:55:41', '2025-09-17 13:55:41'),
(667, 'App\\Models\\User', 70, 'API Token', '6ffe7d5df0412dd2ac7217fda2bdbd83a44304687a4ca2c72999eb483e6c0e7b', '[\"*\"]', NULL, NULL, '2025-09-17 09:52:03', '2025-09-17 09:52:03', '2025-09-17 15:52:03'),
(668, 'App\\Models\\User', 70, 'API Token', 'e15bfb51eb8d399ab5a17fc0cca001a800d2e0cb0eaa383866c8d076dd9878c4', '[\"*\"]', NULL, NULL, '2025-09-17 09:52:08', '2025-09-17 09:52:08', '2025-09-17 15:52:08'),
(669, 'App\\Models\\User', 70, 'API Token', '8edfdda2661936e5fc614264aeb68819564c01275200ccfebc0fea5b0d4c0eb3', '[\"*\"]', NULL, NULL, '2025-09-17 09:52:08', '2025-09-17 09:52:08', '2025-09-17 15:52:08'),
(670, 'App\\Models\\User', 15, 'API Token', 'fae41eeef2525cc4e27174b93f315c823d07ffe89f5c07246b8abeb701bbb7b3', '[\"*\"]', NULL, NULL, '2025-09-17 12:57:53', '2025-09-17 12:57:53', '2025-09-17 18:57:53'),
(671, 'App\\Models\\User', 15, 'API Token', '37d3a9d432544e92cb7e47759db11287b8f4c3574efd93a4a832c7dd921db670', '[\"*\"]', NULL, NULL, '2025-09-17 12:57:53', '2025-09-17 12:57:53', '2025-09-17 18:57:53'),
(672, 'App\\Models\\User', 15, 'API Token', '709aa68c94df3c53a64245b5a207a8d09d8d7b33e63b08c6c76d710532526690', '[\"*\"]', NULL, NULL, '2025-09-18 13:52:26', '2025-09-18 13:52:26', '2025-09-18 19:52:26'),
(673, 'App\\Models\\User', 15, 'API Token', '230ce985862ee021321a261c3685d737757c2085b6c539761c0e004045dc4bc2', '[\"*\"]', NULL, NULL, '2025-09-18 13:52:32', '2025-09-18 13:52:32', '2025-09-18 19:52:32'),
(674, 'App\\Models\\User', 61, 'API Token', '8d8b093d8a1bc5d9985ca4e1d4e5c7c3be8536d9f0c8f692a26ae27512470372', '[\"*\"]', NULL, NULL, '2025-09-19 02:08:22', '2025-09-19 02:08:22', '2025-09-19 08:08:22'),
(675, 'App\\Models\\User', 32, 'API Token', 'afbca82a54852a9414275e4f076c947971745f11b25330ee7141f006b210993e', '[\"*\"]', NULL, NULL, '2025-09-19 02:54:46', '2025-09-19 02:54:46', '2025-09-19 08:54:46'),
(676, 'App\\Models\\User', 35, 'API Token', '0a2828c71b6a86927a10de6aa17d0520f3946dd72497f294592fa98659287ab7', '[\"*\"]', NULL, NULL, '2025-09-19 08:03:08', '2025-09-19 08:03:08', '2025-09-19 14:03:08'),
(677, 'App\\Models\\User', 70, 'API Token', '1760bef036f1efd750bdc1f3aff3f3ef4aefdb03552cb5fe34457656a1894840', '[\"*\"]', NULL, NULL, '2025-09-20 07:49:55', '2025-09-20 07:49:55', '2025-09-20 13:49:55'),
(678, 'App\\Models\\User', 70, 'API Token', '6e7965d27994ffb28eba14f7a9dcc8a833b10b9f28d542e5dc1f70154f893fab', '[\"*\"]', NULL, NULL, '2025-09-20 07:49:55', '2025-09-20 07:49:55', '2025-09-20 13:49:55'),
(679, 'App\\Models\\User', 70, 'API Token', '869807405cb4e7b477723195a0f273190a1c7edd80d1ad219ddfb1d92cb53bbe', '[\"*\"]', NULL, NULL, '2025-09-20 07:49:56', '2025-09-20 07:49:56', '2025-09-20 13:49:56'),
(680, 'App\\Models\\User', 70, 'API Token', 'ce0c34a88b4b629cda4973763ce469ae463b2beb2aafbe185fad99e5d0b7b964', '[\"*\"]', NULL, NULL, '2025-09-20 07:50:18', '2025-09-20 07:50:18', '2025-09-20 13:50:18'),
(681, 'App\\Models\\User', 32, 'API Token', 'eaad01e2a7b2773d1990b896f8707549da3dc33529d4cb228e6a67d57177b2ba', '[\"*\"]', NULL, NULL, '2025-09-20 20:46:11', '2025-09-20 20:46:11', '2025-09-21 02:46:11'),
(682, 'App\\Models\\User', 32, 'API Token', '64be94e9710b825e94eca07c42ded2575adfb0e74b300d3b393bd0762392647d', '[\"*\"]', NULL, NULL, '2025-09-20 20:46:11', '2025-09-20 20:46:11', '2025-09-21 02:46:11'),
(683, 'App\\Models\\User', 32, 'API Token', '23ef23859e1abd972fe7fc279470c23219c22e4845d5601732e7c94866fd0e04', '[\"*\"]', NULL, NULL, '2025-09-20 20:46:15', '2025-09-20 20:46:15', '2025-09-21 02:46:15'),
(684, 'App\\Models\\User', 61, 'API Token', 'abed0537a4dd9274651de1c08d2565d6363dd61919b99b7e1d1202f0acd4c5ce', '[\"*\"]', NULL, NULL, '2025-09-22 02:52:36', '2025-09-22 02:52:36', '2025-09-22 08:52:36'),
(685, 'App\\Models\\User', 32, 'API Token', '28837b80694dbedc204e7deb5b2dd3d10be722a74bc96942b1b876deb95af101', '[\"*\"]', NULL, NULL, '2025-09-23 00:42:55', '2025-09-23 00:42:55', '2025-09-23 06:42:55'),
(686, 'App\\Models\\User', 23, 'API Token', '867cd9d06bb6495ae20dd328762cea577945bacd6f010b4126a0501edc1e2ffa', '[\"*\"]', NULL, NULL, '2025-09-23 06:39:35', '2025-09-23 06:39:35', '2025-09-23 12:39:35'),
(687, 'App\\Models\\User', 23, 'API Token', '2c31ff3ee51f17e59b276dda84d30181b7fcd17a6ac45b89bf22bccca0f2ed66', '[\"*\"]', NULL, NULL, '2025-09-23 06:39:35', '2025-09-23 06:39:35', '2025-09-23 12:39:35'),
(688, 'App\\Models\\User', 23, 'API Token', 'f7a450002f254cda8f69e6b5a89021b11e0ccae16a309dab817d4c93e1c9451a', '[\"*\"]', NULL, NULL, '2025-09-23 06:39:43', '2025-09-23 06:39:43', '2025-09-23 12:39:43'),
(689, 'App\\Models\\User', 70, 'API Token', 'eaddae8b0135d3f64f925736d19868628de04189b826b8e35ce8330f232fce89', '[\"*\"]', NULL, NULL, '2025-09-24 02:32:38', '2025-09-24 02:32:38', '2025-09-24 08:32:38'),
(690, 'App\\Models\\User', 70, 'API Token', '443827b7d2ce516a5130d8221fb6e180bc3cc8ec86deffda693fc20ff1d8b810', '[\"*\"]', NULL, NULL, '2025-09-24 02:32:39', '2025-09-24 02:32:39', '2025-09-24 08:32:39'),
(691, 'App\\Models\\User', 70, 'API Token', '13cdca2f7a32d751608c8ee682aa623b0ce421bfd09061b5e192970a4d355004', '[\"*\"]', NULL, NULL, '2025-09-24 02:32:41', '2025-09-24 02:32:41', '2025-09-24 08:32:41'),
(692, 'App\\Models\\User', 70, 'API Token', '8eb046d2b3d9a9f1dd397d1764787c6fa5600f146eb61c7cb995803645f06e47', '[\"*\"]', NULL, NULL, '2025-09-24 02:32:43', '2025-09-24 02:32:43', '2025-09-24 08:32:43'),
(693, 'App\\Models\\User', 70, 'API Token', 'ea50b010fbe9375c1d4e9716c0218bd9a86f2e814ec5d41ef40ee63c62027c8b', '[\"*\"]', NULL, NULL, '2025-09-24 02:32:44', '2025-09-24 02:32:44', '2025-09-24 08:32:44'),
(694, 'App\\Models\\User', 32, 'API Token', 'caa02d93b5cb1709c266322b5e919f0f5cc139b10b6781a65bcf67892d507958', '[\"*\"]', NULL, NULL, '2025-09-24 21:17:17', '2025-09-24 21:17:17', '2025-09-25 03:17:17'),
(695, 'App\\Models\\User', 32, 'API Token', '9254f1be526ddafaf77193347e9715028f100ddfad390640c6167b63c2549c40', '[\"*\"]', NULL, NULL, '2025-09-24 21:18:01', '2025-09-24 21:18:01', '2025-09-25 03:18:01'),
(696, 'App\\Models\\User', 32, 'API Token', '207148b3fd1c95e902c06871ae712e9e7c009cf7514e28243c7eed31709d9988', '[\"*\"]', NULL, NULL, '2025-09-24 21:18:02', '2025-09-24 21:18:02', '2025-09-25 03:18:02'),
(697, 'App\\Models\\User', 32, 'API Token', '224a88acc1e283098675b8609897722d733c6cb72bf9d8320f0716686345b545', '[\"*\"]', NULL, NULL, '2025-09-24 21:18:08', '2025-09-24 21:18:08', '2025-09-25 03:18:08'),
(698, 'App\\Models\\User', 32, 'API Token', '17b9d5d38dddb063ebe5ca1c5fb98450d34a59785a760fc2c828e5601702dd3a', '[\"*\"]', NULL, NULL, '2025-09-24 21:20:08', '2025-09-24 21:20:08', '2025-09-25 03:20:08'),
(699, 'App\\Models\\User', 3, 'API Token', '2e362e0ea5d6e7c36707650ec3a214b1a61efc60e65b2c37b0773243677467ad', '[\"*\"]', NULL, NULL, '2025-09-25 02:45:31', '2025-09-25 02:45:31', '2025-09-25 08:45:31'),
(700, 'App\\Models\\User', 3, 'API Token', '7ffca51163352ff880a42990d18964fef1d9313ae0afba017e97d720993627b5', '[\"*\"]', NULL, NULL, '2025-09-25 02:45:31', '2025-09-25 02:45:31', '2025-09-25 08:45:31'),
(701, 'App\\Models\\User', 3, 'API Token', '5061b21f3e19acbd29349d89c07d5660e8e9bf6e27b070e77bfaf562305507f3', '[\"*\"]', NULL, NULL, '2025-09-25 02:54:46', '2025-09-25 02:54:46', '2025-09-25 08:54:46'),
(702, 'App\\Models\\User', 3, 'API Token', 'c30a7a60d3b7342de5885e58a72085b50139ad729f68c087a0d1b72af2b573b0', '[\"*\"]', NULL, NULL, '2025-09-25 02:55:15', '2025-09-25 02:55:15', '2025-09-25 08:55:15'),
(703, 'App\\Models\\User', 70, 'API Token', 'a660854acbb4b9b8c17ce1d16c346cf616cedeb5f6e48e735653aa0bcbf50ed6', '[\"*\"]', NULL, NULL, '2025-09-25 03:29:09', '2025-09-25 03:29:09', '2025-09-25 09:29:09'),
(704, 'App\\Models\\User', 3, 'API Token', '147126cc4e2f4b279a1a07eaf4626117ac2f0df4da85ce8891637c29b8584c88', '[\"*\"]', NULL, NULL, '2025-09-25 04:13:45', '2025-09-25 04:13:45', '2025-09-25 10:13:45'),
(705, 'App\\Models\\User', 3, 'API Token', '82ad6ce4eff3cfc6f0ed102d935df8fcc1b889650e55111672aa1720d3e0e5cb', '[\"*\"]', NULL, NULL, '2025-09-25 05:04:58', '2025-09-25 05:04:58', '2025-09-25 11:04:58'),
(706, 'App\\Models\\User', 3, 'API Token', '15d563ac2243525bf1ca4771365e37b479dd7b5ed61a785888e4111a048c6745', '[\"*\"]', NULL, NULL, '2025-09-25 05:17:53', '2025-09-25 05:17:53', '2025-09-25 11:17:53'),
(707, 'App\\Models\\User', 3, 'API Token', '5f14f062873d2b8c5dc826dc7f3b30d978ee97fb94788ae98bc2b3bfd2c6bd54', '[\"*\"]', NULL, NULL, '2025-09-25 05:18:06', '2025-09-25 05:18:06', '2025-09-25 11:18:06');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`, `deleted_at`) VALUES
(708, 'App\\Models\\User', 3, 'API Token', '13f1f2a6caff90acb68c396ccfb0ba633ce5a677548a414bb215e7569f10300a', '[\"*\"]', NULL, NULL, '2025-09-25 05:31:24', '2025-09-25 05:31:24', '2025-09-25 11:31:24'),
(709, 'App\\Models\\User', 32, 'API Token', '747161d0376f9d0a36ba9a2e95410b884b6e8439f4b7b88eb06f2cc0f8c44f4a', '[\"*\"]', NULL, NULL, '2025-09-25 07:06:03', '2025-09-25 07:06:03', '2025-09-25 13:06:03'),
(710, 'App\\Models\\User', 32, 'API Token', 'b026096e96e6c43af06b1ead2724e1499830d14714e1d6bac4b644d6db8a6844', '[\"*\"]', NULL, NULL, '2025-09-25 09:46:52', '2025-09-25 09:46:52', '2025-09-25 15:46:52'),
(711, 'App\\Models\\User', 3, 'API Token', 'd5ffd4724695dcf20a0055b8c8190fb18b0d74b6e8701a77681266a70b519319', '[\"*\"]', NULL, NULL, '2025-09-25 10:31:28', '2025-09-25 10:31:28', '2025-09-25 16:31:28'),
(712, 'App\\Models\\User', 32, 'API Token', '1590c63f879bcde99f775a40b3ac209b5eb1c2f69e57ac924afc0e7ba9554ce1', '[\"*\"]', NULL, NULL, '2025-09-25 17:53:48', '2025-09-25 17:53:48', '2025-09-25 23:53:48'),
(713, 'App\\Models\\User', 32, 'API Token', '71d58744e35aabfc8051bdd1e2778c126a35a9e412e8c9f6d5b22ff7bedab236', '[\"*\"]', NULL, NULL, '2025-09-25 17:57:13', '2025-09-25 17:57:13', '2025-09-25 23:57:13'),
(714, 'App\\Models\\User', 70, 'API Token', '8307169a6830f3206a9142a6e3e9f161269c38a5f01b03d8d4eb834c3c2f9089', '[\"*\"]', NULL, NULL, '2025-09-26 00:16:18', '2025-09-26 00:16:18', '2025-09-26 06:16:18'),
(715, 'App\\Models\\User', 32, 'API Token', '3bc7d0c5b24c0400d47816c750a963d531afb9449a67824dde8c341a4f54de3f', '[\"*\"]', NULL, NULL, '2025-09-26 08:28:35', '2025-09-26 08:28:35', '2025-09-26 14:28:35'),
(716, 'App\\Models\\User', 35, 'API Token', '710325917fcdd5930a853a9444688dfcdf6b04f5019a013154601dfe5f7a6858', '[\"*\"]', NULL, NULL, '2025-09-26 08:29:32', '2025-09-26 08:29:32', '2025-09-26 14:29:32'),
(717, 'App\\Models\\User', 35, 'API Token', '886917715c41e12d0666bac2e18da0843cfcf4e3d9ca2fd3b9fae3ffd8aa12b5', '[\"*\"]', NULL, NULL, '2025-09-26 08:29:34', '2025-09-26 08:29:34', '2025-09-26 14:29:34'),
(718, 'App\\Models\\User', 3, 'API Token', 'ad3f745f9184a7863b1da99da9c92ce5077f982e196f472cf15c1d31bb17d724', '[\"*\"]', NULL, NULL, '2025-09-27 00:10:19', '2025-09-27 00:10:19', '2025-09-27 06:10:19'),
(719, 'App\\Models\\User', 3, 'API Token', 'ea183db5a333f396f61dba58964abec46ad3b20ea248d045bc5c3ed34f0be89e', '[\"*\"]', NULL, NULL, '2025-09-27 08:29:41', '2025-09-27 08:29:41', '2025-09-27 08:29:41'),
(720, 'App\\Models\\User', 3, 'API Token', '9f43f2dafb32e58e6b708c16bc30923dfc2edef6e944d7ebde8eb92847cd5f46', '[\"*\"]', NULL, NULL, '2025-09-27 10:33:25', '2025-09-27 10:33:25', '2025-09-27 10:33:25'),
(721, 'App\\Models\\User', 70, 'API Token', '6d1e98d2161ceceb60ae2d11048df3bbdb890541dc087eaac3c3e002892fad08', '[\"*\"]', NULL, NULL, '2025-09-27 13:29:22', '2025-09-27 13:29:22', '2025-09-27 13:29:22'),
(722, 'App\\Models\\User', 70, 'API Token', '63b2605d4022e214badccbb6e0d6acf42dddb5d90f5dc104b601b100e937f9b0', '[\"*\"]', NULL, NULL, '2025-09-27 14:18:00', '2025-09-27 14:18:00', '2025-09-27 14:18:00'),
(723, 'App\\Models\\User', 3, 'API Token', '41b308a7bba128080344b5a56a84a2d691b133e7ae0cc39763702cca6076f512', '[\"*\"]', NULL, NULL, '2025-09-27 17:44:16', '2025-09-27 17:44:16', '2025-09-27 17:44:16'),
(724, 'App\\Models\\User', 3, 'API Token', '94c4a9549dff8c9f15ae25ed7c9a188e130adbd89d90c53d31c93ce856ddb0da', '[\"*\"]', NULL, NULL, '2025-09-27 18:18:25', '2025-09-27 18:18:25', '2025-09-27 18:18:25'),
(725, 'App\\Models\\User', 3, 'API Token', '622703ac0c7cfb8e420f9d0fe7372dbffda23fddb4c109813c48a8cee8889b64', '[\"*\"]', NULL, NULL, '2025-09-28 06:39:29', '2025-09-28 06:39:29', '2025-09-28 06:39:29'),
(726, 'App\\Models\\User', 3, 'API Token', '025a045db72ddd9eebb61792ded4c92fbc650553807636cd5f55909fd83ac2fc', '[\"*\"]', NULL, NULL, '2025-09-28 06:40:57', '2025-09-28 06:40:57', '2025-09-28 06:40:57'),
(727, 'App\\Models\\User', 3, 'API Token', '359b34e5f4577e76856202d117edd0a0a310b9b00b0211b022954bfcab3612b9', '[\"*\"]', NULL, NULL, '2025-09-28 06:42:06', '2025-09-28 06:42:06', '2025-09-28 06:42:06'),
(728, 'App\\Models\\User', 3, 'API Token', 'e902a00a53444395e7e237474c2e2fa762a5e48a005435b3e1c0a91416b0902f', '[\"*\"]', NULL, NULL, '2025-09-28 06:42:50', '2025-09-28 06:42:50', '2025-09-28 06:42:50'),
(729, 'App\\Models\\User', 3, 'API Token', 'a28bcd93d20e1d16c344b1147b910b156269162fab7d852259648a0a860afd89', '[\"*\"]', NULL, NULL, '2025-09-28 06:43:09', '2025-09-28 06:43:09', '2025-09-28 06:43:09'),
(730, 'App\\Models\\User', 3, 'API Token', '9f8790fa223c843bfe59122c736f38bfeed30356bfb6835e513044304771ae5b', '[\"*\"]', NULL, NULL, '2025-09-28 06:43:53', '2025-09-28 06:43:53', '2025-09-28 06:43:53'),
(731, 'App\\Models\\User', 3, 'API Token', '6f42fcd41985134302006e7ec0d64d0581108f60e0d35ccdb47c8ac5e4fe9d14', '[\"*\"]', NULL, NULL, '2025-09-28 06:44:42', '2025-09-28 06:44:42', '2025-09-28 06:44:42'),
(732, 'App\\Models\\User', 3, 'API Token', '43e876ca73f02ae1860bcadae07b58e14bafa899dd5fc47e13bc019346b52e9d', '[\"*\"]', NULL, NULL, '2025-09-28 06:45:44', '2025-09-28 06:45:44', '2025-09-28 06:45:44'),
(733, 'App\\Models\\User', 3, 'API Token', '53da5c3442453d3391097f76da5546ff2250e89e21091e481a427698a349a844', '[\"*\"]', NULL, NULL, '2025-09-28 06:46:26', '2025-09-28 06:46:26', '2025-09-28 06:46:26'),
(734, 'App\\Models\\User', 3, 'API Token', 'f563c57a1d2bc290313bc3df6cef1843aa0accdc6632c4cdf6f01c13cda5f274', '[\"*\"]', NULL, NULL, '2025-09-28 06:47:12', '2025-09-28 06:47:12', '2025-09-28 06:47:12'),
(735, 'App\\Models\\User', 3, 'API Token', '5b8918832eed4edf8a54dad2f3f804957f90aae77c47789bc316b6765932806e', '[\"*\"]', NULL, NULL, '2025-09-28 06:47:30', '2025-09-28 06:47:30', '2025-09-28 06:47:30'),
(736, 'App\\Models\\User', 3, 'API Token', 'a76d8f5126ac4e7b981438066fe5b2927d657dbe0a3bba5351b14c0ec63888ff', '[\"*\"]', NULL, NULL, '2025-09-28 06:49:22', '2025-09-28 06:49:22', '2025-09-28 06:49:22'),
(737, 'App\\Models\\User', 3, 'API Token', '0fba308abb0337f65b4aefe1a0d85174f52dbf777780072bd1e72cecea72fda5', '[\"*\"]', NULL, NULL, '2025-09-28 06:50:23', '2025-09-28 06:50:23', '2025-09-28 06:50:23'),
(738, 'App\\Models\\User', 3, 'API Token', '5a5bb97dcf96f3fc2e50672bba3df09231b1c2b651a9351220ebc1546ac31878', '[\"*\"]', NULL, NULL, '2025-09-28 14:18:48', '2025-09-28 14:18:48', '2025-09-28 14:18:48'),
(739, 'App\\Models\\User', 3, 'API Token', 'f7ecd4a8bae75288e8121f9ba7aa7cab8d0bd34261907ffdbe34d6ae5338ebf0', '[\"*\"]', NULL, NULL, '2025-09-29 17:00:04', '2025-09-29 17:00:04', '2025-09-29 17:00:04'),
(740, 'App\\Models\\User', 3, 'API Token', '9fdfd86885d922921d2261ef8d448d27edd847f417add39e980cf7da44c5058e', '[\"*\"]', NULL, NULL, '2025-09-30 06:03:11', '2025-09-30 06:03:11', '2025-09-30 06:03:11'),
(741, 'App\\Models\\User', 3, 'API Token', '8ccc27d18257d07bdd1f40ec8afa4fc3b20ccd91aa369a90d7018b3aac0a8bb5', '[\"*\"]', NULL, NULL, '2025-09-30 06:04:07', '2025-09-30 06:04:07', '2025-09-30 06:04:07'),
(742, 'App\\Models\\User', 3, 'API Token', '6c5a70a44e7037fd80c8ab8497aa2f1e922a3e4ed5dad19ecf66dcb784d079fa', '[\"*\"]', NULL, NULL, '2025-09-30 06:04:42', '2025-09-30 06:04:42', '2025-09-30 06:04:42'),
(743, 'App\\Models\\User', 3, 'API Token', 'a59e5a41ab7c542a0bbf98b82f75952bfe04f06c1dd51af40c0e27d9ebdca11a', '[\"*\"]', NULL, NULL, '2025-09-30 06:06:20', '2025-09-30 06:06:20', '2025-09-30 06:06:20'),
(744, 'App\\Models\\User', 3, 'API Token', 'b2bc9deb190d3666eff7ec4721524271475a569c5d31ccfba095fc27ec0f6d24', '[\"*\"]', NULL, NULL, '2025-09-30 06:07:41', '2025-09-30 06:07:41', '2025-09-30 06:07:41'),
(745, 'App\\Models\\User', 3, 'API Token', '737687262dc5783ea3a900af42011795281f487b40b877037e6e62af7ef0b6af', '[\"*\"]', NULL, NULL, '2025-09-30 06:52:53', '2025-09-30 06:52:53', '2025-09-30 06:52:53');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
CREATE TABLE IF NOT EXISTS `reviews` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `remarks` mediumtext COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=Active, 0=Inactive',
  `created_by` bigint UNSIGNED DEFAULT NULL COMMENT 'Stores the ID of the user who created the record',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Stores the creation time of the record',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Stores the last update time of the record',
  PRIMARY KEY (`id`),
  KEY `reviews_created_by_foreign` (`created_by`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'web', '2025-01-10 23:47:09', '2025-01-10 23:47:09'),
(2, 'Owner', 'web', '2025-08-30 00:34:59', '2025-08-30 00:34:59');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

DROP TABLE IF EXISTS `role_has_permissions`;
CREATE TABLE IF NOT EXISTS `role_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(13, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(53, 1),
(54, 1),
(55, 1),
(56, 1),
(57, 1),
(58, 1),
(59, 1),
(60, 1),
(61, 1),
(62, 1),
(63, 1),
(64, 1),
(65, 1),
(66, 1),
(67, 1),
(68, 1),
(69, 1),
(70, 1),
(71, 1),
(72, 1),
(73, 1),
(74, 1),
(75, 1),
(76, 1),
(77, 1),
(78, 1),
(79, 1),
(80, 1),
(82, 1),
(83, 1),
(84, 1),
(85, 1),
(86, 1),
(87, 1),
(88, 1),
(89, 1),
(90, 1),
(91, 1),
(92, 1),
(93, 1),
(94, 1),
(95, 1),
(96, 1),
(97, 1),
(98, 1),
(99, 1),
(100, 1),
(101, 1),
(102, 1),
(103, 1),
(104, 1),
(105, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

DROP TABLE IF EXISTS `sliders`;
CREATE TABLE IF NOT EXISTS `sliders` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remarks` mediumtext COLLATE utf8mb4_unicode_ci,
  `hierarchy` bigint UNSIGNED DEFAULT NULL COMMENT 'Lower value means higher priority',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=Active, 0=Inactive',
  `created_by` bigint UNSIGNED DEFAULT NULL COMMENT 'Stores the ID of the user who created the record',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Stores the creation time of the record',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Stores the last update time of the record',
  PRIMARY KEY (`id`),
  KEY `sliders_created_by_foreign` (`created_by`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `name`, `image`, `remarks`, `hierarchy`, `status`, `created_by`, `created_at`, `updated_at`) VALUES
(1, NULL, 'images/sliders/1756792919_68b68857978eb.jpeg', NULL, 1, 1, 1, '2025-08-30 02:01:36', '2025-09-02 00:01:59'),
(2, NULL, 'images/sliders/1756540991_68b2b03f46b29.jpg', NULL, 2, 1, 1, '2025-08-30 02:03:11', '2025-08-30 02:03:11'),
(9, NULL, 'images/sliders/1756839632_68b73ed077bfa.jpeg', NULL, 0, 1, 1, '2025-09-02 13:00:32', '2025-09-02 13:00:32'),
(8, NULL, 'images/sliders/1756806889_68b6bee964c59.jpeg', NULL, 4, 1, 1, '2025-09-02 03:54:49', '2025-09-02 03:54:49'),
(6, NULL, 'images/sliders/1756793006_68b688ae318e0.jpeg', NULL, 2, 1, 1, '2025-09-02 00:03:26', '2025-09-02 02:29:41'),
(7, NULL, 'images/sliders/1756801797_68b6ab05a7558.jpeg', NULL, 3, 1, 1, '2025-09-02 02:29:57', '2025-09-02 02:29:57');

-- --------------------------------------------------------

--
-- Table structure for table `todo_lists`
--

DROP TABLE IF EXISTS `todo_lists`;
CREATE TABLE IF NOT EXISTS `todo_lists` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED NOT NULL,
  `buy_id` bigint UNSIGNED NOT NULL,
  `rule_key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rule_value` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remarks` mediumtext COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=Active, 0=Inactive',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Stores the creation time of the record',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Stores the last update time of the record',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_about_us`
--

DROP TABLE IF EXISTS `t_about_us`;
CREATE TABLE IF NOT EXISTS `t_about_us` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `individual_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `individual_description` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_description` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `individual_tab_description` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_tab_description` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=Active, 0=Inactive',
  `created_by` bigint UNSIGNED DEFAULT NULL COMMENT 'Admin user who created the record',
  `updated_by` bigint UNSIGNED DEFAULT NULL COMMENT 'Admin user who last updated the record',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Stores the creation time of the record',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Stores the last update time of the record',
  PRIMARY KEY (`id`),
  KEY `t_about_us_created_by_foreign` (`created_by`),
  KEY `t_about_us_updated_by_foreign` (`updated_by`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_admin_notes`
--

DROP TABLE IF EXISTS `t_admin_notes`;
CREATE TABLE IF NOT EXISTS `t_admin_notes` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `owner_info_page` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `business_info_step_1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `business_info_step_2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `business_info_step_3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `business_info_step_4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `business_info_step_5` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `business_info_step_6` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `business_info_step_7` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=Active, 0=Inactive',
  `created_by` bigint UNSIGNED DEFAULT NULL COMMENT 'Admin user who created the record',
  `updated_by` bigint UNSIGNED DEFAULT NULL COMMENT 'Admin user who last updated the record',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Stores the creation time of the record',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Stores the last update time of the record',
  PRIMARY KEY (`id`),
  KEY `t_admin_notes_created_by_foreign` (`created_by`),
  KEY `t_admin_notes_updated_by_foreign` (`updated_by`),
  KEY `t_admin_notes_owner_info_page_index` (`owner_info_page`),
  KEY `t_admin_notes_business_info_step_1_index` (`business_info_step_1`),
  KEY `t_admin_notes_business_info_step_2_index` (`business_info_step_2`),
  KEY `t_admin_notes_business_info_step_3_index` (`business_info_step_3`),
  KEY `t_admin_notes_business_info_step_4_index` (`business_info_step_4`),
  KEY `t_admin_notes_business_info_step_5_index` (`business_info_step_5`),
  KEY `t_admin_notes_business_info_step_6_index` (`business_info_step_6`),
  KEY `t_admin_notes_business_info_step_7_index` (`business_info_step_7`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_admin_privacy_policies`
--

DROP TABLE IF EXISTS `t_admin_privacy_policies`;
CREATE TABLE IF NOT EXISTS `t_admin_privacy_policies` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=Active, 0=Inactive',
  `created_by` bigint UNSIGNED DEFAULT NULL COMMENT 'Admin user who created the record',
  `updated_by` bigint UNSIGNED DEFAULT NULL COMMENT 'Admin user who last updated the record',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Stores the creation time of the record',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Stores the last update time of the record',
  PRIMARY KEY (`id`),
  KEY `t_admin_privacy_policies_created_by_foreign` (`created_by`),
  KEY `t_admin_privacy_policies_updated_by_foreign` (`updated_by`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_admin_users`
--

DROP TABLE IF EXISTS `t_admin_users`;
CREATE TABLE IF NOT EXISTS `t_admin_users` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_code` varchar(7) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Stores the user''s hashed password with minimum 8length',
  `address` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zip_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1=Active, 0=Inactive',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Stores the creation time of the record',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Stores the last update time of the record',
  PRIMARY KEY (`id`),
  UNIQUE KEY `t_admin_users_email_unique` (`email`),
  UNIQUE KEY `t_admin_users_phone_number_unique` (`phone_number`),
  KEY `t_admin_users_name_index` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `t_admin_users`
--

INSERT INTO `t_admin_users` (`id`, `name`, `email`, `country_code`, `phone_number`, `password`, `address`, `country`, `state`, `city`, `zip_code`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'sabbir@gmail.com', NULL, '01738305885', '$2y$12$rlZBu41ONvo8AWZvEgvHged1F5UbM.xbsjR7ViN5J3cxF3EMoZhWO', '12/12', 'Bangladesh', 'Dhaka', 'Dhaka', '1200', 0, '2025-01-10 23:47:09', '2025-08-30 00:48:18');

-- --------------------------------------------------------

--
-- Table structure for table `t_admin_versions`
--

DROP TABLE IF EXISTS `t_admin_versions`;
CREATE TABLE IF NOT EXISTS `t_admin_versions` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `version` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=Active, 0=Inactive',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Stores the creation time of the record',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Stores the last update time of the record',
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `t_admin_versions_version_index` (`version`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_app_terms_and_conditions`
--

DROP TABLE IF EXISTS `t_app_terms_and_conditions`;
CREATE TABLE IF NOT EXISTS `t_app_terms_and_conditions` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `page_1_heading` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `page_2_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `page_2_heading` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `page_2_description` mediumtext COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=Active, 0=Inactive',
  `created_by` bigint UNSIGNED DEFAULT NULL COMMENT 'Admin user who created the record',
  `updated_by` bigint UNSIGNED DEFAULT NULL COMMENT 'Admin user who last updated the record',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Stores the creation time of the record',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Stores the last update time of the record',
  PRIMARY KEY (`id`),
  KEY `t_app_terms_and_conditions_created_by_foreign` (`created_by`),
  KEY `t_app_terms_and_conditions_updated_by_foreign` (`updated_by`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_business_categories`
--

DROP TABLE IF EXISTS `t_business_categories`;
CREATE TABLE IF NOT EXISTS `t_business_categories` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Restaurant, Law Firm',
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=Active, 0=Inactive',
  `created_by` bigint UNSIGNED DEFAULT NULL COMMENT 'Admin user who created the record',
  `updated_by` bigint UNSIGNED DEFAULT NULL COMMENT 'Admin user who last updated the record',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Stores the creation time of the record',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Stores the last update time of the record',
  PRIMARY KEY (`id`),
  KEY `t_business_categories_created_by_foreign` (`created_by`),
  KEY `t_business_categories_updated_by_foreign` (`updated_by`),
  KEY `t_business_categories_name_index` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_business_profile_visitors`
--

DROP TABLE IF EXISTS `t_business_profile_visitors`;
CREATE TABLE IF NOT EXISTS `t_business_profile_visitors` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `device_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `business_id` bigint UNSIGNED DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=Active, 0=Inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `t_business_profile_visitors_device_id_unique` (`device_id`),
  KEY `t_business_profile_visitors_business_id_index` (`business_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_business_sub_categories`
--

DROP TABLE IF EXISTS `t_business_sub_categories`;
CREATE TABLE IF NOT EXISTS `t_business_sub_categories` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `category_id` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=Active, 0=Inactive',
  `created_by` bigint UNSIGNED DEFAULT NULL COMMENT 'Admin user who created the record',
  `updated_by` bigint UNSIGNED DEFAULT NULL COMMENT 'Admin user who last updated the record',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Stores the creation time of the record',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Stores the last update time of the record',
  PRIMARY KEY (`id`),
  KEY `t_business_sub_categories_created_by_foreign` (`created_by`),
  KEY `t_business_sub_categories_updated_by_foreign` (`updated_by`),
  KEY `t_business_sub_categories_name_index` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_business_types`
--

DROP TABLE IF EXISTS `t_business_types`;
CREATE TABLE IF NOT EXISTS `t_business_types` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Online Retail, Local Store, Service Business',
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=Active, 0=Inactive',
  `created_by` bigint UNSIGNED DEFAULT NULL COMMENT 'Admin user who created the record',
  `updated_by` bigint UNSIGNED DEFAULT NULL COMMENT 'Admin user who last updated the record',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Stores the creation time of the record',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Stores the last update time of the record',
  PRIMARY KEY (`id`),
  KEY `t_business_types_created_by_foreign` (`created_by`),
  KEY `t_business_types_updated_by_foreign` (`updated_by`),
  KEY `t_business_types_name_index` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_checkout_text_data`
--

DROP TABLE IF EXISTS `t_checkout_text_data`;
CREATE TABLE IF NOT EXISTS `t_checkout_text_data` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_description` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `list` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=Active, 0=Inactive',
  `created_by` bigint UNSIGNED DEFAULT NULL COMMENT 'Admin user who created the record',
  `updated_by` bigint UNSIGNED DEFAULT NULL COMMENT 'Admin user who last updated the record',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Stores the creation time of the record',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Stores the last update time of the record',
  PRIMARY KEY (`id`),
  KEY `t_checkout_text_data_created_by_foreign` (`created_by`),
  KEY `t_checkout_text_data_updated_by_foreign` (`updated_by`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_company_infos`
--

DROP TABLE IF EXISTS `t_company_infos`;
CREATE TABLE IF NOT EXISTS `t_company_infos` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `system_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_identification_no` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_id` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state_id` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city_id` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_code` bigint UNSIGNED DEFAULT NULL,
  `lat` decimal(10,7) DEFAULT NULL COMMENT 'address latitude',
  `long` decimal(10,7) DEFAULT NULL COMMENT 'address longitude',
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `favicon_icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linkedIn_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `youtube_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=Active, 0=Inactive',
  `created_by` bigint UNSIGNED DEFAULT NULL COMMENT 'Admin user who created the record',
  `updated_by` bigint UNSIGNED DEFAULT NULL COMMENT 'Admin user who last updated the record',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Stores the creation time of the record',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Stores the last update time of the record',
  PRIMARY KEY (`id`),
  UNIQUE KEY `t_company_infos_email_unique` (`email`),
  KEY `t_company_infos_created_by_foreign` (`created_by`),
  KEY `t_company_infos_updated_by_foreign` (`updated_by`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `t_company_infos`
--

INSERT INTO `t_company_infos` (`id`, `system_name`, `owner_name`, `email`, `phone_number`, `business_identification_no`, `address`, `country_id`, `state_id`, `city_id`, `zip_code`, `lat`, `long`, `logo`, `favicon_icon`, `website_link`, `facebook_id`, `linkedIn_id`, `youtube_link`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'BD Funded Trader', '', '', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'images/logo/app.jpg', 'images/logo/app.jpg', NULL, NULL, NULL, NULL, 1, NULL, NULL, '2025-09-08 15:03:16', '2025-09-08 15:04:42');

-- --------------------------------------------------------

--
-- Table structure for table `t_dashboard_todo_lists`
--

DROP TABLE IF EXISTS `t_dashboard_todo_lists`;
CREATE TABLE IF NOT EXISTS `t_dashboard_todo_lists` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `account_type` enum('personal','business') COLLATE utf8mb4_unicode_ci NOT NULL,
  `todo_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=Active, 0=Inactive',
  `checkbox_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=Active, 0=Inactive',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Stores the creation time of the record',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Stores the last update time of the record',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_days`
--

DROP TABLE IF EXISTS `t_days`;
CREATE TABLE IF NOT EXISTS `t_days` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=Active, 0=Inactive',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Stores the creation time of the record',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Stores the last update time of the record',
  PRIMARY KEY (`id`),
  KEY `t_days_name_index` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `t_days`
--

INSERT INTO `t_days` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Monday', 1, '2025-01-11 05:47:09', '2025-01-11 05:47:09'),
(2, 'Tuesday', 1, '2025-01-11 05:47:09', '2025-01-11 05:47:09'),
(3, 'Wednesday', 1, '2025-01-11 05:47:09', '2025-01-11 05:47:09'),
(4, 'Thursday', 1, '2025-01-11 05:47:09', '2025-01-11 05:47:09'),
(5, 'Friday', 1, '2025-01-11 05:47:09', '2025-01-11 05:47:09'),
(6, 'Saturday', 1, '2025-01-11 05:47:09', '2025-01-11 05:47:09'),
(7, 'Sunday', 0, '2025-01-11 05:47:09', '2025-01-11 05:47:09');

-- --------------------------------------------------------

--
-- Table structure for table `t_deposits`
--

DROP TABLE IF EXISTS `t_deposits`;
CREATE TABLE IF NOT EXISTS `t_deposits` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `binance_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT '0.00',
  `deposit_proof` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_status` tinyint NOT NULL DEFAULT '0',
  `remarks` mediumtext COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=Active, 0=Inactive',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Stores the creation time of the record',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Stores the last update time of the record',
  PRIMARY KEY (`id`),
  KEY `t_deposits_user_id_index` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `t_deposits`
--

INSERT INTO `t_deposits` (`id`, `user_id`, `binance_id`, `amount`, `deposit_proof`, `order_id`, `payment_status`, `remarks`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, '892208461', 100.00, 'images/depositProof/1757134098_68bbbd126bcc1.jpg', '385037932012298240', 1, NULL, 1, '2025-09-05 22:48:18', '2025-09-05 22:48:45'),
(2, 52, '892208461', 15.00, 'images/depositProof/1757259493_68bda6e5cf0af.png', '385307192213233664', 1, NULL, 1, '2025-09-07 09:38:13', '2025-09-07 09:39:47'),
(3, 67, '892208461', 20.00, 'images/depositProof/1757265321_68bdbda96c9b2.jpg', NULL, 2, NULL, 1, '2025-09-07 11:15:21', '2025-09-07 21:30:34'),
(4, 21, '892208461', 10.00, 'images/depositProof/1757268118_68bdc89608988.jpg', '22222222', 2, NULL, 1, '2025-09-07 12:01:58', '2025-09-07 21:30:42'),
(5, 88, '892208461', 15.00, 'images/depositProof/1757306067_68be5cd31fc9d.jpg', '385407236939153408', 1, NULL, 1, '2025-09-07 22:34:27', '2025-09-07 22:34:44'),
(6, 37, '892208461', 15.00, 'images/depositProof/1757310884_68be6fa4573d1.jpg', '916647546', 1, NULL, 1, '2025-09-07 23:54:44', '2025-09-07 23:56:45'),
(7, 37, '892208461', 15.00, 'images/depositProof/1757311018_68be702a849f9.jpg', '916647546', 2, NULL, 1, '2025-09-07 23:56:58', '2025-09-08 01:47:23'),
(8, 32, '892208461', 15.00, 'images/depositProof/1757315697_68be82710e736.png', '385427917184532480', 1, NULL, 1, '2025-09-08 01:14:57', '2025-09-08 01:18:41'),
(9, 92, '892208461', 15.00, 'images/depositProof/1757392260_68bfad8461687.png', '385592343579516928', 1, NULL, 1, '2025-09-08 22:31:00', '2025-09-08 22:33:53'),
(10, 140, '892208461', 15.00, 'images/depositProof/1757682194_68c41a12796bf.jpg', '386214997752348672', 1, NULL, 1, '2025-09-12 07:03:14', '2025-09-12 07:05:11'),
(11, 140, '892208461', 15.00, 'images/depositProof/1757682199_68c41a172dc30.jpg', '386214997752348672', 2, NULL, 1, '2025-09-12 07:03:19', '2025-09-12 07:05:19'),
(12, 93, '892208461', 15.00, 'images/depositProof/1757744960_68c50f40db89c.jpg', '386349778431197184', 2, NULL, 1, '2025-09-13 00:29:20', '2025-09-13 00:46:08'),
(13, 93, '892208461', 15.00, 'images/depositProof/1757744961_68c50f41ad7ad.jpg', '386349778431197184', 1, NULL, 1, '2025-09-13 00:29:21', '2025-09-13 00:45:59'),
(14, 66, '892208461', 15.00, 'images/depositProof/1757918694_68c7b5e60524d.jpg', '386722821876760576', 1, NULL, 1, '2025-09-15 00:44:54', '2025-09-15 01:02:32'),
(15, 70, '892208461', 15.00, 'images/depositProof/1758098011_68ca725bc26e2.jpg', '387106661035204608', 2, NULL, 1, '2025-09-17 02:33:31', '2025-09-17 03:20:26'),
(16, 70, '892208461', 15.00, 'images/depositProof/1758098177_68ca7301ac7d0.jpg', '387106661035204608', 1, NULL, 1, '2025-09-17 02:36:17', '2025-09-17 03:20:37');

-- --------------------------------------------------------

--
-- Table structure for table `t_generic_codes`
--

DROP TABLE IF EXISTS `t_generic_codes`;
CREATE TABLE IF NOT EXISTS `t_generic_codes` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `source_table_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `field_name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Stores the creation time of the record',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Stores the last update time of the record',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `t_generic_codes`
--

INSERT INTO `t_generic_codes` (`id`, `source_table_name`, `field_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 't_admin_users', 'status', '1=Active, 0=Inactive', '2025-01-11 05:47:09', '2025-01-11 05:47:09'),
(2, 'users', 'account_type', 'G=General, GB=General+Business', '2025-01-11 05:47:09', '2025-01-11 05:47:09');

-- --------------------------------------------------------

--
-- Table structure for table `t_invests`
--

DROP TABLE IF EXISTS `t_invests`;
CREATE TABLE IF NOT EXISTS `t_invests` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `category_id` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `package_id` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `return_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `order_id` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invest_proof` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `investment_type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=Success, 0=Processing, 2=Failed',
  `binance_id` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remarks` mediumtext COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=Active, 0=Inactive',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Stores the creation time of the record',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Stores the last update time of the record',
  PRIMARY KEY (`id`),
  KEY `t_invests_user_id_index` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `t_invests`
--

INSERT INTO `t_invests` (`id`, `user_id`, `category_id`, `package_id`, `amount`, `return_amount`, `order_id`, `invest_proof`, `investment_type`, `payment_status`, `binance_id`, `remarks`, `status`, `created_at`, `updated_at`) VALUES
(1, 3, NULL, 'Trusted Company Flexible Share Buy', 1.00, 0.00, NULL, NULL, 'flexible', 1, NULL, NULL, 1, '2025-09-27 06:17:01', '2025-09-28 07:06:40'),
(2, 3, NULL, 'Trusted Company Locked Share Buy', 1.00, 0.00, NULL, NULL, 'locked', 1, NULL, NULL, 1, '2025-09-28 14:22:32', '2025-09-28 14:22:32'),
(3, 3, NULL, 'Copy Account', 50.00, 55.00, NULL, NULL, 'copy', 2, NULL, NULL, 1, '2025-09-30 07:06:49', '2025-09-30 08:45:19');

-- --------------------------------------------------------

--
-- Table structure for table `t_payments`
--

DROP TABLE IF EXISTS `t_payments`;
CREATE TABLE IF NOT EXISTS `t_payments` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `business_id` bigint UNSIGNED NOT NULL,
  `payment_method` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_number` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expire_date` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cvc_number` bigint UNSIGNED NOT NULL,
  `billing_address` mediumtext COLLATE utf8mb4_unicode_ci,
  `subscription_plan_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payable_amount` double UNSIGNED NOT NULL DEFAULT '0',
  `paid_amount` double UNSIGNED NOT NULL DEFAULT '0',
  `currency` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trx_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expand` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1=Payment Successful, 0=Payment Failed',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Stores the creation time of the record',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Stores the last update time of the record',
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `t_payments_business_id_index` (`business_id`),
  KEY `t_payments_card_number_index` (`card_number`),
  KEY `t_payments_expire_date_index` (`expire_date`),
  KEY `t_payments_cvc_number_index` (`cvc_number`),
  KEY `t_payments_subscription_plan_name_index` (`subscription_plan_name`),
  KEY `t_payments_paid_amount_index` (`paid_amount`),
  KEY `t_payments_trx_id_index` (`trx_id`),
  KEY `t_payments_status_index` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'name means fullname',
  `first_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `profile_photo` text COLLATE utf8mb4_unicode_ci,
  `country_code` varchar(7) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Stores the user''s hashed password with minimum 8length',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `google_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `refer_code` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `own_refer_code` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `level` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT 'Level 1',
  `total_deposit_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `total_invest_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `total_withdraw_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `total_commission_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `address` mediumtext COLLATE utf8mb4_unicode_ci,
  `country` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_code` bigint UNSIGNED DEFAULT NULL,
  `account_type` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'G' COMMENT 'G=General Account, GB=General+Business Account',
  `otp` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `otp_expires_at` timestamp NULL DEFAULT NULL,
  `otp_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1=Used, 0=Unused',
  `save_business_list` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1=Active, 0=Inactive',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Stores the creation time of the record',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Stores the last update time of the record',
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_phone_number` (`phone_number`),
  KEY `users_name_index` (`name`),
  KEY `users_email_index` (`email`),
  KEY `users_phone_number_index` (`phone_number`),
  KEY `users_account_type_index` (`account_type`),
  KEY `users_status_index` (`status`),
  KEY `users_created_at_index` (`created_at`),
  KEY `users_updated_at_index` (`updated_at`)
) ENGINE=MyISAM AUTO_INCREMENT=151 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `first_name`, `last_name`, `email`, `profile_photo`, `country_code`, `phone_number`, `email_verified_at`, `password`, `remember_token`, `google_id`, `avatar`, `refer_code`, `own_refer_code`, `level`, `total_deposit_amount`, `total_invest_amount`, `total_withdraw_amount`, `total_commission_amount`, `address`, `country`, `state`, `city`, `zip_code`, `account_type`, `otp`, `otp_expires_at`, `otp_status`, `save_business_list`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'MD SABBIR', NULL, NULL, 'alammdsabbir128@gmail.com', 'images/profile_photos/1757084984_68bafd38c93f3.jpg', NULL, '01775228249', NULL, '$2y$12$7cWx8wW8Tq4ZXJtT3fUZ9.jr1C1cObTNd.GajiFGJmWqv3RWHFc0m', NULL, NULL, NULL, NULL, '850', 'Level 1', 40.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-05 09:02:32', '2025-09-05 22:50:33', NULL),
(2, 'Sakil', NULL, NULL, 'sakilislam0587@gmail.com', NULL, NULL, '01779749479', NULL, '$2y$12$4YtQg5I7QFELkU8AHc6PduBj7fnITlhUhHaT0QMUNsaG1S6E6D18.', NULL, NULL, NULL, NULL, '6631', 'Level 1', 32.00, 0.00, 0.00, 32.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-05 10:14:17', '2025-09-28 14:47:48', NULL),
(3, 'Mr. Dev', NULL, NULL, 'nazimuddin11121@gmail.com', NULL, NULL, '01767676543', NULL, '$2y$12$zIacY9mbVrMEi7IDZNccLus0wVIAN2K2Go/DuDaBNARQUlFAN4.uq', NULL, NULL, NULL, '6631', '428', 'Level 1', 230.00, 200.00, 0.00, 4.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-05 10:31:30', '2025-09-30 08:45:19', NULL),
(4, 'Md Maruf', NULL, NULL, 'mdmaruf000009999900000@gmail.com', NULL, NULL, NULL, NULL, '$2y$12$I2tdhJFAbMTJ7Lzna4nfGu9O2kMIXqPxWD3PsEJcjKg4woc1ABZ3m', NULL, '111332151019493999863', 'https://lh3.googleusercontent.com/a/ACg8ocJRasTVgsW3uHcFbLs4S67Ip75oT-baTeBrjw7mZb45rC58XQ=s96-c', NULL, '2388', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-05 12:01:34', '2025-09-05 12:01:34', NULL),
(5, 'Mim islam Mim', NULL, NULL, 'tradermim717@gmail.com', NULL, NULL, NULL, NULL, '$2y$12$67rVI2Vd0KFh.P4GZBGKfuZLT3MkBgnd/2l68rxf.w5LkYaUF2L9q', NULL, '109454865928324846946', 'https://lh3.googleusercontent.com/a/ACg8ocLcFs_r_VYkc1a-tI7pzxxc1WXizlgVwYTppQHrT5liraYCdQ=s96-c', NULL, '8809', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-05 22:17:50', '2025-09-05 22:17:50', NULL),
(6, 'Md Abdullah ali', NULL, NULL, 'mabdullahali151@gmail.com', NULL, NULL, NULL, NULL, '$2y$12$tH67evx0WUaNOrYu4ZrWg.xqXvgGtgqAOBzl2h9OEWKWZGC138LKK', NULL, '106499401102897416838', 'https://lh3.googleusercontent.com/a/ACg8ocJ_gRCnRGAX6DI1STv_Q76r_P_lic87IRoIvqSJNUbzbALXlA=s96-c', NULL, '7828', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-05 23:09:04', '2025-09-05 23:09:04', NULL),
(7, 'Jahid Ripto', NULL, NULL, 'jahidripto@gmail.com', NULL, NULL, NULL, NULL, '$2y$12$ICbLoljMpp4lOS1lIPTdI.rIZPgEWDG.CHbJ2D/Nht9ZrO1oQE7we', NULL, '109517353570386766271', 'https://lh3.googleusercontent.com/a/ACg8ocLSpdsFjo8ZpIUJJ5hPrFLUmRMYHsxMndkPpXJz4ljwPrwNaA=s96-c', NULL, '5825', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-06 01:06:45', '2025-09-06 01:06:45', NULL),
(8, 'Sumi Islam Toha', NULL, NULL, 'tohaislam104@gmail.com', NULL, NULL, '01644547137', NULL, '$2y$12$InAVE37KtKZfE9fMZ4Ld2eQHTBOokO3MVITAuiA1GViVeqlIRztP6', NULL, NULL, NULL, NULL, '7512', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-06 14:21:02', '2025-09-06 14:21:02', NULL),
(9, 'BD FUNDED TRADER', NULL, NULL, 'bdfundedtrader0046@gmail.com', NULL, NULL, NULL, NULL, '$2y$12$j3EyvHBKKCEWkTt2jXC8K.V8ZMBS9dKKi0Iu5x4Ue37ijMMjP2DS.', NULL, '118400990547166906377', 'https://lh3.googleusercontent.com/a/ACg8ocI7slioPjxpeB7Y0VyW80NvTEOkmVAr9Q89qNUNVmCsiXildQ=s96-c', NULL, '8510', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-06 23:22:53', '2025-09-06 23:22:53', NULL),
(10, 'Ah_Abdullah 99', NULL, NULL, 'abdullahtwu7@gmail.com', NULL, NULL, '01792831693', NULL, '$2y$12$hbYSaYnZ/KTfr2HQFys5belvhWMs/QA99xchFo9eRwRUvOzHPQAUu', NULL, NULL, NULL, '850', '3368', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-07 04:43:12', '2025-09-07 04:43:12', NULL),
(11, 'Md pias', NULL, NULL, 'mdpias001112@gmail.com', NULL, NULL, '01761934148', NULL, '$2y$12$htL2iynODAkrUR3FkcuObeWse/V7Y2KuY8w4mjI4tH4QzdwnBCx72', NULL, NULL, NULL, '850', '5101', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-07 06:43:59', '2025-09-07 06:43:59', NULL),
(12, 'Mustakim', NULL, NULL, 'mymustakim67@gmail.com', NULL, NULL, NULL, NULL, '$2y$12$L6ImPM.opS25R2e4Jw6Xte4U12w7ToDQttfkge0GPsRmDieaT7M7e', NULL, '113458268743594835644', 'https://lh3.googleusercontent.com/a/ACg8ocIvVXn0jkd4bLY2vIUXpfyjOQeljZDX5RWEwkIavnUNtAMh9w=s96-c', NULL, '6670', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-07 08:28:50', '2025-09-07 08:28:50', NULL),
(13, 'Tasho Trader', NULL, NULL, 'tashotrader05@gmail.com', NULL, NULL, NULL, NULL, '$2y$12$moRaO2houAMofkexseZIO.lfhEkIhGKT59oaFDdd0uHC1zDhsraLm', NULL, '101463121301183381977', 'https://lh3.googleusercontent.com/a/ACg8ocKkv7W56fE9OT8Db3GpztvbJThrQpE38KMut6LvNe7Z7r9CcQ=s96-c', NULL, '4560', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-07 08:29:01', '2025-09-07 08:29:01', NULL),
(14, 'Ratul Goswami', NULL, NULL, 'technocitypbn@gmail.com', NULL, NULL, NULL, NULL, '$2y$12$/cViO6S5dGtq94xht/eRZOzAhw16OdvIWWwB8l./c8dvnSWV8f8Km', NULL, '104835767764643036771', 'https://lh3.googleusercontent.com/a/ACg8ocL6CFBavz6ETB27BvbeU8oV2sBa3QUzNiGJssWUZZ1b4WlsiPLz=s96-c', NULL, '9126', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-07 08:29:28', '2025-09-07 08:29:28', NULL),
(15, 'RS', NULL, NULL, 'sssnirob71@gmail.com', 'images/profile_photos/1757255482_68bd973ace9e0.png', NULL, 'SAKIB', NULL, '$2y$12$MkjFpKPJn914NTMUI5O82eK97JIs.N5gZL97em3PDqj6aqsWNuC9a', NULL, NULL, NULL, '850', '2515', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-07 08:29:51', '2025-09-07 08:31:22', NULL),
(16, 'Sandip karmakar', NULL, NULL, 'sandip.karmakar.dip.01@gmail.com', NULL, NULL, '01617000467', NULL, '$2y$12$3y8SiC4Vi1bNqoVWhDh6FeiZxe/MCBIxQD1rHLk0tPQZzq3DkHS6i', NULL, NULL, NULL, '850', '4578', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-07 08:31:29', '2025-09-07 08:31:29', NULL),
(17, 'PRITOM', NULL, NULL, 'pritomprionto@gmail.com', NULL, NULL, '01758989338', NULL, '$2y$12$9cMkjBrEJK2d2t0tyMvjF.UvSWm.HNdZAaOwOdPzioSVFiFepPEl6', NULL, NULL, NULL, '850', '9487', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-07 08:31:56', '2025-09-07 08:31:56', NULL),
(18, 'Moly Ghosh', NULL, NULL, 'ghoshmoly338@gmail.com', NULL, NULL, NULL, NULL, '$2y$12$sNAOLd144LlQueGsrDG4Ou6XZ559M3xvz4Fe2KM88ujn2Q2KI0nsi', NULL, '110548815061371238255', 'https://lh3.googleusercontent.com/a/ACg8ocKuIcBpHykgUNonEiSKvjgtFkK68_8qnne0q75SJaCRpyFrl74=s96-c', NULL, '2845', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-07 08:32:11', '2025-09-07 08:32:11', NULL),
(19, 'Mustafizur Rahman Hridoy', NULL, NULL, 'm73067670@gmail.com', 'images/profile_photos/1757255770_68bd985ae7f55.png', NULL, '01956349419', NULL, '$2y$12$8RlaPVe94SrqqDrlRg0SR.ANE8QXdYwq.MEr6wgfbzA6qdvuOStNq', NULL, NULL, NULL, '850', '6344', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-07 08:33:28', '2025-09-07 08:36:10', NULL),
(20, 'Md Anamul', NULL, NULL, 'anamul5555555555@gmail.com', NULL, NULL, NULL, NULL, '$2y$12$sdwIgxAvpGchZU5a7YBZ1eBV3e3aU/66BvkRx6dHvpEqotJHxFRkm', NULL, '114754478861163320702', 'https://lh3.googleusercontent.com/a/ACg8ocKbeLaURe3esPbNvpymW2wyPi0oaoaXSRchAaI9MFCldfKYB0VPUg=s96-c', NULL, '4157', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-07 08:33:30', '2025-09-07 08:33:30', NULL),
(21, 'Md. Mahruf Sarkar', NULL, NULL, 'hossainsoadkhan@gmail.com', NULL, NULL, '01705154180', NULL, '$2y$12$HnO/ixcyUfvWLK660hW65eNDTMmfsJJyNFL3NRkXM0PZ4xgeYVRPi', NULL, NULL, NULL, '850', '2475', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-07 08:33:36', '2025-09-07 08:33:36', NULL),
(22, 'JOY JOY', NULL, NULL, 'googjoyjoy28@gmail.com', NULL, NULL, NULL, NULL, '$2y$12$ryGwccq6mpvjqlMlwLBeHu7Uwf4gSqOFqoM76MqSHSJ93wl2nwaFC', NULL, '109568575041364717478', 'https://lh3.googleusercontent.com/a/ACg8ocLRWxbPbJBiqzjiSG8raaVRJTalEk7mYfJd-vIi_mOF5v1vMw=s96-c', NULL, '683', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-07 08:34:18', '2025-09-07 08:34:18', NULL),
(23, 'Md RONI', NULL, NULL, 'mdronikhanui@gmail.com', NULL, NULL, '1642779732', NULL, '$2y$12$pBOVgF05VK3/Dy9vdQWTSeH7krydf/cyWkLoJ7dDniN/Pzo8N2ru.', NULL, NULL, NULL, '850', '9771', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-07 08:34:57', '2025-09-07 08:34:57', NULL),
(24, 'Mdkobir', NULL, NULL, 'mdkobir01501907205@gmail.com', NULL, NULL, '01401907205', NULL, '$2y$12$bb.UlNzLySHgyraLLAN55uPxWJwjnUZqSScFfK0M6hnq17NGB4vaq', NULL, NULL, NULL, '850', '2897', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-07 08:35:52', '2025-09-07 08:35:52', NULL),
(25, 'Bhagbat Karmakar', NULL, NULL, 'bhagbat.karmakar.0@gmail.com', NULL, NULL, NULL, NULL, '$2y$12$A3tzhkz/22.PV9rCvAPxeegW/PxI6nIdkApgMeN1Qo.tfVeZrlQ6S', NULL, '102035418094265798158', 'https://lh3.googleusercontent.com/a/ACg8ocLMn2YJc6ZhxKv4dUiUV2EQEiooacdxKqTrAVKNFGxka5FjOA=s96-c', NULL, '3668', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-07 08:36:48', '2025-09-07 08:36:48', NULL),
(26, 'Mahfijur Rahman Hammad', NULL, NULL, 'hammdahmed231@gmail.com', 'images/profile_photos/1757257420_68bd9ecc2d25a.jpg', NULL, '01775357943', NULL, '$2y$12$Tlskhx6f2zhxNw9wp0r4VO3I8s/OM75f2hWaDX53Ah20eI0kxta3W', NULL, NULL, NULL, '850', '3699', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-07 08:39:49', '2025-09-07 09:03:40', NULL),
(27, 'Ataf', NULL, NULL, 'miaafa99@gmail.com', NULL, NULL, '01948464857', NULL, '$2y$12$ZwAGLA9t6Ey8zSfRirkm2.7m9xwGPxxvfN/rAGpxp379SKH2/Kkqm', NULL, NULL, NULL, '850', '2675', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-07 08:40:14', '2025-09-07 08:40:14', NULL),
(28, 'Rafsan', NULL, NULL, 'sksrabon793@gmail.com', NULL, NULL, '01874091479', NULL, '$2y$12$R9cwejBObGGPr06xGaNdvOalSoP4ws84oZ30IUJlA1v3wMgN75mbi', NULL, NULL, NULL, '850', '5272', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-07 08:42:21', '2025-09-07 08:42:21', NULL),
(29, 'Hasib', NULL, NULL, 'amihasib.me@gmail.com', NULL, NULL, '01716138956', NULL, '$2y$12$pqKbGGOavGPN2R06hAIKY.A/3GMv4tpWkD.AAsozPYurefTVKIQlG', NULL, NULL, NULL, '850', '3881', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-07 08:43:03', '2025-09-07 08:43:03', NULL),
(30, 'Nazmul Hasan Rafat', NULL, NULL, 'mdh914374@gmail.com', 'images/profile_photos/1757256251_68bd9a3b86f2e.jpg', NULL, '01746640496', NULL, '$2y$12$viDNjAjy3PgM1MJgpQ7NAe7P8FeJGnyjoEBmE5P.79tEd7W7RNnsu', NULL, NULL, NULL, '850', '5287', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-07 08:43:45', '2025-09-07 08:44:11', NULL),
(31, 'Mujahid Rahman', NULL, NULL, 'mojahidrahman05@gmail.com', 'images/profile_photos/1757256400_68bd9ad098616.jpg', NULL, '01888787594', NULL, '$2y$12$jDcVF0oUII3Zxaq23KPR8Or1ie3m2kciInVNK7MPcQ.jNYEtitPCq', NULL, NULL, NULL, '850', '9871', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-07 08:44:18', '2025-09-07 08:46:40', NULL),
(32, 'RSSUMON', NULL, NULL, 'rssumonvai2025@gmail.com', 'images/profile_photos/1758844608_68d5d6c058e28.jpeg', NULL, '01933922967', NULL, '$2y$12$JTP6pr/haeM7hFiyB0lGU.SLQYyVwVl./qIr42A70PQM.UM2/HKOa', NULL, NULL, NULL, '850', '9715', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-07 08:44:30', '2025-09-25 17:56:48', NULL),
(33, 'Shimul', NULL, NULL, 'mdshimulali808@gmail.com', NULL, NULL, '01341162021', NULL, '$2y$12$a0GqbSGVF0mRbjTviTWjKec100AhkB9loQ8FJIlh.4Oa9FfkmHVeS', NULL, NULL, NULL, '805', '6897', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-07 08:44:36', '2025-09-07 08:44:36', NULL),
(34, 'Rifat Talukder Riad', NULL, NULL, 'riadlosser@gmail.com', NULL, NULL, '01714587426', NULL, '$2y$12$JKt9Z7DZXv4/pko4HKt/W.2kgKoVHrpUZsgvFSHc2NZknjKiBWik6', NULL, NULL, NULL, '850', '3882', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-07 08:44:49', '2025-09-07 08:44:49', NULL),
(35, 'Nafiz Trader', NULL, NULL, 'shahriarnafiz208@gmail.com', NULL, NULL, '01907357975', NULL, '$2y$12$vjiQgdiRkaoVGLhxNAds/OVLDAKQvebLbbs5g8lAmXIwQdyd7CqRS', NULL, NULL, NULL, '850', '6110', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-07 08:45:27', '2025-09-07 08:45:27', NULL),
(36, 'Ma Mayajj', NULL, NULL, 'mamayajj4@gmail.com', NULL, NULL, NULL, NULL, '$2y$12$yEjoPCwFFY4IFfRyE1xaTuVhfTUF2lJWxdo/CQu8MObSLQAhs8Ape', NULL, '106843407020901827952', 'https://lh3.googleusercontent.com/a/ACg8ocKR6nWlc32z318edDlAPtGrkkZxILaOsSyCSdsyzml0hlUEEA=s96-c', NULL, '1765', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-07 08:47:26', '2025-09-07 08:47:26', NULL),
(37, 'Abdur Rahman', NULL, NULL, 'abdurrahmansanim18@gmail.com', 'images/profile_photos/1757310991_68be700f3dce8.jpg', NULL, '01972791280', NULL, '$2y$12$OMkvJMrM4XLBG4rZfeuzIevF3DwaxZvF6j2kXitrZc36FBCbHtcL6', NULL, NULL, NULL, '850', '7997', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-07 08:51:46', '2025-09-07 23:57:24', NULL),
(38, 'Nazir', NULL, NULL, 'momotreader@gmail.com', NULL, NULL, '01831735932', NULL, '$2y$12$yuK09B.vXf5I22QBWfS8peqG5GdmS5gSG8ap5Dj.Y8wbfe0wwnZqi', NULL, NULL, NULL, '850', '6322', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-07 08:53:38', '2025-09-07 08:53:38', NULL),
(39, 'Jasim', NULL, NULL, 'jasim97594@gmail.com', NULL, NULL, '01833097594', NULL, '$2y$12$pmgGu1vZ81qxwfdgf4Dpe.RtebFoTbKYkN6BWgtixraUCGrY5aB7y', NULL, NULL, NULL, '850', '207', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-07 08:54:04', '2025-09-07 08:54:04', NULL),
(40, 'Tommoy Tommoy', NULL, NULL, 'tommoytommoy26@gmail.com', NULL, NULL, NULL, NULL, '$2y$12$k3jGs7O45aXiaA3gEBww0.6YVLqyVYliG13qWg15qaYTfvGfqdI2u', NULL, '100458030224401339320', 'https://lh3.googleusercontent.com/a/ACg8ocLPwE96ao164mbsW7zZoDAzMpJXPS3_8RqrHbHdGDd49cWphA=s96-c', NULL, '8045', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-07 08:54:27', '2025-09-07 08:54:27', NULL),
(41, 'Movin', NULL, NULL, 'movinm653@gimal.com', NULL, NULL, 'Movin', NULL, '$2y$12$hspadouD5BH5siGCooLvv.3D8d1e7MsrWQXuSgGrFe9Nf4C0sGphK', NULL, NULL, NULL, '850', '6186', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-07 08:54:50', '2025-09-07 08:54:50', NULL),
(42, 'Abir hasan', NULL, NULL, 'habijorrr4@gmail.com', NULL, NULL, '01780439720', NULL, '$2y$12$EXo5wTC7/V.bPvFy.cncJ.aJZJib7Al5JBPwkq0c1PcV9a62QP3TW', NULL, NULL, NULL, NULL, '1139', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-07 08:55:55', '2025-09-07 08:55:55', NULL),
(43, 'Ringku Ahmed', NULL, NULL, 'ringku11m@gmail.com', 'images/profile_photos/1757257583_68bd9f6f3c7c8.jpg', NULL, '01794309439', NULL, '$2y$12$2YurYXzwyByrBrUIib3cgOViAc8TS08V62GISgaC6BS7DPBZkfnG.', NULL, NULL, NULL, '850', '2229', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-07 08:59:20', '2025-09-07 09:06:23', NULL),
(44, 'Md Rakib', NULL, NULL, 'rxrabit1@gmail.com', NULL, NULL, '01310461290', NULL, '$2y$12$UuCqvkEAePGR/gVIjSnjF.pt7EjO6UZ44KdxF8sPekU.Y1G8jlJK2', NULL, NULL, NULL, '850', '7366', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-07 09:01:12', '2025-09-07 09:01:12', NULL),
(45, 'mahdi', NULL, NULL, 'www.mrmahadi999@gmail.com', NULL, NULL, '01758961285', NULL, '$2y$12$WB9oERLYmJXSn426o17UtOXwAWR7ubNkvqcUWgqMZ1toauElo0OwC', NULL, NULL, NULL, '850', '56', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-07 09:02:08', '2025-09-07 09:02:08', NULL),
(46, 'Shadow.hunter', NULL, NULL, 'shadow.hunter52251@gmail.com', NULL, NULL, NULL, NULL, '$2y$12$sNYU.pFz2AgCZYPSQ1AX3uLUIaLoVQPybnpSLoeo5ruSmNRLv6mr6', NULL, '103027335593386621138', 'https://lh3.googleusercontent.com/a/ACg8ocJuOzPnHio9Nu7DDHzU1MmXbnE9rKO_LNpw53Y_nqtMA_A1l08=s96-c', NULL, '6545', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-07 09:03:49', '2025-09-07 09:03:49', NULL),
(47, 'Sindid nur', NULL, NULL, 'sindidnur53@gmail.com', 'images/profile_photos/1757257957_68bda0e5b10b2.jpg', NULL, NULL, NULL, '$2y$12$GQD9h45AWqojcSc3jHaa5uaTWux/vXeRCTrBNCjmZWFWCspiV/5Yy', NULL, '101408892549956030990', 'https://lh3.googleusercontent.com/a/ACg8ocJysxR9CXe60aM-_5bLJ4BOr7j9e3CL1n1Rd2eukumecOf4MQ=s96-c', NULL, '5536', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-07 09:10:08', '2025-09-07 09:12:37', NULL),
(48, 'Saroare Hossen tamim', NULL, NULL, 'saroarehossentamim@gmail.com', NULL, NULL, NULL, NULL, '$2y$12$yVpv2n9x58Ck05ylGCWtmuJkpShCO3jKxCBDSg2XUG1eQccGL8KNu', NULL, '101414609265406150184', 'https://lh3.googleusercontent.com/a/ACg8ocJgFCOOInYZLe78D8wgcyrUH0PkYE853mIDLqt1anuwRCph0A=s96-c', NULL, '6591', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-07 09:15:35', '2025-09-07 09:15:35', NULL),
(49, 'Mehedi Alam', NULL, NULL, 'mehedialam175@gmail.com', NULL, NULL, NULL, NULL, '$2y$12$zUxXZUnHCloNysSfKeXQsuKoPzedUnj3a5VbEPWlEm93e/saj3GZ6', NULL, '113298279419212703020', 'https://lh3.googleusercontent.com/a/ACg8ocJDLepKlrAkxA_GZl5tY0ZLe_T_bd02jFDVr92FCKqCNZafRvCH=s96-c', NULL, '61', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-07 09:15:59', '2025-09-07 09:15:59', NULL),
(50, 'Md bellal ali', NULL, NULL, 'bealall376hquq65u27@gmail.com', NULL, NULL, '01305253657', NULL, '$2y$12$JrzyV5iktYJJu.9rj3X5W.cWUsc5oKEsOYDF9zcIVKu7koqQok0mW', NULL, NULL, NULL, '850', '1902', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-07 09:26:09', '2025-09-07 09:26:09', NULL),
(51, 'Sakil', NULL, NULL, 'minhazul9090@gmail.com', 'images/profile_photos/1757258963_68bda4d3693c1.jpg', NULL, '01779496848', NULL, '$2y$12$3xWUziOz6iSouvgWTpV05.nodL4SdrlQFRfCubqIvsRb4BrpaXgyO', NULL, NULL, NULL, NULL, '1383', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-07 09:28:02', '2025-09-07 09:29:23', NULL),
(52, 'abdolla', NULL, NULL, 'abirhasanr11@gmail.com', NULL, NULL, '01314721096', NULL, '$2y$12$rMaLymzvjUTWoaPkklUYcOPKSIol7P/ohKJzTGsNB2Z9jiil2T.0u', NULL, NULL, NULL, '850', '4156', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-07 09:31:00', '2025-09-07 15:53:58', NULL),
(53, 'Parves Vai', NULL, NULL, 'parves121790@gmail.com', NULL, NULL, NULL, NULL, '$2y$12$tPhyE9jOh2c1/46f/TEK5eaVz2CcwQFxLsBR35cu1/0Zp.thiyeYW', NULL, '115881912983456291191', 'https://lh3.googleusercontent.com/a/ACg8ocI7lRe_qzkavlmjJxxOA3fhFcCEz9otmhAQoYFgdBFa27_x7w=s96-c', NULL, '460', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-07 09:31:40', '2025-09-07 09:31:40', NULL),
(54, 'Ariyan Talukder', NULL, NULL, 'ariyantalukder58@gmail.com', NULL, NULL, '1748017924', NULL, '$2y$12$ZvpJRDN4CUgHawADHBPq8.iOnvrG97yGcBpjONTzI80.XlPyzObfi', NULL, NULL, NULL, '850', '5131', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-07 09:38:27', '2025-09-07 09:38:27', NULL),
(55, 'Fahad Ali', NULL, NULL, 'fa1705489@gmail.com', NULL, NULL, NULL, NULL, '$2y$12$.vtlCTTQKkGACKDSV6BAueWbzvVsKyNocupE8xv8pCgtmH0QaJ1Sy', NULL, '107211943769566483983', 'https://lh3.googleusercontent.com/a/ACg8ocKQuxc7WopdtZ-zNsXYf43NdQhHAjBQx8F2P8Rt5w4xGTLCbA=s96-c', NULL, '3318', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-07 09:46:21', '2025-09-07 09:46:21', NULL),
(56, 'Md Mehraj.', NULL, NULL, 'mtmehraj883@gmail.com', NULL, NULL, NULL, NULL, '$2y$12$ArktsbsPnisqWoLj00kW6OXEtK9Y/BG0RHCtESAJsUOOriA5Qs34C', NULL, '101507659902930096798', 'https://lh3.googleusercontent.com/a/ACg8ocKe8bobKlbVv1VWNyWNJnHlwdWvnzPFxE1-YAp5AlbpqHWhPQ=s96-c', NULL, '8543', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-07 09:46:43', '2025-09-07 09:46:43', NULL),
(57, 'Joy Sarker', NULL, NULL, 'joysarker20029@gmail.com', NULL, NULL, '01341692473', NULL, '$2y$12$4Nzh5P6BhfgL7jPpXGclzuucIcrDkvvjVe4YRPCGwapu2b1i.Y1Ta', NULL, NULL, NULL, '850', '5459', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-07 09:47:21', '2025-09-07 09:47:21', NULL),
(58, 'Mx Asif', NULL, NULL, 'mxasif52@gmail.com', NULL, NULL, '1646429901', NULL, '$2y$12$9pvHcb8U4Dy0h..K7PzKwOpBxguge/DeiCUiKxIdPmlZME1iM/1.2', NULL, NULL, NULL, '850', '5384', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-07 09:54:26', '2025-09-07 09:54:26', NULL),
(59, 'Aminul Mia', NULL, NULL, 'aminulmia76860@gmail.com', NULL, NULL, NULL, NULL, '$2y$12$3c2fDsMiXSUriWoswOucwuw4tBmve9bERMhEWhy.oiYz35Tgs7XP2', NULL, '106331696132385047756', 'https://lh3.googleusercontent.com/a/ACg8ocLOVvxSf9bisRpFa7AjBhmnPEPHocCNMprx7BThmXI-2tyx9A=s96-c', NULL, '148', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-07 10:14:26', '2025-09-07 10:14:26', NULL),
(60, 'Kskd Kdkdk', NULL, NULL, 'kdkdkkskd27@gmail.com', NULL, NULL, NULL, NULL, '$2y$12$d2EZsRb58KfOP5WQwPeNx.Yqdj7rqD0dG4bCNoosGCBVXPyQ7v.ie', NULL, '102239136715832249263', 'https://lh3.googleusercontent.com/a/ACg8ocKeh6yTSNWV4sUyvde3z-fiFCug8ZHMOotTFd3tBjZXj2tmng=s96-c', NULL, '4453', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-07 10:27:22', '2025-09-07 10:27:22', NULL),
(61, 'MDJAKIR HOSSEN', NULL, NULL, 'jakirhossenjakir6321@gmail.com', 'images/profile_photos/1757262635_68bdb32bd2764.jpg', NULL, '01820526365', NULL, '$2y$12$Jzk7Ojs7az.gSOxMa5t3BOJSkVPGvqduMIsUlS5aRXegj3CnpJp3e', NULL, NULL, NULL, '850', '5094', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-07 10:30:25', '2025-09-07 10:30:35', NULL),
(62, 'Raduan Ahmed', NULL, NULL, 'mdraduanraduan30@gmail.com', NULL, NULL, '01982239768', NULL, '$2y$12$ZbnlC/oX2r4l7NLihEaBw.UVZYO4ju0A9bVJ7s6iXtVM/QWdDL5U2', NULL, NULL, NULL, '850', '5097', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-07 10:38:32', '2025-09-07 10:38:32', NULL),
(63, 'Rahima Akter', NULL, NULL, 'azmanhamim7@gmail.com', NULL, NULL, '01624455021', NULL, '$2y$12$wdTMRUZVmPWE8ASxaBrdfudBhFkw9gy/4zgOLgTK06jWpAC1/ls7G', NULL, NULL, NULL, '850', '1097', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-07 10:39:45', '2025-09-07 10:39:45', NULL),
(64, 'William Trader Rifat', NULL, NULL, 'william.bd.official@gmail.com', 'images/profile_photos/1757275372_68bde4ec1eaf7.jpg', NULL, '01307612551', NULL, '$2y$12$Zyx2SxYj3fNJbwGTbQcSwekDw7OeAw3Mn.TjYPbLlPK7hV2pntfRe', NULL, NULL, NULL, '850', '7555', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-07 10:43:07', '2025-09-07 14:02:52', NULL),
(65, 'LST_RS SHAKIB 99', NULL, NULL, 'lstrsshakib@gmail.com', 'images/profile_photos/1757263899_68bdb81b7c0c5.jpg', NULL, '01982444782', NULL, '$2y$12$jNUnpg/Q48mF3smKt2.RL.Y4F0sCEdjNEX0dGU9z8oj9nb6gI3MQK', NULL, NULL, NULL, '850', '9441', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-07 10:49:28', '2025-09-07 10:51:44', NULL),
(66, 'MD EBADUL', NULL, NULL, 'mdarifebadul30@gmail.com', 'images/profile_photos/1757940275_68c80a33f2823.jpg', NULL, '01340407284', NULL, '$2y$12$D3SHC86EzsONUGmbpORsNeFFFvxO9btvDM7vaXfG/.XQI4cu8cZda', NULL, NULL, NULL, '850', '1773', 'Level 1', 0.00, 0.00, 15.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-07 10:58:58', '2025-09-16 01:20:37', NULL),
(67, 'Mohammad Sannu miah', NULL, NULL, 'mohammadsannumiah@gmail.com', 'images/profile_photos/1757265428_68bdbe1499f79.jpg', NULL, '+8801611510105', NULL, '$2y$12$VhogbNk0B4OoLKqDWO2ene4blMu7FS40/27vx2I9U26HcR0jUEWVO', NULL, NULL, NULL, '850', '5348', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-07 11:11:02', '2025-09-07 11:17:08', NULL),
(68, 'Shihab Morsalin', NULL, NULL, 'shihabmorsalin@gmail.com', NULL, NULL, NULL, NULL, '$2y$12$iBFW87PYckZOUeJUnM0UNe3bhg3.X5KtAKx545Iy9i.wW3OSDpTWC', NULL, '102450120697507698459', 'https://lh3.googleusercontent.com/a/ACg8ocLfcNfIZ_LXyvmw9iwPykcdDJd8TKxKugNir-6zsnrc8U1lK1Y=s96-c', NULL, '2904', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-07 11:16:01', '2025-09-07 11:16:01', NULL),
(69, 'Arman', NULL, NULL, 'nicedekho667@gmail.com', NULL, NULL, '01790984318', NULL, '$2y$12$iUsKyWvQw41ABByi.70FluJO9PYDUo9g6mDAyu3IsKX.xeKZKIl8C', NULL, NULL, NULL, '850', '4813', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-07 11:19:31', '2025-09-07 11:19:31', NULL),
(70, 'RAHIM', NULL, NULL, 'rahiqoutex@gmail.com', 'images/profile_photos/1758098643_68ca74d3c5aef.png', NULL, '01332798609', NULL, '$2y$12$ZjE4JY/s6VTyLOuDlWmFyOZni/vEt9T4doKt8U/ZUBIc1nfo5GuYa', NULL, NULL, NULL, '850', '165', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-07 11:19:46', '2025-09-17 04:35:15', NULL),
(71, 'Ami Hagi na', NULL, NULL, 'amihagina777@gmail.com', NULL, NULL, NULL, NULL, '$2y$12$M.LKhiTMa1Ks.f6XJqwhDeAPVB3w97NppX0HoSP8F4oPikk.IfEby', NULL, '105318670937566958574', 'https://lh3.googleusercontent.com/a/ACg8ocJwBAIx6hRcCxtIK7qopbrp7zbjV1zVVPtCys6N4ONpZcINOg=s96-c', NULL, '7974', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-07 11:28:16', '2025-09-07 11:28:16', NULL),
(72, 'fahim ahmed', NULL, NULL, 'fahim1232211@gmail.com', NULL, NULL, NULL, NULL, '$2y$12$nsgDM40XPHcr2gys/PQTE.Ueb7ShC4MZBhfkjppamddYqG.gN9Ws6', NULL, '112959801365055245373', 'https://lh3.googleusercontent.com/a/ACg8ocIJEZBDHjAfIyii0iXf7elv-9FBrCyWZ9WJcMNpLbhb4NDrZoBs=s96-c', NULL, '9611', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-07 11:33:03', '2025-09-07 11:33:03', NULL),
(73, 'MD Salman', NULL, NULL, 'salmanbdjcchd@gmail.com', NULL, NULL, NULL, NULL, '$2y$12$UUfI.eVafw1OtJZx52fEFO.ZFgDtuJebhOP/bQeTcjH2UK7g/MSOa', NULL, '100918206317282046409', 'https://lh3.googleusercontent.com/a/ACg8ocKN_9Adeodc17Ul_bdBEH8SR_KQR9JyTDkxbAWLu-Hjm2v-pA=s96-c', NULL, '3892', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-07 11:37:14', '2025-09-07 11:37:14', NULL),
(74, 'Rifat Ahmed', NULL, NULL, 'rifatalwaysonfire21@gmail.com', NULL, NULL, NULL, NULL, '$2y$12$hngXkblzHeT4rJ5K4QnFbOOwr0DDHx5k6EpxNfGd0NeeWKtjPRCWO', NULL, '103669852614280742085', 'https://lh3.googleusercontent.com/a/ACg8ocKIWhJFprPufZ3NlmdHIstYQlQ0t9MNBB2idwUV9-gKHt14kA=s96-c', NULL, '896', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-07 11:48:15', '2025-09-07 11:48:15', NULL),
(75, 'Bd Taha', NULL, NULL, 'bdtaha69@gmail.com', NULL, NULL, NULL, NULL, '$2y$12$ZfmQq.YwuYxiXSR7bWtWeObFqRI96j1J8zoTAwr0qC93PjhMkcQ9G', NULL, '101529138419027089615', 'https://lh3.googleusercontent.com/a/ACg8ocLEWNq9PbFnxe1fb91DXmzYVIFmtp0jGRhDG9xRpO2R6zKSrQ=s96-c', NULL, '3405', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-07 12:12:14', '2025-09-07 12:12:14', NULL),
(76, 'ZX SABBIR AHMED', NULL, NULL, 'rssabbirahmed942@gmail.com', NULL, NULL, '01772444343', NULL, '$2y$12$DaLDjSFAi9kwKMS9xTjj6e5w7XtSRIixWCcg9v73uinwQqPkuWtpq', NULL, NULL, NULL, '850', '9200', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-07 13:41:51', '2025-09-07 13:41:51', NULL),
(77, 'Md Sohel', NULL, NULL, 'joyparagang@gmail.com', NULL, NULL, '01822752372', NULL, '$2y$12$NN1tUFGbGCHvHekEMoodpep4KXjxEGYgbhb8kS/hpNVaCeLPczk/u', NULL, NULL, NULL, '7555', '2467', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-07 13:55:50', '2025-09-07 13:55:50', NULL),
(78, 'Abdullah Tokib', NULL, NULL, 'abdullahtokib9@gmail.com', NULL, NULL, NULL, NULL, '$2y$12$D/fY0W7Yxury6X45E6aN9uKlNntH5g/H5xb2BKNlFq2yUQWhe7pR2', NULL, '103493573564638100245', 'https://lh3.googleusercontent.com/a/ACg8ocJFj3cRmh0JpB4ScK1RhrLt-0RaFj3sRDRo2nUNfb1DUnRHbg=s96-c', NULL, '7959', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-07 16:59:51', '2025-09-07 16:59:51', NULL),
(79, 'GAMINGWITH SHOYON', NULL, NULL, 'mdshoyon286486@gmail.com', 'images/profile_photos/1757290598_68be2066cc18e.jpg', NULL, NULL, NULL, '$2y$12$MBMnRmUNVEbBja3bsDei5.2OE3W8DHHxPl.53pa1sCVwM2YGdzDji', NULL, '108452691846428161979', 'https://lh3.googleusercontent.com/a/ACg8ocJnvOU69rf0fXIERmPSc94CFBfCzMt1bp8aVZdypTAq1ArkTQgM=s96-c', NULL, '7500', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-07 18:10:46', '2025-09-07 18:16:38', NULL),
(80, 'Md.Shakib', NULL, NULL, 'alluarjun278600@gmail.com', NULL, NULL, '01621980062', NULL, '$2y$12$mGsT2i.a16UOShczTnTpm.rLkm95WW8V.7K7IzuSF6PRT4ViofNcC', NULL, NULL, NULL, '850', '7588', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-07 19:57:51', '2025-09-07 19:57:51', NULL),
(81, 'V I B E S', NULL, NULL, 'rsquotex52@gmail.com', NULL, NULL, '01768859073', NULL, '$2y$12$.3R8lrog5Fan2DbUnwLaNu5K3o.JIREsHqW63YF6UY/qCFw7BW/t.', NULL, NULL, NULL, '850', '4643', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-07 20:32:26', '2025-09-07 20:32:26', NULL),
(82, 'md Ariful Bangladeshi', NULL, NULL, 'mdarifulba278@gmail.com', NULL, NULL, NULL, NULL, '$2y$12$eoEB/Pt6EKjDAKWUd83U0eoI.C8El91Bqu86912kN1Rsa6g/AOkli', NULL, '109719346337967693292', 'https://lh3.googleusercontent.com/a/ACg8ocIPvUMHZItV3gIW8-oPmQ9So2AVjPNzH1thcer0Zabbz_w5Eg=s96-c', NULL, '5368', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-07 21:25:29', '2025-09-07 21:25:29', NULL),
(83, 'Nayan', NULL, NULL, 'nayanvi628@gmail.com', NULL, NULL, '💝💝', NULL, '$2y$12$WEf0fNgIFXmNafr9EoK/ZuYNcDAnFgRf70nj5EfCYgwuBLug4ZuMm', NULL, NULL, NULL, '850', '2919', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-07 21:38:17', '2025-09-07 21:38:17', NULL),
(84, 'Rk Rifat', NULL, NULL, 'rkrifar1@gmail.com', NULL, NULL, '01896503821', NULL, '$2y$12$wIbIS08A1isljQbxHdLlXOkK5u6yjmOAeSewXzSaJt5VDgjio.u.2', NULL, NULL, NULL, 'Rkrifat', '713', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-07 21:40:50', '2025-09-07 21:40:50', NULL),
(85, 'Md. Labib Hasan', NULL, NULL, 'labibhasan5623@gmail.com', NULL, NULL, '01935948690', NULL, '$2y$12$2cp9C/75eg3Jol8N/L/kw.9PMviK3kwndQYZm9jatGw3nv8PtnFcq', NULL, NULL, NULL, '850', '722', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-07 21:48:02', '2025-09-07 21:48:02', NULL),
(86, 'Ashok Roy', NULL, NULL, 'royashok0192@gmail.com', NULL, NULL, NULL, NULL, '$2y$12$j02gSgJ6BdXb005ohK3pVu4t0IPAjVqqXHO/CNEZ/iy60cOUODjfu', NULL, '106098303399590584919', 'https://lh3.googleusercontent.com/a/ACg8ocKFS-VVN-LXkDxKa9N7QzAp-m9qdL7vHCO03dJcHrU41N1Kow=s96-c', NULL, '2126', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-07 22:12:45', '2025-09-07 22:12:45', NULL),
(87, 'Utpol Ray', NULL, NULL, 'rsbdking99utpol@gmail.com', NULL, NULL, '01719326421', NULL, '$2y$12$5RjjNxmP0tP0q3mRd3.Ho.XC5HzK36TGoibS4zTjCTGAMuQZf9Q16', NULL, NULL, NULL, '850', '3431', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-07 22:15:15', '2025-09-07 22:15:15', NULL),
(88, 'MD SABBIR', NULL, NULL, 'rssabbirlive@gmail.com', NULL, NULL, '01309866150', NULL, '$2y$12$PGZnxLYPMIQWxdt3eN32xepGak9Kpeo1DozmrrxpzrRUqzUS/bZAG', NULL, NULL, NULL, '850', '7928', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-07 22:24:44', '2025-09-07 22:35:52', NULL),
(89, 'Siam Hossan', NULL, NULL, 'hossansiam84@gmail.com', NULL, NULL, NULL, NULL, '$2y$12$aW58fnBy6GNmYjCOiJPSge4hz0RBS0UnkwiIXeUxrmG7be3he9CQ2', NULL, '104419228240110161263', 'https://lh3.googleusercontent.com/a/ACg8ocJeF8MpqePuEIANNjua1z8LEfmckk5Ndh8D_wcBF4K4zPNa5w=s96-c', NULL, '2872', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-07 22:28:04', '2025-09-07 22:28:04', NULL),
(90, 'Milon', NULL, NULL, 'mmilonahmed62@gmail.com', NULL, NULL, '01323587665', NULL, '$2y$12$ZJUPnVmPNfqZSvGqvVvDOOO.rXB0sJkXDzmoGuoSfpxXHZH8Ny2BO', NULL, NULL, NULL, '850', '7129', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-08 00:09:57', '2025-09-08 00:09:57', NULL),
(91, 'Md Rajib Hossain', NULL, NULL, 'rhfashion36@gmail.com', NULL, NULL, '01622346454', NULL, '$2y$12$6Jng02YhKs/vo2PM7HmAie0RxJ43niFH1mvs9RQuQ70SqXPZo4dKO', NULL, NULL, NULL, '850', '9577', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-08 01:24:09', '2025-09-08 01:24:09', NULL),
(92, 'Free Batch', NULL, NULL, 'freebatch7@gmail.com', 'images/profile_photos/1757392418_68bfae22785ba.png', NULL, NULL, NULL, '$2y$12$9DE90caj9bmDwri3za0gCOEpRtyXHsdY8iQrwr2TRvXWG1JsnnN62', NULL, '110751303093932290623', 'https://lh3.googleusercontent.com/a/ACg8ocKgSw7UVrDazP3snFGltjGqWc_nHejZQP76Ob17PAI2H0j2rg=s96-c', NULL, '9060', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-08 06:29:05', '2025-09-08 22:38:21', NULL),
(93, 'Yamin', NULL, NULL, 'yamin2025a@gmail.com', NULL, NULL, '01765352836', NULL, '$2y$12$rM0Bj1CUOYaMUBBVb9.46.DSW80/IdO3WqkMsG/6z0FcWK8r5cZt6', NULL, NULL, NULL, '850', '507', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-08 06:41:08', '2025-09-13 00:50:07', NULL),
(94, 'Faiyad Rahman', NULL, NULL, 'faiyad010@gmail.com', NULL, NULL, NULL, NULL, '$2y$12$6njo5Hx/IWa9ggX0XyWEsO3xkdHYQGjL1W77I6opRhunw0APAm2OS', NULL, '118009111109481974475', 'https://lh3.googleusercontent.com/a/ACg8ocL5xz2NcLNhkO-MG7_Z7iT3aowBgf7-PYrjHZPlqNP_kUlu1g=s96-c', NULL, '6082', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-08 06:56:16', '2025-09-08 06:56:16', NULL),
(95, 'ℜℜ-ŦÏᎶE꙰℟', NULL, NULL, 'tigerrr107@gmail.com', 'images/profile_photos/1757343808_68bef0403c7ce.jpg', NULL, '01736350287', NULL, '$2y$12$/d63B8c7qj9UdoEHm4Q3V.dBZnQvQKp/uLaVHm0kWWPH1A/gQZC/e', NULL, NULL, NULL, NULL, '5103', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-08 09:02:59', '2025-09-08 09:03:28', NULL),
(96, 'Junaid', NULL, NULL, 'jmd491730@gmail.com', NULL, NULL, '01732485797', NULL, '$2y$12$DcvWUu0fg6JPBBV8S/fTSedoAxKniYijM/gB9KhHueSNs5nw9X5VS', NULL, NULL, NULL, '5103', '661', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-08 09:31:26', '2025-09-08 09:31:26', NULL),
(97, 'Mridul Thakur', NULL, NULL, 'mridulraj991@gmail.com', NULL, NULL, '01726833202', NULL, '$2y$12$T/ODfB1c/QoJOJNEWAo8M.jPdMfqqj.zQiBXvPxOqHhQxWGU0WwWO', NULL, NULL, NULL, '850', '4703', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-08 10:24:56', '2025-09-08 10:24:56', NULL),
(98, 'Mridul Thaku', NULL, NULL, 'rajthakurraj531@gmail.com', NULL, NULL, '01726833203', NULL, '$2y$12$pe2tXLjGwnZFu/f6a3.pG.H7wuiEzHw.UoMdVSSnqj6XpgzHGddDK', NULL, NULL, NULL, '850', '2592', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-08 10:37:20', '2025-09-08 10:37:20', NULL),
(99, 'ZOBAYER HOSSAIN', NULL, NULL, 'developerjobayer4@gmail.com', NULL, NULL, '01724570079', NULL, '$2y$12$9Uh3c7Rqd12J0qFuogWewe6KWNkAEdxDatA3v5O4QYI80V5j3ywQq', NULL, NULL, NULL, '165', '938', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-08 19:01:09', '2025-09-08 19:01:09', NULL),
(100, 'md hasan', NULL, NULL, 'hmd839625@gmail.com', NULL, NULL, NULL, NULL, '$2y$12$Pqec5rP5/xJ1vmLhXlCLM.H/FftehtgsXR5Y.VUahMykxLoY.oE7S', NULL, '116406427023941617756', 'https://lh3.googleusercontent.com/a/ACg8ocJwPrGnRLAYtJuQN5Nn9JmxZwBSCQZYVZoZqjoDEiY4kWE4fQ=s96-c', NULL, '1898', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-08 21:32:46', '2025-09-08 21:32:46', NULL),
(101, 'Mohammad Himel', NULL, NULL, 'rsrayhan3328@gmail.com', NULL, NULL, '01992865470', NULL, '$2y$12$PtKMq5uHx2n12MKcr70RqOQsVylWwWopj3Sy6FwBmWGII4GgCLqA6', NULL, NULL, NULL, '850', '2702', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-09 00:48:50', '2025-09-09 00:48:50', NULL),
(102, 'Rasel Ahmed', NULL, NULL, 'raselahmed234109@gmail.com', NULL, NULL, '01814922074', NULL, '$2y$12$HyACwpfzEapwmoZxBwK20ejbli7yWLHeKCJglUoiUOkn8fF6ql7Mu', NULL, NULL, NULL, '850', '184', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-09 02:43:29', '2025-09-09 02:43:29', NULL),
(103, 'Tamim', NULL, NULL, 'mdmainulislam0181@gmail.com', NULL, NULL, '01816701600', NULL, '$2y$12$gsAP0uZO2OqVc1ZxoDu0JOnOv.NR0gtEGBGDWNJ3WhLtGltjMd0m.', NULL, NULL, NULL, '850', '3935', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-09 04:50:24', '2025-09-09 04:50:24', NULL),
(104, 'Md Rabbil Haque', NULL, NULL, 'mdranaali99rs@gmail.com', NULL, NULL, '01719322407', NULL, '$2y$12$6ppfpykg6k6MAsWJpf9v8.qfNNO8Gevnm3NSpHD2lA0WDi26W3t6y', NULL, NULL, NULL, '850', '9030', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-09 07:36:00', '2025-09-09 07:36:00', NULL),
(105, 'Rifat Ahmed', NULL, NULL, 'rifatalwaysonfire53@gmail.com', 'images/profile_photos/1757430336_68c04240351f6.jpg', NULL, '01967406430', NULL, '$2y$12$8LhH/wcltnHMxQ/4cVYpnOrpF0xPHL3hpeBDRap1kQju1tBOHOpxu', NULL, NULL, NULL, '850', '6074', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-09 08:48:17', '2025-09-09 09:05:36', NULL),
(106, 'Ariful Islam', NULL, NULL, 'arifulislam42241@gmail.com', NULL, NULL, NULL, NULL, '$2y$12$lR4Orlm6Lu77krKNxhdzjuuVmeDcVCAJ8tepxGTuz6Qpl6HTYsBei', NULL, '108601331369371048347', 'https://lh3.googleusercontent.com/a/ACg8ocK-In5NK9n4S_fVSAMQW0cDF8um1iti2hFk-MEjDMimIPVaCg=s96-c', NULL, '5526', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-09 11:06:32', '2025-09-09 11:06:32', NULL),
(107, 'Ashfaq Uddin', NULL, NULL, 'ashfaqgamer403@gmail.com', NULL, NULL, '01864653448', NULL, '$2y$12$/c8F3sLaaNBrcbzBPc6TV.O6OlxI37gByzoAc8VvY1EwVc0zu48cK', NULL, NULL, NULL, '850', '6162', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-09 11:26:56', '2025-09-09 11:26:56', NULL),
(108, 'Developer Emon', NULL, NULL, 'developeremon2@gmail.com', NULL, NULL, NULL, NULL, '$2y$12$0MiDO7v0heI7A9UnVchebudVZn.8HPZDdodm/sze5xs0a/SVX/0my', NULL, '107808833082296304808', 'https://lh3.googleusercontent.com/a/ACg8ocJXt6TN9xQP3F5SqV14I_7pNzNzSZ6gSvzXp4kEtYpYTb6_Aw=s96-c', NULL, '6975', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-09 11:28:26', '2025-09-09 11:28:26', NULL),
(109, 'Yamim', NULL, NULL, 'sakibpondit8@gmail.com', NULL, NULL, '01323556879', NULL, '$2y$12$INc/27LQ.Do0AUWOaMXAgOTBWktep7oeunIE6/EhZs3Q471dQGwrS', NULL, NULL, NULL, '850', '9569', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-09 11:32:16', '2025-09-09 11:32:16', NULL),
(110, 'Sakib Hasan', NULL, NULL, 'mdsakibhasansakib93@gmail.com', NULL, NULL, '01323520432', NULL, '$2y$12$7XMbOqYjnXu2gvfzL3nrxeE5HI5tOlZ4tjd1N0LtaS7CDh0Br.Vv6', NULL, NULL, NULL, '9569', '2370', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-09 11:36:54', '2025-09-09 11:36:54', NULL),
(111, 'MD SALMAN', NULL, NULL, '1shortsalman@gmail.com', NULL, NULL, NULL, NULL, '$2y$12$kPmG2esP1e7zcJMF0MqoEO.5u9rPaUqhHY.hNNponB3iW5xwTxEeO', NULL, '103449405228529984354', 'https://lh3.googleusercontent.com/a/ACg8ocKpu55MoLjE3q-sG6_ECKy7uAZZ9r8QZdtTIxTWBdneYX8Jcw=s96-c', NULL, '5664', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-09 11:46:01', '2025-09-09 11:46:01', NULL),
(112, 'Demo TikTok', NULL, NULL, 'tiktokads9001@gmail.com', NULL, NULL, NULL, NULL, '$2y$12$Nzc3NSG0WkwSWdyKDu6RE.LTc5sy30K4.uvxYeqgZ/yVTZmmshDsy', NULL, '111795288704493488126', 'https://lh3.googleusercontent.com/a/ACg8ocISiYY5UrERvM-kaO_Akbge7hG7OI2_L0HfWFBh6oPEvk9Kww=s96-c', NULL, '3960', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-09 11:46:45', '2025-09-09 11:46:45', NULL),
(113, 'Md Rakib', NULL, NULL, 'mdrakib2096543@gmail.com', NULL, NULL, NULL, NULL, '$2y$12$KU16TZbQtwWyoJJofXBW2uWKDN6a4EkQpxitg1AMxzbIvxGTs1f7.', NULL, '116656505739498158890', 'https://lh3.googleusercontent.com/a/ACg8ocJshO_z95KoK-jqr914GWat-NdhMkIefDQl9gAdLtri2S77bA=s96-c', NULL, '4295', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-09 13:29:17', '2025-09-09 13:29:17', NULL),
(114, 'Muiz Oyewale', NULL, NULL, 'oyewalemuiz31@gmail.com', NULL, NULL, NULL, NULL, '$2y$12$ME4ZkYay3bBOIWQRJkSBJOyJq4s1z7ZQsXhL88UDHNeohWlRzztpC', NULL, '116445828928896365995', 'https://lh3.googleusercontent.com/a/ACg8ocKsuXuGSlLMXof4jPnXiX4HlWgJ0UxOR8X6Llgsf9DF8_26wQ=s96-c', NULL, '4640', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-09 14:17:46', '2025-09-09 14:17:46', NULL),
(115, 'Md Raju islam', NULL, NULL, 'mdrajushalk635@gmail.com', 'images/profile_photos/1757469955_68c0dd03a8e03.jpg', NULL, '01833670646', NULL, '$2y$12$rKZYxx2EIygk.6J629/.Zup29k0cAfgS62Fo5gogKfdoTalfzU5am', NULL, NULL, NULL, '850', '8857', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-09 19:51:48', '2025-09-09 20:05:55', NULL),
(116, 'MD JAHIDUL ISLAM', NULL, NULL, 'gwraselff@gmail.com', NULL, NULL, '01407289471', NULL, '$2y$12$urUhD/ebxRtRORsXy.D4N.EXNJY2QvAo50MrPkPwZMHQqolt99O5S', NULL, NULL, NULL, NULL, '5941', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-09 20:07:58', '2025-09-09 20:07:58', NULL),
(117, 'Ataur Rahman Samir', NULL, NULL, 'ataurrahmansamir3@gmail.com', NULL, NULL, NULL, NULL, '$2y$12$2mCARCPIVUqyfGXlYm567.NPguez1n3d2ziqd9Si4k4hy2d78t7DO', NULL, '104285519166801998548', 'https://lh3.googleusercontent.com/a/ACg8ocKMXCzsBAJJ3YnNg2561rhOWplWEjPMkVzlBjnKFFnuKePhr5Kf=s96-c', NULL, '4184', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-09 22:40:32', '2025-09-09 22:40:32', NULL),
(118, 'Md Selim khan', NULL, NULL, 'kmdselim002@gmail.com', 'images/profile_photos/1757497589_68c148f54b816.jpg', NULL, '01918979696', NULL, '$2y$12$v7wGzmkO8JxACF5CYw3Fy.T8YdHox0hWPQ4rlp.PDDPpDYIdcgere', NULL, NULL, NULL, '850', '1672', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-10 03:21:34', '2025-09-10 03:46:29', NULL),
(119, 'Rani Chowdhury', NULL, NULL, 'chowdhuryrani088@gmail.com', NULL, NULL, NULL, NULL, '$2y$12$nRaA8zKPKiCuSDgMVZEirOMkXMZab49xp4u9g4GIgpV9.HzMAiHWK', NULL, '108376124021928034626', 'https://lh3.googleusercontent.com/a/ACg8ocJhYQpzoIxPlE31zkDKD0qX3Efo2JQQdaeTkhdHyZ0BKzfdDQ=s96-c', NULL, '9924', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-10 08:19:49', '2025-09-10 08:19:49', NULL),
(120, 'Sadik raja', NULL, NULL, 'sadikraja697@gmail.com', NULL, NULL, '017561254216', NULL, '$2y$12$tx4y8lxL.dae8Zaxlu7SjupP7ph6fdq2szV78Ys1l3ePdLbX1Iq6u', NULL, NULL, NULL, '850', '6918', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-10 12:36:08', '2025-09-10 12:36:08', NULL),
(121, 'Bkjgkjuc66', NULL, NULL, 'Bkjgkjuc66@gmail.com', NULL, NULL, '01669853952', NULL, '$2y$12$K1EYb2oWH9XnmWhm9t1WwOd2VfJDPIaoKylidZxhlN77.Iq6Vh3sW', NULL, NULL, NULL, '860', '1471', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-10 13:55:59', '2025-09-10 13:55:59', NULL),
(122, 'Goo gle', NULL, NULL, 'noyonotc93@gmail.com', NULL, NULL, '01863735111', NULL, '$2y$12$Ze5En6eoO91YVHMFCNj/eOHFBqJZMj.3kDCIKXz9CGwdH.mWQH.C.', NULL, NULL, NULL, '7555', '6040', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-11 03:47:24', '2025-09-11 03:47:24', NULL),
(123, 'Noyon', NULL, NULL, 'rajsohan2025@gmail.com', NULL, NULL, '01927041569', NULL, '$2y$12$UdIWlg6rPhCFVY89mIKufOulmXWXS.D.Y2/L0JTQdITnPjPzIrZp2', NULL, NULL, NULL, '7555', '7310', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-11 03:48:40', '2025-09-11 03:48:40', NULL),
(124, 'Rifat', NULL, NULL, 'ff4735060@gmail.com', NULL, NULL, '01759840536', NULL, '$2y$12$68khoUlWu0zv4mqRV2i/U.gvAeZ4vPoICVCS1NLtl8Ff9NUHAyr22', NULL, NULL, NULL, '7555', '7674', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-11 03:50:09', '2025-09-11 03:50:09', NULL),
(125, 'Raj', NULL, NULL, 'mitukumar852@gmail.com', NULL, NULL, '01732629925', NULL, '$2y$12$wj6fJFWhB2KQFy0ncfd91OR284G3DX7d5IevsfByyvy/23itUUb0u', NULL, NULL, NULL, '7555', '9779', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-11 03:53:30', '2025-09-11 03:53:30', NULL),
(126, 'Imon', NULL, NULL, 'coxi639@gmail.com', NULL, NULL, '01315676949', NULL, '$2y$12$wjrNTUZLHHlsvPNGjseQlOw3aWRlJTL2e0YpN8aFqMw5ZSvdCQ/pO', NULL, NULL, NULL, '7555', '5149', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-11 04:09:23', '2025-09-11 04:09:23', NULL),
(127, 'Sumit', NULL, NULL, 'mizanur678@gmail.com', NULL, NULL, '01796587797', NULL, '$2y$12$TEWlgo2hj2fQPMIyJZTn3OybTjev622u692.kG44nbmOVGFLNFvcW', NULL, NULL, NULL, '7555', '5885', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-11 04:11:16', '2025-09-11 04:11:16', NULL),
(128, 'Iman', NULL, NULL, 'ludoking799@gmail.com', NULL, NULL, '01821607379', NULL, '$2y$12$bdNS2pRPY50XMp2b8G4NZOXdJLesIMPjKeEko6WHNWWJSv.5lS4IW', NULL, NULL, NULL, '7555', '4329', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-11 04:13:08', '2025-09-11 04:13:08', NULL),
(129, 'Jvvgcjk', NULL, NULL, 'jsuvwob872@gmail.com', NULL, NULL, '01821609979', NULL, '$2y$12$5zVQ9kblNvDYVDJo3KUb4u2MEhANJVVydnZUfjVs8zl.7KytYExhG', NULL, NULL, NULL, '7555', '3989', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-11 04:14:16', '2025-09-11 04:14:16', NULL),
(130, 'Akhlima', NULL, NULL, 'akhlima99@gmail.com', NULL, NULL, '01796107797', NULL, '$2y$12$MINusz6.u1KZctsFJNIO0ujhcYSgGtvOx9KIJu9lGDL8u5FEPuXXG', NULL, NULL, NULL, '7555', '1509', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-11 04:15:54', '2025-09-11 04:15:54', NULL),
(131, 'Manu', NULL, NULL, 'manu567@gmail.com', NULL, NULL, '01397367382', NULL, '$2y$12$ZwdVgScW7ZmbcJ/qhNFoYu5zglZWLvbgzp4yy0ZNJiDKlFwmfZruu', NULL, NULL, NULL, '7555', '9693', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-11 04:16:30', '2025-09-11 04:16:30', NULL);
INSERT INTO `users` (`id`, `name`, `first_name`, `last_name`, `email`, `profile_photo`, `country_code`, `phone_number`, `email_verified_at`, `password`, `remember_token`, `google_id`, `avatar`, `refer_code`, `own_refer_code`, `level`, `total_deposit_amount`, `total_invest_amount`, `total_withdraw_amount`, `total_commission_amount`, `address`, `country`, `state`, `city`, `zip_code`, `account_type`, `otp`, `otp_expires_at`, `otp_status`, `save_business_list`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(132, 'Samsu uddin', NULL, NULL, 'freefore729@gmail.com', NULL, NULL, '01478354993', NULL, '$2y$12$.JkJ5MxxmdZ9XX0Nd18XWeson2EAy9gj5rBfoZU7.zvDkRVIFhhQO', NULL, NULL, NULL, '7555', '2520', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-11 04:16:42', '2025-09-11 04:16:42', NULL),
(133, 'Monu', NULL, NULL, 'monu001@gmail.com', NULL, NULL, '01703676949', NULL, '$2y$12$S5htu5xmMMTk.p7o2zlRsOZABVjWkiAJ4hpiVeblFgWdb.O1EGgDm', NULL, NULL, NULL, '7555', '2353', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-11 04:17:09', '2025-09-11 04:17:09', NULL),
(134, 'Surjo', NULL, NULL, 'surjo67@gmail.com', NULL, NULL, '01735876933', NULL, '$2y$12$u6b.mecgE3/FuoYaDlzXO.aHg2Zh9kGmT6X6gs4OPqzChNt7AXxHC', NULL, NULL, NULL, '7555', '76', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-11 04:17:58', '2025-09-11 04:17:58', NULL),
(135, 'Aimonkoli', NULL, NULL, 'rojonaakter@gmail.com', NULL, NULL, '01843693480', NULL, '$2y$12$3d5lainoE6TDfZq8G6yz1eTWMLpeMqAr/efvQ6ITTJBU.jfujuU.G', NULL, NULL, NULL, '7555', '6575', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-11 04:18:13', '2025-09-11 04:18:13', NULL),
(136, 'Surjobts', NULL, NULL, 'btsmagi55@gmail.com', NULL, NULL, '01954910458', NULL, '$2y$12$rwFQWZAOiqD0QZnLClymBuHzi.TiAfyNO/kpzm/3hzc0Aw6DaLMNu', NULL, NULL, NULL, '7555', '4423', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-11 04:18:43', '2025-09-11 04:18:43', NULL),
(137, 'Magi', NULL, NULL, 'magi444@gmail.com', NULL, NULL, '01995674888', NULL, '$2y$12$55ghgDQJf4gk1cIi3N5SDuqz.DUdMkWun4Yw.UKqzbWCEytd36ZrK', NULL, NULL, NULL, '7555', '6879', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-11 04:19:33', '2025-09-11 04:19:33', NULL),
(138, 'madkobir', NULL, NULL, 'abullahsamir@gmail.com', NULL, NULL, '01794728679', NULL, '$2y$12$D4pgEWxzetyuTlwt1JuK8uGFG0NNncgQhcqVWcvXijlh91zYGMGFK', NULL, NULL, NULL, '7555', '4408', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-11 04:19:35', '2025-09-11 04:19:35', NULL),
(139, 'Mokul', NULL, NULL, 'mokul01@gmail.com', NULL, NULL, '01797087797', NULL, '$2y$12$/JWfff2m3CWSfaqwitXM6OP2YI/5h/OKYD6wRdZm6RUZqnMgrqFJe', NULL, NULL, NULL, '7555', '2634', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-11 04:20:25', '2025-09-11 04:20:25', NULL),
(140, 'Anamul', NULL, NULL, 'turan215cepkin@gmail.com', NULL, NULL, '+8801409148298', NULL, '$2y$12$t1jwgsU3QFhWwgLsrxUbteUfwRKxValoM7HRgNj4mP8i.pj7Qkxk6', NULL, NULL, NULL, '850', '5146', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-12 05:42:22', '2025-09-12 07:09:23', NULL),
(141, 'Md rajon', NULL, NULL, 'mr8110669@gmail.com', NULL, NULL, '01932608308', NULL, '$2y$12$qCllpN.9CrRa7pxsjFtTKeHTn5WdUOmV63OEXTbfgmtZTDw37QGGa', NULL, NULL, NULL, '850', '6796', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-13 01:01:49', '2025-09-13 01:01:49', NULL),
(142, 'NK Nazrul Khan', NULL, NULL, 'nkvai260@gmail.com', NULL, NULL, '01811498443', NULL, '$2y$12$IZr6Lv8UmcMbpvwO/b0RJuCyOwo3gGFg.7e9p9vGaHjM3205dQXW2', NULL, NULL, NULL, '850', '8419', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-13 04:32:20', '2025-09-13 04:32:20', NULL),
(143, 'MD Rafat Hossein Rana', NULL, NULL, 'rafatrana2008@gmail.com', NULL, NULL, '01333566243', NULL, '$2y$12$/Yri8hwZcbPfBP/xwIplDOXAShLkgpWueYhTeT2HfvXgPV.zQo6iO', NULL, NULL, NULL, '7555', '5002', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-14 03:14:08', '2025-09-14 03:14:08', NULL),
(144, 'Rifat Riad', NULL, NULL, 'riadrifat13@gmail.com', NULL, NULL, NULL, NULL, '$2y$12$LQye.3gM3lyQEktPcaz.fOm2K06NDrKM9EJrNewYIK2iHPVreKwE6', NULL, '108177236121656330295', 'https://lh3.googleusercontent.com/a/ACg8ocJ9WcBmsUKelF2FmHRyXw2Gxlm_Y19NmRUe0qAT67iRQtyaSTLW=s96-c', NULL, '7181', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-14 16:00:18', '2025-09-14 16:00:18', NULL),
(145, 'RS TIK TOK ID', NULL, NULL, 'rstiktokid461@gmail.com', NULL, NULL, NULL, NULL, '$2y$12$mKDDPu1piM8Hf2r/m.GtDuSlOEbbKbhZ.Q8ChqaxeT6FVEv7INntW', NULL, '103266339960404035632', 'https://lh3.googleusercontent.com/a/ACg8ocJzrKdFRA7B6fuoMkMT2g97nUOn7o8IRfD35G4PZPeBHvg-A2Q=s96-c', NULL, '9752', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-15 02:36:17', '2025-09-15 02:36:17', NULL),
(146, 'MD SABBIR ALAM', NULL, NULL, 'mdsabbiralam0999@gmail.com', NULL, NULL, NULL, NULL, '$2y$12$wf86Vr0ho5Mmqc0uk0oQyedrVutZrS9FrSp/pOgW1b3GUo0EQpFXq', NULL, '106076342815802114301', 'https://lh3.googleusercontent.com/a/ACg8ocL57z7X8pcTXqt2a4y1zGimMkGTcR3wpXd4H25LbJT7ZfHbW18=s96-c', NULL, '3123', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-16 10:49:06', '2025-09-16 10:49:06', NULL),
(147, 'Utpol Ray', NULL, NULL, 'kumarutpol62@gmail.com', NULL, NULL, NULL, NULL, '$2y$12$SOt067bplC1vka5OjBYK8Omyy.XDh3NlWgG59u5gqvd0KsENRvEJ6', NULL, '116639437046540571485', 'https://lh3.googleusercontent.com/a/ACg8ocIe_nAOHHvRAAHwe6cf2Fwa_6gTG6sMz5IbHHgAWLzus7KfKG0R=s96-c', NULL, '8170', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-17 07:20:59', '2025-09-17 07:20:59', NULL),
(148, 'rifat', NULL, NULL, 'r37607861@gmail.com', NULL, NULL, NULL, NULL, '$2y$12$EVtCo.yH76oqmsw97Dv14uW097bUE1JT6kjuDKIck9pZHLUk6Vpx2', NULL, '114536570427254363515', 'https://lh3.googleusercontent.com/a/ACg8ocL6mizhF-jkQS7PwqHlSs3hz-L9iQeAcejwmaws3F2gp0mqrw=s96-c', NULL, '8361', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-19 20:06:47', '2025-09-19 20:06:47', NULL),
(149, 'Al Noman Rabby', NULL, NULL, 'noman.rabby2006@gmail.com', NULL, NULL, '+8801778336884', NULL, '$2y$12$T9mlZ/Ot88BBxFZM1UrZIut6DxmaQDQBF0q7Y51X1szfVCrW2UD/C', NULL, NULL, NULL, '7555', '4136', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-20 13:28:00', '2025-09-20 13:28:00', NULL),
(150, 'Md. Nazim Uddin', NULL, NULL, 'nazim85.cse@gmail.com', NULL, NULL, NULL, NULL, '$2y$12$XY4foBA8WYn7tB/6HdQuH.oP.EgbKbykE1eh3SroGWC2vgA5wk2I.', NULL, '106148252215430575118', 'https://lh3.googleusercontent.com/a/ACg8ocIyvOCqZ4XLp56VT8kVZ-JdnBq_9MTKz0toT2HqZZtG2EkvBQ=s96-c', NULL, '2751', 'Level 1', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-09-23 06:10:01', '2025-09-23 12:01:30', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_nid_images`
--

DROP TABLE IF EXISTS `user_nid_images`;
CREATE TABLE IF NOT EXISTS `user_nid_images` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `nid_image` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=Active, 0=Inactive',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Stores the creation time of the record',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Stores the last update time of the record',
  PRIMARY KEY (`id`),
  KEY `user_nid_images_user_id_index` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=95 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_nid_images`
--

INSERT INTO `user_nid_images` (`id`, `user_id`, `nid_image`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'images/users/17570845530_12180.jpg', 1, '2025-09-05 09:02:33', '2025-09-05 09:02:33'),
(2, 2, 'images/users/17570888570_1237.jpg', 1, '2025-09-05 10:14:17', '2025-09-05 10:14:17'),
(3, 3, 'images/users/17570898900_seo2.png', 1, '2025-09-05 10:31:30', '2025-09-05 10:31:30'),
(4, 3, 'images/users/17570898901_seo.png', 1, '2025-09-05 10:31:30', '2025-09-05 10:31:30'),
(5, 10, 'images/users/17572417920_IMG_20250823_093326.jpg', 1, '2025-09-07 04:43:12', '2025-09-07 04:43:12'),
(6, 11, 'images/users/17572490390_IMG-20250625-WA0001.jpg', 1, '2025-09-07 06:43:59', '2025-09-07 06:43:59'),
(7, 15, 'images/users/17572553910_Messenger_creation_A8D41811-1A33-4A10-A3EA-AFBE096BF2EA.jpeg', 1, '2025-09-07 08:29:51', '2025-09-07 08:29:51'),
(8, 17, 'images/users/17572555160_1000008164.png', 1, '2025-09-07 08:31:56', '2025-09-07 08:31:56'),
(9, 19, 'images/users/17572556080_1000002266.jpg', 1, '2025-09-07 08:33:28', '2025-09-07 08:33:28'),
(10, 19, 'images/users/17572556081_1000002267.jpg', 1, '2025-09-07 08:33:28', '2025-09-07 08:33:28'),
(11, 21, 'images/users/17572556160_1752609511128.jpg', 1, '2025-09-07 08:33:36', '2025-09-07 08:33:36'),
(12, 23, 'images/users/17572556970_1000059737.jpg', 1, '2025-09-07 08:34:57', '2025-09-07 08:34:57'),
(13, 24, 'images/users/17572557520_1000022474.jpg', 1, '2025-09-07 08:35:52', '2025-09-07 08:35:52'),
(14, 26, 'images/users/17572559890_Screenshot_2022-12-01-13-29-06-80~2.png', 1, '2025-09-07 08:39:49', '2025-09-07 08:39:49'),
(15, 27, 'images/users/17572560140_1000104367.jpg', 1, '2025-09-07 08:40:14', '2025-09-07 08:40:14'),
(16, 28, 'images/users/17572561410_GTIPyvThcsyIPesMBPnGlVgJi0D.jpg', 1, '2025-09-07 08:42:21', '2025-09-07 08:42:21'),
(17, 30, 'images/users/17572562250_received_1850028335739994.jpeg', 1, '2025-09-07 08:43:45', '2025-09-07 08:43:45'),
(18, 31, 'images/users/17572562580_1000021759.jpg', 1, '2025-09-07 08:44:18', '2025-09-07 08:44:18'),
(19, 31, 'images/users/17572562581_1000021760.jpg', 1, '2025-09-07 08:44:18', '2025-09-07 08:44:18'),
(20, 32, 'images/users/17572562700_1702096439461-1.JPEG', 1, '2025-09-07 08:44:30', '2025-09-07 08:44:30'),
(21, 35, 'images/users/17572563270_922.jpg', 1, '2025-09-07 08:45:27', '2025-09-07 08:45:27'),
(22, 35, 'images/users/17572563271_923.jpg', 1, '2025-09-07 08:45:27', '2025-09-07 08:45:27'),
(23, 38, 'images/users/17572568180_1000019156.jpg', 1, '2025-09-07 08:53:38', '2025-09-07 08:53:38'),
(24, 39, 'images/users/17572568440_1000034041.jpg', 1, '2025-09-07 08:54:04', '2025-09-07 08:54:04'),
(25, 41, 'images/users/17572568900_IMG_20250108_090449.jpg', 1, '2025-09-07 08:54:50', '2025-09-07 08:54:50'),
(26, 42, 'images/users/17572569550_1000000232.jpg', 1, '2025-09-07 08:55:55', '2025-09-07 08:55:55'),
(27, 42, 'images/users/17572569551_1000000231.jpg', 1, '2025-09-07 08:55:55', '2025-09-07 08:55:55'),
(28, 43, 'images/users/17572571600_1000027615.jpg', 1, '2025-09-07 08:59:20', '2025-09-07 08:59:20'),
(29, 44, 'images/users/17572572720_DSC_0004.JPG', 1, '2025-09-07 09:01:12', '2025-09-07 09:01:12'),
(30, 45, 'images/users/17572573280_1000029258.jpg', 1, '2025-09-07 09:02:08', '2025-09-07 09:02:08'),
(31, 51, 'images/users/17572588820_80.png', 1, '2025-09-07 09:28:02', '2025-09-07 09:28:02'),
(32, 52, 'images/users/17572590600_1000002592.jpg', 1, '2025-09-07 09:31:00', '2025-09-07 09:31:00'),
(33, 52, 'images/users/17572590601_1000002591.jpg', 1, '2025-09-07 09:31:00', '2025-09-07 09:31:00'),
(34, 61, 'images/users/17572626250_Screenshot_20250907_222912.jpg', 1, '2025-09-07 10:30:25', '2025-09-07 10:30:25'),
(35, 62, 'images/users/17572631120_1000228787.jpg', 1, '2025-09-07 10:38:32', '2025-09-07 10:38:32'),
(36, 62, 'images/users/17572631121_1000228788.jpg', 1, '2025-09-07 10:38:32', '2025-09-07 10:38:32'),
(37, 63, 'images/users/17572631850_1000002125.jpg', 1, '2025-09-07 10:39:45', '2025-09-07 10:39:45'),
(38, 63, 'images/users/17572631851_1000002123.jpg', 1, '2025-09-07 10:39:45', '2025-09-07 10:39:45'),
(39, 64, 'images/users/17572633870_11197.jpg', 1, '2025-09-07 10:43:07', '2025-09-07 10:43:07'),
(40, 65, 'images/users/17572637680_IMG_20240823_202544.jpg', 1, '2025-09-07 10:49:28', '2025-09-07 10:49:28'),
(41, 66, 'images/users/17572643380_IMG-20250907-WA0058.jpg', 1, '2025-09-07 10:58:58', '2025-09-07 10:58:58'),
(42, 67, 'images/users/17572650620_IMG_20250907_230843.jpg', 1, '2025-09-07 11:11:02', '2025-09-07 11:11:02'),
(43, 69, 'images/users/17572655710_IMG_20241208_003348.jpg', 1, '2025-09-07 11:19:31', '2025-09-07 11:19:31'),
(44, 76, 'images/users/17572741110_cb5795b8-4b01-4d6f-9054-9c2b6c94f438-1_all_130.jpg', 1, '2025-09-07 13:41:51', '2025-09-07 13:41:51'),
(45, 77, 'images/users/17572749500_20782.jpg', 1, '2025-09-07 13:55:50', '2025-09-07 13:55:50'),
(46, 80, 'images/users/17572966710_1000012734.jpg', 1, '2025-09-07 19:57:51', '2025-09-07 19:57:51'),
(47, 80, 'images/users/17572966711_1000012842.jpg', 1, '2025-09-07 19:57:51', '2025-09-07 19:57:51'),
(48, 81, 'images/users/17572987460_1000050231.jpg', 1, '2025-09-07 20:32:26', '2025-09-07 20:32:26'),
(49, 81, 'images/users/17572987461_1000050230.jpg', 1, '2025-09-07 20:32:26', '2025-09-07 20:32:26'),
(50, 84, 'images/users/17573028500_FB_IMG_1755326075421.jpg', 1, '2025-09-07 21:40:50', '2025-09-07 21:40:50'),
(51, 88, 'images/users/17573054840_13846.jpg', 1, '2025-09-07 22:24:44', '2025-09-07 22:24:44'),
(52, 90, 'images/users/17573117970_1000044321.jpg', 1, '2025-09-08 00:09:57', '2025-09-08 00:09:57'),
(53, 90, 'images/users/17573117971_1000044322.jpg', 1, '2025-09-08 00:09:57', '2025-09-08 00:09:57'),
(54, 95, 'images/users/17573437790_1736920313756.jpg', 1, '2025-09-08 09:02:59', '2025-09-08 09:02:59'),
(55, 96, 'images/users/17573454860_inbound1097353188915627839.jpg', 1, '2025-09-08 09:31:26', '2025-09-08 09:31:26'),
(56, 97, 'images/users/17573486960_IMG_20241222_152904.jpg', 1, '2025-09-08 10:24:56', '2025-09-08 10:24:56'),
(57, 97, 'images/users/17573486961_IMG_20241222_152857.jpg', 1, '2025-09-08 10:24:56', '2025-09-08 10:24:56'),
(58, 98, 'images/users/17573494400_1000000402.jpg', 1, '2025-09-08 10:37:20', '2025-09-08 10:37:20'),
(59, 99, 'images/users/17573796690_IMG_20250527_063608.jpg', 1, '2025-09-08 19:01:09', '2025-09-08 19:01:09'),
(60, 101, 'images/users/17574005300_Screenshot_20250117-103117_1.png', 1, '2025-09-09 00:48:50', '2025-09-09 00:48:50'),
(61, 102, 'images/users/17574074090_G80OyYzltOvKuhwmtWxmXGaBhFS.jpg', 1, '2025-09-09 02:43:29', '2025-09-09 02:43:29'),
(62, 104, 'images/users/17574249600_IMG_4799.jpeg', 1, '2025-09-09 07:36:00', '2025-09-09 07:36:00'),
(63, 104, 'images/users/17574249601_IMG_4800.jpeg', 1, '2025-09-09 07:36:00', '2025-09-09 07:36:00'),
(64, 107, 'images/users/17574388160_WhatsApp Image 2025-06-30 at 8.32.03 PM.jpeg', 1, '2025-09-09 11:26:56', '2025-09-09 11:26:56'),
(65, 109, 'images/users/17574391360_1000022561.jpg', 1, '2025-09-09 11:32:16', '2025-09-09 11:32:16'),
(66, 110, 'images/users/17574394140_1756478257361.jpg', 1, '2025-09-09 11:36:54', '2025-09-09 11:36:54'),
(67, 115, 'images/users/17574691080_IMG_20240903_223605_326.jpg', 1, '2025-09-09 19:51:48', '2025-09-09 19:51:48'),
(68, 116, 'images/users/17574700780_IMG_20250202_185216.jpg', 1, '2025-09-09 20:07:58', '2025-09-09 20:07:58'),
(69, 118, 'images/users/17574960950_1000018915.jpg', 1, '2025-09-10 03:21:35', '2025-09-10 03:21:35'),
(70, 121, 'images/users/17575341590_IMG_20250831_095856.jpg', 1, '2025-09-10 13:55:59', '2025-09-10 13:55:59'),
(71, 122, 'images/users/17575840440_Screenshot_20250909-202355.jpg', 1, '2025-09-11 03:47:24', '2025-09-11 03:47:24'),
(72, 123, 'images/users/17575841200_Screenshot_20250908-230727.jpg', 1, '2025-09-11 03:48:40', '2025-09-11 03:48:40'),
(73, 124, 'images/users/17575842090_Screenshot_20250908-151947.jpg', 1, '2025-09-11 03:50:09', '2025-09-11 03:50:09'),
(74, 125, 'images/users/17575844100_Screenshot_20250905-211059.jpg', 1, '2025-09-11 03:53:30', '2025-09-11 03:53:30'),
(75, 126, 'images/users/17575853630_1000001903.jpg', 1, '2025-09-11 04:09:23', '2025-09-11 04:09:23'),
(76, 127, 'images/users/17575854760_1000001902.jpg', 1, '2025-09-11 04:11:16', '2025-09-11 04:11:16'),
(77, 128, 'images/users/17575855880_1000001901.jpg', 1, '2025-09-11 04:13:08', '2025-09-11 04:13:08'),
(78, 129, 'images/users/17575856560_1000001885.jpg', 1, '2025-09-11 04:14:16', '2025-09-11 04:14:16'),
(79, 130, 'images/users/17575857540_1000001767.jpg', 1, '2025-09-11 04:15:54', '2025-09-11 04:15:54'),
(80, 131, 'images/users/17575857900_Screenshot_20250831-220247.jpg', 1, '2025-09-11 04:16:30', '2025-09-11 04:16:30'),
(81, 132, 'images/users/17575858020_21071.jpg', 1, '2025-09-11 04:16:42', '2025-09-11 04:16:42'),
(82, 133, 'images/users/17575858290_1000000552.jpg', 1, '2025-09-11 04:17:09', '2025-09-11 04:17:09'),
(83, 134, 'images/users/17575858780_Screenshot_20250826-112344.jpg', 1, '2025-09-11 04:17:58', '2025-09-11 04:17:58'),
(84, 135, 'images/users/17575858930_21068.jpg', 1, '2025-09-11 04:18:13', '2025-09-11 04:18:13'),
(85, 136, 'images/users/17575859230_1000000552.jpg', 1, '2025-09-11 04:18:43', '2025-09-11 04:18:43'),
(86, 137, 'images/users/17575859730_Screenshot_20250826-112333.jpg', 1, '2025-09-11 04:19:33', '2025-09-11 04:19:33'),
(87, 138, 'images/users/17575859750_21063.jpg', 1, '2025-09-11 04:19:35', '2025-09-11 04:19:35'),
(88, 139, 'images/users/17575860250_1000000524.jpg', 1, '2025-09-11 04:20:25', '2025-09-11 04:20:25'),
(89, 140, 'images/users/17576773420_Messenger_creation_58BFE8AF-B8D9-4FBC-8BE4-58A3D5A02523.jpeg', 1, '2025-09-12 05:42:22', '2025-09-12 05:42:22'),
(90, 141, 'images/users/17577469090_Screenshot_20250728_144821_com.dts.freefireth.jpg', 1, '2025-09-13 01:01:49', '2025-09-13 01:01:49'),
(91, 142, 'images/users/17577595400_IMG_20240607_040227.jpg', 1, '2025-09-13 04:32:20', '2025-09-13 04:32:20'),
(92, 142, 'images/users/17577595401_IMG_20240607_040241.jpg', 1, '2025-09-13 04:32:20', '2025-09-13 04:32:20'),
(93, 143, 'images/users/17578412480_1000002479.jpg', 1, '2025-09-14 03:14:08', '2025-09-14 03:14:08'),
(94, 149, 'images/users/17583964800_1000003073.jpg', 1, '2025-09-20 13:28:00', '2025-09-20 13:28:00');

-- --------------------------------------------------------

--
-- Table structure for table `withdraws`
--

DROP TABLE IF EXISTS `withdraws`;
CREATE TABLE IF NOT EXISTS `withdraws` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED NOT NULL,
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `binance_id` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1=Paid, 0=Pending',
  `remarks` mediumtext COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=Active, 0=Inactive',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Stores the creation time of the record',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Stores the last update time of the record',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `withdraws`
--

INSERT INTO `withdraws` (`id`, `user_id`, `amount`, `binance_id`, `payment_status`, `remarks`, `status`, `created_at`, `updated_at`) VALUES
(1, 66, 15.00, '1047026155', 1, NULL, 1, '2025-09-15 01:10:20', '2025-09-16 01:20:37');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
