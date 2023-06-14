-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 14, 2023 at 11:46 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `flowerly2`
--

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` text NOT NULL,
  `slug` text NOT NULL,
  `blog_category_id` int(11) NOT NULL,
  `short_description` longtext DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `thumbnail_image` text DEFAULT NULL,
  `banner` longtext DEFAULT NULL,
  `video_provider` varchar(255) NOT NULL DEFAULT 'youtube' COMMENT 'youtube / vimeo / ...',
  `video_link` text DEFAULT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 1,
  `is_popular` tinyint(4) NOT NULL DEFAULT 0,
  `meta_title` mediumtext DEFAULT NULL,
  `meta_img` text DEFAULT NULL,
  `meta_description` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blog_categories`
--

CREATE TABLE `blog_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blog_localizations`
--

CREATE TABLE `blog_localizations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `blog_id` int(11) NOT NULL,
  `title` text NOT NULL,
  `short_description` longtext DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `lang_key` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blog_tags`
--

CREATE TABLE `blog_tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `blog_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `brand_image` text DEFAULT NULL,
  `total_sales_amount` double NOT NULL DEFAULT 0,
  `is_active` tinyint(4) NOT NULL DEFAULT 1,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_image` text DEFAULT NULL,
  `meta_description` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `brand_localizations`
--

CREATE TABLE `brand_localizations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `brand_id` int(11) NOT NULL,
  `lang_key` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `brand_image` text DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_image` text DEFAULT NULL,
  `meta_description` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `campaigns`
--

CREATE TABLE `campaigns` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `banner` text DEFAULT NULL,
  `start_date` varchar(255) DEFAULT NULL,
  `end_date` varchar(255) DEFAULT NULL,
  `is_published` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `campaign_products`
--

CREATE TABLE `campaign_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `campaign_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `guest_user_id` bigint(20) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `product_variation_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `user_id`, `guest_user_id`, `location_id`, `product_variation_id`, `qty`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, NULL, 1, 6, 1, '2023-06-07 17:23:09', '2023-06-07 17:23:09', NULL),
(2, 2, NULL, 1, 13, 4, '2023-06-07 19:22:03', '2023-06-07 19:22:03', NULL),
(8, 7, NULL, 1, 11, 1, '2023-06-14 16:18:06', '2023-06-14 16:18:06', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `level` int(11) NOT NULL COMMENT 'level of the category',
  `sorting_order_level` int(11) NOT NULL DEFAULT 0,
  `thumbnail_image` text DEFAULT NULL,
  `icon` text DEFAULT NULL,
  `is_featured` tinyint(4) NOT NULL DEFAULT 0,
  `is_top` tinyint(4) NOT NULL DEFAULT 0,
  `total_sale_count` int(11) NOT NULL DEFAULT 0,
  `meta_title` mediumtext DEFAULT NULL,
  `meta_image` text DEFAULT NULL,
  `meta_description` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `parent_id`, `level`, `sorting_order_level`, `thumbnail_image`, `icon`, `is_featured`, `is_top`, `total_sale_count`, `meta_title`, `meta_image`, `meta_description`, `created_at`, `updated_at`) VALUES
(2, 'Sympathy', 'sympathy-ko6ex', 0, 0, 2, '10', NULL, 0, 0, 5, NULL, NULL, NULL, '2023-06-07 16:05:53', '2023-06-14 16:13:09'),
(3, 'Just Because', 'just-because-d7cc4', 0, 0, 1, '11', NULL, 0, 0, 1, NULL, NULL, NULL, '2023-06-07 16:07:26', '2023-06-14 14:42:24'),
(4, 'Anniversary', 'anniversary-0qy17', 0, 0, 0, '12', NULL, 0, 0, 0, NULL, NULL, NULL, '2023-06-07 16:08:00', '2023-06-07 16:08:00'),
(5, 'Thank You', 'thank-you-Si3Sp', 0, 0, 0, '13', NULL, 0, 0, 4, NULL, NULL, NULL, '2023-06-07 16:08:42', '2023-06-14 14:42:24'),
(6, 'Get Well', 'get-well-QPnEp', 0, 0, 0, '14', NULL, 0, 0, 5, NULL, NULL, NULL, '2023-06-07 16:09:24', '2023-06-14 16:13:09'),
(7, 'Weddings', 'weddings-ydhPG', 0, 0, 0, '15', NULL, 0, 0, 0, NULL, NULL, NULL, '2023-06-07 16:10:05', '2023-06-07 16:10:05'),
(8, 'Valentine\'s Day', 'valentines-day-2U3iK', 0, 0, 0, '16', NULL, 0, 0, 1, NULL, NULL, NULL, '2023-06-07 16:10:37', '2023-06-14 16:13:09'),
(9, 'Mother\'s Day', 'mothers-day-Ydy1A', 0, 0, 0, '17', NULL, 0, 0, 4, NULL, NULL, NULL, '2023-06-07 16:12:56', '2023-06-14 16:13:09'),
(10, 'New Baby', 'new-baby-Q9UEj', 0, 0, 0, '18', NULL, 0, 0, 3, NULL, NULL, NULL, '2023-06-07 16:14:02', '2023-06-14 12:00:04'),
(11, 'Apologies', 'apologies-LS7R4', 0, 0, 0, '19', NULL, 0, 0, 4, NULL, NULL, NULL, '2023-06-07 16:14:58', '2023-06-14 16:13:09'),
(12, 'Retirement', 'retirement-QJlIY', 0, 0, 0, '20', NULL, 0, 0, 2, NULL, NULL, NULL, '2023-06-07 16:17:23', '2023-06-14 16:13:09');

-- --------------------------------------------------------

--
-- Table structure for table `category_brands`
--

CREATE TABLE `category_brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` int(11) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category_localizations`
--

CREATE TABLE `category_localizations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` int(11) NOT NULL,
  `lang_key` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `thumbnail_image` text DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_image` text DEFAULT NULL,
  `meta_description` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category_localizations`
--

INSERT INTO `category_localizations` (`id`, `category_id`, `lang_key`, `name`, `thumbnail_image`, `meta_title`, `meta_image`, `meta_description`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'en', 'marriage', NULL, NULL, NULL, NULL, '2023-06-07 13:43:03', '2023-06-07 13:43:03', NULL),
(2, 2, 'en', 'Sympathy', '10', NULL, NULL, NULL, '2023-06-07 16:05:53', '2023-06-07 16:05:53', NULL),
(3, 3, 'en', 'Just Because', '11', NULL, NULL, NULL, '2023-06-07 16:07:26', '2023-06-07 16:07:26', NULL),
(4, 4, 'en', 'Anniversary', '12', NULL, NULL, NULL, '2023-06-07 16:08:00', '2023-06-07 16:08:00', NULL),
(5, 5, 'en', 'Thank You', '13', NULL, NULL, NULL, '2023-06-07 16:08:42', '2023-06-07 16:08:42', NULL),
(6, 6, 'en', 'Get Well', '14', NULL, NULL, NULL, '2023-06-07 16:09:24', '2023-06-07 16:09:24', NULL),
(7, 7, 'en', 'Weddings', '15', NULL, NULL, NULL, '2023-06-07 16:10:05', '2023-06-07 16:10:05', NULL),
(8, 8, 'en', 'Valentine\'s Day', '16', NULL, NULL, NULL, '2023-06-07 16:10:37', '2023-06-07 16:10:37', NULL),
(9, 9, 'en', 'Mother\'s Day', '17', NULL, NULL, NULL, '2023-06-07 16:12:56', '2023-06-07 16:12:56', NULL),
(10, 10, 'en', 'New Baby', '18', NULL, NULL, NULL, '2023-06-07 16:14:02', '2023-06-07 16:14:02', NULL),
(11, 11, 'en', 'Apologies', '19', NULL, NULL, NULL, '2023-06-07 16:14:58', '2023-06-07 16:14:58', NULL),
(12, 12, 'en', 'Retirement', '20', NULL, NULL, NULL, '2023-06-07 16:17:23', '2023-06-07 16:17:23', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `state_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `state_id`, `name`, `is_active`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Casablanca', 1, '2023-04-28 23:00:00', '2023-06-07 13:41:19', NULL),
(2, 1, 'Rabat', 1, '2023-04-28 23:00:00', '2023-06-07 13:41:19', NULL),
(3, 1, 'Marrakech', 1, '2023-04-28 23:00:00', '2023-06-07 13:41:19', NULL),
(4, 1, 'Fes', 1, '2023-04-28 23:00:00', '2023-06-07 13:41:19', NULL),
(5, 2, 'Tangier', 1, '2023-04-28 23:00:00', '2023-06-07 13:41:19', NULL),
(6, 1, 'Beni Mellal', 1, '2023-04-28 23:00:00', '2023-06-07 13:41:19', NULL),
(7, 2, 'Meknes', 1, '2023-04-28 23:00:00', '2023-06-07 13:41:19', NULL),
(8, 2, 'Agadir', 1, '2023-04-28 23:00:00', '2023-06-07 13:41:19', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `contact_us_messages`
--

CREATE TABLE `contact_us_messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `support_for` varchar(255) NOT NULL COMMENT 'delivery_problem | customer_service | other_service',
  `message` longtext NOT NULL,
  `is_seen` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `code`, `name`, `is_active`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'MA', 'Morocco', 1, '2023-04-29 12:06:30', '2023-06-07 13:41:19', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `shop_id` int(11) NOT NULL,
  `banner` text DEFAULT NULL,
  `code` varchar(255) NOT NULL,
  `discount_type` varchar(255) NOT NULL COMMENT 'flat/percentage',
  `discount_value` double NOT NULL DEFAULT 0,
  `is_free_shipping` tinyint(4) NOT NULL DEFAULT 0,
  `start_date` text DEFAULT NULL,
  `end_date` text DEFAULT NULL,
  `min_spend` double NOT NULL DEFAULT 0,
  `max_discount_amount` double NOT NULL DEFAULT 0,
  `total_usage_limit` int(11) NOT NULL DEFAULT 1,
  `total_usage_count` int(11) NOT NULL DEFAULT 0,
  `customer_usage_limit` int(11) NOT NULL DEFAULT 1,
  `product_ids` longtext DEFAULT NULL COMMENT 'Coupon will be applicable only for the products selected',
  `category_ids` longtext DEFAULT NULL COMMENT 'Coupon will be applicable only for   categories selected',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `coupon_usages`
--

CREATE TABLE `coupon_usages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `coupon_code` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `usage_count` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `symbol` varchar(255) NOT NULL,
  `alignment` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0 for left, 1 for right',
  `rate` double NOT NULL DEFAULT 1,
  `is_active` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `code`, `name`, `symbol`, `alignment`, `rate`, `is_active`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'usd', 'US Dollar', '$', 0, 1, 0, '2022-11-27 11:21:37', '2023-06-08 00:37:08', NULL),
