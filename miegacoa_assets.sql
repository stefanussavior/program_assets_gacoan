-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Waktu pembuatan: 15 Okt 2024 pada 09.12
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `miegacoa_assets`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('admin@gmail.com|127.0.0.1', 'i:1;', 1728959443),
('admin@gmail.com|127.0.0.1:timer', 'i:1728959443;', 1728959443),
('spatie.permission.cache', 'a:3:{s:5:\"alias\";a:4:{s:1:\"a\";s:2:\"id\";s:1:\"b\";s:4:\"name\";s:1:\"c\";s:10:\"guard_name\";s:1:\"r\";s:5:\"roles\";}s:11:\"permissions\";a:8:{i:0;a:4:{s:1:\"a\";i:1;s:1:\"b\";s:9:\"role-list\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:3;}}i:1;a:4:{s:1:\"a\";i:2;s:1:\"b\";s:11:\"role-create\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:3;}}i:2;a:4:{s:1:\"a\";i:3;s:1:\"b\";s:9:\"role-edit\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:3;a:4:{s:1:\"a\";i:4;s:1:\"b\";s:11:\"role-delete\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:4;a:4:{s:1:\"a\";i:5;s:1:\"b\";s:12:\"product-list\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:3;}}i:5;a:4:{s:1:\"a\";i:6;s:1:\"b\";s:14:\"product-create\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:3;}}i:6;a:4:{s:1:\"a\";i:7;s:1:\"b\";s:12:\"product-edit\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:7;a:4:{s:1:\"a\";i:8;s:1:\"b\";s:14:\"product-delete\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}}s:5:\"roles\";a:2:{i:0;a:3:{s:1:\"a\";i:1;s:1:\"b\";s:5:\"Admin\";s:1:\"c\";s:3:\"web\";}i:1;a:3:{s:1:\"a\";i:3;s:1:\"b\";s:5:\"Guest\";s:1:\"c\";s:3:\"web\";}}}', 1729045769);

-- --------------------------------------------------------

--
-- Struktur dari tabel `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `mc_approval`
--

CREATE TABLE `mc_approval` (
  `approval_id` int(11) NOT NULL,
  `approval_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `mc_asset_checklist`
--

