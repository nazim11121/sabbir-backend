-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 05, 2025 at 07:40 PM
-- Server version: 10.11.13-MariaDB-cll-lve
-- PHP Version: 8.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bdfunded_trader`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_log`
--

CREATE TABLE `activity_log` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `log_name` varchar(191) DEFAULT NULL,
  `description` text NOT NULL,
  `subject_type` varchar(191) DEFAULT NULL,
  `event` varchar(191) DEFAULT NULL,
  `subject_id` bigint(20) UNSIGNED DEFAULT NULL,
  `causer_type` varchar(191) DEFAULT NULL,
  `causer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`properties`)),
  `batch_uuid` char(36) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `activity_log`
--

INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_type`, `event`, `subject_id`, `causer_type`, `causer_id`, `properties`, `batch_uuid`, `created_at`, `updated_at`) VALUES
(19, 'Updated: call_user_func: ', 'Action: Updated, Method Name: call_user_func, Table Name: users, Attributes name: ', 'App\\Models\\User', 'updated', 19, 'App\\Models\\Admin\\TAdminUser', 1, '{\"old\": [], \"attributes\": []}', NULL, '2025-08-31 14:21:12', '2025-08-31 14:21:12'),
(18, 'Updated: call_user_func: ', 'Action: Updated, Method Name: call_user_func, Table Name: users, Attributes name: ', 'App\\Models\\User', 'updated', 19, 'App\\Models\\Admin\\TAdminUser', 1, '{\"old\": [], \"attributes\": []}', NULL, '2025-08-31 13:56:29', '2025-08-31 13:56:29'),
(17, 'Updated: call_user_func: ', 'Action: Updated, Method Name: call_user_func, Table Name: users, Attributes name: ', 'App\\Models\\User', 'updated', 25, 'App\\Models\\Admin\\TAdminUser', 1, '{\"old\": [], \"attributes\": []}', NULL, '2025-08-31 13:24:11', '2025-08-31 13:24:11'),
(16, 'Updated: call_user_func: ', 'Action: Updated, Method Name: call_user_func, Table Name: users, Attributes name: ', 'App\\Models\\User', 'updated', 25, 'App\\Models\\Admin\\TAdminUser', 1, '{\"old\": [], \"attributes\": []}', NULL, '2025-08-31 13:23:30', '2025-08-31 13:23:30'),
(15, 'Updated: call_user_func: ', 'Action: Updated, Method Name: call_user_func, Table Name: users, Attributes name: ', 'App\\Models\\User', 'updated', 19, 'App\\Models\\Admin\\TAdminUser', 1, '{\"old\": [], \"attributes\": []}', NULL, '2025-08-31 13:13:38', '2025-08-31 13:13:38'),
(14, 'Updated: call_user_func: ', 'Action: Updated, Method Name: call_user_func, Table Name: users, Attributes name: ', 'App\\Models\\User', 'updated', 19, 'App\\Models\\Admin\\TAdminUser', 1, '{\"old\": [], \"attributes\": []}', NULL, '2025-08-31 12:59:44', '2025-08-31 12:59:44'),
(13, 'Updated: call_user_func: ', 'Action: Updated, Method Name: call_user_func, Table Name: users, Attributes name: ', 'App\\Models\\User', 'updated', 19, 'App\\Models\\Admin\\TAdminUser', 1, '{\"old\": [], \"attributes\": []}', NULL, '2025-08-31 12:53:40', '2025-08-31 12:53:40'),
(12, 'Updated: call_user_func: ', 'Action: Updated, Method Name: call_user_func, Table Name: users, Attributes name: ', 'App\\Models\\User', 'updated', 20, 'App\\Models\\Admin\\TAdminUser', 1, '{\"old\": [], \"attributes\": []}', NULL, '2025-08-31 10:28:23', '2025-08-31 10:28:23'),
(11, 'Updated: call_user_func: ', 'Action: Updated, Method Name: call_user_func, Table Name: users, Attributes name: ', 'App\\Models\\User', 'updated', 19, 'App\\Models\\Admin\\TAdminUser', 1, '{\"old\": [], \"attributes\": []}', NULL, '2025-08-31 10:28:06', '2025-08-31 10:28:06'),
(20, 'Updated: call_user_func: ', 'Action: Updated, Method Name: call_user_func, Table Name: users, Attributes name: ', 'App\\Models\\User', 'updated', 19, 'App\\Models\\Admin\\TAdminUser', 1, '{\"old\": [], \"attributes\": []}', NULL, '2025-08-31 14:21:19', '2025-08-31 14:21:19'),
(21, 'Updated: call_user_func: ', 'Action: Updated, Method Name: call_user_func, Table Name: users, Attributes name: ', 'App\\Models\\User', 'updated', 19, 'App\\Models\\Admin\\TAdminUser', 1, '{\"old\": [], \"attributes\": []}', NULL, '2025-08-31 14:21:25', '2025-08-31 14:21:25'),
(22, 'Updated: call_user_func: ', 'Action: Updated, Method Name: call_user_func, Table Name: users, Attributes name: ', 'App\\Models\\User', 'updated', 2, NULL, NULL, '{\"attributes\":[],\"old\":[]}', NULL, '2025-09-01 21:50:30', '2025-09-01 21:50:30'),
(23, 'Updated: call_user_func: ', 'Action: Updated, Method Name: call_user_func, Table Name: users, Attributes name: ', 'App\\Models\\User', 'updated', 2, 'App\\Models\\Admin\\TAdminUser', 1, '{\"attributes\":[],\"old\":[]}', NULL, '2025-09-01 21:53:16', '2025-09-01 21:53:16'),
(24, 'Updated: call_user_func: ', 'Action: Updated, Method Name: call_user_func, Table Name: users, Attributes name: ', 'App\\Models\\User', 'updated', 3, NULL, NULL, '{\"attributes\":[],\"old\":[]}', NULL, '2025-09-01 21:53:46', '2025-09-01 21:53:46'),
(25, 'Updated: call_user_func: ', 'Action: Updated, Method Name: call_user_func, Table Name: users, Attributes name: ', 'App\\Models\\User', 'updated', 1, 'App\\Models\\Admin\\TAdminUser', 1, '{\"attributes\":[],\"old\":[]}', NULL, '2025-09-01 21:55:32', '2025-09-01 21:55:32'),
(26, 'Updated: call_user_func: ', 'Action: Updated, Method Name: call_user_func, Table Name: users, Attributes name: ', 'App\\Models\\User', 'updated', 3, 'App\\Models\\Admin\\TAdminUser', 1, '{\"attributes\":[],\"old\":[]}', NULL, '2025-09-01 21:57:08', '2025-09-01 21:57:08'),
(27, 'Updated: call_user_func: ', 'Action: Updated, Method Name: call_user_func, Table Name: users, Attributes name: ', 'App\\Models\\User', 'updated', 1, 'App\\Models\\Admin\\TAdminUser', 1, '{\"attributes\":[],\"old\":[]}', NULL, '2025-09-01 21:57:26', '2025-09-01 21:57:26'),
(28, 'Updated: call_user_func: ', 'Action: Updated, Method Name: call_user_func, Table Name: users, Attributes name: ', 'App\\Models\\User', 'updated', 2, 'App\\Models\\Admin\\TAdminUser', 1, '{\"attributes\":[],\"old\":[]}', NULL, '2025-09-01 21:58:00', '2025-09-01 21:58:00'),
(29, 'Updated: call_user_func: ', 'Action: Updated, Method Name: call_user_func, Table Name: users, Attributes name: ', 'App\\Models\\User', 'updated', 3, 'App\\Models\\Admin\\TAdminUser', 1, '{\"attributes\":[],\"old\":[]}', NULL, '2025-09-01 21:58:21', '2025-09-01 21:58:21'),
(30, 'Updated: call_user_func: ', 'Action: Updated, Method Name: call_user_func, Table Name: users, Attributes name: ', 'App\\Models\\User', 'updated', 2, 'App\\Models\\Admin\\TAdminUser', 1, '{\"attributes\":[],\"old\":[]}', NULL, '2025-09-01 21:59:10', '2025-09-01 21:59:10'),
(31, 'Updated: call_user_func: ', 'Action: Updated, Method Name: call_user_func, Table Name: users, Attributes name: ', 'App\\Models\\User', 'updated', 3, 'App\\Models\\Admin\\TAdminUser', 1, '{\"attributes\":[],\"old\":[]}', NULL, '2025-09-01 21:59:57', '2025-09-01 21:59:57'),
(32, 'Updated: call_user_func: ', 'Action: Updated, Method Name: call_user_func, Table Name: users, Attributes name: ', 'App\\Models\\User', 'updated', 3, 'App\\Models\\Admin\\TAdminUser', 1, '{\"attributes\":[],\"old\":[]}', NULL, '2025-09-01 22:07:17', '2025-09-01 22:07:17'),
(33, 'Updated: call_user_func: ', 'Action: Updated, Method Name: call_user_func, Table Name: users, Attributes name: ', 'App\\Models\\User', 'updated', 4, 'App\\Models\\Admin\\TAdminUser', 1, '{\"attributes\":[],\"old\":[]}', NULL, '2025-09-01 22:18:47', '2025-09-01 22:18:47'),
(34, 'Updated: call_user_func: ', 'Action: Updated, Method Name: call_user_func, Table Name: users, Attributes name: ', 'App\\Models\\User', 'updated', 4, NULL, NULL, '{\"attributes\":[],\"old\":[]}', NULL, '2025-09-01 22:38:47', '2025-09-01 22:38:47'),
(35, 'Updated: call_user_func: ', 'Action: Updated, Method Name: call_user_func, Table Name: users, Attributes name: ', 'App\\Models\\User', 'updated', 3, NULL, NULL, '{\"attributes\":[],\"old\":[]}', NULL, '2025-09-02 02:07:37', '2025-09-02 02:07:37'),
(36, 'Updated: call_user_func: ', 'Action: Updated, Method Name: call_user_func, Table Name: users, Attributes name: ', 'App\\Models\\User', 'updated', 3, 'App\\Models\\Admin\\TAdminUser', 1, '{\"attributes\":[],\"old\":[]}', NULL, '2025-09-02 02:09:12', '2025-09-02 02:09:12'),
(37, 'Updated: call_user_func: ', 'Action: Updated, Method Name: call_user_func, Table Name: users, Attributes name: ', 'App\\Models\\User', 'updated', 3, 'App\\Models\\Admin\\TAdminUser', 1, '{\"attributes\":[],\"old\":[]}', NULL, '2025-09-02 02:16:48', '2025-09-02 02:16:48'),
(38, 'Updated: call_user_func: ', 'Action: Updated, Method Name: call_user_func, Table Name: users, Attributes name: ', 'App\\Models\\User', 'updated', 5, 'App\\Models\\Admin\\TAdminUser', 1, '{\"attributes\":[],\"old\":[]}', NULL, '2025-09-02 03:56:59', '2025-09-02 03:56:59'),
(39, 'Updated: call_user_func: ', 'Action: Updated, Method Name: call_user_func, Table Name: users, Attributes name: ', 'App\\Models\\User', 'updated', 1, 'App\\Models\\Admin\\TAdminUser', 1, '{\"attributes\":[],\"old\":[]}', NULL, '2025-09-02 04:09:14', '2025-09-02 04:09:14'),
(40, 'Updated: call_user_func: ', 'Action: Updated, Method Name: call_user_func, Table Name: users, Attributes name: ', 'App\\Models\\User', 'updated', 3, NULL, NULL, '{\"attributes\":[],\"old\":[]}', NULL, '2025-09-02 09:40:06', '2025-09-02 09:40:06'),
(41, 'Updated: call_user_func: ', 'Action: Updated, Method Name: call_user_func, Table Name: users, Attributes name: ', 'App\\Models\\User', 'updated', 2, NULL, NULL, '{\"attributes\":[],\"old\":[]}', NULL, '2025-09-02 10:24:26', '2025-09-02 10:24:26'),
(42, 'Updated: call_user_func: ', 'Action: Updated, Method Name: call_user_func, Table Name: users, Attributes name: ', 'App\\Models\\User', 'updated', 9, NULL, NULL, '{\"attributes\":[],\"old\":[]}', NULL, '2025-09-03 09:34:31', '2025-09-03 09:34:31'),
(43, 'Updated: call_user_func: ', 'Action: Updated, Method Name: call_user_func, Table Name: users, Attributes name: ', 'App\\Models\\User', 'updated', 21, 'App\\Models\\Admin\\TAdminUser', 1, '{\"attributes\":[],\"old\":[]}', NULL, '2025-09-04 23:48:30', '2025-09-04 23:48:30'),
(44, 'Updated: call_user_func: ', 'Action: Updated, Method Name: call_user_func, Table Name: users, Attributes name: ', 'App\\Models\\User', 'updated', 21, 'App\\Models\\Admin\\TAdminUser', 1, '{\"attributes\":[],\"old\":[]}', NULL, '2025-09-04 23:49:10', '2025-09-04 23:49:10'),
(45, 'Updated: call_user_func: ', 'Action: Updated, Method Name: call_user_func, Table Name: users, Attributes name: ', 'App\\Models\\User', 'updated', 21, NULL, NULL, '{\"attributes\":[],\"old\":[]}', NULL, '2025-09-04 23:50:02', '2025-09-04 23:50:02'),
(46, 'Updated: call_user_func: ', 'Action: Updated, Method Name: call_user_func, Table Name: users, Attributes name: ', 'App\\Models\\User', 'updated', 15, 'App\\Models\\Admin\\TAdminUser', 1, '{\"attributes\":[],\"old\":[]}', NULL, '2025-09-04 23:54:01', '2025-09-04 23:54:01'),
(47, 'Updated: call_user_func: ', 'Action: Updated, Method Name: call_user_func, Table Name: users, Attributes name: ', 'App\\Models\\User', 'updated', 15, 'App\\Models\\Admin\\TAdminUser', 1, '{\"attributes\":[],\"old\":[]}', NULL, '2025-09-04 23:55:13', '2025-09-04 23:55:13'),
(48, 'Updated: call_user_func: ', 'Action: Updated, Method Name: call_user_func, Table Name: users, Attributes name: ', 'App\\Models\\User', 'updated', 15, 'App\\Models\\Admin\\TAdminUser', 1, '{\"attributes\":[],\"old\":[]}', NULL, '2025-09-04 23:55:24', '2025-09-04 23:55:24'),
(49, 'Updated: call_user_func: ', 'Action: Updated, Method Name: call_user_func, Table Name: users, Attributes name: ', 'App\\Models\\User', 'updated', 15, 'App\\Models\\Admin\\TAdminUser', 1, '{\"attributes\":[],\"old\":[]}', NULL, '2025-09-04 23:55:29', '2025-09-04 23:55:29'),
(50, 'Updated: call_user_func: ', 'Action: Updated, Method Name: call_user_func, Table Name: users, Attributes name: ', 'App\\Models\\User', 'updated', 15, 'App\\Models\\Admin\\TAdminUser', 1, '{\"attributes\":[],\"old\":[]}', NULL, '2025-09-04 23:55:49', '2025-09-04 23:55:49'),
(51, 'Updated: call_user_func: ', 'Action: Updated, Method Name: call_user_func, Table Name: users, Attributes name: ', 'App\\Models\\User', 'updated', 15, 'App\\Models\\Admin\\TAdminUser', 1, '{\"attributes\":[],\"old\":[]}', NULL, '2025-09-04 23:56:17', '2025-09-04 23:56:17'),
(52, 'Updated: call_user_func: ', 'Action: Updated, Method Name: call_user_func, Table Name: users, Attributes name: ', 'App\\Models\\User', 'updated', 13, 'App\\Models\\Admin\\TAdminUser', 1, '{\"attributes\":[],\"old\":[]}', NULL, '2025-09-05 00:02:39', '2025-09-05 00:02:39'),
(53, 'Updated: call_user_func: ', 'Action: Updated, Method Name: call_user_func, Table Name: users, Attributes name: ', 'App\\Models\\User', 'updated', 13, NULL, NULL, '{\"attributes\":[],\"old\":[]}', NULL, '2025-09-05 00:04:06', '2025-09-05 00:04:06'),
(54, 'Updated: call_user_func: ', 'Action: Updated, Method Name: call_user_func, Table Name: users, Attributes name: ', 'App\\Models\\User', 'updated', 13, NULL, NULL, '{\"attributes\":[],\"old\":[]}', NULL, '2025-09-05 00:06:27', '2025-09-05 00:06:27'),
(55, 'Updated: call_user_func: ', 'Action: Updated, Method Name: call_user_func, Table Name: users, Attributes name: ', 'App\\Models\\User', 'updated', 13, NULL, NULL, '{\"attributes\":[],\"old\":[]}', NULL, '2025-09-05 00:09:25', '2025-09-05 00:09:25'),
(56, 'Updated: call_user_func: ', 'Action: Updated, Method Name: call_user_func, Table Name: users, Attributes name: ', 'App\\Models\\User', 'updated', 13, NULL, NULL, '{\"attributes\":[],\"old\":[]}', NULL, '2025-09-05 00:10:19', '2025-09-05 00:10:19'),
(57, 'Updated: call_user_func: ', 'Action: Updated, Method Name: call_user_func, Table Name: users, Attributes name: ', 'App\\Models\\User', 'updated', 13, NULL, NULL, '{\"attributes\":[],\"old\":[]}', NULL, '2025-09-05 00:14:46', '2025-09-05 00:14:46'),
(58, 'Updated: call_user_func: ', 'Action: Updated, Method Name: call_user_func, Table Name: users, Attributes name: ', 'App\\Models\\User', 'updated', 23, 'App\\Models\\Admin\\TAdminUser', 1, '{\"attributes\":[],\"old\":[]}', NULL, '2025-09-05 00:15:56', '2025-09-05 00:15:56'),
(59, 'Updated: call_user_func: password', 'Action: Updated, Method Name: call_user_func, Table Name: users, Attributes name: password', 'App\\Models\\User', 'updated', 13, NULL, NULL, '{\"attributes\":{\"password\":\"$2y$12$ROjXOCeZjHB.haQRJ.Fyfek.IIDwUNBnMnngOIGYcW4moXvooHjNK\"},\"old\":{\"password\":\"$2y$12$ZqJkjdA.Wy23iHjmexpg\\/uT0XTFzNP5vvmTG8NSXm\\/xbHv5bXhw7C\"}}', NULL, '2025-09-05 00:17:19', '2025-09-05 00:17:19'),
(60, 'Updated: call_user_func: ', 'Action: Updated, Method Name: call_user_func, Table Name: users, Attributes name: ', 'App\\Models\\User', 'updated', 23, 'App\\Models\\Admin\\TAdminUser', 1, '{\"attributes\":[],\"old\":[]}', NULL, '2025-09-05 00:17:41', '2025-09-05 00:17:41'),
(61, 'Updated: call_user_func: ', 'Action: Updated, Method Name: call_user_func, Table Name: users, Attributes name: ', 'App\\Models\\User', 'updated', 13, NULL, NULL, '{\"attributes\":[],\"old\":[]}', NULL, '2025-09-05 00:25:20', '2025-09-05 00:25:20'),
(62, 'Updated: call_user_func: ', 'Action: Updated, Method Name: call_user_func, Table Name: users, Attributes name: ', 'App\\Models\\User', 'updated', 13, NULL, NULL, '{\"attributes\":[],\"old\":[]}', NULL, '2025-09-05 00:26:13', '2025-09-05 00:26:13'),
(63, 'Updated: call_user_func: ', 'Action: Updated, Method Name: call_user_func, Table Name: users, Attributes name: ', 'App\\Models\\User', 'updated', 13, 'App\\Models\\Admin\\TAdminUser', 1, '{\"attributes\":[],\"old\":[]}', NULL, '2025-09-05 00:29:18', '2025-09-05 00:29:18'),
(64, 'Updated: call_user_func: ', 'Action: Updated, Method Name: call_user_func, Table Name: users, Attributes name: ', 'App\\Models\\User', 'updated', 13, NULL, NULL, '{\"attributes\":[],\"old\":[]}', NULL, '2025-09-05 00:30:15', '2025-09-05 00:30:15'),
(65, 'Updated: call_user_func: ', 'Action: Updated, Method Name: call_user_func, Table Name: users, Attributes name: ', 'App\\Models\\User', 'updated', 13, NULL, NULL, '{\"attributes\":[],\"old\":[]}', NULL, '2025-09-05 02:04:30', '2025-09-05 02:04:30'),
(66, 'Updated: call_user_func: ', 'Action: Updated, Method Name: call_user_func, Table Name: users, Attributes name: ', 'App\\Models\\User', 'updated', 8, 'App\\Models\\Admin\\TAdminUser', 1, '{\"attributes\":[],\"old\":[]}', NULL, '2025-09-05 06:09:42', '2025-09-05 06:09:42'),
(67, 'Updated: call_user_func: ', 'Action: Updated, Method Name: call_user_func, Table Name: users, Attributes name: ', 'App\\Models\\User', 'updated', 8, NULL, NULL, '{\"attributes\":[],\"old\":[]}', NULL, '2025-09-05 06:10:20', '2025-09-05 06:10:20'),
(68, 'Updated: call_user_func: ', 'Action: Updated, Method Name: call_user_func, Table Name: users, Attributes name: ', 'App\\Models\\User', 'updated', 8, 'App\\Models\\Admin\\TAdminUser', 1, '{\"attributes\":[],\"old\":[]}', NULL, '2025-09-05 06:12:34', '2025-09-05 06:12:34'),
(69, 'Updated: call_user_func: ', 'Action: Updated, Method Name: call_user_func, Table Name: users, Attributes name: ', 'App\\Models\\User', 'updated', 23, NULL, NULL, '{\"attributes\":[],\"old\":[]}', NULL, '2025-09-05 06:25:31', '2025-09-05 06:25:31'),
(70, 'Updated: call_user_func: ', 'Action: Updated, Method Name: call_user_func, Table Name: users, Attributes name: ', 'App\\Models\\User', 'updated', 8, NULL, NULL, '{\"attributes\":[],\"old\":[]}', NULL, '2025-09-05 06:59:47', '2025-09-05 06:59:47'),
(71, 'Updated: call_user_func: ', 'Action: Updated, Method Name: call_user_func, Table Name: users, Attributes name: ', 'App\\Models\\User', 'updated', 28, 'App\\Models\\Admin\\TAdminUser', 1, '{\"attributes\":[],\"old\":[]}', NULL, '2025-09-05 07:13:16', '2025-09-05 07:13:16');

