-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 07, 2023 at 06:28 PM
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
(1, 'marriage', 'marriage-y4fq0', 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, '2023-06-07 13:43:03', '2023-06-07 13:43:03');

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
(1, 1, 'en', 'marriage', NULL, NULL, NULL, NULL, '2023-06-07 13:43:03', '2023-06-07 13:43:03', NULL);

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
(1, 'usd', 'US Dollar', '$', 0, 1, 1, '2022-11-27 11:21:37', '2022-11-27 11:21:37', NULL);

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
(380, 'en', 'resend', 'Resend', '2023-06-07 15:26:36', '2023-06-07 15:26:36', NULL);

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
(8, 1, 'uploads/media/skiYlwShQVyUK3Rmb446qzNURuH2KtsfIHnIGd4Y.png', 392247, 'image', 'back1-removebg-preview.png', 'png', '2023-06-07 15:22:19', '2023-06-07 15:22:19', NULL);

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
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(1, 1, 'admin', 'this is  atest', 'this-is-atest-jer6y', NULL, NULL, '7', '7', NULL, 'this is a short-description test', '<p>this is a description test<br></p>', 100, 100, 0, 'percent', NULL, NULL, 75, 12, 0, 0, 1, 1, 0, 1, 0, 72, 24, NULL, NULL, NULL, NULL, 0, '2023-06-07 13:43:35', '2023-06-07 13:43:40', NULL),
(2, 1, 'admin', 'test product 2', 'test-product-2-7wdja', NULL, NULL, '7', '7', NULL, 'this is a test short description', '<p>this is a test description<br></p>', 100, 100, 0, 'percent', NULL, NULL, 82, 14, 0, 0, 1, 1, 0, 1, 0, 72, 24, NULL, NULL, NULL, NULL, 0, '2023-06-07 13:46:57', '2023-06-07 13:47:04', NULL),
(3, 1, 'admin', 'test product 3', 'test-product-3-w8dnc', NULL, NULL, '7', '7', NULL, 'this a test description', '<p>this a test description<br></p>', 525, 525, 0, 'percent', NULL, NULL, 500, 55, 1, 0, 1, 1, 0, 1, 0, 72, 24, NULL, NULL, NULL, NULL, 0, '2023-06-07 13:57:05', '2023-06-07 13:57:05', NULL),
(4, 1, 'admin', 'this is atest', 'this-is-atest-aqrve', NULL, NULL, '8', '8', NULL, 'jdcnjs,dc dcsdc', '<p>jsdcjsdc djnsd<br></p>', 150, 150, 0, 'percent', NULL, NULL, 75, 1, 1, 0, 1, 1, 0, 1, 0, 72, 24, NULL, NULL, NULL, NULL, 0, '2023-06-07 15:23:00', '2023-06-07 15:23:00', NULL);

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
(1, 1, 1, NULL, NULL, NULL),
(2, 2, 1, NULL, NULL, NULL),
(3, 3, 1, NULL, NULL, NULL),
(4, 4, 1, NULL, NULL, NULL);

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
(1, 1, 'this is  atest', NULL, '<p>this is a description test<br></p>', 'en', '2023-06-07 13:43:35', '2023-06-07 13:43:35', NULL),
(2, 2, 'test product 2', NULL, '<p>this is a test description<br></p>', 'en', '2023-06-07 13:46:57', '2023-06-07 13:46:57', NULL),
(3, 3, 'test product 3', NULL, '<p>this a test description<br></p>', 'en', '2023-06-07 13:57:05', '2023-06-07 13:57:05', NULL),
(4, 4, 'this is atest', NULL, '<p>jsdcjsdc djnsd<br></p>', 'en', '2023-06-07 15:23:01', '2023-06-07 15:23:01', NULL);

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
(1, 1, NULL, '1', '1', 100, '2023-06-07 13:43:35', '2023-06-07 13:43:35', NULL),
(2, 2, NULL, '2', '2', 100, '2023-06-07 13:46:57', '2023-06-07 13:46:57', NULL),
(3, 3, NULL, '3', '3', 525, '2023-06-07 13:57:05', '2023-06-07 13:57:05', NULL),
(4, 4, NULL, '5', '5', 150, '2023-06-07 15:23:01', '2023-06-07 15:23:01', NULL);

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
(1, 1, 1, 12, '2023-06-07 13:43:35', '2023-06-07 13:43:35', NULL),
(2, 2, 1, 14, '2023-06-07 13:46:57', '2023-06-07 13:46:57', NULL),
(3, 3, 1, 55, '2023-06-07 13:57:05', '2023-06-07 13:57:05', NULL),
(4, 4, 1, 1, '2023-06-07 15:23:01', '2023-06-07 15:23:01', NULL);

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
(2, 'default_currency', 'usd', '2022-12-07 05:55:08', '2022-12-07 05:55:08', NULL),
(3, 'no_of_decimals', '2', '2022-12-07 05:55:08', '2022-12-07 05:55:08', NULL),
(4, 'truncate_price', '0', '2022-12-07 05:55:08', '2022-12-07 05:55:08', NULL),
(5, 'enable_multi_vendor', '0', '2022-12-25 05:00:08', '2023-02-18 07:56:54', NULL),
(6, 'default_admin_commission', '5', '2022-12-25 05:00:08', '2022-12-25 05:00:08', NULL),
(7, 'vendor_minimum_payout', '500', '2022-12-28 05:34:48', '2022-12-28 05:34:48', NULL),
(8, 'order_code_prefix', '#G-Store:', '2023-02-04 05:48:17', '2023-02-19 07:42:24', NULL),
(9, 'order_code_start', '1', '2023-02-04 05:48:17', '2023-02-04 05:51:38', NULL),
(10, 'system_title', 'Grostore Online Store', '2023-02-05 05:48:44', '2023-03-07 05:46:14', NULL),
(11, 'title_separator', ':', '2023-02-05 05:48:44', '2023-02-05 05:48:44', NULL),
(12, 'site_address', 'Cecilia Chapman, 711-2880 Nulla St, Mankato Mississippi 96522', '2023-02-05 05:49:15', '2023-02-05 05:49:15', NULL),
(13, 'registration_with', 'email', '2023-02-18 08:10:22', '2023-02-18 08:10:22', NULL),
(14, 'registration_verification_with', 'disable', '2023-02-18 08:10:22', '2023-02-18 08:10:22', NULL),
(15, 'topbar_welcome_text', 'Welcome to our Organic store', '2023-02-20 05:41:46', '2023-02-20 05:41:46', NULL),
(16, 'topbar_email', 'groshop@support.com', '2023-02-20 05:41:46', '2023-02-20 05:41:46', NULL),
(17, 'topbar_location', 'Washington, New York, USA - 254230', '2023-02-20 05:41:46', '2023-02-20 05:41:46', NULL),
(18, 'navbar_logo', '1', '2023-02-20 05:41:46', '2023-03-12 04:04:45', NULL),
(19, 'navbar_categories', NULL, '2023-02-20 05:41:46', '2023-03-12 04:04:45', NULL),
(20, 'navbar_pages', '[\"1\"]', '2023-02-20 05:41:47', '2023-03-01 08:32:34', NULL),
(21, 'navbar_contact_number', '+80 157 058 4567', '2023-02-20 05:41:47', '2023-02-20 05:41:47', NULL),
(22, 'hero_sliders', '[{\"id\":106549,\"sub_title\":\"Genuine 100% Organic Products\",\"title\":\"Online Fresh Grocery Products\",\"text\":\"Assertively target market-driven intellectual capital with worldwide human capital holistic.\",\"image\":\"39\",\"link\":\"https:\\/\\/www.youtube.com\\/watch?v=mZ77D66ZYtw\"}]', '2023-02-20 10:36:00', '2023-03-01 07:33:57', NULL),
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
(45, 'product_listing_categories', '[\"6\",\"5\",\"4\",\"3\",\"2\"]', '2023-02-27 05:47:35', '2023-02-27 05:47:35', NULL),
(46, 'footer_categories', NULL, '2023-03-01 03:33:33', '2023-03-12 03:59:31', NULL),
(47, 'quick_links', '[\"2\"]', '2023-03-01 03:33:33', '2023-03-01 03:33:33', NULL),
(48, 'footer_logo', '2', '2023-03-01 03:33:33', '2023-03-12 04:05:55', NULL),
(49, 'accepted_payment_banner', '3', '2023-03-01 03:33:33', '2023-03-12 04:05:55', NULL),
(50, 'copyright_text', '© All Designed, Developed and 💕 by <b><font color=\"#ff9c00\">ThemeTags</font></b>', '2023-03-01 03:49:42', '2023-03-12 03:59:31', NULL),
(51, 'product_page_widgets', '[]', '2023-03-01 07:35:08', '2023-03-12 03:56:25', NULL),
(52, 'product_page_banner_link', NULL, '2023-03-01 08:20:50', '2023-03-01 08:20:50', NULL),
(53, 'product_page_banner', '59', '2023-03-01 08:20:50', '2023-03-01 08:20:50', NULL),
(54, 'facebook_link', 'https://www.facebook.com/', '2023-03-01 08:45:01', '2023-03-01 08:45:01', NULL),
(55, 'twitter_link', 'https://twitter.com/', '2023-03-01 08:45:01', '2023-03-01 08:45:01', NULL),
(56, 'linkedin_link', 'https://www.linkedin.com/', '2023-03-01 08:45:01', '2023-03-01 08:45:01', NULL),
(57, 'youtube_link', 'https://www.youtube.com/', '2023-03-01 08:45:01', '2023-03-01 08:45:01', NULL),
(58, 'about_us', 'Explain to you how all this mistaken denouncing pleasure and praising pain was born and we will give you a complete account of the system, and expound the actual teachings.\r\n          \r\n          Mistaken denouncing pleasure and praising pain was born and we will give you complete account of the system expound.', '2023-03-01 08:46:33', '2023-03-01 08:46:33', NULL),
(59, 'about_intro_sub_title', '100% Organic Food Provide', '2023-03-04 03:54:12', '2023-03-04 03:54:12', NULL),
(60, 'about_intro_title', 'Be healthy & <br> eat fresh organic food', '2023-03-04 03:54:12', '2023-03-11 04:49:49', NULL),
(61, 'about_intro_text', 'Assertively target market lorem ipsum is simply free text available dolor sit amet, consectetur notted adipisicing elit sed do eiusmod tempor incididunt simply freeutation labore et dolore.', '2023-03-04 03:54:12', '2023-03-04 03:54:12', NULL),
(62, 'about_intro_mission', 'Continually transform virtual meta- methodologies. leverage existing alignments.', '2023-03-04 03:54:12', '2023-03-04 03:54:12', NULL),
(63, 'about_intro_vision', 'Continually transform virtual meta- methodologies. leverage existing alignments.', '2023-03-04 03:54:12', '2023-03-04 03:54:12', NULL),
(64, 'about_intro_quote', 'Assertively target market Lorem ipsum is simply free consectetur notted elit sed do eiusmod', '2023-03-04 03:54:12', '2023-03-04 03:54:12', NULL),
(65, 'about_intro_quote_by', 'George Scholll', '2023-03-04 03:54:12', '2023-03-04 03:54:12', NULL),
(66, 'about_intro_image', '60', '2023-03-04 03:54:12', '2023-03-04 03:54:12', NULL),
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
(78, 'invoice_thanksgiving', 'Thank you for shopping from our store and for your order. it is really awesome to have you as one of our paid users. We hope that you will be happy with Qlearly, if you ever have any questions, suggestions or concerns please do not hesitate to contact us.', '2023-03-07 06:04:15', '2023-03-07 06:09:20', NULL);

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
(4, NULL, 'customer', 'oussama abbou', 'oussamajskt9@gmail.com', '+212649986442', 0, '737664', NULL, '$2y$10$XPAR.Xys1zp5t0LiBa.0S.4JnVPafsA.0dO0hi0gllxG5RUX7speG', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '2023-06-07 15:26:34', '2023-06-07 15:26:35', NULL);

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `category_brands`
--
ALTER TABLE `category_brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `category_localizations`
--
ALTER TABLE `category_localizations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=381;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `logistics`
--
ALTER TABLE `logistics`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `logistic_zones`
--
ALTER TABLE `logistic_zones`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `logistic_zone_cities`
--
ALTER TABLE `logistic_zone_cities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `media_managers`
--
ALTER TABLE `media_managers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_groups`
--
ALTER TABLE `order_groups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `product_categories`
--
ALTER TABLE `product_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `product_colors`
--
ALTER TABLE `product_colors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_localizations`
--
ALTER TABLE `product_localizations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `product_variation_combinations`
--
ALTER TABLE `product_variation_combinations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_variation_stocks`
--
ALTER TABLE `product_variation_stocks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user_addresses`
--
ALTER TABLE `user_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

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
