-- phpMyAdmin SQL Dump
-- version 3.4.10.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 24, 2012 at 10:51 PM
-- Server version: 5.5.20
-- PHP Version: 5.3.10

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `bookme`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE IF NOT EXISTS `bookings` (
  `booking_id` int(11) NOT NULL AUTO_INCREMENT,
  `subject_id` int(11) NOT NULL,
  `period_id` int(11) NOT NULL,
  `booking_username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `booking_displayname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `booking_classname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `booking_isblock` tinyint(1) NOT NULL,
  `booking_date` date NOT NULL,
  PRIMARY KEY (`booking_id`),
  KEY `subjectid` (`subject_id`),
  KEY `periodid` (`period_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `holidays`
--

CREATE TABLE IF NOT EXISTS `holidays` (
  `holiday_id` int(11) NOT NULL AUTO_INCREMENT,
  `holiday_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `holiday_start` date NOT NULL,
  `holiday_end` date NOT NULL,
  PRIMARY KEY (`holiday_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `holidays`
--

INSERT INTO `holidays` (`holiday_id`, `holiday_name`, `holiday_start`, `holiday_end`) VALUES
(1, 'June Half Term', '2012-06-04', '2012-06-08'),
(2, 'Summer Break', '2012-07-09', '2012-08-30');

-- --------------------------------------------------------

--
-- Table structure for table `periods`
--

CREATE TABLE IF NOT EXISTS `periods` (
  `period_id` int(11) NOT NULL AUTO_INCREMENT,
  `period_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `period_start` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `period_end` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `period_bookable` tinyint(1) NOT NULL,
  PRIMARY KEY (`period_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=10 ;

--
-- Dumping data for table `periods`
--

INSERT INTO `periods` (`period_id`, `period_name`, `period_start`, `period_end`, `period_bookable`) VALUES
(1, 'P1', '09:00', '09:45', 1),
(2, 'P2', '09:45', '10:30', 1),
(4, 'P3', '10:30', '11:15', 1),
(5, 'Break', '11:15', '11:45', 0),
(6, 'P4', '11:45', '12:30', 1),
(7, 'Lunch', '12:30', '14:05', 0),
(8, 'P5', '14:05', '14:50', 1),
(9, 'P6', '14:50', '15:35', 1);

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE IF NOT EXISTS `rooms` (
  `room_id` int(11) NOT NULL AUTO_INCREMENT,
  `room_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `room_pc_count` int(11) DEFAULT NULL COMMENT 'Can be left null if needed',
  `room_image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `room_image_tn` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`room_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`room_id`, `room_name`, `room_pc_count`, `room_image`, `room_image_tn`) VALUES
(1, 'Senior ICT Suite', 25, 'no-image.png', 'no-image.png'),
(2, 'Senior Hall', 1, 'no-image.png', 'no-image.png');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE IF NOT EXISTS `settings` (
  `setting_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `setting_value` varchar(1000) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`setting_name`, `setting_value`) VALUES
('school_name', 'Default School'),
('allow_local_login', '1'),
('ldap_server', ''),
('ldap_account_suffix', ''),
('ldap_basedn', ''),
('ldap_username', ''),
('ldap_password', ''),
('ldap_standard_users', ''),
('ldap_admin_users', ''),
('bg_colour', '6A9A82'),
('bookme_version', '0.1alpha');

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE IF NOT EXISTS `subjects` (
  `subject_id` int(11) NOT NULL AUTO_INCREMENT,
  `subject_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `subject_colour` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `subject_use_shading` tinyint(1) NOT NULL,
  PRIMARY KEY (`subject_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`subject_id`, `subject_name`, `subject_colour`, `subject_use_shading`) VALUES
(1, 'ICT', '6369FF', 1),
(2, 'Maths', 'FFED94', 1),
(3, 'English', 'FFA6D5', 1),
(4, 'Chemistry', 'FF5E64', 1);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_ibfk_2` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`subject_id`) ON UPDATE NO ACTION,
  ADD CONSTRAINT `bookings_ibfk_3` FOREIGN KEY (`period_id`) REFERENCES `periods` (`period_id`) ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