-- --------------------------------------------------------

--
-- Table structure for table `buy_packages`
--

CREATE TABLE `buy_packages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `package_id` varchar(100) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `payment_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1=Success, 0=Processing, 2=Failed',
  `remarks` mediumtext DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=Active, 0=Inactive',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Stores the creation time of the record',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Stores the last update time of the record'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(191) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('spatie.permission.cache', 'a:3:{s:5:\"alias\";a:8:{s:1:\"a\";s:2:\"id\";s:1:\"b\";s:4:\"name\";s:1:\"c\";s:10:\"guard_name\";s:1:\"d\";s:14:\"permission_key\";s:1:\"e\";s:10:\"group_name\";s:1:\"f\";s:11:\"description\";s:1:\"g\";s:11:\"priority_id\";s:1:\"r\";s:5:\"roles\";}s:11:\"permissions\";a:75:{i:0;a:8:{s:1:\"a\";s:2:\"13\";s:1:\"b\";s:9:\"Dashboard\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:9:\"dashboard\";s:1:\"e\";N;s:1:\"f\";N;s:1:\"g\";s:1:\"1\";s:1:\"r\";a:1:{i:0;i:1;}}i:1;a:8:{s:1:\"a\";s:2:\"17\";s:1:\"b\";s:19:\"Customer Management\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:8:\"customer\";s:1:\"e\";N;s:1:\"f\";N;s:1:\"g\";s:1:\"3\";s:1:\"r\";a:1:{i:0;i:1;}}i:2;a:8:{s:1:\"a\";s:2:\"18\";s:1:\"b\";s:17:\"Business Settings\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:17:\"business-settings\";s:1:\"e\";N;s:1:\"f\";N;s:1:\"g\";s:1:\"2\";s:1:\"r\";a:1:{i:0;i:1;}}i:3;a:8:{s:1:\"a\";s:2:\"19\";s:1:\"b\";s:15:\"User Management\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:4:\"user\";s:1:\"e\";N;s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:4;a:8:{s:1:\"a\";s:2:\"20\";s:1:\"b\";s:13:\"Company Info \";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:12:\"company-info\";s:1:\"e\";N;s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:5;a:7:{s:1:\"a\";s:2:\"21\";s:1:\"b\";s:10:\"Import CSV\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:10:\"import-csv\";s:1:\"e\";N;s:1:\"f\";N;s:1:\"g\";N;}i:6;a:8:{s:1:\"a\";s:2:\"22\";s:1:\"b\";s:15:\"Database Backup\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:9:\"db-backup\";s:1:\"e\";N;s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:7;a:8:{s:1:\"a\";s:2:\"23\";s:1:\"b\";s:13:\"dashboard one\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:13:\"dashboard-one\";s:1:\"e\";s:9:\"Dashboard\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:8;a:8:{s:1:\"a\";s:2:\"24\";s:1:\"b\";s:13:\"dashboard two\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:13:\"dashboard-two\";s:1:\"e\";s:9:\"Dashboard\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:9;a:8:{s:1:\"a\";s:2:\"25\";s:1:\"b\";s:10:\"creed tags\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:10:\"creed-tags\";s:1:\"e\";s:17:\"Business Settings\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:10;a:8:{s:1:\"a\";s:2:\"26\";s:1:\"b\";s:13:\"business type\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:13:\"business-type\";s:1:\"e\";s:17:\"Business Settings\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:11;a:8:{s:1:\"a\";s:2:\"27\";s:1:\"b\";s:17:\"business category\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:17:\"business-category\";s:1:\"e\";s:17:\"Business Settings\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:12;a:8:{s:1:\"a\";s:2:\"28\";s:1:\"b\";s:20:\"business subcategory\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:20:\"business-subcategory\";s:1:\"e\";s:17:\"Business Settings\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:13;a:8:{s:1:\"a\";s:2:\"29\";s:1:\"b\";s:13:\"business tags\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:13:\"business-tags\";s:1:\"e\";s:17:\"Business Settings\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:14;a:8:{s:1:\"a\";s:2:\"30\";s:1:\"b\";s:10:\"restaurant\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:10:\"restaurant\";s:1:\"e\";s:17:\"Business Settings\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:15;a:8:{s:1:\"a\";s:2:\"31\";s:1:\"b\";s:11:\"affliations\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:11:\"affliations\";s:1:\"e\";s:17:\"Business Settings\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:16;a:8:{s:1:\"a\";s:2:\"46\";s:1:\"b\";s:13:\"customer list\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:13:\"customer-list\";s:1:\"e\";s:19:\"Customer Management\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:17;a:8:{s:1:\"a\";s:2:\"47\";s:1:\"b\";s:13:\"archieve list\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:13:\"archieve-list\";s:1:\"e\";s:19:\"Customer Management\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:18;a:8:{s:1:\"a\";s:2:\"48\";s:1:\"b\";s:10:\"admin user\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:10:\"admin-user\";s:1:\"e\";s:15:\"User Management\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:19;a:8:{s:1:\"a\";s:2:\"49\";s:1:\"b\";s:4:\"role\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:4:\"role\";s:1:\"e\";s:15:\"User Management\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:20;a:8:{s:1:\"a\";s:2:\"50\";s:1:\"b\";s:10:\"permission\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:10:\"permission\";s:1:\"e\";s:15:\"User Management\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:21;a:8:{s:1:\"a\";s:2:\"51\";s:1:\"b\";s:5:\"about\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:5:\"about\";s:1:\"e\";N;s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:22;a:8:{s:1:\"a\";s:2:\"52\";s:1:\"b\";s:17:\"subscription plan\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:17:\"subscription-plan\";s:1:\"e\";s:17:\"Business Settings\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:23;a:8:{s:1:\"a\";s:2:\"53\";s:1:\"b\";s:18:\"creed tags add btn\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:18:\"creed-tags-add-btn\";s:1:\"e\";s:17:\"Business Settings\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:24;a:8:{s:1:\"a\";s:2:\"54\";s:1:\"b\";s:19:\"creed tags edit btn\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:19:\"creed-tags-edit-btn\";s:1:\"e\";s:17:\"Business Settings\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:25;a:8:{s:1:\"a\";s:2:\"55\";s:1:\"b\";s:21:\"creed tags delete btn\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:21:\"creed-tags-delete-btn\";s:1:\"e\";s:17:\"Business Settings\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:26;a:8:{s:1:\"a\";s:2:\"56\";s:1:\"b\";s:21:\"business type add btn\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:21:\"business-type-add-btn\";s:1:\"e\";s:17:\"Business Settings\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:27;a:8:{s:1:\"a\";s:2:\"57\";s:1:\"b\";s:22:\"business type edit btn\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:22:\"business-type-edit-btn\";s:1:\"e\";s:17:\"Business Settings\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:28;a:8:{s:1:\"a\";s:2:\"58\";s:1:\"b\";s:24:\"business type delete btn\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:24:\"business-type-delete-btn\";s:1:\"e\";s:17:\"Business Settings\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:29;a:8:{s:1:\"a\";s:2:\"59\";s:1:\"b\";s:25:\"business category add btn\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:25:\"business-category-add-btn\";s:1:\"e\";s:17:\"Business Settings\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:30;a:8:{s:1:\"a\";s:2:\"60\";s:1:\"b\";s:26:\"business category edit btn\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:26:\"business-category-edit-btn\";s:1:\"e\";s:17:\"Business Settings\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:31;a:8:{s:1:\"a\";s:2:\"61\";s:1:\"b\";s:28:\"business category delete btn\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:28:\"business-category-delete-btn\";s:1:\"e\";s:17:\"Business Settings\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:32;a:8:{s:1:\"a\";s:2:\"62\";s:1:\"b\";s:28:\"business subcategory add btn\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:28:\"business-subcategory-add-btn\";s:1:\"e\";s:17:\"Business Settings\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:33;a:8:{s:1:\"a\";s:2:\"63\";s:1:\"b\";s:29:\"business subcategory edit btn\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:29:\"business-subcategory-edit-btn\";s:1:\"e\";s:17:\"Business Settings\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:34;a:8:{s:1:\"a\";s:2:\"64\";s:1:\"b\";s:31:\"business subcategory delete btn\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:31:\"business-subcategory-delete-btn\";s:1:\"e\";s:17:\"Business Settings\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:35;a:8:{s:1:\"a\";s:2:\"65\";s:1:\"b\";s:21:\"business tags add btn\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:21:\"business-tags-add-btn\";s:1:\"e\";s:17:\"Business Settings\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:36;a:8:{s:1:\"a\";s:2:\"66\";s:1:\"b\";s:22:\"business tags edit btn\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:22:\"business-tags-edit-btn\";s:1:\"e\";s:17:\"Business Settings\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:37;a:8:{s:1:\"a\";s:2:\"67\";s:1:\"b\";s:24:\"business tags delete btn\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:24:\"business-tags-delete-btn\";s:1:\"e\";s:17:\"Business Settings\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:38;a:8:{s:1:\"a\";s:2:\"68\";s:1:\"b\";s:18:\"restaurant add btn\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:18:\"restaurant-add-btn\";s:1:\"e\";s:17:\"Business Settings\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:39;a:8:{s:1:\"a\";s:2:\"69\";s:1:\"b\";s:19:\"restaurant edit btn\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:19:\"restaurant-edit-btn\";s:1:\"e\";s:17:\"Business Settings\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:40;a:8:{s:1:\"a\";s:2:\"70\";s:1:\"b\";s:21:\"restaurant delete btn\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:21:\"restaurant-delete-btn\";s:1:\"e\";s:17:\"Business Settings\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:41;a:8:{s:1:\"a\";s:2:\"71\";s:1:\"b\";s:19:\"affliations add btn\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:19:\"affliations-add-btn\";s:1:\"e\";s:17:\"Business Settings\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:42;a:8:{s:1:\"a\";s:2:\"72\";s:1:\"b\";s:20:\"affliations edit btn\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:20:\"affliations-edit-btn\";s:1:\"e\";s:17:\"Business Settings\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:43;a:8:{s:1:\"a\";s:2:\"73\";s:1:\"b\";s:22:\"affliations delete btn\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:22:\"affliations-delete-btn\";s:1:\"e\";s:17:\"Business Settings\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:44;a:8:{s:1:\"a\";s:2:\"74\";s:1:\"b\";s:25:\"subscription plan add btn\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:25:\"subscription-plan-add-btn\";s:1:\"e\";s:17:\"Business Settings\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:45;a:8:{s:1:\"a\";s:2:\"75\";s:1:\"b\";s:26:\"subscription plan edit btn\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:26:\"subscription-plan-edit-btn\";s:1:\"e\";s:17:\"Business Settings\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:46;a:8:{s:1:\"a\";s:2:\"76\";s:1:\"b\";s:28:\"subscription plan delete btn\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:28:\"subscription-plan-delete-btn\";s:1:\"e\";s:17:\"Business Settings\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:47;a:8:{s:1:\"a\";s:2:\"77\";s:1:\"b\";s:22:\"customers list add btn\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:22:\"customers-list-add-btn\";s:1:\"e\";s:19:\"Customer Management\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:48;a:8:{s:1:\"a\";s:2:\"78\";s:1:\"b\";s:23:\"customers list edit btn\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:23:\"customers-list-edit-btn\";s:1:\"e\";s:19:\"Customer Management\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:49;a:8:{s:1:\"a\";s:2:\"79\";s:1:\"b\";s:25:\"customers list delete btn\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:25:\"customers-list-delete-btn\";s:1:\"e\";s:19:\"Customer Management\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:50;a:8:{s:1:\"a\";s:2:\"80\";s:1:\"b\";s:26:\"archieve list retrieve btn\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:26:\"archieve-list-retrieve-btn\";s:1:\"e\";s:19:\"Customer Management\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:51;a:8:{s:1:\"a\";s:2:\"82\";s:1:\"b\";s:18:\"admin user add btn\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:18:\"admin-user-add-btn\";s:1:\"e\";s:15:\"User Management\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:52;a:8:{s:1:\"a\";s:2:\"83\";s:1:\"b\";s:19:\"admin user edit btn\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:19:\"admin-user-edit-btn\";s:1:\"e\";s:15:\"User Management\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:53;a:8:{s:1:\"a\";s:2:\"84\";s:1:\"b\";s:21:\"admin user delete btn\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:21:\"admin-user-delete-btn\";s:1:\"e\";s:15:\"User Management\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:54;a:8:{s:1:\"a\";s:2:\"85\";s:1:\"b\";s:13:\"roles add btn\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:13:\"roles-add-btn\";s:1:\"e\";s:15:\"User Management\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:55;a:8:{s:1:\"a\";s:2:\"86\";s:1:\"b\";s:14:\"roles edit btn\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:14:\"roles-edit-btn\";s:1:\"e\";s:15:\"User Management\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:56;a:8:{s:1:\"a\";s:2:\"87\";s:1:\"b\";s:16:\"roles delete btn\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:16:\"roles-delete-btn\";s:1:\"e\";s:15:\"User Management\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:57;a:8:{s:1:\"a\";s:2:\"88\";s:1:\"b\";s:19:\"permissions add btn\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:19:\"permissions-add-btn\";s:1:\"e\";s:15:\"User Management\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:58;a:8:{s:1:\"a\";s:2:\"89\";s:1:\"b\";s:20:\"permissions edit btn\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:20:\"permissions-edit-btn\";s:1:\"e\";s:15:\"User Management\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:59;a:8:{s:1:\"a\";s:2:\"90\";s:1:\"b\";s:22:\"permissions delete btn\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:22:\"permissions-delete-btn\";s:1:\"e\";s:15:\"User Management\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:60;a:8:{s:1:\"a\";s:2:\"91\";s:1:\"b\";s:13:\"contact creed\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:13:\"contact-creed\";s:1:\"e\";N;s:1:\"f\";N;s:1:\"g\";s:1:\"4\";s:1:\"r\";a:1:{i:0;i:1;}}i:61;a:8:{s:1:\"a\";s:2:\"92\";s:1:\"b\";s:24:\"contact creed delete btn\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:24:\"contact-creed-delete-btn\";s:1:\"e\";s:13:\"contact creed\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:62;a:8:{s:1:\"a\";s:2:\"93\";s:1:\"b\";s:13:\"Business List\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:13:\"business-list\";s:1:\"e\";s:19:\"Customer Management\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:63;a:8:{s:1:\"a\";s:2:\"94\";s:1:\"b\";s:13:\"Business Note\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:13:\"business-note\";s:1:\"e\";N;s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:64;a:8:{s:1:\"a\";s:2:\"95\";s:1:\"b\";s:25:\"Apps Terms and Conditions\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:25:\"apps-terms-and-conditions\";s:1:\"e\";N;s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:65;a:8:{s:1:\"a\";s:2:\"96\";s:1:\"b\";s:16:\"Reviews List btn\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:16:\"reviews-list-btn\";s:1:\"e\";s:19:\"Customer Management\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:66;a:8:{s:1:\"a\";s:2:\"97\";s:1:\"b\";s:14:\"Privacy Policy\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:14:\"privacy-policy\";s:1:\"e\";N;s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:67;a:8:{s:1:\"a\";s:2:\"98\";s:1:\"b\";s:12:\"Pricing Plan\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:12:\"pricing-plan\";s:1:\"e\";N;s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:68;a:8:{s:1:\"a\";s:2:\"99\";s:1:\"b\";s:27:\"Add Listing Form Management\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:27:\"add-listing-form-management\";s:1:\"e\";s:17:\"Business Settings\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:69;a:8:{s:1:\"a\";s:3:\"100\";s:1:\"b\";s:27:\"Add Listing Form Delete btn\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:27:\"add-listing-form-delete-btn\";s:1:\"e\";s:17:\"Business Settings\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:70;a:8:{s:1:\"a\";s:3:\"101\";s:1:\"b\";s:20:\"Pricing Plan Add btn\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:20:\"pricing-plan-add-btn\";s:1:\"e\";s:12:\"Pricing Plan\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:71;a:8:{s:1:\"a\";s:3:\"102\";s:1:\"b\";s:21:\"Pricing Plan Edit btn\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:21:\"pricing-plan-edit-btn\";s:1:\"e\";s:12:\"Pricing Plan\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:72;a:8:{s:1:\"a\";s:3:\"103\";s:1:\"b\";s:23:\"Pricing Plan Delete btn\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:23:\"pricing-plan-delete-btn\";s:1:\"e\";s:12:\"Pricing Plan\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:73;a:8:{s:1:\"a\";s:3:\"104\";s:1:\"b\";s:19:\"Accounts Management\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:19:\"accounts-management\";s:1:\"e\";N;s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}i:74;a:8:{s:1:\"a\";s:3:\"105\";s:1:\"b\";s:6:\"Income\";s:1:\"c\";s:3:\"web\";s:1:\"d\";s:6:\"income\";s:1:\"e\";s:19:\"Accounts Management\";s:1:\"f\";N;s:1:\"g\";N;s:1:\"r\";a:1:{i:0;i:1;}}}s:5:\"roles\";a:1:{i:0;a:3:{s:1:\"a\";s:1:\"1\";s:1:\"b\";s:5:\"Admin\";s:1:\"c\";s:3:\"web\";}}}', 1757138547);

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(191) NOT NULL,
  `owner` varchar(191) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `remarks` mediumtext DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=Active, 0=Inactive',
  `created_by` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'Stores the ID of the user who created the record',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Stores the creation time of the record',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Stores the last update time of the record'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `remarks`, `status`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'Our Services', NULL, 1, 1, '2025-08-29 22:22:55', '2025-08-29 22:22:55'),