(3, 'Dirham', 'Moroccan Dirham', 'Dhs', 1, 10, 1, '2023-06-08 00:35:46', '2023-06-08 00:35:46', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
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
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `flag` varchar(255) DEFAULT NULL,
  `code` varchar(255) NOT NULL,
  `is_rtl` tinyint(4) NOT NULL DEFAULT 0,
  `is_active` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `name`, `flag`, `code`, `is_rtl`, `is_active`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'English', 'en', 'en', 0, 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `localizations`
--

CREATE TABLE `localizations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `lang_key` varchar(255) NOT NULL,
  `t_key` longtext NOT NULL,
  `t_value` longtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `localizations`
--

INSERT INTO `localizations` (`id`, `lang_key`, `t_key`, `t_value`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'en', 'login', 'Login', '2023-06-07 13:40:04', '2023-06-07 13:40:04', NULL),
(2, 'en', 'hey_there', 'Hey there!', '2023-06-07 13:40:04', '2023-06-07 13:40:04', NULL),
(3, 'en', 'welcome_back_to_grostore', 'Welcome back to Grostore.', '2023-06-07 13:40:04', '2023-06-07 13:40:04', NULL),
(4, 'en', 'email', 'Email', '2023-06-07 13:40:04', '2023-06-07 13:40:04', NULL),
(5, 'en', 'enter_your_email', 'Enter your email', '2023-06-07 13:40:04', '2023-06-07 13:40:04', NULL),
(6, 'en', 'login_with_phone', 'Login with phone?', '2023-06-07 13:40:04', '2023-06-07 13:40:04', NULL),
(7, 'en', 'phone', 'Phone', '2023-06-07 13:40:04', '2023-06-07 13:40:04', NULL),
(8, 'en', 'login_with_email', 'Login with email?', '2023-06-07 13:40:04', '2023-06-07 13:40:04', NULL),
(9, 'en', 'password', 'Password', '2023-06-07 13:40:04', '2023-06-07 13:40:04', NULL),
(10, 'en', 'remember_me', 'Remember me', '2023-06-07 13:40:04', '2023-06-07 13:40:04', NULL),
(11, 'en', 'forgot_password', 'Forgot Password', '2023-06-07 13:40:04', '2023-06-07 13:40:04', NULL),
(12, 'en', 'sign_in', 'Sign In', '2023-06-07 13:40:04', '2023-06-07 13:40:04', NULL),
(13, 'en', 'dont_have_an_account', 'Don\'t have an Account?', '2023-06-07 13:40:05', '2023-06-07 13:40:05', NULL),
(14, 'en', 'sign_up', 'Sign Up', '2023-06-07 13:40:05', '2023-06-07 13:40:05', NULL),
(15, 'en', 'please_select_shipping_address', 'Please select shipping address', '2023-06-07 13:40:05', '2023-06-07 13:40:05', NULL),
(16, 'en', 'please_select_logistic', 'Please select logistic', '2023-06-07 13:40:05', '2023-06-07 13:40:05', NULL),
(17, 'en', 'please_select_billing_address', 'Please select billing address', '2023-06-07 13:40:05', '2023-06-07 13:40:05', NULL),
(18, 'en', 'please_login_first', 'Please login first', '2023-06-07 13:40:05', '2023-06-07 13:40:05', NULL),
(19, 'en', 'last_7_days', 'Last 7 days', '2023-06-07 13:40:14', '2023-06-07 13:40:14', NULL),
(20, 'en', 'dashboard', 'Dashboard', '2023-06-07 13:40:14', '2023-06-07 13:40:14', NULL),
(21, 'en', 'admin_dashboard', 'Admin Dashboard', '2023-06-07 13:40:14', '2023-06-07 13:40:14', NULL),
(22, 'en', 'manage_sales', 'Manage Sales', '2023-06-07 13:40:15', '2023-06-07 13:40:15', NULL),
(23, 'en', 'add_product', 'Add Product', '2023-06-07 13:40:15', '2023-06-07 13:40:15', NULL),
(24, 'en', 'total_earning', 'Total Earning', '2023-06-07 13:40:15', '2023-06-07 13:40:15', NULL),
(25, 'en', 'last_30_days', 'Last 30 days', '2023-06-07 13:40:15', '2023-06-07 13:40:15', NULL),
(26, 'en', 'last_3_months', 'Last 3 months', '2023-06-07 13:40:15', '2023-06-07 13:40:15', NULL),
(27, 'en', 'top_5_category_sales', 'Top 5 Category Sales', '2023-06-07 13:40:15', '2023-06-07 13:40:15', NULL),
(28, 'en', 'last_30_days_orders', 'Last 30 Days Orders', '2023-06-07 13:40:15', '2023-06-07 13:40:15', NULL),
(29, 'en', 'sales_this_months', 'Sales This Months', '2023-06-07 13:40:15', '2023-06-07 13:40:15', NULL),
(30, 'en', 'top_selling_products', 'Top Selling Products', '2023-06-07 13:40:15', '2023-06-07 13:40:15', NULL),
(31, 'en', 'we_have_listed_0_total_products', 'We have listed 0 total products.', '2023-06-07 13:40:15', '2023-06-07 13:40:15', NULL),
(32, 'en', 'total_orders', 'Total Orders', '2023-06-07 13:40:15', '2023-06-07 13:40:15', NULL),
(33, 'en', 'order_pending', 'Order Pending', '2023-06-07 13:40:15', '2023-06-07 13:40:15', NULL),
(34, 'en', 'order_processing', 'Order Processing', '2023-06-07 13:40:15', '2023-06-07 13:40:15', NULL),
(35, 'en', 'total_delivered', 'Total Delivered', '2023-06-07 13:40:15', '2023-06-07 13:40:15', NULL),
(36, 'en', 'recent_orders', 'Recent Orders', '2023-06-07 13:40:15', '2023-06-07 13:40:15', NULL),
(37, 'en', 'your_10_most_recent_orders', 'Your 10 Most Recent Orders', '2023-06-07 13:40:15', '2023-06-07 13:40:15', NULL),
(38, 'en', 'view_all', 'View All', '2023-06-07 13:40:15', '2023-06-07 13:40:15', NULL),
(39, 'en', 'order_code', 'Order Code', '2023-06-07 13:40:15', '2023-06-07 13:40:15', NULL),
(40, 'en', 'customer', 'Customer', '2023-06-07 13:40:15', '2023-06-07 13:40:15', NULL),
(41, 'en', 'placed_on', 'Placed On', '2023-06-07 13:40:15', '2023-06-07 13:40:15', NULL),
(42, 'en', 'items', 'Items', '2023-06-07 13:40:15', '2023-06-07 13:40:15', NULL),
(43, 'en', 'payment_status', 'Payment Status', '2023-06-07 13:40:16', '2023-06-07 13:40:16', NULL),
(44, 'en', 'delivery_status', 'Delivery Status', '2023-06-07 13:40:16', '2023-06-07 13:40:16', NULL),
(45, 'en', 'delivery_type', 'Delivery Type', '2023-06-07 13:40:16', '2023-06-07 13:40:16', NULL),
(46, 'en', 'action', 'Action', '2023-06-07 13:40:16', '2023-06-07 13:40:16', NULL),
(47, 'en', 'picked_up_orders', 'Picked Up Orders', '2023-06-07 13:40:16', '2023-06-07 13:40:16', NULL),
(48, 'en', 'cancelled_orders', 'Cancelled Orders', '2023-06-07 13:40:16', '2023-06-07 13:40:16', NULL),
(49, 'en', 'out_for_delivery', 'Out For Delivery', '2023-06-07 13:40:16', '2023-06-07 13:40:16', NULL),
(50, 'en', 'paid_orders', 'Paid Orders', '2023-06-07 13:40:16', '2023-06-07 13:40:16', NULL),
(51, 'en', 'unpaid_orders', 'Unpaid Orders', '2023-06-07 13:40:16', '2023-06-07 13:40:16', NULL),
(52, 'en', 'todays_earning', 'Today\'s Earning', '2023-06-07 13:40:16', '2023-06-07 13:40:16', NULL),
(53, 'en', 'todays_pending_earning', 'Today\'s Pending Earning', '2023-06-07 13:40:16', '2023-06-07 13:40:16', NULL),
(54, 'en', 'this_year_earning', 'This Year Earning', '2023-06-07 13:40:16', '2023-06-07 13:40:16', NULL),
(55, 'en', 'total_product_sale', 'Total Product Sale', '2023-06-07 13:40:16', '2023-06-07 13:40:16', NULL),
(56, 'en', 'todays_product_sale', 'Today\'s Product Sale', '2023-06-07 13:40:16', '2023-06-07 13:40:16', NULL),
(57, 'en', 'this_months_product_sale', 'This Month\'s Product Sale', '2023-06-07 13:40:16', '2023-06-07 13:40:16', NULL),
(58, 'en', 'this_years_product_sale', 'This Year\'s Product Sale', '2023-06-07 13:40:16', '2023-06-07 13:40:16', NULL),
(59, 'en', 'total_customers', 'Total Customers', '2023-06-07 13:40:16', '2023-06-07 13:40:16', NULL),
(60, 'en', 'total_subscribers', 'Total Subscribers', '2023-06-07 13:40:16', '2023-06-07 13:40:16', NULL),
(61, 'en', 'total_categories', 'Total Categories', '2023-06-07 13:40:16', '2023-06-07 13:40:16', NULL),
(62, 'en', 'total_brands', 'Total Brands', '2023-06-07 13:40:16', '2023-06-07 13:40:16', NULL),
(63, 'en', 'earning', 'Earning', '2023-06-07 13:40:16', '2023-06-07 13:40:16', NULL),
(64, 'en', 'super_admin', 'Super Admin', '2023-06-07 13:40:17', '2023-06-07 13:40:17', NULL),
(65, 'en', 'products', 'Products', '2023-06-07 13:40:17', '2023-06-07 13:40:17', NULL),
(66, 'en', 'all_products', 'All Products', '2023-06-07 13:40:17', '2023-06-07 13:40:17', NULL),
(67, 'en', 'all_categories', 'All Categories', '2023-06-07 13:40:17', '2023-06-07 13:40:17', NULL),
(68, 'en', 'all_variations', 'All Variations', '2023-06-07 13:40:17', '2023-06-07 13:40:17', NULL),
(69, 'en', 'all_brands', 'All Brands', '2023-06-07 13:40:17', '2023-06-07 13:40:17', NULL),
(70, 'en', 'all_units', 'All Units', '2023-06-07 13:40:17', '2023-06-07 13:40:17', NULL),
(71, 'en', 'all_taxes', 'All Taxes', '2023-06-07 13:40:17', '2023-06-07 13:40:17', NULL),
(72, 'en', 'pos_system', 'Pos System', '2023-06-07 13:40:17', '2023-06-07 13:40:17', NULL),
(73, 'en', 'orders', 'Orders', '2023-06-07 13:40:17', '2023-06-07 13:40:17', NULL),
(74, 'en', 'stocks', 'Stocks', '2023-06-07 13:40:17', '2023-06-07 13:40:17', NULL),
(75, 'en', 'add_stock', 'Add Stock', '2023-06-07 13:40:17', '2023-06-07 13:40:17', NULL),
(76, 'en', 'all_locations', 'All Locations', '2023-06-07 13:40:17', '2023-06-07 13:40:17', NULL),
(77, 'en', 'refunds', 'Refunds', '2023-06-07 13:40:17', '2023-06-07 13:40:17', NULL),
(78, 'en', 'refund_configurations', 'Refund Configurations', '2023-06-07 13:40:17', '2023-06-07 13:40:17', NULL),
(79, 'en', 'refund_requests', 'Refund Requests', '2023-06-07 13:40:17', '2023-06-07 13:40:17', NULL),
(80, 'en', 'approved_refunds', 'Approved Refunds', '2023-06-07 13:40:17', '2023-06-07 13:40:17', NULL),
(81, 'en', 'rejected_refunds', 'Rejected Refunds', '2023-06-07 13:40:17', '2023-06-07 13:40:17', NULL),
(82, 'en', 'rewards__wallet', 'Rewards & Wallet', '2023-06-07 13:40:17', '2023-06-07 13:40:17', NULL),
(83, 'en', 'reward_configurations', 'Reward Configurations', '2023-06-07 13:40:17', '2023-06-07 13:40:17', NULL),
(84, 'en', 'set_reward_points', 'Set Reward Points', '2023-06-07 13:40:17', '2023-06-07 13:40:17', NULL),
(85, 'en', 'wallet_configurations', 'Wallet Configurations', '2023-06-07 13:40:17', '2023-06-07 13:40:17', NULL),
(86, 'en', 'users', 'Users', '2023-06-07 13:40:17', '2023-06-07 13:40:17', NULL),
(87, 'en', 'customers', 'Customers', '2023-06-07 13:40:17', '2023-06-07 13:40:17', NULL),
(88, 'en', 'employee_staffs', 'Employee Staffs', '2023-06-07 13:40:17', '2023-06-07 13:40:17', NULL),
(89, 'en', 'contents', 'Contents', '2023-06-07 13:40:18', '2023-06-07 13:40:18', NULL),
(90, 'en', 'tags', 'Tags', '2023-06-07 13:40:18', '2023-06-07 13:40:18', NULL),
(91, 'en', 'pages', 'Pages', '2023-06-07 13:40:18', '2023-06-07 13:40:18', NULL),
(92, 'en', 'blogs', 'Blogs', '2023-06-07 13:40:18', '2023-06-07 13:40:18', NULL),
(93, 'en', 'all_blogs', 'All Blogs', '2023-06-07 13:40:18', '2023-06-07 13:40:18', NULL),
(94, 'en', 'categories', 'Categories', '2023-06-07 13:40:18', '2023-06-07 13:40:18', NULL),
(95, 'en', 'media_manager', 'Media Manager', '2023-06-07 13:40:18', '2023-06-07 13:40:18', NULL),
(96, 'en', 'promotions', 'Promotions', '2023-06-07 13:40:18', '2023-06-07 13:40:18', NULL),
(97, 'en', 'newsletters', 'Newsletters', '2023-06-07 13:40:18', '2023-06-07 13:40:18', NULL),
(98, 'en', 'bulk_emails', 'Bulk Emails', '2023-06-07 13:40:18', '2023-06-07 13:40:18', NULL),
(99, 'en', 'subscribers', 'Subscribers', '2023-06-07 13:40:18', '2023-06-07 13:40:18', NULL),
(100, 'en', 'coupons', 'Coupons', '2023-06-07 13:40:18', '2023-06-07 13:40:18', NULL),
(101, 'en', 'campaigns', 'Campaigns', '2023-06-07 13:40:18', '2023-06-07 13:40:18', NULL),
(102, 'en', 'fulfillment', 'Fulfillment', '2023-06-07 13:40:18', '2023-06-07 13:40:18', NULL),
(103, 'en', 'logistics', 'Logistics', '2023-06-07 13:40:18', '2023-06-07 13:40:18', NULL),
(104, 'en', 'shipping_zones', 'Shipping Zones', '2023-06-07 13:40:18', '2023-06-07 13:40:18', NULL),
(105, 'en', 'reports', 'Reports', '2023-06-07 13:40:18', '2023-06-07 13:40:18', NULL),
(106, 'en', 'orders_report', 'Orders Report', '2023-06-07 13:40:18', '2023-06-07 13:40:18', NULL),
(107, 'en', 'product_sales', 'Product Sales', '2023-06-07 13:40:18', '2023-06-07 13:40:18', NULL),
(108, 'en', 'category_wise_sales', 'Category Wise Sales', '2023-06-07 13:40:18', '2023-06-07 13:40:18', NULL),
(109, 'en', 'sales_amount_report', 'Sales Amount Report', '2023-06-07 13:40:18', '2023-06-07 13:40:18', NULL),
(110, 'en', 'delivery_status_report', 'Delivery Status Report', '2023-06-07 13:40:18', '2023-06-07 13:40:18', NULL),
(111, 'en', 'support', 'Support', '2023-06-07 13:40:18', '2023-06-07 13:40:18', NULL),
(112, 'en', 'queries', 'Queries', '2023-06-07 13:40:19', '2023-06-07 13:40:19', NULL),
(113, 'en', 'settings', 'Settings', '2023-06-07 13:40:19', '2023-06-07 13:40:19', NULL),
(114, 'en', 'appearance', 'Appearance', '2023-06-07 13:40:19', '2023-06-07 13:40:19', NULL),
(115, 'en', 'homepage', 'Homepage', '2023-06-07 13:40:19', '2023-06-07 13:40:19', NULL),
(116, 'en', 'products_page', 'Products Page', '2023-06-07 13:40:19', '2023-06-07 13:40:19', NULL),
(117, 'en', 'product_details', 'Product Details', '2023-06-07 13:40:19', '2023-06-07 13:40:19', NULL),
(118, 'en', 'about_us', 'About Us', '2023-06-07 13:40:19', '2023-06-07 13:40:19', NULL),
(119, 'en', 'header', 'Header', '2023-06-07 13:40:19', '2023-06-07 13:40:19', NULL),
(120, 'en', 'footer', 'Footer', '2023-06-07 13:40:19', '2023-06-07 13:40:19', NULL),
(121, 'en', 'roles__permissions', 'Roles & Permissions', '2023-06-07 13:40:19', '2023-06-07 13:40:19', NULL),
(122, 'en', 'system_settings', 'System Settings', '2023-06-07 13:40:19', '2023-06-07 13:40:19', NULL),
(123, 'en', 'auth_settings', 'Auth Settings', '2023-06-07 13:40:19', '2023-06-07 13:40:19', NULL),
(124, 'en', 'otp_settings', 'OTP Settings', '2023-06-07 13:40:19', '2023-06-07 13:40:19', NULL),
(125, 'en', 'order_settings', 'Order Settings', '2023-06-07 13:40:19', '2023-06-07 13:40:19', NULL),
(126, 'en', 'admin_store', 'Admin Store', '2023-06-07 13:40:19', '2023-06-07 13:40:19', NULL),
(127, 'en', 'smtp_settings', 'SMTP Settings', '2023-06-07 13:40:19', '2023-06-07 13:40:19', NULL),
(128, 'en', 'general_settings', 'General Settings', '2023-06-07 13:40:19', '2023-06-07 13:40:19', NULL),
(129, 'en', 'payment_methods', 'Payment Methods', '2023-06-07 13:40:19', '2023-06-07 13:40:19', NULL),
(130, 'en', 'social_media_login', 'Social Media Login', '2023-06-07 13:40:20', '2023-06-07 13:40:20', NULL),
(131, 'en', 'multilingual_settings', 'Multilingual Settings', '2023-06-07 13:40:20', '2023-06-07 13:40:20', NULL),
(132, 'en', 'multi_currency_settings', 'Multi Currency Settings', '2023-06-07 13:40:20', '2023-06-07 13:40:20', NULL),
(133, 'en', 'search', 'Search', '2023-06-07 13:40:20', '2023-06-07 13:40:20', NULL),
(134, 'en', 'visit_store', 'Visit Store', '2023-06-07 13:40:20', '2023-06-07 13:40:20', NULL),
(135, 'en', 'no_new_notification', 'No New Notification', '2023-06-07 13:40:20', '2023-06-07 13:40:20', NULL),
(136, 'en', 'my_account', 'My Account', '2023-06-07 13:40:20', '2023-06-07 13:40:20', NULL),
(137, 'en', 'sign_out', 'Sign out', '2023-06-07 13:40:20', '2023-06-07 13:40:20', NULL),
(138, 'en', 'media_files', 'Media Files', '2023-06-07 13:40:20', '2023-06-07 13:40:20', NULL),
(139, 'en', 'recently_uploaded_files', 'Recently uploaded files', '2023-06-07 13:40:20', '2023-06-07 13:40:20', NULL),
(140, 'en', 'add_files_here', 'Add files here', '2023-06-07 13:40:20', '2023-06-07 13:40:20', NULL),
(141, 'en', 'previously_uploaded_files', 'Previously uploaded files', '2023-06-07 13:40:20', '2023-06-07 13:40:20', NULL),
(142, 'en', 'search_by_name', 'Search by name', '2023-06-07 13:40:20', '2023-06-07 13:40:20', NULL),
(143, 'en', 'load_more', 'Load More', '2023-06-07 13:40:20', '2023-06-07 13:40:20', NULL),
(144, 'en', 'select', 'Select', '2023-06-07 13:40:20', '2023-06-07 13:40:20', NULL),
(145, 'en', 'delete_confirmation', 'Delete Confirmation', '2023-06-07 13:40:20', '2023-06-07 13:40:20', NULL),
(146, 'en', 'are_you_sure_to_delete_this', 'Are you sure to delete this?', '2023-06-07 13:40:21', '2023-06-07 13:40:21', NULL),
(147, 'en', 'all_data_related_to_this_may_get_deleted', 'All data related to this may get deleted.', '2023-06-07 13:40:21', '2023-06-07 13:40:21', NULL),
(148, 'en', 'proceed', 'Proceed', '2023-06-07 13:40:21', '2023-06-07 13:40:21', NULL),
(149, 'en', 'cancel', 'Cancel', '2023-06-07 13:40:21', '2023-06-07 13:40:21', NULL),
(150, 'en', 'no_data_found', 'No data found', '2023-06-07 13:40:21', '2023-06-07 13:40:21', NULL),
(151, 'en', 'selected_file', 'Selected File', '2023-06-07 13:40:21', '2023-06-07 13:40:21', NULL),
(152, 'en', 'selected_files', 'Selected Files', '2023-06-07 13:40:21', '2023-06-07 13:40:21', NULL),
(153, 'en', 'file_added', 'File added', '2023-06-07 13:40:21', '2023-06-07 13:40:21', NULL),
(154, 'en', 'files_added', 'Files added', '2023-06-07 13:40:21', '2023-06-07 13:40:21', NULL),
(155, 'en', 'no_file_chosen', 'No file chosen', '2023-06-07 13:40:21', '2023-06-07 13:40:21', NULL),
(156, 'en', 'if_you_change_the_location_your_cart_will_be_cleared_do_you_want_to_proceed', 'If you change the location your cart will be cleared. Do you want to proceed?', '2023-06-07 13:40:21', '2023-06-07 13:40:21', NULL),
(157, 'en', 'sl', 'S/L', '2023-06-07 13:40:58', '2023-06-07 13:40:58', NULL),
(158, 'en', 'name', 'Name', '2023-06-07 13:40:58', '2023-06-07 13:40:58', NULL),
(159, 'en', 'active', 'Active', '2023-06-07 13:40:58', '2023-06-07 13:40:58', NULL),
(160, 'en', 'showing', 'Showing', '2023-06-07 13:40:58', '2023-06-07 13:40:58', NULL),
(161, 'en', 'of', 'of', '2023-06-07 13:40:58', '2023-06-07 13:40:58', NULL),
(162, 'en', 'results', 'results', '2023-06-07 13:40:58', '2023-06-07 13:40:58', NULL),
(163, 'en', 'add_new_logistic', 'Add New Logistic', '2023-06-07 13:40:58', '2023-06-07 13:40:58', NULL),
(164, 'en', 'logistic_name', 'Logistic Name', '2023-06-07 13:40:58', '2023-06-07 13:40:58', NULL),
(165, 'en', 'type_logistic_name', 'Type logistic name', '2023-06-07 13:40:58', '2023-06-07 13:40:58', NULL),
(166, 'en', 'logistic_image', 'Logistic Image', '2023-06-07 13:40:58', '2023-06-07 13:40:58', NULL),
(167, 'en', 'choose_logistic_thumbnail', 'Choose Logistic Thumbnail', '2023-06-07 13:40:58', '2023-06-07 13:40:58', NULL),
(168, 'en', 'save_logistic', 'Save Logistic', '2023-06-07 13:40:58', '2023-06-07 13:40:58', NULL),
(169, 'en', 'status_updated_successfully', 'Status updated successfully', '2023-06-07 13:40:58', '2023-06-07 13:40:58', NULL),
(170, 'en', 'something_went_wrong', 'Something went wrong', '2023-06-07 13:40:58', '2023-06-07 13:40:58', NULL),
(171, 'en', 'zones', 'Zones', '2023-06-07 13:41:01', '2023-06-07 13:41:01', NULL),
(172, 'en', 'cities', 'Cities', '2023-06-07 13:41:01', '2023-06-07 13:41:01', NULL),
(173, 'en', 'states', 'States', '2023-06-07 13:41:01', '2023-06-07 13:41:01', NULL),
(174, 'en', 'countries', 'Countries', '2023-06-07 13:41:01', '2023-06-07 13:41:01', NULL),
(175, 'en', 'add_zone', 'Add Zone', '2023-06-07 13:41:01', '2023-06-07 13:41:01', NULL),
(176, 'en', 'select_a_logistic', 'Select a Logistic', '2023-06-07 13:41:02', '2023-06-07 13:41:02', NULL),
(177, 'en', 'logistic', 'Logistic', '2023-06-07 13:41:02', '2023-06-07 13:41:02', NULL),
(178, 'en', 'shipping_time', 'Shipping Time', '2023-06-07 13:41:02', '2023-06-07 13:41:02', NULL),
(179, 'en', 'shipping_charge', 'Shipping Charge', '2023-06-07 13:41:02', '2023-06-07 13:41:02', NULL),
(180, 'en', 'shipping_cities', 'Shipping Cities', '2023-06-07 13:41:05', '2023-06-07 13:41:05', NULL),
(181, 'en', 'shipping_citites', 'Shipping Citites', '2023-06-07 13:41:05', '2023-06-07 13:41:05', NULL),
(182, 'en', 'add_city', 'Add City', '2023-06-07 13:41:05', '2023-06-07 13:41:05', NULL),
(183, 'en', 'select_an_state', 'Select an State', '2023-06-07 13:41:05', '2023-06-07 13:41:05', NULL),
(184, 'en', 'state', 'State', '2023-06-07 13:41:05', '2023-06-07 13:41:05', NULL),
(185, 'en', 'edit', 'Edit', '2023-06-07 13:41:05', '2023-06-07 13:41:05', NULL),
(186, 'en', 'shipping_states', 'Shipping States', '2023-06-07 13:41:09', '2023-06-07 13:41:09', NULL),
(187, 'en', 'add_state', 'Add State', '2023-06-07 13:41:09', '2023-06-07 13:41:09', NULL),
(188, 'en', 'select_a_country', 'Select a country', '2023-06-07 13:41:10', '2023-06-07 13:41:10', NULL),
(189, 'en', 'country', 'Country', '2023-06-07 13:41:10', '2023-06-07 13:41:10', NULL),
(190, 'en', 'shipping_countries', 'Shipping Countries', '2023-06-07 13:41:13', '2023-06-07 13:41:13', NULL),
(191, 'en', 'code', 'Code', '2023-06-07 13:41:13', '2023-06-07 13:41:13', NULL),
(192, 'en', 'select_brand', 'Select Brand', '2023-06-07 13:41:33', '2023-06-07 13:41:33', NULL),
(193, 'en', 'select_status', 'Select Status', '2023-06-07 13:41:33', '2023-06-07 13:41:33', NULL),
(194, 'en', 'published', 'Published', '2023-06-07 13:41:33', '2023-06-07 13:41:33', NULL),
(195, 'en', 'hidden', 'Hidden', '2023-06-07 13:41:33', '2023-06-07 13:41:33', NULL),
(196, 'en', 'product_name', 'Product Name', '2023-06-07 13:41:33', '2023-06-07 13:41:33', NULL),
(197, 'en', 'brand', 'Brand', '2023-06-07 13:41:33', '2023-06-07 13:41:33', NULL),
(198, 'en', 'price', 'Price', '2023-06-07 13:41:33', '2023-06-07 13:41:33', NULL),
(199, 'en', 'basic_information', 'Basic Information', '2023-06-07 13:41:36', '2023-06-07 13:41:36', NULL),
(200, 'en', 'type_your_product_name', 'Type your product name', '2023-06-07 13:41:36', '2023-06-07 13:41:36', NULL),
(201, 'en', 'product_name_is_required_and_recommended_to_be_unique', 'Product name is required and recommended to be unique.', '2023-06-07 13:41:36', '2023-06-07 13:41:36', NULL),
(202, 'en', 'short_description', 'Short Description', '2023-06-07 13:41:36', '2023-06-07 13:41:36', NULL),
(203, 'en', 'type_your_product_short_description', 'Type your product short description', '2023-06-07 13:41:36', '2023-06-07 13:41:36', NULL),
(204, 'en', 'description', 'Description', '2023-06-07 13:41:36', '2023-06-07 13:41:36', NULL),
(205, 'en', 'images', 'Images', '2023-06-07 13:41:36', '2023-06-07 13:41:36', NULL),
(206, 'en', 'thumbnail', 'Thumbnail', '2023-06-07 13:41:36', '2023-06-07 13:41:36', NULL),
(207, 'en', 'choose_product_thumbnail', 'Choose Product Thumbnail', '2023-06-07 13:41:36', '2023-06-07 13:41:36', NULL),
(208, 'en', 'gallery', 'Gallery', '2023-06-07 13:41:36', '2023-06-07 13:41:36', NULL),
(209, 'en', 'choose_gallery_images', 'Choose Gallery Images', '2023-06-07 13:41:36', '2023-06-07 13:41:36', NULL),
(210, 'en', 'product_categories', 'Product Categories', '2023-06-07 13:41:36', '2023-06-07 13:41:36', NULL),
(211, 'en', 'select_categories', 'Select categories', '2023-06-07 13:41:36', '2023-06-07 13:41:36', NULL),
(212, 'en', 'product_tags', 'Product Tags', '2023-06-07 13:41:36', '2023-06-07 13:41:36', NULL),
(213, 'en', 'select_tags', 'Select tags..', '2023-06-07 13:41:36', '2023-06-07 13:41:36', NULL),
(214, 'en', 'product_brand', 'Product Brand', '2023-06-07 13:41:36', '2023-06-07 13:41:36', NULL),
(215, 'en', 'product_unit', 'Product Unit', '2023-06-07 13:41:36', '2023-06-07 13:41:36', NULL),
(216, 'en', 'select_unit', 'Select Unit', '2023-06-07 13:41:36', '2023-06-07 13:41:36', NULL),
(217, 'en', 'price_sku__stock', 'Price, Sku & Stock', '2023-06-07 13:41:36', '2023-06-07 13:41:36', NULL),
(218, 'en', 'has_variations', 'Has Variations?', '2023-06-07 13:41:36', '2023-06-07 13:41:36', NULL),
(219, 'en', 'product_price', 'Product price', '2023-06-07 13:41:36', '2023-06-07 13:41:36', NULL),
(220, 'en', 'stock', 'Stock', '2023-06-07 13:41:37', '2023-06-07 13:41:37', NULL),
(221, 'en', 'default_location', 'Default Location', '2023-06-07 13:41:37', '2023-06-07 13:41:37', NULL),
(222, 'en', 'stock_qty', 'Stock qty', '2023-06-07 13:41:37', '2023-06-07 13:41:37', NULL),
(223, 'en', 'sku', 'SKU', '2023-06-07 13:41:37', '2023-06-07 13:41:37', NULL),
(224, 'en', 'product_sku', 'Product sku', '2023-06-07 13:41:37', '2023-06-07 13:41:37', NULL),
(225, 'en', 'product_code', 'Product code', '2023-06-07 13:41:37', '2023-06-07 13:41:37', NULL),
(226, 'en', 'product_size_guide', 'Product Size Guide', '2023-06-07 13:41:37', '2023-06-07 13:41:37', NULL),
(227, 'en', 'choose_size_guide_image', 'Choose Size Guide Image', '2023-06-07 13:41:37', '2023-06-07 13:41:37', NULL),
(228, 'en', 'product_discount', 'Product Discount', '2023-06-07 13:41:37', '2023-06-07 13:41:37', NULL),
(229, 'en', 'date_range', 'Date Range', '2023-06-07 13:41:37', '2023-06-07 13:41:37', NULL),
(230, 'en', 'start_date__end_date', 'Start date - End date', '2023-06-07 13:41:37', '2023-06-07 13:41:37', NULL),
(231, 'en', 'discount_amount', 'Discount Amount', '2023-06-07 13:41:37', '2023-06-07 13:41:37', NULL),
(232, 'en', 'type_discount_amount', 'Type discount amount', '2023-06-07 13:41:37', '2023-06-07 13:41:37', NULL),
(233, 'en', 'percent_or_fixed', 'Percent or Fixed', '2023-06-07 13:41:37', '2023-06-07 13:41:37', NULL),
(234, 'en', 'percent_', 'Percent %', '2023-06-07 13:41:37', '2023-06-07 13:41:37', NULL),
(235, 'en', 'fixed', 'Fixed', '2023-06-07 13:41:37', '2023-06-07 13:41:37', NULL),
(236, 'en', 'shipping_configuration', 'Shipping Configuration', '2023-06-07 13:41:37', '2023-06-07 13:41:37', NULL),
(237, 'en', 'minimum_purchase_qty', 'Minimum Purchase Qty', '2023-06-07 13:41:37', '2023-06-07 13:41:37', NULL),
(238, 'en', 'maximum_purchase_qty', 'Maximum Purchase Qty', '2023-06-07 13:41:37', '2023-06-07 13:41:37', NULL),
(239, 'en', 'standard_delivery_time', 'Standard Delivery Time', '2023-06-07 13:41:37', '2023-06-07 13:41:37', NULL),
(240, 'en', 'express_delivery_time', 'Express Delivery Time', '2023-06-07 13:41:37', '2023-06-07 13:41:37', NULL),
(241, 'en', 'product_taxes', 'Product Taxes', '2023-06-07 13:41:38', '2023-06-07 13:41:38', NULL),
(242, 'en', 'default_0', 'Default 0%', '2023-06-07 13:41:38', '2023-06-07 13:41:38', NULL),
(243, 'en', 'sell_target', 'Sell Target', '2023-06-07 13:41:38', '2023-06-07 13:41:38', NULL),
(244, 'en', 'type_your_sell_target', 'Type your sell target', '2023-06-07 13:41:38', '2023-06-07 13:41:38', NULL),
(245, 'en', 'product_status', 'Product Status', '2023-06-07 13:41:38', '2023-06-07 13:41:38', NULL),
(246, 'en', 'unpublished', 'Unpublished', '2023-06-07 13:41:38', '2023-06-07 13:41:38', NULL),
(247, 'en', 'seo_meta_configuration', 'SEO Meta Configuration', '2023-06-07 13:41:38', '2023-06-07 13:41:38', NULL),
(248, 'en', 'meta_title', 'Meta Title', '2023-06-07 13:41:38', '2023-06-07 13:41:38', NULL),
(249, 'en', 'type_meta_title', 'Type meta title', '2023-06-07 13:41:38', '2023-06-07 13:41:38', NULL),
(250, 'en', 'set_a_meta_tag_title_recommended_to_be_simple_and_unique', 'Set a meta tag title. Recommended to be simple and unique.', '2023-06-07 13:41:38', '2023-06-07 13:41:38', NULL),
(251, 'en', 'meta_description', 'Meta Description', '2023-06-07 13:41:38', '2023-06-07 13:41:38', NULL),
(252, 'en', 'type_your_meta_description', 'Type your meta description', '2023-06-07 13:41:38', '2023-06-07 13:41:38', NULL),
(253, 'en', 'meta_image', 'Meta Image', '2023-06-07 13:41:38', '2023-06-07 13:41:38', NULL),
(254, 'en', 'choose_meta_image', 'Choose Meta Image', '2023-06-07 13:41:38', '2023-06-07 13:41:38', NULL),
(255, 'en', 'save_product', 'Save Product', '2023-06-07 13:41:38', '2023-06-07 13:41:38', NULL),
(256, 'en', 'product_information', 'Product Information', '2023-06-07 13:41:38', '2023-06-07 13:41:38', NULL),
(257, 'en', 'product_images', 'Product Images', '2023-06-07 13:41:38', '2023-06-07 13:41:38', NULL),
(258, 'en', 'category', 'Category', '2023-06-07 13:41:38', '2023-06-07 13:41:38', NULL),
(259, 'en', 'product_brand__unit', 'Product Brand & Unit', '2023-06-07 13:41:38', '2023-06-07 13:41:38', NULL),
(260, 'en', 'price_sku_stock__variations', 'Price, SKU, Stock & Variations', '2023-06-07 13:41:38', '2023-06-07 13:41:38', NULL),
(261, 'en', 'sell_target_and_status', 'Sell Target and Status', '2023-06-07 13:41:38', '2023-06-07 13:41:38', NULL),
(262, 'en', 'seo_meta_options', 'SEO Meta Options', '2023-06-07 13:41:38', '2023-06-07 13:41:38', NULL),
(263, 'en', 'add_category', 'Add Category', '2023-06-07 13:42:46', '2023-06-07 13:42:46', NULL),
(264, 'en', 'category_name', 'Category Name', '2023-06-07 13:42:46', '2023-06-07 13:42:46', NULL),
(265, 'en', 'base_category', 'Base Category', '2023-06-07 13:42:47', '2023-06-07 13:42:47', NULL),
(266, 'en', 'brands', 'Brands', '2023-06-07 13:42:47', '2023-06-07 13:42:47', NULL),
(267, 'en', 'priority', 'Priority', '2023-06-07 13:42:47', '2023-06-07 13:42:47', NULL),
(268, 'en', 'add_new_category', 'Add New Category', '2023-06-07 13:42:51', '2023-06-07 13:42:51', NULL),
(269, 'en', 'type_your_category_name', 'Type your category name', '2023-06-07 13:42:51', '2023-06-07 13:42:51', NULL),
(270, 'en', 'select_brands', 'Select brands', '2023-06-07 13:42:51', '2023-06-07 13:42:51', NULL),
(271, 'en', 'sorting_priority_number', 'Sorting Priority Number', '2023-06-07 13:42:51', '2023-06-07 13:42:51', NULL),
(272, 'en', 'type_sorting_priority_number', 'Type sorting priority number', '2023-06-07 13:42:51', '2023-06-07 13:42:51', NULL),
(273, 'en', 'choose_category_thumbnail', 'Choose Category Thumbnail', '2023-06-07 13:42:51', '2023-06-07 13:42:51', NULL),
(274, 'en', 'save_category', 'Save Category', '2023-06-07 13:42:51', '2023-06-07 13:42:51', NULL),
(275, 'en', 'category_information', 'Category Information', '2023-06-07 13:42:51', '2023-06-07 13:42:51', NULL),
(276, 'en', 'category_image', 'Category Image', '2023-06-07 13:42:51', '2023-06-07 13:42:51', NULL),
(277, 'en', 'category_has_been_inserted_successfully', 'Category has been inserted successfully', '2023-06-07 13:43:03', '2023-06-07 13:43:03', NULL),
(278, 'en', 'na', 'N/A', '2023-06-07 13:43:03', '2023-06-07 13:43:03', NULL),
(279, 'en', 'delete', 'Delete', '2023-06-07 13:43:03', '2023-06-07 13:43:03', NULL),
(280, 'en', 'product_has_been_inserted_successfully', 'Product has been inserted successfully', '2023-06-07 13:43:35', '2023-06-07 13:43:35', NULL),
(281, 'en', 'view_details', 'View Details', '2023-06-07 13:43:36', '2023-06-07 13:43:36', NULL),
(282, 'en', 'add_new_brand', 'Add New Brand', '2023-06-07 13:47:11', '2023-06-07 13:47:11', NULL),
(283, 'en', 'brand_name', 'Brand Name', '2023-06-07 13:47:11', '2023-06-07 13:47:11', NULL),
(284, 'en', 'type_brand_name', 'Type brand name', '2023-06-07 13:47:11', '2023-06-07 13:47:11', NULL),
(285, 'en', 'brand_image', 'Brand Image', '2023-06-07 13:47:11', '2023-06-07 13:47:11', NULL),
(286, 'en', 'choose_brand_thumbnail', 'Choose Brand Thumbnail', '2023-06-07 13:47:12', '2023-06-07 13:47:12', NULL),
(287, 'en', 'save_brand', 'Save Brand', '2023-06-07 13:47:12', '2023-06-07 13:47:12', NULL),
(288, 'en', 'brand_information', 'Brand Information', '2023-06-07 13:47:12', '2023-06-07 13:47:12', NULL),
(289, 'en', 'add_brand_seo', 'Add Brand SEO', '2023-06-07 13:47:12', '2023-06-07 13:47:12', NULL),
(290, 'en', 'variations', 'Variations', '2023-06-07 13:49:19', '2023-06-07 13:49:19', NULL),
(291, 'en', 'add_values', 'Add Values', '2023-06-07 13:49:19', '2023-06-07 13:49:19', NULL),
(292, 'en', 'add_new_variation', 'Add New Variation', '2023-06-07 13:49:19', '2023-06-07 13:49:19', NULL),
(293, 'en', 'variation_name', 'Variation Name', '2023-06-07 13:49:19', '2023-06-07 13:49:19', NULL),
(294, 'en', 'type_variation_name', 'Type variation name', '2023-06-07 13:49:20', '2023-06-07 13:49:20', NULL),
(295, 'en', 'save_variation', 'Save Variation', '2023-06-07 13:49:20', '2023-06-07 13:49:20', NULL),
(296, 'en', 'variation_information', 'Variation Information', '2023-06-07 13:49:20', '2023-06-07 13:49:20', NULL),
(297, 'en', 'update_product', 'Update Product', '2023-06-07 13:50:38', '2023-06-07 13:50:38', NULL),
(298, 'en', 'product_slug', 'Product Slug', '2023-06-07 13:50:38', '2023-06-07 13:50:38', NULL),
(299, 'en', 'default_locations_stock', 'Default Location\'s Stock', '2023-06-07 13:50:38', '2023-06-07 13:50:38', NULL),
(300, 'en', 'add_another_variation', 'Add Another Variation', '2023-06-07 13:50:39', '2023-06-07 13:50:39', NULL),
(301, 'en', 'save_changes', 'Save Changes', '2023-06-07 13:50:39', '2023-06-07 13:50:39', NULL),
(302, 'en', 'we_have_listed_3_total_products', 'We have listed 3 total products.', '2023-06-07 15:18:44', '2023-06-07 15:18:44', NULL),
(303, 'en', 'pfe_member', 'PFE Member', '2023-06-07 15:18:44', '2023-06-07 15:18:44', NULL),
(304, 'en', 'buy_now', 'Buy Now', '2023-06-07 15:18:45', '2023-06-07 15:18:45', NULL),
(305, 'en', 'add_to_cart', 'Add to Cart', '2023-06-07 15:18:45', '2023-06-07 15:18:45', NULL),
(306, 'en', 'out_of_stock', 'Out of Stock', '2023-06-07 15:18:45', '2023-06-07 15:18:45', NULL),
(307, 'en', 'adding', 'Adding..', '2023-06-07 15:18:45', '2023-06-07 15:18:45', NULL),
(308, 'en', 'please_choose_all_the_available_options', 'Please choose all the available options', '2023-06-07 15:18:45', '2023-06-07 15:18:45', NULL),
(309, 'en', 'apply_coupon', 'Apply Coupon', '2023-06-07 15:18:46', '2023-06-07 15:18:46', NULL),
(310, 'en', 'please_wait', 'Please Wait', '2023-06-07 15:18:46', '2023-06-07 15:18:46', NULL),
(311, 'en', 'dark', 'Dark', '2023-06-07 15:18:46', '2023-06-07 15:18:46', NULL),
(312, 'en', 'light', 'Light', '2023-06-07 15:18:46', '2023-06-07 15:18:46', NULL),
(313, 'en', 'home', 'Home', '2023-06-07 15:18:46', '2023-06-07 15:18:46', NULL),
(314, 'en', 'contact_us', 'Contact Us', '2023-06-07 15:18:46', '2023-06-07 15:18:46', NULL),
(315, 'en', 'search_products', 'Search products', '2023-06-07 15:18:46', '2023-06-07 15:18:46', NULL),
(316, 'en', 'subtotal', 'Subtotal', '2023-06-07 15:18:46', '2023-06-07 15:18:46', NULL),
(317, 'en', 'view_cart', 'View Cart', '2023-06-07 15:18:46', '2023-06-07 15:18:46', NULL),
(318, 'en', 'checkout', 'Checkout', '2023-06-07 15:18:46', '2023-06-07 15:18:46', NULL),
(319, 'en', 'phone__telephone', 'Phone & Telephone', '2023-06-07 15:18:46', '2023-06-07 15:18:46', NULL),
(320, 'en', 'subscribe_to_the_us', 'Subscribe to the us', '2023-06-07 15:18:46', '2023-06-07 15:18:46', NULL),
(321, 'en', 'new_arrivals', 'New Arrivals', '2023-06-07 15:18:46', '2023-06-07 15:18:46', NULL),
(322, 'en', '_other_information', '& Other Information.', '2023-06-07 15:18:46', '2023-06-07 15:18:46', NULL),
(323, 'en', 'enter_email_address', 'Enter Email Address', '2023-06-07 15:18:46', '2023-06-07 15:18:46', NULL),
(324, 'en', 'subscribe_now', 'Subscribe Now', '2023-06-07 15:18:46', '2023-06-07 15:18:46', NULL),
(325, 'en', 'quick_links', 'Quick Links', '2023-06-07 15:18:46', '2023-06-07 15:18:46', NULL),
(326, 'en', 'customer_pages', 'Customer Pages', '2023-06-07 15:18:46', '2023-06-07 15:18:46', NULL),
(327, 'en', 'your_account', 'Your Account', '2023-06-07 15:18:46', '2023-06-07 15:18:46', NULL),
(328, 'en', 'your_orders', 'Your Orders', '2023-06-07 15:18:46', '2023-06-07 15:18:46', NULL),
(329, 'en', 'your_wishlist', 'Your Wishlist', '2023-06-07 15:18:46', '2023-06-07 15:18:46', NULL),
(330, 'en', 'address_book', 'Address Book', '2023-06-07 15:18:46', '2023-06-07 15:18:46', NULL),
(331, 'en', 'update_profile', 'Update Profile', '2023-06-07 15:18:46', '2023-06-07 15:18:46', NULL),
(332, 'en', 'contact_info', 'Contact Info', '2023-06-07 15:18:47', '2023-06-07 15:18:47', NULL),
(333, 'en', 'account', 'Account', '2023-06-07 15:18:47', '2023-06-07 15:18:47', NULL),
(334, 'en', 'only_customer_can_add_products_to_wishlist', 'Only customer can add products to wishlist', '2023-06-07 15:21:01', '2023-06-07 15:21:01', NULL),
(335, 'en', 'explore_now', 'Explore Now', '2023-06-07 15:21:10', '2023-06-07 15:21:10', NULL),
(336, 'en', 'follow_on', 'Follow on', '2023-06-07 15:21:10', '2023-06-07 15:21:10', NULL),
(337, 'en', 'our_top_categories', 'Our Top Categories', '2023-06-07 15:21:10', '2023-06-07 15:21:10', NULL),
(338, 'en', 'our_featured_products', 'Our Featured Products', '2023-06-07 15:21:10', '2023-06-07 15:21:10', NULL),
(339, 'en', 'top_trending_products', 'Top Trending Products', '2023-06-07 15:21:11', '2023-06-07 15:21:11', NULL),
(340, 'en', 'weekly_best_deals', 'Weekly Best Deals', '2023-06-07 15:21:11', '2023-06-07 15:21:11', NULL),
(341, 'en', 'days', 'Days', '2023-06-07 15:21:11', '2023-06-07 15:21:11', NULL),
(342, 'en', 'hours', 'Hours', '2023-06-07 15:21:11', '2023-06-07 15:21:11', NULL),
(343, 'en', 'min', 'Min', '2023-06-07 15:21:11', '2023-06-07 15:21:11', NULL),
(344, 'en', 'sec', 'Sec', '2023-06-07 15:21:11', '2023-06-07 15:21:11', NULL),
(345, 'en', 'what_our_clients_say', 'What Our Clients Say', '2023-06-07 15:21:11', '2023-06-07 15:21:11', NULL),
(346, 'en', 'new_products', 'New Products', '2023-06-07 15:21:11', '2023-06-07 15:21:11', NULL),
(347, 'en', 'view_more', 'View More', '2023-06-07 15:21:11', '2023-06-07 15:21:11', NULL),
(348, 'en', 'best_selling', 'Best Selling', '2023-06-07 15:21:11', '2023-06-07 15:21:11', NULL),
(349, 'en', 'browse_recent_post', 'Browse Recent Post', '2023-06-07 15:21:12', '2023-06-07 15:21:12', NULL),
(350, 'en', 'learn_more_about_our_recent_exclusive_news_updates__articles', 'Learn More About Our Recent Exclusive News, Updates & Articles', '2023-06-07 15:21:12', '2023-06-07 15:21:12', NULL),
(351, 'en', 'add_employee', 'Add Employee', '2023-06-07 15:23:13', '2023-06-07 15:23:13', NULL),
(352, 'en', 'role', 'Role', '2023-06-07 15:23:13', '2023-06-07 15:23:13', NULL),
(353, 'en', 'add_new_employee_staff', 'Add New Employee Staff', '2023-06-07 15:23:25', '2023-06-07 15:23:25', NULL),
(354, 'en', 'add_new_staff', 'Add New Staff', '2023-06-07 15:23:25', '2023-06-07 15:23:25', NULL),
(355, 'en', 'staff_name', 'Staff Name', '2023-06-07 15:23:25', '2023-06-07 15:23:25', NULL),
(356, 'en', 'type_staff_name', 'Type staff name', '2023-06-07 15:23:25', '2023-06-07 15:23:25', NULL),
(357, 'en', 'staff_email', 'Staff Email', '2023-06-07 15:23:25', '2023-06-07 15:23:25', NULL),
(358, 'en', 'type_staff_email', 'Type staff email', '2023-06-07 15:23:25', '2023-06-07 15:23:25', NULL),
(359, 'en', 'staff_role', 'Staff Role', '2023-06-07 15:23:25', '2023-06-07 15:23:25', NULL),
(360, 'en', 'staff_phone', 'Staff Phone', '2023-06-07 15:23:26', '2023-06-07 15:23:26', NULL),
(361, 'en', 'type_staff_phone', 'Type staff phone', '2023-06-07 15:23:26', '2023-06-07 15:23:26', NULL),
(362, 'en', 'type_password', 'Type password', '2023-06-07 15:23:26', '2023-06-07 15:23:26', NULL),
(363, 'en', 'save_staff', 'Save Staff', '2023-06-07 15:23:26', '2023-06-07 15:23:26', NULL),
(364, 'en', 'staff_information', 'Staff Information', '2023-06-07 15:23:26', '2023-06-07 15:23:26', NULL),
(365, 'en', 'staff_has_been_inserted_successfully', 'Staff has been inserted successfully', '2023-06-07 15:23:40', '2023-06-07 15:23:40', NULL),
(366, 'en', 'register_as_a_customer', 'Register as a Customer.', '2023-06-07 15:24:26', '2023-06-07 15:24:26', NULL),
(367, 'en', 'full_name', 'Full name', '2023-06-07 15:24:26', '2023-06-07 15:24:26', NULL),
(368, 'en', 'enter_your_name', 'Enter your name', '2023-06-07 15:24:26', '2023-06-07 15:24:26', NULL),
(369, 'en', 'enter_phone_number_with_country_code', 'Enter phone number with country code', '2023-06-07 15:24:27', '2023-06-07 15:24:27', NULL),
(370, 'en', 'confirm_password', 'Confirm Password', '2023-06-07 15:24:27', '2023-06-07 15:24:27', NULL),
(371, 'en', 'already_have_an_account', 'Already have an Account?', '2023-06-07 15:24:27', '2023-06-07 15:24:27', NULL),
(372, 'en', 'a_verification_code_has_been_sent_to_your_phone', 'A verification code has been sent to your phone.', '2023-06-07 15:26:36', '2023-06-07 15:26:36', NULL),
(373, 'en', 'verify_phone_number', 'Verify Phone Number', '2023-06-07 15:26:36', '2023-06-07 15:26:36', NULL),
(374, 'en', 'verify_your_phone_number', 'Verify Your Phone Number', '2023-06-07 15:26:36', '2023-06-07 15:26:36', NULL),
(375, 'en', 'enter_your_phone_number', 'Enter your phone number', '2023-06-07 15:26:36', '2023-06-07 15:26:36', NULL),
(376, 'en', 'verification_code', 'Verification Code', '2023-06-07 15:26:36', '2023-06-07 15:26:36', NULL),
(377, 'en', 'enter_verification_code', 'Enter verification code', '2023-06-07 15:26:36', '2023-06-07 15:26:36', NULL),
(378, 'en', 'verify', 'Verify', '2023-06-07 15:26:36', '2023-06-07 15:26:36', NULL),
(379, 'en', 'dont_have_get_any_code', 'Don\'t have get any code?', '2023-06-07 15:26:36', '2023-06-07 15:26:36', NULL),
(380, 'en', 'resend', 'Resend', '2023-06-07 15:26:36', '2023-06-07 15:26:36', NULL),
(381, 'en', 'we_have_listed_4_total_products', 'We have listed 4 total products.', '2023-06-07 15:39:51', '2023-06-07 15:39:51', NULL),
(382, 'en', 'additional_information', 'Additional Information', '2023-06-07 15:40:40', '2023-06-07 15:40:40', NULL),
(383, 'en', 'not_available', 'Not Available', '2023-06-07 15:40:40', '2023-06-07 15:40:40', NULL),
(384, 'en', 'you_may_be_interested', 'You may be interested', '2023-06-07 15:40:40', '2023-06-07 15:40:40', NULL),
(385, 'en', 'product_has_been_updated_successfully', 'Product has been updated successfully', '2023-06-07 15:44:55', '2023-06-07 15:44:55', NULL),
(386, 'en', 'search_now', 'Search Now', '2023-06-07 15:45:27', '2023-06-07 15:45:27', NULL),
(387, 'en', 'filter_by_price', 'Filter by Price', '2023-06-07 15:45:27', '2023-06-07 15:45:27', NULL),
(388, 'en', 'filter', 'Filter', '2023-06-07 15:45:27', '2023-06-07 15:45:27', NULL),
(389, 'en', 'show', 'Show', '2023-06-07 15:45:27', '2023-06-07 15:45:27', NULL),
(390, 'en', 'sort_by', 'Sort by', '2023-06-07 15:45:27', '2023-06-07 15:45:27', NULL),
(391, 'en', 'newest_first', 'Newest First', '2023-06-07 15:45:27', '2023-06-07 15:45:27', NULL),
(392, 'en', 'off', 'Off', '2023-06-07 15:45:27', '2023-06-07 15:45:27', NULL),
(393, 'en', 'category_has_been_deleted_successfully', 'Category has been deleted successfully', '2023-06-07 15:51:06', '2023-06-07 15:51:06', NULL),
(394, 'en', 'update_category', 'Update Category', '2023-06-07 16:06:09', '2023-06-07 16:06:09', NULL),
(395, 'en', 'category_has_been_updated_successfully', 'Category has been updated successfully', '2023-06-07 16:06:27', '2023-06-07 16:06:27', NULL),
(396, 'en', 'website_homepage_configuration', 'Website Homepage Configuration', '2023-06-07 16:17:41', '2023-06-07 16:17:41', NULL),
(397, 'en', 'hero_section_configuration', 'Hero Section Configuration', '2023-06-07 16:17:41', '2023-06-07 16:17:41', NULL),
(398, 'en', 'id', 'ID', '2023-06-07 16:17:41', '2023-06-07 16:17:41', NULL),
(399, 'en', 'image', 'Image', '2023-06-07 16:17:41', '2023-06-07 16:17:41', NULL),
(400, 'en', 'sub_title', 'Sub Title', '2023-06-07 16:17:41', '2023-06-07 16:17:41', NULL),
(401, 'en', 'title', 'Title', '2023-06-07 16:17:41', '2023-06-07 16:17:41', NULL),
(402, 'en', 'text', 'Text', '2023-06-07 16:17:42', '2023-06-07 16:17:42', NULL),
(403, 'en', 'add_new_slider', 'Add New Slider', '2023-06-07 16:17:42', '2023-06-07 16:17:42', NULL),
(404, 'en', 'type_sub_title', 'Type sub title', '2023-06-07 16:17:42', '2023-06-07 16:17:42', NULL),
(405, 'en', 'type_title', 'Type title', '2023-06-07 16:17:42', '2023-06-07 16:17:42', NULL),
(406, 'en', 'type_text', 'Type text', '2023-06-07 16:17:42', '2023-06-07 16:17:42', NULL),
(407, 'en', 'link', 'Link', '2023-06-07 16:17:42', '2023-06-07 16:17:42', NULL),
(408, 'en', 'slider_image', 'Slider Image', '2023-06-07 16:17:42', '2023-06-07 16:17:42', NULL),
(409, 'en', 'choose_slider_image', 'Choose Slider Image', '2023-06-07 16:17:42', '2023-06-07 16:17:42', NULL),
(410, 'en', 'save_slider', 'Save Slider', '2023-06-07 16:17:42', '2023-06-07 16:17:42', NULL),
(411, 'en', 'homepage_configuration', 'Homepage Configuration', '2023-06-07 16:17:42', '2023-06-07 16:17:42', NULL),
(412, 'en', 'hero_section', 'Hero Section', '2023-06-07 16:17:42', '2023-06-07 16:17:42', NULL),
(413, 'en', 'top_categories', 'Top Categories', '2023-06-07 16:17:42', '2023-06-07 16:17:42', NULL),
(414, 'en', 'featured_products', 'Featured Products', '2023-06-07 16:17:42', '2023-06-07 16:17:42', NULL),
(415, 'en', 'banner_section_one', 'Banner Section One', '2023-06-07 16:17:42', '2023-06-07 16:17:42', NULL),
(416, 'en', 'banner_section_two', 'Banner Section Two', '2023-06-07 16:17:42', '2023-06-07 16:17:42', NULL),
(417, 'en', 'client_feedback', 'Client Feedback', '2023-06-07 16:17:42', '2023-06-07 16:17:42', NULL),
(418, 'en', 'about', 'About', '2023-06-07 16:19:56', '2023-06-07 16:19:56', NULL),
(419, 'en', 'our_mission', 'Our Mission', '2023-06-07 16:19:56', '2023-06-07 16:19:56', NULL),
(420, 'en', 'our_vision', 'Our Vision', '2023-06-07 16:19:56', '2023-06-07 16:19:56', NULL),
(421, 'en', 'the_most_popular_brands', 'The Most Popular Brands', '2023-06-07 16:19:56', '2023-06-07 16:19:56', NULL),
(422, 'en', 'update_slider', 'Update Slider', '2023-06-07 16:25:37', '2023-06-07 16:25:37', NULL),
(423, 'en', 'slider_updated_successfully', 'Slider updated successfully', '2023-06-07 16:28:57', '2023-06-07 16:28:57', NULL),
(424, 'en', 'intro_section', 'Intro Section', '2023-06-07 16:34:55', '2023-06-07 16:34:55', NULL),
(425, 'en', 'mission', 'Mission', '2023-06-07 16:34:55', '2023-06-07 16:34:55', NULL),
(426, 'en', 'vision', 'Vision', '2023-06-07 16:34:55', '2023-06-07 16:34:55', NULL),
(427, 'en', 'quote', 'Quote', '2023-06-07 16:34:55', '2023-06-07 16:34:55', NULL),
(428, 'en', 'quote_by', 'Quote By', '2023-06-07 16:34:55', '2023-06-07 16:34:55', NULL),
(429, 'en', 'type_name_of_the_user', 'Type name of the user', '2023-06-07 16:34:55', '2023-06-07 16:34:55', NULL),
(430, 'en', 'choose_banner_image', 'Choose Banner Image', '2023-06-07 16:34:55', '2023-06-07 16:34:55', NULL),
(431, 'en', 'about_us_configuration', 'About Us Configuration', '2023-06-07 16:34:55', '2023-06-07 16:34:55', NULL),
(432, 'en', 'popular_brands', 'Popular Brands', '2023-06-07 16:34:55', '2023-06-07 16:34:55', NULL),
(433, 'en', 'features_section', 'Features Section', '2023-06-07 16:34:55', '2023-06-07 16:34:55', NULL),
(434, 'en', 'why_choose_us', 'Why Choose Us', '2023-06-07 16:34:55', '2023-06-07 16:34:55', NULL),
(435, 'en', 'settings_updated_successfully', 'Settings updated successfully', '2023-06-07 16:39:45', '2023-06-07 16:39:45', NULL),
(436, 'en', 'website_header_configuration', 'Website Header Configuration', '2023-06-07 16:41:15', '2023-06-07 16:41:15', NULL),
(437, 'en', 'topbar_information', 'Topbar Information', '2023-06-07 16:41:15', '2023-06-07 16:41:15', NULL),
(438, 'en', 'welcome_text', 'Welcome Text', '2023-06-07 16:41:15', '2023-06-07 16:41:15', NULL),
(439, 'en', 'welcome_to_our_organic_store', 'Welcome to our organic store', '2023-06-07 16:41:15', '2023-06-07 16:41:15', NULL),
(440, 'en', 'topbar_email', 'Topbar Email', '2023-06-07 16:41:15', '2023-06-07 16:41:15', NULL),
(441, 'en', 'grostoresupportcom', 'grostore@support.com', '2023-06-07 16:41:15', '2023-06-07 16:41:15', NULL),
(442, 'en', 'topbar_location', 'Topbar Location', '2023-06-07 16:41:15', '2023-06-07 16:41:15', NULL),
(443, 'en', 'washington_new_york_usa__254230', 'Washington, New York, USA - 254230', '2023-06-07 16:41:15', '2023-06-07 16:41:15', NULL),
(444, 'en', 'facebook_link', 'Facebook Link', '2023-06-07 16:41:15', '2023-06-07 16:41:15', NULL),
(445, 'en', 'twitter_link', 'Twitter Link', '2023-06-07 16:41:15', '2023-06-07 16:41:15', NULL),
(446, 'en', 'linkedin_link', 'LinkedIn Link', '2023-06-07 16:41:15', '2023-06-07 16:41:15', NULL),
(447, 'en', 'youtube_link', 'Youtube Link', '2023-06-07 16:41:15', '2023-06-07 16:41:15', NULL),
(448, 'en', 'navbar_information', 'Navbar Information', '2023-06-07 16:41:15', '2023-06-07 16:41:15', NULL),
(449, 'en', 'navbar_logo', 'Navbar Logo', '2023-06-07 16:41:15', '2023-06-07 16:41:15', NULL),
(450, 'en', 'choose_navbar_logo', 'Choose Navbar Logo', '2023-06-07 16:41:15', '2023-06-07 16:41:15', NULL),
(451, 'en', 'select_pages', 'Select pages', '2023-06-07 16:41:15', '2023-06-07 16:41:15', NULL),
(452, 'en', 'contact_number', 'Contact Number', '2023-06-07 16:41:15', '2023-06-07 16:41:15', NULL),
(453, 'en', 'header_configuration', 'Header Configuration', '2023-06-07 16:41:15', '2023-06-07 16:41:15', NULL),
(454, 'en', 'website_footer_configuration', 'Website Footer Configuration', '2023-06-07 16:46:10', '2023-06-07 16:46:10', NULL),
(455, 'en', 'select_quick_link_pages', 'Select quick link pages', '2023-06-07 16:46:10', '2023-06-07 16:46:10', NULL),
(456, 'en', 'copyright_text', 'Copyright Text', '2023-06-07 16:46:10', '2023-06-07 16:46:10', NULL),
(457, 'en', 'footer_logo', 'Footer Logo', '2023-06-07 16:46:10', '2023-06-07 16:46:10', NULL),
(458, 'en', 'choose_footer_logo', 'Choose Footer Logo', '2023-06-07 16:46:10', '2023-06-07 16:46:10', NULL),
(459, 'en', 'accepted_payment', 'Accepted Payment', '2023-06-07 16:46:10', '2023-06-07 16:46:10', NULL),
(460, 'en', 'choose_accepted_payment_banner', 'Choose Accepted Payment Banner', '2023-06-07 16:46:10', '2023-06-07 16:46:10', NULL),
(461, 'en', 'footer_configuration', 'Footer Configuration', '2023-06-07 16:46:10', '2023-06-07 16:46:10', NULL),
(462, 'en', 'general_information', 'General Information', '2023-06-07 16:46:10', '2023-06-07 16:46:10', NULL),
(463, 'en', 'product_page_configuration', 'Product Page Configuration', '2023-06-07 16:48:26', '2023-06-07 16:48:26', NULL),
(464, 'en', 'product_details_widget', 'Product Details Widget', '2023-06-07 16:48:26', '2023-06-07 16:48:26', NULL),
(465, 'en', 'add_new_widget', 'Add New Widget', '2023-06-07 16:48:26', '2023-06-07 16:48:26', NULL),
(466, 'en', 'icon', 'Icon', '2023-06-07 16:48:26', '2023-06-07 16:48:26', NULL),
(467, 'en', 'choose_icon_image', 'Choose Icon Image', '2023-06-07 16:48:26', '2023-06-07 16:48:26', NULL),
(468, 'en', 'save_widget', 'Save Widget', '2023-06-07 16:48:26', '2023-06-07 16:48:26', NULL),
(469, 'en', 'add_promotional_banner', 'Add Promotional Banner', '2023-06-07 16:48:26', '2023-06-07 16:48:26', NULL),
(470, 'en', 'type_link', 'Type link', '2023-06-07 16:48:26', '2023-06-07 16:48:26', NULL),
(471, 'en', 'promotional_banner', 'Promotional Banner', '2023-06-07 16:48:26', '2023-06-07 16:48:26', NULL),
(472, 'en', 'choose_promotional_banner', 'Choose Promotional Banner', '2023-06-07 16:48:26', '2023-06-07 16:48:26', NULL),
(473, 'en', 'save_banner', 'Save Banner', '2023-06-07 16:48:26', '2023-06-07 16:48:26', NULL),
(474, 'en', 'product_details_page', 'Product Details Page', '2023-06-07 16:48:26', '2023-06-07 16:48:26', NULL),
(475, 'en', 'widgets', 'Widgets', '2023-06-07 16:48:26', '2023-06-07 16:48:26', NULL),
(476, 'en', 'products_listing', 'Products Listing', '2023-06-07 16:48:45', '2023-06-07 16:48:45', NULL),
(477, 'en', 'save', 'Save', '2023-06-07 16:48:46', '2023-06-07 16:48:46', NULL),
(478, 'en', 'product_added_to_your_cart', 'Product added to your cart', '2023-06-07 17:23:09', '2023-06-07 17:23:09', NULL),
(479, 'en', 'unit_price', 'Unit Price', '2023-06-07 17:23:09', '2023-06-07 17:23:09', NULL),
(480, 'en', 'total_price', 'Total Price', '2023-06-07 17:23:09', '2023-06-07 17:23:09', NULL),
(481, 'en', 'please_login_as_customer_to_continue', 'Please login as customer to continue', '2023-06-07 17:23:15', '2023-06-07 17:23:15', NULL),
(482, 'en', 'issue', 'Issue', '2023-06-07 18:23:22', '2023-06-07 18:23:22', NULL),
(483, 'en', 'message', 'Message', '2023-06-07 18:23:22', '2023-06-07 18:23:22', NULL),
(484, 'en', 'paid', 'Paid', '2023-06-07 18:23:29', '2023-06-07 18:23:29', NULL),
(485, 'en', 'unpaid', 'Unpaid', '2023-06-07 18:23:29', '2023-06-07 18:23:29', NULL),
(486, 'en', 'order_placed', 'Order Placed', '2023-06-07 18:23:29', '2023-06-07 18:23:29', NULL),
(487, 'en', 'pending', 'Pending', '2023-06-07 18:23:29', '2023-06-07 18:23:29', NULL),
(488, 'en', 'processing', 'Processing', '2023-06-07 18:23:29', '2023-06-07 18:23:29', NULL),
(489, 'en', 'delivered', 'Delivered', '2023-06-07 18:23:29', '2023-06-07 18:23:29', NULL),
(490, 'en', 'cancelled', 'Cancelled', '2023-06-07 18:23:29', '2023-06-07 18:23:29', NULL),
(491, 'en', 'total_amount', 'Total Amount', '2023-06-07 18:23:29', '2023-06-07 18:23:29', NULL),
(492, 'en', 'amount', 'Amount', '2023-06-07 18:23:29', '2023-06-07 18:23:29', NULL),
(493, 'en', 'sales_report', 'Sales Report', '2023-06-07 18:23:36', '2023-06-07 18:23:36', NULL),
(494, 'en', 'product_sales_report', 'Product Sales Report', '2023-06-07 18:23:36', '2023-06-07 18:23:36', NULL),
(495, 'en', 'high__low', 'High ⟶ Low', '2023-06-07 18:23:36', '2023-06-07 18:23:36', NULL),
(496, 'en', 'low__high', 'Low ⟶ High', '2023-06-07 18:23:36', '2023-06-07 18:23:36', NULL),
(497, 'en', 'total_sales', 'Total Sales', '2023-06-07 18:23:36', '2023-06-07 18:23:36', NULL);
INSERT INTO `localizations` (`id`, `lang_key`, `t_key`, `t_value`, `created_at`, `updated_at`, `deleted_at`) VALUES
(498, 'en', 'category_sales_report', 'Category Sales Report', '2023-06-07 18:23:59', '2023-06-07 18:23:59', NULL),
(499, 'en', 'category_wise_sales_report', 'Category Wise Sales Report', '2023-06-07 18:23:59', '2023-06-07 18:23:59', NULL),
(500, 'en', 'amount_wise_sales_report', 'Amount Wise Sales Report', '2023-06-07 18:24:06', '2023-06-07 18:24:06', NULL),
(501, 'en', 'date', 'Date', '2023-06-07 18:24:06', '2023-06-07 18:24:06', NULL),
(502, 'en', 'delivery_status_wise_report', 'Delivery Status Wise Report', '2023-06-07 18:24:12', '2023-06-07 18:24:12', NULL),
(503, 'en', 'add_campaign', 'Add Campaign', '2023-06-07 18:25:13', '2023-06-07 18:25:13', NULL),
(504, 'en', 'start_date', 'Start Date', '2023-06-07 18:25:13', '2023-06-07 18:25:13', NULL),
(505, 'en', 'end_date', 'End Date', '2023-06-07 18:25:13', '2023-06-07 18:25:13', NULL),
(506, 'en', 'add_coupon', 'Add Coupon', '2023-06-07 18:25:18', '2023-06-07 18:25:18', NULL),
(507, 'en', 'send_bulk_emails', 'Send Bulk Emails', '2023-06-07 18:27:17', '2023-06-07 18:27:17', NULL),
(508, 'en', 'select_users', 'Select Users', '2023-06-07 18:27:17', '2023-06-07 18:27:17', NULL),
(509, 'en', 'select_subscribers', 'Select Subscribers', '2023-06-07 18:27:17', '2023-06-07 18:27:17', NULL),
(510, 'en', 'email_subject', 'Email Subject', '2023-06-07 18:27:17', '2023-06-07 18:27:17', NULL),
(511, 'en', 'email_body', 'Email Body', '2023-06-07 18:27:17', '2023-06-07 18:27:17', NULL),
(512, 'en', 'send_emails', 'Send Emails', '2023-06-07 18:27:17', '2023-06-07 18:27:17', NULL),
(513, 'en', 'subscribed_users', 'Subscribed users', '2023-06-07 18:27:20', '2023-06-07 18:27:20', NULL),
(514, 'en', 'suibscribed_at', 'Suibscribed At', '2023-06-07 18:27:20', '2023-06-07 18:27:20', NULL),
(515, 'en', 'file_has_been_deleted_successfully', 'File has been deleted successfully', '2023-06-07 18:27:43', '2023-06-07 18:27:43', NULL),
(516, 'en', 'we_have_listed_14_total_products', 'We have listed 14 total products.', '2023-06-07 18:38:44', '2023-06-07 18:38:44', NULL),
(517, 'en', 'conatct_us', 'Conatct Us', '2023-06-07 18:47:21', '2023-06-07 18:47:21', NULL),
(518, 'en', 'get_in_touch', 'Get In Touch', '2023-06-07 18:47:21', '2023-06-07 18:47:21', NULL),
(519, 'en', 'contact_details', 'Contact Details', '2023-06-07 18:47:21', '2023-06-07 18:47:21', NULL),
(520, 'en', 'office_address', 'Office Address', '2023-06-07 18:47:21', '2023-06-07 18:47:21', NULL),
(521, 'en', 'emergency_call', 'Emergency Call', '2023-06-07 18:47:21', '2023-06-07 18:47:21', NULL),
(522, 'en', 'general_communicationl', 'General Communicationl', '2023-06-07 18:47:21', '2023-06-07 18:47:21', NULL),
(523, 'en', 'find_us_on', 'Find us on', '2023-06-07 18:47:21', '2023-06-07 18:47:21', NULL),
(524, 'en', 'need_help_send_message', 'Need Help? Send Message', '2023-06-07 18:47:21', '2023-06-07 18:47:21', NULL),
(525, 'en', 'your_name', 'Your name', '2023-06-07 18:47:21', '2023-06-07 18:47:21', NULL),
(526, 'en', 'you_email', 'You email', '2023-06-07 18:47:21', '2023-06-07 18:47:21', NULL),
(527, 'en', 'you_phone', 'You phone', '2023-06-07 18:47:21', '2023-06-07 18:47:21', NULL),
(528, 'en', 'delivery_problem', 'Delivery Problem', '2023-06-07 18:47:21', '2023-06-07 18:47:21', NULL),
(529, 'en', 'customer_service', 'Customer Service', '2023-06-07 18:47:21', '2023-06-07 18:47:21', NULL),
(530, 'en', 'others_service', 'Others Service', '2023-06-07 18:47:21', '2023-06-07 18:47:21', NULL),
(531, 'en', 'messages', 'Messages', '2023-06-07 18:47:21', '2023-06-07 18:47:21', NULL),
(532, 'en', 'write_your_message', 'Write your message', '2023-06-07 18:47:21', '2023-06-07 18:47:21', NULL),
(533, 'en', 'send_message', 'Send Message', '2023-06-07 18:47:21', '2023-06-07 18:47:21', NULL),
(534, 'en', 'logistic_has_been_inserted_successfully', 'Logistic has been inserted successfully', '2023-06-07 20:26:21', '2023-06-07 20:26:21', NULL),
(535, 'en', 'invalid_login_credentials', 'Invalid login credentials.', '2023-06-07 21:04:35', '2023-06-07 21:04:35', NULL),
(536, 'en', 'add_shipping_zone', 'Add Shipping Zone', '2023-06-07 21:05:23', '2023-06-07 21:05:23', NULL),
(537, 'en', 'zone_name', 'Zone Name', '2023-06-07 21:05:23', '2023-06-07 21:05:23', NULL),
(538, 'en', 'type_your_zone_name', 'Type your zone name', '2023-06-07 21:05:23', '2023-06-07 21:05:23', NULL),
(539, 'en', 'select_logistic', 'Select logistic', '2023-06-07 21:05:23', '2023-06-07 21:05:23', NULL),
(540, 'en', 'select_cities', 'Select cities', '2023-06-07 21:05:23', '2023-06-07 21:05:23', NULL),
(541, 'en', 'standard_delivery_charge', 'Standard Delivery Charge', '2023-06-07 21:05:23', '2023-06-07 21:05:23', NULL),
(542, 'en', '1__3_days', '1 - 3 days', '2023-06-07 21:05:23', '2023-06-07 21:05:23', NULL),
(543, 'en', 'save_zone', 'Save Zone', '2023-06-07 21:05:23', '2023-06-07 21:05:23', NULL),
(544, 'en', 'zone_information', 'Zone Information', '2023-06-07 21:05:23', '2023-06-07 21:05:23', NULL),
(545, 'en', 'off', 'Off', '2023-06-07 23:13:19', '2023-06-07 23:13:19', NULL),
(546, 'en', 'the_password_must_be_at_least_6_characters', 'The password must be at least 6 characters.', '2023-06-07 23:21:05', '2023-06-07 23:21:05', NULL),
(547, 'en', 'your_account_has_been_verified_successfully', 'Your account has been verified successfully', '2023-06-07 23:22:43', '2023-06-07 23:22:43', NULL),
(548, 'en', 'customer_dashboard', 'Customer Dashboard', '2023-06-07 23:22:43', '2023-06-07 23:22:43', NULL),
(549, 'en', 'total_shipped', 'Total Shipped', '2023-06-07 23:22:43', '2023-06-07 23:22:43', NULL),
(550, 'en', 'new_orders', 'New Orders', '2023-06-07 23:22:43', '2023-06-07 23:22:43', NULL),
(551, 'en', 'manage_my_account', 'Manage My Account', '2023-06-07 23:22:44', '2023-06-07 23:22:44', NULL),
(552, 'en', 'order_history', 'Order History', '2023-06-07 23:22:44', '2023-06-07 23:22:44', NULL),
(553, 'en', 'wallet_history', 'Wallet History', '2023-06-07 23:22:44', '2023-06-07 23:22:44', NULL),
(554, 'en', 'refund_history', 'Refund History', '2023-06-07 23:22:44', '2023-06-07 23:22:44', NULL),
(555, 'en', 'track_order', 'Track Order', '2023-06-07 23:22:44', '2023-06-07 23:22:44', NULL),
(556, 'en', 'updated_profile', 'Updated Profile', '2023-06-07 23:22:44', '2023-06-07 23:22:44', NULL),
(557, 'en', 'log_out', 'Log out', '2023-06-07 23:22:44', '2023-06-07 23:22:44', NULL),
(558, 'en', 'total', 'Total', '2023-06-07 23:22:44', '2023-06-07 23:22:44', NULL),
(559, 'en', 'status', 'Status', '2023-06-07 23:22:44', '2023-06-07 23:22:44', NULL),
(560, 'en', 'my_orders', 'My Orders', '2023-06-07 23:22:44', '2023-06-07 23:22:44', NULL),
(561, 'en', 'my_wishlist', 'My Wishlist', '2023-06-07 23:22:44', '2023-06-07 23:22:44', NULL),
(562, 'en', 'check_out', 'Check Out', '2023-06-07 23:23:05', '2023-06-07 23:23:05', NULL),
(563, 'en', 'shipping_address', 'Shipping Address', '2023-06-07 23:23:05', '2023-06-07 23:23:05', NULL),
(564, 'en', 'add_address', 'Add Address', '2023-06-07 23:23:05', '2023-06-07 23:23:05', NULL),
(565, 'en', 'add_your_address_to_checkout', 'Add your address to checkout', '2023-06-07 23:23:05', '2023-06-07 23:23:05', NULL),
(566, 'en', 'preferred_delivery_time', 'Preferred Delivery Time', '2023-06-07 23:23:05', '2023-06-07 23:23:05', NULL),
(567, 'en', 'regular_delivery', 'Regular Delivery', '2023-06-07 23:23:05', '2023-06-07 23:23:05', NULL),
(568, 'en', 'we_will_deliver_your_products_soon', 'We will deliver your products soon.', '2023-06-07 23:23:05', '2023-06-07 23:23:05', NULL),
(569, 'en', 'enhance_your_bouquet_with_a_heartfelt_message', 'Enhance Your Bouquet With a Heartfelt Message', '2023-06-07 23:23:05', '2023-06-07 23:23:05', NULL),
(570, 'en', 'gift_card_message', 'Gift Card Message', '2023-06-07 23:23:05', '2023-06-07 23:23:05', NULL),
(571, 'en', 'happy_birthay', 'Happy Birthay', '2023-06-07 23:23:05', '2023-06-07 23:23:05', NULL),
(572, 'en', 'payment_method', 'Payment Method', '2023-06-07 23:23:05', '2023-06-07 23:23:05', NULL),
(573, 'en', 'order_summery', 'Order Summery', '2023-06-07 23:23:06', '2023-06-07 23:23:06', NULL),
(574, 'en', 'tax', 'Tax', '2023-06-07 23:23:06', '2023-06-07 23:23:06', NULL),
(575, 'en', 'place_order', 'Place Order', '2023-06-07 23:23:06', '2023-06-07 23:23:06', NULL),
(576, 'en', 'add_new_address', 'Add New Address', '2023-06-07 23:23:06', '2023-06-07 23:23:06', NULL),
(577, 'en', 'select_country', 'Select Country', '2023-06-07 23:23:06', '2023-06-07 23:23:06', NULL),
(578, 'en', 'select_state', 'Select State', '2023-06-07 23:23:06', '2023-06-07 23:23:06', NULL),
(579, 'en', 'city', 'City', '2023-06-07 23:23:06', '2023-06-07 23:23:06', NULL),
(580, 'en', 'select_city', 'Select City', '2023-06-07 23:23:06', '2023-06-07 23:23:06', NULL),
(581, 'en', 'default_address', 'Default Address?', '2023-06-07 23:23:06', '2023-06-07 23:23:06', NULL),
(582, 'en', 'no', 'No', '2023-06-07 23:23:06', '2023-06-07 23:23:06', NULL),
(583, 'en', 'set_default', 'Set Default', '2023-06-07 23:23:06', '2023-06-07 23:23:06', NULL),
(584, 'en', 'address', 'Address', '2023-06-07 23:23:06', '2023-06-07 23:23:06', NULL),
(585, 'en', '25_elephant_road_new_town', '2/5 Elephant Road, New Town', '2023-06-07 23:23:06', '2023-06-07 23:23:06', NULL),
(586, 'en', 'update_address', 'Update Address', '2023-06-07 23:23:06', '2023-06-07 23:23:06', NULL),
(587, 'en', 'delete_address', 'Delete Address', '2023-06-07 23:23:06', '2023-06-07 23:23:06', NULL),
(588, 'en', 'want_to_delete_this_address', 'Want to delete this address?', '2023-06-07 23:23:06', '2023-06-07 23:23:06', NULL),
(589, 'en', 'address_has_been_inserted_successfully', 'Address has been inserted successfully', '2023-06-07 23:23:35', '2023-06-07 23:23:35', NULL),
(590, 'en', 'billing_address', 'Billing Address', '2023-06-07 23:23:35', '2023-06-07 23:23:35', NULL),
(591, 'en', 'available_logistics', 'Available Logistics', '2023-06-07 23:23:37', '2023-06-07 23:23:37', NULL),
(592, 'en', 'we_are_not_shipping_to_your_city_now', 'We are not shipping to your city now.', '2023-06-07 23:23:37', '2023-06-07 23:23:37', NULL),
(593, 'en', 'zone_has_been_inserted_successfully', 'Zone has been inserted successfully', '2023-06-07 23:24:32', '2023-06-07 23:24:32', NULL),
(594, 'en', 'personal_information', 'Personal Information', '2023-06-07 23:29:00', '2023-06-07 23:29:00', NULL),
(595, 'en', 'phone_number', 'Phone Number', '2023-06-07 23:29:00', '2023-06-07 23:29:00', NULL),
(596, 'en', 'alternative_phone', 'Alternative Phone', '2023-06-07 23:29:00', '2023-06-07 23:29:00', NULL),
(597, 'en', 'your_alternative_phone', 'Your Alternative Phone', '2023-06-07 23:29:00', '2023-06-07 23:29:00', NULL),
(598, 'en', 'additional_info', 'Additional Info', '2023-06-07 23:29:00', '2023-06-07 23:29:00', NULL),
(599, 'en', 'type_your_additional_informations_here', 'Type your additional informations here', '2023-06-07 23:29:00', '2023-06-07 23:29:00', NULL),
(600, 'en', 'payment_methods_settings', 'Payment Methods Settings', '2023-06-07 23:39:57', '2023-06-07 23:39:57', NULL),
(601, 'en', 'cash_on_delivery', 'Cash On Delivery', '2023-06-07 23:39:57', '2023-06-07 23:39:57', NULL),
(602, 'en', 'enable_cod', 'Enable COD', '2023-06-07 23:39:57', '2023-06-07 23:39:57', NULL),
(603, 'en', 'disable', 'Disable', '2023-06-07 23:39:57', '2023-06-07 23:39:57', NULL),
(604, 'en', 'enable', 'Enable', '2023-06-07 23:39:57', '2023-06-07 23:39:57', NULL),
(605, 'en', 'paypal_credentials', 'Paypal Credentials', '2023-06-07 23:39:57', '2023-06-07 23:39:57', NULL),
(606, 'en', 'paypal_client_id', 'Paypal Client ID', '2023-06-07 23:39:57', '2023-06-07 23:39:57', NULL),
(607, 'en', 'paypal_client_secret', 'Paypal Client Secret', '2023-06-07 23:39:58', '2023-06-07 23:39:58', NULL),
(608, 'en', 'enable_paypal', 'Enable Paypal', '2023-06-07 23:39:58', '2023-06-07 23:39:58', NULL),
(609, 'en', 'enable_test_sandbox_mode', 'Enable Test Sandbox Mode', '2023-06-07 23:39:58', '2023-06-07 23:39:58', NULL),
(610, 'en', 'stripe_credentials', 'Stripe Credentials', '2023-06-07 23:39:58', '2023-06-07 23:39:58', NULL),
(611, 'en', 'stripe_key', 'Stripe Key', '2023-06-07 23:39:58', '2023-06-07 23:39:58', NULL),
(612, 'en', 'stripe_secret', 'Stripe Secret', '2023-06-07 23:39:58', '2023-06-07 23:39:58', NULL),
(613, 'en', 'enable_stripe', 'Enable Stripe', '2023-06-07 23:39:58', '2023-06-07 23:39:58', NULL),
(614, 'en', 'paytm_credentials', 'PayTm Credentials', '2023-06-07 23:39:58', '2023-06-07 23:39:58', NULL),
(615, 'en', 'paytm_environment', 'PayTm Environment', '2023-06-07 23:39:58', '2023-06-07 23:39:58', NULL),
(616, 'en', 'paytm_merchant_id', 'PayTm Merchant ID', '2023-06-07 23:39:58', '2023-06-07 23:39:58', NULL),
(617, 'en', 'paytm_merchant_key', 'PayTm Merchant Key', '2023-06-07 23:39:58', '2023-06-07 23:39:58', NULL),
(618, 'en', 'paytm_merchant_website', 'PayTm Merchant Website', '2023-06-07 23:39:58', '2023-06-07 23:39:58', NULL),
(619, 'en', 'paytm_channel', 'PayTm Channel', '2023-06-07 23:39:58', '2023-06-07 23:39:58', NULL),
(620, 'en', 'paytm_industry_type', 'PayTm Industry Type', '2023-06-07 23:39:58', '2023-06-07 23:39:58', NULL),
(621, 'en', 'enable_paytm', 'Enable PayTm', '2023-06-07 23:39:58', '2023-06-07 23:39:58', NULL),
(622, 'en', 'razorpay_credentials', 'Razorpay Credentials', '2023-06-07 23:39:58', '2023-06-07 23:39:58', NULL),
(623, 'en', 'razorpay_key', 'Razorpay Key', '2023-06-07 23:39:58', '2023-06-07 23:39:58', NULL),
(624, 'en', 'razorpay_secret', 'Razorpay Secret', '2023-06-07 23:39:58', '2023-06-07 23:39:58', NULL),
(625, 'en', 'enable_razorpay', 'Enable Razorpay', '2023-06-07 23:39:58', '2023-06-07 23:39:58', NULL),
(626, 'en', 'iyzico_credentials', 'IyZico Credentials', '2023-06-07 23:39:58', '2023-06-07 23:39:58', NULL),
(627, 'en', 'iyzico_api_key', 'IyZico API Key', '2023-06-07 23:39:58', '2023-06-07 23:39:58', NULL),
(628, 'en', 'iyzico_secret_key', 'IyZico Secret Key', '2023-06-07 23:39:58', '2023-06-07 23:39:58', NULL),
(629, 'en', 'enable_iyzico', 'Enable IyZico', '2023-06-07 23:39:58', '2023-06-07 23:39:58', NULL),
(630, 'en', 'save_configuration', 'Save Configuration', '2023-06-07 23:39:59', '2023-06-07 23:39:59', NULL),
(631, 'en', 'payment_settings_updated_successfully', 'Payment settings updated successfully', '2023-06-07 23:41:26', '2023-06-07 23:41:26', NULL),
(632, 'en', 'pay_with_stripe', 'Pay with Stripe', '2023-06-07 23:41:30', '2023-06-07 23:41:30', NULL),
(633, 'en', 'happy_birthday', 'Happy Birthday', '2023-06-07 23:43:14', '2023-06-07 23:43:14', NULL),
(634, 'en', 'your_order_has_been_placed_successfully', 'Your order has been placed successfully', '2023-06-07 23:47:22', '2023-06-07 23:47:22', NULL),
(635, 'en', 'your_order_has_been_placed', 'Your order has been placed', '2023-06-07 23:47:22', '2023-06-07 23:47:22', NULL),
(636, 'en', 'invoice', 'INVOICE', '2023-06-07 23:47:23', '2023-06-07 23:47:23', NULL),
(637, 'en', 'invoice_no', 'Invoice No', '2023-06-07 23:47:23', '2023-06-07 23:47:23', NULL),
(638, 'en', 'order_date', 'Order Date', '2023-06-07 23:47:23', '2023-06-07 23:47:23', NULL),
(639, 'en', 'shipping_information', 'SHIPPING INFORMATION', '2023-06-07 23:47:23', '2023-06-07 23:47:23', NULL),
(640, 'en', 'billing_information', 'BILLING INFORMATION', '2023-06-07 23:47:23', '2023-06-07 23:47:23', NULL),
(641, 'en', 'item', 'Item', '2023-06-07 23:47:23', '2023-06-07 23:47:23', NULL),
(642, 'en', 'qty', 'Qty', '2023-06-07 23:47:23', '2023-06-07 23:47:23', NULL),
(643, 'en', 'tips', 'Tips', '2023-06-07 23:47:23', '2023-06-07 23:47:23', NULL),
(644, 'en', 'shipping_cost', 'Shipping Cost', '2023-06-07 23:47:23', '2023-06-07 23:47:23', NULL),
(645, 'en', 'grand_total', 'Grand Total', '2023-06-07 23:47:23', '2023-06-07 23:47:23', NULL),
(646, 'en', 'hello', 'Hello', '2023-06-07 23:47:23', '2023-06-07 23:47:23', NULL),
(647, 'en', 'best_regards', 'Best Regards', '2023-06-07 23:47:23', '2023-06-07 23:47:23', NULL),
(648, 'en', 'website', 'Website', '2023-06-07 23:47:23', '2023-06-07 23:47:23', NULL),
(649, 'en', 'here_are_your_order_details_we_thank_you_for_your_purchase', 'Here are your order details. We thank you for your purchase.', '2023-06-07 23:47:29', '2023-06-07 23:47:29', NULL),
(650, 'en', 'uprice', 'U.Price', '2023-06-07 23:47:29', '2023-06-07 23:47:29', NULL),
(651, 'en', 'tprice', 'T.Price', '2023-06-07 23:47:29', '2023-06-07 23:47:29', NULL),
(652, 'en', 'sub_total', 'Sub Total', '2023-06-07 23:47:29', '2023-06-07 23:47:29', NULL),
(653, 'en', 'request_refund', 'Request Refund', '2023-06-07 23:47:29', '2023-06-07 23:47:29', NULL),
(654, 'en', 'refund_reason', 'Refund Reason', '2023-06-07 23:47:29', '2023-06-07 23:47:29', NULL),
(655, 'en', 'type_refund_reason', 'Type refund reason', '2023-06-07 23:47:30', '2023-06-07 23:47:30', NULL),
(656, 'en', 'submit', 'Submit', '2023-06-07 23:47:30', '2023-06-07 23:47:30', NULL),
(657, 'en', 'rejection_reason', 'Rejection Reason', '2023-06-07 23:47:30', '2023-06-07 23:47:30', NULL),
(658, 'en', 'new', 'New', '2023-06-07 23:47:33', '2023-06-07 23:47:33', NULL),
(659, 'en', 'new_order_placed', 'New Order Placed', '2023-06-07 23:47:33', '2023-06-07 23:47:33', NULL),
(660, 'en', 'search_by_namephone', 'Search by name/phone', '2023-06-07 23:47:40', '2023-06-07 23:47:40', NULL),
(661, 'en', 'location', 'Location', '2023-06-07 23:47:40', '2023-06-07 23:47:40', NULL),
(662, 'en', 'online_orders', 'Online Orders', '2023-06-07 23:47:40', '2023-06-07 23:47:40', NULL),
(663, 'en', 'pos_orders', 'POS Orders', '2023-06-07 23:47:40', '2023-06-07 23:47:40', NULL),
(664, 'en', 'payment', 'Payment', '2023-06-07 23:47:40', '2023-06-07 23:47:40', NULL),
(665, 'en', 'type', 'Type', '2023-06-07 23:47:40', '2023-06-07 23:47:40', NULL),
(666, 'en', 'order_details', 'Order Details', '2023-06-07 23:48:27', '2023-06-07 23:48:27', NULL),
(667, 'en', 'download_invoice', 'Download Invoice', '2023-06-07 23:48:27', '2023-06-07 23:48:27', NULL),
(668, 'en', 'customer_info', 'Customer Info', '2023-06-07 23:48:27', '2023-06-07 23:48:27', NULL),
(669, 'en', 'order_logs', 'Order Logs', '2023-06-07 23:48:27', '2023-06-07 23:48:27', NULL),
(670, 'en', 'no_logs_found', 'No logs found', '2023-06-07 23:48:27', '2023-06-07 23:48:27', NULL),
(671, 'en', 'payment_status_has_been_updated', 'Payment status has been updated', '2023-06-07 23:48:27', '2023-06-07 23:48:27', NULL),
(672, 'en', 'delivery_status_has_been_updated', 'Delivery status has been updated', '2023-06-07 23:48:27', '2023-06-07 23:48:27', NULL),
(673, 'en', 'login__registration', 'Login & Registration', '2023-06-08 00:13:13', '2023-06-08 00:13:13', NULL),
(674, 'en', 'customer_registration', 'Customer Registration', '2023-06-08 00:13:13', '2023-06-08 00:13:13', NULL),
(675, 'en', 'email_required', 'Email Required', '2023-06-08 00:13:13', '2023-06-08 00:13:13', NULL),
(676, 'en', 'email__phone_both_required', 'Email & Phone Both Required', '2023-06-08 00:13:13', '2023-06-08 00:13:13', NULL),
(677, 'en', 'registration_verification', 'Registration Verification', '2023-06-08 00:13:13', '2023-06-08 00:13:13', NULL),
(678, 'en', 'email_verification', 'Email Verification', '2023-06-08 00:13:13', '2023-06-08 00:13:13', NULL),
(679, 'en', 'otp_verification', 'OTP Verification', '2023-06-08 00:13:13', '2023-06-08 00:13:13', NULL),
(680, 'en', 'google_recaptcha_v3', 'Google Recaptcha V3', '2023-06-08 00:13:13', '2023-06-08 00:13:13', NULL),
(681, 'en', 'recaptcha_site_key', 'Recaptcha Site Key', '2023-06-08 00:13:13', '2023-06-08 00:13:13', NULL),
(682, 'en', 'recaptcha_secret_key', 'Recaptcha Secret Key', '2023-06-08 00:13:13', '2023-06-08 00:13:13', NULL),
(683, 'en', 'enable_recaptcha', 'Enable Recaptcha', '2023-06-08 00:13:13', '2023-06-08 00:13:13', NULL),
(684, 'en', 'configure_general_settings', 'Configure General Settings', '2023-06-08 00:13:14', '2023-06-08 00:13:14', NULL),
(685, 'en', 'google_recaptcha', 'Google Recaptcha', '2023-06-08 00:13:14', '2023-06-08 00:13:14', NULL),
(686, 'en', 'order_information', 'Order Information', '2023-06-08 00:21:26', '2023-06-08 00:21:26', NULL),
(687, 'en', 'enable_scheduled_order', 'Enable Scheduled Order', '2023-06-08 00:21:26', '2023-06-08 00:21:26', NULL),
(688, 'en', 'scheduled_order_days', 'Scheduled Order Days', '2023-06-08 00:21:26', '2023-06-08 00:21:26', NULL),
(689, 'en', 'order_code_prefix', 'Order Code Prefix', '2023-06-08 00:21:26', '2023-06-08 00:21:26', NULL),
(690, 'en', 'grostore', '#Grostore-', '2023-06-08 00:21:26', '2023-06-08 00:21:26', NULL),
(691, 'en', 'order_code_starts_from', 'Order Code Starts From', '2023-06-08 00:21:26', '2023-06-08 00:21:26', NULL),
(692, 'en', '1001', '1001', '2023-06-08 00:21:26', '2023-06-08 00:21:26', NULL),
(693, 'en', 'invoice_thank_you_message', 'Invoice Thank You Message', '2023-06-08 00:21:26', '2023-06-08 00:21:26', NULL),
(694, 'en', 'type_your_thank_you_message_for_invoice', 'Type your thank you message for invoice', '2023-06-08 00:21:26', '2023-06-08 00:21:26', NULL),
(695, 'en', 'scheduled_time_slot_list', 'Scheduled Time Slot List', '2023-06-08 00:21:26', '2023-06-08 00:21:26', NULL),
(696, 'en', 'time_slot', 'Time Slot', '2023-06-08 00:21:26', '2023-06-08 00:21:26', NULL),
(697, 'en', 'sorting_order', 'Sorting Order', '2023-06-08 00:21:26', '2023-06-08 00:21:26', NULL),
(698, 'en', 'add_new_time_slot', 'Add New Time Slot', '2023-06-08 00:21:26', '2023-06-08 00:21:26', NULL),
(699, 'en', '8am__9am', '8am - 9am', '2023-06-08 00:21:26', '2023-06-08 00:21:26', NULL),
(700, 'en', 'timeslots_with_lower_sorting_order_will_be_shown_first', 'Timeslots with lower sorting order will be shown first', '2023-06-08 00:21:26', '2023-06-08 00:21:26', NULL),
(701, 'en', 'configure_order_settings', 'Configure Order Settings', '2023-06-08 00:21:27', '2023-06-08 00:21:27', NULL),
(702, 'en', 'time_slot_list', 'Time Slot List', '2023-06-08 00:21:27', '2023-06-08 00:21:27', NULL),
(703, 'en', 'smtp_configuration', 'SMTP Configuration', '2023-06-08 00:22:31', '2023-06-08 00:22:31', NULL),
(704, 'en', 'sendmail', 'Sendmail', '2023-06-08 00:22:31', '2023-06-08 00:22:31', NULL),
(705, 'en', 'smtp', 'SMTP', '2023-06-08 00:22:32', '2023-06-08 00:22:32', NULL),
(706, 'en', 'mail_host', 'Mail Host', '2023-06-08 00:22:32', '2023-06-08 00:22:32', NULL),
(707, 'en', 'type_mail_host', 'Type mail Host', '2023-06-08 00:22:32', '2023-06-08 00:22:32', NULL),
(708, 'en', 'mail_port', 'Mail Port', '2023-06-08 00:22:32', '2023-06-08 00:22:32', NULL),
(709, 'en', 'type_mail_port', 'Type mail port', '2023-06-08 00:22:32', '2023-06-08 00:22:32', NULL),
(710, 'en', 'mail_username', 'Mail Username', '2023-06-08 00:22:32', '2023-06-08 00:22:32', NULL),
(711, 'en', 'type_mail_username', 'Type mail username', '2023-06-08 00:22:32', '2023-06-08 00:22:32', NULL),
(712, 'en', 'mail_password', 'Mail Password', '2023-06-08 00:22:32', '2023-06-08 00:22:32', NULL),
(713, 'en', 'type_mail_password', 'Type mail password', '2023-06-08 00:22:32', '2023-06-08 00:22:32', NULL),
(714, 'en', 'mail_encryption', 'Mail Encryption', '2023-06-08 00:22:32', '2023-06-08 00:22:32', NULL),
(715, 'en', 'type_mail_encryption', 'Type mail encryption', '2023-06-08 00:22:32', '2023-06-08 00:22:32', NULL),
(716, 'en', 'mail_from_address', 'Mail From Address', '2023-06-08 00:22:32', '2023-06-08 00:22:32', NULL),
(717, 'en', 'type_mail_from_address', 'Type mail from address', '2023-06-08 00:22:32', '2023-06-08 00:22:32', NULL),
(718, 'en', 'mail_from_name', 'Mail From Name', '2023-06-08 00:22:32', '2023-06-08 00:22:32', NULL),
(719, 'en', 'type_mail_from_name', 'Type mail from name', '2023-06-08 00:22:33', '2023-06-08 00:22:33', NULL),
(720, 'en', 'configure_smtp', 'Configure SMTP', '2023-06-08 00:22:33', '2023-06-08 00:22:33', NULL),
(721, 'en', 'smtp_information', 'SMTP Information', '2023-06-08 00:22:33', '2023-06-08 00:22:33', NULL),
(722, 'en', 'social_login_configurations', 'Social Login Configurations', '2023-06-08 00:22:51', '2023-06-08 00:22:51', NULL),
(723, 'en', 'google_login', 'Google Login', '2023-06-08 00:22:51', '2023-06-08 00:22:51', NULL),
(724, 'en', 'google_client_id', 'Google Client ID', '2023-06-08 00:22:51', '2023-06-08 00:22:51', NULL),
(725, 'en', 'google_client_secret', 'Google Client Secret', '2023-06-08 00:22:51', '2023-06-08 00:22:51', NULL),
(726, 'en', 'is_active', 'Is Active?', '2023-06-08 00:22:51', '2023-06-08 00:22:51', NULL),
(727, 'en', 'facebook_login', 'Facebook Login', '2023-06-08 00:22:51', '2023-06-08 00:22:51', NULL),
(728, 'en', 'facebook_app_id', 'Facebook App ID', '2023-06-08 00:22:51', '2023-06-08 00:22:51', NULL),
(729, 'en', 'facebook_app_secret', 'Facebook App Secret', '2023-06-08 00:22:51', '2023-06-08 00:22:51', NULL),
(730, 'en', 'faccebook_login', 'Faccebook Login', '2023-06-08 00:22:51', '2023-06-08 00:22:51', NULL),
(731, 'en', 'general_informations', 'General Informations', '2023-06-08 00:26:20', '2023-06-08 00:26:20', NULL),
(732, 'en', 'system_title', 'System Title', '2023-06-08 00:26:20', '2023-06-08 00:26:20', NULL),
(733, 'en', 'browser_tab_title_separator', 'Browser Tab Title Separator', '2023-06-08 00:26:20', '2023-06-08 00:26:20', NULL),
(734, 'en', 'dashboard_logo__favicon', 'Dashboard Logo & Favicon', '2023-06-08 00:26:20', '2023-06-08 00:26:20', NULL),
(735, 'en', 'dashboard_logo', 'Dashboard Logo', '2023-06-08 00:26:20', '2023-06-08 00:26:20', NULL),
(736, 'en', 'choose_dashboard_logo', 'Choose Dashboard Logo', '2023-06-08 00:26:21', '2023-06-08 00:26:21', NULL),
(737, 'en', 'favicon', 'Favicon', '2023-06-08 00:26:21', '2023-06-08 00:26:21', NULL),
(738, 'en', 'choose_favicon', 'Choose Favicon', '2023-06-08 00:26:21', '2023-06-08 00:26:21', NULL),
(739, 'en', 'maintenance_mode', 'Maintenance Mode', '2023-06-08 00:26:21', '2023-06-08 00:26:21', NULL),
(740, 'en', 'enable_maintenance_mode', 'Enable Maintenance Mode', '2023-06-08 00:26:21', '2023-06-08 00:26:21', NULL),
(741, 'en', 'set_maintenance_mode', 'Set maintenance mode', '2023-06-08 00:26:21', '2023-06-08 00:26:21', NULL),
(742, 'en', 'meta_keywords', 'Meta Keywords', '2023-06-08 00:26:21', '2023-06-08 00:26:21', NULL),
(743, 'en', 'dashborad_logo__favicon', 'Dashborad Logo & Favicon', '2023-06-08 00:26:21', '2023-06-08 00:26:21', NULL),
(744, 'en', 'seo_configuration', 'SEO Configuration', '2023-06-08 00:26:21', '2023-06-08 00:26:21', NULL),
(745, 'en', 'currencies', 'Currencies', '2023-06-08 00:26:42', '2023-06-08 00:26:42', NULL),
(746, 'en', 'symbol', 'Symbol', '2023-06-08 00:26:42', '2023-06-08 00:26:42', NULL),
(747, 'en', 'alignment', 'Alignment', '2023-06-08 00:26:42', '2023-06-08 00:26:42', NULL),
(748, 'en', '1_usd__', '1 USD = ?', '2023-06-08 00:26:42', '2023-06-08 00:26:42', NULL),
(749, 'en', 'symbolamount', '[symbol][amount]', '2023-06-08 00:26:43', '2023-06-08 00:26:43', NULL),
(750, 'en', 'add_new_currency', 'Add New Currency', '2023-06-08 00:26:43', '2023-06-08 00:26:43', NULL),
(751, 'en', 'currency_name', 'Currency Name', '2023-06-08 00:26:43', '2023-06-08 00:26:43', NULL),
(752, 'en', 'type_currency_name', 'Type currency name', '2023-06-08 00:26:43', '2023-06-08 00:26:43', NULL),
(753, 'en', 'currency_symbol', 'Currency Symbol', '2023-06-08 00:26:43', '2023-06-08 00:26:43', NULL),
(754, 'en', 'type_symbol', 'Type symbol', '2023-06-08 00:26:43', '2023-06-08 00:26:43', NULL),
(755, 'en', 'currency_code', 'Currency Code', '2023-06-08 00:26:43', '2023-06-08 00:26:43', NULL),
(756, 'en', 'type_code', 'Type code', '2023-06-08 00:26:43', '2023-06-08 00:26:43', NULL),
(757, 'en', 'rate', 'Rate', '2023-06-08 00:26:43', '2023-06-08 00:26:43', NULL),
(758, 'en', 'amountsymbol', '[amount][symbol]', '2023-06-08 00:26:43', '2023-06-08 00:26:43', NULL),
(759, 'en', 'symbol_amount', '[symbol] [amount]', '2023-06-08 00:26:43', '2023-06-08 00:26:43', NULL),
(760, 'en', 'amount_symbol', '[amount] [symbol]', '2023-06-08 00:26:43', '2023-06-08 00:26:43', NULL),
(761, 'en', 'save_currency', 'Save Currency', '2023-06-08 00:26:43', '2023-06-08 00:26:43', NULL),
(762, 'en', 'set_default_currency', 'Set Default Currency', '2023-06-08 00:26:43', '2023-06-08 00:26:43', NULL),
(763, 'en', 'default_currency', 'Default Currency', '2023-06-08 00:26:43', '2023-06-08 00:26:43', NULL),
(764, 'en', 'no_of_decimals', 'No of Decimals', '2023-06-08 00:26:43', '2023-06-08 00:26:43', NULL),
(765, 'en', 'price_format', 'Price Format', '2023-06-08 00:26:43', '2023-06-08 00:26:43', NULL),
(766, 'en', 'show_full_price_1000000', 'Show Full Price (1000000)', '2023-06-08 00:26:43', '2023-06-08 00:26:43', NULL),
(767, 'en', 'truncate_price_1m1b', 'Truncate Price (1M/1B)', '2023-06-08 00:26:43', '2023-06-08 00:26:43', NULL),
(768, 'en', 'save_configurations', 'Save Configurations', '2023-06-08 00:26:44', '2023-06-08 00:26:44', NULL),
(769, 'en', 'currency_information', 'Currency Information', '2023-06-08 00:26:44', '2023-06-08 00:26:44', NULL),
(770, 'en', 'all_currencies', 'All Currencies', '2023-06-08 00:26:44', '2023-06-08 00:26:44', NULL),
(771, 'en', 'currency_configurations', 'Currency Configurations', '2023-06-08 00:26:44', '2023-06-08 00:26:44', NULL),
(772, 'en', 'default_currency_can_not_be_disabled', 'Default currency can not be disabled', '2023-06-08 00:26:44', '2023-06-08 00:26:44', NULL),
(773, 'en', 'currency_has_been_inserted_successfully', 'Currency has been inserted successfully', '2023-06-08 00:28:53', '2023-06-08 00:28:53', NULL),
(774, 'en', 'update_currency', 'Update Currency', '2023-06-08 00:29:24', '2023-06-08 00:29:24', NULL),
(775, 'en', 'currency_has_been_updated_successfully', 'Currency has been updated successfully', '2023-06-08 00:29:33', '2023-06-08 00:29:33', NULL),
(776, 'en', 'currency_changed_to_', 'Currency changed to ', '2023-06-08 00:29:42', '2023-06-08 00:29:42', NULL),
(777, 'en', 'scheduled_delivery', 'Scheduled Delivery', '2023-06-08 00:39:33', '2023-06-08 00:39:33', NULL),
(778, 'en', 'fast_delivery', 'Fast Delivery', '2023-06-08 00:43:49', '2023-06-08 00:43:49', NULL),
(779, 'en', 'type_your_name', 'Type your name', '2023-06-08 00:48:13', '2023-06-08 00:48:13', NULL),
(780, 'en', 'type_your_email', 'Type your email', '2023-06-08 00:48:14', '2023-06-08 00:48:14', NULL),
(781, 'en', 'type_your_phone', 'Type your phone', '2023-06-08 00:48:14', '2023-06-08 00:48:14', NULL),
(782, 'en', 'avatar', 'Avatar', '2023-06-08 00:48:14', '2023-06-08 00:48:14', NULL),
(783, 'en', 'choose_avatar', 'Choose Avatar', '2023-06-08 00:48:14', '2023-06-08 00:48:14', NULL),
(784, 'en', 'retype_password', 'Re-type password', '2023-06-08 00:48:14', '2023-06-08 00:48:14', NULL),
(785, 'en', 'user_information', 'User Information', '2023-06-08 00:48:14', '2023-06-08 00:48:14', NULL),
(786, 'en', '1000__how_many_points', '$1.000 = How many points?', '2023-06-08 00:48:30', '2023-06-08 00:48:30', NULL),
(787, 'en', 'type_reward_points', 'Type reward points', '2023-06-08 00:48:30', '2023-06-08 00:48:30', NULL),
(788, 'en', 'waiting_days_for_wallet_conversion', 'Waiting Days for Wallet Conversion', '2023-06-08 00:48:30', '2023-06-08 00:48:30', NULL),
(789, 'en', 'type_waiting_days', 'Type waiting days', '2023-06-08 00:48:30', '2023-06-08 00:48:30', NULL),
(790, 'en', 'enable_reward_points', 'Enable Reward Points', '2023-06-08 00:48:30', '2023-06-08 00:48:30', NULL),
(791, 'en', 'reward_information', 'Reward Information', '2023-06-08 00:48:30', '2023-06-08 00:48:30', NULL),
(792, 'en', 'please_login_to_continue', 'Please login to continue', '2023-06-14 11:52:57', '2023-06-14 11:52:57', NULL),
(793, 'en', 'email_or_phone_already_exists', 'Email or Phone already exists.', '2023-06-14 11:54:05', '2023-06-14 11:54:05', NULL),
(794, 'en', 'update', 'Update', '2023-06-14 11:58:00', '2023-06-14 11:58:00', NULL),
(795, 'en', 'welcome_back_to_flowerly', 'Welcome back to Flowerly.', '2023-06-14 14:25:21', '2023-06-14 14:25:21', NULL),
(796, 'en', 'track_my_order', 'Track My Order', '2023-06-14 14:41:10', '2023-06-14 14:41:10', NULL),
(797, 'en', 'customer_order_history', 'Customer Order History', '2023-06-14 14:41:35', '2023-06-14 14:41:35', NULL),
(798, 'en', 'your_cart_is_empty', 'Your cart is empty', '2023-06-14 16:15:20', '2023-06-14 16:15:20', NULL),
(799, 'en', 'carts', 'Carts', '2023-06-14 16:17:37', '2023-06-14 16:17:37', NULL),
(800, 'en', 'shopping_cart', 'Shopping Cart', '2023-06-14 16:17:37', '2023-06-14 16:17:37', NULL),
(801, 'en', 'u_price', 'U. Price', '2023-06-14 16:17:37', '2023-06-14 16:17:37', NULL),
(802, 'en', 'quantity', 'Quantity', '2023-06-14 16:17:37', '2023-06-14 16:17:37', NULL),
(803, 'en', 't_price', 'T. Price', '2023-06-14 16:17:37', '2023-06-14 16:17:37', NULL),
(804, 'en', 'have_a_coupon', 'Have a coupon?', '2023-06-14 16:17:37', '2023-06-14 16:17:37', NULL),
(805, 'en', 'apply_coupon_to_get_discount', 'Apply coupon to get discount.', '2023-06-14 16:17:37', '2023-06-14 16:17:37', NULL),
(806, 'en', 'enter_your_coupon_code', 'Enter Your Coupon Code', '2023-06-14 16:17:37', '2023-06-14 16:17:37', NULL),
(807, 'en', 'coupon_discount', 'Coupon Discount', '2023-06-14 16:17:37', '2023-06-14 16:17:37', NULL),
(808, 'en', 'shipping_options_will_be_updated_during_checkout', 'Shipping options will be updated during checkout.', '2023-06-14 16:17:37', '2023-06-14 16:17:37', NULL),
(809, 'en', 'continue_shopping', 'Continue Shopping', '2023-06-14 16:17:37', '2023-06-14 16:17:37', NULL),
(810, 'en', 'occasions', 'Occasions', '2023-06-14 17:26:57', '2023-06-14 17:26:57', NULL),
(811, 'en', 'bouquets', 'Bouquets', '2023-06-14 17:26:58', '2023-06-14 17:26:58', NULL),
(812, 'en', 'slider_image_added_successfully', 'Slider image added successfully', '2023-06-14 17:38:34', '2023-06-14 17:38:34', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `banner` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `is_default` tinyint(4) NOT NULL DEFAULT 0,
  `is_published` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`id`, `name`, `banner`, `address`, `latitude`, `longitude`, `is_default`, `is_published`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Default Location', '', 'Default Address', NULL, NULL, 1, 1, '2023-03-27 06:54:01', '2023-03-28 08:31:29', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `logistics`
--

CREATE TABLE `logistics` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `thumbnail_image` text DEFAULT NULL,
  `is_published` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `logistics`
--

INSERT INTO `logistics` (`id`, `name`, `slug`, `thumbnail_image`, `is_published`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Amana Express', 'amana-express-BXv7g', '37', 1, '2023-06-07 20:26:21', '2023-06-07 20:26:30', NULL),
(2, 'Barid Al-Maghrib', 'barid-al-maghrib-xso6G', '38', 1, '2023-06-07 20:27:56', '2023-06-07 20:28:02', NULL),
(3, 'DHL Morocco', 'dhl-morocco-0pOF9', '39', 1, '2023-06-07 20:29:16', '2023-06-07 20:29:21', NULL),
(4, 'FedEx Morocco', 'fedex-morocco-9RXQ1', '40', 1, '2023-06-07 20:30:36', '2023-06-07 20:33:09', NULL),
(5, 'UPS Morocco', 'ups-morocco-dhyyy', '41', 1, '2023-06-07 20:33:01', '2023-06-07 20:33:10', NULL),
(6, 'Chronopost Morocco', 'chronopost-morocco-356J1', '42', 1, '2023-06-07 20:35:32', '2023-06-07 20:35:37', NULL),
(7, 'Globaltrans', 'globaltrans-BmLY1', '43', 1, '2023-06-07 20:38:10', '2023-06-07 20:56:57', NULL),
(8, 'Aramex Morocco', 'aramex-morocco-orGUc', '44', 1, '2023-06-07 20:39:10', '2023-06-07 20:56:58', NULL),
(9, 'SDV Maroc', 'sdv-maroc-LSKOp', '45', 1, '2023-06-07 20:56:51', '2023-06-07 20:57:01', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `logistic_zones`
--

CREATE TABLE `logistic_zones` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `logistic_id` int(11) NOT NULL,
  `standard_delivery_charge` double NOT NULL DEFAULT 0,
  `express_delivery_charge` double NOT NULL DEFAULT 0,
  `standard_delivery_time` varchar(255) DEFAULT NULL COMMENT '1 - 3 days',
  `express_delivery_time` varchar(255) DEFAULT NULL COMMENT '1 day',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `logistic_zones`
--

INSERT INTO `logistic_zones` (`id`, `name`, `logistic_id`, `standard_delivery_charge`, `express_delivery_charge`, `standard_delivery_time`, `express_delivery_time`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Beni Mellal - DHL', 3, 0, 0, '1 - 3 days', NULL, '2023-06-07 23:24:32', '2023-06-07 23:24:32', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `logistic_zone_cities`
--

CREATE TABLE `logistic_zone_cities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `logistic_id` int(11) NOT NULL,
  `logistic_zone_id` int(11) NOT NULL,
  `city_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `logistic_zone_cities`
--

INSERT INTO `logistic_zone_cities` (`id`, `logistic_id`, `logistic_zone_id`, `city_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 3, 1, 6, '2023-06-07 23:24:32', '2023-06-07 23:24:32', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `media_managers`
--

CREATE TABLE `media_managers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `media_file` longtext DEFAULT NULL,
  `media_size` int(11) DEFAULT NULL,
  `media_type` varchar(255) DEFAULT NULL COMMENT 'video / image / pdf / ...',
  `media_name` text DEFAULT NULL,
  `media_extension` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `media_managers`
--

INSERT INTO `media_managers` (`id`, `user_id`, `media_file`, `media_size`, `media_type`, `media_name`, `media_extension`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'uploads/media/6AkCyw6sfJrIG2NR2MuAzGRtkA48Rmgj8ND2Hc1k.png', 1916, 'image', 'logo.png', 'png', '2023-03-12 04:04:37', '2023-03-12 04:04:37', NULL),
(2, 1, 'uploads/media/ZithHqXrynYP6nkIfU0ei7VtWRMvuObOGd0P2tdR.png', 1055, 'image', 'logo-white.png', 'png', '2023-03-12 04:05:28', '2023-03-12 04:05:28', NULL),
(3, 1, 'uploads/media/3WOll3QyXt5f9NNi22BRANFNCTNQRey75DYAOXd4.png', 4430, 'image', 'payments.png', 'png', '2023-03-12 04:05:48', '2023-03-12 04:05:48', NULL),
(4, 1, 'uploads/media/LOa3BqX3ydhVC0V1fwYEyvEpM5N9NaoA0E7u3EQs.png', 1742, 'image', 'logo.png', 'png', '2023-03-12 04:07:45', '2023-03-12 04:07:45', NULL),
(5, 1, 'uploads/media/yqqPV512Gk5DMpvCj2UllKrCl52bam3yD6QvfiPP.png', 753, 'image', 'favicon.png', 'png', '2023-03-12 04:08:14', '2023-03-12 04:08:14', NULL),
(6, 1, 'uploads/media/dtkoInw3SD3IF3Q2I1jFtEDiE96mDD46RHB9RdxN.jpg', 6502, 'image', '1.jpg', 'jpg', '2023-03-12 04:08:43', '2023-03-12 04:08:43', NULL),
(7, 1, 'uploads/media/YTDQREN5aLauUwo7rkUoKSafGhfzqUYpIiM33zfc.jpg', 513716, 'image', 'back1.jpeg', 'jpeg', '2023-06-07 13:42:35', '2023-06-07 13:42:35', NULL),
(8, 1, 'uploads/media/skiYlwShQVyUK3Rmb446qzNURuH2KtsfIHnIGd4Y.png', 392247, 'image', 'back1-removebg-preview.png', 'png', '2023-06-07 15:22:19', '2023-06-07 15:22:19', NULL),
(10, 2, 'uploads/media/2zxziML7uCgaPOUs5YcDBV31sOkorM0oXAbmxImO.jpg', 282363, 'image', 'Sympathy.jpeg', 'jpeg', '2023-06-07 16:05:46', '2023-06-07 16:05:46', NULL),
(11, 2, 'uploads/media/pCtcTaAHI8fM5jSq3Mae9myTrgBE0xrb3pt4yhK4.jpg', 414603, 'image', 'just_because.png', 'png', '2023-06-07 16:07:13', '2023-06-07 16:07:13', NULL),
(12, 2, 'uploads/media/kccubnuaJiXHJIJZLu0BJ4YHKZ6u1Wpw4ASHD35F.jpg', 434151, 'image', 'Anniversary.jpeg', 'jpeg', '2023-06-07 16:07:54', '2023-06-07 16:07:54', NULL),
(13, 2, 'uploads/media/18y7WhVZcy2TbWI1fxxjyhmPXepKTOCp1AE8YY8c.jpg', 115218, 'image', 'Thank You.jpeg', 'jpeg', '2023-06-07 16:08:29', '2023-06-07 16:08:29', NULL),
(14, 2, 'uploads/media/cIo1BZ2plNEeVzdxneR4rCUPW6RsRdmdgrUZ94C8.jpg', 88451, 'image', 'Get Well.jpeg', 'jpeg', '2023-06-07 16:09:12', '2023-06-07 16:09:12', NULL),
(15, 2, 'uploads/media/lGkjPh9cQI2BvIwLViDDpJg98ZRa04ebzqT8byY6.jpg', 239221, 'image', 'Weddings.jpeg', 'jpeg', '2023-06-07 16:09:58', '2023-06-07 16:09:58', NULL),
(16, 2, 'uploads/media/28fMpciekFtvAArIYQiLVJwXACRZV2K79WsnAnqb.jpg', 134213, 'image', 'Valentine\'s Day.jpeg', 'jpeg', '2023-06-07 16:10:29', '2023-06-07 16:10:29', NULL),
(17, 2, 'uploads/media/DQ3epvc4dRRiZ0oSRa1CjU7iVJZ3aFJjnbnHoJ4l.jpg', 342426, 'image', 'Mother\'s Day.jpeg', 'jpeg', '2023-06-07 16:12:50', '2023-06-07 16:12:50', NULL),
(18, 2, 'uploads/media/ul0XPmRcF7vEk1xnT2KjFQWJKvHvIQ2aYFxHsRNo.jpg', 381292, 'image', 'New Baby.jpeg', 'jpeg', '2023-06-07 16:13:55', '2023-06-07 16:13:55', NULL),
(19, 2, 'uploads/media/WAKZsOGdlTOXCZkhX1MsqH4242nCkJNeBpg0m7Ta.jpg', 31265, 'image', 'Apologies.jpeg', 'jpeg', '2023-06-07 16:14:44', '2023-06-07 16:14:44', NULL),
(20, 2, 'uploads/media/zefeVj0I5gLsYHibkniMVnxjjiJv8Skw1nrjeh3L.jpg', 396222, 'image', 'Retirement.jpeg', 'jpeg', '2023-06-07 16:17:11', '2023-06-07 16:17:11', NULL),
(21, 2, 'uploads/media/wAcxnNmpZVt34E92xq8r3AHJFz6qCqZ1x6658c2g.jpg', 857366, 'image', 'pexels-jill-wellington-42257.jpg', 'jpg', '2023-06-07 16:26:00', '2023-06-07 16:26:00', NULL),
(22, 2, 'uploads/media/VPB7o7YvNNURVGOtF6jNPJWHC10oOPWs0nk116TT.png', 313880, 'image', 'Exuberance_Over_Deluxe0718_copy-removebg-preview.png', 'png', '2023-06-07 16:28:15', '2023-06-07 16:28:15', NULL),
(23, 2, 'uploads/media/l1R65DL26Q25DRzvn5UmSd9ridfauIxFFwBx1rtl.jpg', 134016, 'image', 'Rose Garden Bouquet.png', 'png', '2023-06-07 16:50:35', '2023-06-07 16:50:35', NULL),
(24, 2, 'uploads/media/CqOdOlNowcaXvetcOPJk5jliOjnDXCOIUTF9eGa2.jpg', 1622276, 'image', 'angelina-jollivet-mNEpmNiFdXs-unsplash.jpg', 'jpg', '2023-06-07 17:00:27', '2023-06-07 17:00:27', NULL),
(25, 2, 'uploads/media/P9CoHdYetH8SG8feSO9YElN3LWx1PsJkp18FlnWs.jpg', 4008275, 'image', 'hai-tran-tt_HFMMae1w-unsplash.jpg', 'jpg', '2023-06-07 17:04:27', '2023-06-07 17:04:27', NULL),
(26, 2, 'uploads/media/G2In2rjJiNpP8rqFdHPZDxKwiY1ZCWLepQDbDDnS.jpg', 2508318, 'image', 'demi-he-hPcxvCecdPI-unsplash.jpg', 'jpg', '2023-06-07 17:08:08', '2023-06-07 17:08:08', NULL),
(27, 2, 'uploads/media/H0EdZJf69ah3BRq1yrvym3KTSY1GRRuPH7TxGZiM.jpg', 2856732, 'image', 'amanda-frank-kiQqG20_U-c-unsplash.jpg', 'jpg', '2023-06-07 17:15:18', '2023-06-07 17:15:18', NULL),
(28, 2, 'uploads/media/gq8mf4D45q1ZJIrm1iEMfxTCHcHkjQRrZSO5oFd6.jpg', 1399790, 'image', 'marcella-marcella-hn6CC9aosEk-unsplash.jpg', 'jpg', '2023-06-07 17:18:50', '2023-06-07 17:18:50', NULL),
(29, 2, 'uploads/media/6KydoeusDnh25hDmCxq9iJXvgJvFZJtd6XjukWtz.jpg', 581433, 'image', 'matthew-nevins-bell-hg0EDH34Nm0-unsplash.jpg', 'jpg', '2023-06-07 17:25:56', '2023-06-07 17:25:56', NULL),
(30, 2, 'uploads/media/ouEiEq3B2DjJwygkkbvBdSMdsMO8VVbqUM6Gh73g.jpg', 3540975, 'image', 'taisiia-shestopal-JZDyFwGAEqY-unsplash.jpg', 'jpg', '2023-06-07 17:29:25', '2023-06-07 17:29:25', NULL),
(31, 2, 'uploads/media/lBAr8qIpVhH2tkNBM6cJ6opJaKHEe1xVR9bK2uBp.jpg', 1473800, 'image', 'pexels-secret-garden-931158.jpg', 'jpg', '2023-06-07 17:35:29', '2023-06-07 17:35:29', NULL),
(32, 2, 'uploads/media/qQOnwb4MFUnsRpisUzLfcYq6XChkUTltAUhN3Pxu.jpg', 1671756, 'image', 'pexels-kristina-paukshtite-112396.jpg', 'jpg', '2023-06-07 17:37:58', '2023-06-07 17:37:58', NULL),
(33, 2, 'uploads/media/Ktg0SAbctLjwczlLhfKGDG59DCaknQm1ICNr90Ro.jpg', 589400, 'image', 'pexels-dominika-roseclay-894751.jpg', 'jpg', '2023-06-07 17:41:25', '2023-06-07 17:41:25', NULL),
(34, 2, 'uploads/media/6PaOhpTDumdaY4OxZJRdb9pBwwl6ivMypKteoExy.jpg', 1671756, 'image', 'pexels-kristina-paukshtite-112396.jpg', 'jpg', '2023-06-07 17:44:48', '2023-06-07 17:44:48', NULL),
(35, 2, 'uploads/media/Ij5s86vBwUwxYmBT6zMPngp5apO4ANe4GOSyzOmx.jpg', 1259648, 'image', 'pexels-secret-garden-931176.jpg', 'jpg', '2023-06-07 18:06:53', '2023-06-07 18:06:53', NULL),
(36, 2, 'uploads/media/PSQfSll2ainDSmEZgHn4ybpLUQTSbk86FqADWDEG.jpg', 1842327, 'image', 'pexels-kristina-paukshtite-2317922.jpg', 'jpg', '2023-06-07 18:10:08', '2023-06-07 18:10:08', NULL),
(37, 2, 'uploads/media/RnIobtDjPiLC9Ym5nLOUX8A0rykEcdQZ7wKseHC7.jpg', 20746, 'image', 'Amana Express.jpeg', 'jpeg', '2023-06-07 20:26:14', '2023-06-07 20:26:14', NULL),
(38, 2, 'uploads/media/iUdDuSsEw64oLaJgXblChj2xmBhm3i3I4bwn0g9D.png', 52757, 'image', 'Barid Al-Maghrib.png', 'png', '2023-06-07 20:27:39', '2023-06-07 20:27:39', NULL),
(39, 2, 'uploads/media/nJ4uK2CQYNvnUPA4OVZWPJydSpoxPMnmrJwxMxPG.jpg', 39321, 'image', 'DHL Morocco.jpeg', 'jpeg', '2023-06-07 20:29:09', '2023-06-07 20:29:09', NULL),
(40, 2, 'uploads/media/WXPpdcPVKX3wNx8jM3vSx7NMSEYUk85scdiUFD1a.png', 136920, 'image', 'FedEx Morocco.png', 'png', '2023-06-07 20:30:27', '2023-06-07 20:30:27', NULL),
(41, 2, 'uploads/media/JtoADUyq2XkAbzn3NFO7rkkBpHAq1w4bsf6yCjvO.jpg', 31534, 'image', 'UPS Morocco.jpeg', 'jpeg', '2023-06-07 20:32:51', '2023-06-07 20:32:51', NULL),
(42, 2, 'uploads/media/jFuEM8PK93stG46hxLHp1vOVuxWAbuHuptdvgwp9.jpg', 5317, 'image', 'Chronopost Morocco.jpeg', 'jpeg', '2023-06-07 20:35:23', '2023-06-07 20:35:23', NULL),
(43, 2, 'uploads/media/7TWhWxn2G7qKxXxL8D1xICE9hrFxry8Cr82NC1eA.png', 198672, 'image', 'Globaltrans.png', 'png', '2023-06-07 20:37:58', '2023-06-07 20:37:58', NULL),
(44, 2, 'uploads/media/3V7yj35CkpKHd7KYu68ydTf4SbxnwFZdsCjqh8Vs.png', 58803, 'image', 'Aramex Morocco.png', 'png', '2023-06-07 20:39:02', '2023-06-07 20:39:02', NULL),
(45, 2, 'uploads/media/tM0VwS48A2bIk55yOecJXcJYAGQBGl2E7lfeFyOc.jpg', 12644, 'image', 'SDV Maroc.jpeg', 'jpeg', '2023-06-07 20:56:46', '2023-06-07 20:56:46', NULL),
(46, 2, 'uploads/media/r283I4CqlfoGq1s26RAaLTA1obD8ZCxKXaiFqumF.jpg', 180435, 'image', 'slide3.jpg', 'jpg', '2023-06-14 17:38:16', '2023-06-14 17:38:16', NULL),
(47, 2, 'uploads/media/dxFJi6u6Efor0GXFD5Ads8tKDAZpULFvRH7TCAv5.jpg', 39701, 'image', 'slids2.jpg', 'jpg', '2023-06-14 17:39:22', '2023-06-14 17:39:22', NULL),
(48, 2, 'uploads/media/4Mpe83NZFdXL0AZUiuwM33mR9hx950CE32suSXNM.jpg', 28889, 'image', 'slid4.jpg', 'jpg', '2023-06-14 17:41:24', '2023-06-14 17:41:24', NULL),
(49, 2, 'uploads/media/pRD6oFz4EfAC8snYrhNHYhjWJLucaJgsctQq1E7k.png', 625351, 'image', 'bouqeuts1.png', 'png', '2023-06-14 17:44:32', '2023-06-14 17:44:32', NULL),
(50, 2, 'uploads/media/rmQ9v4Tup3FdLv8F6Vvhby6JcOcoWTAuPqjItbXw.png', 1303697, 'image', 'bouqeuts3.png', 'png', '2023-06-14 17:47:58', '2023-06-14 17:47:58', NULL),
(51, 2, 'uploads/media/lNchUYrUhbdgNkY8w9Ia4w3gdc0trUusyVEgNGor.png', 779846, 'image', 'bouqeuts2.png', 'png', '2023-06-14 17:49:18', '2023-06-14 17:49:18', NULL),
(52, 2, 'uploads/media/mhIhIGrHmk9cUHEsgv5DYFPU6vkqB4zCoAq8N0A8.png', 581021, 'image', 'bouqeuts4.png', 'png', '2023-06-14 17:55:19', '2023-06-14 17:55:19', NULL),
(53, 2, 'uploads/media/D7GKzKY85Q7onCMeuuwGFAWNLSAMoO5LyesdzZAJ.jpg', 117615, 'image', 'b2.jpg', 'jpg', '2023-06-14 18:08:38', '2023-06-14 18:08:38', NULL),
(54, 2, 'uploads/media/CZXERd8s2nBZI5NjlJmy86CCa0DAPojslh5geJLI.jpg', 3136981, 'image', 'markus-clemens-mibjbNoS1XA-unsplash.jpg', 'jpg', '2023-06-14 18:11:48', '2023-06-14 18:11:48', NULL),
(55, 2, 'uploads/media/Q4VOvgdsKSvAqVCRu3Ky2r4v9nHSEMa5mjdOC9vx.jpg', 119050, 'image', 'bouqeuts5.png', 'png', '2023-06-14 18:15:24', '2023-06-14 18:15:24', NULL),
(56, 2, 'uploads/media/BKNLLwTx4HzIeR5WEeB3rVHyiFNzmd3OvZ80jd4Y.jpg', 512823, 'image', 'b5.jpg', 'jpg', '2023-06-14 18:19:35', '2023-06-14 18:19:35', NULL),
(57, 2, 'uploads/media/5HcFBwAv1wNYWqiagPxB9WjTbqGeaHqM1zPkD1wU.jpg', 108196, 'image', 'b6.jpg', 'jpg', '2023-06-14 18:35:41', '2023-06-14 18:35:41', NULL),
(58, 2, 'uploads/media/hfVRspDDyy4NxG8PhI2mtSSCSnXwCxxPpHsNYp9D.jpg', 29829, 'image', 'b7.jpg', 'jpg', '2023-06-14 18:37:23', '2023-06-14 18:37:23', NULL),
(59, 2, 'uploads/media/hODqyqzlrgUgt4mrtxfeSQZZ2tJ2sausWXCfOm4Z.jpg', 212867, 'image', 'b8.jpg', 'jpg', '2023-06-14 18:39:51', '2023-06-14 18:39:51', NULL),
(60, 2, 'uploads/media/DiCb8FfNDtm8zi89gvAhHbHH4mXLx1v37xcMpOeB.jpg', 509874, 'image', 'b10.jpg', 'jpg', '2023-06-14 18:44:09', '2023-06-14 18:44:09', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_10_31_050025_create_languages_table', 1),
(6, '2022_10_31_050126_create_localizations_table', 1),
(7, '2022_11_01_103504_create_brands_table', 1),
(8, '2022_11_02_053600_create_brand_localizations_table', 1),
(9, '2022_11_02_123335_create_units_table', 1),
(10, '2022_11_02_123459_create_unit_localizations_table', 1),
(11, '2022_11_05_052843_create_variations_table', 1),
(12, '2022_11_05_054556_create_variation_values_table', 1),
(13, '2022_11_05_054802_create_variation_localizations_table', 1),
(14, '2022_11_05_060326_create_variation_value_localizations_table', 1),
(15, '2022_11_05_094646_create_taxes_table', 1),
(16, '2022_11_05_121337_create_shops_table', 1),
(17, '2022_11_06_050339_create_coupons_table', 1),
(18, '2022_11_06_050628_create_coupon_usages_table', 1),
(19, '2022_11_06_073951_create_categories_table', 1),
(20, '2022_11_06_074215_create_category_localizations_table', 1),
(21, '2022_11_07_044613_create_category_brands_table', 1),
(22, '2022_11_07_061318_create_tags_table', 1),
(23, '2022_11_07_064323_create_blog_categories_table', 1),
(24, '2022_11_07_085058_create_blogs_table', 1),
(25, '2022_11_07_085227_create_blog_localizations_table', 1),
(26, '2022_11_07_105203_create_blog_tags_table', 1),
(27, '2022_11_09_050229_create_currencies_table', 1),
(28, '2022_11_12_044845_create_system_settings_table', 1),
(29, '2022_11_12_054927_create_products_table', 1),
(30, '2022_11_12_055104_create_product_localizations_table', 1),
(31, '2022_11_12_055551_create_product_categories_table', 1),
(32, '2022_11_12_055602_create_product_taxes_table', 1),
(33, '2022_11_12_055843_create_product_variations_table', 1),
(34, '2022_11_12_055914_create_product_variation_stocks_table', 1),
(35, '2022_11_12_055926_create_product_variation_combinations_table', 1),
(36, '2022_11_12_055958_create_product_colors_table', 1),
(37, '2022_11_16_063630_create_logistics_table', 1),
(38, '2022_11_16_064842_create_logistic_zones_table', 1),
(39, '2022_11_16_094759_create_subscribed_users_table', 1),
(40, '2022_11_20_045224_create_campaigns_table', 1),
(41, '2022_11_20_045328_create_campaign_products_table', 1),
(42, '2022_11_20_085351_create_pages_table', 1),
(43, '2022_11_20_085638_create_page_localizations_table', 1),
(44, '2022_11_23_095815_create_countries_table', 1),
(45, '2022_11_23_095827_create_states_table', 1),
(46, '2022_11_23_095839_create_cities_table', 1),
(47, '2022_11_27_080124_create_permission_tables', 1),
(48, '2022_11_28_122043_create_logistic_zone_cities_table', 1),
(49, '2022_12_13_051944_create_media_managers_table', 1),
(50, '2023_01_24_084123_create_carts_table', 1),
(51, '2023_01_31_051011_create_user_addresses_table', 1),
(52, '2023_02_01_105413_create_order_groups_table', 1),
(53, '2023_02_01_105521_create_orders_table', 1),
(54, '2023_02_01_105530_create_order_items_table', 1),
(55, '2023_02_07_111010_create_wishlists_table', 1),
(56, '2023_02_08_054446_create_contact_us_messages_table', 1),
(57, '2023_02_19_093630_create_order_updates_table', 1),
(58, '2023_02_27_105939_create_product_tags_table', 1),
(59, '2023_03_18_100524_create_scheduled_delivery_time_lists_table', 1),
(60, '2023_03_27_054134_create_locations_table', 1),
(61, '2023_04_09_035532_create_reward_points_table', 1),
(62, '2023_04_09_041125_create_wallet_histories_table', 1),
(63, '2023_04_09_091251_create_refunds_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(1, 'App\\Models\\User', 2),
(1, 'App\\Models\\User', 3);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_group_id` int(11) NOT NULL,
  `shop_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `guest_user_id` int(11) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `delivery_status` varchar(255) NOT NULL DEFAULT 'order_placed',
  `payment_status` varchar(255) NOT NULL DEFAULT 'unpaid',
  `applied_coupon_code` varchar(255) DEFAULT NULL,
  `coupon_discount_amount` double NOT NULL DEFAULT 0,
  `admin_earning_percentage` double NOT NULL DEFAULT 0 COMMENT 'how much in percentage seller will pay to admin for each sell',
  `total_admin_earnings` double NOT NULL DEFAULT 0,
  `total_vendor_earnings` double NOT NULL DEFAULT 0,
  `logistic_id` int(11) DEFAULT NULL,
  `logistic_name` varchar(255) DEFAULT NULL,
  `pickup_or_delivery` varchar(255) NOT NULL DEFAULT 'delivery',
  `shipping_delivery_type` varchar(255) NOT NULL DEFAULT 'regular' COMMENT 'regular/scheduled',
  `scheduled_delivery_info` longtext DEFAULT NULL COMMENT 'keep date & time',
  `pickup_hub_id` int(11) DEFAULT NULL,
  `shipping_cost` double NOT NULL DEFAULT 0,
  `tips_amount` double NOT NULL DEFAULT 0,
  `reward_points` bigint(20) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `order_group_id`, `shop_id`, `user_id`, `guest_user_id`, `location_id`, `delivery_status`, `payment_status`, `applied_coupon_code`, `coupon_discount_amount`, `admin_earning_percentage`, `total_admin_earnings`, `total_vendor_earnings`, `logistic_id`, `logistic_name`, `pickup_or_delivery`, `shipping_delivery_type`, `scheduled_delivery_info`, `pickup_hub_id`, `shipping_cost`, `tips_amount`, `reward_points`, `created_at`, `updated_at`) VALUES
(1, 4, 1, 6, NULL, 1, 'order_placed', 'paid', NULL, 0, 0, 31.5, 0, 3, 'DHL Morocco', 'delivery', 'regular', NULL, NULL, 0, 0, 0, '2023-06-07 23:46:36', '2023-06-07 23:47:22'),
(2, 6, 1, 7, NULL, 1, 'order_placed', 'paid', NULL, 0, 0, 31.5, 0, 3, 'DHL Morocco', 'delivery', 'regular', NULL, NULL, 0, 0, 0, '2023-06-08 00:44:14', '2023-06-08 00:44:53'),
(3, 7, 1, 7, NULL, 1, 'order_placed', 'unpaid', NULL, 0, 0, 31.5, 0, 3, 'DHL Morocco', 'delivery', 'regular', NULL, NULL, 0, 0, 0, '2023-06-14 12:00:04', '2023-06-14 12:00:04'),
(4, 8, 1, 7, NULL, 1, 'order_placed', 'unpaid', NULL, 0, 0, 17, 0, 3, 'DHL Morocco', 'delivery', 'regular', NULL, NULL, 0, 0, 0, '2023-06-14 14:42:24', '2023-06-14 14:42:24'),
(5, 9, 1, 7, NULL, 1, 'order_placed', 'unpaid', NULL, 0, 0, 47, 0, 3, 'DHL Morocco', 'delivery', 'regular', NULL, NULL, 0, 0, 0, '2023-06-14 16:13:09', '2023-06-14 16:13:09');

-- --------------------------------------------------------

--
-- Table structure for table `order_groups`
--

CREATE TABLE `order_groups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `guest_user_id` int(11) DEFAULT NULL,
  `order_code` bigint(20) NOT NULL,
  `shipping_address_id` int(11) DEFAULT NULL,
  `billing_address_id` int(11) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `phone_no` varchar(255) DEFAULT NULL,
  `alternative_phone_no` varchar(255) DEFAULT NULL,
  `sub_total_amount` double NOT NULL DEFAULT 0,
  `total_tax_amount` double NOT NULL DEFAULT 0,
  `total_coupon_discount_amount` double NOT NULL DEFAULT 0,
  `total_shipping_cost` double NOT NULL DEFAULT 0,
  `grand_total_amount` double NOT NULL DEFAULT 0,
  `payment_method` varchar(255) NOT NULL DEFAULT 'cash_on_delivery',
  `payment_status` varchar(255) NOT NULL DEFAULT 'unpaid',
  `payment_details` longtext DEFAULT NULL,
  `is_manual_payment` tinyint(1) NOT NULL DEFAULT 0,
  `manual_payment_details` longtext DEFAULT NULL,
  `is_pos_order` tinyint(4) NOT NULL DEFAULT 0,
  `pos_order_address` text DEFAULT NULL,
  `additional_discount_value` double NOT NULL DEFAULT 0,
  `additional_discount_type` varchar(255) NOT NULL DEFAULT 'flat',
  `total_discount_amount` double NOT NULL DEFAULT 0,
  `total_tips_amount` double NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `gift_card_message` varchar(255) DEFAULT 'NONE'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_groups`
--

INSERT INTO `order_groups` (`id`, `user_id`, `guest_user_id`, `order_code`, `shipping_address_id`, `billing_address_id`, `location_id`, `phone_no`, `alternative_phone_no`, `sub_total_amount`, `total_tax_amount`, `total_coupon_discount_amount`, `total_shipping_cost`, `grand_total_amount`, `payment_method`, `payment_status`, `payment_details`, `is_manual_payment`, `manual_payment_details`, `is_pos_order`, `pos_order_address`, `additional_discount_value`, `additional_discount_type`, `total_discount_amount`, `total_tips_amount`, `created_at`, `updated_at`, `deleted_at`, `gift_card_message`) VALUES
(1, 6, NULL, 1, 1, 1, 1, NULL, NULL, 31.5, 0, 0, 0, 31.5, 'cash_on_delivery', 'unpaid', NULL, 0, NULL, 0, NULL, 0, 'flat', 0, 0, '2023-06-07 23:43:50', '2023-06-07 23:43:50', NULL, 'Have a great time ~Oussama'),
(2, 6, NULL, 2, 1, 1, 1, NULL, NULL, 31.5, 0, 0, 0, 31.5, 'cash_on_delivery', 'unpaid', NULL, 0, NULL, 0, NULL, 0, 'flat', 0, 0, '2023-06-07 23:44:12', '2023-06-07 23:44:12', NULL, 'Have a great time ~Oussama'),
(3, 6, NULL, 3, 1, 1, 1, NULL, NULL, 31.5, 0, 0, 0, 31.5, 'cash_on_delivery', 'unpaid', NULL, 0, NULL, 0, NULL, 0, 'flat', 0, 0, '2023-06-07 23:45:00', '2023-06-07 23:45:00', NULL, 'Have a great time ~Oussama'),
(4, 6, NULL, 4, 1, 1, 1, NULL, NULL, 31.5, 0, 0, 0, 31.5, 'stripe', 'paid', '\"{\\\"status\\\":\\\"Success\\\"}\"', 0, NULL, 0, NULL, 0, 'flat', 0, 0, '2023-06-07 23:46:36', '2023-06-07 23:47:22', NULL, 'Happy birthay friend'),
(5, 7, NULL, 5, 2, 2, 1, NULL, NULL, 31.5, 0, 0, 0, 31.5, 'cash_on_delivery', 'unpaid', NULL, 0, NULL, 0, NULL, 0, 'flat', 0, 0, '2023-06-08 00:43:04', '2023-06-08 00:43:04', NULL, 'Happy Marriage to you'),
(6, 7, NULL, 6, 2, 2, 1, NULL, NULL, 31.5, 0, 0, 0, 31.5, 'stripe', 'paid', '\"{\\\"status\\\":\\\"Success\\\"}\"', 0, NULL, 0, NULL, 0, 'flat', 0, 0, '2023-06-08 00:44:14', '2023-06-08 00:44:53', NULL, 'happy marriage to you'),
(7, 7, NULL, 7, 2, 2, 1, NULL, NULL, 31.5, 0, 0, 0, 31.5, 'stripe', 'unpaid', NULL, 0, NULL, 0, NULL, 0, 'flat', 0, 0, '2023-06-14 12:00:04', '2023-06-14 12:00:04', NULL, NULL),
(8, 7, NULL, 8, 2, 2, 1, NULL, NULL, 17, 0, 0, 0, 17, 'stripe', 'unpaid', NULL, 0, NULL, 0, NULL, 0, 'flat', 0, 0, '2023-06-14 14:42:24', '2023-06-14 14:42:24', NULL, NULL),
(9, 7, NULL, 9, 2, 2, 1, NULL, NULL, 47, 0, 0, 0, 47, 'stripe', 'unpaid', NULL, 0, NULL, 0, NULL, 0, 'flat', 0, 0, '2023-06-14 16:13:09', '2023-06-14 16:13:09', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_variation_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL DEFAULT 1,
  `location_id` int(11) DEFAULT NULL,
  `unit_price` double NOT NULL DEFAULT 0,
  `total_tax` double NOT NULL DEFAULT 0,
  `total_price` double NOT NULL DEFAULT 0,
  `reward_points` bigint(20) NOT NULL DEFAULT 0,
  `is_refunded` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_variation_id`, `qty`, `location_id`, `unit_price`, `total_tax`, `total_price`, `reward_points`, `is_refunded`, `created_at`, `updated_at`) VALUES
