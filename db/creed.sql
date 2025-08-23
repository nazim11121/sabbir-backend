-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Aug 23, 2025 at 07:45 PM
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=MyISAM AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(50, '2025_08_23_045910_create_user_nid_images_table', 3);

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\Admin\\TAdminUser', 1);

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
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'role-list', 'web', '2025-01-10 23:47:09', '2025-01-10 23:47:09'),
(2, 'role-create', 'web', '2025-01-10 23:47:09', '2025-01-10 23:47:09'),
(3, 'role-edit', 'web', '2025-01-10 23:47:09', '2025-01-10 23:47:09'),
(4, 'role-delete', 'web', '2025-01-10 23:47:09', '2025-01-10 23:47:09'),
(5, 'admin-user-list', 'web', '2025-01-10 23:47:09', '2025-01-10 23:47:09'),
(6, 'admin-user-create', 'web', '2025-01-10 23:47:09', '2025-01-10 23:47:09'),
(7, 'admin-user-edit', 'web', '2025-01-10 23:47:09', '2025-01-10 23:47:09'),
(8, 'admin-user-delete', 'web', '2025-01-10 23:47:09', '2025-01-10 23:47:09');

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
) ENGINE=MyISAM AUTO_INCREMENT=94 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'App\\Models\\User', 8, 'manual-auth-token', 'fae2cc7dacdf9ae071c57fb280c2b559a24c1980b294729b87598dee194a7c39', '[\"*\"]', '2025-01-11 00:42:52', NULL, '2025-01-11 00:25:42', '2025-01-11 00:42:52', '2025-08-23 06:13:49'),
(2, 'App\\Models\\User', 9, 'manual-auth-token', '4c11c3b99aa92fd141d76d9d25363bc5c1a5df6f334cc0dff9de0d41370ed49f', '[\"*\"]', '2025-01-11 00:46:31', NULL, '2025-01-11 00:45:08', '2025-01-11 00:46:31', '2025-08-23 06:13:49'),
(3, 'App\\Models\\User', 10, 'manual-auth-token', '662f146c6ca01e03cf07e2c282aa81bc43065447755bac76ef2e4bd3753fbd64', '[\"*\"]', NULL, NULL, '2025-01-11 01:20:03', '2025-01-11 01:20:03', '2025-08-23 06:13:49'),
(4, 'App\\Models\\User', 11, 'manual-auth-token', '8a50656e2518bfd3c2c1213a96853762d2121535baab4963cc01f88f904e473c', '[\"*\"]', NULL, NULL, '2025-01-11 01:26:36', '2025-01-11 01:26:36', '2025-08-23 06:13:49'),
(5, 'App\\Models\\User', 12, 'manual-auth-token', '8c38280f7b322eb21e2ecee2fa0c9069d508aaa8f73c9bd9bb645993c66da682', '[\"*\"]', NULL, NULL, '2025-01-11 01:30:19', '2025-01-11 01:30:19', '2025-08-23 06:13:49'),
(6, 'App\\Models\\User', 15, 'manual-auth-token', 'ca971fc5251d7fc0057ad08594a3042aed9678e39a99ffdb0bd72f133e8d7992', '[\"*\"]', NULL, NULL, '2025-01-11 06:07:05', '2025-01-11 06:07:05', '2025-08-23 06:13:49'),
(7, 'App\\Models\\User', 16, 'manual-auth-token', '79404ae37bb266a875ddb524a2ec061fd8fd562258857657d8cbb6c1fc409844', '[\"*\"]', NULL, NULL, '2025-01-11 06:08:19', '2025-01-11 06:08:19', '2025-08-23 06:13:49'),
(8, 'App\\Models\\User', 17, 'manual-auth-token', '59558abd0efaf917e0676b3532cacff28c9b57f0d3315abdf0bc3dc77c97831d', '[\"*\"]', NULL, NULL, '2025-01-11 06:14:33', '2025-01-11 06:14:33', '2025-08-23 06:13:49'),
(9, 'App\\Models\\User', 17, 'API Token', '11574585979f0095e50fddc44420bbcc5872c49d45361d102d12a449568fdca5', '[\"*\"]', '2025-01-11 07:04:00', NULL, '2025-01-11 06:49:38', '2025-01-11 07:04:00', '2025-08-23 06:13:49'),
(10, 'App\\Models\\User', 17, 'API Token', 'b7847649dcc7025a59bf32a58c0cd8930ac8147c9491b7c35f5e1624f757e070', '[\"*\"]', '2025-01-11 09:14:28', NULL, '2025-01-11 07:05:15', '2025-01-11 09:14:28', '2025-08-23 06:13:49'),
(11, 'App\\Models\\User', 18, 'API Token', '0a31f9ea9ea62debea1f7040c0453e3c118e74bbd6ec7d07f1b016ef6a64a350', '[\"*\"]', NULL, NULL, '2025-08-23 00:14:14', '2025-08-23 00:14:14', '2025-08-23 06:14:14'),
(12, 'App\\Models\\User', 18, 'API Token', '6d24688bc54b52df70f047c4e9e466f3f01955ae1556e959613e5061ed292028', '[\"*\"]', NULL, NULL, '2025-08-23 00:14:29', '2025-08-23 00:14:29', '2025-08-23 06:14:29'),
(13, 'App\\Models\\User', 18, 'API Token', '419cf0072d27ec002e1e55f1c4af180b4f83433dc05d021c2767c33442152c7c', '[\"*\"]', NULL, NULL, '2025-08-23 00:15:18', '2025-08-23 00:15:18', '2025-08-23 06:15:18'),
(14, 'App\\Models\\User', 18, 'API Token', '2045d580763efbc1e959523a02992b35e59d7a4120ae65109ba1e1125e2b56d6', '[\"*\"]', NULL, NULL, '2025-08-23 00:15:47', '2025-08-23 00:15:47', '2025-08-23 06:15:47'),
(15, 'App\\Models\\User', 18, 'API Token', '2fa5276a1f240bf9bc1ac04895748d81bf454f11b4887e288b3b1ef670a11fec', '[\"*\"]', NULL, NULL, '2025-08-23 00:16:16', '2025-08-23 00:16:16', '2025-08-23 06:16:16'),
(16, 'App\\Models\\User', 18, 'API Token', 'e0c7ff1ca92ad71af4212a317034ae0014385e19d9f845d8098c008eefc89792', '[\"*\"]', NULL, NULL, '2025-08-23 00:16:55', '2025-08-23 00:16:55', '2025-08-23 06:16:55'),
(17, 'App\\Models\\User', 18, 'API Token', 'd0aa846c4ce104bc296589df6773f64683289be2043ee13a90ec287fdefd1819', '[\"*\"]', NULL, NULL, '2025-08-23 00:18:10', '2025-08-23 00:18:10', '2025-08-23 06:18:10'),
(18, 'App\\Models\\User', 18, 'API Token', '8d9de202c8ea4aee8940ff99e0aef73cbc03e3cb451f730414a397c18b9cdb84', '[\"*\"]', NULL, NULL, '2025-08-23 00:26:36', '2025-08-23 00:26:36', '2025-08-23 06:26:36'),
(19, 'App\\Models\\User', 18, 'API Token', '2fc03f5ecd3c9cd8d6f1b02fb13280be49565f0752f2f4ee9c413e6b9ba6b179', '[\"*\"]', NULL, NULL, '2025-08-23 00:27:54', '2025-08-23 00:27:54', '2025-08-23 06:27:54'),
(20, 'App\\Models\\User', 18, 'API Token', 'd34dfad2ddf8a47b0976f8d0938b1b0e8b4018354f0c5fa81b5dc539129bc145', '[\"*\"]', NULL, NULL, '2025-08-23 00:30:30', '2025-08-23 00:30:30', '2025-08-23 06:30:30'),
(21, 'App\\Models\\User', 18, 'API Token', '8dc197ef0d6b0b088457c8b27d1335072d52e8c3155821bb0676de590bc9510a', '[\"*\"]', NULL, NULL, '2025-08-23 00:31:29', '2025-08-23 00:31:29', '2025-08-23 06:31:29'),
(22, 'App\\Models\\User', 18, 'API Token', 'b26766d95b78a75f5ab30946af90fb5cd0c43290d92495e1e18e9d7c2680dba4', '[\"*\"]', NULL, NULL, '2025-08-23 00:33:22', '2025-08-23 00:33:22', '2025-08-23 06:33:22'),
(23, 'App\\Models\\User', 18, 'API Token', 'f3e84e87cdf822023a19abd43cf4e783b0a71361d2b4d16b988dc11799550a49', '[\"*\"]', NULL, NULL, '2025-08-23 00:34:02', '2025-08-23 00:34:02', '2025-08-23 06:34:02'),
(24, 'App\\Models\\User', 18, 'API Token', '69312cb32167bb953592ac0c95111aba0366efb9d98762a10cc265200846b5d4', '[\"*\"]', NULL, NULL, '2025-08-23 00:34:41', '2025-08-23 00:34:41', '2025-08-23 06:34:41'),
(25, 'App\\Models\\User', 18, 'API Token', 'ff36ffb6b97a2491c70bd99fa040cf1ecbddced379e605f70e9a006833dbdedb', '[\"*\"]', NULL, NULL, '2025-08-23 00:35:09', '2025-08-23 00:35:09', '2025-08-23 06:35:09'),
(26, 'App\\Models\\User', 18, 'API Token', 'ddc9aedd7fe2ec5e6da8b3b3bfaf41f5cdf57f7d75b4afb3db06c4c4bc1077fd', '[\"*\"]', NULL, NULL, '2025-08-23 00:37:52', '2025-08-23 00:37:52', '2025-08-23 06:37:52'),
(27, 'App\\Models\\User', 18, 'API Token', '2f98c8f384ffc1988bd8640b39cd2faf528a39c3882cca53ac4e1ba2c35954a7', '[\"*\"]', NULL, NULL, '2025-08-23 00:38:25', '2025-08-23 00:38:25', '2025-08-23 06:38:25'),
(28, 'App\\Models\\User', 18, 'API Token', 'b0b3145b3bf23eb812f2f16e7d5a7e4cb4d223ecf41ce18cc244a3e605188f23', '[\"*\"]', NULL, NULL, '2025-08-23 00:39:35', '2025-08-23 00:39:35', '2025-08-23 06:39:35'),
(29, 'App\\Models\\User', 18, 'API Token', '7fda9d7e926355e203b460aa7c65b476c48b6e6828d10a5d40799656fa640ab1', '[\"*\"]', NULL, NULL, '2025-08-23 00:40:45', '2025-08-23 00:40:45', '2025-08-23 06:40:45'),
(30, 'App\\Models\\User', 18, 'API Token', '35b6f1ab74f35b8779af7e1e9aa0df33b44d5bd3814038b2ab0820983717b15b', '[\"*\"]', NULL, NULL, '2025-08-23 00:41:52', '2025-08-23 00:41:52', '2025-08-23 06:41:52'),
(31, 'App\\Models\\User', 18, 'API Token', '5659ececb37fff284537d04868765c409818cc8e8992b1142c40a6ec028b9b7b', '[\"*\"]', NULL, NULL, '2025-08-23 00:44:59', '2025-08-23 00:44:59', '2025-08-23 06:44:59'),
(32, 'App\\Models\\User', 18, 'API Token', '7faabe60d3d084c11165df09fd64910ead1570ca03296599f3b4b7bf557f242e', '[\"*\"]', NULL, NULL, '2025-08-23 00:46:40', '2025-08-23 00:46:40', '2025-08-23 06:46:40'),
(33, 'App\\Models\\User', 18, 'API Token', 'a8f896154db41cb706eaae861b3cf8af038e27f3d81b1371f41479377ba15bfe', '[\"*\"]', NULL, NULL, '2025-08-23 00:51:17', '2025-08-23 00:51:17', '2025-08-23 06:51:17'),
(34, 'App\\Models\\User', 18, 'API Token', 'c72ddf01860e02ccf0bf07da7f2009284f61e8025c4880831a42b0212548b23a', '[\"*\"]', NULL, NULL, '2025-08-23 00:52:34', '2025-08-23 00:52:34', '2025-08-23 06:52:34'),
(35, 'App\\Models\\User', 18, 'API Token', 'e0e5eff777bfbec0d05e000c0473c6f41e6473f5ef18d08a32a18a7a613a3bea', '[\"*\"]', NULL, NULL, '2025-08-23 00:52:56', '2025-08-23 00:52:56', '2025-08-23 06:52:56'),
(36, 'App\\Models\\User', 18, 'API Token', '6a37d6a56ec8c4ab3e41b4f1a107d16977d36e5eaab9374606d4b4bed45fe9b1', '[\"*\"]', NULL, NULL, '2025-08-23 00:53:06', '2025-08-23 00:53:06', '2025-08-23 06:53:06'),
(37, 'App\\Models\\User', 18, 'API Token', '5d5d6de5038d9735209c3c880ec4657b7d91500587e8ca4ce2aaa2155825e307', '[\"*\"]', NULL, NULL, '2025-08-23 00:53:12', '2025-08-23 00:53:12', '2025-08-23 06:53:12'),
(38, 'App\\Models\\User', 18, 'API Token', 'a3ea8dbb6564a4c489d56f9d695780e4062074a29174c7185dd3643a7be3f7c4', '[\"*\"]', NULL, NULL, '2025-08-23 00:54:51', '2025-08-23 00:54:51', '2025-08-23 06:54:51'),
(39, 'App\\Models\\User', 18, 'API Token', '1f1d76907e22b8b28b886cca6368fa786dec9f1f43913b59a1f437c5fb21f41a', '[\"*\"]', NULL, NULL, '2025-08-23 00:55:25', '2025-08-23 00:55:25', '2025-08-23 06:55:25'),
(40, 'App\\Models\\User', 18, 'API Token', 'de2ab0f52433a25c01223d2875b7b0496782879b46c79b952a4bda2294a2f2d1', '[\"*\"]', NULL, NULL, '2025-08-23 00:56:33', '2025-08-23 00:56:33', '2025-08-23 06:56:33'),
(41, 'App\\Models\\User', 18, 'API Token', '2008b974f0380623d6f90088825621bfb5d22cde48534f7f5def3c47dc5b377a', '[\"*\"]', NULL, NULL, '2025-08-23 00:58:00', '2025-08-23 00:58:00', '2025-08-23 06:58:00'),
(42, 'App\\Models\\User', 18, 'API Token', '80c44cce119db03d9fa1a8d4c8dfac16d73c906c51dead160d08cb4cd1d5708a', '[\"*\"]', NULL, NULL, '2025-08-23 00:58:47', '2025-08-23 00:58:47', '2025-08-23 06:58:47'),
(43, 'App\\Models\\User', 18, 'API Token', '7ed6ff7c39109d791151ccec3e8ecb6aa7584d9416f1c6f6cda5c9009ce95e4f', '[\"*\"]', NULL, NULL, '2025-08-23 01:03:26', '2025-08-23 01:03:26', '2025-08-23 07:03:26'),
(44, 'App\\Models\\User', 18, 'API Token', '3978ec28585cfbff43406889e5781a63e32b8228e1e5fba67d587851aa2bd7ba', '[\"*\"]', NULL, NULL, '2025-08-23 01:05:29', '2025-08-23 01:05:29', '2025-08-23 07:05:29'),
(45, 'App\\Models\\User', 18, 'API Token', '4d1b9e24dbcc09a3b608781bd2c5746ed4a72962528fa3e828e69c7ddbb9d961', '[\"*\"]', NULL, NULL, '2025-08-23 01:07:18', '2025-08-23 01:07:18', '2025-08-23 07:07:18'),
(46, 'App\\Models\\User', 18, 'API Token', '64954f7b2bd5872bd04dd2c257666c579f090a0303050fe1b3f884f8dc9174ea', '[\"*\"]', NULL, NULL, '2025-08-23 01:07:26', '2025-08-23 01:07:26', '2025-08-23 07:07:26'),
(47, 'App\\Models\\User', 18, 'API Token', 'da301ff2aef2960afc44a49130207a59f8de2cb77c6426db3370a090fbe7f8de', '[\"*\"]', NULL, NULL, '2025-08-23 01:18:09', '2025-08-23 01:18:09', '2025-08-23 07:18:09'),
(48, 'App\\Models\\User', 18, 'API Token', '8c60248d8ae4b6f1f68de5a2b8714a91d63dadf6e8e7f9d127010529fe62b008', '[\"*\"]', NULL, NULL, '2025-08-23 01:18:59', '2025-08-23 01:18:59', '2025-08-23 07:18:59'),
(49, 'App\\Models\\User', 18, 'API Token', '24b59fa45f91740f8a9b96d870f46895fbdd7fd3b51b9f962d78ea1fe307c3dd', '[\"*\"]', NULL, NULL, '2025-08-23 01:19:48', '2025-08-23 01:19:48', '2025-08-23 07:19:48'),
(50, 'App\\Models\\User', 18, 'API Token', '58aef2ddf3be60ef8ce1e2a7f35f00f373b84f09f78cb3131a3fd8913a4e0567', '[\"*\"]', NULL, NULL, '2025-08-23 01:20:37', '2025-08-23 01:20:37', '2025-08-23 07:20:37'),
(51, 'App\\Models\\User', 18, 'API Token', '4d6af9cc1eeca84acd0824a7bac855fda37efe372e4d8ccbe154cb9f6fcd6a24', '[\"*\"]', NULL, NULL, '2025-08-23 01:22:22', '2025-08-23 01:22:22', '2025-08-23 07:22:22'),
(52, 'App\\Models\\User', 18, 'API Token', '3d2fd2b5ffcdf29ee18ca8d5167ac74d7e1a262884999fe5f0892df290387a47', '[\"*\"]', NULL, NULL, '2025-08-23 01:24:02', '2025-08-23 01:24:02', '2025-08-23 07:24:02'),
(53, 'App\\Models\\User', 18, 'API Token', 'c0ff38401745dbf4cbbab5f280997e76d974c7c2a9d0d9bd8319062492e90bab', '[\"*\"]', NULL, NULL, '2025-08-23 01:27:55', '2025-08-23 01:27:55', '2025-08-23 07:27:55'),
(54, 'App\\Models\\User', 18, 'API Token', 'e21ef62def6e1bf2bd64ab6be83f69f3f0f4eb543ad424733d0288298e05eb1a', '[\"*\"]', NULL, NULL, '2025-08-23 01:28:23', '2025-08-23 01:28:23', '2025-08-23 07:28:23'),
(55, 'App\\Models\\User', 18, 'API Token', 'e3676fd4dc6cb51b40bfc8e02e13438c6159d4f4acf7d49864a7dd2a61b8ba75', '[\"*\"]', NULL, NULL, '2025-08-23 01:29:41', '2025-08-23 01:29:41', '2025-08-23 07:29:41'),
(56, 'App\\Models\\User', 18, 'API Token', '8a68883e2620bd751d8671412fea8237f5f3a7e0ed0ebb7e7a1a4696954a05d2', '[\"*\"]', NULL, NULL, '2025-08-23 01:30:13', '2025-08-23 01:30:13', '2025-08-23 07:30:13'),
(57, 'App\\Models\\User', 18, 'API Token', 'fd19a4631d85be91af8bc59548e27b8246adb2a9a36e8aaa98489e7414824e39', '[\"*\"]', NULL, NULL, '2025-08-23 01:30:44', '2025-08-23 01:30:44', '2025-08-23 07:30:44'),
(58, 'App\\Models\\User', 18, 'API Token', '18a128a792ac5fdd6a7ae814831578645f35ded6783ca3fd7abfe8d01b199ebf', '[\"*\"]', NULL, NULL, '2025-08-23 01:31:23', '2025-08-23 01:31:23', '2025-08-23 07:31:23'),
(59, 'App\\Models\\User', 18, 'API Token', '39c2c1d0894430d7af757f4b560274e8cb0d1f8a2c6e5eef2e9a20a7343f01e1', '[\"*\"]', NULL, NULL, '2025-08-23 01:33:16', '2025-08-23 01:33:16', '2025-08-23 07:33:16'),
(60, 'App\\Models\\User', 18, 'API Token', '2a8556aadb05feba782f1624f99d2976a1da9be3a27f963bf499b286337237d5', '[\"*\"]', NULL, NULL, '2025-08-23 01:34:22', '2025-08-23 01:34:22', '2025-08-23 07:34:22'),
(61, 'App\\Models\\User', 18, 'API Token', '792d6491c9b10c37cfe9e74950eba020cbde6d72a31b5f9f4c8eb9e314d1aa2e', '[\"*\"]', NULL, NULL, '2025-08-23 01:34:51', '2025-08-23 01:34:51', '2025-08-23 07:34:51'),
(62, 'App\\Models\\User', 18, 'API Token', '689a6ddef1747f2b8c72f533e8d3a00793ca54f95927c9a9f9d4f736afa93608', '[\"*\"]', NULL, NULL, '2025-08-23 01:35:16', '2025-08-23 01:35:16', '2025-08-23 07:35:16'),
(63, 'App\\Models\\User', 18, 'API Token', 'c316c5677ec679b935995bd55b068859958fe3366c2c9d0ffdd84085f728bf04', '[\"*\"]', NULL, NULL, '2025-08-23 01:53:02', '2025-08-23 01:53:02', '2025-08-23 07:53:02'),
(64, 'App\\Models\\User', 18, 'API Token', '11fa289025e00ef61f9d1e169225af17e162810bbc5d154d947d541727e1795a', '[\"*\"]', NULL, NULL, '2025-08-23 01:58:32', '2025-08-23 01:58:32', '2025-08-23 07:58:32'),
(65, 'App\\Models\\User', 18, 'API Token', 'dc0878886f026def51ac75685f0e2d11c78694ac52458f8d549a62adcaaa3c79', '[\"*\"]', NULL, NULL, '2025-08-23 01:58:36', '2025-08-23 01:58:36', '2025-08-23 07:58:36'),
(66, 'App\\Models\\User', 18, 'API Token', '44e90ec6be7ebb2f08c15faa3bd4bad07e350520efd28cb4da5261a84c9e2f55', '[\"*\"]', NULL, NULL, '2025-08-23 01:59:26', '2025-08-23 01:59:26', '2025-08-23 07:59:26'),
(67, 'App\\Models\\User', 18, 'API Token', 'b5bbd1bc5b80cc1fb14ca20003c32f5aec8dabc2df545ae991aa2d7dcec4d8a6', '[\"*\"]', NULL, NULL, '2025-08-23 05:57:12', '2025-08-23 05:57:12', '2025-08-23 11:57:12'),
(68, 'App\\Models\\User', 18, 'API Token', 'a2b3ff3c2cb0cc370258a0d756b5a8aa9d97d71e3ad116708441e18b610a0b37', '[\"*\"]', NULL, NULL, '2025-08-23 06:10:37', '2025-08-23 06:10:37', '2025-08-23 12:10:37'),
(69, 'App\\Models\\User', 18, 'API Token', '59849570eb412e87913761fea08271edab3096680c5ccfbc38a5ce61f386b00b', '[\"*\"]', NULL, NULL, '2025-08-23 06:10:59', '2025-08-23 06:10:59', '2025-08-23 12:10:59'),
(70, 'App\\Models\\User', 18, 'API Token', '9de715a14119ac21d26a5ff93808238035f4d3eda62cb62c2325a364dfe8a8ea', '[\"*\"]', NULL, NULL, '2025-08-23 06:11:50', '2025-08-23 06:11:50', '2025-08-23 12:11:50'),
(71, 'App\\Models\\User', 18, 'API Token', '6690d5627231fe156f43fa4e18dbe8fbc812b5a48eaabfc56216621a78ddddfb', '[\"*\"]', NULL, NULL, '2025-08-23 06:28:38', '2025-08-23 06:28:38', '2025-08-23 12:28:38'),
(72, 'App\\Models\\User', 18, 'API Token', '1dac52cb6e3daf906b1413ddddb0be501fbfa53b19c16b4c9d549523db9b84e5', '[\"*\"]', NULL, NULL, '2025-08-23 06:29:51', '2025-08-23 06:29:51', '2025-08-23 12:29:51'),
(73, 'App\\Models\\User', 18, 'API Token', 'bc113edf77abc97acdece8e384f14b2af17c95bfe99bd45a57177230db9e300d', '[\"*\"]', NULL, NULL, '2025-08-23 06:36:53', '2025-08-23 06:36:53', '2025-08-23 12:36:53'),
(74, 'App\\Models\\User', 18, 'API Token', 'bf599de344583456d2a7653cf69c05ae0e1b5c82bf6472d97a5c5ee8ff3f2dc1', '[\"*\"]', NULL, NULL, '2025-08-23 06:36:59', '2025-08-23 06:36:59', '2025-08-23 12:36:59'),
(75, 'App\\Models\\User', 18, 'API Token', 'ba33ac4f4726d51275a0a8cbbe517f1c55c1ce5705a556cc416e8a62d809f8e5', '[\"*\"]', NULL, NULL, '2025-08-23 06:56:16', '2025-08-23 06:56:16', '2025-08-23 12:56:16'),
(76, 'App\\Models\\User', 18, 'API Token', 'aeb7f1ed78e94f63781b2830c4943c994dd01dcd63187133b8335a59dd498e0e', '[\"*\"]', NULL, NULL, '2025-08-23 06:56:49', '2025-08-23 06:56:49', '2025-08-23 12:56:49'),
(77, 'App\\Models\\User', 18, 'API Token', '8b44c21ef1c3ea5ce61107de622b12291d7a3612eb5338452c9c6abb4a795589', '[\"*\"]', NULL, NULL, '2025-08-23 06:57:35', '2025-08-23 06:57:35', '2025-08-23 12:57:35'),
(78, 'App\\Models\\User', 18, 'API Token', '8188535ddb4612dda053d7c4eff91a5b0c7b00689f438ebc5a5efe6747e4beb8', '[\"*\"]', NULL, NULL, '2025-08-23 07:00:18', '2025-08-23 07:00:18', '2025-08-23 13:00:18'),
(79, 'App\\Models\\User', 18, 'API Token', '43cd4da3aad58cb9a840a19e009fe3129bec7646fbedf3668b68cf0ccae6881f', '[\"*\"]', NULL, NULL, '2025-08-23 07:14:01', '2025-08-23 07:14:01', '2025-08-23 13:14:01'),
(80, 'App\\Models\\User', 18, 'API Token', 'cb6c77b9e7855bdae0e2cfe40692e6317a04c7623b30de97ecc3b557442071fb', '[\"*\"]', NULL, NULL, '2025-08-23 07:14:10', '2025-08-23 07:14:10', '2025-08-23 13:14:10'),
(81, 'App\\Models\\User', 18, 'API Token', '4dd153b6b02b852b48ec608ceea732d2ffede249593cd668c52b6ddb121b6456', '[\"*\"]', NULL, NULL, '2025-08-23 07:15:16', '2025-08-23 07:15:16', '2025-08-23 13:15:16'),
(82, 'App\\Models\\User', 18, 'API Token', 'f2f8f1a2081c47df99c5b8241f0493a015109d9a94f75d62007b4cc09134b193', '[\"*\"]', NULL, NULL, '2025-08-23 07:15:28', '2025-08-23 07:15:28', '2025-08-23 13:15:28'),
(83, 'App\\Models\\User', 18, 'API Token', '79a2e82a9c6fab432369a185eae8cbcac5d0c05aa8855d3ef64fb2791dee01a2', '[\"*\"]', NULL, NULL, '2025-08-23 07:16:31', '2025-08-23 07:16:31', '2025-08-23 13:16:31'),
(84, 'App\\Models\\User', 18, 'API Token', 'fd6ddc5435d20cfaa8bfee13d9d1d9297f61728289753d0aa7a22e8e86c07de7', '[\"*\"]', NULL, NULL, '2025-08-23 07:17:35', '2025-08-23 07:17:35', '2025-08-23 13:17:35'),
(85, 'App\\Models\\User', 18, 'API Token', 'ed7c63e09075ca563b04d0557675019bcb4b2df240857ebfe93bb590d4c80bfc', '[\"*\"]', NULL, NULL, '2025-08-23 07:19:05', '2025-08-23 07:19:05', '2025-08-23 13:19:05'),
(86, 'App\\Models\\User', 18, 'API Token', '1e8f1bd4b65017aeb21a4c239fb60031319e617e456443112e4772101bdbe126', '[\"*\"]', NULL, NULL, '2025-08-23 07:21:15', '2025-08-23 07:21:15', '2025-08-23 13:21:15'),
(87, 'App\\Models\\User', 18, 'API Token', 'aa3b51e7949e3431161885e135c6b49c1f44d39a516920f3b539bf8a02ac3653', '[\"*\"]', NULL, NULL, '2025-08-23 07:23:32', '2025-08-23 07:23:32', '2025-08-23 13:23:32'),
(88, 'App\\Models\\User', 18, 'API Token', 'f9c28da09114b5ddf526801e32a39ccdce8fbcdbeb8b69e47308a89cc2793f47', '[\"*\"]', NULL, NULL, '2025-08-23 07:27:07', '2025-08-23 07:27:07', '2025-08-23 13:27:07'),
(89, 'App\\Models\\User', 19, 'API Token', '94ad1d6407f589362bfae0cb0afc9409e8ecc861648af20d15a26461b8ed39eb', '[\"*\"]', NULL, NULL, '2025-08-23 07:30:33', '2025-08-23 07:30:33', '2025-08-23 13:30:33'),
(90, 'App\\Models\\User', 19, 'API Token', '98bf152a1afc8d37d6d7e8f5b9dedbc0df17194914981cc657374323303ffad8', '[\"*\"]', NULL, NULL, '2025-08-23 12:31:32', '2025-08-23 12:31:32', '2025-08-23 18:31:32'),
(91, 'App\\Models\\User', 19, 'API Token', '133079f8a6194a1d3584f186fee8bcbda981265f96b2a9722d2269067f919b55', '[\"*\"]', NULL, NULL, '2025-08-23 12:49:21', '2025-08-23 12:49:21', '2025-08-23 18:49:21'),
(92, 'App\\Models\\User', 19, 'API Token', '43f8d803c9c49c54f5ddb2abe326c33e0f945cf30b4b01a2696d39f2ca700369', '[\"*\"]', NULL, NULL, '2025-08-23 12:52:16', '2025-08-23 12:52:16', '2025-08-23 18:52:16'),
(93, 'App\\Models\\User', 19, 'API Token', 'eea1fc41437abbb9d75f913f1c53eae2009141b46c345c0c4160ea3eae9fe82c', '[\"*\"]', NULL, NULL, '2025-08-23 12:59:45', '2025-08-23 12:59:45', '2025-08-23 18:59:45');

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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'web', '2025-01-10 23:47:09', '2025-01-10 23:47:09');

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1);

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

