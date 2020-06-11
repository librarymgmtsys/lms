-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 11, 2020 at 04:02 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.3.18

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lms`
--

-- --------------------------------------------------------

--
-- Table structure for table `announcements`
--

CREATE TABLE `announcements` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `announcements`
--

INSERT INTO `announcements` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Welcome to  Beyond Teaching Library Management System', '2020-06-10 15:38:53', '2020-06-10 15:38:53', NULL),
(2, 'We have lots of good resources to help you find the data and statistics you need to support your research. During this lockdown period (COVID-19).', '2020-06-10 15:39:10', '2020-06-10 15:39:10', NULL),
(3, 'Information about how library services are being adapted in response to COVID-19', '2020-06-10 15:39:42', '2020-06-10 15:39:42', NULL),
(4, 'Library buildings remain closed, but extensive services and resources are available.', '2020-06-10 15:40:13', '2020-06-10 15:40:13', NULL),
(5, 'Access to all digital resources will remain in place as usual.', '2020-06-10 15:40:30', '2020-06-10 15:40:30', NULL);

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
  `copies` int(11) DEFAULT 0,
  `default_issue_days` int(11) DEFAULT 7,
  `available_copies` int(11) DEFAULT 0,
  `publication_year` int(11) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `remarks` varchar(1024) DEFAULT NULL,
  `fine` double(10,2) NOT NULL DEFAULT 1.00,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`id`, `lang_id`, `category_id`, `lms_book_id`, `name`, `isbn`, `copies`, `default_issue_days`, `available_copies`, `publication_year`, `author`, `remarks`, `fine`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, 'LMS-1', 'The Inevitable', 'PNB12860023', 5, 15, 2, 2015, 'keven kelly', 'In The Inevitable, Kevin Kelly, the visionary thinker who foresaw the scope of the internet revolution, provides a plausible, optimistic road map for the next 30 years. He shows how the coming changes can be understood as the result of a few long-term forces that are already in motion.', 20.00, '2020-06-11 02:55:52', '2020-06-11 03:48:51', NULL),
(2, 2, 3, 'LMS-2', 'The shadow of the wind', 'AUS34578', 7, 10, 6, 2011, 'Carlos', 'A city slowly heals from its war wounds, and Daniel, an antiquarian book dealer\'s son who mourns the loss of his mother, finds solace in a mysterious book entitled The Shadow of the Wind, by one Julian Carax.', 10.00, '2020-06-11 03:01:00', '2020-06-11 03:43:39', NULL),
(3, 3, 3, 'LMS-3', 'And the Quiet Flows the Don', 'RUS35753', 7, 13, 5, 2015, 'Mikhail Sholokhov', 'An extraordinary Russian masterpiece, And Quiet Flows the Don follows the turbulent fortunes of the Cossack people through peace, war and revolution – among them the proud and rebellious Gregor Melekhov, who struggles to be with the woman he loves as his country is torn apart.', 9.00, '2020-06-11 03:04:02', '2020-06-11 03:56:13', NULL),
(4, 4, 5, 'LMS-4', 'Computer  & Information Technology', 'B07LGS86HZ', 16, 18, 14, 1991, 'GYAN MURTI', 'Good at IT level and more imperative for students.', 25.00, '2020-06-11 03:09:27', '2020-06-11 03:51:05', NULL),
(5, 4, 4, 'LMS-5', 'Gaban', 'IN3476', 11, 15, 10, 2009, 'Munshi premchand', 'It tells the story of Ramanath, a handsome, pleasure seeking, boastful, but a morally weak person, who tries to make his wife Jalpa, happy by gifting her jewelry which he can\'t really afford to buy via his meager salary, and then gets engulfed in a web of debts, which ultimately forces him to commit embezzlement.', 16.00, '2020-06-11 03:16:57', '2020-06-11 03:52:46', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `book_issues`
--

CREATE TABLE `book_issues` (
  `id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `user_id` varchar(45) DEFAULT NULL,
  `issue_date_from` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `issue_date_to` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `received_date` timestamp NULL DEFAULT NULL,
  `issued_by` int(11) DEFAULT NULL,
  `remarks_at_issue` varchar(1024) DEFAULT NULL,
  `remarks_at_receive` varchar(1024) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `book_issues`
--

