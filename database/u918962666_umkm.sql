-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jul 26, 2019 at 07:15 AM
-- Server version: 10.2.25-MariaDB
-- PHP Version: 7.2.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u918962666_umkm`
--

-- --------------------------------------------------------

--
-- Table structure for table `1qu_accounts`
--

CREATE TABLE `1qu_accounts` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `opening_balance` double(15,4) NOT NULL DEFAULT 0.0000,
  `bank_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `type` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `1qu_accounts`
--

INSERT INTO `1qu_accounts` (`id`, `company_id`, `name`, `number`, `currency_code`, `opening_balance`, `bank_name`, `bank_phone`, `bank_address`, `enabled`, `type`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Kas', '110', 'IDR', 25000000.0000, 'Kas', NULL, NULL, 1, '1', '2019-07-11 04:27:03', '2019-07-23 14:49:40', NULL),
(3, 3, 'Kas', '1', 'IDR', 25000000.0000, 'Kas', NULL, NULL, 1, '1', '2019-07-14 22:29:15', '2019-07-15 08:15:07', NULL),
(4, 1, 'Bank', '120', 'IDR', 0.0000, NULL, NULL, NULL, 1, '1', '2019-07-21 07:26:44', '2019-07-21 07:26:44', NULL),
(5, 1, 'Modal Awal', '310', 'IDR', 0.0000, NULL, NULL, NULL, 1, '3', '2019-07-21 07:27:27', '2019-07-21 07:27:27', NULL),
(6, 1, 'Piutang Usaha', '130', 'IDR', 0.0000, NULL, NULL, NULL, 1, '1', '2019-07-21 07:31:08', '2019-07-21 07:31:08', NULL),
(7, 1, 'Persediaan Barang Dagang', '140', 'IDR', 0.0000, NULL, NULL, NULL, 1, '1', '2019-07-21 07:31:22', '2019-07-21 07:31:22', NULL),
(8, 1, 'Gedung', '150', 'IDR', 0.0000, NULL, NULL, NULL, 1, '1', '2019-07-21 07:31:34', '2019-07-21 07:31:34', NULL),
(9, 1, 'Kendaraan', '160', 'IDR', 0.0000, NULL, NULL, NULL, 1, '1', '2019-07-21 07:31:42', '2019-07-21 07:31:42', NULL),
(10, 1, 'Mesin', '170', 'IDR', 0.0000, NULL, NULL, NULL, 1, '1', '2019-07-21 07:31:49', '2019-07-21 07:31:49', NULL),
(11, 1, 'Peralatan Usaha', '180', 'IDR', 5700000.0000, NULL, NULL, NULL, 1, '1', '2019-07-21 07:31:59', '2019-07-23 14:38:46', NULL),
(12, 1, 'Laba Ditahan Periode Lalu', '320', 'IDR', 0.0000, NULL, NULL, NULL, 1, '3', '2019-07-21 07:32:34', '2019-07-21 07:32:34', NULL),
(13, 1, 'Laba Periode Berjalan', '330', 'IDR', 0.0000, NULL, NULL, NULL, 1, '3', '2019-07-21 07:32:58', '2019-07-21 07:32:58', NULL),
(14, 6, 'Kas', '1', 'USD', 0.0000, 'Kas', NULL, NULL, 1, NULL, '2019-07-23 15:09:46', '2019-07-23 15:09:46', NULL),
(15, 1, 'Hutang', '210', 'IDR', 0.0000, NULL, NULL, NULL, 1, '2', '2019-07-23 15:22:06', '2019-07-23 15:22:06', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `1qu_bills`
--

CREATE TABLE `1qu_bills` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `bill_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bill_status_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `billed_at` datetime NOT NULL,
  `due_at` datetime NOT NULL,
  `amount` double(15,4) NOT NULL,
  `currency_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_rate` double(15,8) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `vendor_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vendor_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vendor_tax_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vendor_phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vendor_address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `category_id` int(11) NOT NULL DEFAULT 1,
  `parent_id` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `1qu_bill_histories`
--

CREATE TABLE `1qu_bill_histories` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `bill_id` int(11) NOT NULL,
  `status_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notify` tinyint(1) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `1qu_bill_items`
--

CREATE TABLE `1qu_bill_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `bill_id` int(11) NOT NULL,
  `item_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` double(7,2) NOT NULL,
  `price` double(15,4) NOT NULL,
  `total` double(15,4) NOT NULL,
  `tax` double(15,4) NOT NULL DEFAULT 0.0000,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `1qu_bill_item_taxes`
--

CREATE TABLE `1qu_bill_item_taxes` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `bill_id` int(11) NOT NULL,
  `bill_item_id` int(11) NOT NULL,
  `tax_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(15,4) NOT NULL DEFAULT 0.0000,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `1qu_bill_payments`
--

CREATE TABLE `1qu_bill_payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `bill_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `paid_at` datetime NOT NULL,
  `amount` double(15,4) NOT NULL,
  `currency_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_rate` double(15,8) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_method` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `reconciled` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `1qu_bill_statuses`
--

CREATE TABLE `1qu_bill_statuses` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `1qu_bill_statuses`
--

INSERT INTO `1qu_bill_statuses` (`id`, `company_id`, `name`, `code`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Konsep', 'draft', '2019-07-11 04:27:03', '2019-07-11 04:27:03', NULL),
(2, 1, 'Diterima', 'received', '2019-07-11 04:27:03', '2019-07-11 04:27:03', NULL),
(3, 1, 'Sebagian', 'partial', '2019-07-11 04:27:03', '2019-07-11 04:27:03', NULL),
(4, 1, 'Dibayar', 'paid', '2019-07-11 04:27:03', '2019-07-11 04:27:03', NULL),
(5, 2, 'Konsep', 'draft', '2019-07-11 14:37:39', '2019-07-14 22:35:58', '2019-07-14 22:35:58'),
(6, 2, 'Diterima', 'received', '2019-07-11 14:37:39', '2019-07-14 22:35:58', '2019-07-14 22:35:58'),
(7, 2, 'Sebagian', 'partial', '2019-07-11 14:37:39', '2019-07-14 22:35:58', '2019-07-14 22:35:58'),
(8, 2, 'Dibayar', 'paid', '2019-07-11 14:37:39', '2019-07-14 22:35:58', '2019-07-14 22:35:58'),
(9, 3, 'Konsep', 'draft', '2019-07-14 22:29:15', '2019-07-14 22:29:15', NULL),
(10, 3, 'Diterima', 'received', '2019-07-14 22:29:15', '2019-07-14 22:29:15', NULL),
(11, 3, 'Sebagian', 'partial', '2019-07-14 22:29:15', '2019-07-14 22:29:15', NULL),
(12, 3, 'Dibayar', 'paid', '2019-07-14 22:29:15', '2019-07-14 22:29:15', NULL),
(13, 6, 'Konsep', 'draft', '2019-07-23 15:09:46', '2019-07-23 15:09:46', NULL),
(14, 6, 'Diterima', 'received', '2019-07-23 15:09:46', '2019-07-23 15:09:46', NULL),
(15, 6, 'Sebagian', 'partial', '2019-07-23 15:09:46', '2019-07-23 15:09:46', NULL),
(16, 6, 'Dibayar', 'paid', '2019-07-23 15:09:46', '2019-07-23 15:09:46', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `1qu_bill_totals`
--

CREATE TABLE `1qu_bill_totals` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `bill_id` int(11) NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(15,4) NOT NULL,
  `sort_order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `1qu_categories`
--

CREATE TABLE `1qu_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type_id` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `1qu_categories`
--

INSERT INTO `1qu_categories` (`id`, `company_id`, `name`, `type`, `type_id`, `color`, `enabled`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Mentransfer ', 'other', NULL, '#605ca8', 1, '2019-07-11 04:27:03', '2019-07-11 04:27:03', NULL),
(2, 1, 'Deposit', 'income', NULL, '#f39c12', 1, '2019-07-11 04:27:03', '2019-07-23 15:15:03', '2019-07-23 15:15:03'),
(3, 1, '410 Penjualan Barang Dagangan', 'income', '3', '#6da252', 1, '2019-07-11 04:27:03', '2019-07-21 07:55:23', NULL),
(4, 1, '590 Biaya Lainnya', 'expense', '5', '#d2d6de', 1, '2019-07-11 04:27:03', '2019-07-21 07:53:07', NULL),
(5, 1, 'Umum', 'item', NULL, '#00c0ef', 1, '2019-07-11 04:27:03', '2019-07-11 04:27:03', NULL),
(6, 2, 'Transfer ', 'other', NULL, '#605ca8', 1, '2019-07-11 14:37:39', '2019-07-14 22:35:58', '2019-07-14 22:35:58'),
(7, 2, 'Deposit', 'income', NULL, '#f39c12', 1, '2019-07-11 14:37:39', '2019-07-14 22:35:58', '2019-07-14 22:35:58'),
(8, 2, 'Penjualan', 'income', NULL, '#6da252', 1, '2019-07-11 14:37:39', '2019-07-14 22:35:58', '2019-07-14 22:35:58'),
(9, 2, 'Lain ', 'expense', NULL, '#d2d6de', 1, '2019-07-11 14:37:39', '2019-07-14 22:35:58', '2019-07-14 22:35:58'),
(10, 2, 'Umum', 'item', NULL, '#00c0ef', 1, '2019-07-11 14:37:39', '2019-07-14 22:35:58', '2019-07-14 22:35:58'),
(11, 3, 'Transfer ', 'other', NULL, '#605ca8', 1, '2019-07-14 22:29:15', '2019-07-14 22:29:15', NULL),
(12, 3, 'Deposit', 'income', NULL, '#f39c12', 1, '2019-07-14 22:29:15', '2019-07-14 22:29:15', NULL),
(13, 3, 'Penjualan', 'income', NULL, '#6da252', 1, '2019-07-14 22:29:15', '2019-07-14 22:29:15', NULL),
(14, 3, 'Lain ', 'expense', NULL, '#d2d6de', 1, '2019-07-14 22:29:15', '2019-07-14 22:29:15', NULL),
(15, 3, 'Umum', 'item', NULL, '#00c0ef', 1, '2019-07-14 22:29:15', '2019-07-14 22:29:15', NULL),
(16, 3, 'Ikan Bakar', 'item', NULL, '#326e52', 1, '2019-07-14 18:14:02', '2019-07-14 18:14:02', NULL),
(17, 3, 'Ikan Bakar atau Goreng', 'item', NULL, '#3718b3', 1, '2019-07-14 18:24:33', '2019-07-14 18:24:33', NULL),
(18, 3, 'Pembelian Ikan', 'expense', NULL, '#3c4541', 1, '2019-07-14 18:50:43', '2019-07-14 18:50:43', NULL),
(19, 1, '533 Biaya Kebersihan & Keamanan', 'expense', '5', '#f75959', 1, '2019-07-21 07:21:56', '2019-07-21 07:53:21', NULL),
(20, 1, 'Harga Pokok Penjualan (HPP)', 'expense', NULL, '#358bf0', 1, '2019-07-21 07:22:32', '2019-07-21 07:50:56', '2019-07-21 07:50:56'),
(21, 1, '520 Biaya Tenaga Kerja', 'expense', '5', '#f740f0', 1, '2019-07-21 07:22:45', '2019-07-21 07:53:58', NULL),
(22, 1, '531 Sewa Toko', 'expense', '5', '#22877b', 1, '2019-07-21 07:23:05', '2019-07-21 07:54:51', NULL),
(23, 1, '532 Biaya Perlengkapan Usaha', 'expense', '5', '#e3dd52', 1, '2019-07-21 07:23:18', '2019-07-21 07:53:48', NULL),
(24, 1, '510 Harga Pokok Penjualan (HPP)', 'income', '4', '#c99736', 1, '2019-07-21 07:23:36', '2019-07-21 07:52:57', NULL),
(25, 1, '534 Biaya Listrik, Telepon, & Air', 'expense', '5', '#85d2f2', 1, '2019-07-21 07:24:21', '2019-07-21 07:53:34', NULL),
(26, 1, '540 Biaya Transportasi', 'expense', '5', '#e3653d', 1, '2019-07-21 07:24:35', '2019-07-21 07:54:08', NULL),
(27, 6, 'Transfer ', 'other', NULL, '#605ca8', 1, '2019-07-23 15:09:46', '2019-07-23 15:09:46', NULL),
(28, 6, 'Deposit', 'income', NULL, '#f39c12', 1, '2019-07-23 15:09:46', '2019-07-23 15:09:46', NULL),
(29, 6, 'Penjualan', 'income', NULL, '#6da252', 1, '2019-07-23 15:09:46', '2019-07-23 15:09:46', NULL),
(30, 6, 'Lain ', 'expense', NULL, '#d2d6de', 1, '2019-07-23 15:09:46', '2019-07-23 15:09:46', NULL),
(31, 6, 'Umum', 'item', NULL, '#00c0ef', 1, '2019-07-23 15:09:46', '2019-07-23 15:09:46', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `1qu_companies`
--

CREATE TABLE `1qu_companies` (
  `id` int(10) UNSIGNED NOT NULL,
  `domain` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `1qu_companies`
--

INSERT INTO `1qu_companies` (`id`, `domain`, `enabled`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '', 1, '2019-07-11 04:27:03', '2019-07-11 04:27:03', NULL),
(2, 'zuem@akusoftapp.com', 1, '2019-07-11 14:37:39', '2019-07-14 22:35:58', '2019-07-14 22:35:58'),
(3, 'zuem@akusoftapp.com', 1, '2019-07-14 22:29:15', '2019-07-14 22:29:15', NULL),
(4, 'rakha.ramadhana@yahoo.com', 1, '2019-07-23 14:26:33', '2019-07-23 14:26:33', NULL),
(5, 'rakha', 1, '2019-07-23 15:08:19', '2019-07-23 15:08:19', NULL),
(6, 'rakha', 1, '2019-07-23 15:09:46', '2019-07-23 15:09:46', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `1qu_currencies`
--

CREATE TABLE `1qu_currencies` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` double(15,8) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `precision` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `symbol` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `symbol_first` int(11) NOT NULL DEFAULT 1,
  `decimal_mark` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thousands_separator` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `1qu_currencies`
--

INSERT INTO `1qu_currencies` (`id`, `company_id`, `name`, `code`, `rate`, `enabled`, `created_at`, `updated_at`, `deleted_at`, `precision`, `symbol`, `symbol_first`, `decimal_mark`, `thousands_separator`) VALUES
(1, 1, 'Dolar Amerika', 'USD', 1.00000000, 0, '2019-07-11 04:27:03', '2019-07-21 08:23:13', '2019-07-21 08:23:13', '2', '$', 1, '.', ','),
(2, 1, 'Euro', 'EUR', 1.25000000, 1, '2019-07-11 04:27:03', '2019-07-11 05:53:45', '2019-07-11 05:53:45', '2', '€', 1, ',', '.'),
(3, 1, 'Pound Inggris', 'GBP', 1.60000000, 1, '2019-07-11 04:27:03', '2019-07-11 05:57:35', '2019-07-11 05:57:35', '2', '£', 1, '.', ','),
(4, 1, 'Lira Turki', 'TRY', 0.80000000, 1, '2019-07-11 04:27:03', '2019-07-11 05:55:49', '2019-07-11 05:55:49', '2', '₺', 1, ',', '.'),
(5, 1, 'Indonesian Rupiah', 'IDR', 1.00000000, 1, '2019-07-11 05:44:52', '2019-07-11 05:44:52', NULL, '2', 'Rp', 1, ',', '.'),
(6, 2, 'Dolar Amerika', 'USD', 1.00000000, 1, '2019-07-11 14:37:39', '2019-07-14 22:35:58', '2019-07-14 22:35:58', '2', '$', 1, '.', ','),
(7, 2, 'Euro', 'EUR', 1.25000000, 1, '2019-07-11 14:37:39', '2019-07-14 22:35:58', '2019-07-14 22:35:58', '2', '€', 1, ',', '.'),
(8, 2, 'Pound Inggris', 'GBP', 1.60000000, 1, '2019-07-11 14:37:39', '2019-07-14 22:35:58', '2019-07-14 22:35:58', '2', '£', 1, '.', ','),
(9, 2, 'Lira Turki', 'TRY', 0.80000000, 1, '2019-07-11 14:37:39', '2019-07-14 22:35:58', '2019-07-14 22:35:58', '2', '₺', 1, ',', '.'),
(10, 3, 'Dolar Amerika', 'USD', 1.00000000, 1, '2019-07-14 22:29:15', '2019-07-14 16:51:54', '2019-07-14 16:51:54', '2', '$', 1, '.', ','),
(11, 3, 'Euro', 'EUR', 1.25000000, 1, '2019-07-14 22:29:15', '2019-07-14 16:50:42', '2019-07-14 16:50:42', '2', '€', 1, ',', '.'),
(12, 3, 'Pound Inggris', 'GBP', 1.60000000, 1, '2019-07-14 22:29:15', '2019-07-14 16:50:47', '2019-07-14 16:50:47', '2', '£', 1, '.', ','),
(13, 3, 'Lira Turki', 'TRY', 0.80000000, 1, '2019-07-14 22:29:15', '2019-07-14 16:50:52', '2019-07-14 16:50:52', '2', '₺', 1, ',', '.'),
(14, 3, 'Indonesian Rupiah', 'IDR', 1.00000000, 1, '2019-07-14 16:50:10', '2019-07-14 16:50:10', NULL, '2', 'Rp', 1, ',', '.'),
(15, 6, 'Dolar Amerika', 'USD', 1.00000000, 1, '2019-07-23 15:09:46', '2019-07-23 15:09:46', NULL, '2', '$', 1, '.', ','),
(16, 6, 'Euro', 'EUR', 1.25000000, 1, '2019-07-23 15:09:46', '2019-07-23 15:09:46', NULL, '2', '€', 1, ',', '.'),
(17, 6, 'Pound Inggris', 'GBP', 1.60000000, 1, '2019-07-23 15:09:46', '2019-07-23 15:09:46', NULL, '2', '£', 1, '.', ','),
(18, 6, 'Lira Turki', 'TRY', 0.80000000, 1, '2019-07-23 15:09:46', '2019-07-23 15:09:46', NULL, '2', '₺', 1, ',', '.');

-- --------------------------------------------------------

--
-- Table structure for table `1qu_customers`
--

CREATE TABLE `1qu_customers` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `reference` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `1qu_failed_jobs`
--

CREATE TABLE `1qu_failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `1qu_invoices`
--

CREATE TABLE `1qu_invoices` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `invoice_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_status_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `invoiced_at` datetime NOT NULL,
  `due_at` datetime NOT NULL,
  `amount` double(15,4) NOT NULL,
  `currency_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_rate` double(15,8) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_tax_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `category_id` int(11) NOT NULL DEFAULT 1,
  `parent_id` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `1qu_invoice_histories`
--

CREATE TABLE `1qu_invoice_histories` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `status_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notify` tinyint(1) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `1qu_invoice_items`
--

CREATE TABLE `1qu_invoice_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `item_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` double(7,2) NOT NULL,
  `price` double(15,4) NOT NULL,
  `total` double(15,4) NOT NULL,
  `tax` double(15,4) NOT NULL DEFAULT 0.0000,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `1qu_invoice_item_taxes`
--

CREATE TABLE `1qu_invoice_item_taxes` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `invoice_item_id` int(11) NOT NULL,
  `tax_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(15,4) NOT NULL DEFAULT 0.0000,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `1qu_invoice_payments`
--

CREATE TABLE `1qu_invoice_payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `paid_at` datetime NOT NULL,
  `amount` double(15,4) NOT NULL,
  `currency_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_rate` double(15,8) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_method` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `reconciled` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `1qu_invoice_statuses`
--

CREATE TABLE `1qu_invoice_statuses` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `1qu_invoice_statuses`
--

INSERT INTO `1qu_invoice_statuses` (`id`, `company_id`, `name`, `code`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Konsep', 'draft', '2019-07-11 04:27:03', '2019-07-11 04:27:03', NULL),
(2, 1, 'Mengirim', 'sent', '2019-07-11 04:27:03', '2019-07-11 04:27:03', NULL),
(3, 1, 'Lihat', 'viewed', '2019-07-11 04:27:03', '2019-07-11 04:27:03', NULL),
(4, 1, 'Disetujui', 'approved', '2019-07-11 04:27:03', '2019-07-11 04:27:03', NULL),
(5, 1, 'Sebagian', 'partial', '2019-07-11 04:27:03', '2019-07-11 04:27:03', NULL),
(6, 1, 'Dibayar', 'paid', '2019-07-11 04:27:03', '2019-07-11 04:27:03', NULL),
(7, 2, 'Konsep', 'draft', '2019-07-11 14:37:39', '2019-07-14 22:35:58', '2019-07-14 22:35:58'),
(8, 2, 'Mengirim', 'sent', '2019-07-11 14:37:39', '2019-07-14 22:35:58', '2019-07-14 22:35:58'),
(9, 2, 'Lihat', 'viewed', '2019-07-11 14:37:39', '2019-07-14 22:35:58', '2019-07-14 22:35:58'),
(10, 2, 'Disetujui', 'approved', '2019-07-11 14:37:39', '2019-07-14 22:35:58', '2019-07-14 22:35:58'),
(11, 2, 'Sebagian', 'partial', '2019-07-11 14:37:39', '2019-07-14 22:35:58', '2019-07-14 22:35:58'),
(12, 2, 'Dibayar', 'paid', '2019-07-11 14:37:39', '2019-07-14 22:35:58', '2019-07-14 22:35:58'),
(13, 3, 'Konsep', 'draft', '2019-07-14 22:29:15', '2019-07-14 22:29:15', NULL),
(14, 3, 'Mengirim', 'sent', '2019-07-14 22:29:15', '2019-07-14 22:29:15', NULL),
(15, 3, 'Lihat', 'viewed', '2019-07-14 22:29:15', '2019-07-14 22:29:15', NULL),
(16, 3, 'Disetujui', 'approved', '2019-07-14 22:29:15', '2019-07-14 22:29:15', NULL),
(17, 3, 'Sebagian', 'partial', '2019-07-14 22:29:15', '2019-07-14 22:29:15', NULL),
(18, 3, 'Dibayar', 'paid', '2019-07-14 22:29:15', '2019-07-14 22:29:15', NULL),
(19, 6, 'Konsep', 'draft', '2019-07-23 15:09:46', '2019-07-23 15:09:46', NULL),
(20, 6, 'Mengirim', 'sent', '2019-07-23 15:09:46', '2019-07-23 15:09:46', NULL),
(21, 6, 'Lihat', 'viewed', '2019-07-23 15:09:46', '2019-07-23 15:09:46', NULL),
(22, 6, 'Disetujui', 'approved', '2019-07-23 15:09:46', '2019-07-23 15:09:46', NULL),
(23, 6, 'Sebagian', 'partial', '2019-07-23 15:09:46', '2019-07-23 15:09:46', NULL),
(24, 6, 'Dibayar', 'paid', '2019-07-23 15:09:46', '2019-07-23 15:09:46', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `1qu_invoice_totals`
--

CREATE TABLE `1qu_invoice_totals` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(15,4) NOT NULL,
  `sort_order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `1qu_items`
--

CREATE TABLE `1qu_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sale_price` double(15,4) NOT NULL,
  `purchase_price` double(15,4) NOT NULL,
  `quantity` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `tax_id` int(11) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `1qu_items`
--

INSERT INTO `1qu_items` (`id`, `company_id`, `name`, `sku`, `description`, `sale_price`, `purchase_price`, `quantity`, `category_id`, `tax_id`, `enabled`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 3, 'Ikan Kuwe', '12345', 'ikan Kuwe 4 Ons', 60000.0000, 15000.0000, 1, 16, NULL, 1, '2019-07-14 18:09:02', '2019-07-14 18:14:53', NULL),
(2, 3, 'Ikan Kuwe 2 Ons', '12346', 'Ikan Kuwe 2 Ons plus Sambal Kecap', 30000.0000, 7500.0000, 1, 16, NULL, 1, '2019-07-14 18:11:14', '2019-07-14 18:14:35', NULL),
(3, 3, 'Ikan Kuwe', '999999', 'Ikan Kuwe 3 Ons', 45000.0000, 11250.0000, 1, 16, NULL, 1, '2019-07-14 18:14:15', '2019-07-14 18:14:15', NULL),
(4, 3, 'Ikan Kuwe', '12323', 'Ikan Kuwe 5 Ons', 75000.0000, 18750.0000, 1, 16, NULL, 1, '2019-07-14 18:15:54', '2019-07-14 18:15:54', NULL),
(5, 3, 'Ikan Kuwe', '1122113', 'Ikan Kuwe 6 Ons', 90000.0000, 22500.0000, 1, 16, NULL, 1, '2019-07-14 18:17:14', '2019-07-14 18:17:14', NULL),
(6, 3, 'Ikan Ayam ayam', '2341', 'Ikan Ayam ayam 3 Ons', 36000.0000, 9000.0000, 1, 16, NULL, 1, '2019-07-14 18:18:27', '2019-07-14 18:18:27', NULL),
(7, 3, 'Ikan Ayam ayam', '99807', 'Ikan Ayam ayam 4 Ons', 48000.0000, 12000.0000, 1, 16, NULL, 1, '2019-07-14 18:19:49', '2019-07-14 18:19:49', NULL),
(8, 3, 'Ikan Gurame', '2345', 'Ikan Gurame 4 Ons', 40000.0000, 10000.0000, 1, 16, NULL, 1, '2019-07-14 18:20:48', '2019-07-14 18:20:48', NULL),
(9, 3, 'Ikan Gurame', '66675', 'Ikan Gurame 5 Ons', 50000.0000, 12500.0000, 1, 16, NULL, 1, '2019-07-14 18:21:53', '2019-07-14 18:21:53', NULL),
(10, 3, 'Ikan Gurame', '48593', 'Ikan Gurame 6 Ons', 60000.0000, 15000.0000, 1, 16, NULL, 1, '2019-07-14 18:23:02', '2019-07-14 18:23:02', NULL),
(11, 3, 'Ikan Nila', '6547', NULL, 10000.0000, 4000.0000, 1, 17, NULL, 1, '2019-07-14 18:24:47', '2019-07-14 18:24:47', NULL),
(12, 3, 'Ikan Bawal', '35647', NULL, 15000.0000, 5000.0000, 1, 17, NULL, 1, '2019-07-14 18:25:44', '2019-07-14 18:25:44', NULL),
(13, 3, 'Nasi Putih', '77767', NULL, 4000.0000, 1000.0000, 1, 15, NULL, 1, '2019-07-14 18:26:29', '2019-07-14 18:26:29', NULL),
(14, 3, 'Teh Manis', '354356', 'Es Teh Manis atau Teh manis anget', 3000.0000, 1000.0000, 1, 15, NULL, 1, '2019-07-14 18:27:23', '2019-07-14 18:27:23', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `1qu_jobs`
--

CREATE TABLE `1qu_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `1qu_media`
--

CREATE TABLE `1qu_media` (
  `id` int(10) UNSIGNED NOT NULL,
  `disk` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `directory` varchar(68) COLLATE utf8mb4_unicode_ci NOT NULL,
  `filename` varchar(121) COLLATE utf8mb4_unicode_ci NOT NULL,
  `extension` varchar(28) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime_type` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `aggregate_type` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `1qu_mediables`
--

CREATE TABLE `1qu_mediables` (
  `media_id` int(10) UNSIGNED NOT NULL,
  `mediable_type` varchar(152) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mediable_id` int(10) UNSIGNED NOT NULL,
  `tag` varchar(68) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `1qu_migrations`
--

CREATE TABLE `1qu_migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `1qu_migrations`
--

INSERT INTO `1qu_migrations` (`id`, `migration`, `batch`) VALUES
(1, '2017_09_01_000000_create_accounts_table', 1),
(2, '2017_09_01_000000_create_bills_table', 1),
(3, '2017_09_01_000000_create_categories_table', 1),
(4, '2017_09_01_000000_create_companies_table', 1),
(5, '2017_09_01_000000_create_currencies_table', 1),
(6, '2017_09_01_000000_create_customers_table', 1),
(7, '2017_09_01_000000_create_invoices_table', 1),
(8, '2017_09_01_000000_create_items_table', 1),
(9, '2017_09_01_000000_create_jobs_table', 1),
(10, '2017_09_01_000000_create_modules_table', 1),
(11, '2017_09_01_000000_create_notifications_table', 1),
(12, '2017_09_01_000000_create_password_resets_table', 1),
(13, '2017_09_01_000000_create_payments_table', 1),
(14, '2017_09_01_000000_create_revenues_table', 1),
(15, '2017_09_01_000000_create_roles_table', 1),
(16, '2017_09_01_000000_create_sessions_table', 1),
(17, '2017_09_01_000000_create_settings_table', 1),
(18, '2017_09_01_000000_create_taxes_table', 1),
(19, '2017_09_01_000000_create_transfers_table', 1),
(20, '2017_09_01_000000_create_users_table', 1),
(21, '2017_09_01_000000_create_vendors_table', 1),
(22, '2017_09_19_delete_offline_file', 1),
(23, '2017_10_11_000000_create_bill_totals_table', 1),
(24, '2017_10_11_000000_create_invoice_totals_table', 1),
(25, '2017_11_16_000000_create_failed_jobs_table', 1),
(26, '2017_12_09_000000_add_currency_columns', 1),
(27, '2017_12_30_000000_create_mediable_tables', 1),
(28, '2018_01_03_000000_drop_attachment_column_bill_payments_table', 1),
(29, '2018_01_03_000000_drop_attachment_column_bills_table', 1),
(30, '2018_01_03_000000_drop_attachment_column_invoice_payments_table', 1),
(31, '2018_01_03_000000_drop_attachment_column_invoices_table', 1),
(32, '2018_01_03_000000_drop_attachment_column_payments_table', 1),
(33, '2018_01_03_000000_drop_attachment_column_revenues_table', 1),
(34, '2018_01_03_000000_drop_picture_column_items_table', 1),
(35, '2018_01_03_000000_drop_picture_column_users_table', 1),
(36, '2018_04_23_000000_add_category_column_invoices_bills', 1),
(37, '2018_04_26_000000_create_recurring_table', 1),
(38, '2018_04_30_000000_add_parent_column', 1),
(39, '2018_06_23_000000_modify_email_column', 1),
(40, '2018_06_30_000000_modify_enabled_column', 1),
(41, '2018_07_07_000000_modify_date_column', 1),
(42, '2018_09_26_000000_add_reference_column_customers', 1),
(43, '2018_09_26_000000_add_reference_column_vendors', 1),
(44, '2018_10_22_000000_create_bill_item_taxes_table', 1),
(45, '2018_10_22_000000_create_invoice_item_taxes_table', 1),
(46, '2018_10_27_000000_add_reconciled_column', 1),
(47, '2018_10_27_000000_create_reconciliations_table', 1),
(48, '2018_11_05_000000_add_tax_columns', 1),
(49, '2019_01_07_000000_drop_tax_id_column', 1),
(50, '2019_02_04_000000_modify_deleted_at_column_media_table', 1),
(51, '2020_01_01_000000_add_locale_column', 1);

-- --------------------------------------------------------

--
-- Table structure for table `1qu_modules`
--

CREATE TABLE `1qu_modules` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `alias` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `1qu_modules`
--

INSERT INTO `1qu_modules` (`id`, `company_id`, `alias`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'offlinepayment', 1, '2019-07-11 04:27:03', '2019-07-11 04:27:03', NULL),
(2, 1, 'paypalstandard', 1, '2019-07-11 04:27:03', '2019-07-11 04:27:03', NULL),
(3, 2, 'offlinepayment', 1, '2019-07-11 14:37:39', '2019-07-11 14:37:39', NULL),
(4, 2, 'paypalstandard', 1, '2019-07-11 14:37:39', '2019-07-11 14:37:39', NULL),
(5, 3, 'offlinepayment', 1, '2019-07-14 22:29:15', '2019-07-14 22:29:15', NULL),
(6, 3, 'paypalstandard', 1, '2019-07-14 22:29:15', '2019-07-14 22:29:15', NULL),
(7, 6, 'offlinepayment', 1, '2019-07-23 15:09:46', '2019-07-23 15:09:46', NULL),
(8, 6, 'paypalstandard', 1, '2019-07-23 15:09:46', '2019-07-23 15:09:46', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `1qu_module_histories`
--

CREATE TABLE `1qu_module_histories` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `module_id` int(11) NOT NULL,
  `category` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `1qu_module_histories`
--

INSERT INTO `1qu_module_histories` (`id`, `company_id`, `module_id`, `category`, `version`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, 'payment-gateway', '1.0.0', 'OfflinePayment terpasang', '2019-07-11 04:27:03', '2019-07-11 04:27:03', NULL),
(2, 1, 2, 'payment-gateway', '1.0.0', 'PaypalStandard terpasang', '2019-07-11 04:27:03', '2019-07-11 04:27:03', NULL),
(3, 2, 3, 'payment-gateway', '1.0.0', 'OfflinePayment terpasang', '2019-07-11 14:37:39', '2019-07-11 14:37:39', NULL),
(4, 2, 4, 'payment-gateway', '1.0.0', 'PaypalStandard terpasang', '2019-07-11 14:37:39', '2019-07-11 14:37:39', NULL),
(5, 3, 5, 'payment-gateway', '1.0.0', 'OfflinePayment terpasang', '2019-07-14 22:29:15', '2019-07-14 22:29:15', NULL),
(6, 3, 6, 'payment-gateway', '1.0.0', 'PaypalStandard terpasang', '2019-07-14 22:29:15', '2019-07-14 22:29:15', NULL),
(7, 6, 7, 'payment-gateway', '1.0.0', 'OfflinePayment terpasang', '2019-07-23 15:09:46', '2019-07-23 15:09:46', NULL),
(8, 6, 8, 'payment-gateway', '1.0.0', 'PaypalStandard terpasang', '2019-07-23 15:09:46', '2019-07-23 15:09:46', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `1qu_notifications`
--

CREATE TABLE `1qu_notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` int(10) UNSIGNED NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `1qu_password_resets`
--

CREATE TABLE `1qu_password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `1qu_payments`
--

CREATE TABLE `1qu_payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `paid_at` datetime NOT NULL,
  `amount` double(15,4) NOT NULL,
  `currency_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_rate` double(15,8) NOT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `payment_method` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `reconciled` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `1qu_payments`
--

INSERT INTO `1qu_payments` (`id`, `company_id`, `account_id`, `paid_at`, `amount`, `currency_code`, `currency_rate`, `vendor_id`, `description`, `category_id`, `payment_method`, `reference`, `created_at`, `updated_at`, `deleted_at`, `parent_id`, `reconciled`) VALUES
(1, 3, 3, '2019-06-17 01:37:21', 210000.0000, 'IDR', 1.00000000, NULL, 'Ikan Kuwe 2 Kg\r\nIkan Ayam2 2 kg\r\nIkan Gurame 2 kg\r\nIkan Nila 1 kg\r\nIkan Bawal 1 kg', 18, 'offlinepayment.cash.1', NULL, '2019-07-14 18:51:04', '2019-07-21 01:37:21', NULL, 0, 0),
(2, 1, 1, '2019-02-01 07:15:04', 2191000.0000, 'IDR', 1.00000000, NULL, 'pembelian barang dagang', 4, 'offlinepayment.cash.1', NULL, '2019-07-20 09:38:45', '2019-07-21 07:15:14', '2019-07-21 07:15:14', 0, 0),
(3, 1, 1, '2019-02-01 07:17:32', 435800.0000, 'IDR', 1.00000000, NULL, 'pembelian perlengkapan usaha', 4, 'offlinepayment.cash.1', NULL, '2019-07-20 09:39:47', '2019-07-21 07:17:32', NULL, 0, 0),
(4, 1, 1, '2019-02-01 07:18:02', 2191000.0000, 'IDR', 1.00000000, NULL, NULL, 4, 'offlinepayment.cash.1', NULL, '2019-07-21 07:15:40', '2019-07-21 07:18:02', NULL, 0, 0),
(5, 1, 1, '2019-07-23 14:48:18', 500000.0000, 'IDR', 1.00000000, NULL, NULL, 22, 'offlinepayment.cash.1', NULL, '2019-07-23 14:48:18', '2019-07-23 14:48:18', NULL, 0, 0),
(6, 1, 1, '2019-07-23 19:10:51', 10000.0000, 'IDR', 1.00000000, NULL, 'Beli Stok Aqua', 24, 'offlinepayment.cash.1', NULL, '2019-07-23 19:10:51', '2019-07-23 20:14:32', '2019-07-23 20:14:32', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `1qu_permissions`
--

CREATE TABLE `1qu_permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `1qu_permissions`
--

INSERT INTO `1qu_permissions` (`id`, `name`, `display_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'read-admin-panel', 'Read Admin Panel', 'Read Admin Panel', '2019-07-11 04:26:03', '2019-07-11 04:26:03'),
(2, 'read-api', 'Read Api', 'Read Api', '2019-07-11 04:26:03', '2019-07-11 04:26:03'),
(3, 'create-auth-users', 'Create Auth Users', 'Create Auth Users', '2019-07-11 04:26:03', '2019-07-11 04:26:03'),
(4, 'read-auth-users', 'Read Auth Users', 'Read Auth Users', '2019-07-11 04:26:03', '2019-07-11 04:26:03'),
(5, 'update-auth-users', 'Update Auth Users', 'Update Auth Users', '2019-07-11 04:26:03', '2019-07-11 04:26:03'),
(6, 'delete-auth-users', 'Delete Auth Users', 'Delete Auth Users', '2019-07-11 04:26:03', '2019-07-11 04:26:03'),
(7, 'create-auth-roles', 'Create Auth Roles', 'Create Auth Roles', '2019-07-11 04:26:03', '2019-07-11 04:26:03'),
(8, 'read-auth-roles', 'Read Auth Roles', 'Read Auth Roles', '2019-07-11 04:26:03', '2019-07-11 04:26:03'),
(9, 'update-auth-roles', 'Update Auth Roles', 'Update Auth Roles', '2019-07-11 04:26:03', '2019-07-11 04:26:03'),
(10, 'delete-auth-roles', 'Delete Auth Roles', 'Delete Auth Roles', '2019-07-11 04:26:03', '2019-07-11 04:26:03'),
(11, 'create-auth-permissions', 'Create Auth Permissions', 'Create Auth Permissions', '2019-07-11 04:26:03', '2019-07-11 04:26:03'),
(12, 'read-auth-permissions', 'Read Auth Permissions', 'Read Auth Permissions', '2019-07-11 04:26:03', '2019-07-11 04:26:03'),
(13, 'update-auth-permissions', 'Update Auth Permissions', 'Update Auth Permissions', '2019-07-11 04:26:03', '2019-07-11 04:26:03'),
(14, 'delete-auth-permissions', 'Delete Auth Permissions', 'Delete Auth Permissions', '2019-07-11 04:26:03', '2019-07-11 04:26:03'),
(15, 'read-auth-profile', 'Read Auth Profile', 'Read Auth Profile', '2019-07-11 04:26:03', '2019-07-11 04:26:03'),
(16, 'update-auth-profile', 'Update Auth Profile', 'Update Auth Profile', '2019-07-11 04:26:03', '2019-07-11 04:26:03'),
(17, 'create-common-companies', 'Create Common Companies', 'Create Common Companies', '2019-07-11 04:26:03', '2019-07-11 04:26:03'),
(18, 'read-common-companies', 'Read Common Companies', 'Read Common Companies', '2019-07-11 04:26:03', '2019-07-11 04:26:03'),
(19, 'update-common-companies', 'Update Common Companies', 'Update Common Companies', '2019-07-11 04:26:03', '2019-07-11 04:26:03'),
(20, 'delete-common-companies', 'Delete Common Companies', 'Delete Common Companies', '2019-07-11 04:26:03', '2019-07-11 04:26:03'),
(21, 'create-common-import', 'Create Common Import', 'Create Common Import', '2019-07-11 04:26:03', '2019-07-11 04:26:03'),
(22, 'create-common-items', 'Create Common Items', 'Create Common Items', '2019-07-11 04:26:03', '2019-07-11 04:26:03'),
(23, 'read-common-items', 'Read Common Items', 'Read Common Items', '2019-07-11 04:26:03', '2019-07-11 04:26:03'),
(24, 'update-common-items', 'Update Common Items', 'Update Common Items', '2019-07-11 04:26:04', '2019-07-11 04:26:04'),
(25, 'delete-common-items', 'Delete Common Items', 'Delete Common Items', '2019-07-11 04:26:04', '2019-07-11 04:26:04'),
(26, 'read-common-uploads', 'Read Common Uploads', 'Read Common Uploads', '2019-07-11 04:26:04', '2019-07-11 04:26:04'),
(27, 'delete-common-uploads', 'Delete Common Uploads', 'Delete Common Uploads', '2019-07-11 04:26:04', '2019-07-11 04:26:04'),
(28, 'create-common-notifications', 'Create Common Notifications', 'Create Common Notifications', '2019-07-11 04:26:04', '2019-07-11 04:26:04'),
(29, 'read-common-notifications', 'Read Common Notifications', 'Read Common Notifications', '2019-07-11 04:26:04', '2019-07-11 04:26:04'),
(30, 'update-common-notifications', 'Update Common Notifications', 'Update Common Notifications', '2019-07-11 04:26:04', '2019-07-11 04:26:04'),
(31, 'delete-common-notifications', 'Delete Common Notifications', 'Delete Common Notifications', '2019-07-11 04:26:04', '2019-07-11 04:26:04'),
(32, 'create-incomes-invoices', 'Create Incomes Invoices', 'Create Incomes Invoices', '2019-07-11 04:26:04', '2019-07-11 04:26:04'),
(33, 'read-incomes-invoices', 'Read Incomes Invoices', 'Read Incomes Invoices', '2019-07-11 04:26:04', '2019-07-11 04:26:04'),
(34, 'update-incomes-invoices', 'Update Incomes Invoices', 'Update Incomes Invoices', '2019-07-11 04:26:04', '2019-07-11 04:26:04'),
(35, 'delete-incomes-invoices', 'Delete Incomes Invoices', 'Delete Incomes Invoices', '2019-07-11 04:26:04', '2019-07-11 04:26:04'),
(36, 'create-incomes-revenues', 'Create Incomes Revenues', 'Create Incomes Revenues', '2019-07-11 04:26:04', '2019-07-11 04:26:04'),
(37, 'read-incomes-revenues', 'Read Incomes Revenues', 'Read Incomes Revenues', '2019-07-11 04:26:04', '2019-07-11 04:26:04'),
(38, 'update-incomes-revenues', 'Update Incomes Revenues', 'Update Incomes Revenues', '2019-07-11 04:26:04', '2019-07-11 04:26:04'),
(39, 'delete-incomes-revenues', 'Delete Incomes Revenues', 'Delete Incomes Revenues', '2019-07-11 04:26:05', '2019-07-11 04:26:05'),
(40, 'create-incomes-customers', 'Create Incomes Customers', 'Create Incomes Customers', '2019-07-11 04:26:05', '2019-07-11 04:26:05'),
(41, 'read-incomes-customers', 'Read Incomes Customers', 'Read Incomes Customers', '2019-07-11 04:26:05', '2019-07-11 04:26:05'),
(42, 'update-incomes-customers', 'Update Incomes Customers', 'Update Incomes Customers', '2019-07-11 04:26:05', '2019-07-11 04:26:05'),
(43, 'delete-incomes-customers', 'Delete Incomes Customers', 'Delete Incomes Customers', '2019-07-11 04:26:05', '2019-07-11 04:26:05'),
(44, 'create-expenses-bills', 'Create Expenses Bills', 'Create Expenses Bills', '2019-07-11 04:26:05', '2019-07-11 04:26:05'),
(45, 'read-expenses-bills', 'Read Expenses Bills', 'Read Expenses Bills', '2019-07-11 04:26:05', '2019-07-11 04:26:05'),
(46, 'update-expenses-bills', 'Update Expenses Bills', 'Update Expenses Bills', '2019-07-11 04:26:05', '2019-07-11 04:26:05'),
(47, 'delete-expenses-bills', 'Delete Expenses Bills', 'Delete Expenses Bills', '2019-07-11 04:26:05', '2019-07-11 04:26:05'),
(48, 'create-expenses-payments', 'Create Expenses Payments', 'Create Expenses Payments', '2019-07-11 04:26:05', '2019-07-11 04:26:05'),
(49, 'read-expenses-payments', 'Read Expenses Payments', 'Read Expenses Payments', '2019-07-11 04:26:05', '2019-07-11 04:26:05'),
(50, 'update-expenses-payments', 'Update Expenses Payments', 'Update Expenses Payments', '2019-07-11 04:26:05', '2019-07-11 04:26:05'),
(51, 'delete-expenses-payments', 'Delete Expenses Payments', 'Delete Expenses Payments', '2019-07-11 04:26:06', '2019-07-11 04:26:06'),
(52, 'create-expenses-vendors', 'Create Expenses Vendors', 'Create Expenses Vendors', '2019-07-11 04:26:06', '2019-07-11 04:26:06'),
(53, 'read-expenses-vendors', 'Read Expenses Vendors', 'Read Expenses Vendors', '2019-07-11 04:26:06', '2019-07-11 04:26:06'),
(54, 'update-expenses-vendors', 'Update Expenses Vendors', 'Update Expenses Vendors', '2019-07-11 04:26:06', '2019-07-11 04:26:06'),
(55, 'delete-expenses-vendors', 'Delete Expenses Vendors', 'Delete Expenses Vendors', '2019-07-11 04:26:06', '2019-07-11 04:26:06'),
(56, 'create-banking-accounts', 'Create Banking Accounts', 'Create Banking Accounts', '2019-07-11 04:26:06', '2019-07-11 04:26:06'),
(57, 'read-banking-accounts', 'Read Banking Accounts', 'Read Banking Accounts', '2019-07-11 04:26:06', '2019-07-11 04:26:06'),
(58, 'update-banking-accounts', 'Update Banking Accounts', 'Update Banking Accounts', '2019-07-11 04:26:06', '2019-07-11 04:26:06'),
(59, 'delete-banking-accounts', 'Delete Banking Accounts', 'Delete Banking Accounts', '2019-07-11 04:26:06', '2019-07-11 04:26:06'),
(60, 'create-banking-transfers', 'Create Banking Transfers', 'Create Banking Transfers', '2019-07-11 04:26:07', '2019-07-11 04:26:07'),
(61, 'read-banking-transfers', 'Read Banking Transfers', 'Read Banking Transfers', '2019-07-11 04:26:07', '2019-07-11 04:26:07'),
(62, 'update-banking-transfers', 'Update Banking Transfers', 'Update Banking Transfers', '2019-07-11 04:26:07', '2019-07-11 04:26:07'),
(63, 'delete-banking-transfers', 'Delete Banking Transfers', 'Delete Banking Transfers', '2019-07-11 04:26:07', '2019-07-11 04:26:07'),
(64, 'read-banking-transactions', 'Read Banking Transactions', 'Read Banking Transactions', '2019-07-11 04:26:07', '2019-07-11 04:26:07'),
(65, 'create-banking-reconciliations', 'Create Banking Reconciliations', 'Create Banking Reconciliations', '2019-07-11 04:26:07', '2019-07-11 04:26:07'),
(66, 'read-banking-reconciliations', 'Read Banking Reconciliations', 'Read Banking Reconciliations', '2019-07-11 04:26:07', '2019-07-11 04:26:07'),
(67, 'update-banking-reconciliations', 'Update Banking Reconciliations', 'Update Banking Reconciliations', '2019-07-11 04:26:07', '2019-07-11 04:26:07'),
(68, 'delete-banking-reconciliations', 'Delete Banking Reconciliations', 'Delete Banking Reconciliations', '2019-07-11 04:26:08', '2019-07-11 04:26:08'),
(69, 'create-settings-categories', 'Create Settings Categories', 'Create Settings Categories', '2019-07-11 04:26:08', '2019-07-11 04:26:08'),
(70, 'read-settings-categories', 'Read Settings Categories', 'Read Settings Categories', '2019-07-11 04:26:08', '2019-07-11 04:26:08'),
(71, 'update-settings-categories', 'Update Settings Categories', 'Update Settings Categories', '2019-07-11 04:26:08', '2019-07-11 04:26:08'),
(72, 'delete-settings-categories', 'Delete Settings Categories', 'Delete Settings Categories', '2019-07-11 04:26:08', '2019-07-11 04:26:08'),
(73, 'read-settings-settings', 'Read Settings Settings', 'Read Settings Settings', '2019-07-11 04:26:08', '2019-07-11 04:26:08'),
(74, 'update-settings-settings', 'Update Settings Settings', 'Update Settings Settings', '2019-07-11 04:26:09', '2019-07-11 04:26:09'),
(75, 'create-settings-taxes', 'Create Settings Taxes', 'Create Settings Taxes', '2019-07-11 04:26:09', '2019-07-11 04:26:09'),
(76, 'read-settings-taxes', 'Read Settings Taxes', 'Read Settings Taxes', '2019-07-11 04:26:09', '2019-07-11 04:26:09'),
(77, 'update-settings-taxes', 'Update Settings Taxes', 'Update Settings Taxes', '2019-07-11 04:26:09', '2019-07-11 04:26:09'),
(78, 'delete-settings-taxes', 'Delete Settings Taxes', 'Delete Settings Taxes', '2019-07-11 04:26:09', '2019-07-11 04:26:09'),
(79, 'create-settings-currencies', 'Create Settings Currencies', 'Create Settings Currencies', '2019-07-11 04:26:09', '2019-07-11 04:26:09'),
(80, 'read-settings-currencies', 'Read Settings Currencies', 'Read Settings Currencies', '2019-07-11 04:26:09', '2019-07-11 04:26:09'),
(81, 'update-settings-currencies', 'Update Settings Currencies', 'Update Settings Currencies', '2019-07-11 04:26:10', '2019-07-11 04:26:10'),
(82, 'delete-settings-currencies', 'Delete Settings Currencies', 'Delete Settings Currencies', '2019-07-11 04:26:10', '2019-07-11 04:26:10'),
(83, 'read-settings-modules', 'Read Settings Modules', 'Read Settings Modules', '2019-07-11 04:26:10', '2019-07-11 04:26:10'),
(84, 'update-settings-modules', 'Update Settings Modules', 'Update Settings Modules', '2019-07-11 04:26:10', '2019-07-11 04:26:10'),
(85, 'read-modules-home', 'Read Modules Home', 'Read Modules Home', '2019-07-11 04:26:10', '2019-07-11 04:26:10'),
(86, 'read-modules-tiles', 'Read Modules Tiles', 'Read Modules Tiles', '2019-07-11 04:26:10', '2019-07-11 04:26:10'),
(87, 'create-modules-item', 'Create Modules Item', 'Create Modules Item', '2019-07-11 04:26:11', '2019-07-11 04:26:11'),
(88, 'read-modules-item', 'Read Modules Item', 'Read Modules Item', '2019-07-11 04:26:11', '2019-07-11 04:26:11'),
(89, 'update-modules-item', 'Update Modules Item', 'Update Modules Item', '2019-07-11 04:26:16', '2019-07-11 04:26:16'),
(90, 'delete-modules-item', 'Delete Modules Item', 'Delete Modules Item', '2019-07-11 04:26:16', '2019-07-11 04:26:16'),
(91, 'create-modules-token', 'Create Modules Token', 'Create Modules Token', '2019-07-11 04:26:16', '2019-07-11 04:26:16'),
(92, 'update-modules-token', 'Update Modules Token', 'Update Modules Token', '2019-07-11 04:26:16', '2019-07-11 04:26:16'),
(93, 'read-modules-my', 'Read Modules My', 'Read Modules My', '2019-07-11 04:26:16', '2019-07-11 04:26:16'),
(94, 'read-install-updates', 'Read Install Updates', 'Read Install Updates', '2019-07-11 04:26:16', '2019-07-11 04:26:16'),
(95, 'update-install-updates', 'Update Install Updates', 'Update Install Updates', '2019-07-11 04:26:16', '2019-07-11 04:26:16'),
(96, 'read-notifications', 'Read Notifications', 'Read Notifications', '2019-07-11 04:26:16', '2019-07-11 04:26:16'),
(97, 'update-notifications', 'Update Notifications', 'Update Notifications', '2019-07-11 04:26:16', '2019-07-11 04:26:16'),
(98, 'read-reports-income-summary', 'Read Reports Income Summary', 'Read Reports Income Summary', '2019-07-11 04:26:16', '2019-07-11 04:26:16'),
(99, 'read-reports-expense-summary', 'Read Reports Expense Summary', 'Read Reports Expense Summary', '2019-07-11 04:26:16', '2019-07-11 04:26:16'),
(100, 'read-reports-income-expense-summary', 'Read Reports Income Expense Summary', 'Read Reports Income Expense Summary', '2019-07-11 04:26:16', '2019-07-11 04:26:16'),
(101, 'read-reports-profit-loss', 'Read Reports Profit Loss', 'Read Reports Profit Loss', '2019-07-11 04:26:16', '2019-07-11 04:26:16'),
(102, 'read-reports-tax-summary', 'Read Reports Tax Summary', 'Read Reports Tax Summary', '2019-07-11 04:26:16', '2019-07-11 04:26:16'),
(103, 'create-wizard-companies', 'Create Wizard Companies', 'Create Wizard Companies', '2019-07-11 04:26:16', '2019-07-11 04:26:16'),
(104, 'read-wizard-companies', 'Read Wizard Companies', 'Read Wizard Companies', '2019-07-11 04:26:16', '2019-07-11 04:26:16'),
(105, 'update-wizard-companies', 'Update Wizard Companies', 'Update Wizard Companies', '2019-07-11 04:26:16', '2019-07-11 04:26:16'),
(106, 'create-wizard-currencies', 'Create Wizard Currencies', 'Create Wizard Currencies', '2019-07-11 04:26:16', '2019-07-11 04:26:16'),
(107, 'read-wizard-currencies', 'Read Wizard Currencies', 'Read Wizard Currencies', '2019-07-11 04:26:16', '2019-07-11 04:26:16'),
(108, 'update-wizard-currencies', 'Update Wizard Currencies', 'Update Wizard Currencies', '2019-07-11 04:26:16', '2019-07-11 04:26:16'),
(109, 'create-wizard-taxes', 'Create Wizard Taxes', 'Create Wizard Taxes', '2019-07-11 04:26:16', '2019-07-11 04:26:16'),
(110, 'read-wizard-taxes', 'Read Wizard Taxes', 'Read Wizard Taxes', '2019-07-11 04:26:16', '2019-07-11 04:26:16'),
(111, 'update-wizard-taxes', 'Update Wizard Taxes', 'Update Wizard Taxes', '2019-07-11 04:26:16', '2019-07-11 04:26:16'),
(112, 'create-wizard-finish', 'Create Wizard Finish', 'Create Wizard Finish', '2019-07-11 04:26:16', '2019-07-11 04:26:16'),
(113, 'read-wizard-finish', 'Read Wizard Finish', 'Read Wizard Finish', '2019-07-11 04:26:16', '2019-07-11 04:26:16'),
(114, 'update-wizard-finish', 'Update Wizard Finish', 'Update Wizard Finish', '2019-07-11 04:26:16', '2019-07-11 04:26:16'),
(115, 'read-customer-panel', 'Read Customer Panel', 'Read Customer Panel', '2019-07-11 04:26:22', '2019-07-11 04:26:22'),
(116, 'read-customers-invoices', 'Read Customers Invoices', 'Read Customers Invoices', '2019-07-11 04:26:22', '2019-07-11 04:26:22'),
(117, 'update-customers-invoices', 'Update Customers Invoices', 'Update Customers Invoices', '2019-07-11 04:26:22', '2019-07-11 04:26:22'),
(118, 'read-customers-payments', 'Read Customers Payments', 'Read Customers Payments', '2019-07-11 04:26:22', '2019-07-11 04:26:22'),
(119, 'update-customers-payments', 'Update Customers Payments', 'Update Customers Payments', '2019-07-11 04:26:22', '2019-07-11 04:26:22'),
(120, 'read-customers-transactions', 'Read Customers Transactions', 'Read Customers Transactions', '2019-07-11 04:26:22', '2019-07-11 04:26:22'),
(121, 'read-customers-profile', 'Read Customers Profile', 'Read Customers Profile', '2019-07-11 04:26:22', '2019-07-11 04:26:22'),
(122, 'update-customers-profile', 'Update Customers Profile', 'Update Customers Profile', '2019-07-11 04:26:22', '2019-07-11 04:26:22');

-- --------------------------------------------------------

--
-- Table structure for table `1qu_reconciliations`
--

CREATE TABLE `1qu_reconciliations` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `started_at` datetime NOT NULL,
  `ended_at` datetime NOT NULL,
  `closing_balance` double(15,4) NOT NULL DEFAULT 0.0000,
  `reconciled` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `1qu_recurring`
--

CREATE TABLE `1qu_recurring` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `recurable_id` int(10) UNSIGNED NOT NULL,
  `recurable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `frequency` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `interval` int(11) NOT NULL DEFAULT 1,
  `started_at` datetime NOT NULL,
  `count` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `1qu_recurring`
--

INSERT INTO `1qu_recurring` (`id`, `company_id`, `recurable_id`, `recurable_type`, `frequency`, `interval`, `started_at`, `count`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 3, 1, 'App\\Models\\Expense\\Payment', 'weekly', 1, '2019-06-17 01:37:21', 4, '2019-07-14 18:51:04', '2019-07-21 01:37:21', NULL),
(2, 1, 33, 'App\\Models\\Income\\Revenue', 'daily', 1, '2019-02-01 09:37:06', 0, '2019-07-20 09:37:06', '2019-07-21 07:16:03', '2019-07-21 07:16:03');

-- --------------------------------------------------------

--
-- Table structure for table `1qu_revenues`
--

CREATE TABLE `1qu_revenues` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `paid_at` datetime NOT NULL,
  `amount` double(15,4) NOT NULL,
  `currency_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_rate` double(15,8) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `payment_method` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `reconciled` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `1qu_revenues`
--

INSERT INTO `1qu_revenues` (`id`, `company_id`, `account_id`, `paid_at`, `amount`, `currency_code`, `currency_rate`, `customer_id`, `description`, `category_id`, `payment_method`, `reference`, `created_at`, `updated_at`, `deleted_at`, `parent_id`, `reconciled`) VALUES
(2, 1, 1, '2019-07-14 22:37:43', 50000.0000, 'IDR', 1.00000000, NULL, NULL, 2, 'offlinepayment.cash.1', NULL, '2019-07-14 22:37:43', '2019-07-20 09:32:58', '2019-07-20 09:32:58', 0, 0),
(3, 3, 3, '2019-06-12 16:48:00', 40000.0000, 'USD', 1.00000000, NULL, 'Ikan Gurame 4 Ons', 13, 'offlinepayment.cash.1', NULL, '2019-07-14 16:48:00', '2019-07-14 16:51:30', '2019-07-14 16:51:30', 0, 0),
(4, 3, 3, '2019-06-12 16:53:24', 15000.0000, 'IDR', 1.00000000, NULL, 'Ikan Nila Bakar dengan Nasi', 13, 'offlinepayment.cash.1', NULL, '2019-07-14 16:53:24', '2019-07-14 16:53:24', NULL, 0, 0),
(5, 3, 3, '2019-06-12 16:55:31', 60000.0000, 'IDR', 1.00000000, NULL, 'Ikan Kuwe 4 Ons', 13, 'offlinepayment.cash.1', NULL, '2019-07-14 16:55:31', '2019-07-14 16:55:31', NULL, 0, 0),
(6, 3, 3, '2019-06-12 16:57:04', 80000.0000, 'IDR', 1.00000000, NULL, '2 Pcs Ikan Gurame 4 Ons', 13, 'offlinepayment.cash.1', NULL, '2019-07-14 16:57:04', '2019-07-14 16:57:04', NULL, 0, 0),
(7, 3, 3, '2019-06-12 16:58:54', 15000.0000, 'IDR', 1.00000000, NULL, 'Ikan Bawal', 13, 'offlinepayment.cash.1', NULL, '2019-07-14 16:58:54', '2019-07-14 16:58:54', NULL, 0, 0),
(8, 3, 3, '2019-06-13 17:00:24', 90000.0000, 'IDR', 1.00000000, NULL, 'Ikan Gurame 3 Ons, 3 Pcs', 13, 'offlinepayment.cash.1', NULL, '2019-07-14 17:00:24', '2019-07-14 17:00:24', NULL, 0, 0),
(9, 3, 3, '2019-06-13 17:02:42', 21000.0000, 'IDR', 1.00000000, NULL, '3 Pcs Teh Manis\r\n3 Pcs Nasi Putih', 13, 'offlinepayment.cash.1', NULL, '2019-07-14 17:02:42', '2019-07-14 17:02:42', NULL, 0, 0),
(10, 3, 3, '2019-06-13 17:45:53', 10000.0000, 'IDR', 1.00000000, NULL, 'Ikan Nila Bakar', 13, 'offlinepayment.cash.1', NULL, '2019-07-14 17:42:07', '2019-07-14 17:45:53', NULL, 0, 0),
(11, 3, 3, '2019-06-13 17:47:42', 30000.0000, 'IDR', 1.00000000, NULL, 'Ikan Kuwe 2 Ons Via Gofood', 13, 'offlinepayment.bank_transfer.2', NULL, '2019-07-14 17:47:21', '2019-07-14 17:47:42', NULL, 0, 0),
(12, 3, 3, '2019-06-13 17:48:57', 80000.0000, 'IDR', 1.00000000, NULL, 'Ikan Gurame 4 Ons 2 Pcs via Grabfood', 13, 'offlinepayment.bank_transfer.2', NULL, '2019-07-14 17:48:57', '2019-07-14 17:48:57', NULL, 0, 0),
(13, 3, 3, '2019-06-14 17:50:12', 15000.0000, 'IDR', 1.00000000, NULL, 'Ikan Nila dengan Nasi via Gofood', 13, 'offlinepayment.bank_transfer.2', NULL, '2019-07-14 17:50:12', '2019-07-14 17:50:12', NULL, 0, 0),
(14, 3, 3, '2019-06-14 17:51:32', 36000.0000, 'IDR', 1.00000000, NULL, 'Ikan ayam ayam 3 Ons', 13, 'offlinepayment.cash.1', NULL, '2019-07-14 17:51:32', '2019-07-14 17:51:32', NULL, 0, 0),
(15, 3, 3, '2019-06-14 17:52:45', 60000.0000, 'IDR', 1.00000000, NULL, 'Ikan Kuwe 2 Ons 2 Pcs via Gofood', 13, 'offlinepayment.bank_transfer.2', NULL, '2019-07-14 17:52:45', '2019-07-14 17:52:45', NULL, 0, 0),
(16, 3, 3, '2019-06-14 17:53:55', 30000.0000, 'IDR', 1.00000000, NULL, 'Ikan Nila dengan nasi 2 Pcs', 13, 'offlinepayment.cash.1', NULL, '2019-07-14 17:53:55', '2019-07-14 17:53:55', NULL, 0, 0),
(17, 3, 3, '2019-06-14 17:54:52', 6000.0000, 'IDR', 1.00000000, NULL, 'Teh Manis 2 Pcs', 13, 'offlinepayment.cash.1', NULL, '2019-07-14 17:54:52', '2019-07-14 17:54:52', NULL, 0, 0),
(18, 3, 3, '2019-06-14 17:56:49', 60000.0000, 'IDR', 1.00000000, NULL, 'Ikan Gurame 6 Ons', 13, 'offlinepayment.cash.1', NULL, '2019-07-14 17:56:49', '2019-07-14 17:56:49', NULL, 0, 0),
(19, 3, 3, '2019-06-15 17:58:44', 30000.0000, 'IDR', 1.00000000, NULL, 'Ikan kuwe 2 Ons via Gofood', 13, 'offlinepayment.bank_transfer.2', NULL, '2019-07-14 17:58:44', '2019-07-14 17:58:44', NULL, 0, 0),
(20, 3, 3, '2019-06-15 17:59:32', 20000.0000, 'IDR', 1.00000000, NULL, 'Ikan Nila 2 Pcs', 13, 'offlinepayment.cash.1', NULL, '2019-07-14 17:59:32', '2019-07-14 17:59:32', NULL, 0, 0),
(21, 3, 3, '2019-06-15 18:00:27', 75000.0000, 'IDR', 1.00000000, NULL, 'Ikan Kuwe 5 Ons', 13, 'offlinepayment.cash.1', NULL, '2019-07-14 18:00:27', '2019-07-14 18:00:27', NULL, 0, 0),
(22, 3, 3, '2019-06-15 18:02:08', 48000.0000, 'IDR', 1.00000000, NULL, 'Ikan Ayam ayam 4 Ons', 13, 'offlinepayment.cash.1', NULL, '2019-07-14 18:02:08', '2019-07-14 18:02:08', NULL, 0, 0),
(23, 3, 3, '2019-06-16 18:29:09', 3000.0000, 'IDR', 1.00000000, NULL, 'Ikan Nila Bakar 3 Pcs', 13, 'offlinepayment.cash.1', NULL, '2019-07-14 18:29:09', '2019-07-14 18:29:09', NULL, 0, 0),
(24, 3, 3, '2019-06-16 18:32:33', 60000.0000, 'IDR', 1.00000000, NULL, 'Ikan Gurame 6 Ons', 13, 'offlinepayment.cash.1', NULL, '2019-07-14 18:32:33', '2019-07-14 18:32:33', NULL, 0, 0),
(25, 3, 3, '2019-06-16 18:33:29', 45000.0000, 'IDR', 1.00000000, NULL, 'Ikan Kuwe 3 Ons Via Gofood', 13, 'offlinepayment.bank_transfer.2', NULL, '2019-07-14 18:33:29', '2019-07-14 18:33:29', NULL, 0, 0),
(26, 3, 3, '2019-06-17 18:37:37', 135000.0000, 'IDR', 1.00000000, NULL, 'Ikan Kuwe 3 Ons 3 Pcs Via Grabfood', 13, 'offlinepayment.bank_transfer.2', NULL, '2019-07-14 18:35:41', '2019-07-14 18:37:37', NULL, 0, 0),
(27, 3, 3, '2019-06-17 18:36:58', 96000.0000, 'IDR', 1.00000000, NULL, 'Ikan Ayam ayam 4 Ons 2 Pcs via Gofood', 13, 'offlinepayment.bank_transfer.2', NULL, '2019-07-14 18:36:58', '2019-07-14 18:36:58', NULL, 0, 0),
(28, 3, 3, '2019-06-17 18:38:36', 30000.0000, 'IDR', 1.00000000, NULL, 'Ikan BawaL Bakar 2 Pcs', 13, 'offlinepayment.cash.1', NULL, '2019-07-14 18:38:36', '2019-07-14 18:38:36', NULL, 0, 0),
(29, 3, 3, '2019-06-17 18:40:14', 10000.0000, 'IDR', 1.00000000, NULL, 'Ikan Nila Bakar', 13, 'offlinepayment.cash.1', NULL, '2019-07-14 18:40:14', '2019-07-14 18:40:14', NULL, 0, 0),
(30, 3, 3, '2019-06-18 18:42:05', 36000.0000, 'IDR', 1.00000000, NULL, 'Ikan Ayam ayam 3 Ons Via Gofood', 13, 'offlinepayment.bank_transfer.2', NULL, '2019-07-14 18:42:05', '2019-07-14 18:42:05', NULL, 0, 0),
(31, 3, 3, '2019-06-18 18:43:10', 30000.0000, 'IDR', 1.00000000, NULL, 'Ikan Kuwe 2 Ons via Gofood', 13, 'offlinepayment.cash.1', NULL, '2019-07-14 18:43:10', '2019-07-14 18:43:10', NULL, 0, 0),
(32, 1, 4, '2019-02-01 07:44:56', 25000000.0000, 'IDR', 1.00000000, NULL, 'saldo awal', 2, 'offlinepayment.cash.1', NULL, '2019-07-20 09:29:04', '2019-07-23 14:49:56', '2019-07-23 14:49:56', 0, 0),
(33, 1, 1, '2019-02-01 07:40:26', 8353600.0000, 'IDR', 1.00000000, NULL, 'pendapatan penjualan harian', 3, 'offlinepayment.cash.1', NULL, '2019-07-20 09:37:06', '2019-07-21 07:40:26', NULL, 0, 0),
(34, 1, 1, '2019-03-01 20:15:23', 10000.0000, 'IDR', 1.00000000, NULL, NULL, 24, 'offlinepayment.cash.1', NULL, '2019-07-23 20:14:55', '2019-07-23 20:15:23', NULL, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `1qu_roles`
--

CREATE TABLE `1qu_roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `1qu_roles`
--

INSERT INTO `1qu_roles` (`id`, `name`, `display_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Admin', 'Admin', '2019-07-11 04:26:03', '2019-07-11 04:26:03'),
(2, 'manager', 'Manager', 'Manager', '2019-07-11 04:26:16', '2019-07-11 04:26:16'),
(3, 'customer', 'Customer', 'Customer', '2019-07-11 04:26:22', '2019-07-11 04:26:22');

-- --------------------------------------------------------

--
-- Table structure for table `1qu_role_permissions`
--

CREATE TABLE `1qu_role_permissions` (
  `role_id` int(10) UNSIGNED NOT NULL,
  `permission_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `1qu_role_permissions`
--

INSERT INTO `1qu_role_permissions` (`role_id`, `permission_id`) VALUES
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
(1, 44),
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
(1, 73),
(1, 74),
(1, 75),
(1, 76),
(1, 77),
(1, 78),
(1, 79),
(1, 80),
(1, 81),
(1, 82),
(1, 83),
(1, 84),
(1, 85),
(1, 86),
(1, 87),
(1, 88),
(1, 89),
(1, 90),
(1, 91),
(1, 92),
(1, 93),
(1, 94),
(1, 95),
(1, 96),
(1, 97),
(1, 98),
(1, 99),
(1, 100),
(1, 101),
(1, 102),
(1, 103),
(1, 104),
(1, 105),
(1, 106),
(1, 107),
(1, 108),
(1, 109),
(1, 110),
(1, 111),
(1, 112),
(1, 113),
(1, 114),
(2, 1),
(2, 15),
(2, 16),
(2, 17),
(2, 18),
(2, 19),
(2, 20),
(2, 21),
(2, 22),
(2, 23),
(2, 24),
(2, 25),
(2, 26),
(2, 28),
(2, 29),
(2, 30),
(2, 31),
(2, 32),
(2, 33),
(2, 34),
(2, 35),
(2, 36),
(2, 37),
(2, 38),
(2, 39),
(2, 40),
(2, 41),
(2, 42),
(2, 43),
(2, 44),
(2, 45),
(2, 46),
(2, 47),
(2, 48),
(2, 49),
(2, 50),
(2, 51),
(2, 52),
(2, 53),
(2, 54),
(2, 55),
(2, 56),
(2, 57),
(2, 58),
(2, 59),
(2, 60),
(2, 61),
(2, 62),
(2, 63),
(2, 64),
(2, 65),
(2, 66),
(2, 67),
(2, 68),
(2, 69),
(2, 70),
(2, 71),
(2, 72),
(2, 73),
(2, 74),
(2, 75),
(2, 76),
(2, 77),
(2, 78),
(2, 79),
(2, 80),
(2, 81),
(2, 82),
(2, 83),
(2, 84),
(2, 94),
(2, 95),
(2, 96),
(2, 97),
(2, 98),
(2, 99),
(2, 100),
(2, 101),
(2, 102),
(3, 115),
(3, 116),
(3, 117),
(3, 118),
(3, 119),
(3, 120),
(3, 121),
(3, 122);

-- --------------------------------------------------------

--
-- Table structure for table `1qu_sessions`
--

CREATE TABLE `1qu_sessions` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `1qu_settings`
--

CREATE TABLE `1qu_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `1qu_settings`
--

INSERT INTO `1qu_settings` (`id`, `company_id`, `key`, `value`) VALUES
(1, 1, 'general.default_account', '1'),
(2, 1, 'general.financial_start', '01-01'),
(3, 1, 'general.timezone', 'Asia/Bangkok'),
(4, 1, 'general.date_format', 'd M Y'),
(5, 1, 'general.date_separator', 'space'),
(6, 1, 'general.percent_position', 'after'),
(7, 1, 'general.invoice_number_prefix', 'INV-'),
(8, 1, 'general.invoice_number_digit', '5'),
(9, 1, 'general.invoice_number_next', '1'),
(10, 1, 'general.default_payment_method', 'offlinepayment.cash.1'),
(11, 1, 'general.email_protocol', 'mail'),
(12, 1, 'general.email_sendmail_path', '/usr/sbin/sendmail -bs'),
(13, 1, 'general.send_invoice_reminder', '0'),
(14, 1, 'general.schedule_invoice_days', '1,3,5,10'),
(15, 1, 'general.send_bill_reminder', '0'),
(16, 1, 'general.schedule_bill_days', '10,5,3,1'),
(17, 1, 'general.send_item_reminder', '0'),
(18, 1, 'general.schedule_item_stocks', '3,5,7'),
(19, 1, 'general.schedule_time', '09:00'),
(20, 1, 'general.admin_theme', 'skin-black'),
(21, 1, 'general.list_limit', '25'),
(22, 1, 'general.use_gravatar', '0'),
(23, 1, 'general.session_handler', 'file'),
(24, 1, 'general.session_lifetime', '30'),
(25, 1, 'general.file_size', '2'),
(26, 1, 'general.file_types', 'pdf,jpeg,jpg,png'),
(27, 1, 'general.wizard', '1'),
(28, 1, 'general.invoice_item', 'settings.invoice.item'),
(29, 1, 'general.invoice_price', 'settings.invoice.price'),
(30, 1, 'general.invoice_quantity', 'settings.invoice.quantity'),
(31, 1, 'general.company_name', 'AKUSOFT V2'),
(32, 1, 'general.company_email', 'gunslingerarecool@gmail.com'),
(33, 1, 'general.default_currency', 'IDR'),
(34, 1, 'general.default_locale', 'id-ID'),
(35, 1, 'offlinepayment.methods', '[{\"code\":\"offlinepayment.cash.1\",\"name\":\"Cash\",\"order\":\"1\",\"description\":null},{\"code\":\"offlinepayment.bank_transfer.2\",\"name\":\"Bank Transfer\",\"order\":\"2\",\"description\":null}]'),
(36, 1, 'general.api_token', '03e7da53-37d4-43be-8ae9-ec30458540fe'),
(88, 3, 'general.default_account', '3'),
(89, 3, 'general.financial_start', '01-01'),
(90, 3, 'general.timezone', 'Europe/London'),
(91, 3, 'general.date_format', 'd M Y'),
(92, 3, 'general.date_separator', 'space'),
(93, 3, 'general.percent_position', 'after'),
(94, 3, 'general.invoice_number_prefix', 'INV-'),
(95, 3, 'general.invoice_number_digit', '5'),
(96, 3, 'general.invoice_number_next', '1'),
(97, 3, 'general.default_payment_method', 'offlinepayment.cash.1'),
(98, 3, 'general.email_protocol', 'mail'),
(99, 3, 'general.email_sendmail_path', '/usr/sbin/sendmail -bs'),
(100, 3, 'general.send_invoice_reminder', '0'),
(101, 3, 'general.schedule_invoice_days', '1,3,5,10'),
(102, 3, 'general.send_bill_reminder', '0'),
(103, 3, 'general.schedule_bill_days', '10,5,3,1'),
(104, 3, 'general.send_item_reminder', '0'),
(105, 3, 'general.schedule_item_stocks', '3,5,7'),
(106, 3, 'general.schedule_time', '09:00'),
(107, 3, 'general.admin_theme', 'skin-black'),
(108, 3, 'general.list_limit', '25'),
(109, 3, 'general.use_gravatar', '0'),
(110, 3, 'general.session_handler', 'file'),
(111, 3, 'general.session_lifetime', '30'),
(112, 3, 'general.file_size', '2'),
(113, 3, 'general.file_types', 'pdf,jpeg,jpg,png'),
(114, 3, 'general.wizard', '1'),
(115, 3, 'general.invoice_item', 'settings.invoice.item'),
(116, 3, 'general.invoice_price', 'settings.invoice.price'),
(117, 3, 'general.invoice_quantity', 'settings.invoice.quantity'),
(118, 3, 'general.company_name', 'Ikan Bakar Zuem'),
(119, 3, 'general.company_email', 'zuem@akusoftapp.com'),
(123, 3, 'offlinepayment.methods', '[{\"code\":\"offlinepayment.cash.1\",\"name\":\"Cash\",\"order\":\"1\",\"description\":null},{\"code\":\"offlinepayment.bank_transfer.2\",\"name\":\"Bank Transfer\",\"order\":\"2\",\"description\":null}]'),
(131, 3, 'general.default_currency', 'IDR'),
(132, 6, 'general.default_account', '14'),
(133, 6, 'general.financial_start', '01-01'),
(134, 6, 'general.timezone', 'Europe/London'),
(135, 6, 'general.date_format', 'd M Y'),
(136, 6, 'general.date_separator', 'space'),
(137, 6, 'general.percent_position', 'after'),
(138, 6, 'general.invoice_number_prefix', 'INV-'),
(139, 6, 'general.invoice_number_digit', '5'),
(140, 6, 'general.invoice_number_next', '1'),
(141, 6, 'general.default_payment_method', 'offlinepayment.cash.1'),
(142, 6, 'general.email_protocol', 'mail'),
(143, 6, 'general.email_sendmail_path', '/usr/sbin/sendmail -bs'),
(144, 6, 'general.send_invoice_reminder', '0'),
(145, 6, 'general.schedule_invoice_days', '1,3,5,10'),
(146, 6, 'general.send_bill_reminder', '0'),
(147, 6, 'general.schedule_bill_days', '10,5,3,1'),
(148, 6, 'general.send_item_reminder', '0'),
(149, 6, 'general.schedule_item_stocks', '3,5,7'),
(150, 6, 'general.schedule_time', '09:00'),
(151, 6, 'general.admin_theme', 'skin-green-light'),
(152, 6, 'general.list_limit', '25'),
(153, 6, 'general.use_gravatar', '0'),
(154, 6, 'general.session_handler', 'file'),
(155, 6, 'general.session_lifetime', '30'),
(156, 6, 'general.file_size', '2'),
(157, 6, 'general.file_types', 'pdf,jpeg,jpg,png'),
(158, 6, 'general.wizard', '1'),
(159, 6, 'general.invoice_item', 'settings.invoice.item'),
(160, 6, 'general.invoice_price', 'settings.invoice.price'),
(161, 6, 'general.invoice_quantity', 'settings.invoice.quantity'),
(162, 6, 'general.company_name', 'Rakha'),
(163, 6, 'general.company_email', 'rakha@mail.com'),
(164, 6, 'general.company_address', 'asdsss'),
(165, 6, 'general.default_currency', 'IDR'),
(167, 6, 'offlinepayment.methods', '[{\"code\":\"offlinepayment.cash.1\",\"name\":\"Cash\",\"order\":\"1\",\"description\":null},{\"code\":\"offlinepayment.bank_transfer.2\",\"name\":\"Bank Transfer\",\"order\":\"2\",\"description\":null}]');

-- --------------------------------------------------------

--
-- Table structure for table `1qu_taxes`
--

CREATE TABLE `1qu_taxes` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` double(15,4) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'normal'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `1qu_transfers`
--

CREATE TABLE `1qu_transfers` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `payment_id` int(11) NOT NULL,
  `revenue_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `1qu_users`
--

CREATE TABLE `1qu_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_logged_in_at` timestamp NULL DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'id-ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `1qu_users`
--

INSERT INTO `1qu_users` (`id`, `name`, `email`, `password`, `remember_token`, `last_logged_in_at`, `enabled`, `created_at`, `updated_at`, `deleted_at`, `locale`) VALUES
(1, 'Administrator', 'admin@akusoftapp.com', '$2y$10$n1lNN07hTMxYBeknAnh7le6kXKZyhaq3sLlIRlB/kWMxiyNUYctmC', 'ZBoEoMe27SUdQha17MwcmQn0TBgGs89jR0GCvD9HdMM6bJDHqWTFzUtnrX4s', '2019-07-26 07:12:49', 1, '2019-07-11 04:27:03', '2019-07-26 07:12:49', NULL, 'id-ID'),
(2, 'Zuem', 'zuem@akusoftapp.com', '$2y$10$f55xm0jNMniX7/VBsWn7buyDOH.3fPqGddvfRbUFuOCTc2eryEPSa', 'YwafVDdmKrRUHjekFG3fy4aToOiO0kAGya9vs2jRubzxmNl2HilLkkmuPMF4', '2019-07-22 08:32:29', 1, '2019-07-11 06:18:17', '2019-07-22 08:32:29', NULL, 'id-ID'),
(3, 'Test', 'test@test.com', '$2y$10$7znkvaNPTZvrt6ugbOK89edlNZ2oh5Pu0HBoSiK1y8LuX2UzyzFWG', NULL, NULL, 1, '2019-07-11 16:45:56', '2019-07-14 22:19:37', '2019-07-14 22:19:37', 'id-ID'),
(4, 'Zuem', 'zuem@mail.com', '$2y$10$nJSeFhWUjvzmmKRyF3wdDu6.ZNiX.EHv/XSmC.3bHAJ6IojEI3WrC', 'OHYQhylQEez0YQW5YzO0bncu28ZnA7si6g4pxWCWbBxTa7yJ3pHD4dPSYpsM', '2019-07-14 15:33:45', 1, '2019-07-14 22:20:28', '2019-07-14 22:36:24', '2019-07-14 22:36:24', 'id-ID'),
(5, 'Rakha Ramadhana', 'rakha.ramadhana@yahoo.com', '$2y$10$Om.9C8qMFR1ejKk9N56ng.TrmnV7vBhrSvWb066XOlSJ02NDD.MuK', 'XTF74vzckzZT2z2Wx8mPpyNjEw9bJCYbhuXQhfhIyHkX67hwjEqpgm37cLXM', '2019-07-23 08:12:10', 1, '2019-07-23 14:25:37', '2019-07-23 08:12:10', NULL, 'id-ID');

-- --------------------------------------------------------

--
-- Table structure for table `1qu_user_companies`
--

CREATE TABLE `1qu_user_companies` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `1qu_user_companies`
--

INSERT INTO `1qu_user_companies` (`user_id`, `company_id`, `user_type`) VALUES
(1, 1, 'users'),
(1, 3, 'users'),
(1, 6, 'users'),
(2, 3, 'users'),
(3, 1, 'users'),
(4, 3, 'users'),
(5, 6, 'users');

-- --------------------------------------------------------

--
-- Table structure for table `1qu_user_permissions`
--

CREATE TABLE `1qu_user_permissions` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `permission_id` int(10) UNSIGNED NOT NULL,
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `1qu_user_roles`
--

CREATE TABLE `1qu_user_roles` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `1qu_user_roles`
--

INSERT INTO `1qu_user_roles` (`user_id`, `role_id`, `user_type`) VALUES
(1, 1, 'users'),
(2, 2, 'users'),
(3, 2, 'users'),
(4, 2, 'users'),
(5, 2, 'users');

-- --------------------------------------------------------

--
-- Table structure for table `1qu_vendors`
--

CREATE TABLE `1qu_vendors` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `reference` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `1qu_vendors`
--

INSERT INTO `1qu_vendors` (`id`, `company_id`, `user_id`, `name`, `email`, `tax_number`, `phone`, `address`, `website`, `currency_code`, `enabled`, `created_at`, `updated_at`, `deleted_at`, `reference`) VALUES
(1, 3, NULL, 'Kendar Adi', NULL, NULL, NULL, NULL, NULL, 'IDR', 1, '2019-07-14 18:45:44', '2019-07-14 18:45:44', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `1qu_accounts`
--
ALTER TABLE `1qu_accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `accounts_company_id_index` (`company_id`);

--
-- Indexes for table `1qu_bills`
--
ALTER TABLE `1qu_bills`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `bills_company_id_bill_number_deleted_at_unique` (`company_id`,`bill_number`,`deleted_at`),
  ADD KEY `bills_company_id_index` (`company_id`);

--
-- Indexes for table `1qu_bill_histories`
--
ALTER TABLE `1qu_bill_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bill_histories_company_id_index` (`company_id`);

--
-- Indexes for table `1qu_bill_items`
--
ALTER TABLE `1qu_bill_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bill_items_company_id_index` (`company_id`);

--
-- Indexes for table `1qu_bill_item_taxes`
--
ALTER TABLE `1qu_bill_item_taxes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bill_item_taxes_company_id_index` (`company_id`);

--
-- Indexes for table `1qu_bill_payments`
--
ALTER TABLE `1qu_bill_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bill_payments_company_id_index` (`company_id`);

--
-- Indexes for table `1qu_bill_statuses`
--
ALTER TABLE `1qu_bill_statuses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bill_statuses_company_id_index` (`company_id`);

--
-- Indexes for table `1qu_bill_totals`
--
ALTER TABLE `1qu_bill_totals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bill_totals_company_id_index` (`company_id`);

--
-- Indexes for table `1qu_categories`
--
ALTER TABLE `1qu_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_company_id_index` (`company_id`);

--
-- Indexes for table `1qu_companies`
--
ALTER TABLE `1qu_companies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `1qu_currencies`
--
ALTER TABLE `1qu_currencies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `currencies_company_id_code_deleted_at_unique` (`company_id`,`code`,`deleted_at`),
  ADD KEY `currencies_company_id_index` (`company_id`);

--
-- Indexes for table `1qu_customers`
--
ALTER TABLE `1qu_customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `customers_company_id_email_deleted_at_unique` (`company_id`,`email`,`deleted_at`),
  ADD KEY `customers_company_id_index` (`company_id`);

--
-- Indexes for table `1qu_failed_jobs`
--
ALTER TABLE `1qu_failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `1qu_invoices`
--
ALTER TABLE `1qu_invoices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `invoices_company_id_invoice_number_deleted_at_unique` (`company_id`,`invoice_number`,`deleted_at`),
  ADD KEY `invoices_company_id_index` (`company_id`);

--
-- Indexes for table `1qu_invoice_histories`
--
ALTER TABLE `1qu_invoice_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_histories_company_id_index` (`company_id`);

--
-- Indexes for table `1qu_invoice_items`
--
ALTER TABLE `1qu_invoice_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_items_company_id_index` (`company_id`);

--
-- Indexes for table `1qu_invoice_item_taxes`
--
ALTER TABLE `1qu_invoice_item_taxes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_item_taxes_company_id_index` (`company_id`);

--
-- Indexes for table `1qu_invoice_payments`
--
ALTER TABLE `1qu_invoice_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_payments_company_id_index` (`company_id`);

--
-- Indexes for table `1qu_invoice_statuses`
--
ALTER TABLE `1qu_invoice_statuses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_statuses_company_id_index` (`company_id`);

--
-- Indexes for table `1qu_invoice_totals`
--
ALTER TABLE `1qu_invoice_totals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_totals_company_id_index` (`company_id`);

--
-- Indexes for table `1qu_items`
--
ALTER TABLE `1qu_items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `items_company_id_sku_deleted_at_unique` (`company_id`,`sku`,`deleted_at`),
  ADD KEY `items_company_id_index` (`company_id`);

--
-- Indexes for table `1qu_jobs`
--
ALTER TABLE `1qu_jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_reserved_at_index` (`queue`,`reserved_at`);

--
-- Indexes for table `1qu_media`
--
ALTER TABLE `1qu_media`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `media_disk_directory_filename_extension_deleted_at_unique` (`disk`,`directory`,`filename`,`extension`,`deleted_at`),
  ADD KEY `media_disk_directory_index` (`disk`,`directory`),
  ADD KEY `media_aggregate_type_index` (`aggregate_type`);

--
-- Indexes for table `1qu_mediables`
--
ALTER TABLE `1qu_mediables`
  ADD PRIMARY KEY (`media_id`,`mediable_type`,`mediable_id`,`tag`),
  ADD KEY `mediables_mediable_id_mediable_type_index` (`mediable_id`,`mediable_type`),
  ADD KEY `mediables_tag_index` (`tag`),
  ADD KEY `mediables_order_index` (`order`);

--
-- Indexes for table `1qu_migrations`
--
ALTER TABLE `1qu_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `1qu_modules`
--
ALTER TABLE `1qu_modules`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `modules_company_id_alias_deleted_at_unique` (`company_id`,`alias`,`deleted_at`),
  ADD KEY `modules_company_id_index` (`company_id`);

--
-- Indexes for table `1qu_module_histories`
--
ALTER TABLE `1qu_module_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `module_histories_company_id_module_id_index` (`company_id`,`module_id`);

--
-- Indexes for table `1qu_notifications`
--
ALTER TABLE `1qu_notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_id_notifiable_type_index` (`notifiable_id`,`notifiable_type`);

--
-- Indexes for table `1qu_password_resets`
--
ALTER TABLE `1qu_password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `1qu_payments`
--
ALTER TABLE `1qu_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payments_company_id_index` (`company_id`);

--
-- Indexes for table `1qu_permissions`
--
ALTER TABLE `1qu_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_unique` (`name`);

--
-- Indexes for table `1qu_reconciliations`
--
ALTER TABLE `1qu_reconciliations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reconciliations_company_id_index` (`company_id`);

--
-- Indexes for table `1qu_recurring`
--
ALTER TABLE `1qu_recurring`
  ADD PRIMARY KEY (`id`),
  ADD KEY `recurring_recurable_id_recurable_type_index` (`recurable_id`,`recurable_type`);

--
-- Indexes for table `1qu_revenues`
--
ALTER TABLE `1qu_revenues`
  ADD PRIMARY KEY (`id`),
  ADD KEY `revenues_company_id_index` (`company_id`);

--
-- Indexes for table `1qu_roles`
--
ALTER TABLE `1qu_roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indexes for table `1qu_role_permissions`
--
ALTER TABLE `1qu_role_permissions`
  ADD PRIMARY KEY (`role_id`,`permission_id`),
  ADD KEY `role_permissions_permission_id_foreign` (`permission_id`);

--
-- Indexes for table `1qu_sessions`
--
ALTER TABLE `1qu_sessions`
  ADD UNIQUE KEY `sessions_id_unique` (`id`);

--
-- Indexes for table `1qu_settings`
--
ALTER TABLE `1qu_settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_company_id_key_unique` (`company_id`,`key`),
  ADD KEY `settings_company_id_index` (`company_id`);

--
-- Indexes for table `1qu_taxes`
--
ALTER TABLE `1qu_taxes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `taxes_company_id_index` (`company_id`);

--
-- Indexes for table `1qu_transfers`
--
ALTER TABLE `1qu_transfers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transfers_company_id_index` (`company_id`);

--
-- Indexes for table `1qu_users`
--
ALTER TABLE `1qu_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_deleted_at_unique` (`email`,`deleted_at`);

--
-- Indexes for table `1qu_user_companies`
--
ALTER TABLE `1qu_user_companies`
  ADD PRIMARY KEY (`user_id`,`company_id`,`user_type`);

--
-- Indexes for table `1qu_user_permissions`
--
ALTER TABLE `1qu_user_permissions`
  ADD PRIMARY KEY (`user_id`,`permission_id`,`user_type`),
  ADD KEY `user_permissions_permission_id_foreign` (`permission_id`);

--
-- Indexes for table `1qu_user_roles`
--
ALTER TABLE `1qu_user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`,`user_type`),
  ADD KEY `user_roles_role_id_foreign` (`role_id`);

--
-- Indexes for table `1qu_vendors`
--
ALTER TABLE `1qu_vendors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `vendors_company_id_email_deleted_at_unique` (`company_id`,`email`,`deleted_at`),
  ADD KEY `vendors_company_id_index` (`company_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `1qu_accounts`
--
ALTER TABLE `1qu_accounts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `1qu_bills`
--
ALTER TABLE `1qu_bills`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `1qu_bill_histories`
--
ALTER TABLE `1qu_bill_histories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `1qu_bill_items`
--
ALTER TABLE `1qu_bill_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `1qu_bill_item_taxes`
--
ALTER TABLE `1qu_bill_item_taxes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `1qu_bill_payments`
--
ALTER TABLE `1qu_bill_payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `1qu_bill_statuses`
--
ALTER TABLE `1qu_bill_statuses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `1qu_bill_totals`
--
ALTER TABLE `1qu_bill_totals`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `1qu_categories`
--
ALTER TABLE `1qu_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `1qu_companies`
--
ALTER TABLE `1qu_companies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `1qu_currencies`
--
ALTER TABLE `1qu_currencies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `1qu_customers`
--
ALTER TABLE `1qu_customers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `1qu_failed_jobs`
--
ALTER TABLE `1qu_failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `1qu_invoices`
--
ALTER TABLE `1qu_invoices`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `1qu_invoice_histories`
--
ALTER TABLE `1qu_invoice_histories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `1qu_invoice_items`
--
ALTER TABLE `1qu_invoice_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `1qu_invoice_item_taxes`
--
ALTER TABLE `1qu_invoice_item_taxes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `1qu_invoice_payments`
--
ALTER TABLE `1qu_invoice_payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `1qu_invoice_statuses`
--
ALTER TABLE `1qu_invoice_statuses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `1qu_invoice_totals`
--
ALTER TABLE `1qu_invoice_totals`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `1qu_items`
--
ALTER TABLE `1qu_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `1qu_jobs`
--
ALTER TABLE `1qu_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `1qu_media`
--
ALTER TABLE `1qu_media`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `1qu_migrations`
--
ALTER TABLE `1qu_migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `1qu_modules`
--
ALTER TABLE `1qu_modules`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `1qu_module_histories`
--
ALTER TABLE `1qu_module_histories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `1qu_payments`
--
ALTER TABLE `1qu_payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `1qu_permissions`
--
ALTER TABLE `1qu_permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=123;

--
-- AUTO_INCREMENT for table `1qu_reconciliations`
--
ALTER TABLE `1qu_reconciliations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `1qu_recurring`
--
ALTER TABLE `1qu_recurring`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `1qu_revenues`
--
ALTER TABLE `1qu_revenues`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `1qu_roles`
--
ALTER TABLE `1qu_roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `1qu_settings`
--
ALTER TABLE `1qu_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=168;

--
-- AUTO_INCREMENT for table `1qu_taxes`
--
ALTER TABLE `1qu_taxes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `1qu_transfers`
--
ALTER TABLE `1qu_transfers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `1qu_users`
--
ALTER TABLE `1qu_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `1qu_vendors`
--
ALTER TABLE `1qu_vendors`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `1qu_mediables`
--
ALTER TABLE `1qu_mediables`
  ADD CONSTRAINT `mediables_media_id_foreign` FOREIGN KEY (`media_id`) REFERENCES `1qu_media` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `1qu_role_permissions`
--
ALTER TABLE `1qu_role_permissions`
  ADD CONSTRAINT `role_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `1qu_permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `role_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `1qu_roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `1qu_user_permissions`
--
ALTER TABLE `1qu_user_permissions`
  ADD CONSTRAINT `user_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `1qu_permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `1qu_user_roles`
--
ALTER TABLE `1qu_user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `1qu_roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
