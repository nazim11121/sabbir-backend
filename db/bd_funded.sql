-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Aug 30, 2025 at 08:22 AM
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
  `log_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `event` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject_id` bigint UNSIGNED DEFAULT NULL,
  `causer_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `causer_id` bigint UNSIGNED DEFAULT NULL,
  `properties` json DEFAULT NULL,
  `batch_uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subject` (`subject_type`,`subject_id`),
  KEY `causer` (`causer_type`,`causer_id`),
  KEY `activity_log_log_name_index` (`log_name`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `payment_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=Success, 0=Processing, 2=Failed',
  `remarks` mediumtext COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=Active, 0=Inactive',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Stores the creation time of the record',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Stores the last update time of the record',
  PRIMARY KEY (`id`),
  KEY `buy_packages_user_id_index` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `buy_packages`
--

INSERT INTO `buy_packages` (`id`, `user_id`, `package_id`, `amount`, `payment_status`, `remarks`, `status`, `created_at`, `updated_at`) VALUES
(13, 19, '200$ fundad account', 30.00, 1, NULL, 1, '2025-08-26 11:46:08', '2025-08-26 11:46:08'),
(14, 19, '100$ fundad account', 15.00, 1, NULL, 1, '2025-08-30 00:25:56', '2025-08-30 00:25:56'),
(15, 19, '6', 30.00, 1, NULL, 1, '2025-08-30 00:29:09', '2025-08-30 00:29:09');

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
('spatie.permission.cache', 'a:3:{s:5:\"alias\";a:8:{s:1:\"a\";s:2:\"id\";s:1:\"b\";s:4:\"name\";s:1:\"c\";s:10:\"guard_name\";s:1:\"d\";s:14:\"permission_key\";s:1:\"e\";s:10:\"group_name\";s:1:\"f\";s:11:\"description\";s:1:\"g\";s:11:\"priority_id\";s:1:\"r\";s:5:\"roles\";}s:11:\"permissions\";a:75:{i:0;a:8:{s:1:\"a\";i:13;s:1:\"b\";s:9:\"Dashboard\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:9:\"dashboard\";s:1:\"e\";N;s:1:\"f\";N;s:1:\"g\";i:1;s:1:\"r\";a:1:{i:0;i:1;}}i:1;a:8:{s:1:\"a\";i:17;s:1:\"b\";s:19:\"Customer Management\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:8:\"customer\";s:1:\"e\";N;s:1:\"f\";N;s:1:\"g\";i:3;s:1:\"r\";a:1:{i:0;i:1;}}i:2;a:8:{s:1:\"a\";i:18;s:1:\"b\";s:17:\"Business Settings\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:17:\"business-settings\";s:1:\"e\";N;s:1:\"f\";N;s:1:\"g\";i:2;s:1:\"r\";a:1:{i:0;i:1;}}i:3;a:8:{s:1:\"a\";i:19;s:1:\"b\";s:15:\"User Management\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:4:\"user\";s:1:\"e\";N;s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:4;a:8:{s:1:\"a\";i:20;s:1:\"b\";s:13:\"Company Info \";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:12:\"company-info\";s:1:\"e\";N;s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:5;a:7:{s:1:\"a\";i:21;s:1:\"b\";s:10:\"Import CSV\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:10:\"import-csv\";s:1:\"e\";N;s:1:\"f\";N;s:1:\"g\";N;}i:6;a:8:{s:1:\"a\";i:22;s:1:\"b\";s:15:\"Database Backup\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:9:\"db-backup\";s:1:\"e\";N;s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:7;a:8:{s:1:\"a\";i:23;s:1:\"b\";s:13:\"dashboard one\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:13:\"dashboard-one\";s:1:\"e\";s:9:\"Dashboard\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:8;a:8:{s:1:\"a\";i:24;s:1:\"b\";s:13:\"dashboard two\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:13:\"dashboard-two\";s:1:\"e\";s:9:\"Dashboard\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:9;a:8:{s:1:\"a\";i:25;s:1:\"b\";s:10:\"creed tags\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:10:\"creed-tags\";s:1:\"e\";s:17:\"Business Settings\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:10;a:8:{s:1:\"a\";i:26;s:1:\"b\";s:13:\"business type\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:13:\"business-type\";s:1:\"e\";s:17:\"Business Settings\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:11;a:8:{s:1:\"a\";i:27;s:1:\"b\";s:17:\"business category\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:17:\"business-category\";s:1:\"e\";s:17:\"Business Settings\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:12;a:8:{s:1:\"a\";i:28;s:1:\"b\";s:20:\"business subcategory\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:20:\"business-subcategory\";s:1:\"e\";s:17:\"Business Settings\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:13;a:8:{s:1:\"a\";i:29;s:1:\"b\";s:13:\"business tags\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:13:\"business-tags\";s:1:\"e\";s:17:\"Business Settings\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:14;a:8:{s:1:\"a\";i:30;s:1:\"b\";s:10:\"restaurant\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:10:\"restaurant\";s:1:\"e\";s:17:\"Business Settings\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:15;a:8:{s:1:\"a\";i:31;s:1:\"b\";s:11:\"affliations\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:11:\"affliations\";s:1:\"e\";s:17:\"Business Settings\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:16;a:8:{s:1:\"a\";i:46;s:1:\"b\";s:13:\"customer list\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:13:\"customer-list\";s:1:\"e\";s:19:\"Customer Management\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:17;a:8:{s:1:\"a\";i:47;s:1:\"b\";s:13:\"archieve list\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:13:\"archieve-list\";s:1:\"e\";s:19:\"Customer Management\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:18;a:8:{s:1:\"a\";i:48;s:1:\"b\";s:10:\"admin user\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:10:\"admin-user\";s:1:\"e\";s:15:\"User Management\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:19;a:8:{s:1:\"a\";i:49;s:1:\"b\";s:4:\"role\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:4:\"role\";s:1:\"e\";s:15:\"User Management\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:20;a:8:{s:1:\"a\";i:50;s:1:\"b\";s:10:\"permission\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:10:\"permission\";s:1:\"e\";s:15:\"User Management\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:21;a:8:{s:1:\"a\";i:51;s:1:\"b\";s:5:\"about\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:5:\"about\";s:1:\"e\";N;s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:22;a:8:{s:1:\"a\";i:52;s:1:\"b\";s:17:\"subscription plan\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:17:\"subscription-plan\";s:1:\"e\";s:17:\"Business Settings\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:23;a:8:{s:1:\"a\";i:53;s:1:\"b\";s:18:\"creed tags add btn\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:18:\"creed-tags-add-btn\";s:1:\"e\";s:17:\"Business Settings\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:24;a:8:{s:1:\"a\";i:54;s:1:\"b\";s:19:\"creed tags edit btn\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:19:\"creed-tags-edit-btn\";s:1:\"e\";s:17:\"Business Settings\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:25;a:8:{s:1:\"a\";i:55;s:1:\"b\";s:21:\"creed tags delete btn\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:21:\"creed-tags-delete-btn\";s:1:\"e\";s:17:\"Business Settings\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:26;a:8:{s:1:\"a\";i:56;s:1:\"b\";s:21:\"business type add btn\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:21:\"business-type-add-btn\";s:1:\"e\";s:17:\"Business Settings\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:27;a:8:{s:1:\"a\";i:57;s:1:\"b\";s:22:\"business type edit btn\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:22:\"business-type-edit-btn\";s:1:\"e\";s:17:\"Business Settings\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:28;a:8:{s:1:\"a\";i:58;s:1:\"b\";s:24:\"business type delete btn\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:24:\"business-type-delete-btn\";s:1:\"e\";s:17:\"Business Settings\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:29;a:8:{s:1:\"a\";i:59;s:1:\"b\";s:25:\"business category add btn\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:25:\"business-category-add-btn\";s:1:\"e\";s:17:\"Business Settings\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:30;a:8:{s:1:\"a\";i:60;s:1:\"b\";s:26:\"business category edit btn\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:26:\"business-category-edit-btn\";s:1:\"e\";s:17:\"Business Settings\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:31;a:8:{s:1:\"a\";i:61;s:1:\"b\";s:28:\"business category delete btn\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:28:\"business-category-delete-btn\";s:1:\"e\";s:17:\"Business Settings\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:32;a:8:{s:1:\"a\";i:62;s:1:\"b\";s:28:\"business subcategory add btn\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:28:\"business-subcategory-add-btn\";s:1:\"e\";s:17:\"Business Settings\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:33;a:8:{s:1:\"a\";i:63;s:1:\"b\";s:29:\"business subcategory edit btn\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:29:\"business-subcategory-edit-btn\";s:1:\"e\";s:17:\"Business Settings\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:34;a:8:{s:1:\"a\";i:64;s:1:\"b\";s:31:\"business subcategory delete btn\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:31:\"business-subcategory-delete-btn\";s:1:\"e\";s:17:\"Business Settings\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:35;a:8:{s:1:\"a\";i:65;s:1:\"b\";s:21:\"business tags add btn\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:21:\"business-tags-add-btn\";s:1:\"e\";s:17:\"Business Settings\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:36;a:8:{s:1:\"a\";i:66;s:1:\"b\";s:22:\"business tags edit btn\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:22:\"business-tags-edit-btn\";s:1:\"e\";s:17:\"Business Settings\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:37;a:8:{s:1:\"a\";i:67;s:1:\"b\";s:24:\"business tags delete btn\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:24:\"business-tags-delete-btn\";s:1:\"e\";s:17:\"Business Settings\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:38;a:8:{s:1:\"a\";i:68;s:1:\"b\";s:18:\"restaurant add btn\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:18:\"restaurant-add-btn\";s:1:\"e\";s:17:\"Business Settings\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:39;a:8:{s:1:\"a\";i:69;s:1:\"b\";s:19:\"restaurant edit btn\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:19:\"restaurant-edit-btn\";s:1:\"e\";s:17:\"Business Settings\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:40;a:8:{s:1:\"a\";i:70;s:1:\"b\";s:21:\"restaurant delete btn\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:21:\"restaurant-delete-btn\";s:1:\"e\";s:17:\"Business Settings\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:41;a:8:{s:1:\"a\";i:71;s:1:\"b\";s:19:\"affliations add btn\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:19:\"affliations-add-btn\";s:1:\"e\";s:17:\"Business Settings\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:42;a:8:{s:1:\"a\";i:72;s:1:\"b\";s:20:\"affliations edit btn\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:20:\"affliations-edit-btn\";s:1:\"e\";s:17:\"Business Settings\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:43;a:8:{s:1:\"a\";i:73;s:1:\"b\";s:22:\"affliations delete btn\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:22:\"affliations-delete-btn\";s:1:\"e\";s:17:\"Business Settings\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:44;a:8:{s:1:\"a\";i:74;s:1:\"b\";s:25:\"subscription plan add btn\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:25:\"subscription-plan-add-btn\";s:1:\"e\";s:17:\"Business Settings\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:45;a:8:{s:1:\"a\";i:75;s:1:\"b\";s:26:\"subscription plan edit btn\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:26:\"subscription-plan-edit-btn\";s:1:\"e\";s:17:\"Business Settings\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:46;a:8:{s:1:\"a\";i:76;s:1:\"b\";s:28:\"subscription plan delete btn\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:28:\"subscription-plan-delete-btn\";s:1:\"e\";s:17:\"Business Settings\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:47;a:8:{s:1:\"a\";i:77;s:1:\"b\";s:22:\"customers list add btn\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:22:\"customers-list-add-btn\";s:1:\"e\";s:19:\"Customer Management\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:48;a:8:{s:1:\"a\";i:78;s:1:\"b\";s:23:\"customers list edit btn\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:23:\"customers-list-edit-btn\";s:1:\"e\";s:19:\"Customer Management\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:49;a:8:{s:1:\"a\";i:79;s:1:\"b\";s:25:\"customers list delete btn\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:25:\"customers-list-delete-btn\";s:1:\"e\";s:19:\"Customer Management\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:50;a:8:{s:1:\"a\";i:80;s:1:\"b\";s:26:\"archieve list retrieve btn\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:26:\"archieve-list-retrieve-btn\";s:1:\"e\";s:19:\"Customer Management\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:51;a:8:{s:1:\"a\";i:82;s:1:\"b\";s:18:\"admin user add btn\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:18:\"admin-user-add-btn\";s:1:\"e\";s:15:\"User Management\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:52;a:8:{s:1:\"a\";i:83;s:1:\"b\";s:19:\"admin user edit btn\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:19:\"admin-user-edit-btn\";s:1:\"e\";s:15:\"User Management\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:53;a:8:{s:1:\"a\";i:84;s:1:\"b\";s:21:\"admin user delete btn\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:21:\"admin-user-delete-btn\";s:1:\"e\";s:15:\"User Management\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:54;a:8:{s:1:\"a\";i:85;s:1:\"b\";s:13:\"roles add btn\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:13:\"roles-add-btn\";s:1:\"e\";s:15:\"User Management\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:55;a:8:{s:1:\"a\";i:86;s:1:\"b\";s:14:\"roles edit btn\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:14:\"roles-edit-btn\";s:1:\"e\";s:15:\"User Management\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:56;a:8:{s:1:\"a\";i:87;s:1:\"b\";s:16:\"roles delete btn\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:16:\"roles-delete-btn\";s:1:\"e\";s:15:\"User Management\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:57;a:8:{s:1:\"a\";i:88;s:1:\"b\";s:19:\"permissions add btn\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:19:\"permissions-add-btn\";s:1:\"e\";s:15:\"User Management\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:58;a:8:{s:1:\"a\";i:89;s:1:\"b\";s:20:\"permissions edit btn\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:20:\"permissions-edit-btn\";s:1:\"e\";s:15:\"User Management\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:59;a:8:{s:1:\"a\";i:90;s:1:\"b\";s:22:\"permissions delete btn\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:22:\"permissions-delete-btn\";s:1:\"e\";s:15:\"User Management\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:60;a:8:{s:1:\"a\";i:91;s:1:\"b\";s:13:\"contact creed\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:13:\"contact-creed\";s:1:\"e\";N;s:1:\"f\";N;s:1:\"g\";i:4;s:1:\"r\";a:1:{i:0;i:1;}}i:61;a:8:{s:1:\"a\";i:92;s:1:\"b\";s:24:\"contact creed delete btn\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:24:\"contact-creed-delete-btn\";s:1:\"e\";s:13:\"contact creed\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:62;a:8:{s:1:\"a\";i:93;s:1:\"b\";s:13:\"Business List\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:13:\"business-list\";s:1:\"e\";s:19:\"Customer Management\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:63;a:8:{s:1:\"a\";i:94;s:1:\"b\";s:13:\"Business Note\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:13:\"business-note\";s:1:\"e\";N;s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:64;a:8:{s:1:\"a\";i:95;s:1:\"b\";s:25:\"Apps Terms and Conditions\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:25:\"apps-terms-and-conditions\";s:1:\"e\";N;s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:65;a:8:{s:1:\"a\";i:96;s:1:\"b\";s:16:\"Reviews List btn\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:16:\"reviews-list-btn\";s:1:\"e\";s:19:\"Customer Management\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:66;a:8:{s:1:\"a\";i:97;s:1:\"b\";s:14:\"Privacy Policy\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:14:\"privacy-policy\";s:1:\"e\";N;s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:67;a:8:{s:1:\"a\";i:98;s:1:\"b\";s:12:\"Pricing Plan\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:12:\"pricing-plan\";s:1:\"e\";N;s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:68;a:8:{s:1:\"a\";i:99;s:1:\"b\";s:27:\"Add Listing Form Management\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:27:\"add-listing-form-management\";s:1:\"e\";s:17:\"Business Settings\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:69;a:8:{s:1:\"a\";i:100;s:1:\"b\";s:27:\"Add Listing Form Delete btn\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:27:\"add-listing-form-delete-btn\";s:1:\"e\";s:17:\"Business Settings\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:70;a:8:{s:1:\"a\";i:101;s:1:\"b\";s:20:\"Pricing Plan Add btn\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:20:\"pricing-plan-add-btn\";s:1:\"e\";s:12:\"Pricing Plan\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:71;a:8:{s:1:\"a\";i:102;s:1:\"b\";s:21:\"Pricing Plan Edit btn\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:21:\"pricing-plan-edit-btn\";s:1:\"e\";s:12:\"Pricing Plan\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:72;a:8:{s:1:\"a\";i:103;s:1:\"b\";s:23:\"Pricing Plan Delete btn\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:23:\"pricing-plan-delete-btn\";s:1:\"e\";s:12:\"Pricing Plan\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:73;a:8:{s:1:\"a\";i:104;s:1:\"b\";s:19:\"Accounts Management\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:19:\"accounts-management\";s:1:\"e\";N;s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:74;a:8:{s:1:\"a\";i:105;s:1:\"b\";s:6:\"Income\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:6:\"income\";s:1:\"e\";s:19:\"Accounts Management\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}}s:5:\"roles\";a:1:{i:0;a:3:{s:1:\"a\";i:1;s:1:\"b\";s:5:\"Admin\";s:1:\"c\";s:3:\"web\";}}}', 1756626724);

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
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `remarks`, `status`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'Our Services', NULL, 1, 1, '2025-08-29 22:22:55', '2025-08-29 22:22:55'),
(2, 'Funded Packages', NULL, 1, 1, '2025-08-29 22:23:13', '2025-08-29 22:23:13');

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(62, '2025_08_30_071837_create_notices_table', 10);

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
  `model_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
(1, 'এখানে শুধুমাত্র দক্ষ ট্রেডারদের ফান্ডিং ব্যালেন্স প্রদান করা হবে। যে কোনো প্রয়োজনে যোগাযোগ করুন WhatsApp: 01********* বিঃদ্রঃ প্রথমে ডেমো ব্যালেন্সে নিজের দক্ষতা প্রমাণ করতে হবে। দক্ষতা প্রমাণ করতে পারলেই ফান্ডিং ব্যালেন্স প্রদান করা হবে।', 1, 1, '2025-08-30 02:05:50', '2025-08-30 02:14:35');

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
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`id`, `name`, `category_id`, `price`, `image`, `remarks`, `status`, `created_by`, `created_at`, `updated_at`) VALUES
(2, 'Trusted Company Investment', 1, NULL, 'images/service/1756530595_68b287a3130bb.jpg', NULL, 1, 1, '2025-08-29 23:09:55', '2025-08-29 23:09:55'),
(3, 'Get Company Loan and Start Trading', 1, NULL, 'images/service/1756530708_68b2881480247.jpg', NULL, 1, 1, '2025-08-29 23:11:48', '2025-08-29 23:11:48'),
(4, '500$ Tournament', 1, '20', 'images/service/1756530742_68b2883638b70.jpg', NULL, 1, 1, '2025-08-29 23:12:22', '2025-08-29 23:12:22'),
(5, '100$ fundad account', 2, '15', 'images/funded/1756530789_68b2886591ca3.jpg', NULL, 1, 1, '2025-08-29 23:13:09', '2025-08-29 23:13:09'),
(6, '200$ fundad account', 2, '30', 'images/funded/1756530828_68b2888c67f83.jpg', NULL, 1, 1, '2025-08-29 23:13:48', '2025-08-29 23:13:48'),
(7, '300$ fundad account', 2, '40', 'images/funded/1756530855_68b288a7c5c97.jpg', NULL, 1, 1, '2025-08-29 23:14:15', '2025-08-29 23:14:15'),
(8, '400$ fundad account', 2, '50', 'images/funded/1756530887_68b288c73b100.jpg', NULL, 1, 1, '2025-08-29 23:14:47', '2025-08-29 23:14:47'),
(9, '500$ fundad account', 2, '60', 'images/funded/1756530917_68b288e531579.jpg', NULL, 1, 1, '2025-08-29 23:15:17', '2025-08-29 23:15:17'),
(10, '1000$ fundad account', 2, '120', 'images/funded/1756530949_68b289050e000.jpg', NULL, 1, 1, '2025-08-29 23:15:49', '2025-08-30 00:56:46');

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

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `permission_key` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `group_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
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
) ENGINE=MyISAM AUTO_INCREMENT=138 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `name`, `image`, `remarks`, `hierarchy`, `status`, `created_by`, `created_at`, `updated_at`) VALUES
(1, NULL, 'images/sliders/1756540896_68b2afe0bc37c.jpg', NULL, 1, 1, 1, '2025-08-30 02:01:36', '2025-08-30 02:18:34'),
(2, NULL, 'images/sliders/1756540991_68b2b03f46b29.jpg', NULL, 2, 1, 1, '2025-08-30 02:03:11', '2025-08-30 02:03:11'),
(3, NULL, 'images/sliders/1756541007_68b2b04f4ad10.jpg', NULL, 3, 1, 1, '2025-08-30 02:03:27', '2025-08-30 02:03:27'),
(4, NULL, 'images/sliders/1756541021_68b2b05d2c028.jpg', NULL, 4, 1, 1, '2025-08-30 02:03:41', '2025-08-30 02:03:41');

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
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `todo_lists`
--