(2, 'Funded Packages', NULL, 1, 1, '2025-08-29 22:23:13', '2025-08-29 22:23:13');

-- --------------------------------------------------------

--
-- Table structure for table `commissions`
--

CREATE TABLE `commissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `commission_type` varchar(191) DEFAULT NULL,
  `percentage` bigint(20) UNSIGNED DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT 'Commission amount',
  `remarks` mediumtext DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=Active, 0=Inactive',
  `created_by` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'Stores the ID of the user who created the record',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Stores the creation time of the record',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Stores the last update time of the record'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(191) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(63, '2025_09_01_154706_create_commissions_table', 11);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
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

CREATE TABLE `notices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `remarks` mediumtext DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=Active, 0=Inactive',
  `created_by` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'Stores the ID of the user who created the record',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Stores the creation time of the record',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Stores the last update time of the record'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notices`
--

INSERT INTO `notices` (`id`, `remarks`, `status`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'ফান্ডিং অ্যাকাউন্ট সম্পর্কে আরও বিস্তারিত জানতে চাইলে আমাদের Telegram এ নক দিন। তবে মনে রাখবেন আবেদনকারীর বয়স অবশ্যই ন্যূনতম 16+ হতে হবে। আপনার ট্রেডিং একিউরেসি অন্তত 60%–70% হতে হবে। বাংলাদেশে ১০০% ট্রাস্টেড প্ল্যাটফর্ম – লোন, ফান্ডিং, ইনভেস্টমেন্ট ও টুর্নামেন্টের সব সুবিধা একসাথে।', 1, 1, '2025-08-30 02:05:50', '2025-08-30 11:02:21');

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'Foreign key referencing the id in the categories table',
  `price` varchar(11) DEFAULT NULL,
  `image` varchar(191) DEFAULT NULL,
  `remarks` mediumtext DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=Active, 0=Inactive',
  `created_by` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'Stores the ID of the user who created the record',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Stores the creation time of the record',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Stores the last update time of the record'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_reset_tokens`