(1, 1, 14, 1, 1, 31.5, 0, 31.5, 0, 0, '2023-06-07 23:46:36', '2023-06-07 23:46:36'),
(2, 2, 14, 1, 1, 31.5, 0, 31.5, 0, 0, '2023-06-08 00:44:14', '2023-06-08 00:44:14'),
(3, 3, 14, 1, 1, 31.5, 0, 31.5, 0, 0, '2023-06-14 12:00:04', '2023-06-14 12:00:04'),
(4, 4, 7, 1, 1, 17, 0, 17, 0, 0, '2023-06-14 14:42:24', '2023-06-14 14:42:24'),
(5, 5, 9, 1, 1, 47, 0, 47, 0, 0, '2023-06-14 16:13:09', '2023-06-14 16:13:09');

-- --------------------------------------------------------

--
-- Table structure for table `order_updates`
--

CREATE TABLE `order_updates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `note` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `content` longtext DEFAULT NULL,
  `meta_title` mediumtext DEFAULT NULL,
  `meta_image` varchar(255) DEFAULT NULL,
  `meta_description` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `title`, `slug`, `content`, `meta_title`, `meta_image`, `meta_description`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Terms & Conditions', 'terms-conditions', '<div class=\"mb-5\" style=\"color: rgb(71, 85, 105); font-family: Jost, sans-serif; font-size: 15.008px;\"><h2 class=\"h5\" style=\"font-family: Rubik, sans-serif; font-weight: 500; color: rgb(51, 65, 85); font-size: 1.1725rem;\"><span style=\"color: rgb(71, 85, 105); font-family: Jost, sans-serif; font-size: 15.008px; background-color: var(--bs-body-bg); font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align);\">Welcome to ThemeTags!</span><br></h2><p style=\"\">These terms and conditions outline the rules and regulations for the use of Themetags\'s Website, located at https://themetags.com/.</p><p style=\"\">By accessing this website we assume you accept these terms and conditions. Do not continue to use ThemeTags if you do not agree to take all of the terms and conditions stated on this page.</p><p class=\"mb-0\" style=\"\">The following terminology applies to these Terms and Conditions, Privacy Statement and Disclaimer Notice and all Agreements: \"Client\", \"You\" and \"Your\" refers to you, the person log on this website and compliant to the Company\'s terms and conditions. \"The Company\", \"Ourselves\", \"We\", \"Our\" and \"Us\", refers to our Company. \"Party\", \"Parties\", or \"Us\", refers to both the Client and ourselves. All terms refer to the offer, acceptance and consideration of payment necessary to undertake the process of our assistance to the Client in the most appropriate manner for the express purpose of meeting the Client’s needs in respect of provision of the Company’s stated services, in accordance with and subject to, prevailing law of Netherlands. Any use of the above terminology or other words in the singular, plural, capitalization and/or he/she or they, are taken as interchangeable and therefore as referring to same.</p></div><div class=\"mb-5\" style=\"color: rgb(71, 85, 105); font-family: Jost, sans-serif; font-size: 15.008px;\"><h2 class=\"h5\" style=\"font-family: Rubik, sans-serif; font-weight: 500; color: rgb(51, 65, 85); font-size: 1.1725rem;\">Cookies</h2><p>We employ the use of cookies. By accessing ThemeTags, you agreed to use cookies in agreement with the Themetags\'s Privacy Policy.</p><p class=\"mb-0\">Most interactive websites use cookies to let us retrieve the user\'s details for each visit. Cookies are used by our website to enable the functionality of certain areas to make it easier for people visiting our website. Some of our affiliate/advertising partners may also use cookies.</p></div><div class=\"mb-5\" style=\"color: rgb(71, 85, 105); font-family: Jost, sans-serif; font-size: 15.008px;\"><h2 class=\"h5\" style=\"font-family: Rubik, sans-serif; font-weight: 500; color: rgb(51, 65, 85); font-size: 1.1725rem;\">License</h2><p>Unless otherwise stated, Themetags and/or its licensors own the intellectual property rights for all material on ThemeTags. All intellectual property rights are reserved. You may access this from ThemeTags for your own personal use subjected to restrictions set in these terms and conditions.</p><p>You must not:</p><ul class=\"mb-3\"><li>Republish material from ThemeTags</li><li>Sell, rent or sub-license material from ThemeTags</li><li>Reproduce, duplicate or copy material from ThemeTags</li><li>Redistribute content from ThemeTags</li></ul><p>Parts of this website offer an opportunity for users to post and exchange opinions and information in certain areas of the website. Themetags does not filter, edit, publish or review Comments prior to their presence on the website. Comments do not reflect the views and opinions of Themetags,its agents and/or affiliates. Comments reflect the views and opinions of the person who post their views and opinions. To the extent permitted by applicable laws, Themetags shall not be liable for the Comments or for any liability, damages or expenses caused and/or suffered as a result of any use of and/or posting of and/or appearance of the Comments on this website.</p><p>Themetags reserves the right to monitor all Comments and to remove any Comments which can be considered inappropriate, offensive or causes breach of these Terms and Conditions.</p><p>You warrant and represent that:</p><ul class=\"mb-3\"><li>You are entitled to post the Comments on our website and have all necessary licenses and consents to do so;</li><li>The Comments do not invade any intellectual property right, including without limitation copyright, patent or trademark of any third party;</li><li>The Comments do not contain any defamatory, libelous, offensive, indecent or otherwise unlawful material which is an invasion of privacy</li><li>The Comments will not be used to solicit or promote business or custom or present commercial activities or unlawful activity.</li></ul><p class=\"mb-0\">You hereby grant Themetags a non-exclusive license to use, reproduce, edit and authorize others to use, reproduce and edit any of your Comments in any and all forms, formats or media.</p></div><div class=\"mb-5\" style=\"color: rgb(71, 85, 105); font-family: Jost, sans-serif; font-size: 15.008px;\"><h2 class=\"h5\" style=\"font-family: Rubik, sans-serif; font-weight: 500; color: rgb(51, 65, 85); font-size: 1.1725rem;\">Hyperlinking to our Content</h2><p>The following organizations may link to our Website without prior written approval:</p><ul class=\"mb-3\"><li>Government agencies;</li><li>Search engines;</li><li>News organizations;</li><li>Online directory distributors may link to our Website in the same manner as they hyperlink to the Websites of other listed businesses; and</li><li>System wide Accredited Businesses except soliciting non-profit organizations, charity shopping malls, and charity fundraising groups which may not hyperlink to our Web site.</li></ul><p>These organizations may link to our home page, to publications or to other Website information so long as the link: (a) is not in any way deceptive; (b) does not falsely imply sponsorship, endorsement or approval of the linking party and its products and/or services; and (c) fits within the context of the linking party\'s site.</p><p>We may consider and approve other link requests from the following types of organizations:</p><ul class=\"mb-3\"><li>commonly-known consumer and/or business information sources;</li><li>dot.com community sites;</li><li>associations or other groups representing charities;</li><li>online directory distributors;</li><li>internet portals;</li><li>accounting, law and consulting firms; and</li><li>educational institutions and trade associations.</li></ul><p>We will approve link requests from these organizations if we decide that: (a) the link would not make us look unfavorably to ourselves or to our accredited businesses; (b) the organization does not have any negative records with us; (c) the benefit to us from the visibility of the hyperlink compensates the absence of Themetags; and (d) the link is in the context of general resource information.</p><p>These organizations may link to our home page so long as the link: (a) is not in any way deceptive; (b) does not falsely imply sponsorship, endorsement or approval of the linking party and its products or services; and (c) fits within the context of the linking party\'s site.</p><p>If you are one of the organizations listed in paragraph 2 above and are interested in linking to our website, you must inform us by sending an e-mail to Themetags. Please include your name, your organization name, contact information as well as the URL of your site, a list of any URLs from which you intend to link to our Website, and a list of the URLs on our site to which you would like to link. Wait 2-3 weeks for a response.</p><p>Approved organizations may hyperlink to our Website as follows:</p><ul class=\"mb-3\"><li>By use of our corporate name; or</li><li>By use of the uniform resource locator being linked to; or</li><li>By use of any other description of our Website being linked to that makes sense within the context and format of content on the linking party’s site.</li></ul><p>No use of Themetags\'s logo or other artwork will be allowed for linking absent a trademark license agreement.</p></div><div class=\"mb-5\" style=\"color: rgb(71, 85, 105); font-family: Jost, sans-serif; font-size: 15.008px;\"><h2 class=\"h5\" style=\"font-family: Rubik, sans-serif; font-weight: 500; color: rgb(51, 65, 85); font-size: 1.1725rem;\">iFrames</h2><p class=\"mb-0\">Without prior approval and written permission, you may not create frames around our Webpages that alter in any way the visual presentation or appearance of our Website.</p></div><div class=\"mb-5\" style=\"color: rgb(71, 85, 105); font-family: Jost, sans-serif; font-size: 15.008px;\"><h2 class=\"h5\" style=\"font-family: Rubik, sans-serif; font-weight: 500; color: rgb(51, 65, 85); font-size: 1.1725rem;\">Content Liability</h2><p class=\"mb-0\">We shall not be hold responsible for any content that appears on your Website. You agree to protect and defend us against all claims that is rising on your Website. No link(s) should appear on any Website that may be interpreted as libelous, obscene or criminal, or which infringes, otherwise violates, or advocates the infringement or other violation of, any third party rights.</p></div><div class=\"mb-5\" style=\"color: rgb(71, 85, 105); font-family: Jost, sans-serif; font-size: 15.008px;\"><h2 class=\"h5\" style=\"font-family: Rubik, sans-serif; font-weight: 500; color: rgb(51, 65, 85); font-size: 1.1725rem;\">Your Privacy</h2><p class=\"mb-0\">Please read Privacy Policy</p></div><div class=\"mb-5\" style=\"color: rgb(71, 85, 105); font-family: Jost, sans-serif; font-size: 15.008px;\"><h2 class=\"h5\" style=\"font-family: Rubik, sans-serif; font-weight: 500; color: rgb(51, 65, 85); font-size: 1.1725rem;\">Reservation of Rights</h2><p class=\"mb-0\">We reserve the right to request that you remove all links or any particular link to our Website. You approve to immediately remove all links to our Website upon request. We also reserve the right to amen these terms and conditions and it\'s linking policy at any time. By continuously linking to our Website, you agree to be bound to and follow these linking terms and conditions.</p></div><div class=\"mb-5\" style=\"color: rgb(71, 85, 105); font-family: Jost, sans-serif; font-size: 15.008px;\"><h2 class=\"h5\" style=\"font-family: Rubik, sans-serif; font-weight: 500; color: rgb(51, 65, 85); font-size: 1.1725rem;\">Removal of links from our website</h2><p>If you find any link on our Website that is offensive for any reason, you are free to contact and inform us any moment. We will consider requests to remove links but we are not obligated to or so or to respond to you directly.</p><p class=\"mb-0\">We do not ensure that the information on this website is correct, we do not warrant its completeness or accuracy; nor do we promise to ensure that the website remains available or that the material on the website is kept up to date.</p></div><div class=\"content-group\" style=\"color: rgb(71, 85, 105); font-family: Jost, sans-serif; font-size: 15.008px;\"><h2 class=\"h5\" style=\"font-family: Rubik, sans-serif; font-weight: 500; color: rgb(51, 65, 85); font-size: 1.1725rem;\">Disclaimer</h2><p style=\"\">To the maximum extent permitted by applicable law, we exclude all representations, warranties and conditions relating to our website and the use of this website. Nothing in this disclaimer will:</p><ul style=\"\"><li>limit or exclude our or your liability for death or personal injury;</li><li>limit or exclude our or your liability for fraud or fraudulent misrepresentation;</li><li>limit any of our or your liabilities in any way that is not permitted under applicable law; or</li><li>exclude any of our or your liabilities that may not be excluded under applicable law.</li></ul><p style=\"\">The limitations and prohibitions of liability set in this Section and elsewhere in this disclaimer: (a) are subject to the preceding paragraph; and (b) govern all liabilities arising under the disclaimer, including liabilities arising in contract, in tort and for breach of statutory duty.</p><p class=\"mb-0\" style=\"\">As long as the website and the information and services on the website are provided free of charge, we will not be liable for any loss or damage of any nature.</p></div>', 'Quis ab ut officia b', '30', 'Explicabo Consectet', '2023-02-16 05:28:22', '2023-03-01 04:18:38', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `page_localizations`
--

CREATE TABLE `page_localizations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `page_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` longtext DEFAULT NULL,
  `lang_key` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `page_localizations`