INSERT INTO `todo_lists` (`id`, `user_id`, `buy_id`, `rule_key`, `rule_value`, `remarks`, `status`, `created_at`, `updated_at`) VALUES
(1, 19, 13, 'min_profit', '1', NULL, 1, '2025-08-28 11:32:09', '2025-08-28 11:32:09'),
(2, 19, 13, 'trade_limit', '1', NULL, 1, '2025-08-28 11:32:09', '2025-08-28 11:32:09'),
(4, 19, 13, 'rule_break', '1', NULL, 1, '2025-08-28 11:41:46', '2025-08-28 11:41:46');

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `deposit_proof` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` bigint DEFAULT NULL,
  `payment_status` tinyint NOT NULL DEFAULT '0',
  `remarks` mediumtext COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=Active, 0=Inactive',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Stores the creation time of the record',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Stores the last update time of the record',
  PRIMARY KEY (`id`),
  KEY `t_deposits_user_id_index` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `t_deposits`
--

INSERT INTO `t_deposits` (`id`, `user_id`, `binance_id`, `amount`, `deposit_proof`, `order_id`, `payment_status`, `remarks`, `status`, `created_at`, `updated_at`) VALUES
(4, 19, '564324567', 10.00, 'images/depositProof/1756049075_68ab2eb3ed525.png', 2147483647, 1, NULL, 1, '2025-08-24 09:24:35', '2025-08-29 17:13:19'),
(5, 19, '564324567', 20.00, 'images/depositProof/1756049707_68ab312b9382f.png', NULL, 1, NULL, 1, '2025-08-24 09:35:07', '2025-08-29 17:10:37'),
(6, 19, '564324567', 20.00, 'images/depositProof/1756093743_68abdd2f673e7.png', 234567, 0, NULL, 1, '2025-08-24 21:49:03', '2025-08-29 17:10:44'),
(7, 19, '564324567', 10.00, 'images/depositProof/1756094212_68abdf044a29b.png', 33333333, 0, NULL, 1, '2025-08-24 21:56:52', '2025-08-29 17:10:41'),
(8, 19, '564324567', 10.00, 'images/depositProof/1756094435_68abdfe3b2fd2.png', NULL, 0, NULL, 1, '2025-08-24 22:00:35', '2025-08-29 17:10:51'),
(9, 19, '564324567', 20.00, 'images/depositProof/1756094925_68abe1cdccaa5.png', NULL, 0, NULL, 1, '2025-08-24 22:08:45', '2025-08-29 17:10:54'),
(10, 19, '564324567', 10.00, 'images/depositProof/1756095153_68abe2b14d463.png', NULL, 0, NULL, 1, '2025-08-24 22:12:33', '2025-08-29 17:10:58'),
(11, 19, '564324567', 10.00, 'images/depositProof/1756095513_68abe419ed1a9.png', NULL, 0, NULL, 1, '2025-08-24 22:18:33', '2025-08-29 17:11:02'),
(12, 19, '564324567', 14.00, 'images/depositProof/1756095598_68abe46e7ff31.png', NULL, 0, NULL, 1, '2025-08-24 22:19:58', '2025-08-29 17:11:47'),
(13, 19, '564324567', 22.00, 'images/depositProof/1756095769_68abe5194314c.png', NULL, 0, NULL, 1, '2025-08-24 22:22:49', '2025-08-29 17:11:40'),
(14, 19, '564324567', 10.00, 'images/depositProof/1756095879_68abe58776a3f.png', NULL, 0, NULL, 1, '2025-08-24 22:24:39', '2025-08-29 17:11:37'),
(15, 19, '564324567', 10.00, 'images/depositProof/1756095913_68abe5a9d06e5.png', NULL, 0, NULL, 1, '2025-08-24 22:25:13', '2025-08-29 17:11:33'),
(16, 19, '564324567', 20.00, 'images/depositProof/1756096056_68abe638924d2.png', NULL, 0, NULL, 1, '2025-08-24 22:27:36', '2025-08-29 17:11:29'),
(17, 19, '564324567', 20.00, 'images/depositProof/1756096092_68abe65ca4b7b.png', NULL, 0, NULL, 1, '2025-08-24 22:28:12', '2025-08-29 17:11:25'),
(18, 19, '564324567', 30.00, 'images/depositProof/1756096134_68abe686071ee.png', 22, 0, NULL, 1, '2025-08-24 22:28:54', '2025-08-29 17:11:22'),
(19, 19, '564324567', 20.00, 'images/depositProof/1756096256_68abe7009aff7.png', NULL, 0, NULL, 1, '2025-08-24 22:30:56', '2025-08-29 17:11:18'),
(20, 19, '564324567', 10.00, 'images/depositProof/1756096614_68abe8663a0d8.png', 9223372036854775807, 1, NULL, 1, '2025-08-24 22:36:54', '2025-08-29 17:18:30'),
(21, 20, '564324567', 100.00, 'images/depositProof/1756444266_68b1366a9f9e8.png', 123453, 0, NULL, 1, '2025-08-28 23:11:06', '2025-08-29 17:11:11'),
(22, 19, '972857500', 10.00, 'images/depositProof/1756535402_68b29a6a889bb.jpg', 123456754676543, 0, NULL, 1, '2025-08-30 00:30:02', '2025-08-30 00:30:02');

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
  `order_id` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invest_proof` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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