--

INSERT INTO `password_reset_tokens` (`email`, `token`, `created_at`) VALUES
('nazimuddin11121@gmail.com', '$2y$12$WP7h1SXjzBnQ8WsomfAGteG3wV5V/Kv64XZMYf6Wp5L0DrnSmlQDW', '2025-09-05 00:46:57'),
('minhazul9090@gmail.com', '$2y$12$pIvl/PiavZ5WUlIHV.Wrt.1WSMD2U9WwBYQWDVzCJcA6w/FOG9ndG', '2025-09-04 23:59:33');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `guard_name` varchar(25) NOT NULL,
  `permission_key` varchar(191) DEFAULT NULL,
  `group_name` varchar(191) DEFAULT NULL,
  `description` mediumtext DEFAULT NULL,
  `priority_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `remarks` mediumtext DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=Active, 0=Inactive',
  `created_by` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'Stores the ID of the user who created the record',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Stores the creation time of the record',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Stores the last update time of the record'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `guard_name` varchar(25) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
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

CREATE TABLE `sessions` (
  `id` varchar(191) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `image` varchar(191) DEFAULT NULL,
  `remarks` mediumtext DEFAULT NULL,
  `hierarchy` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'Lower value means higher priority',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=Active, 0=Inactive',
  `created_by` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'Stores the ID of the user who created the record',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Stores the creation time of the record',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Stores the last update time of the record'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

CREATE TABLE `todo_lists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `buy_id` bigint(20) UNSIGNED NOT NULL,
  `rule_key` varchar(191) NOT NULL,
  `rule_value` varchar(191) NOT NULL,
  `remarks` mediumtext DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=Active, 0=Inactive',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Stores the creation time of the record',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Stores the last update time of the record'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_about_us`
