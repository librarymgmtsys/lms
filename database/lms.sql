-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 06, 2020 at 02:28 AM
-- Server version: 10.1.44-MariaDB-0ubuntu0.18.04.1
-- PHP Version: 7.2.24-0ubuntu0.18.04.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lms`
--
CREATE DATABASE IF NOT EXISTS `lms` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `lms`;

-- --------------------------------------------------------

--
-- Table structure for table `announcements`
--

CREATE TABLE `announcements` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Truncate table before insert `announcements`
--

TRUNCATE TABLE `announcements`;
--
-- Dumping data for table `announcements`
--

INSERT INTO `announcements` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Implementation Auto Zoom Functionally', '2020-05-31 04:46:38', '2020-05-31 04:46:51', '2020-05-31 04:46:51'),
(2, 'Moving of area out of boundaries', '2020-05-31 04:46:56', '2020-05-31 04:46:56', NULL),
(3, 'Moving of area out of boundaries', '2020-05-31 04:47:00', '2020-05-31 04:47:00', NULL),
(4, 'Moving of area out of boundaries', '2020-05-31 04:47:04', '2020-05-31 04:47:04', NULL),
(5, 'Implementation Auto Zoom Functionally', '2020-05-31 04:47:08', '2020-05-31 04:47:08', NULL),
(6, 'Maths', '2020-05-31 04:47:15', '2020-05-31 04:47:15', NULL),
(7, '@todo Update', '2020-05-31 04:47:19', '2020-05-31 04:47:19', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `id` int(11) NOT NULL,
  `lang_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `lms_book_id` varchar(45) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `isbn` varchar(45) NOT NULL,
  `copies` int(11) DEFAULT '0',
  `default_issue_days` int(11) DEFAULT '7',
  `available_copies` int(11) DEFAULT '0',
  `publication_year` int(11) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `remarks` varchar(1024) DEFAULT NULL,
  `fine` double(10,2) NOT NULL DEFAULT '1.00',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Truncate table before insert `books`
--

TRUNCATE TABLE `books`;
--
-- Dumping data for table `books`
--

