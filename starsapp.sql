-- phpMyAdmin SQL Dump
-- version 4.0.10.14
-- http://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: Nov 29, 2016 at 01:27 PM
-- Server version: 5.6.30-cll-lve
-- PHP Version: 5.6.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `starsapp`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `email` varchar(200) NOT NULL,
  `password` varchar(200) DEFAULT NULL,
  `display_name` varchar(200) DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `acount_active` int(11) DEFAULT NULL,
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`email`, `password`, `display_name`, `last_login`, `acount_active`, `admin_id`) VALUES
('tporter@appddictionstudio.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'Tim Porter', '2016-09-13 00:00:00', 1, 1),
('rrapstine@appddictionstudio.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'Rick Rapstine', '0000-00-00 00:00:00', 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `discipline_referrals`
--

CREATE TABLE IF NOT EXISTS `discipline_referrals` (
  `complaint_id` int(200) NOT NULL AUTO_INCREMENT,
  `school_id` int(200) DEFAULT NULL,
  `driver_id` int(200) DEFAULT NULL,
  `student_name` varchar(200) DEFAULT NULL,
  `offence` varchar(200) DEFAULT NULL,
  `offence_time` datetime DEFAULT NULL,
  `offence_location` varchar(200) DEFAULT NULL,
  `vehicle_id` int(10) DEFAULT NULL,
  `comments` varchar(2000) DEFAULT NULL,
  `parents_notified` enum('yes','no') DEFAULT NULL,
  PRIMARY KEY (`complaint_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `discipline_referrals`
--

INSERT INTO `discipline_referrals` (`complaint_id`, `school_id`, `driver_id`, `student_name`, `offence`, `offence_time`, `offence_location`, `vehicle_id`, `comments`, `parents_notified`) VALUES
(3, 1, 1, 'Tim', 'Test', '2016-12-12 00:00:00', 'Test', 1, 'Hello World', 'yes'),
(4, 1, 1, 'Tim', 'Test', '2016-12-12 00:00:00', 'Test', 1, 'Hello World', 'yes'),
(5, 1, 1, 'Tim', 'Test', '2016-12-12 00:00:00', 'Test', 1, 'Hello World', 'yes'),
(6, 1, 1, 'edna', 'Bullying', '2016-10-10 08:30:00', 'Utah', 1, 'Discipline Referral Comments', 'yes'),
(7, 1, 1, 'Timothy Porter', '11/18/16, 7:23:17 PM Pacific Standard Time', '1970-01-01 00:00:00', 'Utah', 1, '', NULL),
(8, 3, 6, 'Timothy Porter', '11/23/16, 6:43:44 PM Pacific Standard Time', '1970-01-01 00:00:00', 'Utah', 5, 'Great!', NULL),
(9, 1, 8, 'Timothy Porter', '11/23/16, 12:34:40 PM Central Standard Time', '1970-01-01 00:00:00', 'Utah', 3, '', NULL),
(10, 3, 6, 'Timothy Porter', '11/25/16, 9:50:42 AM Central Standard Time', '1970-01-01 00:00:00', 'Utah', 1, 'Testing app by Lance ', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `districts`
--

CREATE TABLE IF NOT EXISTS `districts` (
  `district_id` int(200) NOT NULL AUTO_INCREMENT,
  `district_name` varchar(200) NOT NULL,
  `state` varchar(50) NOT NULL,
  PRIMARY KEY (`district_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `districts`
--

INSERT INTO `districts` (`district_id`, `district_name`, `state`) VALUES
(1, 'Test District 1', 'TX'),
(2, 'Test District 2', 'MD'),
(3, 'Test District 3', 'CA'),
(4, 'Test District 4', 'TX');

-- --------------------------------------------------------

--
-- Table structure for table `drivers`
--

CREATE TABLE IF NOT EXISTS `drivers` (
  `driver_id` int(200) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(200) DEFAULT NULL,
  `last_name` varchar(200) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL,
  `total_exp` int(10) DEFAULT NULL,
  `about_driver` varchar(2000) DEFAULT NULL,
  `city` varchar(200) DEFAULT NULL,
  `state` varchar(200) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `district_id` int(200) DEFAULT NULL,
  `school_id` int(100) DEFAULT NULL,
  `phone` varchar(200) DEFAULT NULL,
  `driver_description` int(11) DEFAULT NULL,
  `security_question` int(11) DEFAULT NULL,
  `security_answer` varchar(100) DEFAULT NULL,
  `profile_pic` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`driver_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=54 ;

--
-- Dumping data for table `drivers`
--

INSERT INTO `drivers` (`driver_id`, `first_name`, `last_name`, `username`, `email`, `password`, `total_exp`, `about_driver`, `city`, `state`, `address`, `district_id`, `school_id`, `phone`, `driver_description`, `security_question`, `security_answer`, `profile_pic`) VALUES
(1, 'Travis', 'Cable', NULL, 'travis.cable@gmail.com', 'c974f63abee678d0e103167ad9c813a5', 4, NULL, 'test', 'test', 'test', 1, 1, '9861408292', 1, NULL, NULL, '/uploads/profile-pics/396b754148ee3c435544d5db6b7b9f7b.png'),
(4, 'Edna', 'Lozano', NULL, 'edna.lozano@gmail.com', 'c974f63abee678d0e103167ad9c813a5', 2, 'test', 'teste', 'test', 'test', 1, 1, '213213213213', NULL, NULL, NULL, '/uploads/profile-pics/19a22ca5136395a0229fd56038449973.png'),
(6, 'Lance', ' Johnson', NULL, 'test@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', 1, 'test', 'Austin', 'CA', 'Tes', 4, 3, '9886198529', NULL, NULL, NULL, './uploads/profile-pics/581c3ab3a859c.png'),
(7, 'John', 'Cena', NULL, 'test1@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', 2, 'test', 'Baltimore', 'MD', '123 Test Ln', 2, 3, '9886198529', NULL, NULL, NULL, './uploads/profile-pics/581c3fd07288e.png'),
(8, 'Axel', 'Rose', NULL, 'test@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', 1, 'test', 'Baltimore', 'MD', '123', 2, 1, '9886198529', NULL, NULL, NULL, './uploads/profile-pics/581c539f7f529.png'),
(9, 'Eric', 'Clapton', NULL, 'test@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', 1, 'test', 'Baltimore', 'TX', 'Tes', 4, 1, '9886198529', NULL, NULL, NULL, './uploads/profile-pics/581c57997923e.png'),
(10, 'Snow', 'White', NULL, 'test@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', 1, 'test', 'Austin', 'MD', '123', 4, 3, '9886198529', NULL, NULL, NULL, './uploads/profile-pics/581c588800d0d.png'),
(20, 'very', 'vfs', 'vbfsdgvfs', 'balu@gmail.com', '76010858c8362d7302ef5f9436aa6639', 22, 'balu ', 'San Antonio', 'CA', '123 Test Ln', 3, 2, '55236265', NULL, NULL, NULL, '/uploads/profile-pics/583d94dcf386a.png'),
(27, 'Timothy', 'Porter', 'timporter', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 2, '8792394035', NULL, 2, 'lord of rings', NULL),
(28, 'steve', 'jobs', 'steve', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 2, '8792394035', NULL, 1, 'Lord of the rings', NULL),
(29, 'Mark', 'Taylor', 'rwadmin', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 2, '8792394035', 2, 2, 'Lord of the rings', NULL),
(39, 'Lance', 'Johnson', 'lance', NULL, '827ccb0eea8a706c4c34a16891f84e7b', NULL, NULL, NULL, NULL, NULL, 3, 3, '', 2, 1, 'appddiction', './uploads/profile-pics/582eeb0af1cd9.png'),
(42, 'afd', 'asd', 'cdas', NULL, 'c2d128461711cb0d371c986a4a7cc001', NULL, NULL, NULL, 'TX', NULL, 1, 4, 'cadsf', NULL, NULL, NULL, '/uploads/profile-pics/583d9435171e6.png'),
(43, 'Edna', 'test', 'edna', NULL, '827ccb0eea8a706c4c34a16891f84e7b', NULL, NULL, NULL, 'TX', NULL, 1, 4, NULL, NULL, NULL, NULL, './uploads/profile-pics/5836ee074e64c.png'),
(45, 'Edna', 'Lozano', 'edna', NULL, '3ac4afe1829f4634bfee1951b7775b57', NULL, NULL, NULL, 'TX', NULL, 2, 4, '23456', NULL, NULL, NULL, '/uploads/profile-pics/583d925895ce5.png'),
(46, 'Donald', 'Trump', 'Donald', NULL, '3ac4afe1829f4634bfee1951b7775b57', NULL, NULL, NULL, 'TX', NULL, 2, 4, '123456', NULL, NULL, NULL, '/uploads/profile-pics/5839ddecb36f3.png'),
(48, 'grace', 'test', 'grace', NULL, '15e5c87b18c1289d45bb4a72961b58e8', NULL, NULL, NULL, 'TX', NULL, 1, 4, NULL, NULL, NULL, NULL, '/uploads/profile-pics/583cab243be7e.png'),
(49, 'bha', 'tha', 'test', NULL, 'c20ad4d76fe97759aa27a0c99bff6710', NULL, NULL, NULL, 'MD', NULL, 2, 5, NULL, NULL, NULL, NULL, '/uploads/profile-pics/583d043d30651.png'),
(50, 'dfw', 'fe', 'Zac', NULL, '37693cfc748049e45d87b8c7d8b9aacd', NULL, NULL, NULL, 'CA', NULL, 3, 2, NULL, NULL, NULL, NULL, '/uploads/profile-pics/583d12386a012.png'),
(51, 'fed', 'gds', 'dis', NULL, '03c7c0ace395d80182db07ae2c30f034', NULL, NULL, NULL, 'MD', NULL, 2, 5, NULL, NULL, NULL, NULL, '/uploads/profile-pics/583d36bd6fb79.png'),
(52, 'sdfg', 'gfdsgdrf', 'qqqq', NULL, '202cb962ac59075b964b07152d234b70', NULL, NULL, NULL, 'TX', NULL, 4, 1, '54544', NULL, NULL, NULL, '/uploads/profile-pics/583d93436489f.png'),
(53, 'fcd', 'vds', 'bharath', NULL, '827ccb0eea8a706c4c34a16891f84e7b', NULL, NULL, NULL, 'TX', NULL, 1, 4, '8565654', NULL, NULL, NULL, '/uploads/profile-pics/583d99145e905.png');

-- --------------------------------------------------------

--
-- Table structure for table `driver_description`
--

CREATE TABLE IF NOT EXISTS `driver_description` (
  `driver_description_id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(40) NOT NULL,
  PRIMARY KEY (`driver_description_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `driver_description`
--

INSERT INTO `driver_description` (`driver_description_id`, `description`) VALUES
(1, 'Teacher'),
(2, 'Administrator'),
(3, 'Route Driver'),
(4, 'Sub Driver'),
(5, 'School Employee'),
(6, 'Other');

-- --------------------------------------------------------

--
-- Table structure for table `forms`
--

CREATE TABLE IF NOT EXISTS `forms` (
  `form_id` int(200) NOT NULL AUTO_INCREMENT,
  `form_name` varchar(200) DEFAULT NULL,
  `form_description` varchar(2000) DEFAULT NULL,
  `school_id` int(200) DEFAULT NULL,
  `form_attachment` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`form_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `forms`
--

INSERT INTO `forms` (`form_id`, `form_name`, `form_description`, `school_id`, `form_attachment`) VALUES
(1, 'Form#1', 'Form 1 For Drivers', 1, '/uploads/forms/0dd8431e8b87d1964be57667865b6117.pdf'),
(2, '2 Form - Application', 'Application for Drivers', 5, '/uploads/forms/6b04afa8d15e1345367fe8d048191fc1.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `incidents`
--

CREATE TABLE IF NOT EXISTS `incidents` (
  `incident_id` int(200) NOT NULL AUTO_INCREMENT,
  `about_incident` varchar(200) DEFAULT NULL,
  `incident_type` varchar(200) DEFAULT NULL,
  `incident_description` varchar(2000) DEFAULT NULL,
  `incident_attachment` varchar(2000) DEFAULT NULL,
  `incident_location` varchar(200) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `phone` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`incident_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `incidents`
--

INSERT INTO `incidents` (`incident_id`, `about_incident`, `incident_type`, `incident_description`, `incident_attachment`, `incident_location`, `name`, `email`, `phone`) VALUES
(3, 'Test Incident', 'test incident type', 'test', '/uploads/incidents/cccfe941911b5a6438dc295438ee1fbc.PNG', 'test', 'John Cena', 'john.cena@testmail.com', '5555555555');

-- --------------------------------------------------------

--
-- Table structure for table `odometer_range`
--

CREATE TABLE IF NOT EXISTS `odometer_range` (
  `odometer_id` int(200) NOT NULL AUTO_INCREMENT,
  `range_value` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`odometer_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `odometer_range`
--

INSERT INTO `odometer_range` (`odometer_id`, `range_value`) VALUES
(1, '000005'),
(2, '000010'),
(3, '100000'),
(4, '250000');

-- --------------------------------------------------------

--
-- Table structure for table `pre_inspection`
--

CREATE TABLE IF NOT EXISTS `pre_inspection` (
  `id` int(11) NOT NULL,
  `brakes` enum('pass','fail') NOT NULL DEFAULT 'pass',
  `fuel` enum('pass','fail') NOT NULL DEFAULT 'pass',
  `generator_charging` enum('pass','fail') NOT NULL DEFAULT 'pass',
  `oil_pressure` enum('pass','fail') NOT NULL DEFAULT 'pass',
  `horn` enum('pass','fail') NOT NULL DEFAULT 'pass',
  `clean` enum('pass','fail') NOT NULL DEFAULT 'pass',
  `mirrors` enum('pass','fail') NOT NULL DEFAULT 'pass',
  `engine_start` enum('pass','fail') NOT NULL DEFAULT 'pass',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `routes_maps`
--

CREATE TABLE IF NOT EXISTS `routes_maps` (
  `route_id` int(200) NOT NULL AUTO_INCREMENT,
  `route_name` varchar(200) DEFAULT NULL,
  `school_id` int(200) DEFAULT NULL,
  `district_id` int(200) DEFAULT NULL,
  `route_start_latitude` varchar(200) DEFAULT NULL,
  `route_end_latitude` varchar(200) DEFAULT NULL,
  `route_start_longitude` varchar(200) DEFAULT NULL,
  `route_end_longitude` varchar(200) DEFAULT NULL,
  `route_map_attachment` varchar(2000) DEFAULT NULL,
  `route_type` int(10) DEFAULT NULL,
  `seat_arrangement_csv` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`route_id`),
  KEY `route_type` (`route_type`),
  KEY `route_type_2` (`route_type`),
  KEY `route_type_3` (`route_type`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `routes_maps`
--

INSERT INTO `routes_maps` (`route_id`, `route_name`, `school_id`, `district_id`, `route_start_latitude`, `route_end_latitude`, `route_start_longitude`, `route_end_longitude`, `route_map_attachment`, `route_type`, `seat_arrangement_csv`) VALUES
(1, 'Route1', 1, 2, NULL, NULL, NULL, NULL, '/uploads/route-maps/e3f88ecdf470f3f35264e24c4ddf66811479476920.pdf', 1, '/uploads/seat-arrangement-csv/a65ac7d8886d464a1cc73280390082ad.csv'),
(2, 'Route2', 1, 2, 'test', 'tes', 'test', 'test', '/uploads/route-maps/Route2.pdf', 1, NULL),
(3, 'The 3 Testing Route', 3, 4, '11.32432432', '11.3213213', '77.2312321', '22.324324', '/uploads/route-maps/Route3.pdf', 2, NULL),
(4, 'The 4 Testing Route', 3, 4, '11.32432432', '11.3213213', '77.2312321', '22.324324', '/uploads/route-maps/Route4.pdf', 2, NULL),
(5, 'test5', 2, 2, NULL, NULL, NULL, NULL, '/uploads/route-maps/7cce057472ace192c28687302da5464c1479898371.pdf', 2, '/uploads/seat-arrangement-csv/6987f59b5bfcdbe0d6cbdc636aebc8e2.png');

-- --------------------------------------------------------

--
-- Table structure for table `route_types`
--

CREATE TABLE IF NOT EXISTS `route_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `route_types`
--

INSERT INTO `route_types` (`id`, `type`) VALUES
(1, 'Standard'),
(2, 'Extracurricular'),
(3, 'Administrative'),
(4, 'Professional Development'),
(5, 'Special Education');

-- --------------------------------------------------------

--
-- Table structure for table `schools`
--

CREATE TABLE IF NOT EXISTS `schools` (
  `school_id` int(200) NOT NULL AUTO_INCREMENT,
  `district_id` int(200) NOT NULL,
  `school_name` varchar(200) NOT NULL,
  `school_address` varchar(200) NOT NULL,
  `school_description` varchar(200) NOT NULL,
  `school_pic` varchar(200) NOT NULL,
  `school_city` varchar(50) DEFAULT NULL,
  `mechanical_failure_number` varchar(25) DEFAULT NULL,
  `report_accident_number` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`school_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `schools`
--

INSERT INTO `schools` (`school_id`, `district_id`, `school_name`, `school_address`, `school_description`, `school_pic`, `school_city`, `mechanical_failure_number`, `report_accident_number`) VALUES
(1, 4, 'John Cena Elementary', '123 Wrestlemania Lane', 'Test', '/uploads/school-pics/16ecbe02039eb32a5d36fb5ce64f0680.png', 'San Antonio', '12105555555', '12105555556'),
(2, 3, 'Colarado School of Mines', 'test', 'test', '/uploads/school-pics/20dd9bfb54f938fff63e8bbbdc956bb7.ico', 'Denver', NULL, NULL),
(3, 4, 'Masachussets School', 'test', 'test', '/uploads/school-pics/c73da0013a568be318e539d51f067115.png', 'Boston', NULL, NULL),
(4, 1, 'School for District 1', 'None', 'School Testing ', '/uploads/school-pics/669fd9c72693e870ef4fac80005362fe.jpg', NULL, NULL, NULL),
(5, 2, 'District 2 School', '123 Wrestlemania Lane', 'Test', '/uploads/school-pics/16ecbe02039eb32a5d36fb5ce64f0680.png', 'Houston', '12105555555', '12105555556');

-- --------------------------------------------------------

--
-- Table structure for table `school_vehicle_threshold`
--

CREATE TABLE IF NOT EXISTS `school_vehicle_threshold` (
  `threshold_id` int(200) NOT NULL AUTO_INCREMENT,
  `school_id` int(200) DEFAULT NULL,
  `vehicle_id` int(200) DEFAULT NULL,
  `threshold` varchar(200) DEFAULT NULL,
  `threshold_value` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`threshold_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `school_vehicle_threshold`
--

INSERT INTO `school_vehicle_threshold` (`threshold_id`, `school_id`, `vehicle_id`, `threshold`, `threshold_value`) VALUES
(1, 1, NULL, 'Oil Leak', '6000 Kms/year'),
(2, 2, NULL, 'Tires air volume', 'testing the code'),
(3, 1, NULL, 'tESTING', 'tEST'),
(4, 2, 1, 'Lorem Ipsum', 'Lorem Ipsum');

-- --------------------------------------------------------

--
-- Table structure for table `security_questions`
--

CREATE TABLE IF NOT EXISTS `security_questions` (
  `question_id` int(220) NOT NULL AUTO_INCREMENT,
  `question` varchar(2000) NOT NULL,
  PRIMARY KEY (`question_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `security_questions`
--

INSERT INTO `security_questions` (`question_id`, `question`) VALUES
(1, 'What was your first pet''s name?'),
(2, 'Which one is your favorite movie?'),
(3, 'In what city or town did your mother and father meet?'),
(4, 'What is your favorite football team?'),
(5, 'What is your favorite movie?'),
(6, 'What was your favorite sport in high school?'),
(7, 'What school did you attend for sixth grade?'),
(8, 'What was the name of the company where you had your first job?'),
(9, 'What was the make and model of your first car?'),
(10, 'What is the middle name of your oldest child?');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(40) NOT NULL,
  `last_activity` int(10) NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE IF NOT EXISTS `students` (
  `student_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(200) NOT NULL,
  `last_name` varchar(200) NOT NULL,
  `school_id` int(11) NOT NULL,
  `district_id` int(11) NOT NULL,
  PRIMARY KEY (`student_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`student_id`, `first_name`, `last_name`, `school_id`, `district_id`) VALUES
(1, 'Timothy', 'Porter', 1, 1),
(2, 'Dwayne', 'Johnson', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `student_seating_chart`
--

CREATE TABLE IF NOT EXISTS `student_seating_chart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `school_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `seat_number` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `trip_history`
--

CREATE TABLE IF NOT EXISTS `trip_history` (
  `trip_id` int(200) NOT NULL AUTO_INCREMENT,
  `route_id` int(200) DEFAULT NULL,
  `school_id` int(11) DEFAULT NULL,
  `driver_id` int(11) DEFAULT NULL,
  `vehicle_id` int(11) DEFAULT NULL,
  `pre_inspection_id` int(200) DEFAULT NULL,
  `post_inspection_id` int(200) DEFAULT NULL,
  `total_riders` int(11) DEFAULT NULL,
  `total_distance` int(11) DEFAULT NULL,
  `trip_status` enum('complete','ongoing','incomplete') DEFAULT 'ongoing',
  `trip_time` datetime DEFAULT NULL,
  `pre_trip` enum('pass','fail') NOT NULL,
  `post_trip` enum('pass','fail') NOT NULL,
  `destination` varchar(50) DEFAULT NULL,
  `group_carried` varchar(50) DEFAULT NULL,
  `reason` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`trip_id`),
  KEY `vehicle_id` (`vehicle_id`),
  KEY `driver_id` (`driver_id`),
  KEY `route_id` (`route_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=39 ;

--
-- Dumping data for table `trip_history`
--

INSERT INTO `trip_history` (`trip_id`, `route_id`, `school_id`, `driver_id`, `vehicle_id`, `pre_inspection_id`, `post_inspection_id`, `total_riders`, `total_distance`, `trip_status`, `trip_time`, `pre_trip`, `post_trip`, `destination`, `group_carried`, `reason`) VALUES
(10, 1, 1, NULL, 1, 22, 23, 25, NULL, 'complete', '2016-12-31 08:30:00', 'pass', 'pass', NULL, NULL, NULL),
(11, 1, 1, NULL, 1, 22, 23, 25, 50, 'complete', '2016-12-31 08:30:00', 'pass', 'pass', NULL, NULL, NULL),
(12, 1, 1, NULL, 1, 22, 23, 25, 50, 'complete', '2016-12-31 08:30:00', 'pass', 'pass', NULL, NULL, NULL),
(14, 3, 1, NULL, 1, 52, 53, 4, 400, 'complete', '2016-12-31 08:30:00', 'pass', 'pass', NULL, NULL, NULL),
(16, 3, 1, NULL, 1, 82, 83, 4, 400, 'complete', '2016-12-31 08:30:00', 'pass', 'pass', NULL, NULL, NULL),
(17, 3, 1, NULL, 1, 84, 85, 4, 400, 'complete', '2016-12-31 08:30:00', 'pass', 'pass', NULL, NULL, NULL),
(19, 4, 1, NULL, NULL, 86, 87, NULL, NULL, 'ongoing', '2016-11-24 02:54:00', 'fail', 'pass', NULL, NULL, NULL),
(20, 2, 1, 6, NULL, 88, 89, 2, 3, 'ongoing', '2016-11-18 02:48:00', 'pass', 'pass', NULL, NULL, NULL),
(21, 2, NULL, 46, NULL, 189, 190, 23, NULL, 'ongoing', NULL, 'pass', 'pass', 'Switzerland', 'xyz', NULL),
(22, 1, NULL, 42, 1, 195, 196, 50, NULL, 'ongoing', NULL, 'pass', 'pass', 'USA', 'AAA', NULL),
(23, 1, NULL, 42, 1, 197, 198, 12, NULL, 'ongoing', NULL, 'pass', 'pass', 'USA', 'CASD', NULL),
(24, 1, NULL, 42, 3, 201, 202, 12, NULL, 'ongoing', NULL, 'pass', 'pass', 'Ny', 'vsd', NULL),
(25, 1, NULL, 42, 2, 203, 204, 12, NULL, 'ongoing', NULL, 'pass', 'pass', 'AF', 'fe', NULL),
(26, 2, NULL, NULL, 3, 213, 214, 4, 400, 'complete', '0000-11-30 00:51:18', 'pass', 'pass', NULL, NULL, NULL),
(27, 2, NULL, NULL, 3, 215, 216, 4, 400, 'complete', '0000-11-30 00:53:17', 'pass', 'pass', NULL, NULL, NULL),
(28, 1, NULL, 42, 2, 217, 218, 4, 400, 'complete', '0000-11-30 00:57:42', 'pass', 'pass', NULL, NULL, NULL),
(29, 1, NULL, NULL, 1, 219, 220, 4, 400, 'complete', '2016-12-31 08:30:00', 'pass', 'pass', NULL, NULL, NULL),
(30, 1, NULL, NULL, 5, 219, 220, 4, 400, 'complete', '2016-12-31 08:30:00', 'pass', 'pass', NULL, NULL, NULL),
(31, 1, NULL, NULL, 6, 219, 220, 4, 400, 'complete', '2016-12-31 08:30:00', 'pass', 'pass', NULL, NULL, NULL),
(32, 2, NULL, 43, 3, 241, 242, 4, 400, 'complete', '0000-11-29 15:41:20', 'pass', 'pass', NULL, NULL, NULL),
(33, 2, NULL, 48, 2, 243, 244, 2, NULL, 'ongoing', NULL, 'pass', 'pass', 'test', 'band', NULL),
(34, 2, NULL, 48, 2, 245, 246, 2, NULL, 'ongoing', NULL, 'pass', 'pass', 'test', 'band', NULL),
(35, 2, NULL, 48, 2, 241, 242, 4, 400, 'complete', '0000-11-29 15:41:20', 'pass', 'pass', NULL, NULL, NULL),
(36, 1, NULL, 48, 2, 247, 248, 4, 400, 'complete', '0000-11-29 19:55:58', 'pass', 'pass', NULL, NULL, NULL),
(37, 1, NULL, 48, 2, 249, 250, 3, NULL, 'ongoing', NULL, 'pass', 'pass', 'testte', 'group', NULL),
(38, 1, NULL, 48, 2, 247, 248, 4, 400, 'complete', '0000-11-29 19:55:58', 'pass', 'pass', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `trip_inspections`
--

CREATE TABLE IF NOT EXISTS `trip_inspections` (
  `inspection_id` int(200) NOT NULL AUTO_INCREMENT,
  `inspection_data` varchar(2000) NOT NULL,
  `comments` varchar(2000) DEFAULT NULL,
  `odometer_reading` int(11) DEFAULT NULL,
  PRIMARY KEY (`inspection_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=251 ;

--
-- Dumping data for table `trip_inspections`
--

INSERT INTO `trip_inspections` (`inspection_id`, `inspection_data`, `comments`, `odometer_reading`) VALUES
(15, 'YToyOntpOjE7czozOiJ5ZXMiO2k6MjtzOjM6InllcyI7fQ==', '', NULL),
(16, 'YTo0OntpOjE7czozOiJ5ZXMiO2k6MjtzOjI6Im5vIjtzOjY6Il90b2tlbiI7czo0MDoiWU5YVkxUNkpYZU43R0c1Qjl4bE1JN3dndHl5WjJEUGJLTEh0NG95YyI7czoxNDoicG9zdF9zdXJ2ZXlfaWQiO3M6MjoiMTYiO30=', '', NULL),
(17, 'YTo0OntpOjE7czozOiJ5ZXMiO2k6MjtzOjM6InllcyI7czo2OiJfdG9rZW4iO3M6NDA6IkdnMERVdFBMeGhSNzhPNXBJYkV6cG1Ua3FiZ25FSW1iSnB3a0h0RHIiO3M6MTQ6InBvc3Rfc3VydmV5X2lkIjtzOjI6IjE2Ijt9', '', NULL),
(18, 'YTo0OntpOjE7czozOiJ5ZXMiO2k6MjtzOjM6InllcyI7czo2OiJfdG9rZW4iO3M6NDA6IkdnMERVdFBMeGhSNzhPNXBJYkV6cG1Ua3FiZ25FSW1iSnB3a0h0RHIiO3M6MTQ6InBvc3Rfc3VydmV5X2lkIjtzOjI6IjE2Ijt9', '', NULL),
(19, 'YToyOntpOjE7czozOiJ5ZXMiO2k6MjtzOjM6InllcyI7fQ==', 'Testing the api', NULL),
(20, 'YToyOntpOjE7czozOiJ5ZXMiO2k6MjtzOjM6InllcyI7fQ==', 'Testing the api', NULL),
(21, 'YToyOntpOjE7czozOiJ5ZXMiO2k6MjtzOjI6Im5vIjt9', 'Testing the api !', NULL),
(22, 'YTo2OntpOjIyO3M6MzoieWVzIjtpOjIxO3M6MzoieWVzIjtpOjIwO3M6Mjoibm8iO2k6MTk7czozOiJ5ZXMiO2k6MTg7czozOiJ5ZXMiO2k6NDc7czozOiJ5ZXMiO30=', 'Hello World', 123456),
(23, 'YTo2OntpOjU7czozOiJ5ZXMiO2k6NjtzOjM6InllcyI7aTo3O3M6Mjoibm8iO2k6ODtzOjM6InllcyI7aTo5O3M6MzoieWVzIjtpOjEwO3M6MzoieWVzIjt9', 'Post Trip Inspection', 234567),
(24, 'YTo2OntpOjIyO3M6MzoieWVzIjtpOjIxO3M6MzoieWVzIjtpOjIwO3M6Mjoibm8iO2k6MTk7czozOiJ5ZXMiO2k6MTg7czozOiJ5ZXMiO2k6NDc7czozOiJ5ZXMiO30=', 'Pre Trip Inspection', 123456),
(25, '', '', NULL),
(26, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', 'Not working', 5),
(27, '', '', NULL),
(28, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', 'Not working', 5),
(29, '', '', NULL),
(30, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', 'Fail', 5),
(31, '', '', NULL),
(32, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', 'Not working', 5),
(33, '', '', NULL),
(34, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', 'Ailed', 5),
(35, '', '', NULL),
(36, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', 'Hk', 5),
(37, '', '', NULL),
(38, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', 'Hk', 5),
(39, '', '', NULL),
(40, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', 'Not working', 5),
(41, '', '', NULL),
(42, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', 'Not working', 5),
(43, '', '', NULL),
(44, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', 'Not working', 5),
(45, '', '', NULL),
(46, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', 'Fail', 5),
(47, '', '', NULL),
(48, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', 'Fail', 5),
(49, '', '', NULL),
(50, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', 'Fail', 5),
(51, '', '', NULL),
(52, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', 'Fail', 5),
(53, '', '', NULL),
(54, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '(null)', 1),
(55, '', '', NULL),
(56, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', 'Fail', 1),
(57, '', '', NULL),
(58, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', 'Fail', 0),
(59, '', '', NULL),
(60, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '(null)', 0),
(61, '', '', NULL),
(62, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', 'Fail', 5),
(63, '', '', NULL),
(64, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', 'Fail', 5),
(65, '', '', NULL),
(66, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '(null)', 5),
(67, '', '', NULL),
(68, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '(null)', 5),
(69, '', '', NULL),
(70, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 5),
(71, '', '', NULL),
(72, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 5),
(73, '', '', NULL),
(74, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 5),
(75, '', '', NULL),
(76, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 5),
(77, '', '', NULL),
(78, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 5),
(79, '', '', NULL),
(80, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 222020),
(81, '', '', NULL),
(82, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 2),
(83, '', '', NULL),
(84, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 555555),
(85, '', '', NULL),
(86, 'YToxNDp7aTo0O3M6Mjoibm8iO2k6MTA7czozOiJ5ZXMiO2k6MTE7czozOiJ5ZXMiO2k6MTI7czozOiJ5ZXMiO2k6MTM7czozOiJ5ZXMiO2k6MTQ7czozOiJ5ZXMiO2k6MTU7czozOiJ5ZXMiO2k6MTY7czozOiJ5ZXMiO2k6MTc7czozOiJ5ZXMiO2k6MTg7czozOiJ5ZXMiO2k6MTk7czozOiJ5ZXMiO2k6MjA7czozOiJ5ZXMiO2k6MjE7czozOiJ5ZXMiO2k6MjI7czozOiJ5ZXMiO30=', 'left side is broken', 2),
(87, 'YTowOnt9', NULL, NULL),
(88, 'YToxNDp7aTo0O3M6MzoieWVzIjtpOjEwO3M6MzoieWVzIjtpOjExO3M6MzoieWVzIjtpOjEyO3M6MzoieWVzIjtpOjEzO3M6MzoieWVzIjtpOjE0O3M6MzoieWVzIjtpOjE1O3M6MzoieWVzIjtpOjE2O3M6MzoieWVzIjtpOjE3O3M6MzoieWVzIjtpOjE4O3M6MzoieWVzIjtpOjE5O3M6MzoieWVzIjtpOjIwO3M6MzoieWVzIjtpOjIxO3M6MzoieWVzIjtpOjIyO3M6MzoieWVzIjt9', 'Test', 2),
(89, 'YTo2OntpOjU7czoyOiJubyI7aTo2O3M6Mjoibm8iO2k6NztzOjM6InllcyI7aTo4O3M6MzoieWVzIjtpOjk7czozOiJ5ZXMiO3M6MTQ6InBvc3Rfc3VydmV5X2lkIjtzOjI6Ijg5Ijt9', 'Test', 1),
(90, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 53444),
(91, '', '', NULL),
(92, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 423544),
(93, '', '', NULL),
(94, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 423544),
(95, '', '', NULL),
(96, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 423544),
(97, '', '', NULL),
(98, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 13464),
(99, '', '', NULL),
(100, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 13464),
(101, '', '', NULL),
(102, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 23445),
(103, '', '', NULL),
(104, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 23444),
(105, '', '', NULL),
(106, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 23444),
(107, '', '', NULL),
(108, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 23444),
(109, '', '', NULL),
(110, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 23444),
(111, '', '', NULL),
(112, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 23444),
(113, '', '', NULL),
(114, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 23444),
(115, '', '', NULL),
(116, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 55555),
(117, '', '', NULL),
(118, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 55555),
(119, '', '', NULL),
(120, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 23444),
(121, '', '', NULL),
(122, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 23444),
(123, '', '', NULL),
(124, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 23444),
(125, '', '', NULL),
(126, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 23444),
(127, '', '', NULL),
(128, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 23444),
(129, '', '', NULL),
(130, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 23444),
(131, '', '', NULL),
(132, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 23444),
(133, '', '', NULL),
(134, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 23444),
(135, '', '', NULL),
(136, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 23444),
(137, '', '', NULL),
(138, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 23444),
(139, '', '', NULL),
(140, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 1),
(141, '', '', NULL),
(142, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 1),
(143, '', '', NULL),
(144, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 1),
(145, '', '', NULL),
(146, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 1),
(147, '', '', NULL),
(148, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 1),
(149, '', '', NULL),
(150, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 1),
(151, '', '', NULL),
(152, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 1),
(153, '', '', NULL),
(154, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 1),
(155, '', '', NULL),
(156, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 1),
(157, '', '', NULL),
(158, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 1),
(159, '', '', NULL),
(160, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 1),
(161, '', '', NULL),
(162, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 1),
(163, '', '', NULL),
(164, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 1),
(165, '', '', NULL),
(166, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 1),
(167, '', '', NULL),
(168, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 1),
(169, '', '', NULL),
(170, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 1),
(171, '', '', NULL),
(172, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 1),
(173, '', '', NULL),
(174, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 1),
(175, '', '', NULL),
(176, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 1),
(177, '', '', NULL),
(178, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 1),
(179, '', '', NULL),
(180, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', 'Not working - broken', 653090),
(181, '', '', NULL),
(182, 'YTowOnt9', NULL, 1234),
(183, 'YTowOnt9', NULL, 1234),
(184, 'YTowOnt9', NULL, 1234),
(185, 'YTowOnt9', NULL, 1234),
(186, 'YTowOnt9', NULL, 1234),
(187, 'YTowOnt9', NULL, 1234),
(188, 'YTowOnt9', NULL, 1234),
(189, 'YTowOnt9', NULL, 1234),
(190, 'YTowOnt9', NULL, 1234),
(191, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 403444),
(192, '', '', NULL),
(193, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 423404),
(194, '', '', NULL),
(195, 'YTowOnt9', NULL, 23444),
(196, 'YTowOnt9', NULL, 23444),
(197, 'YTowOnt9', NULL, 23444),
(198, 'YTowOnt9', NULL, 23444),
(199, 'YTowOnt9', NULL, 23444),
(200, 'YTowOnt9', NULL, 23444),
(201, 'YTowOnt9', NULL, 23444),
(202, 'YTowOnt9', NULL, 23444),
(203, 'YTowOnt9', NULL, 23444),
(204, 'YTowOnt9', NULL, 23444),
(205, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 23444),
(206, '', '', NULL),
(207, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 23444),
(208, '', '', NULL),
(209, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 23444),
(210, '', '', NULL),
(211, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 23444),
(212, '', '', NULL),
(213, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 23444),
(214, '', '', NULL),
(215, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 23444),
(216, '', '', NULL),
(217, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 23444),
(218, '', '', NULL),
(219, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 123478),
(220, '', '', NULL),
(221, 'YTowOnt9', NULL, 223444),
(222, 'YTowOnt9', NULL, 223444),
(223, 'YTowOnt9', NULL, 223444),
(224, 'YTowOnt9', NULL, 223444),
(225, 'YTowOnt9', NULL, 223444),
(226, 'YTowOnt9', NULL, 223444),
(227, 'YTowOnt9', NULL, 223444),
(228, 'YTowOnt9', NULL, 223444),
(229, 'YTowOnt9', NULL, 223444),
(230, 'YTowOnt9', NULL, 223444),
(231, 'YTowOnt9', NULL, 223444),
(232, 'YTowOnt9', NULL, 223444),
(233, 'YTowOnt9', NULL, 223444),
(234, 'YTowOnt9', NULL, 223444),
(235, 'YTowOnt9', NULL, 223444),
(236, 'YTowOnt9', NULL, 223444),
(237, 'YTowOnt9', NULL, 223444),
(238, 'YTowOnt9', NULL, 223444),
(239, 'YTowOnt9', NULL, 223444),
(240, 'YTowOnt9', NULL, 223444),
(241, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 223444),
(242, '', '', NULL),
(243, 'YTowOnt9', NULL, 323444),
(244, 'YTowOnt9', NULL, 323444),
(245, 'YTowOnt9', NULL, 323444),
(246, 'YTowOnt9', NULL, 323444),
(247, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', 'Edna nov 29', 423444),
(248, '', '', NULL),
(249, 'YTowOnt9', NULL, 123444),
(250, 'YTowOnt9', NULL, 123444);

-- --------------------------------------------------------

--
-- Table structure for table `trip_inspection_steps`
--

CREATE TABLE IF NOT EXISTS `trip_inspection_steps` (
  `inspection_step_id` int(200) NOT NULL AUTO_INCREMENT,
  `step` varchar(2000) NOT NULL,
  `step_image` varchar(2000) NOT NULL,
  `inspection_type` enum('pre','post') NOT NULL,
  PRIMARY KEY (`inspection_step_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=23 ;

--
-- Dumping data for table `trip_inspection_steps`
--

INSERT INTO `trip_inspection_steps` (`inspection_step_id`, `step`, `step_image`, `inspection_type`) VALUES
(4, 'Left side of the cab area', '/uploads/inspection-steps/f1322417c7a5dcb4a13d837ac6420033.png', 'pre'),
(5, 'Any students left on the bus', '/uploads/inspection-steps/0a697045b3d1d16a73044b882028a7e2.ico', 'post'),
(6, 'Any items left on the bus', '/uploads/inspection-steps/2f65502c4b6c6c176f85b7fa654e7985.ico', 'post'),
(7, 'Any Open windows/doors', '/uploads/inspection-steps/055b1fbab05cc3ee1d2988ccc4cb8a29.ico', 'post'),
(8, 'Any mechanical/operational problems to report', '/uploads/inspection-steps/6d0a60c70fef69bfaea4b217b5847e6d.ico', 'post'),
(9, 'Any damage or vandalism', '/uploads/inspection-steps/13edb8fca22aa21e165b9bc8c7a511b3.ico', 'post'),
(10, 'Front of cab area', '/uploads/inspection-steps/a8ded9468edd89c0c5b458f6af7cc100.PNG', 'pre'),
(11, 'Right side of cab area', '/uploads/inspection-steps/b6849ea0a5b5defa3b3ac07e56bffdae.PNG', 'pre'),
(12, 'Right saddle tank area', '/uploads/inspection-steps/5810ea5b0c884b2f6f2afbc4f51288bf.PNG', 'pre'),
(13, 'Trailer Frontal area', '/uploads/inspection-steps/4405fd15ef814bc31b9fd92b09462d8b.PNG', 'pre'),
(14, 'Right tractor wheels area', '/uploads/inspection-steps/c2ad94201bab6e0cfe59ec33665f3973.PNG', 'pre'),
(15, 'Rear of tractor area', '/uploads/inspection-steps/1a725c7b81ddf4491a4a4f0c59c4a413.PNG', 'pre'),
(16, 'Coupling system area', '/uploads/inspection-steps/191ee7b4e123730e5d7b4876a0e76386.PNG', 'pre'),
(17, 'Right side of trailer area', '/uploads/inspection-steps/311668d297edcf3929b02310d51cd07f.PNG', 'pre'),
(18, 'Right rear trailer wheels area', '/uploads/inspection-steps/4e8f314327eb25e8ed7537e177b23380.PNG', 'pre'),
(19, 'Rear of trailer area', '/uploads/inspection-steps/bceafebd7b2ae8d5f71c61b115cbd6f5.PNG', 'pre'),
(20, 'Left rear trailer wheels area', '/uploads/inspection-steps/cb9cef21adfb457bcebe95cc4dbc7b5d.PNG', 'pre'),
(21, 'Left side of trailer area', '/uploads/inspection-steps/4578a6c43740cac567bc1e04727897bf.PNG', 'pre'),
(22, 'Left saddle tank area', '/uploads/inspection-steps/fc1c41652471f01bec50546e28717073.PNG', 'pre');

-- --------------------------------------------------------

--
-- Table structure for table `vehicles`
--

CREATE TABLE IF NOT EXISTS `vehicles` (
  `vehicle_id` int(200) NOT NULL AUTO_INCREMENT,
  `vehicle_name` varchar(200) DEFAULT NULL,
  `vehicle_no` varchar(200) DEFAULT NULL,
  `vehicle_image` varchar(2000) DEFAULT NULL,
  `mileage` varchar(200) DEFAULT NULL,
  `occupancy` int(10) DEFAULT NULL,
  `authorized_drivers` varchar(200) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `school_id` int(200) DEFAULT NULL,
  `vehicle_type` int(11) DEFAULT NULL,
  `district_id` int(11) DEFAULT NULL,
  `seat_arrangement_csv` varchar(2000) DEFAULT NULL,
  `year_model` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`vehicle_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `vehicles`
--

INSERT INTO `vehicles` (`vehicle_id`, `vehicle_name`, `vehicle_no`, `vehicle_image`, `mileage`, `occupancy`, `authorized_drivers`, `created_date`, `school_id`, `vehicle_type`, `district_id`, `seat_arrangement_csv`, `year_model`) VALUES
(1, NULL, '#KA1234ABCD', '/uploads/vehicle-pics/8f2bbf52f113b8cc83a8232dd53cc9c5.jpg', '54789', 33, NULL, '1970-01-01 00:00:00', NULL, 2, 2, '/uploads/seat-arrangement-csv/c329f4732cdcc08aee95d3b99b7c1c82.csv', '1982'),
(2, NULL, '#AC13045678ABD', '/uploads/vehicle-pics/5b0a672cea0f167bf7441c06e75bcf28.png', '136000', 33, NULL, '1970-01-01 00:00:00', NULL, 1, 3, '/uploads/seat-arrangement-csv/5b0a672cea0f167bf7441c06e75bcf28.csv', '1990'),
(3, NULL, '#KA1234ABCD', '/uploads/vehicle-pics/8f2bbf52f113b8cc83a8232dd53cc9c5.jpg', '54789', 33, NULL, '1970-01-01 00:00:00', NULL, 1, 1, '/uploads/seat-arrangement-csv/c329f4732cdcc08aee95d3b99b7c1c82.csv', '2009'),
(5, NULL, '#US12321', NULL, '14522', 30, NULL, '1970-01-01 00:00:00', NULL, 2, 4, NULL, '2014'),
(6, '#US130012', '#US130012', NULL, NULL, NULL, NULL, NULL, NULL, 3, 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_maintenance_history`
--

CREATE TABLE IF NOT EXISTS `vehicle_maintenance_history` (
  `issue_id` int(200) NOT NULL AUTO_INCREMENT,
  `school_id` int(200) NOT NULL,
  `vehicle_id` int(200) NOT NULL,
  `driver_id` int(200) NOT NULL,
  `problem_occured_time` datetime NOT NULL,
  `problem` int(200) NOT NULL,
  `problem_location` varchar(200) NOT NULL,
  `comments` varchar(2000) NOT NULL,
  PRIMARY KEY (`issue_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `vehicle_maintenance_history`
--

INSERT INTO `vehicle_maintenance_history` (`issue_id`, `school_id`, `vehicle_id`, `driver_id`, `problem_occured_time`, `problem`, `problem_location`, `comments`) VALUES
(4, 3, 1, 1, '2016-12-12 00:00:00', 1, 'Test', 'Hello World'),
(5, 2, 1, 1, '2016-11-23 02:14:00', 2, 'Test', 'Hello World'),
(6, 1, 1, 1, '2016-12-12 00:00:00', 1, 'Test', 'Hello World'),
(7, 1, 1, 1, '2016-10-10 08:30:00', 1, 'Utah', 'Discipline Referral Comments'),
(8, 3, 4, 6, '1970-01-01 00:00:00', 1, 'Utah', 'Nice!!'),
(9, 3, 3, 7, '1970-01-01 00:00:00', 1, 'Utah', 'Great!'),
(10, 1, 2, 8, '1970-01-01 00:00:00', 1, 'Utah', ''),
(11, 1, 2, 1, '1970-01-01 00:00:00', 1, 'Utah', 'Testing app by Lance ');

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_type`
--

CREATE TABLE IF NOT EXISTS `vehicle_type` (
  `vehicle_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(40) NOT NULL,
  PRIMARY KEY (`vehicle_type_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `vehicle_type`
--

INSERT INTO `vehicle_type` (`vehicle_type_id`, `description`) VALUES
(1, 'Bus'),
(2, 'Suburban'),
(3, 'Cargo');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `routes_maps`
--
ALTER TABLE `routes_maps`
  ADD CONSTRAINT `route_type_fk` FOREIGN KEY (`route_type`) REFERENCES `route_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `trip_history`
--
ALTER TABLE `trip_history`
  ADD CONSTRAINT `drivers_id_fk` FOREIGN KEY (`driver_id`) REFERENCES `drivers` (`driver_id`),
  ADD CONSTRAINT `route_id_fk` FOREIGN KEY (`route_id`) REFERENCES `routes_maps` (`route_id`),
  ADD CONSTRAINT `vehicles_id_fk` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicles` (`vehicle_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