--

CREATE TABLE `t_about_us` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `individual_title` varchar(191) NOT NULL,
  `business_title` varchar(191) NOT NULL,
  `individual_description` mediumtext NOT NULL,
  `business_description` mediumtext NOT NULL,
  `individual_tab_description` mediumtext NOT NULL,
  `business_tab_description` mediumtext NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=Active, 0=Inactive',
  `created_by` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'Admin user who created the record',
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'Admin user who last updated the record',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Stores the creation time of the record',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Stores the last update time of the record'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_admin_notes`
--

CREATE TABLE `t_admin_notes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `owner_info_page` varchar(191) DEFAULT NULL,
  `business_info_step_1` varchar(191) DEFAULT NULL,
  `business_info_step_2` varchar(191) DEFAULT NULL,
  `business_info_step_3` varchar(191) DEFAULT NULL,
  `business_info_step_4` varchar(191) DEFAULT NULL,
  `business_info_step_5` varchar(191) DEFAULT NULL,
  `business_info_step_6` varchar(191) DEFAULT NULL,
  `business_info_step_7` varchar(191) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=Active, 0=Inactive',
  `created_by` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'Admin user who created the record',
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'Admin user who last updated the record',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Stores the creation time of the record',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Stores the last update time of the record'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_admin_privacy_policies`
--

CREATE TABLE `t_admin_privacy_policies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) DEFAULT NULL,
  `description` mediumtext NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=Active, 0=Inactive',
  `created_by` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'Admin user who created the record',
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'Admin user who last updated the record',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Stores the creation time of the record',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Stores the last update time of the record'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_admin_users`
--

CREATE TABLE `t_admin_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(191) NOT NULL,
  `country_code` varchar(7) DEFAULT NULL,
  `phone_number` varchar(15) NOT NULL,
  `password` varchar(255) NOT NULL COMMENT 'Stores the user''s hashed password with minimum 8length',
  `address` mediumtext NOT NULL,
  `country` varchar(100) NOT NULL,
  `state` varchar(100) DEFAULT NULL,
  `city` varchar(100) NOT NULL,
  `zip_code` varchar(20) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1=Active, 0=Inactive',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Stores the creation time of the record',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Stores the last update time of the record'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `t_admin_users`