CREATE TABLE `mc_asset_checklist` (
  `asset_checklist_id` int(11) NOT NULL,
  `asset_checklist_name` varchar(255) NOT NULL,
  `asset_id` int(11) NOT NULL,
  `checklist_id` int(11) NOT NULL,
  `control_id` int(11) NOT NULL,
  `asset_checklist_desc` varchar(255) DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `modified_by` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `mc_asset_mtc`
--

CREATE TABLE `mc_asset_mtc` (
  `asset_mtc_id` int(11) NOT NULL,
  `asset_mtc_name` varchar(255) NOT NULL,
  `asset_id` int(11) NOT NULL,
  `mtc_id` int(11) NOT NULL,
  `asset_mtc_desc` varchar(255) DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `modified_by` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `mc_bom_detail`
--

CREATE TABLE `mc_bom_detail` (
  `bom_det_id` int(11) NOT NULL,
  `bom_id` int(11) DEFAULT NULL,
  `asset_id` int(11) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `uom_id` int(11) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `mc_bom_header`
--

CREATE TABLE `mc_bom_header` (
  `bom_id` int(11) NOT NULL,
  `bom_name` varchar(255) DEFAULT NULL,
  `asset_id` int(11) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `bom_desc` varchar(255) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `modified_by` varchar(255) DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `mc_mtc`
--

CREATE TABLE `mc_mtc` (
  `mtc_conf_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `mc_notif`
--

CREATE TABLE `mc_notif` (
  `notif_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_09_28_145528_create_user_models_table', 1),
(5, '2024_09_28_163818_create_m_user_table', 1),
(6, '2024_10_03_110231_create_permission_tables', 2),
(7, '2024_10_07_012808_create_m_condition_table', 3),
(8, '2024_10_09_013502_create_products_table', 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 2),
(3, 'App\\Models\\User', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_assets`
--

CREATE TABLE `m_assets` (
  `asset_id` int(11) NOT NULL,
  `asset_code` varchar(255) NOT NULL,
  `asset_model` varchar(255) NOT NULL,
  `asset_quantity` int(11) NOT NULL,
  `asset_status` varchar(100) NOT NULL,
  `asset_image` varchar(255) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `modified_by` varchar(255) DEFAULT NULL,
  `priority_id` int(11) DEFAULT NULL,
  `cat_id` int(11) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  `uom_id` int(11) DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `qr_code_path` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `m_assets`
--

INSERT INTO `m_assets` (`asset_id`, `asset_code`, `asset_model`, `asset_quantity`, `asset_status`, `asset_image`, `create_date`, `modified_date`, `create_by`, `modified_by`, `priority_id`, `cat_id`, `type_id`, `uom_id`, `is_active`, `created_at`, `updated_at`, `deleted_at`, `qr_code_path`) VALUES
(107, 'coba1', 'coba1', 10, 'coba1', 'coba1', '2024-10-01 08:35:10', '2024-10-01 08:35:10', 'coba1', 'coba1', NULL, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2024-10-01 08:35:10', 'coba1'),
(108, 'coba1', 'coba1', 10, 'coba1', 'coba1', '2024-10-01 08:35:10', '2024-10-01 08:35:10', 'coba1', 'coba1', NULL, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2024-10-01 08:35:10', 'coba1'),
(109, 'coba1', 'coba1', 10, 'coba1', 'coba1', '2024-10-01 08:35:10', '2024-10-01 08:35:10', 'coba1', 'coba1', NULL, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2024-10-01 08:35:10', 'coba1'),
(110, 'AST-01-10-2024-7718', 'test 1', 10, 'NOT PRIORITY', 'http://127.0.0.1:8000/storage/assets/asset_images/uNVuNGjcawn6lv95uEecx4ZSslE90p6FtsNl7fGK.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-01 02:22:33', '2024-10-01 02:22:33', NULL, 'http://127.0.0.1:8000/storage/assets/qrcodes/AST-01-10-2024-7718.png'),
(111, 'AST-03-10-2024-5487', 'test 2', 2, 'PRIORITY', 'http://127.0.0.1:8000/storage/assets/asset_images/Qz0hiPTZpejL7PlylN5QQx23wAR6MWp07nI7Lvnm.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-03 02:32:59', '2024-10-03 02:32:59', NULL, 'http://127.0.0.1:8000/storage/assets/qrcodes/AST-03-10-2024-5487.png'),
(112, 'AST-03-10-2024-7494', 'test 3', 3, 'NOT PRIORITY', 'http://127.0.0.1:8000/storage/assets/asset_images/OmbmcovwoCPa6HSFEVfN2BOI6iZtt3Kc8IrlpaQZ.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-03 02:37:29', '2024-10-03 02:37:29', NULL, 'http://127.0.0.1:8000/storage/assets/qrcodes/AST-03-10-2024-7494.png'),
(113, 'AST-03-10-2024-5037', 'test 4', 4, 'BASIC', 'http://127.0.0.1:8000/storage/assets/asset_images/Ooiw4XP7Bwsi5zW3keupVL2jEHbH2THLddx5dsf3.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-03 02:44:04', '2024-10-03 02:44:04', NULL, 'http://127.0.0.1:8000/storage/assets/qrcodes/AST-03-10-2024-5037.png'),
(114, 'AST-03-10-2024-3688', 'test 6', 6, 'NOT PRIORITY', 'http://127.0.0.1:8000/storage/assets/asset_images/n1HsPGi4sIJbwkC6UY5qESvnB2YNhuica4uSVwFO.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-03 02:51:48', '2024-10-03 02:51:48', NULL, 'http://127.0.0.1:8000/storage/assets/qrcodes/AST-03-10-2024-3688.png'),
(115, 'AST-03-10-2024-9450', 'test 7', 7, 'NOT PRIORITY', 'http://127.0.0.1:8000/storage/assets/asset_images/amTA0HOK4ABICNITzgRpTp9AFcOkBqeqHLRLJf6W.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-03 02:56:15', '2024-10-03 02:56:15', NULL, 'http://127.0.0.1:8000/storage/assets/qrcodes/AST-03-10-2024-9450.png'),
(116, 'AST-03-10-2024-7395', 'test 9', 9, 'BASIC', 'http://127.0.0.1:8000/storage/assets/asset_images/ba2gvauxoizYRcpI1yXVH3PENdevS61N8YxjgHaF.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-03 02:57:27', '2024-10-03 02:57:27', NULL, 'http://127.0.0.1:8000/storage/assets/qrcodes/AST-03-10-2024-7395.png'),
(117, 'AST-03-10-2024-7382', 'test 11', 11, 'NOT PRIORITY', 'http://127.0.0.1:8000/storage/assets/asset_images/RZhhbGXlE07Ad5LCnMIrUlcX9bjUdNP1tSMlEfjr.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-03 02:58:30', '2024-10-03 02:58:30', NULL, 'http://127.0.0.1:8000/storage/assets/qrcodes/AST-03-10-2024-7382.png'),
(118, 'AST-09-10-2024-6701', 'test 12', 19, 'BASIC', 'http://127.0.0.1:8000/storage/assets/asset_images/wP7MoWui9AV0VcztgHjoHXt6wjBuDMg9Gqour88L.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-09 03:42:02', '2024-10-09 03:42:02', NULL, 'http://127.0.0.1:8000/storage/assets/qrcodes/AST-09-10-2024-6701.png');

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_brand`
--

CREATE TABLE `m_brand` (
  `brand_id` int(11) NOT NULL,
  `brand_name` varchar(255) NOT NULL,
  `create_date` varchar(255) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `modified_by` varchar(255) DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_category`
--

CREATE TABLE `m_category` (
  `cat_id` int(11) NOT NULL,
  `cat_code` varchar(255) NOT NULL,
  `cat_name` varchar(255) NOT NULL,
  `create_date` varchar(255) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `modified_by` varchar(255) DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_checklist`
--

CREATE TABLE `m_checklist` (
  `checklist_id` int(11) NOT NULL,
  `checklist_name` varchar(255) NOT NULL,
  `create_date` varchar(255) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `modified_by` varchar(255) DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_condition`
--

CREATE TABLE `m_condition` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `condition_name` varchar(255) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `modified_by` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_control`
--

CREATE TABLE `m_control` (
  `control_id` int(11) NOT NULL,
  `control_name` varchar(255) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `modified_by` varchar(255) DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_dept`
--

CREATE TABLE `m_dept` (
  `dept_id` int(11) NOT NULL,
  `dept_name` varchar(255) NOT NULL,
  `create_date` varchar(255) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `modified_by` varchar(255) DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_division`
--

CREATE TABLE `m_division` (
  `division_id` int(11) NOT NULL,
  `division_name` varchar(255) NOT NULL,
  `create_date` varchar(255) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `modified_by` varchar(255) DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_groupuser`
--

CREATE TABLE `m_groupuser` (
  `group_id` int(11) NOT NULL,
  `group_name` varchar(255) NOT NULL,
  `group_roles` varchar(255) NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `modified_by` varchar(255) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_joblevel`
--

CREATE TABLE `m_joblevel` (
  `joblevel_id` int(11) NOT NULL,
  `joblevel_name` varchar(255) NOT NULL,
  `create_date` varchar(255) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `modified_by` varchar(255) DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_layout`
--

CREATE TABLE `m_layout` (
  `layout_id` int(11) NOT NULL,
  `layout_code` varchar(255) NOT NULL,
  `layout_name` varchar(255) NOT NULL,
  `create_date` varchar(255) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `modified_by` varchar(255) DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_location`
--

CREATE TABLE `m_location` (
  `loc_id` int(11) NOT NULL,
  `loc_code` varchar(255) NOT NULL,
  `loc_name` varchar(255) NOT NULL,
  `loc_city` varchar(255) DEFAULT NULL,
  `loc_address` varchar(255) DEFAULT NULL,
  `loc_distric` varchar(255) DEFAULT NULL,
  `loc_vilage` varchar(255) DEFAULT NULL,
  `region_id` int(11) NOT NULL,
  `loc_latitude` varchar(255) DEFAULT NULL,
  `loc_longitude` varchar(255) DEFAULT NULL,
  `create_date` varchar(255) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `modified_by` varchar(255) DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_mtc`
--

CREATE TABLE `m_mtc` (
  `mtc_id` int(11) NOT NULL,
  `mtc_name` varchar(255) NOT NULL,
  `create_date` varchar(255) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `modified_by` varchar(255) DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_people`
--

CREATE TABLE `m_people` (
  `people_id` int(11) NOT NULL,
  `people_nickme` varchar(255) DEFAULT NULL,
  `people_fullname` varchar(255) DEFAULT NULL,
  `people_email` varchar(255) DEFAULT NULL,
  `people_whatsapp` varchar(255) DEFAULT NULL,
  `dvision_id` int(11) DEFAULT NULL,
  `dept_id` int(11) DEFAULT NULL,
  `joblevel_id` int(11) DEFAULT NULL,
  `region_id` int(11) DEFAULT NULL,
  `loc_id` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `modified_by` varchar(255) DEFAULT NULL,
  `is_active` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_periodic_mtc`
--

CREATE TABLE `m_periodic_mtc` (
  `periodic_mtc_id` int(11) NOT NULL,
  `periodic_mtc_name` varchar(255) DEFAULT NULL,
  `periodic_mtc_day` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `modified_by` varchar(255) DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_priority`
--

CREATE TABLE `m_priority` (
  `priority_id` int(11) NOT NULL,
  `priority_code` varchar(255) NOT NULL,
  `priority_name` varchar(255) NOT NULL,
  `create_date` varchar(255) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `modified_by` varchar(255) DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_reason`
--

CREATE TABLE `m_reason` (
  `reason_id` int(11) NOT NULL,
  `reason_name` varchar(255) NOT NULL,
  `create_date` varchar(255) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `modified_by` varchar(255) DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_region`
--

CREATE TABLE `m_region` (
  `region_id` int(11) NOT NULL,
  `region_code` varchar(255) NOT NULL,
  `region_name` varchar(255) NOT NULL,
  `create_date` varchar(255) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `modified_by` varchar(255) DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_repair`
--

CREATE TABLE `m_repair` (
  `repair_id` int(11) NOT NULL,
  `repair_name` varchar(255) NOT NULL,
  `create_date` varchar(255) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `modified_by` varchar(255) DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_supplier`
--

CREATE TABLE `m_supplier` (
  `supplier_id` int(11) NOT NULL,
  `supplier_code` varchar(255) NOT NULL,
  `supplier_name` varchar(255) NOT NULL,
  `supplier_address` varchar(255) DEFAULT NULL,
  `create_date` varchar(255) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `modified_by` varchar(255) DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_type`
--

CREATE TABLE `m_type` (
  `type_id` int(11) NOT NULL,
  `type_code` varchar(255) NOT NULL,
  `type_name` varchar(255) NOT NULL,
  `create_date` varchar(255) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `modified_by` varchar(255) DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_uom`
--

CREATE TABLE `m_uom` (
  `uom_id` int(11) NOT NULL,
  `uom_name` varchar(255) NOT NULL,
  `create_date` varchar(255) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `modified_by` varchar(255) DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_user`
--

CREATE TABLE `m_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `m_user`
--

INSERT INTO `m_user` (`id`, `username`, `password`, `role`, `created_at`, `updated_at`) VALUES
(1, 'coba', 'c3ec0f7b054e729c5a716c8125839829', 'admin', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_warranty`
--

CREATE TABLE `m_warranty` (
  `warranty_id` int(11) NOT NULL,
  `warranty_name` varchar(255) DEFAULT NULL,
  `warranty_day` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `modified_by` varchar(255) DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'role-list', 'web', '2024-10-08 23:38:14', '2024-10-08 23:38:14'),
(2, 'role-create', 'web', '2024-10-08 23:38:14', '2024-10-08 23:38:14'),
(3, 'role-edit', 'web', '2024-10-08 23:38:14', '2024-10-08 23:38:14'),
(4, 'role-delete', 'web', '2024-10-08 23:38:14', '2024-10-08 23:38:14'),
(5, 'product-list', 'web', '2024-10-08 23:38:14', '2024-10-08 23:38:14'),
(6, 'product-create', 'web', '2024-10-08 23:38:14', '2024-10-08 23:38:14'),
(7, 'product-edit', 'web', '2024-10-08 23:38:14', '2024-10-08 23:38:14'),
(8, 'product-delete', 'web', '2024-10-08 23:38:14', '2024-10-08 23:38:14');

-- --------------------------------------------------------

--
-- Struktur dari tabel `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `detail` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `products`
--

INSERT INTO `products` (`id`, `name`, `detail`, `created_at`, `updated_at`) VALUES
(1, 'test1', 'test1', '2024-10-09 00:09:10', '2024-10-09 00:09:10');

-- --------------------------------------------------------

--
-- Struktur dari tabel `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'web', '2024-10-08 23:38:45', '2024-10-08 23:38:45'),
(3, 'Guest', 'web', '2024-10-09 00:02:04', '2024-10-09 00:02:04');

-- --------------------------------------------------------

--
-- Struktur dari tabel `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 3),
(2, 1),
(2, 3),
(3, 1),
(4, 1),
(5, 1),
(5, 3),
(6, 1),
(6, 3),
(7, 1),
(8, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('vF5hBnOEZJnVsFDdWlCXMqgzUcmdmyCH1gQXCLvK', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:132.0) Gecko/20100101 Firefox/132.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ3h1czdoU0pneTJqWE84NXpmdlVtcEYyOUppeGN3WlYzSTJjMEdXeiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fX0=', 1728959383),
('wwfSm8vczrsXyL2oCgvZUohoWiV8PqNoDYXHN3Ug', 1, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:132.0) Gecko/20100101 Firefox/132.0', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiMFlaWk5PVnlUNXM4YzRnWnBsMm1qQnNZZFp2aUNpUVU1bThMWFBqayI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9wcm9kdWN0cyI7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7czo0OiJhdXRoIjthOjE6e3M6MjE6InBhc3N3b3JkX2NvbmZpcm1lZF9hdCI7aToxNzI4NDU3NjY2O319', 1728458317);

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_checklist_detail`
--

CREATE TABLE `t_checklist_detail` (
  `trx_checklist_det_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_checklist_header`
--

CREATE TABLE `t_checklist_header` (
  `trx_checklist_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_registration`
--

CREATE TABLE `t_registration` (
  `reg_id` int(11) NOT NULL,
  `reg_number` varchar(255) DEFAULT NULL,
  `reg_code` varchar(255) DEFAULT NULL,
  `asset_id` int(11) DEFAULT NULL,
  `serial_number` varchar(255) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  `cat_id` int(11) DEFAULT NULL,
  `priority_id` int(11) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `uom_id` int(11) DEFAULT NULL,
  `loc_id` int(11) DEFAULT NULL,
  `layout_id` int(11) DEFAULT NULL,
  `reg_date` datetime DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `purchase_number` varchar(255) DEFAULT NULL,
  `purchase_date` datetime DEFAULT NULL,
  `waranty` varchar(255) DEFAULT NULL,
  `warranty_id` int(11) DEFAULT NULL,
  `periodic_mtc_id` int(11) DEFAULT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `modified_by` varchar(255) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'coba 1', 'stefanusandre07@gmail.com', NULL, '$2y$12$YkbYYBXBfH2K3BLX194HJ..xC5eq057KwFQijqBB7NMXx4Pp3iWn2', NULL, '2024-10-08 21:32:09', '2024-10-08 21:32:09'),
(2, 'Hardik Savani', 'admin@gmail.com', NULL, '$2y$12$NAfJh32vsVg7.BvE9RfCEuJq7yZZFE4zlmhbgx4UtD/8dKKxZXB/O', NULL, '2024-10-08 23:38:45', '2024-10-08 23:38:45');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_models`
--

CREATE TABLE `user_models` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indeks untuk tabel `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indeks untuk tabel `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `mc_approval`
--
ALTER TABLE `mc_approval`
  ADD PRIMARY KEY (`approval_id`) USING BTREE;

--
-- Indeks untuk tabel `mc_asset_checklist`
--
ALTER TABLE `mc_asset_checklist`
  ADD KEY `asset_id` (`asset_id`) USING BTREE,
  ADD KEY `checklist_id` (`checklist_id`) USING BTREE,
  ADD KEY `control_id` (`control_id`) USING BTREE;

--
-- Indeks untuk tabel `mc_asset_mtc`
--
ALTER TABLE `mc_asset_mtc`
  ADD KEY `asset_id` (`asset_id`) USING BTREE,
  ADD KEY `mtc_id` (`mtc_id`) USING BTREE;

--
-- Indeks untuk tabel `mc_bom_detail`
--
ALTER TABLE `mc_bom_detail`
  ADD PRIMARY KEY (`bom_det_id`) USING BTREE,
  ADD KEY `bom_id` (`bom_id`) USING BTREE,
  ADD KEY `asset_id` (`asset_id`) USING BTREE,
  ADD KEY `brand_id` (`brand_id`) USING BTREE,
  ADD KEY `uom_id` (`uom_id`) USING BTREE;

--
-- Indeks untuk tabel `mc_bom_header`
--
ALTER TABLE `mc_bom_header`
  ADD PRIMARY KEY (`bom_id`) USING BTREE,
  ADD KEY `asset_id` (`asset_id`) USING BTREE,
  ADD KEY `brand_id` (`brand_id`) USING BTREE;

--
-- Indeks untuk tabel `mc_mtc`
--
ALTER TABLE `mc_mtc`
  ADD PRIMARY KEY (`mtc_conf_id`) USING BTREE;

--
-- Indeks untuk tabel `mc_notif`
--
ALTER TABLE `mc_notif`
  ADD PRIMARY KEY (`notif_id`) USING BTREE;

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indeks untuk tabel `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indeks untuk tabel `m_assets`
--
ALTER TABLE `m_assets`
  ADD PRIMARY KEY (`asset_id`);

--
-- Indeks untuk tabel `m_brand`
--
ALTER TABLE `m_brand`
  ADD PRIMARY KEY (`brand_id`) USING BTREE;

--
-- Indeks untuk tabel `m_category`
--
ALTER TABLE `m_category`
  ADD PRIMARY KEY (`cat_id`) USING BTREE;

--
-- Indeks untuk tabel `m_checklist`
--
ALTER TABLE `m_checklist`
  ADD PRIMARY KEY (`checklist_id`) USING BTREE;

--
-- Indeks untuk tabel `m_condition`
--
ALTER TABLE `m_condition`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `m_control`
--
ALTER TABLE `m_control`
  ADD PRIMARY KEY (`control_id`) USING BTREE;

--
-- Indeks untuk tabel `m_dept`
--
ALTER TABLE `m_dept`
  ADD PRIMARY KEY (`dept_id`) USING BTREE;

--
-- Indeks untuk tabel `m_division`
--
ALTER TABLE `m_division`
  ADD PRIMARY KEY (`division_id`) USING BTREE;

--
-- Indeks untuk tabel `m_groupuser`
--
ALTER TABLE `m_groupuser`
  ADD PRIMARY KEY (`group_id`) USING BTREE;

--
-- Indeks untuk tabel `m_joblevel`
--
ALTER TABLE `m_joblevel`
  ADD PRIMARY KEY (`joblevel_id`) USING BTREE;

--
-- Indeks untuk tabel `m_layout`
--
ALTER TABLE `m_layout`
  ADD PRIMARY KEY (`layout_id`) USING BTREE;

--
-- Indeks untuk tabel `m_location`
--
ALTER TABLE `m_location`
  ADD PRIMARY KEY (`loc_id`) USING BTREE;

--
-- Indeks untuk tabel `m_mtc`
--
ALTER TABLE `m_mtc`
  ADD PRIMARY KEY (`mtc_id`) USING BTREE;

--
-- Indeks untuk tabel `m_people`
--
ALTER TABLE `m_people`
  ADD PRIMARY KEY (`people_id`) USING BTREE;

--
-- Indeks untuk tabel `m_periodic_mtc`
--
ALTER TABLE `m_periodic_mtc`
  ADD PRIMARY KEY (`periodic_mtc_id`) USING BTREE;

--
-- Indeks untuk tabel `m_priority`
--
ALTER TABLE `m_priority`
  ADD PRIMARY KEY (`priority_id`) USING BTREE;

--
-- Indeks untuk tabel `m_reason`
--
ALTER TABLE `m_reason`
  ADD PRIMARY KEY (`reason_id`) USING BTREE;

--
-- Indeks untuk tabel `m_region`
--
ALTER TABLE `m_region`
  ADD PRIMARY KEY (`region_id`) USING BTREE;

--
-- Indeks untuk tabel `m_repair`
--
ALTER TABLE `m_repair`
  ADD PRIMARY KEY (`repair_id`) USING BTREE;

--
-- Indeks untuk tabel `m_supplier`
--
ALTER TABLE `m_supplier`
  ADD PRIMARY KEY (`supplier_id`) USING BTREE;

--
-- Indeks untuk tabel `m_type`
--
ALTER TABLE `m_type`
  ADD PRIMARY KEY (`type_id`) USING BTREE;

--
-- Indeks untuk tabel `m_uom`
--
ALTER TABLE `m_uom`
  ADD PRIMARY KEY (`uom_id`) USING BTREE;

--
-- Indeks untuk tabel `m_user`
--
ALTER TABLE `m_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `m_user_username_unique` (`username`);

--
-- Indeks untuk tabel `m_warranty`
--
ALTER TABLE `m_warranty`
  ADD PRIMARY KEY (`warranty_id`) USING BTREE;

--
-- Indeks untuk tabel `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indeks untuk tabel `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indeks untuk tabel `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indeks untuk tabel `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indeks untuk tabel `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indeks untuk tabel `t_checklist_detail`
--
ALTER TABLE `t_checklist_detail`
  ADD PRIMARY KEY (`trx_checklist_det_id`) USING BTREE;

--
-- Indeks untuk tabel `t_checklist_header`
--
ALTER TABLE `t_checklist_header`
  ADD PRIMARY KEY (`trx_checklist_id`) USING BTREE;

--
-- Indeks untuk tabel `t_registration`
--
ALTER TABLE `t_registration`
  ADD PRIMARY KEY (`reg_id`) USING BTREE,
  ADD KEY `asset_id` (`asset_id`) USING BTREE,
  ADD KEY `type_id` (`type_id`) USING BTREE,
  ADD KEY `cat_id` (`cat_id`) USING BTREE,
  ADD KEY `priority_id` (`priority_id`) USING BTREE,
  ADD KEY `brand_id` (`brand_id`) USING BTREE,
  ADD KEY `uom_id` (`uom_id`) USING BTREE,
  ADD KEY `loc_id` (`loc_id`) USING BTREE,
  ADD KEY `layout_id` (`layout_id`) USING BTREE,
  ADD KEY `supplier_id` (`supplier_id`) USING BTREE,
  ADD KEY `warranty_id` (`warranty_id`) USING BTREE,
  ADD KEY `periodic_mtc_id` (`periodic_mtc_id`) USING BTREE;

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indeks untuk tabel `user_models`
--
ALTER TABLE `user_models`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `m_assets`
--
ALTER TABLE `m_assets`
  MODIFY `asset_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=119;

--
-- AUTO_INCREMENT untuk tabel `m_condition`
--
ALTER TABLE `m_condition`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `m_user`
--
ALTER TABLE `m_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `user_models`
--
ALTER TABLE `user_models`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