INSERT INTO `book_issues` (`id`, `book_id`, `user_id`, `issue_date_from`, `issue_date_to`, `received_date`, `issued_by`, `remarks_at_issue`, `remarks_at_receive`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, '3', '2020-06-11 13:26:14', '2020-06-18 03:23:30', '2020-06-11 03:26:14', 3, NULL, NULL, '2020-06-11 03:23:30', '2020-06-11 03:26:14', NULL),
(2, 5, '3', '2020-06-11 03:24:46', '2020-06-19 03:24:46', NULL, 3, NULL, NULL, '2020-06-11 03:24:46', '2020-06-11 03:24:46', NULL),
(3, 1, '3', '2020-06-11 03:28:12', '2020-06-15 03:28:12', NULL, 4, NULL, NULL, '2020-06-11 03:28:12', '2020-06-11 03:28:12', NULL),
(4, 3, '3', '2020-06-11 03:30:47', '2020-06-19 03:30:47', NULL, 4, NULL, NULL, '2020-06-11 03:30:47', '2020-06-11 03:30:47', NULL),
(5, 3, '3', '2020-06-11 03:30:48', '2020-06-19 03:30:48', NULL, 4, NULL, NULL, '2020-06-11 03:30:48', '2020-06-11 03:30:48', NULL),
(6, 1, '4', '2020-06-11 03:41:09', '2020-06-18 03:41:09', NULL, 4, 'to avoid fine, book should be submit before due date.', NULL, '2020-06-11 03:41:09', '2020-06-11 03:41:09', NULL),
(7, 2, '5', '2020-06-11 03:43:39', '2020-06-20 03:43:39', NULL, 5, 'book should be return in finest way  without any change or pencil work.', NULL, '2020-06-11 03:43:39', '2020-06-11 03:43:39', NULL),
(8, 4, '6', '2020-06-11 03:48:22', '2020-06-20 03:48:22', NULL, 6, NULL, NULL, '2020-06-11 03:48:22', '2020-06-11 03:48:22', NULL),
(9, 1, '6', '2020-06-11 03:48:51', '2020-06-19 03:48:51', NULL, 6, NULL, NULL, '2020-06-11 03:48:51', '2020-06-11 03:48:51', NULL),
(10, 4, '7', '2020-06-11 03:51:05', '2020-06-22 03:51:05', NULL, 7, NULL, NULL, '2020-06-11 03:51:05', '2020-06-11 03:51:05', NULL),
(11, 5, '7', '2020-06-11 13:52:46', '2020-06-11 03:51:57', '2020-06-30 03:52:46', 7, NULL, NULL, '2020-06-11 03:51:57', '2020-06-11 03:52:46', NULL),
(12, 3, '8', '2020-06-11 13:56:13', '2020-06-11 03:55:33', '2020-06-28 03:56:13', 8, NULL, NULL, '2020-06-11 03:55:33', '2020-06-11 03:56:13', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Technology', '2020-06-10 15:42:27', '2020-06-10 15:42:27', NULL),
(2, 'Horror', '2020-06-10 15:44:53', '2020-06-10 15:44:59', '2020-06-10 15:44:59'),
(3, 'Autobiography', '2020-06-10 15:46:52', '2020-06-10 15:46:52', NULL),
(4, 'Realistic Fiction', '2020-06-10 15:47:44', '2020-06-10 15:47:44', NULL),
(5, 'Information technology', '2020-06-10 15:48:48', '2020-06-10 15:48:48', NULL),
(6, 'C++', '2020-06-10 15:49:13', '2020-06-10 15:49:13', NULL);

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
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fines`
--

CREATE TABLE `fines` (
  `id` int(11) NOT NULL,
  `book_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `amount` float(10,2) DEFAULT 0.00,
  `remarks` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `fines`
--

INSERT INTO `fines` (`id`, `book_id`, `user_id`, `amount`, `remarks`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 5, 7, 304.00, 'System Genrated Fine: fine on \"Gaban\" for delay of 19 Day(s).', '2020-06-11 03:52:46', '2020-06-11 03:52:46', NULL),
(2, 3, 8, 153.00, 'System Genrated Fine: fine on \"And the Quiet Flows the Don\" for delay of 17 Day(s).', '2020-06-11 03:56:13', '2020-06-11 03:56:13', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `lang`
--

CREATE TABLE `lang` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `lang`
--

INSERT INTO `lang` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'English', '2020-06-10 15:36:24', '2020-06-10 15:36:24', NULL),
(2, 'Spanish', '2020-06-10 15:36:40', '2020-06-10 15:36:40', NULL),
(3, 'Russian', '2020-06-10 15:36:57', '2020-06-10 15:36:57', NULL),
(4, 'Hindi', '2020-06-10 15:37:24', '2020-06-10 15:37:24', NULL),
(5, 'Sanskrit', '2020-06-10 15:37:54', '2020-06-10 15:37:54', NULL);

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
(2, 77),
(2, 75);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(15,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Dumping data for table `role_user`
--

INSERT INTO `role_user` (`user_id`, `role_id`) VALUES
(1, 1),
(2, 2),
(3, 1),
(4, 1),
(5, 1),
(6, 2),
(7, 2),
(8, 2),
(9, 2),
(10, 2),
(11, 2);

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
  `is_student` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `deleted_at`, `sex`, `designation`, `remarks`, `dob`, `contact_email`, `contact_phone`, `is_student`) VALUES
(1, 'Admin', 'admin@admin.com', NULL, '$2y$10$YNlHX89n1Jd.mOto3wGqM.3KvqI9RQvK44GXSuIhOMEEeXAXbBQwK', NULL, '2019-04-15 13:43:32', '2020-06-11 02:19:33', '2020-06-11 02:19:33', 'Female', 'Unknown', NULL, NULL, NULL, NULL, 0),
(2, 'Martha', 'stu@stu.com', NULL, '$2y$10$ek.Dm82X9T2wRbJ6oWWkYOlYuRKBhkR8XBzaqg70Cp0yhxc/pQTsS', NULL, '2020-06-04 15:07:11', '2020-06-11 02:19:24', '2020-06-11 02:19:24', 'Female', 'Unknown', NULL, NULL, NULL, NULL, 0),
(3, 'gurpriya', 'gurpriya7863@gmail.com', NULL, '$2y$10$1brwULQT6NJUJopcUhVE4egchP64u23lRrIe2IjvhuhGFm8XYlogm', NULL, '2020-06-11 02:18:01', '2020-06-11 02:18:01', NULL, 'Female', 'Unknown', NULL, NULL, NULL, NULL, 0),
(4, 'Nisha', 'nisha123@gmail.com', NULL, '$2y$10$wT7A0as9lxwn957kYdXoJOroQk9BbCsnCV7gWUmQPzSQ3jg27Grci', NULL, '2020-06-11 02:18:38', '2020-06-11 02:18:38', NULL, 'Female', 'Unknown', NULL, NULL, NULL, NULL, 0),
(5, 'Jacky', 'jacky123@gmail.com', NULL, '$2y$10$RQSl5LztUQXibE3ljSv2uee/nUK.B4QSVxUf/ZTDnMqu7/c3SNACe', NULL, '2020-06-11 02:19:09', '2020-06-11 02:19:09', NULL, 'Female', 'Unknown', NULL, NULL, NULL, NULL, 0),
(6, 'Bob', 'bob123@gmail.com', NULL, '$2y$10$exPsnjYqkNEIKSiuwzssjujmfsk97COFLGL84LfNZc0FoWEG86knK', NULL, '2020-06-11 02:20:16', '2020-06-11 02:20:16', NULL, 'Female', 'Unknown', NULL, NULL, NULL, NULL, 0),
(7, 'Parveen', 'parveen@gmail.com', NULL, '$2y$10$m67G8wu/jQ1uTHgKTHzBne7QsJkIDb8Xx/lMKLH2Vraa.o7ojJ22a', NULL, '2020-06-11 02:20:51', '2020-06-11 02:20:51', NULL, 'Female', 'Unknown', NULL, NULL, NULL, NULL, 0),
(8, 'goldy', 'goldy34@gmail.com', NULL, '$2y$10$4WlZBVmp/ycvjY15Vf84Ee0GJRCeuT9Zejb.qicfm./FSr604buOm', NULL, '2020-06-11 02:21:22', '2020-06-11 02:21:22', NULL, 'Female', 'Unknown', NULL, NULL, NULL, NULL, 0),
(9, 'Martha', 'martha67@gmail.com', NULL, '$2y$10$6/r1MS4JqATEM52ZaXVC6.AiaIxIHVgtjVpyz/WrT21cNLYutY88C', NULL, '2020-06-11 02:21:57', '2020-06-11 02:21:57', NULL, 'Female', 'Unknown', NULL, NULL, NULL, NULL, 0),
(10, 'John', 'John45@gmail.com', NULL, '$2y$10$Pg7EeldMLfYWJey2o.kfRuBQszsms3IptICVk/9RotdjMRkETGdQK', NULL, '2020-06-11 02:22:35', '2020-06-11 02:22:35', NULL, 'Female', 'Unknown', NULL, NULL, NULL, NULL, 0),
(11, 'Kitty', 'kitty45@gmail.com', NULL, '$2y$10$z42Q8piavB4yIHGgX9GKKuUkJxAiavxndFEeQ4XKwPVzHkNjsiylq', NULL, '2020-06-11 02:22:36', '2020-06-11 02:23:15', NULL, 'Female', 'Unknown', NULL, NULL, NULL, NULL, 0);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `book_issues`
--
ALTER TABLE `book_issues`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fines`
--
ALTER TABLE `fines`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `lang`
--
ALTER TABLE `lang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

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
SET FOREIGN_KEY_CHECKS=1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