--

INSERT INTO `t_admin_users` (`id`, `name`, `email`, `country_code`, `phone_number`, `password`, `address`, `country`, `state`, `city`, `zip_code`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'sabbir@gmail.com', NULL, '01738305885', '$2y$12$rlZBu41ONvo8AWZvEgvHged1F5UbM.xbsjR7ViN5J3cxF3EMoZhWO', '12/12', 'Bangladesh', 'Dhaka', 'Dhaka', '1200', 0, '2025-01-10 23:47:09', '2025-08-30 00:48:18');

-- --------------------------------------------------------

--
-- Table structure for table `t_admin_versions`
--

CREATE TABLE `t_admin_versions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `version` varchar(191) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=Active, 0=Inactive',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Stores the creation time of the record',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Stores the last update time of the record',
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_app_terms_and_conditions`
--

CREATE TABLE `t_app_terms_and_conditions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `page_1_heading` varchar(191) DEFAULT NULL,
  `page_2_title` varchar(191) DEFAULT NULL,
  `page_2_heading` varchar(191) DEFAULT NULL,
  `page_2_description` mediumtext DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=Active, 0=Inactive',
  `created_by` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'Admin user who created the record',
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'Admin user who last updated the record',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Stores the creation time of the record',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Stores the last update time of the record'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_business_categories`
--