--
-- Dumping data for table `t_about_us`
--

INSERT INTO `t_about_us` (`id`, `individual_title`, `business_title`, `individual_description`, `business_description`, `individual_tab_description`, `business_tab_description`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'CREED is a Commerce Platform & Global Business Directory Serving The Muslim Community', 'CREED is a Global Business Directory Serving the Muslim Community', '{\"0\":\"Our mission is to:\",\"list\":{\"0\":\"1.Connect Businesses to Muslims (B2C and B2B)\",\"sublist\":[\"a.Business to Consumer - Connect   with your customer and grow your business!\",\"b.Business to Business - Connect to our CREED B2B Ecosystem\"],\"1\":\"2.Engage, empower, and serve the ummah.\"},\"1\":\"Simply put, If you are a Muslim owned, Muslim operated, or a business that has a specific offering for the Muslim community, your business should be on CREED\"}', '{\"0\":\"Our mission is to:\",\"list\":{\"0\":\"1.Connect Muslims to Businesses that are serving them\",\"sublist\":[\"a. Business to Consumer - Connect with your customer and grow your business!\",\"b. Business to Business - Connect to our CREED B2B Ecosystem! (coming soon)\"],\"1\":\"2.Engage, empower, and serve the ummah.\"},\"1\":\"Simply put, If you are a business that has a specific offering for the Muslim community, your business should be on CREED, Global Business Directory Serving The Muslim Community.\"}', '[\"For Consumers (tab)\",\"1.Search businesses that are serving the Muslim community.\",\"2.Filter based on your CREED preferences (CREED Tags).\",\"3.Find the perfect business that matches your CREED and meets your needs.\"]', '[\"1.List your business\\/organization on CREED!\",\"2.Share, Create Promos, Marketing Campaigns and Grow Your Business!\",\"3.Gain business insights on your personalized business portal, where you can:\",\"4.Gain valuable customer, market, and business insight metrics\",\"5.Receive tips and tricks on how to grow your business\",\"6.Manage your business listing to help reach your target audience\",\"7.Connect with other businesses within your industry (B2B Ecosystem coming soon)\"]', 1, 1, NULL, '2025-01-11 05:47:09', '2025-01-11 05:47:09');

