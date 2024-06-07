-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 07, 2024 at 03:55 PM
-- Server version: 8.2.0
-- PHP Version: 8.2.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `resto`
--

-- --------------------------------------------------------

--
-- Table structure for table `bills`
--

DROP TABLE IF EXISTS `bills`;
CREATE TABLE IF NOT EXISTS `bills` (
  `table_id` int DEFAULT NULL,
  `card_id` int DEFAULT NULL,
  `reservation_id` int DEFAULT NULL,
  `payment_method` varchar(255) DEFAULT NULL,
  `bill_time` datetime DEFAULT NULL,
  `payment_time` datetime DEFAULT NULL,
  `bill_id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`bill_id`),
  KEY `table_id` (`table_id`),
  KEY `card_id` (`card_id`),
  KEY `reservation_id` (`reservation_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `bills`
--

INSERT INTO `bills` (`table_id`, `card_id`, `reservation_id`, `payment_method`, `bill_time`, `payment_time`, `bill_id`) VALUES
(1, NULL, NULL, 'cash', '2024-06-06 05:39:52', '2024-06-06 05:40:15', 4),
(2, 15, NULL, 'card', '2024-06-06 05:40:39', '2024-06-07 03:55:57', 5),
(3, NULL, NULL, 'cash', '2024-06-06 17:15:59', '2024-06-06 17:17:32', 6),
(4, NULL, NULL, 'cash', '2024-06-07 15:21:11', '2024-06-07 15:31:45', 7),
(9, 16, NULL, 'card', '2024-06-07 15:32:35', '2024-06-07 15:34:42', 8);

-- --------------------------------------------------------

--
-- Table structure for table `bill_items`
--

DROP TABLE IF EXISTS `bill_items`;
CREATE TABLE IF NOT EXISTS `bill_items` (
  `bill_item_id` int NOT NULL AUTO_INCREMENT,
  `bill_id` int DEFAULT NULL,
  `item_id` varchar(6) DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  PRIMARY KEY (`bill_item_id`),
  KEY `bill_id` (`bill_id`),
  KEY `item_id` (`item_id`)
) ENGINE=MyISAM AUTO_INCREMENT=197 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `bill_items`
--

INSERT INTO `bill_items` (`bill_item_id`, `bill_id`, `item_id`, `quantity`) VALUES
(190, 4, 'F1', 2),
(191, 4, 'F2', 1),
(192, 0, 'F1', 1),
(193, 5, 'F1', 1),
(194, 6, 'I1', 1),
(195, 7, 'N4', 1),
(196, 8, 'F1', 1);

-- --------------------------------------------------------

--
-- Table structure for table `card_payments`
--

DROP TABLE IF EXISTS `card_payments`;
CREATE TABLE IF NOT EXISTS `card_payments` (
  `card_id` int NOT NULL AUTO_INCREMENT,
  `account_holder_name` varchar(255) NOT NULL,
  `card_number` varchar(16) NOT NULL,
  `expiry_date` varchar(7) NOT NULL,
  `security_code` varchar(3) NOT NULL,
  PRIMARY KEY (`card_id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `card_payments`
--

INSERT INTO `card_payments` (`card_id`, `account_holder_name`, `card_number`, `expiry_date`, `security_code`) VALUES
(15, 'Pranam', '5465768987654567', '10/2024', '123'),
(16, 'Maru', '575869657687697', '09/2024', '123');

-- --------------------------------------------------------

--
-- Table structure for table `kitchen`
--

DROP TABLE IF EXISTS `kitchen`;
CREATE TABLE IF NOT EXISTS `kitchen` (
  `kitchen_id` int NOT NULL AUTO_INCREMENT,
  `table_id` int DEFAULT NULL,
  `item_id` varchar(6) DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `time_submitted` datetime DEFAULT NULL,
  `time_ended` datetime DEFAULT NULL,
  PRIMARY KEY (`kitchen_id`),
  KEY `table_id` (`table_id`),
  KEY `item_id` (`item_id`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
CREATE TABLE IF NOT EXISTS `login` (
  `username` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(25) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`username`, `password`) VALUES
('NP Resto', 'np2023'),
('', '');

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
CREATE TABLE IF NOT EXISTS `menu` (
  `item_id` varchar(6) NOT NULL,
  `item_name` varchar(255) DEFAULT NULL,
  `item_type` varchar(255) DEFAULT NULL,
  `item_price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`item_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`item_id`, `item_name`, `item_type`, `item_price`) VALUES
('S1', 'manchow soup(chicken)', 'soup', 110.00),
('S2', 'Tomato soup', 'Soup', 110.00),
('S3', 'lemon corinder soup(veg)', 'soup', 70.00),
('S4', 'lemon coriander soup(chicken)', 'soup', 80.00),
('S5', 'Sweet corn soup(veg)', 'soup', 70.00),
('S7', 'Sweet corn soup(chicken)', 'soup', 80.00),
('S6', 'Manchow(chicken)', 'soup', 80.00),
('F1', 'Fried rice(veg/egg)', 'fried rice', 120.00),
('F2', 'Fried rice(chicken)', 'fried rice', 130.00),
('F3', 'Sezwan Fried rice(veg/egg)', 'fried rice', 130.00),
('F4', 'Sezwan Fried rice(chicken)', 'fried rice', 150.00),
('F6', 'Burnt Garlic rice(veg/egg)', 'fried rice', 120.00),
('F5', 'Burnt Garlic rice(chicken)', 'fried rice', 130.00),
('F7', 'manchrian fried rice(chicken)', 'Noodles', 150.00),
('F8', 'manchrian fried rice(veg/egg)', 'noodles', 180.00),
('N3', 'Sezwan Noodles(chicken)', 'noodles', 130.00),
('N4', 'Sezwan Noodles(veg/egg)', 'noodles', 120.00),
('N5', 'Chowmein(chicken)', 'noodles', 150.00),
('N6', 'Chowmein(veg/egg)', 'noodles', 130.00),
('N7', 'American Choupsey(veg/egg)', 'noodles', 130.00),
('N8', 'American Choupsey(chicken)', 'noodles', 150.00),
('SU1', 'oreo cookie sunder', 'Sundae', 175.00),
('SU2', 'Traditional gudbud', 'Sundae', 175.00),
('SU3', 'classic banana sundae', 'Sundae', 175.00),
('SU4', 'nuts n caramel sundae', 'Sundae', 175.00),
('SU5', 'Fruits Salad sundae', 'Sundae', 175.00),
('M1', 'mint Mojito', 'Mojito', 145.00),
('M2', 'blue Lagoon', 'Mojito', 145.00),
('M3', 'sun Riser', 'Mojito', 145.00),
('I1', 'Vanilla', 'Ice Cream', 105.00),
('I2', 'Strawberry', 'Ice Cream', 105.00),
('I3', 'Mango', 'Ice Cream', 115.00),
('I4', 'pista', 'Ice Cream', 115.00),
('I5', 'litchi', 'Ice Cream', 115.00),
('I6', 'amrican Nuts', 'Ice Cream', 125.00),
('I7', 'butterscotch', 'Ice Cream', 125.00),
('I8', 'cookie&Cream', 'Ice Cream', 125.00),
('ST1', 'chicken Chilli', 'Starters', 150.00),
('ST2', 'veg Chilli', 'Starters', 135.00),
('ST3', 'veg Manchurian', 'Starters', 135.00),
('ST4', 'Chicken Manchurian', 'Starters', 150.00),
('ST5', 'Pepper veg chilli', 'Starters', 135.00),
('ST6', 'Pepper chicken chilli', 'Starters', 150.00),
('ST7', 'Veg Sezwan', 'Starters', 135.00),
('ST8', 'Chicken Sezwan', 'Starters', 150.00),
('ST9', 'Chicken Lollypop', 'Starters', 200.00),
('ST10', 'Lemon Chicken', 'Starters', 240.00),
('ST11', 'Crispy Chicken', 'Starters', 290.00),
('ST12', 'Barbeque Lollypop', 'Starters', 255.00),
('G1', 'Chicken masala', 'Indian Gravy', 190.00),
('G2', 'Chicken kadai', 'Indian Gravy', 190.00),
('G3', 'Chicken tawa masala', 'Indian Gravy', 210.00),
('G4', 'Butter Chicken', 'Indian Gravy', 240.00),
('G5', 'Chicken Tikka Masala', 'Indian Gravy', 240.00),
('G6', 'Veg Hyderbadi', 'Indian Gravy', 180.00),
('G7', 'Mashroom Kadai', 'Indian Gravy', 190.00),
('G8', 'Babycorn Tikka Masala', 'Indian Gravy', 230.00),
('G9', 'Babycorn Tawa Masala', 'Indian Gravy', 200.00),
('G10', 'Dalfry', 'Indian Gravy', 130.00),
('R1', 'Chicken Biriyani(Full)', 'Indian rice', 180.00),
('R2', 'Egg Biriyani(full)', 'Indian Rice', 130.00),
('R3', 'Fish Biriyani', 'Indian Rice', 230.00),
('R4', 'Panner Biriyani(Full)', 'Indian Rice', 180.00),
('R5', 'Mushroom Biriyani(Full)', 'Indian Rice', 180.00),
('R6', 'Panner pulav', 'Indian Rice', 160.00),
('R7', 'Jeera Rice', 'Indian Rice', 140.00),
('R8', 'Chicken Biriyani(half)', 'Indian Rice', 95.00),
('R9', 'Egg Biriyani(half)', 'Indian Rice', 85.00),
('R10', 'Panner Biriyani(half)', 'Indian Rice', 95.00),
('R11', 'Mushroom Biriyani(Half)', 'Indian Rice', 95.00);

-- --------------------------------------------------------

--
-- Table structure for table `reservations`
--

DROP TABLE IF EXISTS `reservations`;
CREATE TABLE IF NOT EXISTS `reservations` (
  `customer_name` varchar(255) DEFAULT NULL,
  `table_id` int DEFAULT NULL,
  `reservation_time` time DEFAULT NULL,
  `reservation_date` date DEFAULT NULL,
  `head_count` int DEFAULT NULL,
  `special_request` varchar(255) DEFAULT NULL,
  `reservation_id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`reservation_id`),
  KEY `table_id` (`table_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1220242 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `reservations`
--

INSERT INTO `reservations` (`customer_name`, `table_id`, `reservation_time`, `reservation_date`, `head_count`, `special_request`, `reservation_id`) VALUES
('Pratheek', 1, '12:00:00', '2024-06-06', 4, '', 1220241),
('Paandu', 8, '10:00:00', '2024-06-09', 8, 'One baby chair', 1020248);

-- --------------------------------------------------------

--
-- Table structure for table `restaurant_tables`
--

DROP TABLE IF EXISTS `restaurant_tables`;
CREATE TABLE IF NOT EXISTS `restaurant_tables` (
  `table_id` int NOT NULL AUTO_INCREMENT,
  `capacity` int DEFAULT NULL,
  `is_available` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`table_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `restaurant_tables`
--

INSERT INTO `restaurant_tables` (`table_id`, `capacity`, `is_available`) VALUES
(1, 4, 1),
(2, 4, 1),
(3, 4, 1),
(4, 6, 1),
(5, 6, 1),
(6, 6, 1),
(7, 6, 1),
(8, 8, 1),
(9, 8, 1);

-- --------------------------------------------------------

--
-- Table structure for table `table_availability`
--

DROP TABLE IF EXISTS `table_availability`;
CREATE TABLE IF NOT EXISTS `table_availability` (
  `table_id` int DEFAULT NULL,
  `reservation_date` date DEFAULT NULL,
  `reservation_time` time DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `availability_id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`availability_id`),
  KEY `table_id` (`table_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1220242 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `table_availability`
--

INSERT INTO `table_availability` (`table_id`, `reservation_date`, `reservation_time`, `status`, `availability_id`) VALUES
(1, '2024-06-06', '12:00:00', 'no', 1220241),
(2, '2024-07-06', '11:00:00', 'no', 1120242),
(1, '2024-07-07', '10:00:00', 'no', 1020241),
(1, '2023-07-07', '10:00:00', 'no', 1020231),
(8, '2024-06-09', '10:00:00', 'no', 1020248);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