CREATE TABLE `t_business_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL COMMENT 'Restaurant, Law Firm',
  `description` mediumtext DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=Active, 0=Inactive',
  `created_by` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'Admin user who created the record',
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'Admin user who last updated the record',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Stores the creation time of the record',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Stores the last update time of the record'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_business_profile_visitors`
--

CREATE TABLE `t_business_profile_visitors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `device_id` varchar(191) DEFAULT NULL,
  `business_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=Active, 0=Inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_business_sub_categories`
--

CREATE TABLE `t_business_sub_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` varchar(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=Active, 0=Inactive',
  `created_by` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'Admin user who created the record',
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'Admin user who last updated the record',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Stores the creation time of the record',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Stores the last update time of the record'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_business_types`
--

CREATE TABLE `t_business_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL COMMENT 'Online Retail, Local Store, Service Business',
  `description` mediumtext DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=Active, 0=Inactive',
  `created_by` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'Admin user who created the record',
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'Admin user who last updated the record',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Stores the creation time of the record',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Stores the last update time of the record'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_checkout_text_data`
--

CREATE TABLE `t_checkout_text_data` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(60) NOT NULL,
  `short_description` mediumtext NOT NULL,
  `list` mediumtext NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=Active, 0=Inactive',
  `created_by` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'Admin user who created the record',
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'Admin user who last updated the record',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Stores the creation time of the record',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Stores the last update time of the record'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_company_infos`
--

CREATE TABLE `t_company_infos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `system_name` varchar(100) NOT NULL,
  `owner_name` varchar(100) NOT NULL,
  `email` varchar(191) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `business_identification_no` varchar(100) DEFAULT NULL,
  `address` mediumtext NOT NULL,
  `country_id` varchar(100) DEFAULT NULL,
  `state_id` varchar(100) DEFAULT NULL,
  `city_id` varchar(100) DEFAULT NULL,
  `zip_code` bigint(20) UNSIGNED DEFAULT NULL,
  `lat` decimal(10,7) DEFAULT NULL COMMENT 'address latitude',
  `long` decimal(10,7) DEFAULT NULL COMMENT 'address longitude',
  `logo` varchar(191) DEFAULT NULL,
  `favicon_icon` varchar(191) DEFAULT NULL,
  `website_link` varchar(191) DEFAULT NULL,
  `facebook_id` varchar(191) DEFAULT NULL,
  `linkedIn_id` varchar(191) DEFAULT NULL,
  `youtube_link` varchar(191) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=Active, 0=Inactive',
  `created_by` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'Admin user who created the record',
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'Admin user who last updated the record',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Stores the creation time of the record',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Stores the last update time of the record'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_dashboard_todo_lists`
--

CREATE TABLE `t_dashboard_todo_lists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `account_type` enum('personal','business') NOT NULL,
  `todo_title` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=Active, 0=Inactive',
  `checkbox_status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=Active, 0=Inactive',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Stores the creation time of the record',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Stores the last update time of the record'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_days`
--

CREATE TABLE `t_days` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(60) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=Active, 0=Inactive',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Stores the creation time of the record',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Stores the last update time of the record'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

CREATE TABLE `t_deposits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `binance_id` varchar(191) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT 0.00,
  `deposit_proof` varchar(191) DEFAULT NULL,
  `order_id` varchar(191) DEFAULT NULL,
  `payment_status` tinyint(4) NOT NULL DEFAULT 0,
  `remarks` mediumtext DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=Active, 0=Inactive',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Stores the creation time of the record',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Stores the last update time of the record'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_generic_codes`
--

CREATE TABLE `t_generic_codes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `source_table_name` varchar(191) NOT NULL,
  `field_name` varchar(20) NOT NULL,
  `description` mediumtext NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Stores the creation time of the record',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Stores the last update time of the record'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

CREATE TABLE `t_invests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `category_id` varchar(100) DEFAULT NULL,
  `package_id` varchar(100) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `order_id` varchar(100) DEFAULT NULL,
  `invest_proof` varchar(191) DEFAULT NULL,
  `investment_type` varchar(100) DEFAULT NULL,
  `payment_status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=Success, 0=Processing, 2=Failed',
  `binance_id` varchar(100) DEFAULT NULL,
  `remarks` mediumtext DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=Active, 0=Inactive',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Stores the creation time of the record',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Stores the last update time of the record'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_payments`
--

CREATE TABLE `t_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `business_id` bigint(20) UNSIGNED NOT NULL,
  `payment_method` varchar(100) DEFAULT NULL,
  `card_number` varchar(100) NOT NULL,
  `expire_date` varchar(100) NOT NULL,
  `cvc_number` bigint(20) UNSIGNED NOT NULL,
  `billing_address` mediumtext DEFAULT NULL,
  `subscription_plan_name` varchar(100) DEFAULT NULL,
  `payable_amount` double UNSIGNED NOT NULL DEFAULT 0,
  `paid_amount` double UNSIGNED NOT NULL DEFAULT 0,
  `currency` varchar(100) DEFAULT NULL,
  `trx_id` varchar(191) DEFAULT NULL,
  `expand` varchar(100) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1=Payment Successful, 0=Payment Failed',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Stores the creation time of the record',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Stores the last update time of the record',
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) DEFAULT NULL COMMENT 'name means fullname',
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `email` varchar(191) NOT NULL,
  `profile_photo` varchar(255) DEFAULT NULL,
  `country_code` varchar(7) DEFAULT NULL,
  `phone_number` varchar(15) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL COMMENT 'Stores the user''s hashed password with minimum 8length',
  `remember_token` varchar(100) DEFAULT NULL,
  `google_id` varchar(191) DEFAULT NULL,
  `avatar` varchar(191) DEFAULT NULL,
  `refer_code` varchar(100) DEFAULT NULL,
  `own_refer_code` varchar(100) DEFAULT NULL,
  `level` varchar(100) DEFAULT 'Level 1',
  `total_deposit_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `total_invest_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `total_withdraw_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `total_commission_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `address` mediumtext DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `zip_code` bigint(20) UNSIGNED DEFAULT NULL,
  `account_type` varchar(10) NOT NULL DEFAULT 'G' COMMENT 'G=General Account, GB=General+Business Account',
  `otp` varchar(191) DEFAULT NULL,
  `otp_expires_at` timestamp NULL DEFAULT NULL,
  `otp_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1=Used, 0=Unused',
  `save_business_list` varchar(191) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1=Active, 0=Inactive',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Stores the creation time of the record',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Stores the last update time of the record',
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_nid_images`
--

CREATE TABLE `user_nid_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `nid_image` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=Active, 0=Inactive',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Stores the creation time of the record',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Stores the last update time of the record'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `withdraws`
--

CREATE TABLE `withdraws` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `binance_id` varchar(100) DEFAULT NULL,
  `payment_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1=Paid, 0=Pending',
  `remarks` mediumtext DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=Active, 0=Inactive',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Stores the creation time of the record',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Stores the last update time of the record'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_log`
--
ALTER TABLE `activity_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subject` (`subject_type`,`subject_id`),
  ADD KEY `causer` (`causer_type`,`causer_id`),
  ADD KEY `activity_log_log_name_index` (`log_name`);

