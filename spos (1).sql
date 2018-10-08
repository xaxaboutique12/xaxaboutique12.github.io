-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 05, 2018 at 03:25 PM
-- Server version: 10.1.26-MariaDB
-- PHP Version: 7.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `spos`
--

-- --------------------------------------------------------

--
-- Table structure for table `tec_categories`
--

CREATE TABLE `tec_categories` (
  `id` int(11) NOT NULL,
  `code` varchar(20) NOT NULL,
  `name` varchar(55) NOT NULL,
  `image` varchar(100) DEFAULT 'no_image.png'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tec_categories`
--

INSERT INTO `tec_categories` (`id`, `code`, `name`, `image`) VALUES
(1, 'V01', 'VAPE', 'no_image.png'),
(2, 'VP01', 'Vape Parts', 'no_image.png'),
(3, 'VJ01', 'Vape Juice', 'no_image.png'),
(4, 'MW01', 'Men\'s Wear', 'no_image.png'),
(5, 'WW01', 'Women\'s Wear', 'no_image.png'),
(6, 'B01', 'Bags', 'no_image.png');

-- --------------------------------------------------------

--
-- Table structure for table `tec_combo_items`
--

CREATE TABLE `tec_combo_items` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `item_code` varchar(20) NOT NULL,
  `quantity` decimal(12,4) NOT NULL,
  `price` decimal(25,4) DEFAULT NULL,
  `cost` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tec_customers`
--

CREATE TABLE `tec_customers` (
  `id` int(11) NOT NULL,
  `name` varchar(55) NOT NULL,
  `cf1` varchar(255) NOT NULL,
  `cf2` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `store_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tec_customers`
--

INSERT INTO `tec_customers` (`id`, `name`, `cf1`, `cf2`, `phone`, `email`, `store_id`) VALUES
(1, 'Walk-in Client', '', '', '012345678', 'customer@tecdiary.com', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tec_expenses`
--

CREATE TABLE `tec_expenses` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reference` varchar(50) NOT NULL,
  `amount` decimal(25,4) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `created_by` varchar(55) NOT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `store_id` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tec_gift_cards`
--

CREATE TABLE `tec_gift_cards` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `card_no` varchar(20) NOT NULL,
  `value` decimal(25,4) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `balance` decimal(25,4) NOT NULL,
  `expiry` date DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tec_groups`
--

CREATE TABLE `tec_groups` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tec_groups`
--

INSERT INTO `tec_groups` (`id`, `name`, `description`) VALUES
(1, 'admin', 'Administrator'),
(2, 'staff', 'Staff');

-- --------------------------------------------------------

--
-- Table structure for table `tec_login_attempts`
--

CREATE TABLE `tec_login_attempts` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `ip_address` varbinary(16) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tec_payments`
--

CREATE TABLE `tec_payments` (
  `id` int(11) NOT NULL,
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `sale_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `transaction_id` varchar(50) DEFAULT NULL,
  `paid_by` varchar(20) NOT NULL,
  `cheque_no` varchar(20) DEFAULT NULL,
  `cc_no` varchar(20) DEFAULT NULL,
  `cc_holder` varchar(25) DEFAULT NULL,
  `cc_month` varchar(2) DEFAULT NULL,
  `cc_year` varchar(4) DEFAULT NULL,
  `cc_type` varchar(20) DEFAULT NULL,
  `amount` decimal(25,4) NOT NULL,
  `currency` varchar(3) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `pos_paid` decimal(25,4) DEFAULT '0.0000',
  `pos_balance` decimal(25,4) DEFAULT '0.0000',
  `gc_no` varchar(20) DEFAULT NULL,
  `reference` varchar(50) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `store_id` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tec_payments`
--

INSERT INTO `tec_payments` (`id`, `date`, `sale_id`, `customer_id`, `transaction_id`, `paid_by`, `cheque_no`, `cc_no`, `cc_holder`, `cc_month`, `cc_year`, `cc_type`, `amount`, `currency`, `created_by`, `attachment`, `note`, `pos_paid`, `pos_balance`, `gc_no`, `reference`, `updated_by`, `updated_at`, `store_id`) VALUES
(1, '2018-10-05 15:33:06', 1, 1, NULL, 'cash', '', '', '', '', '', '', '2520.0000', NULL, 2, NULL, '', '3000.0000', '480.0000', '', NULL, NULL, NULL, 1),
(2, '2018-10-05 20:24:15', 2, 1, NULL, 'cash', '', '', '', '', '', '', '1260.0000', NULL, 2, NULL, '', '1260.0000', '0.0000', '', NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tec_printers`
--

CREATE TABLE `tec_printers` (
  `id` int(11) NOT NULL,
  `title` varchar(55) NOT NULL,
  `type` varchar(25) NOT NULL,
  `profile` varchar(25) NOT NULL,
  `char_per_line` tinyint(3) UNSIGNED DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `ip_address` varbinary(45) DEFAULT NULL,
  `port` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tec_printers`
--

INSERT INTO `tec_printers` (`id`, `title`, `type`, `profile`, `char_per_line`, `path`, `ip_address`, `port`) VALUES
(1, 'XPrinter', 'network', 'default', 45, '', 0x3139322e3136382e312e323030, '9100');

-- --------------------------------------------------------

--
-- Table structure for table `tec_products`
--

CREATE TABLE `tec_products` (
  `id` int(11) NOT NULL,
  `code` varchar(50) NOT NULL,
  `name` char(255) NOT NULL,
  `category_id` int(11) NOT NULL DEFAULT '1',
  `price` decimal(25,4) NOT NULL,
  `image` varchar(255) DEFAULT 'no_image.png',
  `tax` varchar(20) DEFAULT NULL,
  `cost` decimal(25,4) DEFAULT NULL,
  `tax_method` tinyint(1) DEFAULT '1',
  `quantity` decimal(15,4) DEFAULT '0.0000',
  `barcode_symbology` varchar(20) NOT NULL DEFAULT 'code39',
  `type` varchar(20) NOT NULL DEFAULT 'standard',
  `details` text,
  `alert_quantity` decimal(10,4) DEFAULT '0.0000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tec_products`
--

INSERT INTO `tec_products` (`id`, `code`, `name`, `category_id`, `price`, `image`, `tax`, `cost`, `tax_method`, `quantity`, `barcode_symbology`, `type`, `details`, `alert_quantity`) VALUES
(1, '412414', 'Athena', 1, '1200.0000', 'no_image.png', '12', '1200.0000', 0, '0.0000', 'code25', 'standard', '', '5.0000');

-- --------------------------------------------------------

--
-- Table structure for table `tec_product_store_qty`
--

CREATE TABLE `tec_product_store_qty` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `quantity` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `price` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tec_product_store_qty`
--

INSERT INTO `tec_product_store_qty` (`id`, `product_id`, `store_id`, `quantity`, `price`) VALUES
(1, 1, 1, '1.0000', '1200.0000');

-- --------------------------------------------------------

--
-- Table structure for table `tec_purchases`
--

CREATE TABLE `tec_purchases` (
  `id` int(11) NOT NULL,
  `reference` varchar(55) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `note` varchar(1000) NOT NULL,
  `total` decimal(25,4) NOT NULL,
  `attachment` varchar(255) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `received` tinyint(1) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tec_purchase_items`
--

CREATE TABLE `tec_purchase_items` (
  `id` int(11) NOT NULL,
  `purchase_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `cost` decimal(25,4) NOT NULL,
  `subtotal` decimal(25,4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tec_registers`
--

CREATE TABLE `tec_registers` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL,
  `cash_in_hand` decimal(25,4) NOT NULL,
  `status` varchar(10) NOT NULL,
  `total_cash` decimal(25,4) DEFAULT NULL,
  `total_cheques` int(11) DEFAULT NULL,
  `total_cc_slips` int(11) DEFAULT NULL,
  `total_cash_submitted` decimal(25,4) DEFAULT NULL,
  `total_cheques_submitted` int(11) DEFAULT NULL,
  `total_cc_slips_submitted` int(11) DEFAULT NULL,
  `note` text,
  `closed_at` timestamp NULL DEFAULT NULL,
  `transfer_opened_bills` varchar(50) DEFAULT NULL,
  `closed_by` int(11) DEFAULT NULL,
  `store_id` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tec_registers`
--

INSERT INTO `tec_registers` (`id`, `date`, `user_id`, `cash_in_hand`, `status`, `total_cash`, `total_cheques`, `total_cc_slips`, `total_cash_submitted`, `total_cheques_submitted`, `total_cc_slips_submitted`, `note`, `closed_at`, `transfer_opened_bills`, `closed_by`, `store_id`) VALUES
(1, '2018-10-05 13:19:56', 1, '10.0000', 'close', '10.0000', 0, 0, '10.0000', 0, 0, '', '2018-10-05 13:32:24', NULL, 1, 1),
(2, '2018-10-05 14:04:53', 1, '11.0000', 'open', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(3, '2018-10-05 14:35:11', 2, '10000.0000', 'open', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tec_sales`
--

CREATE TABLE `tec_sales` (
  `id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer_name` varchar(55) NOT NULL,
  `total` decimal(25,4) NOT NULL,
  `product_discount` decimal(25,4) DEFAULT NULL,
  `order_discount_id` varchar(20) DEFAULT NULL,
  `order_discount` decimal(25,4) DEFAULT NULL,
  `total_discount` decimal(25,4) DEFAULT NULL,
  `product_tax` decimal(25,4) DEFAULT NULL,
  `order_tax_id` varchar(20) DEFAULT NULL,
  `order_tax` decimal(25,4) DEFAULT NULL,
  `total_tax` decimal(25,4) DEFAULT NULL,
  `grand_total` decimal(25,4) NOT NULL,
  `total_items` int(11) DEFAULT NULL,
  `total_quantity` decimal(15,4) DEFAULT NULL,
  `paid` decimal(25,4) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `rounding` decimal(10,4) DEFAULT NULL,
  `store_id` int(11) NOT NULL DEFAULT '1',
  `hold_ref` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tec_sales`
--

INSERT INTO `tec_sales` (`id`, `date`, `customer_id`, `customer_name`, `total`, `product_discount`, `order_discount_id`, `order_discount`, `total_discount`, `product_tax`, `order_tax_id`, `order_tax`, `total_tax`, `grand_total`, `total_items`, `total_quantity`, `paid`, `created_by`, `updated_by`, `updated_at`, `note`, `status`, `rounding`, `store_id`, `hold_ref`) VALUES
(1, '2018-10-05 08:33:06', 1, 'Walk-in Client', '2142.8572', '0.0000', NULL, '0.0000', '0.0000', '257.1428', '5%', '120.0000', '377.1428', '2520.0000', 1, '2.0000', '2520.0000', 2, NULL, NULL, '', 'paid', '0.0000', 1, ''),
(2, '2018-10-05 13:24:15', 1, 'Walk-in Client', '1071.4286', '0.0000', NULL, '0.0000', '0.0000', '128.5714', '5%', '60.0000', '188.5714', '1260.0000', 1, '1.0000', '1260.0000', 2, NULL, NULL, '', 'paid', '0.0000', 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `tec_sale_items`
--

CREATE TABLE `tec_sale_items` (
  `id` int(11) NOT NULL,
  `sale_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `unit_price` decimal(25,4) NOT NULL,
  `net_unit_price` decimal(25,4) NOT NULL,
  `discount` varchar(20) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `tax` int(20) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `real_unit_price` decimal(25,4) DEFAULT NULL,
  `cost` decimal(25,4) DEFAULT '0.0000',
  `product_code` varchar(50) DEFAULT NULL,
  `product_name` varchar(50) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tec_sale_items`
--

INSERT INTO `tec_sale_items` (`id`, `sale_id`, `product_id`, `quantity`, `unit_price`, `net_unit_price`, `discount`, `item_discount`, `tax`, `item_tax`, `subtotal`, `real_unit_price`, `cost`, `product_code`, `product_name`, `comment`) VALUES
(1, 1, 1, '2.0000', '1200.0000', '1071.4286', '0', '0.0000', 12, '257.1428', '2400.0000', '1200.0000', '1200.0000', '412414', 'Athena', ''),
(2, 2, 1, '1.0000', '1200.0000', '1071.4286', '0', '0.0000', 12, '128.5714', '1200.0000', '1200.0000', '1200.0000', '412414', 'Athena', '');

-- --------------------------------------------------------

--
-- Table structure for table `tec_sessions`
--

CREATE TABLE `tec_sessions` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tec_sessions`
--

INSERT INTO `tec_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('1j35hgj5agjjg01gg0teu8vmhslpn47u', '::1', 1538745848, 0x5f5f63695f6c6173745f726567656e65726174657c693a313533383734353834383b),
('5l8hjth3q9llf346bi9bish8p42p80h2', '::1', 1538726371, 0x5f5f63695f6c6173745f726567656e65726174657c693a313533383732363337313b6964656e746974797c733a31353a2261646d696e4061646d696e2e636f6d223b757365726e616d657c733a31303a2261646d696e61646d696e223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a2261646d696e223b6c6173745f6e616d657c733a353a2261646d696e223b637265617465645f6f6e7c733a32333a224672692035204f637420323031382030373a313620414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353338373235353831223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c693a313b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2233223b636173685f696e5f68616e647c733a31303a2231303030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031382d31302d30352030373a33353a3131223b726d73706f737c693a313b6d6573736167657c733a32333a2253616c65207375636365737366756c6c79206164646564223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d),
('5v93i5eg16lcjbu5f4rf9b4ps2hknu93', '::1', 1538722576, 0x5f5f63695f6c6173745f726567656e65726174657c693a313533383732323537363b6964656e746974797c733a31353a2261646d696e4061646d696e2e636f6d223b757365726e616d657c733a31303a2261646d696e61646d696e223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a2261646d696e223b6c6173745f6e616d657c733a353a2261646d696e223b637265617465645f6f6e7c733a32333a224672692035204f637420323031382030373a313620414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353338373034303130223b6c6173745f69707c4e3b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c693a313b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2233223b636173685f696e5f68616e647c733a31303a2231303030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031382d31302d30352030373a33353a3131223b),
('7gkoufnsp79hq27rhtrqmc2f07lpuscm', '::1', 1538727141, 0x5f5f63695f6c6173745f726567656e65726174657c693a313533383732373133373b6964656e746974797c733a31353a2261646d696e4061646d696e2e636f6d223b757365726e616d657c733a31303a2261646d696e61646d696e223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a2261646d696e223b6c6173745f6e616d657c733a353a2261646d696e223b637265617465645f6f6e7c733a32333a224672692035204f637420323031382030373a313620414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353338373235353831223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2233223b636173685f696e5f68616e647c733a31303a2231303030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031382d31302d30352030373a33353a3131223b),
('85eoem2pulmrgnp75cavjgvlh0vuoi4h', '::1', 1538727137, 0x5f5f63695f6c6173745f726567656e65726174657c693a313533383732373133373b6964656e746974797c733a31353a2261646d696e4061646d696e2e636f6d223b757365726e616d657c733a31303a2261646d696e61646d696e223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a2261646d696e223b6c6173745f6e616d657c733a353a2261646d696e223b637265617465645f6f6e7c733a32333a224672692035204f637420323031382030373a313620414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353338373235353831223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2233223b636173685f696e5f68616e647c733a31303a2231303030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031382d31302d30352030373a33353a3131223b),
('8fkdqqctbptag0dgups14grur847m6bk', '::1', 1538724919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313533383732343931393b6964656e746974797c733a31353a2261646d696e4061646d696e2e636f6d223b757365726e616d657c733a31303a2261646d696e61646d696e223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a2261646d696e223b6c6173745f6e616d657c733a353a2261646d696e223b637265617465645f6f6e7c733a32333a224672692035204f637420323031382030373a313620414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353338373034303130223b6c6173745f69707c4e3b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2233223b636173685f696e5f68616e647c733a31303a2231303030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031382d31302d30352030373a33353a3131223b),
('8qkud983a2rnhtqsgb9c5ias8dhpjkbb', '::1', 1538725522, 0x5f5f63695f6c6173745f726567656e65726174657c693a313533383732353532323b6964656e746974797c733a31353a2261646d696e4061646d696e2e636f6d223b757365726e616d657c733a31303a2261646d696e61646d696e223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a2261646d696e223b6c6173745f6e616d657c733a353a2261646d696e223b637265617465645f6f6e7c733a32333a224672692035204f637420323031382030373a313620414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353338373034303130223b6c6173745f69707c4e3b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c693a313b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2233223b636173685f696e5f68616e647c733a31303a2231303030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031382d31302d30352030373a33353a3131223b),
('cb4lsk4k6ltbt00e8jfoerkbkp6ptuvq', '::1', 1538724614, 0x5f5f63695f6c6173745f726567656e65726174657c693a313533383732343631343b6964656e746974797c733a31353a2261646d696e4061646d696e2e636f6d223b757365726e616d657c733a31303a2261646d696e61646d696e223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a2261646d696e223b6c6173745f6e616d657c733a353a2261646d696e223b637265617465645f6f6e7c733a32333a224672692035204f637420323031382030373a313620414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353338373034303130223b6c6173745f69707c4e3b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2233223b636173685f696e5f68616e647c733a31303a2231303030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031382d31302d30352030373a33353a3131223b),
('e5fq51rsqsp8t9q5cfoasffhi63dg2t0', '::1', 1538725221, 0x5f5f63695f6c6173745f726567656e65726174657c693a313533383732353232313b6964656e746974797c733a31353a2261646d696e4061646d696e2e636f6d223b757365726e616d657c733a31303a2261646d696e61646d696e223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a2261646d696e223b6c6173745f6e616d657c733a353a2261646d696e223b637265617465645f6f6e7c733a32333a224672692035204f637420323031382030373a313620414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353338373034303130223b6c6173745f69707c4e3b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2233223b636173685f696e5f68616e647c733a31303a2231303030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031382d31302d30352030373a33353a3131223b),
('o8e176cln2sc5icqsbhmpqsbcai601kb', '::1', 1538724263, 0x5f5f63695f6c6173745f726567656e65726174657c693a313533383732343236333b6964656e746974797c733a31353a2261646d696e4061646d696e2e636f6d223b757365726e616d657c733a31303a2261646d696e61646d696e223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a2261646d696e223b6c6173745f6e616d657c733a353a2261646d696e223b637265617465645f6f6e7c733a32333a224672692035204f637420323031382030373a313620414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353338373034303130223b6c6173745f69707c4e3b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2233223b636173685f696e5f68616e647c733a31303a2231303030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031382d31302d30352030373a33353a3131223b),
('p7g1eidqj3bk29odneidgqiqvt6mqpsn', '::1', 1538726023, 0x5f5f63695f6c6173745f726567656e65726174657c693a313533383732363032333b);

-- --------------------------------------------------------

--
-- Table structure for table `tec_settings`
--

CREATE TABLE `tec_settings` (
  `setting_id` int(1) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `site_name` varchar(55) NOT NULL,
  `tel` varchar(20) NOT NULL,
  `dateformat` varchar(20) DEFAULT NULL,
  `timeformat` varchar(20) DEFAULT NULL,
  `default_email` varchar(100) NOT NULL,
  `language` varchar(20) NOT NULL,
  `version` varchar(10) NOT NULL DEFAULT '1.0',
  `theme` varchar(20) NOT NULL,
  `timezone` varchar(255) NOT NULL DEFAULT '0',
  `protocol` varchar(20) NOT NULL DEFAULT 'mail',
  `smtp_host` varchar(255) DEFAULT NULL,
  `smtp_user` varchar(100) DEFAULT NULL,
  `smtp_pass` varchar(255) DEFAULT NULL,
  `smtp_port` varchar(10) DEFAULT '25',
  `smtp_crypto` varchar(5) DEFAULT NULL,
  `mmode` tinyint(1) NOT NULL,
  `captcha` tinyint(1) NOT NULL DEFAULT '1',
  `mailpath` varchar(55) DEFAULT NULL,
  `currency_prefix` varchar(3) NOT NULL,
  `default_customer` int(11) NOT NULL,
  `default_tax_rate` varchar(20) NOT NULL,
  `rows_per_page` int(2) NOT NULL,
  `total_rows` int(2) NOT NULL,
  `header` varchar(1000) DEFAULT NULL,
  `footer` varchar(1000) DEFAULT NULL,
  `bsty` tinyint(4) NOT NULL,
  `display_kb` tinyint(4) NOT NULL,
  `default_category` int(11) NOT NULL,
  `default_discount` varchar(20) NOT NULL,
  `item_addition` tinyint(1) NOT NULL,
  `barcode_symbology` varchar(55) DEFAULT NULL,
  `pro_limit` tinyint(4) NOT NULL,
  `decimals` tinyint(1) NOT NULL DEFAULT '2',
  `thousands_sep` varchar(2) NOT NULL DEFAULT ',',
  `decimals_sep` varchar(2) NOT NULL DEFAULT '.',
  `focus_add_item` varchar(55) DEFAULT NULL,
  `add_customer` varchar(55) DEFAULT NULL,
  `toggle_category_slider` varchar(55) DEFAULT NULL,
  `cancel_sale` varchar(55) DEFAULT NULL,
  `suspend_sale` varchar(55) DEFAULT NULL,
  `print_order` varchar(55) DEFAULT NULL,
  `print_bill` varchar(55) DEFAULT NULL,
  `finalize_sale` varchar(55) DEFAULT NULL,
  `today_sale` varchar(55) DEFAULT NULL,
  `open_hold_bills` varchar(55) DEFAULT NULL,
  `close_register` varchar(55) DEFAULT NULL,
  `java_applet` tinyint(1) NOT NULL,
  `receipt_printer` varchar(55) DEFAULT NULL,
  `pos_printers` varchar(255) DEFAULT NULL,
  `cash_drawer_codes` varchar(55) DEFAULT NULL,
  `char_per_line` tinyint(4) DEFAULT '42',
  `rounding` tinyint(1) DEFAULT '0',
  `pin_code` varchar(20) DEFAULT NULL,
  `stripe` tinyint(1) DEFAULT NULL,
  `stripe_secret_key` varchar(100) DEFAULT NULL,
  `stripe_publishable_key` varchar(100) DEFAULT NULL,
  `purchase_code` varchar(100) DEFAULT NULL,
  `envato_username` varchar(50) DEFAULT NULL,
  `theme_style` varchar(25) DEFAULT 'green',
  `after_sale_page` tinyint(1) DEFAULT NULL,
  `overselling` tinyint(1) DEFAULT '1',
  `multi_store` tinyint(1) DEFAULT NULL,
  `qty_decimals` tinyint(1) DEFAULT '2',
  `symbol` varchar(55) DEFAULT NULL,
  `sac` tinyint(1) DEFAULT '0',
  `display_symbol` tinyint(1) DEFAULT NULL,
  `remote_printing` tinyint(1) DEFAULT '1',
  `printer` int(11) DEFAULT NULL,
  `order_printers` varchar(55) DEFAULT NULL,
  `auto_print` tinyint(1) DEFAULT '0',
  `local_printers` tinyint(1) DEFAULT NULL,
  `rtl` tinyint(1) DEFAULT NULL,
  `print_img` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tec_settings`
--

INSERT INTO `tec_settings` (`setting_id`, `logo`, `site_name`, `tel`, `dateformat`, `timeformat`, `default_email`, `language`, `version`, `theme`, `timezone`, `protocol`, `smtp_host`, `smtp_user`, `smtp_pass`, `smtp_port`, `smtp_crypto`, `mmode`, `captcha`, `mailpath`, `currency_prefix`, `default_customer`, `default_tax_rate`, `rows_per_page`, `total_rows`, `header`, `footer`, `bsty`, `display_kb`, `default_category`, `default_discount`, `item_addition`, `barcode_symbology`, `pro_limit`, `decimals`, `thousands_sep`, `decimals_sep`, `focus_add_item`, `add_customer`, `toggle_category_slider`, `cancel_sale`, `suspend_sale`, `print_order`, `print_bill`, `finalize_sale`, `today_sale`, `open_hold_bills`, `close_register`, `java_applet`, `receipt_printer`, `pos_printers`, `cash_drawer_codes`, `char_per_line`, `rounding`, `pin_code`, `stripe`, `stripe_secret_key`, `stripe_publishable_key`, `purchase_code`, `envato_username`, `theme_style`, `after_sale_page`, `overselling`, `multi_store`, `qty_decimals`, `symbol`, `sac`, `display_symbol`, `remote_printing`, `printer`, `order_printers`, `auto_print`, `local_printers`, `rtl`, `print_img`) VALUES
(1, 'logo1.png', 'XAXA Boutique', '0105292122', 'D j M Y', 'h:i A', 'xaxa@gmail.com', 'english', '4.0.24', 'default', 'Asia/Kuala_Lumpur', 'mail', 'pop.gmail.com', 'noreply@spos.tecdiary.my', '', '25', '', 0, 0, NULL, 'USD', 3, '5%', 10, 30, '<h2><strong>Simple POS</strong></h2>\r\n       My Shop Lot, Shopping Mall,<br>\r\n                                                                                              Post Code, City<br>', 'Thank you for your business!\r\n<br>', 3, 0, 1, '0', 1, '', 10, 2, ',', '.', 'ALT+F1', 'ALT+F2', 'ALT+F10', 'ALT+F5', 'ALT+F6', 'ALT+F11', 'ALT+F12', 'ALT+F8', 'Ctrl+F1', 'Ctrl+F2', 'ALT+F7', 0, '', '', '', 42, 1, '2122', 1, '', '', '65806230-5697-4f94-89f4-49275c3c19d8', 'sgr1875', 'green', NULL, 1, NULL, 2, NULL, 0, NULL, 1, 1, NULL, 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tec_stores`
--

CREATE TABLE `tec_stores` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `code` varchar(20) NOT NULL,
  `logo` varchar(40) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(15) NOT NULL,
  `address1` varchar(50) DEFAULT NULL,
  `address2` varchar(50) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `state` varchar(20) DEFAULT NULL,
  `postal_code` varchar(8) DEFAULT NULL,
  `country` varchar(25) DEFAULT NULL,
  `currency_code` varchar(3) DEFAULT NULL,
  `receipt_header` text,
  `receipt_footer` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tec_stores`
--

INSERT INTO `tec_stores` (`id`, `name`, `code`, `logo`, `email`, `phone`, `address1`, `address2`, `city`, `state`, `postal_code`, `country`, `currency_code`, `receipt_header`, `receipt_footer`) VALUES
(1, 'XAXA\'S BOUTIQUE', 'POS', 'logo.png', 'xaxa@email.com', '012345678', 'Address Line 1', '', 'San Fernando', 'Pampanga', '46000', 'Philippines', 'MYR', 'XAXA\'S BOUTIQUE', 'XAXA\'S BOUTIQUE'),
(2, 'XAXA Boutique', 'XXPOS', NULL, 'zwhenz@gmail.com', '123457', 'asdasd', '', '', '', '', '', NULL, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `tec_suppliers`
--

CREATE TABLE `tec_suppliers` (
  `id` int(11) NOT NULL,
  `name` varchar(55) NOT NULL,
  `cf1` varchar(255) NOT NULL,
  `cf2` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tec_suppliers`
--

INSERT INTO `tec_suppliers` (`id`, `name`, `cf1`, `cf2`, `phone`, `email`) VALUES
(1, 'Test Supplier', '1', '2', '0123456789', 'supplier@test.com');

-- --------------------------------------------------------

--
-- Table structure for table `tec_suspended_items`
--

CREATE TABLE `tec_suspended_items` (
  `id` int(11) NOT NULL,
  `suspend_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `unit_price` decimal(25,4) NOT NULL,
  `net_unit_price` decimal(25,4) NOT NULL,
  `discount` varchar(20) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `tax` int(20) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `real_unit_price` decimal(25,4) DEFAULT NULL,
  `product_code` varchar(50) DEFAULT NULL,
  `product_name` varchar(50) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tec_suspended_sales`
--

CREATE TABLE `tec_suspended_sales` (
  `id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer_name` varchar(55) NOT NULL,
  `total` decimal(25,4) NOT NULL,
  `product_discount` decimal(25,4) DEFAULT NULL,
  `order_discount_id` varchar(20) DEFAULT NULL,
  `order_discount` decimal(25,4) DEFAULT NULL,
  `total_discount` decimal(25,4) DEFAULT NULL,
  `product_tax` decimal(25,4) DEFAULT NULL,
  `order_tax_id` varchar(20) DEFAULT NULL,
  `order_tax` decimal(25,4) DEFAULT NULL,
  `total_tax` decimal(25,4) DEFAULT NULL,
  `grand_total` decimal(25,4) NOT NULL,
  `total_items` int(11) DEFAULT NULL,
  `total_quantity` decimal(15,4) DEFAULT NULL,
  `paid` decimal(25,4) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `hold_ref` varchar(255) DEFAULT NULL,
  `store_id` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tec_users`
--

CREATE TABLE `tec_users` (
  `id` int(11) UNSIGNED NOT NULL,
  `last_ip_address` varbinary(45) DEFAULT NULL,
  `ip_address` varbinary(45) DEFAULT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(40) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int(11) UNSIGNED DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int(11) UNSIGNED NOT NULL,
  `last_login` int(11) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `avatar` varchar(55) DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `group_id` int(11) UNSIGNED NOT NULL DEFAULT '2',
  `store_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tec_users`
--

INSERT INTO `tec_users` (`id`, `last_ip_address`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`, `avatar`, `gender`, `group_id`, `store_id`) VALUES
(2, 0x3a3a31, 0x3a3a31, 'adminadmin', '1e13f84b52d1e7c5ea1ce1f1db9bd576daef0386', NULL, 'admin@admin.com', NULL, NULL, NULL, '97d03983b21c5a70d8b928002449cfa60f6f45cf', 1538704010, 1538745816, 1, 'admin', 'admin', NULL, '12312', NULL, 'male', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tec_user_logins`
--

CREATE TABLE `tec_user_logins` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `ip_address` varbinary(16) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tec_user_logins`
--

INSERT INTO `tec_user_logins` (`id`, `user_id`, `company_id`, `ip_address`, `login`, `time`) VALUES
(1, 1, NULL, 0x3a3a31, 'admin@tecdiary.com', '2018-10-05 00:48:57'),
(2, 1, NULL, 0x3a3a31, 'admin@tecdiary.com', '2018-10-05 01:33:53'),
(3, 2, NULL, 0x3a3a31, 'admin@admin.com', '2018-10-05 01:47:24'),
(4, 2, NULL, 0x3a3a31, 'admin@admin.com', '2018-10-05 07:46:22'),
(5, 2, NULL, 0x3a3a31, 'admin@admin.com', '2018-10-05 07:53:58');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tec_categories`
--
ALTER TABLE `tec_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tec_combo_items`
--
ALTER TABLE `tec_combo_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tec_customers`
--
ALTER TABLE `tec_customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tec_expenses`
--
ALTER TABLE `tec_expenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tec_gift_cards`
--
ALTER TABLE `tec_gift_cards`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `card_no` (`card_no`);

--
-- Indexes for table `tec_groups`
--
ALTER TABLE `tec_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tec_login_attempts`
--
ALTER TABLE `tec_login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tec_payments`
--
ALTER TABLE `tec_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tec_printers`
--
ALTER TABLE `tec_printers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tec_products`
--
ALTER TABLE `tec_products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `tec_product_store_qty`
--
ALTER TABLE `tec_product_store_qty`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `tec_purchases`
--
ALTER TABLE `tec_purchases`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tec_purchase_items`
--
ALTER TABLE `tec_purchase_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tec_registers`
--
ALTER TABLE `tec_registers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tec_sales`
--
ALTER TABLE `tec_sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tec_sale_items`
--
ALTER TABLE `tec_sale_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tec_sessions`
--
ALTER TABLE `tec_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ci_sessions_timestamp` (`timestamp`);

--
-- Indexes for table `tec_settings`
--
ALTER TABLE `tec_settings`
  ADD PRIMARY KEY (`setting_id`);

--
-- Indexes for table `tec_stores`
--
ALTER TABLE `tec_stores`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tec_suppliers`
--
ALTER TABLE `tec_suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tec_suspended_items`
--
ALTER TABLE `tec_suspended_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tec_suspended_sales`
--
ALTER TABLE `tec_suspended_sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tec_users`
--
ALTER TABLE `tec_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_id` (`group_id`);

--
-- Indexes for table `tec_user_logins`
--
ALTER TABLE `tec_user_logins`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tec_categories`
--
ALTER TABLE `tec_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `tec_combo_items`
--
ALTER TABLE `tec_combo_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tec_customers`
--
ALTER TABLE `tec_customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tec_expenses`
--
ALTER TABLE `tec_expenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tec_gift_cards`
--
ALTER TABLE `tec_gift_cards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tec_groups`
--
ALTER TABLE `tec_groups`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tec_login_attempts`
--
ALTER TABLE `tec_login_attempts`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tec_payments`
--
ALTER TABLE `tec_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tec_printers`
--
ALTER TABLE `tec_printers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tec_products`
--
ALTER TABLE `tec_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tec_product_store_qty`
--
ALTER TABLE `tec_product_store_qty`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tec_purchases`
--
ALTER TABLE `tec_purchases`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tec_purchase_items`
--
ALTER TABLE `tec_purchase_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tec_registers`
--
ALTER TABLE `tec_registers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tec_sales`
--
ALTER TABLE `tec_sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tec_sale_items`
--
ALTER TABLE `tec_sale_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tec_stores`
--
ALTER TABLE `tec_stores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tec_suppliers`
--
ALTER TABLE `tec_suppliers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tec_suspended_items`
--
ALTER TABLE `tec_suspended_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tec_suspended_sales`
--
ALTER TABLE `tec_suspended_sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tec_users`
--
ALTER TABLE `tec_users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tec_user_logins`
--
ALTER TABLE `tec_user_logins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