INSERT INTO `t_invests` (`id`, `user_id`, `category_id`, `package_id`, `amount`, `order_id`, `invest_proof`, `payment_status`, `binance_id`, `remarks`, `status`, `created_at`, `updated_at`) VALUES
(1, 19, NULL, 'Trusted Company Investment', 100.00, '13099', 'images/investProof/1756232737_68adfc21261f2.png', 1, NULL, NULL, 1, '2025-08-26 12:25:37', '2025-08-27 10:17:07'),
(2, 19, NULL, 'Trusted Company Investment', 100.00, '1234', 'images/investProof/1756487119_68b1ddcff248c.jpg', 0, NULL, NULL, 1, '2025-08-29 11:05:19', '2025-08-29 11:05:19'),
(3, 19, NULL, 'Trusted Company Investment', 100.00, '12345678987654312456', 'images/investProof/1756533324_68b2924cef0d2.jpg', 0, NULL, NULL, 1, '2025-08-29 23:55:24', '2025-08-29 23:55:24');

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
  `country_code` varchar(7) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Stores the user''s hashed password with minimum 8length',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `google_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `refer_code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `own_refer_code` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `level` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Level 1',
  `total_deposit_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `total_invest_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `total_withdraw_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
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
  KEY `users_name_index` (`name`),
  KEY `users_email_index` (`email`),
  KEY `users_phone_number_index` (`phone_number`),
  KEY `users_account_type_index` (`account_type`),
  KEY `users_status_index` (`status`),
  KEY `users_created_at_index` (`created_at`),
  KEY `users_updated_at_index` (`updated_at`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `first_name`, `last_name`, `email`, `country_code`, `phone_number`, `email_verified_at`, `password`, `remember_token`, `google_id`, `avatar`, `refer_code`, `own_refer_code`, `level`, `total_deposit_amount`, `total_invest_amount`, `total_withdraw_amount`, `address`, `country`, `state`, `city`, `zip_code`, `account_type`, `otp`, `otp_expires_at`, `otp_status`, `save_business_list`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(24, 'pub', NULL, NULL, 'abc2@gmail.com', NULL, '01767676543', NULL, '$2y$12$xvEPlG2RCgw8fg2eLY2BsOKr7al36Nj9KQRdN9qVMWhNlmRchBo6W', NULL, NULL, NULL, NULL, '5735', 'Level 1', 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-08-29 03:06:10', '2025-08-29 03:06:10', NULL),
(21, 'cjhch', NULL, NULL, 'abc@gmail.com', NULL, '01767676543', NULL, '$2y$12$gpG43qWUyjiEoFVFlBm8NOXjIDUmdLJSctWoaHuUQV/iy5jc2W8Ga', NULL, NULL, NULL, NULL, '3026', 'Level 1', 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-08-28 23:33:32', '2025-08-28 23:33:32', NULL),
(19, 'Nazim', NULL, NULL, 'nazim12@gmail.com', NULL, '01767676543', NULL, '$2y$12$jYhgEXa1Z0nUvqDK.igs0utaCPLnGVmnn0kJWmAG3gpD6nmGBMIUu', NULL, NULL, NULL, '123456', '827', 'Level 1', 95.00, 100.00, 10.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-08-23 07:30:26', '2025-08-30 00:29:09', NULL),
(20, 'new', NULL, NULL, 'new@gmail.com', NULL, '01767676543', NULL, '$2y$12$nLbnOMVZWy/xrhMiJ33j2uqiYYGY/qmixYCXu1angxg6DA4WZJ1Ga', NULL, NULL, NULL, NULL, '742', 'Level 1', 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-08-28 23:06:41', '2025-08-28 23:06:41', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_nid_images`
--