--
-- Indexes for table `buy_packages`
--
ALTER TABLE `buy_packages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `buy_packages_user_id_index` (`user_id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_created_by_foreign` (`created_by`);

--
-- Indexes for table `commissions`
--
ALTER TABLE `commissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `commissions_created_by_foreign` (`created_by`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `notices`
--
ALTER TABLE `notices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notices_created_by_foreign` (`created_by`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `packages_category_id_foreign` (`category_id`),
  ADD KEY `packages_created_by_foreign` (`created_by`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reviews_created_by_foreign` (`created_by`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sliders_created_by_foreign` (`created_by`);

--
-- Indexes for table `todo_lists`
--
ALTER TABLE `todo_lists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_about_us`
--
ALTER TABLE `t_about_us`
  ADD PRIMARY KEY (`id`),
  ADD KEY `t_about_us_created_by_foreign` (`created_by`),
  ADD KEY `t_about_us_updated_by_foreign` (`updated_by`);

--
-- Indexes for table `t_admin_notes`
--
ALTER TABLE `t_admin_notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `t_admin_notes_created_by_foreign` (`created_by`),
  ADD KEY `t_admin_notes_updated_by_foreign` (`updated_by`),
  ADD KEY `t_admin_notes_owner_info_page_index` (`owner_info_page`),
  ADD KEY `t_admin_notes_business_info_step_1_index` (`business_info_step_1`),
  ADD KEY `t_admin_notes_business_info_step_2_index` (`business_info_step_2`),
  ADD KEY `t_admin_notes_business_info_step_3_index` (`business_info_step_3`),
  ADD KEY `t_admin_notes_business_info_step_4_index` (`business_info_step_4`),
  ADD KEY `t_admin_notes_business_info_step_5_index` (`business_info_step_5`),
  ADD KEY `t_admin_notes_business_info_step_6_index` (`business_info_step_6`),
  ADD KEY `t_admin_notes_business_info_step_7_index` (`business_info_step_7`);

--
-- Indexes for table `t_admin_privacy_policies`
--
ALTER TABLE `t_admin_privacy_policies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `t_admin_privacy_policies_created_by_foreign` (`created_by`),
  ADD KEY `t_admin_privacy_policies_updated_by_foreign` (`updated_by`);

--
-- Indexes for table `t_admin_users`
--
ALTER TABLE `t_admin_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `t_admin_users_email_unique` (`email`),
  ADD UNIQUE KEY `t_admin_users_phone_number_unique` (`phone_number`),
  ADD KEY `t_admin_users_name_index` (`name`);

--
-- Indexes for table `t_admin_versions`
--
ALTER TABLE `t_admin_versions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `t_admin_versions_version_index` (`version`);

--
-- Indexes for table `t_app_terms_and_conditions`
--
ALTER TABLE `t_app_terms_and_conditions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `t_app_terms_and_conditions_created_by_foreign` (`created_by`),
  ADD KEY `t_app_terms_and_conditions_updated_by_foreign` (`updated_by`);

--
-- Indexes for table `t_business_categories`
--
ALTER TABLE `t_business_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `t_business_categories_created_by_foreign` (`created_by`),
  ADD KEY `t_business_categories_updated_by_foreign` (`updated_by`),
  ADD KEY `t_business_categories_name_index` (`name`);

--
-- Indexes for table `t_business_profile_visitors`
--
ALTER TABLE `t_business_profile_visitors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `t_business_profile_visitors_device_id_unique` (`device_id`),
  ADD KEY `t_business_profile_visitors_business_id_index` (`business_id`);

--
-- Indexes for table `t_business_sub_categories`
--
ALTER TABLE `t_business_sub_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `t_business_sub_categories_created_by_foreign` (`created_by`),
  ADD KEY `t_business_sub_categories_updated_by_foreign` (`updated_by`),
  ADD KEY `t_business_sub_categories_name_index` (`name`);

--
-- Indexes for table `t_business_types`
--
ALTER TABLE `t_business_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `t_business_types_created_by_foreign` (`created_by`),
  ADD KEY `t_business_types_updated_by_foreign` (`updated_by`),
  ADD KEY `t_business_types_name_index` (`name`);

--
-- Indexes for table `t_checkout_text_data`
--
ALTER TABLE `t_checkout_text_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `t_checkout_text_data_created_by_foreign` (`created_by`),
  ADD KEY `t_checkout_text_data_updated_by_foreign` (`updated_by`);

--
-- Indexes for table `t_company_infos`
--
ALTER TABLE `t_company_infos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `t_company_infos_email_unique` (`email`),
  ADD KEY `t_company_infos_created_by_foreign` (`created_by`),
  ADD KEY `t_company_infos_updated_by_foreign` (`updated_by`);

--
-- Indexes for table `t_dashboard_todo_lists`
--
ALTER TABLE `t_dashboard_todo_lists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_days`
--
ALTER TABLE `t_days`
  ADD PRIMARY KEY (`id`),
  ADD KEY `t_days_name_index` (`name`);

--
-- Indexes for table `t_deposits`
--
ALTER TABLE `t_deposits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `t_deposits_user_id_index` (`user_id`);

--
-- Indexes for table `t_generic_codes`
--
ALTER TABLE `t_generic_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_invests`
--
ALTER TABLE `t_invests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `t_invests_user_id_index` (`user_id`);

--
-- Indexes for table `t_payments`
--
ALTER TABLE `t_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `t_payments_business_id_index` (`business_id`),
  ADD KEY `t_payments_card_number_index` (`card_number`),
  ADD KEY `t_payments_expire_date_index` (`expire_date`),
  ADD KEY `t_payments_cvc_number_index` (`cvc_number`),
  ADD KEY `t_payments_subscription_plan_name_index` (`subscription_plan_name`),
  ADD KEY `t_payments_paid_amount_index` (`paid_amount`),
  ADD KEY `t_payments_trx_id_index` (`trx_id`),
  ADD KEY `t_payments_status_index` (`status`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_phone_number` (`phone_number`),
  ADD KEY `users_name_index` (`name`),
  ADD KEY `users_email_index` (`email`),
  ADD KEY `users_phone_number_index` (`phone_number`),
  ADD KEY `users_account_type_index` (`account_type`),
  ADD KEY `users_status_index` (`status`),
  ADD KEY `users_created_at_index` (`created_at`),
  ADD KEY `users_updated_at_index` (`updated_at`);

--
-- Indexes for table `user_nid_images`
--
ALTER TABLE `user_nid_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_nid_images_user_id_index` (`user_id`);

--
-- Indexes for table `withdraws`
--
ALTER TABLE `withdraws`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity_log`
--
ALTER TABLE `activity_log`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `buy_packages`
--
ALTER TABLE `buy_packages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `commissions`
--
ALTER TABLE `commissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `notices`
--
ALTER TABLE `notices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=218;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `todo_lists`
--
ALTER TABLE `todo_lists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `t_about_us`
--
ALTER TABLE `t_about_us`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `t_admin_notes`
--
ALTER TABLE `t_admin_notes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_admin_privacy_policies`
--
ALTER TABLE `t_admin_privacy_policies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_admin_users`
--
ALTER TABLE `t_admin_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `t_admin_versions`
--
ALTER TABLE `t_admin_versions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_app_terms_and_conditions`
--
ALTER TABLE `t_app_terms_and_conditions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `t_business_categories`
--
ALTER TABLE `t_business_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `t_business_profile_visitors`
--
ALTER TABLE `t_business_profile_visitors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_business_sub_categories`
--
ALTER TABLE `t_business_sub_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `t_business_types`
--
ALTER TABLE `t_business_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `t_checkout_text_data`
--
ALTER TABLE `t_checkout_text_data`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_company_infos`
--
ALTER TABLE `t_company_infos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_dashboard_todo_lists`
--
ALTER TABLE `t_dashboard_todo_lists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_days`
--
ALTER TABLE `t_days`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `t_deposits`
--
ALTER TABLE `t_deposits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_generic_codes`
--
ALTER TABLE `t_generic_codes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `t_invests`
--
ALTER TABLE `t_invests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_payments`
--
ALTER TABLE `t_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_nid_images`
--
ALTER TABLE `user_nid_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `withdraws`
--
ALTER TABLE `withdraws`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