INSERT INTO `books` (`id`, `lang_id`, `category_id`, `lms_book_id`, `name`, `isbn`, `copies`, `default_issue_days`, `available_copies`, `publication_year`, `author`, `remarks`, `fine`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 5, 'LMS-1', 'Testing', '123331dd3333123', 60, 7, 58, 2020, 'Ronak Bokaria', 'Description Description DescriptionDescription Description DescriptionDescription Description DescriptionDescription Description DescriptionDescription Description DescriptionDescription Description DescriptionDescription Description DescriptionDescription Description DescriptionDescription Description DescriptionDescription Description DescriptionDescription Description DescriptionDescription Description DescriptionDescription Description DescriptionDescription Description DescriptionDescription Description Description', 1.00, '2020-05-31 12:46:41', '2020-06-05 15:24:49', NULL),
(2, 1, 5, 'LMS-2', 'Moving of area out of boundaries', '132435467665534323245', 55, 5, 56, 1234, 'RDM', 'Moving of area out of boundaries \r\nMoving of area out of boundaries \r\nMoving of area out of boundaries Moving of area out of boundaries \r\nMoving of area out of boundaries Moving of area out of boundaries', 1.00, '2020-05-31 08:44:36', '2020-06-05 13:44:13', NULL),
(3, 3, 10, 'LMS-3', 'Maths', '123331dd3333123', 60, 4, 61, 2020, 'Ronak Bokaria', 'Route::get(\'books/bookhistory/{book}\', \'BooksController@bookHistory\')->name(\'books.bookHistory\');', 1.00, '2020-05-31 09:22:59', '2020-06-05 13:44:30', NULL),
(4, 1, 5, 'LMS-4', 'Maths1222', '123331dd3eweeeee333123', 1, 3, 2, 2020, 'Ronak Bokaria', 'Maths1222', 1.00, '2020-06-01 08:05:10', '2020-06-05 13:44:24', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `book_issues`
--

CREATE TABLE `book_issues` (
  `id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `user_id` varchar(45) DEFAULT NULL,
  `issue_date_from` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `issue_date_to` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `received_date` timestamp NULL DEFAULT NULL,
  `issued_by` int(11) DEFAULT NULL,
  `remarks_at_issue` varchar(1024) DEFAULT NULL,
  `remarks_at_receive` varchar(1024) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Truncate table before insert `book_issues`
--

TRUNCATE TABLE `book_issues`;
--
-- Dumping data for table `book_issues`
--

INSERT INTO `book_issues` (`id`, `book_id`, `user_id`, `issue_date_from`, `issue_date_to`, `received_date`, `issued_by`, `remarks_at_issue`, `remarks_at_receive`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 3, '1', '2020-06-04 17:03:28', '2020-06-01 18:30:00', '2020-06-30 11:33:28', 1, NULL, 'received_date received_date received_date', '2020-05-31 12:07:42', '2020-06-04 11:33:28', NULL),
(2, 2, '1', '2020-06-05 18:11:18', '2020-05-30 18:30:00', '2020-06-06 12:41:17', 1, 'Book Book Book Book Book Book Book Book Book Book Book Book Book Book Book Book Book Book Book Book Book Book Book Book Book Book Book Book Book Book Book Book Book Book Book Book Book Book Book Book Book Book Book Book Book Book Book Book Book Book Book Book Book Book Book Book Book Book Book Book Book Book Book Book Book Book Book Book Book Book Book', '<input type=\"hidden\" name=\"tt\" id=\"tt\" value=\"{{$from??\'\'}}\">', '2020-05-31 12:11:10', '2020-06-05 12:41:18', NULL),
(3, 2, '1', '2020-06-05 19:13:47', '2020-05-30 18:30:00', '2020-06-18 13:43:47', 1, '1024 1024 1024 10241024 10241024 10241024 10241024 10241024 10241024 10241024 10241024 10241024 10241024 10241024 10241024 10241024 10241024 1024', 'book_id', '2020-05-31 12:11:51', '2020-06-05 13:43:47', NULL),
(4, 1, '1', '2020-06-05 19:14:07', '2020-06-25 18:30:00', '2020-06-26 13:44:07', 1, '55', 'book_id', '2020-05-31 12:24:33', '2020-06-05 13:44:07', NULL),
(5, 2, '1', '2020-06-05 19:14:13', '2020-05-30 18:30:00', '2020-06-11 13:44:13', 1, '$product->available_copies', 'book_id', '2020-05-31 12:27:20', '2020-06-05 13:44:13', NULL),
(6, 3, '1', '2020-06-05 19:13:38', '2020-06-15 18:30:00', '2020-06-17 13:43:38', 1, '2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020  2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020', 'book_id', '2020-06-01 08:01:01', '2020-06-05 13:43:38', NULL),
(7, 3, '1', '2020-06-05 19:14:19', '2020-06-23 18:30:00', '2020-06-27 13:44:18', 1, '2020', 'book_id', '2020-06-01 08:01:58', '2020-06-05 13:44:19', NULL),
(8, 4, '1', '2020-06-03 19:15:40', '2020-06-24 18:30:00', '2020-06-30 13:45:40', 1, 'Maths1222Maths1222Maths1222Maths1222Maths1222', 'available_copies  available_copiesavailable_copies', '2020-06-01 08:05:57', '2020-06-03 13:45:40', NULL),
(9, 3, '1', '2020-06-05 19:14:30', '2020-06-04 12:29:47', '2020-06-18 13:44:30', 1, 'data data data', 'book_id', '2020-06-04 12:29:47', '2020-06-05 13:44:30', NULL),
(10, 4, '1', '2020-06-05 19:14:23', '2020-06-06 12:05:22', '2020-06-10 13:44:23', 1, 'dt-buttons', 'book_id', '2020-06-05 12:05:22', '2020-06-05 13:44:23', NULL),
(11, 1, '1', '2020-06-06 15:24:49', '2020-06-06 15:24:49', NULL, 1, 'auth()->getUser()', NULL, '2020-06-05 15:24:49', '2020-06-05 15:24:49', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Truncate table before insert `category`
--

TRUNCATE TABLE `category`;
--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Maths', '2020-05-31 03:41:52', '2020-05-31 04:23:43', '2020-05-31 04:23:43'),
(2, 'Maths 1', '2020-05-31 03:42:56', '2020-05-31 04:23:43', '2020-05-31 04:23:43'),
(3, 'Englishsss', '2020-05-31 03:43:06', '2020-05-31 04:23:43', '2020-05-31 04:23:43'),
(4, 'Love and Scine', '2020-05-31 03:43:15', '2020-05-31 04:33:55', '2020-05-31 04:33:55'),
(5, 'Horror', '2020-05-31 03:43:22', '2020-05-31 03:43:22', NULL),
(6, 'P', '2020-05-31 03:43:32', '2020-05-31 04:19:47', '2020-05-31 04:19:47'),
(7, 'Maths', '2020-05-31 05:01:54', '2020-05-31 05:01:54', NULL),
(8, 'Science', '2020-05-31 05:02:08', '2020-05-31 05:02:08', NULL),
(9, 'History', '2020-05-31 05:02:17', '2020-05-31 05:02:17', NULL),
(10, 'Legacy', '2020-05-31 05:02:41', '2020-05-31 05:02:41', NULL),
(11, 'Biography', '2020-05-31 05:03:05', '2020-05-31 05:03:05', NULL),
(12, 'Autobiography', '2020-05-31 05:03:20', '2020-05-31 05:03:20', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Truncate table before insert `failed_jobs`
--

TRUNCATE TABLE `failed_jobs`;
-- --------------------------------------------------------

--
-- Table structure for table `fines`
--

CREATE TABLE `fines` (
  `id` int(11) NOT NULL,
  `book_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `amount` float(10,2) DEFAULT '0.00',
  `remarks` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Truncate table before insert `fines`
--

TRUNCATE TABLE `fines`;
--
-- Dumping data for table `fines`
--

INSERT INTO `fines` (`id`, `book_id`, `user_id`, `amount`, `remarks`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, 555.00, 'Testing', '2020-05-31 07:20:17', '2020-05-31 07:20:17', NULL),
(2, 4, 1, 5.00, 'System Genrated Fine: fine on \"Maths1222\" for delay of 5 Day(s).', '2020-06-03 13:40:37', '2020-06-03 13:40:37', NULL),
(3, 4, 1, 26.00, 'System Genrated Fine: fine on \"Maths1222\" for delay of 26 Day(s).', '2020-06-03 13:42:44', '2020-06-03 13:42:44', NULL),
(4, 4, 1, 26.00, 'System Genrated Fine: fine on \"Maths1222\" for delay of 26 Day(s).', '2020-06-03 13:45:40', '2020-06-03 13:45:40', NULL),
(5, 3, 1, 30.00, 'System Genrated Fine: fine on \"Maths\" for delay of 30 Day(s).', '2020-06-04 11:33:28', '2020-06-04 11:33:28', NULL),
(6, 2, 1, 6.00, 'System Genrated Fine: fine on \"Moving of area out of boundaries\" for delay of 6 Day(s).', '2020-06-05 12:41:17', '2020-06-05 12:41:17', NULL),
(7, 3, 1, 1.00, 'System Genrated Fine: fine on \"Maths\" for delay of 8 Day(s).', '2020-06-05 13:43:38', '2020-06-05 13:43:38', NULL),
(8, 2, 1, 18.00, 'System Genrated Fine: fine on \"Moving of area out of boundaries\" for delay of 18 Day(s).', '2020-06-05 13:43:47', '2020-06-05 13:43:47', NULL),
(9, 2, 1, 11.00, 'System Genrated Fine: fine on \"Moving of area out of boundaries\" for delay of 11 Day(s).', '2020-06-05 13:44:13', '2020-06-05 13:44:13', NULL),
(10, 3, 1, 3.00, 'System Genrated Fine: fine on \"Maths\" for delay of 13 Day(s).', '2020-06-05 13:44:18', '2020-06-05 13:44:18', NULL),
(11, 4, 1, 4.00, 'System Genrated Fine: fine on \"Maths1222\" for delay of 5 Day(s).', '2020-06-05 13:44:23', '2020-06-05 13:44:23', NULL),
(12, 3, 1, 14.00, 'System Genrated Fine: fine on \"Maths\" for delay of 14 Day(s).', '2020-06-05 13:44:30', '2020-06-05 13:44:30', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `lang`
--

CREATE TABLE `lang` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Truncate table before insert `lang`
--

TRUNCATE TABLE `lang`;
--
-- Dumping data for table `lang`
--

INSERT INTO `lang` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'English', '2020-05-31 05:33:57', '2020-05-31 05:33:57', NULL),
(2, 'Russian', '2020-05-31 05:34:05', '2020-05-31 05:34:05', NULL),
(3, 'Spanish', '2020-05-31 05:34:14', '2020-05-31 05:34:14', NULL),
(4, 'Urdu', '2020-05-31 05:34:21', '2020-05-31 05:34:21', NULL),
(5, 'Sansrik', '2020-05-31 05:34:31', '2020-05-31 05:34:31', NULL),
(6, 'Ronak Bokaria', '2020-06-01 07:51:33', '2020-06-01 08:07:06', '2020-06-01 08:07:06');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Truncate table before insert `migrations`
--

TRUNCATE TABLE `migrations`;
--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_100000_create_password_resets_table', 1),
(2, '2019_04_15_191331679173_create_1555355612601_permissions_table', 1),
(3, '2019_04_15_191331731390_create_1555355612581_roles_table', 1),
(4, '2019_04_15_191331779537_create_1555355612782_users_table', 1),
(5, '2019_04_15_191332603432_create_1555355612603_permission_role_pivot_table', 1),
(6, '2019_04_15_191332791021_create_1555355612790_role_user_pivot_table', 1),
(7, '2019_04_15_191441675085_create_1555355681975_products_table', 1),
(8, '2019_08_19_000000_create_failed_jobs_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Truncate table before insert `password_resets`
--

TRUNCATE TABLE `password_resets`;
-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Truncate table before insert `permissions`
--

TRUNCATE TABLE `permissions`;
--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `title`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'user_management_access', '2019-04-15 13:44:42', '2019-04-15 13:44:42', NULL),
(2, 'permission_create', '2019-04-15 13:44:42', '2019-04-15 13:44:42', NULL),
(3, 'permission_edit', '2019-04-15 13:44:42', '2019-04-15 13:44:42', NULL),
(4, 'permission_show', '2019-04-15 13:44:42', '2019-04-15 13:44:42', NULL),
(5, 'permission_delete', '2019-04-15 13:44:42', '2019-04-15 13:44:42', NULL),
(6, 'permission_access', '2019-04-15 13:44:42', '2019-04-15 13:44:42', NULL),
(7, 'role_create', '2019-04-15 13:44:42', '2019-04-15 13:44:42', NULL),
(8, 'role_edit', '2019-04-15 13:44:42', '2019-04-15 13:44:42', NULL),
(9, 'role_show', '2019-04-15 13:44:42', '2019-04-15 13:44:42', NULL),
(10, 'role_delete', '2019-04-15 13:44:42', '2019-04-15 13:44:42', NULL),
(11, 'role_access', '2019-04-15 13:44:42', '2019-04-15 13:44:42', NULL),
(12, 'user_create', '2019-04-15 13:44:42', '2019-04-15 13:44:42', NULL),
(13, 'user_edit', '2019-04-15 13:44:42', '2019-04-15 13:44:42', NULL),
(14, 'user_show', '2019-04-15 13:44:42', '2019-04-15 13:44:42', NULL),
(15, 'user_delete', '2019-04-15 13:44:42', '2019-04-15 13:44:42', NULL),
(16, 'user_access', '2019-04-15 13:44:42', '2019-04-15 13:44:42', NULL),
(17, 'product_create', '2019-04-15 13:44:42', '2019-04-15 13:44:42', NULL),
(18, 'product_edit', '2019-04-15 13:44:42', '2019-04-15 13:44:42', NULL),
(19, 'product_show', '2019-04-15 13:44:42', '2019-04-15 13:44:42', NULL),
(20, 'product_delete', '2019-04-15 13:44:42', '2019-04-15 13:44:42', NULL),
(21, 'product_access', '2019-04-15 13:44:42', '2019-04-15 13:44:42', NULL),
(22, 'category_create', '2019-04-15 13:44:42', '2019-04-15 13:44:42', NULL),
(23, 'category_edit', '2019-04-15 13:44:42', '2019-04-15 13:44:42', NULL),
(24, 'category_show', '2019-04-15 13:44:42', '2019-04-15 13:44:42', NULL),
(25, 'category_delete', '2019-04-15 13:44:42', '2019-04-15 13:44:42', NULL),
(26, 'category_access', '2019-04-15 13:44:42', '2019-04-15 13:44:42', NULL),
(27, 'announcement_create', '2019-04-15 13:44:42', '2019-04-15 13:44:42', NULL),
(28, 'announcement_edit', '2019-04-15 13:44:42', '2019-04-15 13:44:42', NULL),
(29, 'announcement_show', '2019-04-15 13:44:42', '2019-04-15 13:44:42', NULL),
(30, 'announcement_delete', '2019-04-15 13:44:42', '2019-04-15 13:44:42', NULL),
(31, 'announcement_access', '2019-04-15 13:44:42', '2019-04-15 13:44:42', NULL),
(32, 'language_create', '2019-04-15 13:44:42', '2019-04-15 13:44:42', NULL),
(33, 'language_edit', '2019-04-15 13:44:42', '2019-04-15 13:44:42', NULL),
(34, 'language_show', '2019-04-15 13:44:42', '2019-04-15 13:44:42', NULL),
(35, 'language_delete', '2019-04-15 13:44:42', '2019-04-15 13:44:42', NULL),
(36, 'language_access', '2019-04-15 13:44:42', '2019-04-15 13:44:42', NULL),
(37, 'fines_create', '2019-04-15 13:44:42', '2019-04-15 13:44:42', NULL),
(38, 'fines_edit', '2019-04-15 13:44:42', '2019-04-15 13:44:42', NULL),
(39, 'fines_show', '2019-04-15 13:44:42', '2019-04-15 13:44:42', NULL),
(40, 'fines_delete', '2019-04-15 13:44:42', '2019-04-15 13:44:42', NULL),
(41, 'fines_access', '2019-04-15 13:44:42', '2019-04-15 13:44:42', NULL),
(42, 'books_create', '2019-04-15 13:44:42', '2019-04-15 13:44:42', NULL),
(43, 'books_edit', '2019-04-15 13:44:42', '2019-04-15 13:44:42', NULL),
(45, 'books_show', '2019-04-15 13:44:42', '2019-04-15 13:44:42', NULL),
(46, 'books_delete', '2019-04-15 13:44:42', '2019-04-15 13:44:42', NULL),
(47, 'books_access', '2019-04-15 13:44:42', '2019-04-15 13:44:42', NULL),
(48, 'books_issue', '2019-04-15 13:44:42', '2019-04-15 13:44:42', NULL),
(49, 'books_history', '2019-04-15 13:44:42', '2019-04-15 13:44:42', NULL),
(50, 'books_receive', '2019-04-15 13:44:42', '2019-04-15 13:44:42', NULL),
(51, 'books_issue_create', '2019-04-15 13:44:42', '2019-04-15 13:44:42', NULL),
(52, 'books_issue_edit', '2019-04-15 13:44:42', '2019-04-15 13:44:42', NULL),
(53, 'books_issue_show', '2019-04-15 13:44:42', '2019-04-15 13:44:42', NULL),
(54, 'books_issue_delete', '2019-04-15 13:44:42', '2019-04-15 13:44:42', NULL),
(55, 'books_issue_access', '2019-04-15 13:44:42', '2019-04-15 13:44:42', NULL),
(56, 'reports_all_books', '2019-04-15 13:44:42', '2019-04-15 13:44:42', NULL),
(57, 'reports_current_issued', '2019-04-15 13:44:42', '2019-04-15 13:44:42', NULL),
(58, 'reports_total_issued', '2019-04-15 13:44:42', '2019-04-15 13:44:42', NULL),
(59, 'reports_total_fine_received', '2019-04-15 13:44:42', '2019-04-15 13:44:42', NULL),
(60, 'reports_total_fine_pending', '2019-04-15 13:44:42', '2019-04-15 13:44:42', NULL),
(61, 'reports_today_receive_books', '2019-04-15 13:44:42', '2019-04-15 13:44:42', NULL),
(62, 'user_current_issued', '2019-04-15 13:44:42', '2019-04-15 13:44:42', NULL),
(63, 'user_total_issued', '2019-04-15 13:44:42', '2019-04-15 13:44:42', NULL),
(64, 'user_total_fine_received', '2019-04-15 13:44:42', '2019-04-15 13:44:42', NULL),
(65, 'user_total_fine_pending', '2019-04-15 13:44:42', '2019-04-15 13:44:42', NULL),
(66, 'user_today_receive_books', '2019-04-15 13:44:42', '2019-04-15 13:44:42', NULL),
(67, 'reports_last_10_fines', '2019-04-15 13:44:42', '2019-04-15 13:44:42', NULL),
(68, 'reports_last_10_issue', '2019-04-15 13:44:42', '2019-04-15 13:44:42', NULL),
(69, 'reports_last_10_receive', '2019-04-15 13:44:42', '2019-04-15 13:44:42', NULL),
(70, 'my_books', '2019-04-15 13:44:42', '2019-04-15 13:44:42', NULL),
(71, 'submit_today', '2019-04-15 13:44:42', '2019-04-15 13:44:42', NULL),
(72, 'under_fine', '2019-04-15 13:44:42', '2019-04-15 13:44:42', NULL),
(73, 'my_fine', '2019-04-15 13:44:42', '2019-04-15 13:44:42', NULL),
(74, 'books_management', '2020-06-05 11:15:55', '2020-06-05 11:15:55', NULL),
(75, 'available_books', '2020-06-05 11:23:07', '2020-06-05 11:23:07', NULL),
(76, 'self_book_issue', '2020-06-05 11:36:00', '2020-06-05 11:36:00', NULL),
(77, 'self_book_submit', '2020-06-05 11:36:11', '2020-06-05 11:36:11', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `role_id` int(10) UNSIGNED NOT NULL,
  `permission_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Truncate table before insert `permission_role`
--

TRUNCATE TABLE `permission_role`;
--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`role_id`, `permission_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 10),
(1, 11),
(1, 12),
(1, 13),
(1, 14),
(1, 15),
(1, 16),
(1, 17),
(1, 18),
(1, 19),
(1, 20),
(1, 21),
(1, 22),
(1, 23),
(1, 24),
(1, 25),
(1, 26),
(1, 27),
(1, 28),
(1, 29),
(1, 30),
(1, 31),
(2, 29),
(2, 31),
(1, 32),
(1, 33),
(1, 34),
(1, 35),
(1, 36),
(1, 37),
(1, 38),
(1, 39),
(1, 40),
(1, 41),
(1, 42),
(1, 43),
(1, 45),
(1, 46),
(1, 47),
(1, 48),
(1, 49),
(1, 50),
(1, 51),
(1, 52),
(1, 53),
(1, 54),
(1, 55),
(1, 56),
(1, 57),
(1, 58),
(1, 59),
(1, 60),
(1, 61),
(1, 62),
(1, 63),
(1, 64),
(1, 65),
(1, 66),
(1, 67),
(1, 68),
(1, 69),
(1, 70),
(1, 71),
(1, 72),
(2, 70),
(2, 71),
(2, 72),
(1, 73),
(2, 73),
(2, 62),
(2, 63),
(2, 64),
(2, 65),
(2, 66),
(1, 74),
(1, 75),
(1, 76),
(1, 77),
(2, 76),
(2, 77);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `price` decimal(15,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Truncate table before insert `products`
--

TRUNCATE TABLE `products`;
--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Ronak Bokaria', 'assssssssssssssssssss', '222.00', '2020-05-30 03:46:45', '2020-05-30 03:46:45', NULL),
(2, 'Maths', NULL, NULL, '2020-05-31 03:40:49', '2020-05-31 03:40:49', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Truncate table before insert `roles`
--

TRUNCATE TABLE `roles`;
--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `title`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Librarian', '2019-04-15 13:43:32', '2019-04-15 13:43:32', NULL),
(2, 'Students', '2019-04-15 13:43:32', '2019-04-15 13:43:32', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `role_user`
--

CREATE TABLE `role_user` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Truncate table before insert `role_user`
--

TRUNCATE TABLE `role_user`;
--
-- Dumping data for table `role_user`
--

INSERT INTO `role_user` (`user_id`, `role_id`) VALUES
(1, 1),
(2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` datetime DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `sex` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT 'Female',
  `designation` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT 'Unknown',
  `remarks` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dob` timestamp NULL DEFAULT NULL,
  `contact_email` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_phone` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_student` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Truncate table before insert `users`
--

TRUNCATE TABLE `users`;
--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `deleted_at`, `sex`, `designation`, `remarks`, `dob`, `contact_email`, `contact_phone`, `is_student`) VALUES
(1, 'Admin', 'admin@admin.com', NULL, '$2y$10$YNlHX89n1Jd.mOto3wGqM.3KvqI9RQvK44GXSuIhOMEEeXAXbBQwK', NULL, '2019-04-15 13:43:32', '2019-04-15 13:43:32', NULL, 'Female', 'Unknown', NULL, NULL, NULL, NULL, 0),
(2, 'Martha', 'stu@stu.com', NULL, '$2y$10$ek.Dm82X9T2wRbJ6oWWkYOlYuRKBhkR8XBzaqg70Cp0yhxc/pQTsS', NULL, '2020-06-04 15:07:11', '2020-06-04 15:07:11', NULL, 'Female', 'Unknown', NULL, NULL, NULL, NULL, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `announcements`
--
ALTER TABLE `announcements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `book_issues`
--
ALTER TABLE `book_issues`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fines`
--
ALTER TABLE `fines`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lang`
--
ALTER TABLE `lang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD KEY `permission_role_role_id_foreign` (`role_id`),
  ADD KEY `permission_role_permission_id_foreign` (`permission_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_user`
--
ALTER TABLE `role_user`
  ADD KEY `role_user_user_id_foreign` (`user_id`),
  ADD KEY `role_user_role_id_foreign` (`role_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `announcements`
--
ALTER TABLE `announcements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `book_issues`
--
ALTER TABLE `book_issues`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `fines`
--
ALTER TABLE `fines`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `lang`
--
ALTER TABLE `lang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;
--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`),
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Constraints for table `role_user`
--
ALTER TABLE `role_user`
  ADD CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  ADD CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