DROP TABLE IF EXISTS `user_nid_images`;
CREATE TABLE IF NOT EXISTS `user_nid_images` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `nid_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=Active, 0=Inactive',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Stores the creation time of the record',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Stores the last update time of the record',
  PRIMARY KEY (`id`),
  KEY `user_nid_images_user_id_index` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_nid_images`
--

INSERT INTO `user_nid_images` (`id`, `user_id`, `nid_image`, `status`, `created_at`, `updated_at`) VALUES
(5, 21, 'images/users/17564456120_screencapture-nenoxshop-topup-61-freefire-idcode-indonesia-2025-08-25-21_58_39.png', 1, '2025-08-28 23:33:32', '2025-08-28 23:33:32'),
(3, 19, 'images/users/17559558260_Screenshot 2025-08-22 182708.png', 1, '2025-08-23 07:30:26', '2025-08-23 07:30:26'),
(4, 19, 'images/users/17559558261_1749191004.jpg', 1, '2025-08-23 07:30:26', '2025-08-23 07:30:26'),
(8, 24, 'images/users/17564583700_Screenshot 2025-08-24 011313.png', 1, '2025-08-29 03:06:10', '2025-08-29 03:06:10');

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
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `withdraws`
--

INSERT INTO `withdraws` (`id`, `user_id`, `amount`, `binance_id`, `payment_status`, `remarks`, `status`, `created_at`, `updated_at`) VALUES
(6, 19, 10.00, '123456123', 1, NULL, 1, '2025-08-29 08:50:02', '2025-08-29 17:08:59');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