-- --------------------------------------------------------

--
-- Table structure for table `t_admin_add_listing_form_management`
--

DROP TABLE IF EXISTS `t_admin_add_listing_form_management`;
CREATE TABLE IF NOT EXISTS `t_admin_add_listing_form_management` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `field_category` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `field_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `field_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=Enabled, 0=Disabled',
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=Active, 0=Inactive',
  `created_by` bigint UNSIGNED DEFAULT NULL COMMENT 'Admin user who created the record',
  `updated_by` bigint UNSIGNED DEFAULT NULL COMMENT 'Admin user who last updated the record',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Stores the creation time of the record',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Stores the last update time of the record',
  PRIMARY KEY (`id`),
  KEY `t_admin_add_listing_form_management_field_category_index` (`field_category`),
  KEY `t_admin_add_listing_form_management_field_name_index` (`field_name`),
  KEY `t_admin_add_listing_form_management_field_status_index` (`field_status`),
  KEY `t_admin_add_listing_form_management_status_index` (`status`),
  KEY `t_admin_add_listing_form_management_created_by_index` (`created_by`),
  KEY `t_admin_add_listing_form_management_updated_by_index` (`updated_by`),
  KEY `t_admin_add_listing_form_management_created_at_index` (`created_at`),
  KEY `t_admin_add_listing_form_management_updated_at_index` (`updated_at`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_admin_affiliations`
--

DROP TABLE IF EXISTS `t_admin_affiliations`;
CREATE TABLE IF NOT EXISTS `t_admin_affiliations` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=Active, 0=Inactive',
  `created_by` bigint UNSIGNED DEFAULT NULL COMMENT 'Admin user who created the record',
  `updated_by` bigint UNSIGNED DEFAULT NULL COMMENT 'Admin user who last updated the record',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Stores the creation time of the record',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Stores the last update time of the record',
  PRIMARY KEY (`id`),
  KEY `t_admin_affiliations_name_index` (`name`),
  KEY `t_admin_affiliations_status_index` (`status`),
  KEY `t_admin_affiliations_created_by_index` (`created_by`),
  KEY `t_admin_affiliations_updated_by_index` (`updated_by`),
  KEY `t_admin_affiliations_created_at_index` (`created_at`),
  KEY `t_admin_affiliations_updated_at_index` (`updated_at`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `t_admin_affiliations`
--

INSERT INTO `t_admin_affiliations` (`id`, `name`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'AffKey1', 1, 1, NULL, '2025-01-11 05:47:09', '2025-01-11 05:47:09'),
(2, 'AffKey2', 1, 1, NULL, '2025-01-11 05:47:09', '2025-01-11 05:47:09');

-- --------------------------------------------------------

--
-- Table structure for table `t_admin_cities`
--

DROP TABLE IF EXISTS `t_admin_cities`;
CREATE TABLE IF NOT EXISTS `t_admin_cities` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state_id` bigint UNSIGNED DEFAULT NULL,
  `country_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `t_admin_cities_state_id_foreign` (`state_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_admin_countries`
--

DROP TABLE IF EXISTS `t_admin_countries`;
CREATE TABLE IF NOT EXISTS `t_admin_countries` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` decimal(10,7) DEFAULT NULL,
  `longitude` decimal(10,7) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_admin_mosque_data`
--

DROP TABLE IF EXISTS `t_admin_mosque_data`;
CREATE TABLE IF NOT EXISTS `t_admin_mosque_data` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Name of the mosque',
  `phone` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Address of the mosque',
  `lat` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Latitude of the mosque location',
  `lng` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Longitude of the mosque location',
  `place_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Place Id of the mosque',
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Icon of the mosque',
  `photos` mediumtext COLLATE utf8mb4_unicode_ci COMMENT 'Image of the mosque',
  `website` mediumtext COLLATE utf8mb4_unicode_ci COMMENT 'Website of the mosque',
  `opening_hour` mediumtext COLLATE utf8mb4_unicode_ci COMMENT 'Opening hours of the mosque',
  `rating` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Rating of the mosque',
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Description of the mosque',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=Active, 0=Inactive',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Stores the creation time of the record',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Stores the last update time of the record',
  PRIMARY KEY (`id`),
  KEY `t_admin_mosque_data_name_index` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `t_admin_pricing_plans`
--

DROP TABLE IF EXISTS `t_admin_pricing_plans`;
CREATE TABLE IF NOT EXISTS `t_admin_pricing_plans` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `type_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Price Planning Type Name',
  `pricing` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `plan_duration` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `key_tag` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `feature_title` mediumtext COLLATE utf8mb4_unicode_ci,
  `feature_status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=Active, 0=Inactive',
  `created_by` bigint UNSIGNED DEFAULT NULL COMMENT 'Admin user who created the record',
  `updated_by` bigint UNSIGNED DEFAULT NULL COMMENT 'Admin user who last updated the record',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Stores the creation time of the record',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Stores the last update time of the record',
  PRIMARY KEY (`id`),
  KEY `t_admin_pricing_plans_type_name_index` (`type_name`),
  KEY `t_admin_pricing_plans_pricing_index` (`pricing`),
  KEY `t_admin_pricing_plans_plan_duration_index` (`plan_duration`),
  KEY `t_admin_pricing_plans_key_tag_index` (`key_tag`),
  KEY `t_admin_pricing_plans_status_index` (`status`),
  KEY `t_admin_pricing_plans_created_by_index` (`created_by`),
  KEY `t_admin_pricing_plans_updated_by_index` (`updated_by`),
  KEY `t_admin_pricing_plans_created_at_index` (`created_at`),
  KEY `t_admin_pricing_plans_updated_at_index` (`updated_at`)
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
-- Table structure for table `t_admin_restaurants`
--

DROP TABLE IF EXISTS `t_admin_restaurants`;
CREATE TABLE IF NOT EXISTS `t_admin_restaurants` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '100% Halal, 100% Handcut Halal, No Alcohol Served',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=Active, 0=Inactive',
  `created_by` bigint UNSIGNED DEFAULT NULL COMMENT 'Admin user who created the record',
  `updated_by` bigint UNSIGNED DEFAULT NULL COMMENT 'Admin user who last updated the record',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Stores the creation time of the record',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Stores the last update time of the record',
  PRIMARY KEY (`id`),
  KEY `t_admin_restaurants_name_index` (`name`),
  KEY `t_admin_restaurants_status_index` (`status`),
  KEY `t_admin_restaurants_created_by_index` (`created_by`),
  KEY `t_admin_restaurants_updated_by_index` (`updated_by`),
  KEY `t_admin_restaurants_created_at_index` (`created_at`),
  KEY `t_admin_restaurants_updated_at_index` (`updated_at`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `t_admin_restaurants`
--

INSERT INTO `t_admin_restaurants` (`id`, `name`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, '100% Halal', 1, 1, NULL, '2025-01-11 05:47:09', '2025-01-11 05:47:09'),
(2, '100% Handcut Halal', 1, 1, NULL, '2025-01-11 05:47:09', '2025-01-11 05:47:09'),
(3, 'No Alcohol Served', 1, 1, NULL, '2025-01-11 05:47:09', '2025-01-11 05:47:09');

-- --------------------------------------------------------

--
-- Table structure for table `t_admin_states`
--

DROP TABLE IF EXISTS `t_admin_states`;
CREATE TABLE IF NOT EXISTS `t_admin_states` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_id` bigint UNSIGNED DEFAULT NULL,
  `country_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `t_admin_states_country_id_foreign` (`country_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_admin_subscription_plans`
--

DROP TABLE IF EXISTS `t_admin_subscription_plans`;
CREATE TABLE IF NOT EXISTS `t_admin_subscription_plans` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `plan_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Subscription Plan Name',
  `country_id` bigint UNSIGNED NOT NULL,
  `monthly_cost` double NOT NULL DEFAULT '0',
  `discount` bigint UNSIGNED NOT NULL DEFAULT '0',
  `yearly_cost` double NOT NULL DEFAULT '0',
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=Active, 0=Inactive',
  `created_by` bigint UNSIGNED DEFAULT NULL COMMENT 'Admin user who created the record',
  `updated_by` bigint UNSIGNED DEFAULT NULL COMMENT 'Admin user who last updated the record',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Stores the creation time of the record',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Stores the last update time of the record',
  PRIMARY KEY (`id`),
  KEY `t_admin_subscription_plans_plan_name_index` (`plan_name`),
  KEY `t_admin_subscription_plans_country_id_index` (`country_id`),
  KEY `t_admin_subscription_plans_monthly_cost_index` (`monthly_cost`),
  KEY `t_admin_subscription_plans_discount_index` (`discount`),
  KEY `t_admin_subscription_plans_yearly_cost_index` (`yearly_cost`),
  KEY `t_admin_subscription_plans_status_index` (`status`),
  KEY `t_admin_subscription_plans_created_by_index` (`created_by`),
  KEY `t_admin_subscription_plans_updated_by_index` (`updated_by`),
  KEY `t_admin_subscription_plans_created_at_index` (`created_at`),
  KEY `t_admin_subscription_plans_updated_at_index` (`updated_at`)
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
(1, 'Admin', 'admin@gmail.com', NULL, '01738305885', '$2y$12$LvVOaVHLGIfCH6UwlN37je71NamFrrN6mLYzp4ALYD0lf2nRl7hEy', '12/12', 'Bangladesh', 'Dhaka', 'Dhaka', '1200', 0, '2025-01-10 23:47:09', '2025-01-10 23:47:09');

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

--
-- Dumping data for table `t_app_terms_and_conditions`
--

INSERT INTO `t_app_terms_and_conditions` (`id`, `page_1_heading`, `page_2_title`, `page_2_heading`, `page_2_description`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, '[\"Create Business Profile\",\"Add business listing details\",\"Select your plan\"]', 'To begin, open a business account and accept the business terms and conditions.', 'Business profile allows you to:', 'list, manage, create promotions, and provides you with business insights.', 1, 1, NULL, '2025-01-11 05:47:12', '2025-01-11 05:47:12');

-- --------------------------------------------------------

--
-- Table structure for table `t_businesses`
--

DROP TABLE IF EXISTS `t_businesses`;
CREATE TABLE IF NOT EXISTS `t_businesses` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `business_owner_id` bigint UNSIGNED NOT NULL,
  `payment_id` int UNSIGNED DEFAULT NULL,
  `business_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_type_id` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_category_id` int UNSIGNED NOT NULL,
  `business_subcategory_id` int UNSIGNED DEFAULT NULL,
  `business_tags_id` bigint UNSIGNED DEFAULT NULL,
  `creed_tags_id` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `business_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_code` varchar(7) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `business_phone_number` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `business_website` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_code` bigint UNSIGNED DEFAULT NULL,
  `lat` decimal(10,7) DEFAULT NULL COMMENT 'address latitude',
  `long` decimal(10,7) DEFAULT NULL COMMENT 'address longitude',
  `service_area` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `hotline_country_code` varchar(7) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_hotline` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_email_leads` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `business_profile_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `restaurant_id` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `halal_certificate` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `handcut_text` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `handcut_certificate` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `affiliation_id` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_code_description` mediumtext COLLATE utf8mb4_unicode_ci,
  `discount_code` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int UNSIGNED NOT NULL DEFAULT '1' COMMENT '1=business_owner_info_complete, 2=business_info_step1_complete, 3=business_info_step2_complete, 4=business_info_step3_complete, 5=business_info_step4_complete, 6=check_out_complete, 7=payment_success, 8=payment_failed',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Stores the creation time of the record',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Stores the last update time of the record',
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `t_businesses_business_owner_id_index` (`business_owner_id`),
  KEY `t_businesses_payment_id_index` (`payment_id`),
  KEY `t_businesses_business_name_index` (`business_name`),
  KEY `t_businesses_business_type_id_index` (`business_type_id`),
  KEY `t_businesses_business_category_id_index` (`business_category_id`),
  KEY `t_businesses_business_email_index` (`business_email`),
  KEY `t_businesses_business_phone_number_index` (`business_phone_number`),
  KEY `t_businesses_lat_index` (`lat`),
  KEY `t_businesses_long_index` (`long`),
  KEY `t_businesses_status_index` (`status`),
  KEY `t_businesses_created_at_index` (`created_at`),
  KEY `t_businesses_updated_at_index` (`updated_at`),
  KEY `t_businesses_business_tags_id_foreign` (`business_tags_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `t_businesses`
--

INSERT INTO `t_businesses` (`id`, `business_owner_id`, `payment_id`, `business_name`, `business_type_id`, `business_category_id`, `business_subcategory_id`, `business_tags_id`, `creed_tags_id`, `business_email`, `country_code`, `business_phone_number`, `business_website`, `address`, `country`, `state`, `city`, `zip_code`, `lat`, `long`, `service_area`, `description`, `hotline_country_code`, `customer_hotline`, `customer_email_leads`, `business_profile_image`, `restaurant_id`, `halal_certificate`, `handcut_text`, `handcut_certificate`, `affiliation_id`, `discount_code_description`, `discount_code`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, NULL, 'Five Pillars Ventures LLC', '[\"1\"]', 1, NULL, NULL, '[\"1\",\"2\",\"3\"]', 'azam.hh@gmail.com', NULL, '4086930134', NULL, '21329 Gosier Way', '233', '1436', '112494', 33428, 26.3562011, -80.2474052, NULL, 'app development information technology consulting', NULL, '4086930134', 'azam.hh@gmail.com', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2025-01-11 05:47:12', '2025-01-11 05:47:12', NULL),
(2, 2, NULL, 'Muslim Dentist LLC', '[\"2\"]', 2, NULL, NULL, '[\"1\",\"2\",\"3\"]', 'MuslimDentistLLC@gmail.com', NULL, '1234567890', NULL, '20423 US-441 Suite F18', '233', '1436', '112494', 33498, 26.3767221, -80.2065753, NULL, 'Dental Surgeon Dentist Dental Hygeine', NULL, '1234567890', 'MuslimDentistLLC@gmail.com', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2025-01-11 05:47:12', '2025-01-11 05:47:12', NULL),
(3, 3, NULL, 'Muslim Law LLC', '[\"3\"]', 3, NULL, NULL, '[\"1\",\"2\",\"3\"]', 'Mikaeel@gmail.com', NULL, ' 3333333333', NULL, '8185 Via Ancho Rd', '233', '1436', '112494', 33488, 26.3612422, -80.1785146, NULL, 'Lawyer Family Law Probate Custody Divorce', NULL, ' 3333333333', 'Mikaeel@gmail.com', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2025-01-11 05:47:12', '2025-01-11 05:47:12', NULL),
(4, 4, NULL, 'Lunar Events LLC', '[\"4\"]', 4, NULL, NULL, '[\"1\",\"2\",\"3\"]', 'Sana@gmail.com', NULL, ' 5555555555', NULL, '2005 Greenbriar Blvd', '233', '1436', '128776', 33414, 26.6456944, -80.2919912, NULL, 'event planning parties corporate events birthday planner wedding fun outdoor florida event planner', NULL, ' 5555555555', 'Sana@gmail.com', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2025-01-11 05:47:12', '2025-01-11 05:47:12', NULL),
(5, 5, NULL, 'Halal Food Restaurant LLC', '[\"5\"]', 5, NULL, NULL, '[\"1\",\"2\",\"3\"]', 'restaurantLLC@gmail.com', NULL, ' 9999999999', NULL, '19196 Natures View Ct', '233', '1436', '112494', 33498, 26.3898274, -80.2368410, NULL, 'halal yemeni arab restaurant', NULL, ' 9999999999', 'restaurantLLC@gmail.com', NULL, '[\"1\"]', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2025-01-11 05:47:12', '2025-01-11 05:47:12', NULL),
(6, 6, NULL, 'Italian Restaurant LLC', '[\"6\"]', 5, NULL, NULL, '[\"3\"]', '', NULL, ' ', NULL, '7501 Harwin Dr. #101e', '233', '1407', '118703', 77036, 29.7163364, -95.5196025, NULL, 'Halal Italian Restaurant pizza pasta', NULL, ' ', '', NULL, '[\"2\"]', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2025-01-11 05:47:12', '2025-01-11 05:47:12', NULL),
(7, 7, NULL, 'Analyzen2.0', '[\"1\"]', 1, NULL, NULL, '[\"1\",\"2\",\"3\"]', 'nazim@analyzenbd.com', NULL, '01778213921', NULL, 'Level 1, House 1A, Road No. 16/A, Gulshan 1, Dhaka 1212', '19', '760', '153863', 1212, 23.7812753, 90.4101866, NULL, 'web & app development information technology consulting', NULL, '01778213921', 'nazim11121@gamil.com', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2025-01-11 05:47:12', '2025-01-11 05:47:12', NULL),
(8, 14, NULL, 'Law test2', '\"[\\\"3\\\"]\"', 1, 1, NULL, NULL, 'nazim133@gmail.com', '+880', '01756164417', 'www.amarit.com', '13/148', '1', '1', '1', 1200, 23.7792753, 90.4101866, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '\"[\\\"1\\\"]\"', NULL, NULL, 2, '2025-01-11 09:11:57', '2025-01-11 09:11:57', NULL);

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

--
-- Dumping data for table `t_business_categories`
--

INSERT INTO `t_business_categories` (`id`, `name`, `description`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'Technology', 'Technology Consultant/Computers/Phones.', 1, 1, NULL, '2025-01-11 05:47:09', '2025-01-11 05:47:09'),
(2, 'Medical', 'Doctor/Dentist/Surgeon/Mental Health/Medical Services/Health & Well Being Facility.', 1, 1, NULL, '2025-01-11 05:47:09', '2025-01-11 05:47:09'),
(3, 'Legal', 'Lawyer/Law-Firm/Legal Expert/Legal Consultant.', 1, 1, NULL, '2025-01-11 05:47:09', '2025-01-11 05:47:09'),
(4, 'Event Planning', 'Event Planning description', 1, 1, NULL, '2025-01-11 05:47:09', '2025-01-11 05:47:09'),
(5, 'Halal Restaurant', 'Halal Restaurant description', 1, 1, NULL, '2025-01-11 05:47:09', '2025-01-11 05:47:09');

-- --------------------------------------------------------

--
-- Table structure for table `t_business_category_keywords`
--

DROP TABLE IF EXISTS `t_business_category_keywords`;
CREATE TABLE IF NOT EXISTS `t_business_category_keywords` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `category_id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=Active, 0=Inactive',
  `created_by` bigint UNSIGNED DEFAULT NULL COMMENT 'Admin user who created the record',
  `updated_by` bigint UNSIGNED DEFAULT NULL COMMENT 'Admin user who last updated the record',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Stores the creation time of the record',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Stores the last update time of the record',
  PRIMARY KEY (`id`),
  KEY `t_business_category_keywords_created_by_foreign` (`created_by`),
  KEY `t_business_category_keywords_updated_by_foreign` (`updated_by`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_business_galleries`
--

DROP TABLE IF EXISTS `t_business_galleries`;
CREATE TABLE IF NOT EXISTS `t_business_galleries` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `business_id` bigint UNSIGNED NOT NULL,
  `business_gallery_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Stores the creation time of the record',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Stores the last update time of the record',
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `t_business_galleries_business_id_foreign` (`business_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_business_owner_infos`
--

DROP TABLE IF EXISTS `t_business_owner_infos`;
CREATE TABLE IF NOT EXISTS `t_business_owner_infos` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED NOT NULL,
  `first_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_code` varchar(7) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` bigint UNSIGNED DEFAULT NULL,
  `status` int UNSIGNED NOT NULL DEFAULT '1' COMMENT '1=business_owner_info_complete, 2=business_info_step1_complete, 3=business_info_step2_complete, 4=business_info_step3_complete, 5=business_info_step4_complete, 6=check_out_complete, 7=payment_success, 8=payment_failed',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Stores the creation time of the record',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Stores the last update time of the record',
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `t_business_owner_infos_first_name_index` (`first_name`),
  KEY `t_business_owner_infos_last_name_index` (`last_name`),
  KEY `t_business_owner_infos_email_index` (`email`),
  KEY `t_business_owner_infos_phone_number_index` (`phone_number`),
  KEY `t_business_owner_infos_user_id_index` (`user_id`),
  KEY `t_business_owner_infos_status_index` (`status`),
  KEY `t_business_owner_infos_created_at_index` (`created_at`),
  KEY `t_business_owner_infos_updated_at_index` (`updated_at`),
  KEY `t_business_owner_infos_business_id_foreign` (`business_id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `t_business_owner_infos`
--

INSERT INTO `t_business_owner_infos` (`id`, `user_id`, `first_name`, `last_name`, `email`, `country_code`, `phone_number`, `address`, `business_id`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Azam', 'Hassim', 'azam.hh@gmail.com', NULL, '4086930134', '21329 Gosier Way', NULL, 1, '2025-01-11 05:47:12', '2025-01-11 05:47:12', NULL),
(2, 2, 'Surah', 'Hassim', 'azam.hh@gmail.com', NULL, '1234567890', '20423 US-441 Suite F18', NULL, 1, '2025-01-11 05:47:12', '2025-01-11 05:47:12', NULL),
(3, 3, 'Mikaeel', 'Hassim', 'Mikaeel@gmail.com', NULL, '2345678901', '8185 Via Ancho Rd', NULL, 1, '2025-01-11 05:47:12', '2025-01-11 05:47:12', NULL),
(4, 4, 'Sana', 'Shaikh', 'Sana@gmail.com', NULL, '4444444444', '2005 Greenbriar Blvd', NULL, 1, '2025-01-11 05:47:12', '2025-01-11 05:47:12', NULL),
(5, 5, 'Azam', 'Hassim', 'azam.hh@gmail.com', NULL, '5557890345', '19196 Natures View Ct', NULL, 1, '2025-01-11 05:47:12', '2025-01-11 05:47:12', NULL),
(6, 6, 'Hal', 'Al', 'Hal@gmail.com', NULL, '8888888888', '7501 Harwin Dr. #101e', NULL, 1, '2025-01-11 05:47:12', '2025-01-11 05:47:12', NULL),
(7, 7, 'Mr.', 'Nazim', 'nazim11121@gamil.com', NULL, '01778213921', 'Level 1, House 1A, Road No. 16/A, Gulshan 1, Dhaka 1212', NULL, 1, '2025-01-11 05:47:12', '2025-01-11 05:47:12', NULL),
(9, 9, 'Mr.', 'Nazim3', 'nazim13@gmail.com', '+880', '01738305875', '13/12, Abdullahpur, Dhaka, Bangladesh.', NULL, 1, '2025-01-11 00:46:31', '2025-01-11 00:46:31', NULL),
(10, 17, 'Mr.', 'Nazim1', 'nazim1@gmail.com', '+880', '01738305875', '13/12, Abdullahpur, Dhaka, Bangladesh.', NULL, 1, '2025-01-11 08:16:54', '2025-01-11 08:16:54', NULL),
(11, 17, 'Mr.', 'Nazim1', 'nazim1@gmail.com', '+880', '01738305875', '13/12, Abdullahpur, Dhaka, Bangladesh.', NULL, 1, '2025-01-11 08:17:01', '2025-01-11 08:17:01', NULL),
(12, 17, 'Mr.', 'Nazim1', 'nazim1@gmail.com', '+880', '01738305875', '13/12, Abdullahpur, Dhaka, Bangladesh.', NULL, 1, '2025-01-11 08:17:05', '2025-01-11 08:17:05', NULL),
(13, 17, 'Mr.', 'Nazim1', 'nazim1@gmail.com', '+880', '01738305875', '13/12, Abdullahpur, Dhaka, Bangladesh.', NULL, 1, '2025-01-11 08:27:37', '2025-01-11 08:27:37', NULL),
(14, 17, 'Mr.', 'Nazim', 'nazim1@gmail.com', '+880', '01738305875', '13/12, Abdullahpur, Dhaka, Bangladesh.', 8, 2, '2025-01-11 08:27:49', '2025-01-11 09:11:57', NULL),
(15, 17, 'Mr.', 'Nazim', 'nazim1@gmail.com', '+880', '01738305875', '13/12, Abdullahpur, Dhaka, Bangladesh.', NULL, 1, '2025-01-11 08:30:28', '2025-01-11 08:30:28', NULL);

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
-- Table structure for table `t_business_ratings`
--

DROP TABLE IF EXISTS `t_business_ratings`;
CREATE TABLE IF NOT EXISTS `t_business_ratings` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED NOT NULL,
  `business_id` bigint UNSIGNED NOT NULL,
  `rating_star` tinyint UNSIGNED NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `holding_time` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1=Published, 0=Unpublished, 2=Hold',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Stores the creation time of the record',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Stores the last update time of the record',
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `t_business_ratings_user_id_index` (`user_id`),
  KEY `t_business_ratings_business_id_index` (`business_id`),
  KEY `t_business_ratings_rating_star_index` (`rating_star`),
  KEY `t_business_ratings_status_index` (`status`)
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

--
-- Dumping data for table `t_business_sub_categories`
--

INSERT INTO `t_business_sub_categories` (`id`, `category_id`, `name`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, '1', 'SubCat1', 1, 1, NULL, '2025-01-11 05:47:09', '2025-01-11 05:47:09'),
(2, '1', 'SubCat2', 1, 1, NULL, '2025-01-11 05:47:09', '2025-01-11 05:47:09'),
(3, '4', 'Coffee', 1, 1, NULL, '2025-01-11 05:47:09', '2025-01-11 05:47:09'),
(4, '4', 'Burger', 1, 1, NULL, '2025-01-11 05:47:09', '2025-01-11 05:47:09'),
(5, '4', 'Pizza', 1, 1, NULL, '2025-01-11 05:47:09', '2025-01-11 05:47:09');

-- --------------------------------------------------------

--
-- Table structure for table `t_business_tags`
--

DROP TABLE IF EXISTS `t_business_tags`;
CREATE TABLE IF NOT EXISTS `t_business_tags` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=Active, 0=Inactive',
  `created_by` bigint UNSIGNED DEFAULT NULL COMMENT 'Admin user who created the record',
  `updated_by` bigint UNSIGNED DEFAULT NULL COMMENT 'Admin user who last updated the record',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Stores the creation time of the record',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Stores the last update time of the record',
  PRIMARY KEY (`id`),
  KEY `t_business_tags_created_by_foreign` (`created_by`),
  KEY `t_business_tags_updated_by_foreign` (`updated_by`),
  KEY `t_business_tags_name_index` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `t_business_tags`
--

INSERT INTO `t_business_tags` (`id`, `name`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'Dry Food', 1, 1, NULL, '2025-01-11 05:47:09', '2025-01-11 05:47:09'),
(2, 'Seeds', 1, 1, NULL, '2025-01-11 05:47:09', '2025-01-11 05:47:09'),
(3, 'Others', 1, 1, NULL, '2025-01-11 05:47:09', '2025-01-11 05:47:09');

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

--
-- Dumping data for table `t_business_types`
--

INSERT INTO `t_business_types` (`id`, `name`, `description`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'Information Technology Services', 'IT Related Service', 1, 1, NULL, '2025-01-11 05:47:09', '2025-01-11 05:47:09'),
(2, 'Dentist Dental Surgeon', 'Dental Related Service', 1, 1, NULL, '2025-01-11 05:47:09', '2025-01-11 05:47:09'),
(3, 'Muslim Legal Services Family Law', 'Family Law Related Legal Service', 1, 1, NULL, '2025-01-11 05:47:09', '2025-01-11 05:47:09'),
(4, 'Event planning party planning', 'Event Planning Related Service', 1, 1, NULL, '2025-01-11 05:47:09', '2025-01-11 05:47:09'),
(5, 'Halal Yemeni Restaurant', 'Restaurant Related Service', 1, 1, NULL, '2025-01-11 05:47:09', '2025-01-11 05:47:09'),
(6, 'Halal italian restaurant', 'Italian Restaurant Related Service', 1, 1, NULL, '2025-01-11 05:47:09', '2025-01-11 05:47:09'),
(7, 'Online Retail', 'Online Retail Description', 1, 1, NULL, '2025-01-11 05:47:09', '2025-01-11 05:47:09'),
(8, 'Local Store', 'Local Store Description', 1, 1, NULL, '2025-01-11 05:47:09', '2025-01-11 05:47:09'),
(9, 'Others', 'Others Description', 1, 1, NULL, '2025-01-11 05:47:09', '2025-01-11 05:47:09');

-- --------------------------------------------------------

--
-- Table structure for table `t_call_mes`
--

DROP TABLE IF EXISTS `t_call_mes`;
CREATE TABLE IF NOT EXISTS `t_call_mes` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=Active, 0=Inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `t_call_mes_user_id_index` (`user_id`),
  KEY `t_call_mes_name_index` (`name`),
  KEY `t_call_mes_email_index` (`email`),
  KEY `t_call_mes_country_code_index` (`country_code`),
  KEY `t_call_mes_phone_number_index` (`phone_number`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `t_contact_creeds`
--

DROP TABLE IF EXISTS `t_contact_creeds`;
CREATE TABLE IF NOT EXISTS `t_contact_creeds` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` mediumtext COLLATE utf8mb4_unicode_ci,
  `country_short_code` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_code` varchar(7) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=Active, 0=Inactive',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Stores the creation time of the record',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Stores the last update time of the record',
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `t_contact_creeds_first_name_index` (`first_name`),
  KEY `t_contact_creeds_last_name_index` (`last_name`),
  KEY `t_contact_creeds_email_index` (`email`),
  KEY `t_contact_creeds_phone_number_index` (`phone_number`),
  KEY `t_contact_creeds_status_index` (`status`),
  KEY `t_contact_creeds_created_at_index` (`created_at`),
  KEY `t_contact_creeds_updated_at_index` (`updated_at`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_creed_tags`
--

DROP TABLE IF EXISTS `t_creed_tags`;
CREATE TABLE IF NOT EXISTS `t_creed_tags` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Muslim Owned,Muslim Operated,Serving Muslim Community',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=Active, 0=Inactive',
  `created_by` bigint UNSIGNED DEFAULT NULL COMMENT 'Admin user who created the record',
  `updated_by` bigint UNSIGNED DEFAULT NULL COMMENT 'Admin user who last updated the record',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Stores the creation time of the record',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Stores the last update time of the record',
  PRIMARY KEY (`id`),
  KEY `t_creed_tags_name_index` (`name`),
  KEY `t_creed_tags_status_index` (`status`),
  KEY `t_creed_tags_created_by_index` (`created_by`),
  KEY `t_creed_tags_updated_by_index` (`updated_by`),
  KEY `t_creed_tags_created_at_index` (`created_at`),
  KEY `t_creed_tags_updated_at_index` (`updated_at`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `t_creed_tags`
--

INSERT INTO `t_creed_tags` (`id`, `name`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'Muslim Owned', 1, 1, NULL, '2025-01-11 05:47:09', '2025-01-11 05:47:09'),
(2, 'Muslim Operated', 1, 1, NULL, '2025-01-11 05:47:09', '2025-01-11 05:47:09'),
(3, 'Serving Muslim Community', 1, 1, NULL, '2025-01-11 05:47:09', '2025-01-11 05:47:09');

-- --------------------------------------------------------

--
-- Table structure for table `t_creed_visitors`
--

DROP TABLE IF EXISTS `t_creed_visitors`;
CREATE TABLE IF NOT EXISTS `t_creed_visitors` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `device_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=Active, 0=Inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `t_creed_visitors_device_id_unique` (`device_id`)
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
(2, 'users', 'account_type', 'G=General, GB=General+Business', '2025-01-11 05:47:09', '2025-01-11 05:47:09'),
(3, 't_business_owner_infos', 'status', '1=Business Owner Info Complete, 2=Business Info Complete, 3=Payment Failed, 4=Payment Success', '2025-01-11 05:47:09', '2025-01-11 05:47:09'),
(4, 't_businesses', 'lat,long', 'lat = Latitude, log = Longitude', '2025-01-11 05:47:09', '2025-01-11 05:47:09');

-- --------------------------------------------------------

--
-- Table structure for table `t_halal_certificate_data`
--

DROP TABLE IF EXISTS `t_halal_certificate_data`;
CREATE TABLE IF NOT EXISTS `t_halal_certificate_data` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `business_id` bigint UNSIGNED NOT NULL,
  `certificate_by` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `halal_certificate` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=Active, 0=Inactive',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Stores the creation time of the record',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Stores the last update time of the record',
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `t_halal_certificate_data_business_id_index` (`business_id`),
  KEY `t_halal_certificate_data_certificate_by_index` (`certificate_by`),
  KEY `t_halal_certificate_data_halal_certificate_index` (`halal_certificate`),
  KEY `t_halal_certificate_data_status_index` (`status`),
  KEY `t_halal_certificate_data_created_at_index` (`created_at`),
  KEY `t_halal_certificate_data_updated_at_index` (`updated_at`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_operation_hours`
--

DROP TABLE IF EXISTS `t_operation_hours`;
CREATE TABLE IF NOT EXISTS `t_operation_hours` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `business_id` bigint UNSIGNED DEFAULT NULL,
  `day` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `open_time` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `closed_time` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=Active, 0=Inactive',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Stores the creation time of the record',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Stores the last update time of the record',
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `t_operation_hours_business_id_index` (`business_id`),
  KEY `t_operation_hours_day_index` (`day`),
  KEY `t_operation_hours_open_time_index` (`open_time`),
  KEY `t_operation_hours_closed_time_index` (`closed_time`),
  KEY `t_operation_hours_status_index` (`status`),
  KEY `t_operation_hours_created_at_index` (`created_at`),
  KEY `t_operation_hours_updated_at_index` (`updated_at`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `t_quotes`
--

DROP TABLE IF EXISTS `t_quotes`;
CREATE TABLE IF NOT EXISTS `t_quotes` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` mediumtext COLLATE utf8mb4_unicode_ci,
  `lat` decimal(10,7) DEFAULT NULL COMMENT 'address latitude',
  `long` decimal(10,7) DEFAULT NULL COMMENT 'address longitude',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=Active, 0=Inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `t_quotes_user_id_index` (`user_id`),
  KEY `t_quotes_name_index` (`name`),
  KEY `t_quotes_email_index` (`email`),
  KEY `t_quotes_country_code_index` (`country_code`),
  KEY `t_quotes_phone_number_index` (`phone_number`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_save_businesses`
--

DROP TABLE IF EXISTS `t_save_businesses`;
CREATE TABLE IF NOT EXISTS `t_save_businesses` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED NOT NULL,
  `business_id` bigint UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=Active, 0=Inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `t_save_businesses_user_id_index` (`user_id`),
  KEY `t_save_businesses_business_id_index` (`business_id`)
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
  `level` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `first_name`, `last_name`, `email`, `country_code`, `phone_number`, `email_verified_at`, `password`, `remember_token`, `google_id`, `avatar`, `refer_code`, `own_refer_code`, `level`, `address`, `country`, `state`, `city`, `zip_code`, `account_type`, `otp`, `otp_expires_at`, `otp_status`, `save_business_list`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Azam Hassim', 'Azam', 'Hassim', 'azam.hh@gmail.com', NULL, NULL, NULL, '$2y$12$zhslFdkQ66M.sjbdsthJs.mlMiUQEdrfs5GWCs1KKaIamyTiXh8e.', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'GB', NULL, NULL, 0, NULL, 0, '2025-01-11 05:47:12', '2025-01-11 05:47:12', NULL),
(2, 'Surah Hassim', 'Surah', 'Hassim', 'azam1.hh@gmail.com', NULL, NULL, NULL, '$2y$12$11iHUSMXTlZx8s742awNxeMTTALqJIzD4IOX3WKa7NGsbHt0HBN7C', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'GB', NULL, NULL, 0, NULL, 0, '2025-01-11 05:47:12', '2025-01-11 05:47:12', NULL),
(3, 'Mikaeel Hassim', 'Mikaeel', 'Hassim', 'Mikaeel@gmail.com', NULL, NULL, NULL, '$2y$12$UdPbE1UiwAibuuikuug4kuEHQuSfa2rwOJlODWSTG5goSQD/RTlYW', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'GB', NULL, NULL, 0, NULL, 0, '2025-01-11 05:47:12', '2025-01-11 05:47:12', NULL),
(4, 'Sana Shaikh', 'Sana', 'Shaikh', 'Sana@gmail.com', NULL, NULL, NULL, '$2y$12$g38wF9CsksQfyLMAaYEjsOsM.aFlSHDUYDTWJSiNAy21/NHIVGShS', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'GB', NULL, NULL, 0, NULL, 0, '2025-01-11 05:47:12', '2025-01-11 05:47:12', NULL),
(5, 'Azam Hassim', 'Azam', 'Hassim', 'azam2.hh@gmail.com', NULL, NULL, NULL, '$2y$12$z.j6fLHU0Dfwe6s9i2zlqOB5KrphlYRh2cVZgTJbl5wwFAbUp.K2S', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'GB', NULL, NULL, 0, NULL, 0, '2025-01-11 05:47:12', '2025-01-11 05:47:12', NULL),
(6, 'Azam Hassim', 'Hal', 'Al', 'Hal@gmail.com', NULL, NULL, NULL, '$2y$12$LQNk6yNtKBDWxEoJ2IcOYukmopeqMIIqXbI.7M8KPJvjQyopGKaiy', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'GB', NULL, NULL, 0, NULL, 0, '2025-01-11 05:47:12', '2025-01-11 05:47:12', NULL),
(7, 'Mr. Nazim', 'Mr.', 'Nazim', 'nazim11121@gamil.com', NULL, NULL, NULL, '$2y$12$Zn3.HrYhNJgk8rahv.PgFeY7W2mBvRxG8uY.IPqkGOoFfE6pb84QO', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'GB', NULL, NULL, 0, NULL, 0, '2025-01-11 05:47:12', '2025-01-11 05:47:12', NULL),
(9, 'Mr. Nazim3', 'Mr.', 'Nazim3', 'nazim@gmail.com', NULL, '01738305875', NULL, '$2y$12$Q.4SRA/IUERpaqKQCPX9Puv6Noexwd9wozChLr1AvaINN7k3K1lPK', NULL, NULL, NULL, '', NULL, NULL, '13/12, Abdullahpur, Dhaka, Bangladesh.', NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-01-11 00:45:08', '2025-01-11 00:46:31', NULL),
(10, NULL, NULL, NULL, 'nazim@gmail.co', NULL, NULL, NULL, '$2y$12$gP6YYuK.sYnlgmG5C9.P9.8PM6Z2SKwC3DZDyxQgWPIylcHttlBDO', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-01-11 01:20:03', '2025-01-11 01:20:03', NULL),
(11, NULL, NULL, NULL, 'nazim@gmail', NULL, NULL, NULL, '$2y$12$11VlopjRTG/iiiH1HU0VHeMnbh.F3vEnRO5FTliamVF61FcPq9StG', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-01-11 01:26:36', '2025-01-11 01:26:36', NULL),
(12, NULL, NULL, NULL, 'nazim32@gmail', NULL, NULL, NULL, '$2y$12$y6SyGeBz5Y83LKfjxSQNbe.TvcaUM954LrGyr7HoFAgnZdEyNC2wC', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-01-11 01:30:19', '2025-01-11 01:30:19', NULL),
(13, NULL, NULL, NULL, 'nazim99@gmail', NULL, NULL, NULL, '$2y$12$mRVG5GnZ9SCEkpbVV9l75uzF/IA2klJAOQkJGvnW2fSHUtTxQ2DnC', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-01-11 05:59:15', '2025-01-11 05:59:15', NULL),
(14, NULL, NULL, NULL, 'nazim99@gmail.com', NULL, NULL, NULL, '$2y$12$TynYvogKXO7vmFpfxLI.D.jlOQM.B0MKAVNGuum4H5qpRHu40qP56', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-01-11 05:59:34', '2025-01-11 05:59:34', NULL),
(15, NULL, NULL, NULL, 'nazim919@gmail.com', NULL, NULL, NULL, '$2y$12$jgqjtBInJ9bHra9ULEyw9OIbgm6ezNh6z1C4p2Jn3rco.Zr65HXPO', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-01-11 06:07:05', '2025-01-11 06:07:05', NULL),
(16, NULL, NULL, NULL, 'nazim91@gmail.com', NULL, NULL, NULL, '$2y$12$PuR3aIMVYomhVMHsXr5sZePNTo3zTlSihIwf8VzvzfvRGYH1F3cVu', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-01-11 06:08:19', '2025-01-11 06:08:19', NULL),
(17, 'Mr. Nazim1', 'Mr.', 'Nazim1', 'nazim1@gmail.com', NULL, '01738305875', NULL, '$2y$12$AF/cJGMLtYI7CTtdptF0T.uOC0Dq0erTkY6WTZYTCkIidTsFBELp6', NULL, NULL, NULL, '', NULL, NULL, '13/12, Abdullahpur, Dhaka, Bangladesh.', NULL, NULL, NULL, NULL, 'GB', NULL, NULL, 0, NULL, 0, '2025-01-11 06:14:33', '2025-01-11 09:11:57', NULL),
(18, 'test', NULL, NULL, 'test@gmail.com', NULL, '01767676543', NULL, '$2y$12$Zn3.HrYhNJgk8rahv.PgFeY7W2mBvRxG8uY.IPqkGOoFfE6pb84QO', NULL, NULL, NULL, '123456', NULL, 'Level 1', NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-08-22 23:23:24', '2025-08-23 06:40:27', NULL),
(19, 'Nazim', NULL, NULL, 'nazim12@gmail.com', NULL, '01767676543', NULL, '$2y$12$jYhgEXa1Z0nUvqDK.igs0utaCPLnGVmnn0kJWmAG3gpD6nmGBMIUu', NULL, NULL, NULL, '123456', '827', 'Level 1', NULL, NULL, NULL, NULL, NULL, 'G', NULL, NULL, 0, NULL, 0, '2025-08-23 07:30:26', '2025-08-23 07:30:26', NULL);

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
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_nid_images`
--

INSERT INTO `user_nid_images` (`id`, `user_id`, `nid_image`, `status`, `created_at`, `updated_at`) VALUES
(1, 18, 'images/users/17559266040_Screenshot (1).png', 1, '2025-08-22 23:23:24', '2025-08-22 23:23:24'),
(2, 18, 'images/users/17559266041_Screenshot (2).png', 1, '2025-08-22 23:23:24', '2025-08-22 23:23:24'),
(3, 19, 'images/users/17559558260_Screenshot 2025-08-22 182708.png', 1, '2025-08-23 07:30:26', '2025-08-23 07:30:26'),
(4, 19, 'images/users/17559558261_1749191004.jpg', 1, '2025-08-23 07:30:26', '2025-08-23 07:30:26');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