--

INSERT INTO `page_localizations` (`id`, `page_id`, `title`, `content`, `lang_key`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Terms & Conditions', '<div class=\"mb-5\" style=\"color: rgb(71, 85, 105); font-family: Jost, sans-serif; font-size: 15.008px;\"><h2 class=\"h5\" style=\"font-family: Rubik, sans-serif; font-weight: 500; color: rgb(51, 65, 85); font-size: 1.1725rem;\"><span style=\"color: rgb(71, 85, 105); font-family: Jost, sans-serif; font-size: 15.008px; background-color: var(--bs-body-bg); font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align);\">Welcome to ThemeTags!</span><br></h2><p style=\"\">These terms and conditions outline the rules and regulations for the use of Themetags\'s Website, located at https://themetags.com/.</p><p style=\"\">By accessing this website we assume you accept these terms and conditions. Do not continue to use ThemeTags if you do not agree to take all of the terms and conditions stated on this page.</p><p class=\"mb-0\" style=\"\">The following terminology applies to these Terms and Conditions, Privacy Statement and Disclaimer Notice and all Agreements: \"Client\", \"You\" and \"Your\" refers to you, the person log on this website and compliant to the Company\'s terms and conditions. \"The Company\", \"Ourselves\", \"We\", \"Our\" and \"Us\", refers to our Company. \"Party\", \"Parties\", or \"Us\", refers to both the Client and ourselves. All terms refer to the offer, acceptance and consideration of payment necessary to undertake the process of our assistance to the Client in the most appropriate manner for the express purpose of meeting the Client’s needs in respect of provision of the Company’s stated services, in accordance with and subject to, prevailing law of Netherlands. Any use of the above terminology or other words in the singular, plural, capitalization and/or he/she or they, are taken as interchangeable and therefore as referring to same.</p></div><div class=\"mb-5\" style=\"color: rgb(71, 85, 105); font-family: Jost, sans-serif; font-size: 15.008px;\"><h2 class=\"h5\" style=\"font-family: Rubik, sans-serif; font-weight: 500; color: rgb(51, 65, 85); font-size: 1.1725rem;\">Cookies</h2><p>We employ the use of cookies. By accessing ThemeTags, you agreed to use cookies in agreement with the Themetags\'s Privacy Policy.</p><p class=\"mb-0\">Most interactive websites use cookies to let us retrieve the user\'s details for each visit. Cookies are used by our website to enable the functionality of certain areas to make it easier for people visiting our website. Some of our affiliate/advertising partners may also use cookies.</p></div><div class=\"mb-5\" style=\"color: rgb(71, 85, 105); font-family: Jost, sans-serif; font-size: 15.008px;\"><h2 class=\"h5\" style=\"font-family: Rubik, sans-serif; font-weight: 500; color: rgb(51, 65, 85); font-size: 1.1725rem;\">License</h2><p>Unless otherwise stated, Themetags and/or its licensors own the intellectual property rights for all material on ThemeTags. All intellectual property rights are reserved. You may access this from ThemeTags for your own personal use subjected to restrictions set in these terms and conditions.</p><p>You must not:</p><ul class=\"mb-3\"><li>Republish material from ThemeTags</li><li>Sell, rent or sub-license material from ThemeTags</li><li>Reproduce, duplicate or copy material from ThemeTags</li><li>Redistribute content from ThemeTags</li></ul><p>Parts of this website offer an opportunity for users to post and exchange opinions and information in certain areas of the website. Themetags does not filter, edit, publish or review Comments prior to their presence on the website. Comments do not reflect the views and opinions of Themetags,its agents and/or affiliates. Comments reflect the views and opinions of the person who post their views and opinions. To the extent permitted by applicable laws, Themetags shall not be liable for the Comments or for any liability, damages or expenses caused and/or suffered as a result of any use of and/or posting of and/or appearance of the Comments on this website.</p><p>Themetags reserves the right to monitor all Comments and to remove any Comments which can be considered inappropriate, offensive or causes breach of these Terms and Conditions.</p><p>You warrant and represent that:</p><ul class=\"mb-3\"><li>You are entitled to post the Comments on our website and have all necessary licenses and consents to do so;</li><li>The Comments do not invade any intellectual property right, including without limitation copyright, patent or trademark of any third party;</li><li>The Comments do not contain any defamatory, libelous, offensive, indecent or otherwise unlawful material which is an invasion of privacy</li><li>The Comments will not be used to solicit or promote business or custom or present commercial activities or unlawful activity.</li></ul><p class=\"mb-0\">You hereby grant Themetags a non-exclusive license to use, reproduce, edit and authorize others to use, reproduce and edit any of your Comments in any and all forms, formats or media.</p></div><div class=\"mb-5\" style=\"color: rgb(71, 85, 105); font-family: Jost, sans-serif; font-size: 15.008px;\"><h2 class=\"h5\" style=\"font-family: Rubik, sans-serif; font-weight: 500; color: rgb(51, 65, 85); font-size: 1.1725rem;\">Hyperlinking to our Content</h2><p>The following organizations may link to our Website without prior written approval:</p><ul class=\"mb-3\"><li>Government agencies;</li><li>Search engines;</li><li>News organizations;</li><li>Online directory distributors may link to our Website in the same manner as they hyperlink to the Websites of other listed businesses; and</li><li>System wide Accredited Businesses except soliciting non-profit organizations, charity shopping malls, and charity fundraising groups which may not hyperlink to our Web site.</li></ul><p>These organizations may link to our home page, to publications or to other Website information so long as the link: (a) is not in any way deceptive; (b) does not falsely imply sponsorship, endorsement or approval of the linking party and its products and/or services; and (c) fits within the context of the linking party\'s site.</p><p>We may consider and approve other link requests from the following types of organizations:</p><ul class=\"mb-3\"><li>commonly-known consumer and/or business information sources;</li><li>dot.com community sites;</li><li>associations or other groups representing charities;</li><li>online directory distributors;</li><li>internet portals;</li><li>accounting, law and consulting firms; and</li><li>educational institutions and trade associations.</li></ul><p>We will approve link requests from these organizations if we decide that: (a) the link would not make us look unfavorably to ourselves or to our accredited businesses; (b) the organization does not have any negative records with us; (c) the benefit to us from the visibility of the hyperlink compensates the absence of Themetags; and (d) the link is in the context of general resource information.</p><p>These organizations may link to our home page so long as the link: (a) is not in any way deceptive; (b) does not falsely imply sponsorship, endorsement or approval of the linking party and its products or services; and (c) fits within the context of the linking party\'s site.</p><p>If you are one of the organizations listed in paragraph 2 above and are interested in linking to our website, you must inform us by sending an e-mail to Themetags. Please include your name, your organization name, contact information as well as the URL of your site, a list of any URLs from which you intend to link to our Website, and a list of the URLs on our site to which you would like to link. Wait 2-3 weeks for a response.</p><p>Approved organizations may hyperlink to our Website as follows:</p><ul class=\"mb-3\"><li>By use of our corporate name; or</li><li>By use of the uniform resource locator being linked to; or</li><li>By use of any other description of our Website being linked to that makes sense within the context and format of content on the linking party’s site.</li></ul><p>No use of Themetags\'s logo or other artwork will be allowed for linking absent a trademark license agreement.</p></div><div class=\"mb-5\" style=\"color: rgb(71, 85, 105); font-family: Jost, sans-serif; font-size: 15.008px;\"><h2 class=\"h5\" style=\"font-family: Rubik, sans-serif; font-weight: 500; color: rgb(51, 65, 85); font-size: 1.1725rem;\">iFrames</h2><p class=\"mb-0\">Without prior approval and written permission, you may not create frames around our Webpages that alter in any way the visual presentation or appearance of our Website.</p></div><div class=\"mb-5\" style=\"color: rgb(71, 85, 105); font-family: Jost, sans-serif; font-size: 15.008px;\"><h2 class=\"h5\" style=\"font-family: Rubik, sans-serif; font-weight: 500; color: rgb(51, 65, 85); font-size: 1.1725rem;\">Content Liability</h2><p class=\"mb-0\">We shall not be hold responsible for any content that appears on your Website. You agree to protect and defend us against all claims that is rising on your Website. No link(s) should appear on any Website that may be interpreted as libelous, obscene or criminal, or which infringes, otherwise violates, or advocates the infringement or other violation of, any third party rights.</p></div><div class=\"mb-5\" style=\"color: rgb(71, 85, 105); font-family: Jost, sans-serif; font-size: 15.008px;\"><h2 class=\"h5\" style=\"font-family: Rubik, sans-serif; font-weight: 500; color: rgb(51, 65, 85); font-size: 1.1725rem;\">Your Privacy</h2><p class=\"mb-0\">Please read Privacy Policy</p></div><div class=\"mb-5\" style=\"color: rgb(71, 85, 105); font-family: Jost, sans-serif; font-size: 15.008px;\"><h2 class=\"h5\" style=\"font-family: Rubik, sans-serif; font-weight: 500; color: rgb(51, 65, 85); font-size: 1.1725rem;\">Reservation of Rights</h2><p class=\"mb-0\">We reserve the right to request that you remove all links or any particular link to our Website. You approve to immediately remove all links to our Website upon request. We also reserve the right to amen these terms and conditions and it\'s linking policy at any time. By continuously linking to our Website, you agree to be bound to and follow these linking terms and conditions.</p></div><div class=\"mb-5\" style=\"color: rgb(71, 85, 105); font-family: Jost, sans-serif; font-size: 15.008px;\"><h2 class=\"h5\" style=\"font-family: Rubik, sans-serif; font-weight: 500; color: rgb(51, 65, 85); font-size: 1.1725rem;\">Removal of links from our website</h2><p>If you find any link on our Website that is offensive for any reason, you are free to contact and inform us any moment. We will consider requests to remove links but we are not obligated to or so or to respond to you directly.</p><p class=\"mb-0\">We do not ensure that the information on this website is correct, we do not warrant its completeness or accuracy; nor do we promise to ensure that the website remains available or that the material on the website is kept up to date.</p></div><div class=\"content-group\" style=\"color: rgb(71, 85, 105); font-family: Jost, sans-serif; font-size: 15.008px;\"><h2 class=\"h5\" style=\"font-family: Rubik, sans-serif; font-weight: 500; color: rgb(51, 65, 85); font-size: 1.1725rem;\">Disclaimer</h2><p style=\"\">To the maximum extent permitted by applicable law, we exclude all representations, warranties and conditions relating to our website and the use of this website. Nothing in this disclaimer will:</p><ul style=\"\"><li>limit or exclude our or your liability for death or personal injury;</li><li>limit or exclude our or your liability for fraud or fraudulent misrepresentation;</li><li>limit any of our or your liabilities in any way that is not permitted under applicable law; or</li><li>exclude any of our or your liabilities that may not be excluded under applicable law.</li></ul><p style=\"\">The limitations and prohibitions of liability set in this Section and elsewhere in this disclaimer: (a) are subject to the preceding paragraph; and (b) govern all liabilities arising under the disclaimer, including liabilities arising in contract, in tort and for breach of statutory duty.</p><p class=\"mb-0\" style=\"\">As long as the website and the information and services on the website are provided free of charge, we will not be liable for any loss or damage of any nature.</p></div>', 'en', '2023-02-16 05:28:22', '2023-03-01 04:18:38', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `group_name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `group_name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'dashboard', 'dashboard', 'web', NULL, NULL),
(2, 'products', 'products', 'web', NULL, NULL),
(3, 'add_products', 'products', 'web', NULL, NULL),
(4, 'edit_products', 'products', 'web', NULL, NULL),
(5, 'publish_products', 'products', 'web', NULL, NULL),
(6, 'categories', 'categories', 'web', NULL, NULL),
(7, 'add_categories', 'categories', 'web', NULL, NULL),
(8, 'edit_categories', 'categories', 'web', NULL, NULL),
(9, 'top_categories', 'categories', 'web', NULL, NULL),
(10, 'delete_categories', 'categories', 'web', NULL, NULL),
(11, 'variations', 'variations', 'web', NULL, NULL),
(12, 'add_variations', 'variations', 'web', NULL, NULL),
(13, 'edit_variations', 'variations', 'web', NULL, NULL),
(14, 'publish_variations', 'variations', 'web', NULL, NULL),
(15, 'variation_values', 'variations', 'web', NULL, NULL),
(16, 'add_variation_values', 'variations', 'web', NULL, NULL),
(17, 'edit_variation_values', 'variations', 'web', NULL, NULL),
(18, 'publish_variation_values', 'variations', 'web', NULL, NULL),
(19, 'brands', 'brands', 'web', NULL, NULL),
(20, 'add_brands', 'brands', 'web', NULL, NULL),
(21, 'edit_brands', 'brands', 'web', NULL, NULL),
(22, 'publish_brands', 'brands', 'web', NULL, NULL),
(23, 'delete_brands', 'brands', 'web', NULL, NULL),
(24, 'units', 'units', 'web', NULL, NULL),
(25, 'add_units', 'units', 'web', NULL, NULL),
(26, 'edit_units', 'units', 'web', NULL, NULL),
(27, 'publish_units', 'units', 'web', NULL, NULL),
(28, 'delete_units', 'units', 'web', NULL, NULL),
(29, 'taxes', 'taxes', 'web', NULL, NULL),
(30, 'add_taxes', 'taxes', 'web', NULL, NULL),
(31, 'edit_taxes', 'taxes', 'web', NULL, NULL),
(32, 'publish_taxes', 'taxes', 'web', NULL, NULL),
(33, 'delete_taxes', 'taxes', 'web', NULL, NULL),
(34, 'orders', 'orders', 'web', NULL, NULL),
(35, 'manage_orders', 'orders', 'web', NULL, NULL),
(36, 'customers', 'customers', 'web', NULL, NULL),
(37, 'ban_customers', 'customers', 'web', NULL, NULL),
(38, 'staffs', 'staffs', 'web', NULL, NULL),
(39, 'add_staffs', 'staffs', 'web', NULL, NULL),
(40, 'edit_staffs', 'staffs', 'web', NULL, NULL),
(41, 'delete_staffs', 'staffs', 'web', NULL, NULL),
(42, 'tags', 'tags', 'web', NULL, NULL),
(43, 'add_tags', 'tags', 'web', NULL, NULL),
(44, 'edit_tags', 'tags', 'web', NULL, NULL),
(45, 'delete_tags', 'tags', 'web', NULL, NULL),
(46, 'pages', 'pages', 'web', NULL, NULL),
(47, 'add_pages', 'pages', 'web', NULL, NULL),
(48, 'edit_pages', 'pages', 'web', NULL, NULL),
(49, 'delete_pages', 'pages', 'web', NULL, NULL),
(50, 'blogs', 'blogs', 'web', NULL, NULL),
(51, 'add_blogs', 'blogs', 'web', NULL, NULL),
(52, 'edit_blogs', 'blogs', 'web', NULL, NULL),
(53, 'publish_blogs', 'blogs', 'web', NULL, NULL),
(54, 'delete_blogs', 'blogs', 'web', NULL, NULL),
(55, 'blog_categories', 'blogs', 'web', NULL, NULL),
(56, 'add_blog_categories', 'blogs', 'web', NULL, NULL),
(57, 'edit_blog_categories', 'blogs', 'web', NULL, NULL),
(58, 'delete_blog_categories', 'blogs', 'web', NULL, NULL),
(59, 'media_manager', 'media_manager', 'web', NULL, NULL),
(60, 'add_media', 'media_manager', 'web', NULL, NULL),
(61, 'delete_media', 'media_manager', 'web', NULL, NULL),
(62, 'newsletters', 'newsletters', 'web', NULL, NULL),
(63, 'subscribers', 'newsletters', 'web', NULL, NULL),
(64, 'delete_subscribers', 'newsletters', 'web', NULL, NULL),
(65, 'coupons', 'coupons', 'web', NULL, NULL),
(66, 'add_coupons', 'coupons', 'web', NULL, NULL),
(67, 'edit_coupons', 'coupons', 'web', NULL, NULL),
(68, 'delete_coupons', 'coupons', 'web', NULL, NULL),
(69, 'campaigns', 'campaigns', 'web', NULL, NULL),
(70, 'add_campaigns', 'campaigns', 'web', NULL, NULL),
(71, 'edit_campaigns', 'campaigns', 'web', NULL, NULL),
(72, 'publish_campaigns', 'campaigns', 'web', NULL, NULL),
(73, 'delete_campaigns', 'campaigns', 'web', NULL, NULL),
(74, 'logistics', 'fulfillment', 'web', NULL, NULL),
(75, 'add_logistics', 'fulfillment', 'web', NULL, NULL),
(76, 'edit_logistics', 'fulfillment', 'web', NULL, NULL),
(77, 'publish_logistics', 'fulfillment', 'web', NULL, NULL),
(78, 'delete_logistics', 'fulfillment', 'web', NULL, NULL),
(79, 'shipping_zones', 'fulfillment', 'web', NULL, NULL),
(80, 'add_shipping_zones', 'fulfillment', 'web', NULL, NULL),
(81, 'edit_shipping_zones', 'fulfillment', 'web', NULL, NULL),
(82, 'delete_shipping_zones', 'fulfillment', 'web', NULL, NULL),
(83, 'shipping_cities', 'fulfillment', 'web', NULL, NULL),
(84, 'add_shipping_cities', 'fulfillment', 'web', NULL, NULL),
(85, 'edit_shipping_cities', 'fulfillment', 'web', NULL, NULL),
(86, 'publish_shipping_cities', 'fulfillment', 'web', NULL, NULL),
(87, 'shipping_states', 'fulfillment', 'web', NULL, NULL),
(88, 'add_shipping_states', 'fulfillment', 'web', NULL, NULL),
(89, 'edit_shipping_states', 'fulfillment', 'web', NULL, NULL),
(90, 'publish_shipping_states', 'fulfillment', 'web', NULL, NULL),
(91, 'shipping_countries', 'fulfillment', 'web', NULL, NULL),
(92, 'publish_shipping_countries', 'fulfillment', 'web', NULL, NULL),
(93, 'contact_us_messages', 'contact_us_messages', 'web', NULL, NULL),
(94, 'homepage', 'appearance', 'web', NULL, NULL),
(95, 'product_page', 'appearance', 'web', NULL, NULL),
(96, 'product_details_page', 'appearance', 'web', NULL, NULL),
(97, 'about_us_page', 'appearance', 'web', NULL, NULL),
(98, 'header', 'appearance', 'web', NULL, NULL),
(99, 'footer', 'appearance', 'web', NULL, NULL),
(100, 'roles_and_permissions', 'roles_and_permissions', 'web', NULL, NULL),
(101, 'add_roles_and_permissions', 'roles_and_permissions', 'web', NULL, NULL),
(102, 'edit_roles_and_permissions', 'roles_and_permissions', 'web', NULL, NULL),
(103, 'delete_roles_and_permissions', 'roles_and_permissions', 'web', NULL, NULL),
(104, 'smtp_settings', 'system_settings', 'web', NULL, NULL),
(105, 'general_settings', 'system_settings', 'web', NULL, NULL),
(106, 'currency_settings', 'system_settings', 'web', NULL, NULL),
(107, 'add_currency', 'system_settings', 'web', NULL, NULL),
(108, 'edit_currency', 'system_settings', 'web', NULL, NULL),
(109, 'publish_currency', 'system_settings', 'web', NULL, NULL),
(110, 'language_settings', 'system_settings', 'web', NULL, NULL),
(111, 'add_languages', 'system_settings', 'web', NULL, NULL),
(112, 'edit_languages', 'system_settings', 'web', NULL, NULL),
(113, 'publish_languages', 'system_settings', 'web', NULL, NULL),
(114, 'translate_languages', 'system_settings', 'web', NULL, NULL),
(115, 'order_settings', 'system_settings', 'web', NULL, NULL),
(116, 'payment_settings', 'system_settings', 'web', NULL, NULL),
(117, 'order_reports', 'reports', 'web', NULL, NULL),
(118, 'product_sale_reports', 'reports', 'web', NULL, NULL),
(119, 'category_sale_reports', 'reports', 'web', NULL, NULL),
(120, 'sales_amount_reports', 'reports', 'web', NULL, NULL),
(121, 'delivery_status_reports', 'reports', 'web', NULL, NULL),
(122, 'default_language', 'system_settings', 'web', NULL, NULL),
(123, 'default_currency', 'system_settings', 'web', NULL, NULL),
(124, 'add_stock', 'manage_stock', 'web', NULL, NULL),
(125, 'show_locations', 'manage_stock', 'web', NULL, NULL),
(126, 'add_location', 'manage_stock', 'web', NULL, NULL),
(127, 'edit_location', 'manage_stock', 'web', NULL, NULL),
(128, 'publish_locations', 'manage_stock', 'web', NULL, NULL),
(129, 'pos', 'pos', 'web', NULL, NULL),
(130, 'social_login_settings', 'system_settings', 'web', NULL, NULL),
(131, 'auth_settings', 'system_settings', 'web', NULL, NULL),
(132, 'otp_settings', 'system_settings', 'web', NULL, NULL),
(133, 'reward_configurations', 'rewards_and_wallet', 'web', NULL, NULL),
(134, 'set_reward_points', 'rewards_and_wallet', 'web', NULL, NULL),
(135, 'wallet_configurations', 'rewards_and_wallet', 'web', NULL, NULL),
(136, 'refund_configurations', 'refunds', 'web', NULL, NULL),
(137, 'refund_requests', 'refunds', 'web', NULL, NULL),
(138, 'approved_refunds', 'refunds', 'web', NULL, NULL),
(139, 'rejected_refunds', 'refunds', 'web', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `shop_id` int(11) NOT NULL,
  `added_by` varchar(255) NOT NULL DEFAULT 'admin',
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `thumbnail_image` text DEFAULT NULL,
  `gallery_images` longtext DEFAULT NULL,
  `product_tags` longtext DEFAULT NULL,
  `short_description` text DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `min_price` double NOT NULL DEFAULT 0,
  `max_price` double NOT NULL DEFAULT 0,
  `discount_value` double NOT NULL DEFAULT 0,
  `discount_type` varchar(255) DEFAULT NULL,
  `discount_start_date` int(11) DEFAULT NULL,
  `discount_end_date` int(11) DEFAULT NULL,
  `sell_target` int(11) DEFAULT NULL,
  `stock_qty` int(11) NOT NULL DEFAULT 0,
  `is_published` tinyint(4) NOT NULL DEFAULT 0,
  `is_featured` tinyint(4) NOT NULL DEFAULT 0,
  `min_purchase_qty` int(11) NOT NULL DEFAULT 1,
  `max_purchase_qty` int(11) NOT NULL DEFAULT 1,
  `has_variation` tinyint(4) NOT NULL DEFAULT 1,
  `has_warranty` tinyint(4) NOT NULL DEFAULT 1,
  `total_sale_count` double NOT NULL DEFAULT 0,
  `standard_delivery_hours` int(11) NOT NULL DEFAULT 24,
  `express_delivery_hours` int(11) NOT NULL DEFAULT 24,
  `size_guide` text DEFAULT NULL,
  `meta_title` mediumtext DEFAULT NULL,
  `meta_description` longtext DEFAULT NULL,
  `meta_img` varchar(255) DEFAULT NULL,
  `reward_points` bigint(20) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `shop_id`, `added_by`, `name`, `slug`, `brand_id`, `unit_id`, `thumbnail_image`, `gallery_images`, `product_tags`, `short_description`, `description`, `min_price`, `max_price`, `discount_value`, `discount_type`, `discount_start_date`, `discount_end_date`, `sell_target`, `stock_qty`, `is_published`, `is_featured`, `min_purchase_qty`, `max_purchase_qty`, `has_variation`, `has_warranty`, `total_sale_count`, `standard_delivery_hours`, `express_delivery_hours`, `size_guide`, `meta_title`, `meta_description`, `meta_img`, `reward_points`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'admin', 'Rustic Wildflower Bouquet', 'rustic-wildflower-bouquet', NULL, NULL, '26', '26', NULL, 'A charming bouquet filled with the beauty of wildflowers', '<p>The <b>Rustic Wildflower Bouquet</b> captures the untamed beauty of nature in a delightful arrangement. Featuring an array of wildflowers such as daisies, sunflowers, and cornflowers, this bouquet exudes a rustic charm and a whimsical appeal. Whether you want to brighten up your home or surprise someone with a heartfelt gift, the Rustic Wildflower Bouquet is a perfect choice for nature lovers and those who appreciate the beauty of simplicity.<br></p>', 60, 60, 20, 'flat', 1686096000, 1689552000, 75, 15, 1, 0, 1, 1, 0, 1, 0, 72, 24, NULL, NULL, NULL, NULL, 0, '2023-06-07 13:43:35', '2023-06-07 17:10:09', NULL),
(2, 1, 'admin', 'Exotic Orchid Bouquet', 'exotic-orchid-bouquet', NULL, NULL, '56', '56', NULL, 'An enchanting bouquet featuring exotic orchids', 'Indulge in the mesmerizing beauty of the <b>Exotic Orchid Bouquet</b>. Each stem of these exquisite orchids showcases unique shapes, vibrant colors, and delicate patterns. From the elegant Phalaenopsis to the exotic Cymbidium, this bouquet is a true feast for the eyes. Perfect for adding a touch of elegance to any space or sending a gift of sophistication, the Exotic Orchid Bouquet is a symbol of luxury and refinement.<br>', 0.8, 0.8, 25, 'percent', NULL, NULL, 17, 30, 1, 0, 1, 1, 0, 1, 0, 72, 24, NULL, NULL, NULL, NULL, 0, '2023-06-07 13:46:57', '2023-06-14 18:19:52', NULL),
(3, 1, 'admin', 'Spring Blossom Bouquet', 'spring-blossom-bouquet', NULL, NULL, '24', '24', NULL, 'A vibrant bouquet bursting with the colors of spring', 'The <b>Spring Blossom Bouquet</b> captures the essence of the season with its vibrant mix of blossoms. Delicate tulips, cheerful daisies, and fragrant lilies come together in a symphony of colors to create a truly captivating arrangement. Whether you\'re celebrating a birthday, sending get well wishes, or expressing your love, this bouquet is sure to bring joy and beauty to any occasion<br>', 40, 40, 20, 'percent', NULL, NULL, 20, 22, 1, 0, 1, 1, 0, 1, 0, 72, 24, NULL, NULL, NULL, NULL, 0, '2023-06-07 13:57:05', '2023-06-07 17:01:27', NULL),
(4, 1, 'admin', 'Rose Garden Bouquet', 'rose-garden', NULL, NULL, '23', '23', NULL, 'Elegant bouquet featuring a variety of colorful roses.\r\nThe Rose Garden Bouquet is a stunning arrangement of vibrant roses in different shades. Perfect for expressing love, admiration, or celebration', 'The Rose Garden Bouquet is a stunning arrangement of vibrant roses in different shades. Perfect for expressing love, admiration, or celebration<br>', 50, 50, 60, 'percent', NULL, NULL, 75, 11, 1, 0, 1, 1, 0, 1, 0, 72, 24, NULL, NULL, NULL, NULL, 0, '2023-06-07 15:23:00', '2023-06-07 16:53:22', NULL),
(5, 1, 'admin', 'Classic Rose Bouquet', 'classic-rose-bouquet-nl7hv', NULL, NULL, '27', '27', NULL, 'classic-rose-bouquet', '<p>The <b>Classic Rose Bouquet</b> is a symbol of timeless beauty and romance. This exquisite bouquet features a collection of premium long-stemmed roses in a variety of colors, carefully arranged to create a stunning display. Whether it\'s for a special occasion, a heartfelt gesture, or simply to express your love and admiration, the Classic Rose Bouquet is a perfect choice that will leave a lasting impression.<br></p>', 40, 40, 10, 'percent', 1686096000, 1689811200, 45, 49, 1, 0, 1, 1, 0, 1, 0, 72, 24, NULL, NULL, NULL, NULL, 0, '2023-06-07 17:16:24', '2023-06-07 17:16:24', NULL),
(6, 1, 'admin', 'Whimsical Garden Bouquet', 'whimsical-garden-bouquet-tvdur', NULL, NULL, '28', '28', NULL, 'A whimsical and enchanting bouquet inspired by a garden', 'Step into a world of enchantment with the<b> Whimsical Garden Bouquet</b>. This delightful arrangement captures the beauty and charm of a blooming garden, featuring an assortment of colorful and fragrant flowers such as daffodils, hydrangeas, and snapdragons. With its playful and whimsical design, this bouquet is perfect for adding a touch of magic to any occasion or as a gift to bring joy and smiles<br>', 50, 50, 13, 'flat', NULL, NULL, 100, 123, 1, 0, 1, 1, 0, 1, 0, 72, 24, NULL, NULL, NULL, NULL, 0, '2023-06-07 17:20:07', '2023-06-07 17:20:07', NULL),
(7, 1, 'admin', 'Elegant Calla Lily Bouquet', 'elegant-calla-lily-bouquet-s4ijk', NULL, NULL, '29', '29', NULL, 'An elegant bouquet showcasing the sophistication of calla lilies', '<p>The <b>Elegant Calla Lily Bouquet</b> exudes sophistication and grace with its sleek and sculptural calla lilies. These exquisite flowers are known for their elegance and symbolism of purity and beauty. Whether it\'s a wedding, anniversary, or any special celebration, this bouquet is a perfect choice for those seeking a touch of refinement and timeless elegance<br></p>', 40, 40, 23, 'flat', 1686096000, 1689206400, 13, 29, 1, 0, 1, 1, 0, 1, 1, 72, 24, NULL, NULL, NULL, NULL, 0, '2023-06-07 17:26:59', '2023-06-14 14:42:24', NULL),
(8, 1, 'admin', 'Vibrant Spring Blossoms Bouquet', 'vibrant-spring-blossoms-bouquet-fblb8', NULL, NULL, '30', '30', NULL, 'A lively bouquet bursting with the colors of spring.', '<p>Celebrate the arrival of spring with the Vibrant<b> Spring Blossoms Bouquet</b>. This cheerful arrangement features a mix of vibrant flowers including tulips, daffodils, and hyacinths, creating a burst of color and freshness. Perfect for brightening up any space or sending warm wishes to loved ones, this bouquet captures the essence of the season and brings a sense of joy and renewal.<br></p>', 30, 30, 0, 'flat', 1686873600, 1689206400, 12, 12, 1, 0, 1, 1, 0, 1, 0, 72, 24, NULL, NULL, NULL, NULL, 0, '2023-06-07 17:30:18', '2023-06-07 17:30:18', NULL),
(9, 1, 'admin', 'Exotic Tropical Paradise Bouquet', 'exotic-tropical-paradise-bouquet-huxqd', NULL, NULL, '31', '31', NULL, 'Transport yourself to a tropical paradise with this exotic bouquet', '<p>Escape to a world of tropical beauty with the <b>Exotic </b>Tropical Paradise Bouquet. This stunning arrangement showcases a mix of exotic flowers and foliage, such as orchids, bird of paradise, and palm leaves, creating a captivating display reminiscent of a lush tropical oasis. Whether it\'s for a special event, a tropical-themed party, or to add a touch of exotic flair to your home, this bouquet will transport you to paradise<br></p>', 70, 70, 23, 'flat', 1686096000, 1690416000, 3, 44, 1, 0, 1, 1, 0, 1, 1, 72, 24, NULL, NULL, NULL, NULL, 0, '2023-06-07 17:36:38', '2023-06-14 16:13:09', NULL),
(10, 1, 'admin', 'Rustic Wildflower Bouquet', 'rustic-wildflower-bouquet-13htb', NULL, NULL, '32', '32', NULL, 'Embrace the charm of the countryside with this rustic wildflower bouquet.', 'Embodying the natural beauty of wildflowers, the Rustic Wildflower Bouquet captures the essence of a picturesque countryside meadow. This whimsical arrangement features an assortment of charming blooms, including daisies, sunflowers, and cornflowers, with touches of natural elements like wheat stems and twine. Perfect for rustic weddings, farmhouse-inspired decor, or to bring a touch of rustic charm to any setting, this bouquet exudes a rustic and carefree elegance<br>', 35, 35, 10, 'percent', 1686096000, 1690761600, 13, 123, 1, 0, 1, 1, 0, 1, 0, 72, 24, NULL, NULL, NULL, NULL, 0, '2023-06-07 17:39:00', '2023-06-07 17:39:00', NULL),
(11, 1, 'admin', 'Classic Red Rose Bouquet', 'classic-red-rose-bouquet-vh2m0', NULL, NULL, '33', '33', NULL, 'Timeless elegance and romance with a dozen red roses', '<p>Express your love and affection with the <b>Classic Red Rose Bouquet.</b> This timeless arrangement features a dozen premium red roses carefully handcrafted to perfection. With their deep red hues and velvety petals, these roses symbolize love, passion, and romance. Whether it\'s for a special anniversary, Valentine\'s Day, or to surprise someone special, this bouquet is sure to make a lasting impression<br></p>', 65, 65, 0, 'percent', 1686096000, 1690761600, 20, 23, 1, 0, 1, 1, 0, 1, 0, 72, 24, NULL, NULL, NULL, NULL, 0, '2023-06-07 17:42:59', '2023-06-07 17:42:59', NULL),
(12, 1, 'admin', 'Fragrant Lavender Garden Bouquet', 'fragrant-lavender-garden-bouquet-hhvyv', NULL, NULL, '34', '34', NULL, 'A soothing bouquet that captivates with its calming lavender scent.', '<p>Immerse yourself in the tranquil beauty of the <b>Fragrant Lavender Garden Bouquet</b>. This enchanting arrangement showcases a variety of lavender-hued blooms, such as lavender roses, lisianthus, and statice, complemented by delicate foliage. The soothing scent of lavender permeates the air, creating a sense of relaxation and serenity. Perfect for aromatherapy, spa-like ambiance, or as a thoughtful gift for someone in need of calm and peace<br></p>', 44, 44, 70, 'percent', 1686096000, 1690761600, 19, 23, 1, 0, 1, 1, 0, 1, 0, 72, 24, NULL, NULL, NULL, NULL, 0, '2023-06-07 17:45:56', '2023-06-07 17:45:56', NULL),
(13, 1, 'admin', 'Enchanted Garden Bouquet', 'enchanted-garden-bouquet-bjnup', NULL, NULL, '35', '35', NULL, 'Step into a magical world with this enchanting garden-inspired bouquet', '<p>Immerse yourself in the whimsical beauty of the<b> Enchanted Garden Bouquet</b>. This captivating arrangement features a variety of vibrant blooms, including roses, daisies, and delphiniums, nestled among lush greenery. The combination of colors and textures creates a captivating display reminiscent of a secret garden. Whether it\'s to brighten someone\'s day or add a touch of magic to your space, this bouquet is sure to evoke joy and wonder<br></p>', 80, 80, 55, 'percent', 1686009600, 1690588800, 14, 20, 1, 0, 1, 1, 0, 1, 0, 72, 24, NULL, NULL, NULL, NULL, 0, '2023-06-07 18:08:18', '2023-06-07 18:08:18', NULL),
(14, 1, 'admin', 'Rustic Wildflower Bouquet', 'rustic-wildflower-bouquet-dcbc3', NULL, NULL, '36', '36', NULL, 'Embrace the beauty of nature with this charming rustic wildflower bouquet.', '<p>Experience the rustic charm of the countryside with the<b> Rustic Wildflower Bouquet.</b> This delightful arrangement showcases an assortment of colorful wildflowers, such as sunflowers, daisies, and asters, accented with natural twine and burlap wrapping. The bouquet exudes a natural and unrefined beauty, perfect for adding a touch of countryside elegance to any occasion or space.<br></p>', 45, 45, 30, 'percent', 1686096000, 1690502400, 12, 39, 1, 0, 1, 1, 0, 1, 3, 72, 24, NULL, NULL, NULL, NULL, 0, '2023-06-07 18:11:04', '2023-06-14 12:00:04', NULL),
(15, 1, 'admin', 'Sunlit Serenade', 'sunlit-serenade-7jsd1', NULL, NULL, '53', '53', NULL, 'A vibrant burst of sunflowers and daisies, radiating warmth and joy', '<p>Bask in the beauty of our \"<b>Sunlit Serenade</b>\" bouquet, a radiant symphony of sunflowers and daisies that captures the essence of a sunny day. This lively arrangement is bursting with vibrant hues and cheerful energy, instantly brightening any space.&nbsp; The bold and cheerful sunflowers are the stars of this bouquet, symbolizing happiness and positivity. Paired with the charming innocence of daisies, this arrangement is a delightful gift to lift spirits and bring a smile to anyone\'s face.&nbsp; Whether it\'s to celebrate a milestone or to spread some much-needed cheer, the \"Sunlit Serenade\" bouquet is a perfect choice. Embrace the warmth and joy it brings and let it serenade your loved ones with happiness.<br></p>', 40, 40, 0, 'percent', 1686700800, 1689897600, 123, 123, 1, 0, 1, 1, 0, 1, 0, 72, 24, NULL, NULL, NULL, NULL, 0, '2023-06-14 18:09:31', '2023-06-14 18:09:31', NULL),
(16, 1, 'admin', 'Whispering Winds', 'whispering-winds-bxzdx', NULL, NULL, '54', '54', NULL, 'An ethereal mix of tulips and irises, evoking a sense of tranquility and serenity', '<p>Immerse yourself in the tranquility of our \"<b>Whispering Winds</b>\" bouquet, a mesmerizing fusion of tulips and irises that exudes elegance and serenity. Delicate and captivating, this arrangement transports you to a serene garden with its soft and soothing colors.<br><br>The graceful tulips, with their slender stems and vibrant petals, represent perfect love and elegance. Complementing them are the irises, known for their exquisite beauty and symbolism of hope and wisdom.<br><br>Whether it\'s to express sympathy, offer comfort, or simply create a serene atmosphere, the \"Whispering Winds\" bouquet is a poignant choice. Let its gentle whispers of beauty and tranquility soothe the soul and convey your heartfelt sentiments.<br></p>', 12, 12, 0, 'percent', NULL, NULL, NULL, 134, 1, 0, 1, 1, 0, 1, 0, 72, 24, NULL, NULL, NULL, NULL, 0, '2023-06-14 18:13:11', '2023-06-14 18:13:11', NULL),
(17, 1, 'admin', 'Garden Romance', 'garden-romance-cf7rc', NULL, NULL, '57', '57', NULL, 'A dreamy arrangement of pastel roses and fragrant lavender, evoking a sense of romance and tranquility', '<p>Immerse yourself in the enchanting ambiance of our \"<b>Garden Romance</b>\" bouquet. This delightful arrangement combines the softness of pastel roses with the delicate allure of fragrant lavender, creating a captivating display of love and serenity.<br><br>Each rose is carefully selected for its beauty and elegance, symbolizing affection and admiration. The aromatic lavender adds a touch of relaxation and tranquility to the bouquet, making it perfect for expressing your deepest emotions.<br><br>Whether it\'s to celebrate an anniversary, surprise a special someone, or simply convey your heartfelt feelings, the \"Garden Romance\" bouquet is a charming choice. Let the beauty of these flowers ignite sparks of love and create lasting memories.<br></p>', 50, 50, 0, 'percent', NULL, NULL, NULL, 54, 1, 0, 1, 1, 0, 1, 0, 72, 24, NULL, NULL, NULL, NULL, 0, '2023-06-14 18:36:24', '2023-06-14 18:36:24', NULL),
(18, 1, 'admin', 'Exotic Paradise', 'exotic-paradise-oomo2', NULL, NULL, '58', '58', NULL, 'A striking composition of tropical orchids and vibrant bird of paradise flowers, exuding exotic beauty and allure.', '<p>Embark on a journey to an \"<b>Exotic Paradise</b>\" with this captivating bouquet. The vibrant hues and intricate shapes of tropical orchids and bird of paradise flowers combine to create a stunning display of exotic beauty and allure.<br><br>The elegant orchids, with their delicate petals and graceful presence, symbolize luxury and refinement. Paired with the bold and majestic bird of paradise flowers, this arrangement becomes a captivating representation of strength and beauty.<br><br>Whether it\'s to add a touch of the tropics to your space, surprise a nature enthusiast, or make a statement at a special event, the \"Exotic Paradise\" bouquet is an exceptional choice. Let the vibrant colors and unique shapes of these flowers transport you to a world of tropical splendor.<br></p>', 13.5, 13.5, 19.997, 'percent', 1686700800, 1689206400, NULL, 254, 1, 0, 1, 1, 0, 1, 0, 72, 24, NULL, NULL, NULL, NULL, 0, '2023-06-14 18:38:27', '2023-06-14 18:38:27', NULL),
(19, 1, 'admin', 'Pure Bliss', 'pure-bliss-fcumu', NULL, NULL, '59', '59', NULL, 'A blissful combination of white lilies and baby\'s breath, radiating purity and serenity', '<p>Experience a moment of pure bliss with our exquisite \"<b>Pure Bliss</b>\" bouquet. This enchanting arrangement showcases the timeless beauty of white lilies, accented by delicate sprigs of baby\'s breath, creating a serene and elegant display.<br><br>The pristine white lilies symbolize purity, innocence, and the renewal of the spirit. The baby\'s breath adds a touch of ethereal beauty and a delicate fragrance, enhancing the overall sense of tranquility.<br><br>Perfect for weddings, celebrations of new beginnings, or as a heartfelt gift to someone special, the \"Pure Bliss\" bouquet is a graceful choice. Let the purity and serenity of these flowers bring a sense of calm and joy to your surroundings.<br></p>', 90, 90, 0, 'percent', NULL, NULL, NULL, 43, 1, 0, 1, 1, 0, 1, 0, 72, 24, NULL, NULL, NULL, NULL, 0, '2023-06-14 18:40:33', '2023-06-14 18:40:33', NULL),
(20, 1, 'admin', 'Radiant Sunshine', 'radiant-sunshine-u46ss', NULL, NULL, '60', '60', NULL, 'A cheerful bouquet of sunflowers and gerbera daisies, spreading warmth and happiness', '<p>Bask in the radiant glow of our \"<b>Radiant Sunshine</b>\" bouquet. This cheerful arrangement features vibrant sunflowers and lively gerbera daisies, evoking the warmth and brightness of a sunny day.<br><br>The sunflowers, with their large golden petals and captivating presence, symbolize happiness, loyalty, and longevity. Paired with the vibrant hues of the gerbera daisies, this bouquet becomes a delightful burst of joy and positivity.<br><br>Whether it\'s to celebrate a milestone, send well wishes, or simply bring a smile to someone\'s face, the \"Radiant Sunshine\" bouquet is a perfect choice. Let the vibrant colors and uplifting energy of these flowers brighten the day and spread happiness.<br></p>', 70, 70, 0, 'percent', NULL, NULL, NULL, 782, 1, 0, 1, 1, 0, 1, 0, 72, 24, NULL, NULL, NULL, NULL, 0, '2023-06-14 18:44:54', '2023-06-14 18:44:54', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_categories`
--

CREATE TABLE `product_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_categories`
--

INSERT INTO `product_categories` (`id`, `product_id`, `category_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(5, 4, 4, NULL, NULL, NULL),
(6, 4, 9, NULL, NULL, NULL),
(7, 3, 4, NULL, NULL, NULL),
(8, 3, 6, NULL, NULL, NULL),
(9, 2, 7, NULL, NULL, NULL),
(10, 2, 9, NULL, NULL, NULL),
(11, 2, 10, NULL, NULL, NULL),
(12, 1, 3, NULL, NULL, NULL),
(13, 1, 4, NULL, NULL, NULL),
(14, 1, 5, NULL, NULL, NULL),
(15, 1, 11, NULL, NULL, NULL),
(16, 5, 2, NULL, NULL, NULL),
(17, 5, 3, NULL, NULL, NULL),
(18, 5, 5, NULL, NULL, NULL),
(19, 5, 7, NULL, NULL, NULL),
(20, 5, 11, NULL, NULL, NULL),
(21, 6, 2, NULL, NULL, NULL),
(22, 6, 7, NULL, NULL, NULL),
(23, 6, 8, NULL, NULL, NULL),
(24, 6, 10, NULL, NULL, NULL),
(25, 6, 11, NULL, NULL, NULL),
(26, 7, 2, NULL, NULL, NULL),
(27, 7, 3, NULL, NULL, NULL),
(28, 7, 5, NULL, NULL, NULL),
(29, 7, 6, NULL, NULL, NULL),
(30, 7, 12, NULL, NULL, NULL),
(31, 8, 2, NULL, NULL, NULL),
(32, 8, 6, NULL, NULL, NULL),
(33, 8, 9, NULL, NULL, NULL),
(34, 8, 10, NULL, NULL, NULL),
(35, 9, 2, NULL, NULL, NULL),
(36, 9, 6, NULL, NULL, NULL),
(37, 9, 8, NULL, NULL, NULL),
(38, 9, 9, NULL, NULL, NULL),
(39, 9, 11, NULL, NULL, NULL),
(40, 9, 12, NULL, NULL, NULL),
(41, 10, 3, NULL, NULL, NULL),
(42, 10, 4, NULL, NULL, NULL),
(43, 10, 9, NULL, NULL, NULL),
(44, 10, 12, NULL, NULL, NULL),
(45, 11, 3, NULL, NULL, NULL),
(46, 11, 4, NULL, NULL, NULL),
(47, 11, 8, NULL, NULL, NULL),
(48, 11, 10, NULL, NULL, NULL),
(49, 11, 11, NULL, NULL, NULL),
(50, 12, 2, NULL, NULL, NULL),
(51, 12, 3, NULL, NULL, NULL),
(52, 12, 9, NULL, NULL, NULL),
(53, 12, 10, NULL, NULL, NULL),
(54, 13, 3, NULL, NULL, NULL),
(55, 13, 5, NULL, NULL, NULL),
(56, 13, 6, NULL, NULL, NULL),
(57, 13, 7, NULL, NULL, NULL),
(58, 13, 9, NULL, NULL, NULL),
(59, 13, 10, NULL, NULL, NULL),
(60, 14, 2, NULL, NULL, NULL),
(61, 14, 5, NULL, NULL, NULL),
(62, 14, 6, NULL, NULL, NULL),
(63, 14, 9, NULL, NULL, NULL),
(64, 14, 10, NULL, NULL, NULL),
(65, 14, 11, NULL, NULL, NULL),
(66, 15, 3, NULL, NULL, NULL),
(67, 15, 6, NULL, NULL, NULL),
(68, 15, 9, NULL, NULL, NULL),
(69, 15, 10, NULL, NULL, NULL),
(70, 15, 12, NULL, NULL, NULL),
(71, 16, 2, NULL, NULL, NULL),
(72, 16, 4, NULL, NULL, NULL),
(73, 16, 5, NULL, NULL, NULL),
(74, 16, 7, NULL, NULL, NULL),
(75, 16, 10, NULL, NULL, NULL),
(76, 2, 4, NULL, NULL, NULL),
(77, 2, 5, NULL, NULL, NULL),
(78, 17, 2, NULL, NULL, NULL),
(79, 17, 3, NULL, NULL, NULL),
(80, 17, 4, NULL, NULL, NULL),
(81, 17, 6, NULL, NULL, NULL),
(82, 17, 10, NULL, NULL, NULL),
(83, 17, 11, NULL, NULL, NULL),
(84, 18, 4, NULL, NULL, NULL),
(85, 18, 5, NULL, NULL, NULL),
(86, 18, 6, NULL, NULL, NULL),
(87, 18, 9, NULL, NULL, NULL),
(88, 18, 11, NULL, NULL, NULL),
(89, 18, 12, NULL, NULL, NULL),
(90, 19, 2, NULL, NULL, NULL),
(91, 19, 3, NULL, NULL, NULL),
(92, 19, 4, NULL, NULL, NULL),
(93, 19, 11, NULL, NULL, NULL),
(94, 19, 12, NULL, NULL, NULL),
(95, 20, 3, NULL, NULL, NULL),
(96, 20, 4, NULL, NULL, NULL),
(97, 20, 5, NULL, NULL, NULL),
(98, 20, 6, NULL, NULL, NULL),
(99, 20, 9, NULL, NULL, NULL),
(100, 20, 12, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_colors`
--

CREATE TABLE `product_colors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `variation_value_id` int(11) NOT NULL,
  `image` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_localizations`
--

CREATE TABLE `product_localizations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `short_description` text DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `lang_key` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_localizations`
--

INSERT INTO `product_localizations` (`id`, `product_id`, `name`, `short_description`, `description`, `lang_key`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Rustic Wildflower Bouquet', 'A charming bouquet filled with the beauty of wildflowers', '<p>The <b>Rustic Wildflower Bouquet</b> captures the untamed beauty of nature in a delightful arrangement. Featuring an array of wildflowers such as daisies, sunflowers, and cornflowers, this bouquet exudes a rustic charm and a whimsical appeal. Whether you want to brighten up your home or surprise someone with a heartfelt gift, the Rustic Wildflower Bouquet is a perfect choice for nature lovers and those who appreciate the beauty of simplicity.<br></p>', 'en', '2023-06-07 13:43:35', '2023-06-07 17:08:46', NULL),
(2, 2, 'Exotic Orchid Bouquet', 'An enchanting bouquet featuring exotic orchids', 'Indulge in the mesmerizing beauty of the <b>Exotic Orchid Bouquet</b>. Each stem of these exquisite orchids showcases unique shapes, vibrant colors, and delicate patterns. From the elegant Phalaenopsis to the exotic Cymbidium, this bouquet is a true feast for the eyes. Perfect for adding a touch of elegance to any space or sending a gift of sophistication, the Exotic Orchid Bouquet is a symbol of luxury and refinement.<br>', 'en', '2023-06-07 13:46:57', '2023-06-07 17:05:40', NULL),
(3, 3, 'Spring Blossom Bouquet', 'A vibrant bouquet bursting with the colors of spring', 'The <b>Spring Blossom Bouquet</b> captures the essence of the season with its vibrant mix of blossoms. Delicate tulips, cheerful daisies, and fragrant lilies come together in a symphony of colors to create a truly captivating arrangement. Whether you\'re celebrating a birthday, sending get well wishes, or expressing your love, this bouquet is sure to bring joy and beauty to any occasion<br>', 'en', '2023-06-07 13:57:05', '2023-06-07 17:01:27', NULL),
(4, 4, 'Rose Garden Bouquet', 'Elegant bouquet featuring a variety of colorful roses.\r\nThe Rose Garden Bouquet is a stunning arrangement of vibrant roses in different shades. Perfect for expressing love, admiration, or celebration', 'The Rose Garden Bouquet is a stunning arrangement of vibrant roses in different shades. Perfect for expressing love, admiration, or celebration<br>', 'en', '2023-06-07 15:23:01', '2023-06-07 16:51:51', NULL),
(5, 5, 'Classic Rose Bouquet', NULL, '<p>The <b>Classic Rose Bouquet</b> is a symbol of timeless beauty and romance. This exquisite bouquet features a collection of premium long-stemmed roses in a variety of colors, carefully arranged to create a stunning display. Whether it\'s for a special occasion, a heartfelt gesture, or simply to express your love and admiration, the Classic Rose Bouquet is a perfect choice that will leave a lasting impression.<br></p>', 'en', '2023-06-07 17:16:24', '2023-06-07 17:16:24', NULL),
(6, 6, 'Whimsical Garden Bouquet', NULL, 'Step into a world of enchantment with the<b> Whimsical Garden Bouquet</b>. This delightful arrangement captures the beauty and charm of a blooming garden, featuring an assortment of colorful and fragrant flowers such as daffodils, hydrangeas, and snapdragons. With its playful and whimsical design, this bouquet is perfect for adding a touch of magic to any occasion or as a gift to bring joy and smiles<br>', 'en', '2023-06-07 17:20:07', '2023-06-07 17:20:07', NULL),
(7, 7, 'Elegant Calla Lily Bouquet', NULL, '<p>The <b>Elegant Calla Lily Bouquet</b> exudes sophistication and grace with its sleek and sculptural calla lilies. These exquisite flowers are known for their elegance and symbolism of purity and beauty. Whether it\'s a wedding, anniversary, or any special celebration, this bouquet is a perfect choice for those seeking a touch of refinement and timeless elegance<br></p>', 'en', '2023-06-07 17:26:59', '2023-06-07 17:26:59', NULL),
(8, 8, 'Vibrant Spring Blossoms Bouquet', NULL, '<p>Celebrate the arrival of spring with the Vibrant<b> Spring Blossoms Bouquet</b>. This cheerful arrangement features a mix of vibrant flowers including tulips, daffodils, and hyacinths, creating a burst of color and freshness. Perfect for brightening up any space or sending warm wishes to loved ones, this bouquet captures the essence of the season and brings a sense of joy and renewal.<br></p>', 'en', '2023-06-07 17:30:18', '2023-06-07 17:30:18', NULL),
(9, 9, 'Exotic Tropical Paradise Bouquet', NULL, '<p>Escape to a world of tropical beauty with the <b>Exotic </b>Tropical Paradise Bouquet. This stunning arrangement showcases a mix of exotic flowers and foliage, such as orchids, bird of paradise, and palm leaves, creating a captivating display reminiscent of a lush tropical oasis. Whether it\'s for a special event, a tropical-themed party, or to add a touch of exotic flair to your home, this bouquet will transport you to paradise<br></p>', 'en', '2023-06-07 17:36:38', '2023-06-07 17:36:38', NULL),
(10, 10, 'Rustic Wildflower Bouquet', NULL, 'Embodying the natural beauty of wildflowers, the Rustic Wildflower Bouquet captures the essence of a picturesque countryside meadow. This whimsical arrangement features an assortment of charming blooms, including daisies, sunflowers, and cornflowers, with touches of natural elements like wheat stems and twine. Perfect for rustic weddings, farmhouse-inspired decor, or to bring a touch of rustic charm to any setting, this bouquet exudes a rustic and carefree elegance<br>', 'en', '2023-06-07 17:39:00', '2023-06-07 17:39:00', NULL),
(11, 11, 'Classic Red Rose Bouquet', NULL, '<p>Express your love and affection with the <b>Classic Red Rose Bouquet.</b> This timeless arrangement features a dozen premium red roses carefully handcrafted to perfection. With their deep red hues and velvety petals, these roses symbolize love, passion, and romance. Whether it\'s for a special anniversary, Valentine\'s Day, or to surprise someone special, this bouquet is sure to make a lasting impression<br></p>', 'en', '2023-06-07 17:42:59', '2023-06-07 17:42:59', NULL),
(12, 12, 'Fragrant Lavender Garden Bouquet', NULL, '<p>Immerse yourself in the tranquil beauty of the <b>Fragrant Lavender Garden Bouquet</b>. This enchanting arrangement showcases a variety of lavender-hued blooms, such as lavender roses, lisianthus, and statice, complemented by delicate foliage. The soothing scent of lavender permeates the air, creating a sense of relaxation and serenity. Perfect for aromatherapy, spa-like ambiance, or as a thoughtful gift for someone in need of calm and peace<br></p>', 'en', '2023-06-07 17:45:56', '2023-06-07 17:45:56', NULL),
(13, 13, 'Enchanted Garden Bouquet', NULL, '<p>Immerse yourself in the whimsical beauty of the<b> Enchanted Garden Bouquet</b>. This captivating arrangement features a variety of vibrant blooms, including roses, daisies, and delphiniums, nestled among lush greenery. The combination of colors and textures creates a captivating display reminiscent of a secret garden. Whether it\'s to brighten someone\'s day or add a touch of magic to your space, this bouquet is sure to evoke joy and wonder<br></p>', 'en', '2023-06-07 18:08:18', '2023-06-07 18:08:18', NULL),
(14, 14, 'Rustic Wildflower Bouquet', NULL, '<p>Experience the rustic charm of the countryside with the<b> Rustic Wildflower Bouquet.</b> This delightful arrangement showcases an assortment of colorful wildflowers, such as sunflowers, daisies, and asters, accented with natural twine and burlap wrapping. The bouquet exudes a natural and unrefined beauty, perfect for adding a touch of countryside elegance to any occasion or space.<br></p>', 'en', '2023-06-07 18:11:04', '2023-06-07 18:11:04', NULL),
(15, 15, 'Sunlit Serenade', NULL, '<p>Bask in the beauty of our \"<b>Sunlit Serenade</b>\" bouquet, a radiant symphony of sunflowers and daisies that captures the essence of a sunny day. This lively arrangement is bursting with vibrant hues and cheerful energy, instantly brightening any space.&nbsp; The bold and cheerful sunflowers are the stars of this bouquet, symbolizing happiness and positivity. Paired with the charming innocence of daisies, this arrangement is a delightful gift to lift spirits and bring a smile to anyone\'s face.&nbsp; Whether it\'s to celebrate a milestone or to spread some much-needed cheer, the \"Sunlit Serenade\" bouquet is a perfect choice. Embrace the warmth and joy it brings and let it serenade your loved ones with happiness.<br></p>', 'en', '2023-06-14 18:09:31', '2023-06-14 18:09:31', NULL),
(16, 16, 'Whispering Winds', NULL, '<p>Immerse yourself in the tranquility of our \"<b>Whispering Winds</b>\" bouquet, a mesmerizing fusion of tulips and irises that exudes elegance and serenity. Delicate and captivating, this arrangement transports you to a serene garden with its soft and soothing colors.<br><br>The graceful tulips, with their slender stems and vibrant petals, represent perfect love and elegance. Complementing them are the irises, known for their exquisite beauty and symbolism of hope and wisdom.<br><br>Whether it\'s to express sympathy, offer comfort, or simply create a serene atmosphere, the \"Whispering Winds\" bouquet is a poignant choice. Let its gentle whispers of beauty and tranquility soothe the soul and convey your heartfelt sentiments.<br></p>', 'en', '2023-06-14 18:13:11', '2023-06-14 18:13:11', NULL),
(17, 17, 'Garden Romance', NULL, '<p>Immerse yourself in the enchanting ambiance of our \"<b>Garden Romance</b>\" bouquet. This delightful arrangement combines the softness of pastel roses with the delicate allure of fragrant lavender, creating a captivating display of love and serenity.<br><br>Each rose is carefully selected for its beauty and elegance, symbolizing affection and admiration. The aromatic lavender adds a touch of relaxation and tranquility to the bouquet, making it perfect for expressing your deepest emotions.<br><br>Whether it\'s to celebrate an anniversary, surprise a special someone, or simply convey your heartfelt feelings, the \"Garden Romance\" bouquet is a charming choice. Let the beauty of these flowers ignite sparks of love and create lasting memories.<br></p>', 'en', '2023-06-14 18:36:24', '2023-06-14 18:36:24', NULL),
(18, 18, 'Exotic Paradise', NULL, '<p>Embark on a journey to an \"<b>Exotic Paradise</b>\" with this captivating bouquet. The vibrant hues and intricate shapes of tropical orchids and bird of paradise flowers combine to create a stunning display of exotic beauty and allure.<br><br>The elegant orchids, with their delicate petals and graceful presence, symbolize luxury and refinement. Paired with the bold and majestic bird of paradise flowers, this arrangement becomes a captivating representation of strength and beauty.<br><br>Whether it\'s to add a touch of the tropics to your space, surprise a nature enthusiast, or make a statement at a special event, the \"Exotic Paradise\" bouquet is an exceptional choice. Let the vibrant colors and unique shapes of these flowers transport you to a world of tropical splendor.<br></p>', 'en', '2023-06-14 18:38:27', '2023-06-14 18:38:27', NULL),
(19, 19, 'Pure Bliss', NULL, '<p>Experience a moment of pure bliss with our exquisite \"<b>Pure Bliss</b>\" bouquet. This enchanting arrangement showcases the timeless beauty of white lilies, accented by delicate sprigs of baby\'s breath, creating a serene and elegant display.<br><br>The pristine white lilies symbolize purity, innocence, and the renewal of the spirit. The baby\'s breath adds a touch of ethereal beauty and a delicate fragrance, enhancing the overall sense of tranquility.<br><br>Perfect for weddings, celebrations of new beginnings, or as a heartfelt gift to someone special, the \"Pure Bliss\" bouquet is a graceful choice. Let the purity and serenity of these flowers bring a sense of calm and joy to your surroundings.<br></p>', 'en', '2023-06-14 18:40:33', '2023-06-14 18:40:33', NULL),
(20, 20, 'Radiant Sunshine', NULL, '<p>Bask in the radiant glow of our \"<b>Radiant Sunshine</b>\" bouquet. This cheerful arrangement features vibrant sunflowers and lively gerbera daisies, evoking the warmth and brightness of a sunny day.<br><br>The sunflowers, with their large golden petals and captivating presence, symbolize happiness, loyalty, and longevity. Paired with the vibrant hues of the gerbera daisies, this bouquet becomes a delightful burst of joy and positivity.<br><br>Whether it\'s to celebrate a milestone, send well wishes, or simply bring a smile to someone\'s face, the \"Radiant Sunshine\" bouquet is a perfect choice. Let the vibrant colors and uplifting energy of these flowers brighten the day and spread happiness.<br></p>', 'en', '2023-06-14 18:44:54', '2023-06-14 18:44:54', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_tags`
--

CREATE TABLE `product_tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_taxes`
--

CREATE TABLE `product_taxes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `tax_id` int(11) NOT NULL,
  `tax_value` double NOT NULL DEFAULT 0,
  `tax_type` varchar(255) NOT NULL DEFAULT 'amount' COMMENT 'flat / percent',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_variations`
--

CREATE TABLE `product_variations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `variation_key` varchar(255) DEFAULT NULL,
  `sku` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `price` double NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_variations`
--

INSERT INTO `product_variations` (`id`, `product_id`, `variation_key`, `sku`, `code`, `price`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, NULL, '123', '131', 60, '2023-06-07 13:43:35', '2023-06-07 17:10:09', NULL),
(2, 2, NULL, '276', '27893', 0.8, '2023-06-07 13:46:57', '2023-06-14 18:19:52', NULL),
(3, 3, NULL, '561', '87613', 40, '2023-06-07 13:57:05', '2023-06-07 17:01:27', NULL),
(4, 4, NULL, '5432', '5672', 50, '2023-06-07 15:23:01', '2023-06-07 15:44:55', NULL),
(5, 5, NULL, '78923', '78913', 40, '2023-06-07 17:16:24', '2023-06-07 17:16:24', NULL),
(6, 6, NULL, '233', '2376', 50, '2023-06-07 17:20:07', '2023-06-07 17:20:07', NULL),
(7, 7, NULL, '09248', '2078', 40, '2023-06-07 17:26:59', '2023-06-07 17:26:59', NULL),
(8, 8, NULL, '133', '424', 30, '2023-06-07 17:30:18', '2023-06-07 17:30:18', NULL),
(9, 9, NULL, '9768', '768', 70, '2023-06-07 17:36:38', '2023-06-07 17:36:38', NULL),
(10, 10, NULL, '76', '768', 35, '2023-06-07 17:39:00', '2023-06-07 17:39:00', NULL),
(11, 11, NULL, '09258', '0823', 65, '2023-06-07 17:42:59', '2023-06-07 17:42:59', NULL),
(12, 12, NULL, '354', '54', 44, '2023-06-07 17:45:56', '2023-06-07 17:45:56', NULL),
(13, 13, NULL, '085', '5535', 80, '2023-06-07 18:08:18', '2023-06-07 18:08:18', NULL),
(14, 14, NULL, '352', '142', 45, '2023-06-07 18:11:04', '2023-06-07 18:11:04', NULL),
(15, 15, NULL, '3532', '255', 40, '2023-06-14 18:09:31', '2023-06-14 18:09:31', NULL),
(16, 16, NULL, '1245', '1425', 12, '2023-06-14 18:13:11', '2023-06-14 18:13:11', NULL),
(17, 17, NULL, '13', '42', 50, '2023-06-14 18:36:24', '2023-06-14 18:36:24', NULL),
(18, 18, NULL, '352', '25141', 13.5, '2023-06-14 18:38:27', '2023-06-14 18:38:27', NULL),
(19, 19, NULL, '24', '245', 90, '2023-06-14 18:40:33', '2023-06-14 18:40:33', NULL),
(20, 20, NULL, '0928', '928', 70, '2023-06-14 18:44:54', '2023-06-14 18:44:54', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_variation_combinations`
--

CREATE TABLE `product_variation_combinations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_variation_id` int(11) NOT NULL,
  `variation_id` int(11) NOT NULL,
  `variation_value_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_variation_stocks`
--

CREATE TABLE `product_variation_stocks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_variation_id` int(11) NOT NULL,
  `location_id` int(11) DEFAULT NULL COMMENT 'warehouse/location',
  `stock_qty` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_variation_stocks`
--

INSERT INTO `product_variation_stocks` (`id`, `product_variation_id`, `location_id`, `stock_qty`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, 15, '2023-06-07 13:43:35', '2023-06-07 17:10:09', NULL),
(2, 2, 1, 30, '2023-06-07 13:46:57', '2023-06-07 17:05:40', NULL),
(3, 3, 1, 22, '2023-06-07 13:57:05', '2023-06-07 17:01:27', NULL),
(4, 4, 1, 11, '2023-06-07 15:23:01', '2023-06-07 15:44:55', NULL),
(5, 5, 1, 49, '2023-06-07 17:16:24', '2023-06-07 17:16:24', NULL),
(6, 6, 1, 123, '2023-06-07 17:20:07', '2023-06-07 17:20:07', NULL),
(7, 7, 1, 29, '2023-06-07 17:26:59', '2023-06-14 14:42:24', NULL),
(8, 8, 1, 12, '2023-06-07 17:30:18', '2023-06-07 17:30:18', NULL),
(9, 9, 1, 44, '2023-06-07 17:36:38', '2023-06-14 16:13:09', NULL),
(10, 10, 1, 123, '2023-06-07 17:39:00', '2023-06-07 17:39:00', NULL),
(11, 11, 1, 23, '2023-06-07 17:42:59', '2023-06-07 17:42:59', NULL),
(12, 12, 1, 23, '2023-06-07 17:45:56', '2023-06-07 17:45:56', NULL),
(13, 13, 1, 20, '2023-06-07 18:08:18', '2023-06-07 18:08:18', NULL),
(14, 14, 1, 39, '2023-06-07 18:11:04', '2023-06-14 12:00:04', NULL),
(15, 15, 1, 123, '2023-06-14 18:09:31', '2023-06-14 18:09:31', NULL),
(16, 16, 1, 134, '2023-06-14 18:13:11', '2023-06-14 18:13:11', NULL),
(17, 17, 1, 54, '2023-06-14 18:36:24', '2023-06-14 18:36:24', NULL),
(18, 18, 1, 254, '2023-06-14 18:38:27', '2023-06-14 18:38:27', NULL),
(19, 19, 1, 43, '2023-06-14 18:40:33', '2023-06-14 18:40:33', NULL),
(20, 20, 1, 782, '2023-06-14 18:44:54', '2023-06-14 18:44:54', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `refunds`
--

CREATE TABLE `refunds` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_group_id` int(11) NOT NULL,
  `order_item_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `order_payment_status` varchar(255) DEFAULT NULL,
  `refund_reason` longtext DEFAULT NULL,
  `refund_reject_reason` longtext DEFAULT NULL,
  `refund_status` varchar(255) NOT NULL DEFAULT 'pending' COMMENT 'refunded/rejected',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reward_points`
--

CREATE TABLE `reward_points` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_group_id` bigint(20) NOT NULL,
  `total_points` bigint(20) NOT NULL DEFAULT 0,
  `is_converted` tinyint(4) NOT NULL DEFAULT 0,
  `status` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', 'web', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `scheduled_delivery_time_lists`
--

CREATE TABLE `scheduled_delivery_time_lists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `timeline` text NOT NULL,
  `sorting_order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shops`
--

CREATE TABLE `shops` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `is_approved` tinyint(4) NOT NULL DEFAULT 0,
  `is_verified_by_admin` tinyint(4) NOT NULL DEFAULT 0,
  `is_published` tinyint(4) NOT NULL DEFAULT 0,
  `shop_logo` text DEFAULT NULL,
  `shop_name` varchar(255) NOT NULL,
  `slug` text NOT NULL,
  `shop_rating` double NOT NULL DEFAULT 0,
  `shop_address` longtext DEFAULT NULL,
  `min_order_amount` double NOT NULL DEFAULT 0,
  `admin_commission_percentage` double NOT NULL DEFAULT 0,
  `current_balance` double NOT NULL DEFAULT 0,
  `is_cash_payout` tinyint(4) NOT NULL DEFAULT 0,
  `is_bank_payout` tinyint(4) NOT NULL DEFAULT 0,
  `bank_name` varchar(255) DEFAULT NULL,
  `bank_acc_name` varchar(255) DEFAULT NULL,
  `bank_acc_no` varchar(255) DEFAULT NULL,
  `bank_routing_no` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shops`
--

INSERT INTO `shops` (`id`, `user_id`, `is_approved`, `is_verified_by_admin`, `is_published`, `shop_logo`, `shop_name`, `slug`, `shop_rating`, `shop_address`, `min_order_amount`, `admin_commission_percentage`, `current_balance`, `is_cash_payout`, `is_bank_payout`, `bank_name`, `bank_acc_name`, `bank_acc_no`, `bank_routing_no`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, 1, 1, NULL, 'Admin Shop', 'admin-shop', 5, NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE `states` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `country_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `states`
--

INSERT INTO `states` (`id`, `country_id`, `name`, `is_active`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Béni Mellal-Khénifra', 1, '2023-04-29 12:11:20', '2023-04-29 12:11:20', NULL),
(2, 1, 'Rabat-Salé-Kénitra', 1, '2023-04-29 12:11:20', '2023-04-29 12:11:20', NULL),
(3, 1, 'Fès-Meknès', 1, '2023-04-29 12:11:20', '2023-04-29 12:11:20', NULL),
(4, 1, 'Casablanca-Settat', 1, '2023-04-29 12:11:20', '2023-04-29 12:11:20', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subscribed_users`
--

CREATE TABLE `subscribed_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `system_settings`
--

CREATE TABLE `system_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `entity` varchar(255) NOT NULL,
  `value` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `system_settings`
--

INSERT INTO `system_settings` (`id`, `entity`, `value`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'google_login', '0', '2022-12-07 05:33:40', '2022-12-07 05:33:41', NULL),
(2, 'default_currency', 'Dirham', '2022-12-07 05:55:08', '2023-06-08 00:37:02', NULL),
(3, 'no_of_decimals', '2', '2022-12-07 05:55:08', '2022-12-07 05:55:08', NULL),
(4, 'truncate_price', '0', '2022-12-07 05:55:08', '2022-12-07 05:55:08', NULL),
(5, 'enable_multi_vendor', '0', '2022-12-25 05:00:08', '2023-02-18 07:56:54', NULL),
(6, 'default_admin_commission', '5', '2022-12-25 05:00:08', '2022-12-25 05:00:08', NULL),
(7, 'vendor_minimum_payout', '500', '2022-12-28 05:34:48', '2022-12-28 05:34:48', NULL),
(8, 'order_code_prefix', '#G-Store:', '2023-02-04 05:48:17', '2023-02-19 07:42:24', NULL),
(9, 'order_code_start', '1', '2023-02-04 05:48:17', '2023-02-04 05:51:38', NULL),
(10, 'system_title', 'Flowerly Store', '2023-02-05 05:48:44', '2023-06-14 16:09:12', NULL),
(11, 'title_separator', ':', '2023-02-05 05:48:44', '2023-02-05 05:48:44', NULL),
(12, 'site_address', 'FP , Mghila , Beni Mellal', '2023-02-05 05:49:15', '2023-06-14 16:09:12', NULL),
(13, 'registration_with', 'email_and_phone', '2023-02-18 08:10:22', '2023-06-08 00:16:21', NULL),
(14, 'registration_verification_with', 'phone', '2023-02-18 08:10:22', '2023-06-08 00:16:21', NULL),
(15, 'topbar_welcome_text', 'Welcome to Flowerly Shop', '2023-02-20 05:41:46', '2023-06-07 16:45:40', NULL),
(16, 'topbar_email', 'flowerly@gmail.com', '2023-02-20 05:41:46', '2023-06-07 16:45:40', NULL),
(17, 'topbar_location', 'Mghila ,Beni Mellal, Morroco', '2023-02-20 05:41:46', '2023-06-07 16:45:40', NULL),
(18, 'navbar_logo', '1', '2023-02-20 05:41:46', '2023-03-12 04:04:45', NULL),
(19, 'navbar_categories', '[\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"10\",\"11\",\"12\"]', '2023-02-20 05:41:46', '2023-06-07 16:45:40', NULL),
(20, 'navbar_pages', '[\"1\"]', '2023-02-20 05:41:47', '2023-03-01 08:32:34', NULL),
(21, 'navbar_contact_number', '+212612345678', '2023-02-20 05:41:47', '2023-06-07 16:45:40', NULL),
(22, 'hero_sliders', '[{\"id\":106549,\"sub_title\":\"Express Your Love with Flowers\",\"title\":\"Send Beautiful Bouquets for Every Occasion\",\"text\":\"From birthdays to anniversaries, our stunning bouquets are the perfect way to express your love and celebrate special moments. Explore our wide range of floral arrangements and make every occasion memorable\",\"image\":\"49\",\"link\":\"https:\\/\\/www.youtube.com\\/watch?v=mZ77D66ZYtw\"},{\"id\":489519,\"sub_title\":\"Blooming Beauties: Order Flowers Online with Ease!\",\"title\":\"Flower Power: Your One-Stop Shop for Fresh, Exquisite Blooms\",\"text\":\"Browse through our extensive collection of roses, lilies, tulips, daisies, and more. With our carefully curated assortment of flowers, you can create stunning bouquets and arrangements that will mesmerize and delight\",\"image\":\"50\",\"link\":null},{\"id\":935903,\"sub_title\":\"Flower Enchantment at Your Fingertips\",\"title\":\"Blossom Boutique: Unleash the Magic of Online Flower Shopping\",\"text\":\"Want to add a personal touch? Customize your bouquet with our selection of complementary accessories, such as elegant vases, heartfelt greeting cards, or delectable chocolates. Create a truly unique and memorable gift for your loved ones\",\"image\":\"51\",\"link\":null}]', '2023-02-20 10:36:00', '2023-06-14 17:59:23', NULL),
(24, 'top_category_ids', '[\"6\",\"5\",\"4\",\"3\",\"2\"]', '2023-02-25 08:29:10', '2023-02-25 08:29:10', NULL),
(25, 'featured_sub_title', 'Platform mindshare through effective infomediaries Dynamically implement.', '2023-02-25 09:18:46', '2023-02-25 09:18:46', NULL),
(26, 'featured_products_left', '[\"1\",\"2\",\"5\"]', '2023-02-25 09:18:46', '2023-02-26 03:38:23', NULL),
(27, 'featured_products_right', '[\"2\",\"3\",\"4\"]', '2023-02-25 09:18:46', '2023-02-25 11:53:03', NULL),
(28, 'featured_center_banner', '', '2023-02-25 09:18:46', '2023-02-25 10:01:42', NULL),
(29, 'featured_banner_link', 'http://enmart.work/products', '2023-02-25 09:23:47', '2023-02-25 09:23:47', NULL),
(30, 'trending_product_categories', '[\"5\",\"4\",\"3\"]', '2023-02-26 04:35:01', '2023-02-26 04:35:01', NULL),
(31, 'top_trending_products', '[\"1\",\"2\",\"3\",\"4\",\"5\"]', '2023-02-26 04:35:01', '2023-03-08 11:10:00', NULL),
(32, 'banner_section_one_banners', '[]', '2023-02-26 05:44:06', '2023-03-12 03:54:15', NULL),
(33, 'best_deal_end_date', '03/31/2023', '2023-02-26 08:38:19', '2023-02-26 08:44:19', NULL),
(34, 'weekly_best_deals', '[\"1\",\"2\",\"4\",\"5\"]', '2023-02-26 08:38:19', '2023-02-26 08:53:35', NULL),
(35, 'best_deal_banner', '', '2023-02-26 08:38:19', '2023-02-26 08:38:19', NULL),
(36, 'best_deal_banner_link', NULL, '2023-02-26 08:38:19', '2023-02-26 08:38:19', NULL),
(37, 'banner_section_two_banner_one_link', NULL, '2023-02-26 09:11:59', '2023-02-26 09:11:59', NULL),
(38, 'banner_section_two_banner_one', '49', '2023-02-26 09:11:59', '2023-02-26 09:11:59', NULL),
(39, 'banner_section_two_banner_two_link', NULL, '2023-02-26 09:11:59', '2023-02-26 09:11:59', NULL),
(40, 'banner_section_two_banner_two', '50', '2023-02-26 09:11:59', '2023-02-26 09:11:59', NULL),
(41, 'client_feedback', '[]', '2023-02-26 12:16:47', '2023-03-12 03:54:40', NULL),
(42, 'best_selling_products', '[\"1\",\"2\",\"3\"]', '2023-02-27 05:01:19', '2023-02-27 05:01:19', NULL),
(43, 'best_selling_banner', '', '2023-02-27 05:01:19', '2023-02-27 05:11:30', NULL),
(44, 'best_selling_banner_link', NULL, '2023-02-27 05:01:19', '2023-02-27 05:01:19', NULL),
(45, 'product_listing_categories', '[\"12\",\"11\",\"10\",\"9\",\"8\",\"7\",\"6\",\"5\",\"4\",\"3\",\"2\"]', '2023-02-27 05:47:35', '2023-06-07 16:49:05', NULL),
(46, 'footer_categories', '[\"12\",\"11\",\"10\",\"9\",\"8\",\"7\",\"6\",\"5\",\"4\",\"3\",\"2\"]', '2023-03-01 03:33:33', '2023-06-07 16:47:12', NULL),
(47, 'quick_links', '[\"1\"]', '2023-03-01 03:33:33', '2023-06-07 16:48:14', NULL),
(48, 'footer_logo', '2', '2023-03-01 03:33:33', '2023-03-12 04:05:55', NULL),
(49, 'accepted_payment_banner', '3', '2023-03-01 03:33:33', '2023-03-12 04:05:55', NULL),
(50, 'copyright_text', 'Developed by&nbsp; <font color=\"#ff9c00\"><b>Flowerly Team . </b></font><br>', '2023-03-01 03:49:42', '2023-06-07 17:22:10', NULL),
(51, 'product_page_widgets', '[]', '2023-03-01 07:35:08', '2023-03-12 03:56:25', NULL),
(52, 'product_page_banner_link', NULL, '2023-03-01 08:20:50', '2023-03-01 08:20:50', NULL),
(53, 'product_page_banner', '59', '2023-03-01 08:20:50', '2023-03-01 08:20:50', NULL),
(54, 'facebook_link', 'https://www.facebook.com/', '2023-03-01 08:45:01', '2023-03-01 08:45:01', NULL),
(55, 'twitter_link', 'https://twitter.com/', '2023-03-01 08:45:01', '2023-03-01 08:45:01', NULL),
(56, 'linkedin_link', 'https://www.linkedin.com/', '2023-03-01 08:45:01', '2023-03-01 08:45:01', NULL),
(57, 'youtube_link', 'https://www.youtube.com/', '2023-03-01 08:45:01', '2023-03-01 08:45:01', NULL),
(58, 'about_us', 'At Flowerly , we are passionate about delivering beautiful flowers and creating memorable experiences. With years of experience in the floral industry, we have established ourselves as a trusted name in providing exquisite floral arrangements for every occasion', '2023-03-01 08:46:33', '2023-06-07 16:45:40', NULL),
(59, 'about_intro_sub_title', 'Bringing Beauty and Joy to Every Occasion', '2023-03-04 03:54:12', '2023-06-07 16:39:41', NULL),
(60, 'about_intro_title', 'Flowerly - Your Trusted Floral Partner', '2023-03-04 03:54:12', '2023-06-07 16:39:41', NULL),
(61, 'about_intro_text', 'At Flowerly , we are passionate about delivering the beauty of nature right to your doorstep. We believe that flowers have the power to brighten someone\'s day, celebrate special moments, and convey heartfelt emotions', '2023-03-04 03:54:12', '2023-06-07 16:39:41', NULL),
(62, 'about_intro_mission', 'Our mission is to provide exceptional floral experiences by offering a wide selection of high-quality flowers, creative arrangements, and reliable delivery services. We strive to exceed customer expectations with our dedication to quality, craftsmanship, and customer satisfaction.', '2023-03-04 03:54:12', '2023-06-07 16:39:41', NULL),
(63, 'about_intro_vision', 'Our vision is to be the preferred online destination for customers seeking exquisite and personalized floral gifts. We aim to create lasting impressions with our stunning floral creations, exceptional customer service, and convenient online shopping experience.', '2023-03-04 03:54:12', '2023-06-07 16:39:41', NULL),
(64, 'about_intro_quote', 'Flowers are the music of the ground. From earth\'s lips, spoken without sound', '2023-03-04 03:54:12', '2023-06-07 16:39:41', NULL),
(65, 'about_intro_quote_by', 'Edwin Curran', '2023-03-04 03:54:12', '2023-06-07 16:39:41', NULL),
(66, 'about_intro_image', '21', '2023-03-04 03:54:12', '2023-06-07 16:39:41', NULL),
(67, 'about_popular_brand_ids', '[\"1\",\"2\"]', '2023-03-04 04:16:59', '2023-03-04 04:16:59', NULL),
(68, 'about_features_title', 'Our Working Ability', '2023-03-04 04:49:27', '2023-03-04 04:49:27', NULL),
(69, 'about_features_sub_title', 'Assertively target market lorem ipsum is simply free text available dolor incididunt simply free ut labore et dolore.', '2023-03-04 04:49:27', '2023-03-04 04:49:27', NULL),
(70, 'about_us_features', '[]', '2023-03-04 04:59:50', '2023-03-12 03:57:12', NULL),
(71, 'about_why_choose_sub_title', 'Why Choose Us', '2023-03-04 05:59:45', '2023-03-04 05:59:45', NULL),
(72, 'about_why_choose_title', 'We do not Buy from the <br> Open Market', '2023-03-04 05:59:45', '2023-03-04 05:59:45', NULL),
(73, 'about_why_choose_text', 'Compellingly fashion intermandated opportunities and multimedia based fnsparent e-business.', '2023-03-04 05:59:45', '2023-03-04 05:59:45', NULL),
(74, 'about_why_choose_banner', '62', '2023-03-04 05:59:45', '2023-03-04 05:59:45', NULL),
(75, 'about_us_why_choose_us', '[]', '2023-03-04 06:05:13', '2023-03-12 03:57:43', NULL),
(76, 'admin_panel_logo', '4', '2023-03-04 08:37:03', '2023-03-12 04:08:21', NULL),
(77, 'favicon', '5', '2023-03-04 08:37:03', '2023-03-12 04:08:21', NULL),
(78, 'invoice_thanksgiving', 'Thank you for choosing to shop at our store and for placing your order. We truly appreciate your support and value you as a valued customer. Our team is delighted to have you as one of our valued users. Your satisfaction is our top priority, so if you ever have any questions, suggestions, or concerns, please feel free to reach out to us. We are here to assist you and ensure your experience with us is exceptional.', '2023-03-07 06:04:15', '2023-06-08 00:22:15', NULL),
(79, 'enable_cod', '0', '2023-06-07 23:41:25', '2023-06-07 23:41:25', NULL),
(80, 'enable_paypal', '0', '2023-06-07 23:41:25', '2023-06-07 23:41:25', NULL),
(81, 'paypal_sandbox', '0', '2023-06-07 23:41:25', '2023-06-07 23:41:25', NULL),
(82, 'enable_stripe', '1', '2023-06-07 23:41:25', '2023-06-07 23:41:25', NULL),
(83, 'enable_paytm', '0', '2023-06-07 23:41:25', '2023-06-07 23:41:25', NULL),
(84, 'enable_razorpay', '0', '2023-06-07 23:41:25', '2023-06-07 23:41:25', NULL),
(85, 'enable_iyzico', '0', '2023-06-07 23:41:25', '2023-06-07 23:41:25', NULL),
(86, 'iyzico_sandbox', '0', '2023-06-07 23:41:25', '2023-06-07 23:41:25', NULL),
(87, 'enable_recaptcha', '1', '2023-06-08 00:16:21', '2023-06-08 00:16:21', NULL),
(88, 'enable_scheduled_order', '0', '2023-06-08 00:22:15', '2023-06-08 00:40:49', NULL),
(89, 'allowed_order_days', NULL, '2023-06-08 00:22:15', '2023-06-08 00:22:15', NULL),
(90, 'enable_maintenance_mode', NULL, '2023-06-14 16:09:13', '2023-06-14 16:09:13', NULL),
(91, 'global_meta_title', NULL, '2023-06-14 16:09:13', '2023-06-14 16:09:13', NULL),
(92, 'global_meta_description', NULL, '2023-06-14 16:09:13', '2023-06-14 16:09:13', NULL),
(93, 'global_meta_keywords', NULL, '2023-06-14 16:09:13', '2023-06-14 16:09:13', NULL),
(94, 'global_meta_image', NULL, '2023-06-14 16:09:13', '2023-06-14 16:09:13', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `taxes`
--

CREATE TABLE `taxes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `unit_localizations`
--

CREATE TABLE `unit_localizations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `unit_id` int(11) NOT NULL,
  `lang_key` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` int(11) DEFAULT NULL,
  `user_type` varchar(255) NOT NULL DEFAULT 'customer',
  `name` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email_or_otp_verified` tinyint(4) NOT NULL DEFAULT 0,
  `verification_code` varchar(255) DEFAULT NULL,
  `new_email_verification_code` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `remember_token` varchar(255) DEFAULT NULL,
  `provider_id` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `postal_code` varchar(255) DEFAULT NULL,
  `user_balance` double NOT NULL DEFAULT 0,
  `is_banned` tinyint(4) NOT NULL DEFAULT 0,
  `shop_id` int(11) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `user_type`, `name`, `email`, `phone`, `email_or_otp_verified`, `verification_code`, `new_email_verification_code`, `password`, `remember_token`, `provider_id`, `avatar`, `postal_code`, `user_balance`, `is_banned`, `shop_id`, `email_verified_at`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, NULL, 'admin', 'Oussama', 'oussaabb101@gmail.com', NULL, 0, NULL, NULL, '$2y$10$/BuSO4.mdR7OlfOHUo7WyuDlNJ49/Xddq.eOkZ0VYlLvYhf0xp8C.', NULL, NULL, '6', NULL, 0, 0, 1, '2023-06-07 13:06:00', NULL, '2023-06-07 13:40:00', NULL),
(2, 1, 'staff', 'Othmane', 'othmanedaoui7@gmail.com', '', 0, NULL, NULL, '$2y$10$l0rterx.D94g39YJqpAUEeJI4Exb0v.t4nd.8ouG4B/2eEPqKDRw6', NULL, NULL, NULL, NULL, 0, 0, 1, NULL, '2023-06-07 15:23:40', '2023-06-07 15:23:40', NULL),
(3, 1, 'staff', 'Hajar', 'wafiqhajaar@gmail.com', '', 0, NULL, NULL, '$2y$10$MVFlnb0KLRIJMDcBoTbheeJPAIA/RX1aW7OhKrBuXdhvP5bj8Ue/y', NULL, NULL, NULL, NULL, 0, 0, 1, NULL, '2023-06-07 15:23:54', '2023-06-07 15:23:54', NULL),
(7, NULL, 'customer', 'Client', 'client@gmail.com', '+212649986442', 1, '442993', NULL, '$2y$10$PBUqlFwrKW6GxQvU4C3bq.Bz27zAbkNE4gDbfFdJ76QJXHJCXeCCe', 'qV1YaHsuk5GCu7s9endWFAghuricLZQVCg2PlnsgUCzWdNFZRuonPXb05YmV', NULL, NULL, NULL, 0, 0, NULL, '2023-06-08 00:18:28', '2023-06-08 00:17:30', '2023-06-08 00:18:28', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_addresses`
--

CREATE TABLE `user_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `state_id` int(11) NOT NULL,
  `city_id` int(11) NOT NULL,
  `address` longtext NOT NULL,
  `is_default` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'only one can be default',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_addresses`
--

INSERT INTO `user_addresses` (`id`, `user_id`, `country_id`, `state_id`, `city_id`, `address`, `is_default`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 6, 1, 1, 6, 'mghila 123', 1, '2023-06-07 23:23:35', '2023-06-07 23:23:35', NULL),
(2, 7, 1, 1, 6, '123  beni mellal', 0, '2023-06-08 00:42:16', '2023-06-14 16:19:14', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `variations`
--

CREATE TABLE `variations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `variations`
--

INSERT INTO `variations` (`id`, `name`, `is_active`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Size', 1, '2022-12-05 12:06:30', '2022-12-05 12:06:30', NULL),
(2, 'Color', 1, '2022-12-05 12:06:30', '2022-12-05 12:06:30', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `variation_localizations`
--

CREATE TABLE `variation_localizations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `variation_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `lang_key` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `variation_values`
--

CREATE TABLE `variation_values` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `variation_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 1,
  `image` text DEFAULT NULL COMMENT 'only for colors',
  `color_code` varchar(255) DEFAULT NULL COMMENT 'only for colors',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `variation_value_localizations`
--

CREATE TABLE `variation_value_localizations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `variation_value_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` text DEFAULT NULL,
  `lang_key` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wallet_histories`
--

CREATE TABLE `wallet_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `amount` double NOT NULL DEFAULT 0,
  `payment_method` varchar(255) DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'added' COMMENT 'added/pending/cancelled',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_categories`
--
ALTER TABLE `blog_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_localizations`
--
ALTER TABLE `blog_localizations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_tags`
--
ALTER TABLE `blog_tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brand_localizations`
--
ALTER TABLE `brand_localizations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `campaigns`
--
ALTER TABLE `campaigns`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `campaign_products`
--
ALTER TABLE `campaign_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_brands`
--
ALTER TABLE `category_brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_localizations`
--
ALTER TABLE `category_localizations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_us_messages`
--
ALTER TABLE `contact_us_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupon_usages`
--
ALTER TABLE `coupon_usages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `localizations`
--
ALTER TABLE `localizations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `logistics`
--
ALTER TABLE `logistics`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `logistic_zones`
--
ALTER TABLE `logistic_zones`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `logistic_zone_cities`
--
ALTER TABLE `logistic_zone_cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `media_managers`
--
ALTER TABLE `media_managers`
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
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_groups`
--
ALTER TABLE `order_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_updates`
--
ALTER TABLE `order_updates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `page_localizations`
--
ALTER TABLE `page_localizations`
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
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_categories`
--
ALTER TABLE `product_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_colors`
--
ALTER TABLE `product_colors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_localizations`
--
ALTER TABLE `product_localizations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_tags`
--
ALTER TABLE `product_tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_taxes`
--
ALTER TABLE `product_taxes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_variations`
--
ALTER TABLE `product_variations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_variation_combinations`
--
ALTER TABLE `product_variation_combinations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_variation_stocks`
--
ALTER TABLE `product_variation_stocks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `refunds`
--
ALTER TABLE `refunds`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reward_points`
--
ALTER TABLE `reward_points`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `scheduled_delivery_time_lists`
--
ALTER TABLE `scheduled_delivery_time_lists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shops`
--
ALTER TABLE `shops`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscribed_users`
--
ALTER TABLE `subscribed_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_settings`
--
ALTER TABLE `system_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `taxes`
--
ALTER TABLE `taxes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `unit_localizations`
--
ALTER TABLE `unit_localizations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_addresses`
--
ALTER TABLE `user_addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `variations`
--
ALTER TABLE `variations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `variation_localizations`
--
ALTER TABLE `variation_localizations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `variation_values`
--
ALTER TABLE `variation_values`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `variation_value_localizations`
--
ALTER TABLE `variation_value_localizations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wallet_histories`
--
ALTER TABLE `wallet_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blog_categories`
--
ALTER TABLE `blog_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blog_localizations`
--
ALTER TABLE `blog_localizations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blog_tags`
--
ALTER TABLE `blog_tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `brand_localizations`
--
ALTER TABLE `brand_localizations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `campaigns`
--
ALTER TABLE `campaigns`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `campaign_products`
--
ALTER TABLE `campaign_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `category_brands`
--
ALTER TABLE `category_brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `category_localizations`
--
ALTER TABLE `category_localizations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `contact_us_messages`
--
ALTER TABLE `contact_us_messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `coupon_usages`
--
ALTER TABLE `coupon_usages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `localizations`
--
ALTER TABLE `localizations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=813;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `logistics`
--
ALTER TABLE `logistics`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `logistic_zones`
--
ALTER TABLE `logistic_zones`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `logistic_zone_cities`
--
ALTER TABLE `logistic_zone_cities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `media_managers`
--
ALTER TABLE `media_managers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `order_groups`
--
ALTER TABLE `order_groups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `order_updates`
--
ALTER TABLE `order_updates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `page_localizations`
--
ALTER TABLE `page_localizations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=140;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `product_categories`
--
ALTER TABLE `product_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `product_colors`
--
ALTER TABLE `product_colors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_localizations`
--
ALTER TABLE `product_localizations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `product_tags`
--
ALTER TABLE `product_tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_taxes`
--
ALTER TABLE `product_taxes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_variations`
--
ALTER TABLE `product_variations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `product_variation_combinations`
--
ALTER TABLE `product_variation_combinations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_variation_stocks`
--
ALTER TABLE `product_variation_stocks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `refunds`
--
ALTER TABLE `refunds`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reward_points`
--
ALTER TABLE `reward_points`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `scheduled_delivery_time_lists`
--
ALTER TABLE `scheduled_delivery_time_lists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shops`
--
ALTER TABLE `shops`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `states`
--
ALTER TABLE `states`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `subscribed_users`
--
ALTER TABLE `subscribed_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `system_settings`
--
ALTER TABLE `system_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `taxes`
--
ALTER TABLE `taxes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `unit_localizations`
--
ALTER TABLE `unit_localizations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `user_addresses`
--
ALTER TABLE `user_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `variations`
--
ALTER TABLE `variations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `variation_localizations`
--
ALTER TABLE `variation_localizations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `variation_values`
--
ALTER TABLE `variation_values`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `variation_value_localizations`
--
ALTER TABLE `variation_value_localizations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wallet_histories`
--
ALTER TABLE `wallet_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

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
