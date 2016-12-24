-- phpMyAdmin SQL Dump
-- version 4.0.10.14
-- http://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: Dec 22, 2016 at 06:34 AM
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
-- Table structure for table `discipline_offense`
--

CREATE TABLE IF NOT EXISTS `discipline_offense` (
  `discipline_offense_id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`discipline_offense_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `discipline_offense`
--

INSERT INTO `discipline_offense` (`discipline_offense_id`, `description`) VALUES
(1, 'Bullying'),
(2, 'Vandailsm'),
(3, 'Insobordination'),
(4, 'Graffiti'),
(5, 'Forbidden Item'),
(6, 'Foul Language'),
(7, 'Test');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=27 ;

--
-- Dumping data for table `discipline_referrals`
--

INSERT INTO `discipline_referrals` (`complaint_id`, `school_id`, `driver_id`, `student_name`, `offence`, `offence_time`, `offence_location`, `vehicle_id`, `comments`, `parents_notified`) VALUES
(3, 1, 9, 'Tim', '1', '2016-12-14 01:30:00', 'Test', 1, 'Hello World', 'yes'),
(4, 1, 1, 'Tim', 'Test', '2016-12-12 00:00:00', 'Test', 1, 'Hello World', 'yes'),
(5, 1, 1, 'Tim', 'Test', '2016-12-12 00:00:00', 'Test', 1, 'Hello World', 'yes'),
(6, 1, 1, 'edna', 'Bullying', '2016-10-10 08:30:00', 'Utah', 1, 'Discipline Referral Comments', 'yes'),
(7, 1, 1, 'Timothy Porter', '11/18/16, 7:23:17 PM Pacific Standard Time', NULL, 'Utah', 1, '', NULL),
(8, 3, 6, 'Timothy Porter', '11/23/16, 6:43:44 PM Pacific Standard Time', NULL, 'Utah', 5, 'Great!', NULL),
(9, 1, 8, 'Timothy Porter', '11/23/16, 12:34:40 PM Central Standard Time', NULL, 'Utah', 3, '', NULL),
(10, 3, 6, 'Timothy Porter', '11/25/16, 9:50:42 AM Central Standard Time', NULL, 'Utah', 1, 'Testing app by Lance ', NULL),
(11, 1, 1, 'Dwayne Johnson', '12/1/16, 10:50:24 AM Pacific Standard Time', NULL, 'Utah', 5, 'Nice', NULL),
(12, 3, 6, 'Dwayne Johnson', '4', NULL, 'Utah', 2, 'Good', NULL),
(13, 3, 6, 'Dwayne Johnson', '4', NULL, 'America', 8, 'Nice', NULL),
(14, 3, 6, 'Dwayne Johnson', '6', NULL, 'India', 1, 'Okay', NULL),
(15, 2, 27, 'Timothy Porter', '6', NULL, '', 3, 'Commentspink', NULL),
(16, 3, 10, 'Timothy Porter', '5', NULL, '', 12, 'Pinkcomment', NULL),
(17, 1, 1, 'edna', 'Bullying', '2016-10-10 08:30:00', 'Utah', 1, 'Discipline Referral Comments', NULL),
(18, 1, 1, 'pink', 'Bullying', '2016-10-10 08:30:00', 'Utah', 1, 'Discipline Referral Comments', NULL),
(19, 2, 6, 'N.Srinivasulu Rao', '2', '2016-12-08 04:18:00', 'test', 1, 'test', NULL),
(20, 3, 6, 'Dwayne Johnson', '7', '1970-01-01 00:00:00', 'America', 1, 'Good', NULL),
(21, 1, 1, 'edna', 'Bullying', '2016-10-10 08:30:00', 'Utah', 1, 'Discipline Referral Comments', NULL),
(22, 1, 55, 'Timothy Porter', '5', '2016-12-07 12:03:00', 'USA', 8, 'Good', NULL),
(23, 4, 53, 'Dwayne Johnson', '1', '2016-12-07 12:10:00', 'America', 1, 'Good', NULL),
(24, 4, 48, 'Timothy Porter', '1', '2016-12-07 16:17:00', 'America', 1, 'Good', NULL),
(25, 1, 88, 'Dwayne Johnson', '1', '2016-12-19 09:33:00', '', 13, 'Test', NULL),
(26, 1, 88, 'Dwayne Johnson', '1', '2016-12-19 09:33:00', '', 13, 'Test', NULL);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=111 ;

--
-- Dumping data for table `drivers`
--

INSERT INTO `drivers` (`driver_id`, `first_name`, `last_name`, `username`, `email`, `password`, `total_exp`, `about_driver`, `city`, `state`, `address`, `district_id`, `school_id`, `phone`, `driver_description`, `security_question`, `security_answer`, `profile_pic`) VALUES
(6, 'Lance', ' Johnson', NULL, 'test@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', 1, 'test', 'Austin', 'CA', 'Tes', 4, 3, '9886198529', 3, 3, 'hello', './uploads/profile-pics/581c3ab3a859c.png'),
(7, 'John', 'Cena', NULL, 'test1@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', 2, 'test', 'Baltimore', 'MD', '123 Test Ln', 2, 3, '9886198529', 4, 4, 'hello', './uploads/profile-pics/581c3fd07288e.png'),
(8, 'Axel', 'Rose', NULL, 'test@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', 1, 'test', 'Baltimore', 'MD', '123', 2, 1, '9886198529', 1, 4, 'hello', './uploads/profile-pics/581c539f7f529.png'),
(9, 'Eric', 'Clapton', NULL, 'test@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', 1, 'test', 'Baltimore', 'TX', 'Tes', 4, 1, '9886198529', 2, 2, 'hello', './uploads/profile-pics/581c57997923e.png'),
(10, 'Snow', 'White', NULL, 'test@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', 1, 'test', 'Austin', 'MD', '123', 4, 3, '9886198529', 3, 5, 'hello', './uploads/profile-pics/581c588800d0d.png'),
(20, 'very', 'vfs', 'vbfsdgvfs', 'balu@gmail.com', '76010858c8362d7302ef5f9436aa6639', 22, 'balu ', 'San Antonio', 'CA', '123 Test Ln', 3, 2, '55236265', 4, 3, 'hello', '/uploads/profile-pics/583d94dcf386a.png'),
(27, 'Timothy', 'Porter', 'timporter', NULL, NULL, NULL, NULL, NULL, 'TX', NULL, 1, 2, '8792394035', 1, 2, 'lord of rings', NULL),
(28, 'steve', 'jobs', 'steve', NULL, NULL, NULL, NULL, NULL, 'TX', NULL, 4, 2, '8792394035', 2, 1, 'Lord of the rings', NULL),
(29, 'Mark', 'Taylor', 'rwadmin', NULL, NULL, NULL, NULL, NULL, 'TX', NULL, 1, 2, '8792394035', 2, 2, 'Lord of the rings', NULL),
(39, 'Lance', 'Johnson', 'lance', NULL, '827ccb0eea8a706c4c34a16891f84e7b', NULL, NULL, NULL, 'TX', NULL, 3, 2, '123456789', 2, 1, 'appddiction', './uploads/profile-pics/582eeb0af1cd9.png'),
(42, 'afd', 'asd', 'cdas', NULL, 'c2d128461711cb0d371c986a4a7cc001', NULL, NULL, NULL, 'TX', NULL, 1, 4, 'cadsf', 3, 2, 'hello', '/uploads/profile-pics/583d9435171e6.png'),
(43, 'Edna', 'test', 'edna', NULL, '827ccb0eea8a706c4c34a16891f84e7b', NULL, NULL, NULL, 'TX', NULL, 1, 4, '123456789', 4, 2, 'hello', './uploads/profile-pics/5836ee074e64c.png'),
(45, 'Edna', 'Lozano', 'edna', NULL, '3ac4afe1829f4634bfee1951b7775b57', NULL, NULL, NULL, 'TX', NULL, 2, 4, '23456', 1, 3, 'hello', '/uploads/profile-pics/5846ab4d49d97.png'),
(46, 'Donald', 'Trump', 'Donald', NULL, '3ac4afe1829f4634bfee1951b7775b57', NULL, NULL, NULL, 'TX', NULL, 2, 4, '123456', 2, 1, 'hello', '/uploads/profile-pics/5839ddecb36f3.png'),
(48, 'grace', 'test', 'grace', NULL, 'c20ad4d76fe97759aa27a0c99bff6710', NULL, NULL, NULL, 'TX', NULL, 1, 4, '123456789', 3, 3, 'hello', '/uploads/profile-pics/583cab243be7e.png'),
(49, 'bha', 'tha', 'test', NULL, 'c20ad4d76fe97759aa27a0c99bff6710', NULL, NULL, NULL, 'MD', NULL, 2, 5, '123456789', 2, 4, 'hello', '/uploads/profile-pics/583d043d30651.png'),
(50, 'dfw', 'fe', 'Zac', NULL, '37693cfc748049e45d87b8c7d8b9aacd', NULL, NULL, NULL, 'CA', NULL, 3, 2, '123456789', 4, 4, 'hello', '/uploads/profile-pics/583d12386a012.png'),
(51, 'fed', 'gds', 'dis', NULL, '03c7c0ace395d80182db07ae2c30f034', NULL, NULL, NULL, 'MD', NULL, 2, 5, '123456789', 1, 1, 'hello', '/uploads/profile-pics/583d36bd6fb79.png'),
(52, 'sdfg', 'gfdsgdrf', 'qqqq', NULL, '202cb962ac59075b964b07152d234b70', NULL, NULL, NULL, 'TX', NULL, 4, 1, '54544', 2, 5, 'hello', '/uploads/profile-pics/583d93436489f.png'),
(53, 'fcd', 'vds', 'bharath', NULL, '202cb962ac59075b964b07152d234b70', NULL, NULL, NULL, 'CA', NULL, 3, 2, '535265', 4, 4, 'meow', '/uploads/profile-pics/583d99145e905.png'),
(54, 'Zac', 'efrom', 'zac', NULL, '202cb962ac59075b964b07152d234b70', NULL, NULL, NULL, 'TX', NULL, 1, 4, '123456789', 3, 5, 'hello', '/uploads/profile-pics/583e4ea414358.png'),
(55, 'vds', 'fad', 'www', NULL, '202cb962ac59075b964b07152d234b70', NULL, NULL, NULL, 'TX', NULL, 4, 1, '123456789', 4, 1, 'hello', '/uploads/profile-pics/583eb056a6c53.png'),
(56, 'Donald', 'Trump', 'Donald', NULL, '3ac4afe1829f4634bfee1951b7775b57', NULL, NULL, NULL, 'TX', NULL, 2, 4, '123456', 1, 1, 'hello', '/uploads/profile-pics/583eb0cf43b93.png'),
(57, 'fed', 'vds', 'zac1', NULL, '202cb962ac59075b964b07152d234b70', NULL, NULL, NULL, 'TX', NULL, 4, 1, '123456789', 2, 2, 'hello', '/uploads/profile-pics/583ecf5a36e6b.png'),
(58, 'edna30', 'lozano30', 'edna30', NULL, '827ccb0eea8a706c4c34a16891f84e7b', NULL, NULL, NULL, 'MD', NULL, 2, 5, '123456789', 3, 2, 'hello', '/uploads/profile-pics/583ed073e7688.png'),
(59, 'gd', 'bbdgh', 'yyy', NULL, '202cb962ac59075b964b07152d234b70', NULL, NULL, NULL, 'CA', NULL, 3, 2, '123456789', 4, 6, 'hello', '/uploads/profile-pics/583ed19d92408.png'),
(60, 'hfg', 'did', 'sad', NULL, '202cb962ac59075b964b07152d234b70', NULL, NULL, NULL, 'CA', NULL, 3, 2, NULL, NULL, NULL, NULL, '/uploads/profile-pics/583ed2d8b7895.png'),
(61, 'bobby', 'sings', 'Tim', NULL, '827ccb0eea8a706c4c34a16891f84e7b', NULL, NULL, NULL, 'TX', NULL, 4, 1, NULL, NULL, NULL, NULL, '/uploads/profile-pics/583f9697af360.png'),
(62, 'fifth', 'cdas', 'did', NULL, '202cb962ac59075b964b07152d234b70', NULL, NULL, NULL, 'TX', NULL, 1, 4, NULL, NULL, NULL, NULL, '/uploads/profile-pics/583ff27a747b1.png'),
(63, 'edna', 'lozano', 'ronaldo', NULL, 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, NULL, 'lozano', NULL, 1, 1, '123456', 1, 2, 'Lord of the rings', '/uploads/profile-pics/583ff42b4a8db.png'),
(64, 'as', 'sad', 'we', NULL, '202cb962ac59075b964b07152d234b70', NULL, NULL, NULL, 'TX', NULL, 1, 4, NULL, NULL, NULL, NULL, '/uploads/profile-pics/583ffcbdb1c88.png'),
(65, 'vdfs', 'vds', 'ppp', NULL, '202cb962ac59075b964b07152d234b70', NULL, NULL, NULL, 'CA', NULL, 3, 2, NULL, NULL, NULL, NULL, '/uploads/profile-pics/583ffd342e154.png'),
(66, 'bharath', 'iOS', 'bha', NULL, '202cb962ac59075b964b07152d234b70', NULL, NULL, NULL, 'TX', NULL, 4, 1, NULL, NULL, NULL, NULL, '/uploads/profile-pics/58450959525e0.png'),
(67, 'edna', 'lozano', 'edna', NULL, 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, NULL, 'lozano', NULL, 1, 1, NULL, NULL, NULL, NULL, NULL),
(68, 'edna', 'lozano', 'edna', NULL, 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, NULL, 'lozano', NULL, 1, 1, NULL, NULL, NULL, NULL, NULL),
(69, 'edna', 'lozano', 'edna', NULL, 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, NULL, 'lozano', NULL, 1, 1, NULL, NULL, NULL, NULL, NULL),
(70, 'edna', 'lozano', 'edna', NULL, 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, NULL, 'lozano', NULL, 1, 1, NULL, NULL, NULL, NULL, NULL),
(71, 'edna', 'lozano', 'edna', NULL, 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, NULL, 'lozano', NULL, 1, 1, NULL, NULL, NULL, NULL, NULL),
(72, 'edna', 'lozano', 'edna', NULL, 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, NULL, 'lozano', NULL, 1, 1, NULL, NULL, NULL, NULL, NULL),
(78, 'blue', 'blue', 'blue', NULL, '48d6215903dff56238e52e8891380c8f', NULL, NULL, NULL, 'MD', NULL, 2, 5, NULL, NULL, NULL, NULL, '/uploads/profile-pics/5845e21e3167a.png'),
(80, 'edna', 'lozano', 'edna', NULL, 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, NULL, 'lozano', NULL, 1, 1, '123456', 1, 2, 'Lord of the rings', NULL),
(81, 'edna', 'lozano', 'ronaldo', NULL, 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, NULL, 'lozano', NULL, 1, 1, '123456', 1, 2, 'Lord of the rings', NULL),
(82, 'vs', 'csd', 'testing', NULL, '202cb962ac59075b964b07152d234b70', NULL, NULL, NULL, 'CA', NULL, 3, 2, NULL, 6, 10, 'bfdg', NULL),
(83, 'Raju', 'bhai', 'Raju', NULL, '202cb962ac59075b964b07152d234b70', NULL, NULL, NULL, 'MD', NULL, 2, 5, NULL, 4, 10, 'Rock', '/uploads/profile-pics/5846c21d99b9e.png'),
(84, 'pink', 'pink', 'pink', NULL, '4a0b0dcedd48f780778d1cd1bb8f9877', NULL, NULL, NULL, 'CA', NULL, 3, 2, NULL, 4, 6, 'pink', '/uploads/profile-pics/5846c85dd0f55.png'),
(85, 'edna', 'lozano', 'ronaldo', NULL, 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, NULL, 'lozano', NULL, 1, 1, '123456', 1, 2, 'Lord of the rings', NULL),
(86, 'pinky', 'boy', 'pinky', NULL, '202cb962ac59075b964b07152d234b70', NULL, NULL, NULL, 'TX', NULL, 1, 4, NULL, 1, 1, 'fvsdf', '/uploads/profile-pics/5847d2566487d.png'),
(87, 'pinky', 'man', 'pinkyroy', NULL, '202cb962ac59075b964b07152d234b70', NULL, NULL, NULL, 'TX', NULL, 1, 4, NULL, 1, 1, 'meow', '/uploads/profile-pics/5847ecbdb137b.png'),
(88, 'edna', 'lozano', 'ronaldo', NULL, 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, NULL, 'lozano', NULL, 1, 1, '123456', 1, 2, 'Lord of the rings', NULL),
(89, 'edna', 'lozano', 'ronaldo', NULL, 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, NULL, 'lozano', NULL, 1, 1, '123456', 1, 2, 'Lord of the rings', NULL),
(90, 'yellow', 'yellow', 'yellow', NULL, 'd487dd0b55dfcacdd920ccbdaeafa351', NULL, NULL, NULL, 'TX', NULL, 1, 4, NULL, 3, 5, 'yellow', '/uploads/profile-pics/5847f41b66e92.png'),
(91, 'edna', 'lozano', 'ronaldo', NULL, 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, NULL, 'lozano', NULL, 1, 1, '123456', 1, 2, 'Lord of the rings', NULL),
(92, 'edna', 'lozano', 'ronaldo', NULL, 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, NULL, 'lozano', NULL, 1, 1, '123456', 1, 2, 'Lord of the rings', NULL),
(93, 'brown', 'brown', 'brown', NULL, '6ff47afa5dc7daa42cc705a03fca8a9b', NULL, NULL, NULL, 'TX', NULL, 1, 4, NULL, 1, 1, 'brown', '/uploads/profile-pics/584887fb955d7.png'),
(94, 'tester', 'raj', 'tester', NULL, '827ccb0eea8a706c4c34a16891f84e7b', NULL, NULL, NULL, 'TX', NULL, 1, 4, NULL, 1, 1, 'meow', '/uploads/profile-pics/58492809e4892.png'),
(95, 'edna', 'lozano', 'ronaldo', NULL, 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, NULL, 'lozano', NULL, 1, 1, '123456', 1, 2, 'Lord of the rings', NULL),
(96, 'swap', 'fs', 'bharath ', NULL, '202cb962ac59075b964b07152d234b70', NULL, NULL, NULL, 'CA', NULL, 3, 2, NULL, 1, 1, 'cdaf', '/uploads/profile-pics/58494767d142a.png'),
(97, 'cfds', 'fs', 'bh', NULL, '202cb962ac59075b964b07152d234b70', NULL, NULL, NULL, 'TX', NULL, 1, 4, NULL, 1, 1, 'cads', '/uploads/profile-pics/584948ab66783.png'),
(98, 'naveen', 'fsf', 'Bobby', NULL, '202cb962ac59075b964b07152d234b70', NULL, NULL, NULL, 'TX', NULL, 1, 4, NULL, 1, 1, 'dgf', '/uploads/profile-pics/58494ad78777e.png'),
(99, 'edna', 'lozano', 'ronaldo', NULL, 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, NULL, 'lozano', NULL, 1, 1, '123456', 1, 2, 'Lord of the rings', NULL),
(100, 'Rahul', 'bha I', 'raj', NULL, '81dc9bdb52d04dc20036dbd8313ed055', NULL, NULL, NULL, 'TX', NULL, 1, 4, '4654646354', 1, 1, 'vsg', '/uploads/profile-pics/58494bdb8fe90.png'),
(101, 'DVDs', 'fsdfsd', 'raj1', NULL, '202cb962ac59075b964b07152d234b70', NULL, NULL, NULL, 'TX', NULL, 1, 4, '4646556', 1, 1, 'cdaf', '/uploads/profile-pics/58494c1660eda.png'),
(102, 'raji', 'Alia', 'Bhatt', NULL, '827ccb0eea8a706c4c34a16891f84e7b', NULL, NULL, NULL, 'TX', NULL, 1, 4, '413513', 1, 1, 'meow', '/uploads/profile-pics/58497f5f1a5a3.png'),
(103, 'december', 'dec', 'dec', NULL, 'a3218734457b9a9be2ffd334c3a61049', NULL, NULL, NULL, 'CA', NULL, 3, 2, '1234567', 4, 9, 'dec', '/uploads/profile-pics/584988218327d.png'),
(104, 'nayan', 'ace', 'nayan', NULL, '202cb962ac59075b964b07152d234b70', NULL, NULL, NULL, 'TX', NULL, 1, 1, '456656', 1, 10, 'vhjj', '/uploads/profile-pics/584a45bd2025c.png'),
(105, 'nayan', 'ace', 'nayan', NULL, '202cb962ac59075b964b07152d234b70', NULL, NULL, NULL, 'TX', NULL, 1, 1, '456656', 1, 10, 'vhjj', '/uploads/profile-pics/584a45bdc45ae.png'),
(106, 'bharath', 'iOS', 'bharathan', NULL, '202cb962ac59075b964b07152d234b70', NULL, NULL, NULL, 'TX', NULL, 4, 1, '9886198529', 6, 1, 'meow', '/uploads/profile-pics/584a5cfc790e7.png'),
(107, 'no', 'I''ll', 'boo', NULL, '202cb962ac59075b964b07152d234b70', NULL, NULL, NULL, 'MD', NULL, 2, 5, '234425', 1, 1, 'cd', '/uploads/profile-pics/584bb3ada18c7.png'),
(108, 'Tamil', 'Arasi', 'Tamil', NULL, '202cb962ac59075b964b07152d234b70', NULL, NULL, NULL, 'TX', NULL, 1, 1, '65466549', 1, 1, 'meow', '/uploads/profile-pics/584e321f381c9.png'),
(109, 'anand', 'gour', 'anand', NULL, '763de4a6661f411e79bec5e6673e20a1', NULL, NULL, NULL, 'TX', NULL, 1, 1, NULL, 1, 1, 'sdfsdf', '/uploads/profile-pics/5851a4efd3147.png'),
(110, 'anand', 'gour', 'anand', NULL, '763de4a6661f411e79bec5e6673e20a1', NULL, NULL, NULL, 'TX', NULL, 1, 1, NULL, 4, 6, 'cricket', NULL);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `routes_maps`
--

INSERT INTO `routes_maps` (`route_id`, `route_name`, `school_id`, `district_id`, `route_start_latitude`, `route_end_latitude`, `route_start_longitude`, `route_end_longitude`, `route_map_attachment`, `route_type`, `seat_arrangement_csv`) VALUES
(1, 'Route1', 1, 2, NULL, NULL, NULL, NULL, '/uploads/route-maps/e3f88ecdf470f3f35264e24c4ddf66811479476920.pdf', 1, '/uploads/seat-arrangement-csv/ed8bd007b0860323028e72ae5a2ac5d2.csv'),
(2, 'Route2', 1, 2, NULL, NULL, NULL, NULL, '/uploads/route-maps/Route2.pdf', 1, '/uploads/seat-arrangement-csv/43740feff35d7fcea7ff1226e43a88da.csv'),
(3, 'The 3 Testing Route', 3, 4, NULL, NULL, NULL, NULL, '/uploads/route-maps/Route3.pdf', 2, '/uploads/seat-arrangement-csv/69a664ab9b8a286830267a2ef598fa0d.csv'),
(4, 'The 4 Testing Route', 3, 4, NULL, NULL, NULL, NULL, '/uploads/route-maps/Route4.pdf', 2, '/uploads/seat-arrangement-csv/4c1c8cf6eac608dcefbd781f4d2a031e.csv'),
(5, 'test5', 2, 2, NULL, NULL, NULL, NULL, '/uploads/route-maps/7b13d02d260cd5a5d6eeecd17149d4151480521023.jpg', 2, '/uploads/seat-arrangement-csv/7d8b6d09e51cffe5855f0e518875870a.csv'),
(6, 'Route 200', 5, 2, NULL, NULL, NULL, NULL, '/uploads/route-maps/69e570f159c90e72b2cf59af103265421480506468.jpg', 5, '/uploads/seat-arrangement-csv/03175bc9df3b8977c58912bab64d4b4c.csv'),
(7, '765', 3, 1, NULL, NULL, NULL, NULL, '/uploads/route-maps/9fb6b9c8d78b2ce1b6598aa9c8f273b71480506489.jpg', 4, '/uploads/seat-arrangement-csv/580e123a4d216c020a78cf9240552f0e.csv'),
(8, '88', 1, 3, NULL, NULL, NULL, NULL, '/uploads/route-maps/74c57b0017c20f1f38c5a52f8894c24c1480506511.jpg', 8, NULL),
(9, '976', 2, 2, NULL, NULL, NULL, NULL, '/uploads/route-maps/e9a5858d553385732a1562ebad8b74b31480506531.jpg', 11, NULL),
(10, '10', 4, 1, NULL, NULL, NULL, NULL, '/uploads/route-maps/0269ca41d19b6d43dcff0074b3968b321480506549.jpg', 3, NULL),
(11, '11', 1, 1, NULL, NULL, NULL, NULL, '/uploads/route-maps/35ebdc6ebd9f954529785669f2f85eb71480506574.jpg', 4, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `route_types`
--

CREATE TABLE IF NOT EXISTS `route_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `route_types`
--

INSERT INTO `route_types` (`id`, `type`) VALUES
(1, 'Standard'),
(2, 'Extracurricular'),
(3, 'Administrative'),
(4, 'Professional Development'),
(5, 'Special Education'),
(6, 'Maintenance'),
(7, 'Hazardous'),
(8, 'Career and Tech'),
(9, 'Extended School Year/Auxiliary'),
(10, 'Curriculum/Academic'),
(11, 'Non-School Organization'),
(12, 'Other');

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
  `threshold` varchar(200) DEFAULT NULL,
  `threshold_value` varchar(200) DEFAULT NULL,
  `vehicle_type` int(11) NOT NULL,
  PRIMARY KEY (`threshold_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `school_vehicle_threshold`
--

INSERT INTO `school_vehicle_threshold` (`threshold_id`, `threshold`, `threshold_value`, `vehicle_type`) VALUES
(1, 'Oil Leak', '6000 Kms/year', 1),
(2, 'Tires air volume', '20,000 Miles', 1),
(3, 'Tire Rotation', '30,000 Miles', 2),
(4, 'Transmission Flush', '15,000 Miles', 3);

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
  `route_type` int(11) DEFAULT NULL,
  `pre_trip` enum('pass','fail') NOT NULL,
  `post_trip` enum('pass','fail') NOT NULL,
  `destination` varchar(200) DEFAULT NULL,
  `group_carried` varchar(200) DEFAULT NULL,
  `reason` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`trip_id`),
  KEY `vehicle_id` (`vehicle_id`),
  KEY `driver_id` (`driver_id`),
  KEY `route_id` (`route_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=257 ;

--
-- Dumping data for table `trip_history`
--

INSERT INTO `trip_history` (`trip_id`, `route_id`, `school_id`, `driver_id`, `vehicle_id`, `pre_inspection_id`, `post_inspection_id`, `total_riders`, `total_distance`, `trip_status`, `trip_time`, `route_type`, `pre_trip`, `post_trip`, `destination`, `group_carried`, `reason`) VALUES
(10, 1, 1, 7, 1, 22, 23, 25, 1, 'complete', '2016-12-31 08:30:00', 11, 'pass', 'pass', NULL, NULL, NULL),
(11, 1, 1, NULL, 1, 22, 23, 25, 50, 'complete', '2016-12-31 08:30:00', 0, 'pass', 'pass', NULL, NULL, NULL),
(12, 1, 1, NULL, 1, 22, 23, 25, 50, 'complete', '2016-12-31 08:30:00', 0, 'pass', 'pass', NULL, NULL, NULL),
(14, 3, 1, NULL, 1, 52, 53, 4, 400, 'complete', '2016-12-31 08:30:00', 0, 'pass', 'pass', NULL, NULL, NULL),
(16, 3, 1, NULL, 1, 82, 83, 4, 400, 'complete', '2016-12-31 08:30:00', 0, 'pass', 'pass', NULL, NULL, NULL),
(17, 3, 1, NULL, 1, 84, 85, 4, 400, 'complete', '2016-12-31 08:30:00', 0, 'pass', 'pass', NULL, NULL, NULL),
(19, 4, 1, NULL, NULL, 86, 87, NULL, NULL, 'ongoing', '2016-11-24 02:54:00', 0, 'fail', 'pass', NULL, NULL, NULL),
(20, 2, 1, 6, NULL, 88, 89, 2, 3, 'ongoing', '2016-11-18 02:48:00', 0, 'pass', 'pass', NULL, NULL, NULL),
(21, 2, NULL, 46, NULL, 189, 190, 23, NULL, 'ongoing', NULL, 0, 'pass', 'pass', 'Switzerland', 'xyz', NULL),
(28, 1, NULL, 42, 2, 217, 218, 4, 400, 'complete', '0000-11-30 00:57:42', 0, 'pass', 'pass', NULL, NULL, NULL),
(32, 2, NULL, 43, 3, 241, 242, 4, 400, 'complete', '0000-11-29 15:41:20', 0, 'pass', 'pass', NULL, NULL, NULL),
(43, 2, NULL, 54, 3, 261, 262, 4, 400, 'complete', '2016-11-20 08:48:00', 0, 'pass', 'pass', NULL, NULL, NULL),
(44, 4, NULL, 54, 5, 263, 264, 4, 400, 'complete', '2016-11-20 08:48:00', 0, 'pass', 'pass', NULL, NULL, NULL),
(45, 1, NULL, 54, 6, 265, 266, 4, 400, 'complete', '2016-11-20 08:48:00', 0, 'pass', 'pass', NULL, NULL, NULL),
(46, 2, NULL, 54, 2, 267, 268, 4, 400, 'complete', '2016-11-30 20:39:32', 0, 'pass', 'pass', NULL, NULL, NULL),
(47, 4, NULL, 54, 3, 269, 270, 4, 400, 'complete', '2016-11-30 20:42:07', 0, 'pass', 'pass', NULL, NULL, NULL),
(48, 1, NULL, 54, 2, 271, 272, 4, 400, 'complete', '2016-11-30 20:44:55', 0, 'pass', 'pass', NULL, NULL, NULL),
(49, 1, NULL, 54, 1, 273, 274, 4, 400, 'complete', '2016-11-30 20:49:48', 0, 'pass', 'pass', NULL, NULL, NULL),
(50, 4, NULL, 54, 6, 275, 276, 4, 400, 'complete', '2016-11-30 20:50:31', 0, 'pass', 'pass', NULL, NULL, NULL),
(51, 3, NULL, 54, 1, 279, 280, 4, 400, 'complete', '2016-11-30 20:56:14', 0, 'pass', 'pass', NULL, NULL, NULL),
(52, 1, NULL, 54, 1, 281, 282, 4, 400, 'complete', '2016-11-30 20:57:54', 0, 'pass', 'pass', NULL, NULL, NULL),
(53, 1, NULL, 54, 1, 285, 286, 4, 400, 'complete', '2016-11-30 21:48:07', 0, 'pass', 'pass', NULL, NULL, NULL),
(54, 1, NULL, 54, 1, 287, 288, 4, 400, 'complete', '2016-11-30 21:53:48', 0, 'pass', 'pass', NULL, NULL, NULL),
(55, 1, 2, 54, 1, 289, 290, 4, 400, 'complete', '2000-11-30 22:19:55', 0, 'pass', 'pass', NULL, NULL, NULL),
(71, 5, NULL, 48, 3, 349, 350, 4, 400, 'complete', '0000-11-30 15:57:14', 0, 'pass', 'pass', NULL, NULL, NULL),
(242, NULL, NULL, 39, 5, 937, 938, 12, NULL, 'ongoing', NULL, NULL, 'pass', 'pass', 'usa', 'cd', 'cds'),
(243, NULL, NULL, 106, 1, 945, 946, 23, NULL, 'ongoing', NULL, NULL, 'pass', 'pass', 'he', 'gif', 'bf'),
(244, NULL, NULL, 106, 3, 947, 948, 23, NULL, 'ongoing', NULL, NULL, 'pass', 'pass', 'bdfs', 'be', 'vs'),
(245, NULL, NULL, 106, 3, 949, 950, 34, NULL, 'ongoing', NULL, NULL, 'pass', 'pass', 'g', 'wad', 'sd'),
(246, NULL, NULL, 106, 3, 949, 950, 34, 423444, 'complete', '2016-12-09 18:32:00', 2, 'pass', 'pass', NULL, NULL, 'Nice'),
(247, 1, NULL, NULL, 1, 951, 952, 4, 400, 'complete', '2016-12-31 08:30:00', NULL, 'pass', 'pass', NULL, NULL, NULL),
(248, 1, NULL, NULL, 1, 953, 954, 4, 400, 'complete', '2016-12-31 08:30:00', NULL, 'pass', 'pass', NULL, NULL, NULL),
(249, 2, NULL, NULL, 2, 955, 956, 4, 400, 'complete', '2016-12-31 08:30:00', NULL, 'pass', 'pass', NULL, NULL, NULL),
(250, 3, NULL, 53, 3, 959, 960, 1, 0, 'complete', '2016-12-10 13:16:00', 1, 'pass', 'pass', NULL, NULL, 'Nice'),
(251, 5, NULL, 53, 6, 961, 962, 4, 0, 'complete', '2016-12-10 13:17:00', 11, 'pass', 'pass', NULL, NULL, 'Nice'),
(252, NULL, NULL, 107, 1, 963, 964, 23, NULL, 'ongoing', NULL, NULL, 'pass', 'pass', 'jk', 'jk', 'fdsv'),
(253, NULL, NULL, 107, 1, 963, 964, 23, 444, 'complete', '2016-12-10 13:21:00', 3, 'pass', 'pass', NULL, NULL, 'Nice'),
(254, 1, NULL, 108, 6, 965, 966, 5, 30000, 'complete', '2016-12-12 09:43:00', 9, 'pass', 'pass', NULL, NULL, 'Nice'),
(255, NULL, NULL, 108, 1, 967, 968, 25, NULL, 'ongoing', NULL, NULL, 'pass', 'pass', 'Tamilnadu', 'single', 'great to go'),
(256, NULL, NULL, 108, 1, 967, 968, 25, 3000, 'complete', '2016-12-12 09:44:00', 3, 'pass', 'pass', NULL, NULL, 'Nice');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1005 ;

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
(250, 'YTowOnt9', NULL, 123444),
(251, 'YTowOnt9', NULL, 403444),
(252, 'YTowOnt9', NULL, 403444),
(253, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 403444),
(254, '', '', NULL),
(255, 'YTowOnt9', NULL, 23444),
(256, 'YTowOnt9', NULL, 23444),
(257, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 403444),
(258, '', '', NULL),
(259, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 403444),
(260, '', '', NULL),
(261, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 403444),
(262, '', '', NULL),
(263, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 403444),
(264, '', '', NULL),
(265, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 403444),
(266, '', '', NULL),
(267, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 403444),
(268, '', '', NULL),
(269, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 403444),
(270, '', '', NULL),
(271, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 403444),
(272, '', '', NULL),
(273, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 403444),
(274, '', '', NULL),
(275, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 403444),
(276, '', '', NULL),
(277, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 403444),
(278, '', '', NULL),
(279, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 403444),
(280, '', '', NULL),
(281, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 403444),
(282, '', '', NULL),
(283, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 403444),
(284, '', '', NULL),
(285, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 403444),
(286, '', '', NULL),
(287, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 403444),
(288, '', '', NULL),
(289, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 403444),
(290, '', '', NULL),
(291, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 999990),
(292, '', '', NULL),
(293, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 420444),
(294, '', '', NULL),
(295, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 420444),
(296, '', '', NULL),
(297, 'YTowOnt9', '', 420444),
(298, 'YTowOnt9', '', 422222),
(299, 'YTowOnt9', NULL, 423444),
(300, 'YTowOnt9', NULL, 423444),
(301, 'YTowOnt9', NULL, 23444),
(302, 'YTowOnt9', NULL, 23444),
(303, 'YTowOnt9', NULL, 423444),
(304, 'YTowOnt9', NULL, 423444),
(305, 'YTowOnt9', NULL, 425444),
(306, 'YTowOnt9', NULL, 425444),
(307, 'YTowOnt9', NULL, 425444),
(308, 'YTowOnt9', NULL, 425444),
(309, 'YTowOnt9', NULL, 423444),
(310, 'YTowOnt9', NULL, 423444),
(311, 'YTowOnt9', NULL, 423444),
(312, 'YTowOnt9', NULL, 423444),
(313, 'YTowOnt9', NULL, 423444),
(314, 'YTowOnt9', NULL, 423444),
(315, 'YTowOnt9', NULL, 323444),
(316, 'YTowOnt9', NULL, 323444),
(317, 'YTowOnt9', NULL, 423444),
(318, 'YTowOnt9', NULL, 423444),
(319, 'YTowOnt9', NULL, 423444),
(320, 'YTowOnt9', NULL, 423444),
(321, 'YTowOnt9', NULL, 23444),
(322, 'YTowOnt9', NULL, 23444),
(323, 'YTowOnt9', NULL, 423444),
(324, 'YTowOnt9', NULL, 423444),
(325, 'YTowOnt9', NULL, 23444),
(326, 'YTowOnt9', NULL, 23444),
(327, 'YTowOnt9', NULL, 403444),
(328, 'YTowOnt9', NULL, 403444),
(329, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 403444),
(330, '', '', NULL),
(331, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 403444),
(332, '', '', NULL),
(333, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 403444),
(334, '', '', NULL),
(335, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 403444),
(336, '', '', NULL),
(337, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 403444),
(338, '', '', NULL),
(339, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 403444),
(340, '', '', NULL),
(341, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 403444),
(342, '', '', NULL),
(343, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 403444),
(344, '', '', NULL),
(345, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 403444),
(346, '', '', NULL),
(347, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 423444),
(348, '', '', NULL),
(349, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', 'Failed1', 403444),
(350, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', NULL),
(351, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 423444),
(352, '', '', NULL),
(353, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 112333),
(354, '', '', NULL),
(355, 'YTowOnt9', NULL, 312333),
(356, 'YTowOnt9', NULL, 312333),
(357, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 423444),
(358, '', '', NULL),
(359, 'YTowOnt9', NULL, 10004),
(360, 'YTowOnt9', NULL, 10004),
(361, 'YTowOnt9', NULL, 312000),
(362, 'YTowOnt9', NULL, 312000),
(363, 'YTowOnt9', NULL, 24),
(364, 'YTowOnt9', NULL, 24),
(365, 'YTowOnt9', NULL, 423444),
(366, 'YTowOnt9', NULL, 423444),
(367, 'YTowOnt9', NULL, 423444),
(368, 'YTowOnt9', NULL, 423444),
(369, 'YTowOnt9', NULL, 12353),
(370, 'YTowOnt9', NULL, 12353),
(371, 'YTowOnt9', NULL, 12353),
(372, 'YTowOnt9', NULL, 12353),
(373, 'YTowOnt9', NULL, 423444),
(374, 'YTowOnt9', NULL, 423444),
(375, 'YTowOnt9', NULL, 423444),
(376, 'YTowOnt9', NULL, 423444),
(377, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 423444),
(378, '', '', NULL),
(379, 'YTowOnt9', NULL, 423444),
(380, 'YTowOnt9', NULL, 423444),
(381, 'YTowOnt9', NULL, 423444),
(382, 'YTowOnt9', NULL, 423444),
(383, 'YTowOnt9', NULL, 423444),
(384, 'YTowOnt9', NULL, 423444),
(385, 'YTowOnt9', NULL, 23),
(386, 'YTowOnt9', NULL, 23),
(387, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 23),
(388, '', '', NULL),
(389, 'YTowOnt9', NULL, 423444),
(390, 'YTowOnt9', NULL, 423444),
(391, 'YTowOnt9', NULL, 312333),
(392, 'YTowOnt9', NULL, 312333),
(393, 'YTowOnt9', NULL, 312333),
(394, 'YTowOnt9', NULL, 312333),
(395, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 999444),
(396, '', '', NULL),
(397, 'YTowOnt9', NULL, 423444),
(398, 'YTowOnt9', NULL, 423444),
(399, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjA6IiI7fQ==', 'Not working', 423444),
(400, '', '', NULL),
(401, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjU6IjQsNSw3Ijt9', '', 423444),
(402, '', '', NULL),
(403, 'YTowOnt9', NULL, 423444),
(404, 'YTowOnt9', NULL, 423444),
(405, 'YTowOnt9', NULL, 423444),
(406, 'YTowOnt9', NULL, 423444),
(407, 'YTowOnt9', NULL, 423444),
(408, 'YTowOnt9', NULL, 423444),
(409, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 423444),
(410, '', '', NULL),
(411, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 423444),
(412, '', '', NULL),
(413, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 423444),
(414, '', '', NULL),
(415, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 423444),
(416, '', '', NULL),
(417, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 421444),
(418, '', '', NULL),
(419, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', 'Not working', 23444),
(420, '', '', NULL),
(421, 'YTowOnt9', NULL, 423404),
(422, 'YTowOnt9', NULL, 423404),
(423, 'YTowOnt9', NULL, 23444),
(424, 'YTowOnt9', NULL, 23444),
(425, 'YTowOnt9', NULL, 423444),
(426, 'YTowOnt9', NULL, 423444),
(427, 'YTowOnt9', NULL, 423444),
(428, 'YTowOnt9', NULL, 423444),
(429, 'YTowOnt9', NULL, 423444),
(430, 'YTowOnt9', NULL, 423444),
(431, 'YTowOnt9', NULL, 423444),
(432, 'YTowOnt9', NULL, 423444),
(433, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 23444),
(434, '', '', NULL),
(435, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 23444),
(436, '', '', NULL),
(437, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 423449),
(438, '', '', NULL),
(439, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 423449),
(440, '', '', NULL),
(441, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 423449),
(442, '', '', NULL),
(443, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', 'Great!', 423440),
(444, '', '', NULL),
(445, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', 'Working', 23442),
(446, '', '', NULL),
(447, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 23444),
(448, '', '', NULL),
(449, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', 'No', 29444),
(450, '', '', NULL),
(451, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 23444),
(452, '', '', NULL),
(453, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 23444),
(454, '', '', NULL),
(455, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 23444),
(456, '', '', NULL),
(457, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 423444),
(458, '', '', NULL),
(459, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 23444),
(460, '', '', NULL),
(461, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 23444),
(462, '', '', NULL),
(463, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 23444),
(464, '', '', NULL),
(465, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 423444),
(466, '', '', NULL),
(467, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 23444),
(468, '', '', NULL),
(469, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 23444),
(470, '', '', NULL),
(471, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 23444),
(472, 'YTowOnt9', '', 33444),
(473, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 23444),
(474, 'YTowOnt9', '', 93444),
(475, 'YTowOnt9', NULL, 23444),
(476, 'YTowOnt9', NULL, 23444),
(477, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 23444),
(478, '', '', NULL),
(479, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', 'No', 23944),
(480, 'YTowOnt9', '', 499444),
(481, 'YTowOnt9', NULL, 423444),
(482, 'YTowOnt9', NULL, 423444),
(483, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', 'Not', 3444),
(484, '', '', NULL),
(485, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 499444),
(486, 'YTowOnt9', '', 423944),
(487, 'YTowOnt9', NULL, 211111),
(488, 'YTowOnt9', NULL, 211111),
(489, 'YTowOnt9', NULL, 211111),
(490, 'YTowOnt9', NULL, 211111),
(491, 'YTowOnt9', NULL, 11111),
(492, 'YTowOnt9', NULL, 11111),
(493, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', 'Comment1 - comment 2', 22222),
(494, '', '', NULL),
(495, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 22222),
(496, 'YTowOnt9', '', 23333),
(497, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 423440),
(498, '', '', NULL),
(499, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 423444),
(500, '', '', NULL),
(501, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 423444),
(502, '', '', NULL),
(503, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', 'F', 111111),
(504, 'YTowOnt9', '', 444447),
(505, 'YTowOnt9', NULL, 222222),
(506, 'YTowOnt9', NULL, 222222),
(507, 'YTowOnt9', NULL, 444444),
(508, 'YTowOnt9', NULL, 444444),
(509, 'YTowOnt9', NULL, 444444),
(510, 'YTowOnt9', NULL, 444444),
(511, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', 'F', 555555),
(512, 'YTowOnt9', 'F', 600000),
(513, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', 'T', 423444),
(514, '', '', NULL),
(515, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 423444),
(516, '', '', NULL),
(517, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 423444),
(518, '', '', NULL),
(519, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 423444),
(520, '', '', NULL),
(521, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 423444),
(522, '', '', NULL),
(523, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 423444),
(524, '', '', NULL),
(525, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 423444),
(526, '', '', NULL),
(527, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 423444),
(528, '', '', NULL),
(529, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 423444),
(530, '', '', NULL),
(531, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 0),
(532, '', '', NULL),
(533, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 0),
(534, '', '', NULL),
(535, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 0),
(536, '', '', NULL),
(537, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 0),
(538, '', '', NULL),
(539, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 0),
(540, '', '', NULL),
(541, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 0),
(542, '', '', NULL),
(543, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 0),
(544, '', '', NULL),
(545, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 0),
(546, '', '', NULL),
(547, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 0),
(548, '', '', NULL),
(549, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 0),
(550, '', '', NULL),
(551, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 0),
(552, '', '', NULL),
(553, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 0),
(554, '', '', NULL),
(555, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 0),
(556, '', '', NULL),
(557, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 0),
(558, '', '', NULL),
(559, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 0),
(560, '', '', NULL),
(561, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 0),
(562, '', '', NULL),
(563, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 0),
(564, '', '', NULL),
(565, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 0),
(566, '', '', NULL),
(567, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 0),
(568, '', '', NULL),
(569, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 0),
(570, '', '', NULL),
(571, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 0),
(572, '', '', NULL),
(573, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 0),
(574, 'YTowOnt9', '', 423444),
(575, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 0),
(576, '', '', NULL),
(577, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 0),
(578, 'YTowOnt9', '', 423444),
(579, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 0),
(580, '', '', NULL),
(581, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 0),
(582, '', '', NULL),
(583, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 0),
(584, '', '', NULL),
(585, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 0),
(586, 'YTowOnt9', '', 423444),
(587, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 0),
(588, '', '', NULL),
(589, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 0),
(590, '', '', NULL),
(591, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 0),
(592, '', '', NULL),
(593, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 0),
(594, '', '', NULL),
(595, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 0),
(596, '', '', NULL),
(597, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 0),
(598, '', '', NULL),
(599, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 0),
(600, '', '', NULL),
(601, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 0),
(602, '', '', NULL),
(603, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 0),
(604, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjUiO30=', 'Good', 423444),
(605, 'YTo2OntpOjIyO3M6MzoieWVzIjtpOjIxO3M6MzoieWVzIjtpOjIwO3M6Mjoibm8iO2k6MTk7czozOiJ5ZXMiO2k6MTg7czozOiJ5ZXMiO2k6NDc7czozOiJ5ZXMiO30=', 'Pre Trip Inspection', 123456),
(606, '', '', NULL),
(607, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 533444),
(608, 'YTowOnt9', '', 623444),
(609, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', 'Fail', 0),
(610, '', '', NULL),
(611, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjY6IihudWxsKSI7fQ==', '', 0),
(612, '', '', NULL),
(613, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjMzOiIoCiAgICA0LAogICAgMTAsCiAgICAxMSwKICAgIDEyCikiO30=', 'Working', 0),
(614, '', '', NULL),
(615, 'YTowOnt9', NULL, 34),
(616, 'YTowOnt9', NULL, 34),
(617, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjEwOiIoCiAgICAxMgopIjt9', 'F', 47),
(618, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjUiO30=', 'G', 44),
(619, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjQxOiIoCiAgICA0LAogICAgMTAsCiAgICAxMSwKICAgIDEyLAogICAgMTQKKSI7fQ==', 'God', 0),
(620, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjUiO30=', 'Fine', 423444),
(621, 'YTowOnt9', NULL, 13),
(622, 'YTowOnt9', NULL, 13),
(623, 'YTowOnt9', NULL, 423444),
(624, 'YTowOnt9', NULL, 423444),
(625, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjM6IigKKSI7fQ==', '', 444),
(626, '', '', NULL),
(627, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 423444),
(628, '', '', NULL),
(629, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjM6IigKKSI7fQ==', '', 423444),
(630, '', '', NULL),
(631, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjM6IigKKSI7fQ==', '', 423444),
(632, '', '', NULL),
(633, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjM6IigKKSI7fQ==', '', 423444),
(634, '', '', NULL),
(635, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjM6IigKKSI7fQ==', '', 423444),
(636, '', '', NULL),
(637, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjM6IigKKSI7fQ==', '', 423444),
(638, '', '', NULL),
(639, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjM6IigKKSI7fQ==', '', 423444),
(640, '', '', NULL),
(641, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjM6IigKKSI7fQ==', '', 423444),
(642, '', '', NULL),
(643, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjM6IigKKSI7fQ==', '', 423444),
(644, '', '', NULL),
(645, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjM6IigKKSI7fQ==', '', 423444),
(646, '', '', NULL),
(647, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjM6IigKKSI7fQ==', '', 423444),
(648, '', '', NULL),
(649, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjM6IigKKSI7fQ==', '', 423444),
(650, '', '', NULL),
(651, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjM6IigKKSI7fQ==', '', 423444),
(652, '', '', NULL),
(653, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjM6IigKKSI7fQ==', '', 423444),
(654, '', '', NULL),
(655, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjM6IigKKSI7fQ==', '', 423444),
(656, '', '', NULL),
(657, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjM6IigKKSI7fQ==', '', 423444),
(658, '', '', NULL),
(659, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjM6IigKKSI7fQ==', '', 423444),
(660, '', '', NULL),
(661, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjM6IigKKSI7fQ==', '', 423444),
(662, '', '', NULL),
(663, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjM6IigKKSI7fQ==', '', 423444),
(664, '', '', NULL),
(665, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjM6IigKKSI7fQ==', '', 423444),
(666, '', '', NULL),
(667, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjM6IigKKSI7fQ==', '', 423444),
(668, '', '', NULL),
(669, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjM6IigKKSI7fQ==', '', 423444),
(670, '', '', NULL),
(671, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjM6IigKKSI7fQ==', '', 423444),
(672, '', '', NULL),
(673, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjM6IigKKSI7fQ==', '', 423444),
(674, '', '', NULL),
(675, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjM6IigKKSI7fQ==', '', 423444),
(676, '', '', NULL),
(677, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjM6IigKKSI7fQ==', '', 423444),
(678, '', '', NULL),
(679, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjk6IigKICAgIDQKKSI7fQ==', '', 423444),
(680, '', '', NULL),
(681, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjM6IigKKSI7fQ==', '', 423444),
(682, '', '', NULL),
(683, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjM6IigKKSI7fQ==', '', 423444),
(684, '', '', NULL),
(685, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjM6IigKKSI7fQ==', '', 423444),
(686, '', '', NULL),
(687, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjk6IigKICAgIDQKKSI7fQ==', '', 423444),
(688, '', '', NULL),
(689, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjM6IigKKSI7fQ==', '', 423444),
(690, '', '', NULL),
(691, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjM6IigKKSI7fQ==', '', 423444),
(692, '', '', NULL),
(693, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjM6IigKKSI7fQ==', '', 423444),
(694, '', '', NULL),
(695, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjM6IigKKSI7fQ==', '', 423444),
(696, '', '', NULL),
(697, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjM6IigKKSI7fQ==', '', 423444),
(698, '', '', NULL),
(699, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjM6IigKKSI7fQ==', '', 423444),
(700, '', '', NULL),
(701, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjM6IigKKSI7fQ==', '', 423444),
(702, '', '', NULL),
(703, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjM6IigKKSI7fQ==', '', 423444),
(704, '', '', NULL),
(705, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjM6IigKKSI7fQ==', '', 423444),
(706, '', '', NULL),
(707, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjM6IigKKSI7fQ==', '', 423444),
(708, '', '', NULL),
(709, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjM6IigKKSI7fQ==', '', 423444),
(710, '', '', NULL),
(711, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjM6IigKKSI7fQ==', '', 423444),
(712, '', '', NULL),
(713, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjM6IigKKSI7fQ==', '', 423444),
(714, '', '', NULL),
(715, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjM6IigKKSI7fQ==', '', 423444),
(716, '', '', NULL),
(717, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjM6IigKKSI7fQ==', '', 423444),
(718, '', '', NULL),
(719, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjM6IigKKSI7fQ==', '', 423444),
(720, '', '', NULL),
(721, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjM6IigKKSI7fQ==', '', 423444),
(722, '', '', NULL),
(723, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjM6IigKKSI7fQ==', '', 423444),
(724, '', '', NULL),
(725, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjM6IigKKSI7fQ==', '', 423444),
(726, '', '', NULL),
(727, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjM6IigKKSI7fQ==', '', 423444),
(728, '', '', NULL),
(729, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjM6IigKKSI7fQ==', '', 423444),
(730, '', '', NULL),
(731, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjM6IigKKSI7fQ==', '', 423444),
(732, '', '', NULL),
(733, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjM6IigKKSI7fQ==', '', 423444),
(734, '', '', NULL),
(735, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjM6IigKKSI7fQ==', '', 423444),
(736, '', '', NULL),
(737, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjM6IigKKSI7fQ==', '', 423444),
(738, '', '', NULL),
(739, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjM6IigKKSI7fQ==', '', 423444),
(740, '', '', NULL),
(741, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjM6IigKKSI7fQ==', '', 423444),
(742, '', '', NULL),
(743, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjM6IigKKSI7fQ==', '', 423444),
(744, '', '', NULL),
(745, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjM6IigKKSI7fQ==', '', 0),
(746, '', '', NULL),
(747, 'YTo2OntpOjIyO3M6MzoieWVzIjtpOjIxO3M6MzoieWVzIjtpOjIwO3M6Mjoibm8iO2k6MTk7czozOiJ5ZXMiO2k6MTg7czozOiJ5ZXMiO2k6NDc7czozOiJ5ZXMiO30=', 'Pre Trip Inspection', 123456),
(748, '', '', NULL),
(749, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjM6IigKKSI7fQ==', '', 423444),
(750, '', '', NULL),
(751, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjM6IigKKSI7fQ==', '', 996200),
(752, '', '', NULL),
(753, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjM6IigKKSI7fQ==', '', 423044),
(754, '', '', NULL),
(755, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjM6IigKKSI7fQ==', '', 423044),
(756, '', '', NULL),
(757, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjM6IigKKSI7fQ==', '', 423044),
(758, '', '', NULL),
(759, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjM6IigKKSI7fQ==', '', 10000),
(760, '', '', NULL),
(761, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjM6IigKKSI7fQ==', '', 10000),
(762, '', '', NULL),
(763, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjM6IigKKSI7fQ==', '', 423444),
(764, '', '', NULL),
(765, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjM6InsKfSI7fQ==', '', 423444),
(766, '', '', NULL),
(767, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjI4OiJ7CiAgICAxMCA9IG5vOwogICAgNCA9IG5vOwp9Ijt9', 'Working', 423444),
(768, '', '', NULL),
(769, 'YToxOntzOjg6IgpfX19fMTBfIjtzOjEzMDoiIHllczsKICAgIDExID0geWVzOwogICAgMTIgPSB5ZXM7CiAgICAxMyA9IHllczsKICAgIDE0ID0geWVzOwogICAgMTUgPSB5ZXM7CiAgICAxNiA9IHllczsKICAgIDE3ID0geWVzOwogICAgMTggPSB5ZXM7CiAgICA0ID0gbm87CiI7fQ==', 'Failed', 0),
(770, '', '', NULL),
(771, 'YToxOntzOjg6IgpfX19fMTBfIjtzOjEzMDoiIHllcywKICAgIDExID0geWVzLAogICAgMTIgPSB5ZXMsCiAgICAxMyA9IHllcywKICAgIDE0ID0geWVzLAogICAgMTUgPSB5ZXMsCiAgICAxNiA9IHllcywKICAgIDE3ID0geWVzLAogICAgMTggPSB5ZXMsCiAgICA0ID0gbm8sCiI7fQ==', 'Failed', 423644),
(772, '', '', NULL),
(773, 'YToxOntzOjg6IgpfX19fMTBfIjtzOjEzMDoiIHllcywKICAgIDExID0geWVzLAogICAgMTIgPSB5ZXMsCiAgICAxMyA9IHllcywKICAgIDE0ID0geWVzLAogICAgMTUgPSB5ZXMsCiAgICAxNiA9IHllcywKICAgIDE3ID0geWVzLAogICAgMTggPSB5ZXMsCiAgICA0ID0gbm8sCiI7fQ==', '', 423644),
(774, '', '', NULL),
(775, 'YToxOntzOjg6IgpfX19fMTBfIjtzOjEzMDoiIHllcywKICAgIDExID0geWVzLAogICAgMTIgPSB5ZXMsCiAgICAxMyA9IHllcywKICAgIDE0ID0geWVzLAogICAgMTUgPSB5ZXMsCiAgICAxNiA9IHllcywKICAgIDE3ID0geWVzLAogICAgMTggPSB5ZXMsCiAgICA0ID0gbm8sCiI7fQ==', 'Failed', 423434),
(776, '', '', NULL),
(777, 'YToxMTp7czo4OiIKX19fXzEwXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMTFfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18xMl8iO3M6NDoiIHllcyI7czo4OiIKX19fXzEzXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMTRfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18xNV8iO3M6NDoiIHllcyI7czo4OiIKX19fXzE2XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMTdfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18xOF8iO3M6NDoiIHllcyI7czo3OiIKX19fXzRfIjtzOjM6IiBubyI7czoxOiIKIjtzOjA6IiI7fQ==', 'Not working', 423434),
(778, '', '', NULL),
(779, 'YTozNzp7czo4OiIKX19fXzEwXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMTFfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18xMl8iO3M6NDoiIHllcyI7czo4OiIKX19fXzEzXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMTRfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18xNV8iO3M6NDoiIHllcyI7czo4OiIKX19fXzE2XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMTdfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18xOF8iO3M6NDoiIHllcyI7czo4OiIKX19fXzE5XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMjBfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18yMV8iO3M6NDoiIHllcyI7czo4OiIKX19fXzIyXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMjNfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18yNF8iO3M6NDoiIHllcyI7czo4OiIKX19fXzI1XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMjZfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18yN18iO3M6NDoiIHllcyI7czo4OiIKX19fXzI4XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMjlfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18zMF8iO3M6NDoiIHllcyI7czo4OiIKX19fXzMxXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMzJfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18zM18iO3M6NDoiIHllcyI7czo4OiIKX19fXzM0XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMzVfIjtzOjM6IiBubyI7czo4OiIKX19fXzM2XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMzdfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18zOF8iO3M6NDoiIHllcyI7czo4OiIKX19fXzM5XyI7czo0OiIgeWVzIjtzOjc6IgpfX19fNF8iO3M6NDoiIHllcyI7czo4OiIKX19fXzQwXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fNDFfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX180Ml8iO3M6NDoiIHllcyI7czo4OiIKX19fXzQzXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fNDRfIjtzOjQ6IiB5ZXMiO3M6MToiCiI7czowOiIiO30=', 'Failed', 423444),
(780, '', '', NULL),
(781, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjM6IigKKSI7fQ==', '', 0),
(782, '', '', NULL),
(783, 'YTozNzp7czo4OiIKX19fXzEwXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMTFfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18xMl8iO3M6NDoiIHllcyI7czo4OiIKX19fXzEzXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMTRfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18xNV8iO3M6NDoiIHllcyI7czo4OiIKX19fXzE2XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMTdfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18xOF8iO3M6NDoiIHllcyI7czo4OiIKX19fXzE5XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMjBfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18yMV8iO3M6NDoiIHllcyI7czo4OiIKX19fXzIyXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMjNfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18yNF8iO3M6NDoiIHllcyI7czo4OiIKX19fXzI1XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMjZfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18yN18iO3M6NDoiIHllcyI7czo4OiIKX19fXzI4XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMjlfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18zMF8iO3M6NDoiIHllcyI7czo4OiIKX19fXzMxXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMzJfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18zM18iO3M6NDoiIHllcyI7czo4OiIKX19fXzM0XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMzVfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18zNl8iO3M6NDoiIHllcyI7czo4OiIKX19fXzM3XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMzhfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18zOV8iO3M6NDoiIHllcyI7czo3OiIKX19fXzRfIjtzOjM6IiBubyI7czo4OiIKX19fXzQwXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fNDFfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX180Ml8iO3M6NDoiIHllcyI7czo4OiIKX19fXzQzXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fNDRfIjtzOjQ6IiB5ZXMiO3M6MToiCiI7czowOiIiO30=', 'Ongoing', 423444),
(784, '', '', NULL),
(785, 'YTozNzp7czo4OiIKX19fXzEwXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMTFfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18xMl8iO3M6NDoiIHllcyI7czo4OiIKX19fXzEzXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMTRfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18xNV8iO3M6NDoiIHllcyI7czo4OiIKX19fXzE2XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMTdfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18xOF8iO3M6NDoiIHllcyI7czo4OiIKX19fXzE5XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMjBfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18yMV8iO3M6NDoiIHllcyI7czo4OiIKX19fXzIyXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMjNfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18yNF8iO3M6NDoiIHllcyI7czo4OiIKX19fXzI1XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMjZfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18yN18iO3M6NDoiIHllcyI7czo4OiIKX19fXzI4XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMjlfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18zMF8iO3M6NDoiIHllcyI7czo4OiIKX19fXzMxXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMzJfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18zM18iO3M6NDoiIHllcyI7czo4OiIKX19fXzM0XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMzVfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18zNl8iO3M6NDoiIHllcyI7czo4OiIKX19fXzM3XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMzhfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18zOV8iO3M6NDoiIHllcyI7czo3OiIKX19fXzRfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX180MF8iO3M6NDoiIHllcyI7czo4OiIKX19fXzQxXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fNDJfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX180M18iO3M6NDoiIHllcyI7czo4OiIKX19fXzQ0XyI7czozOiIgbm8iO3M6MToiCiI7czowOiIiO30=', 'Working', 423444),
(786, 'YTo3OntzOjg6IgpfX19fNDVfIjtzOjQ6IiB5ZXMiO3M6NzoiCl9fX181XyI7czozOiIgbm8iO3M6NzoiCl9fX182XyI7czo0OiIgeWVzIjtzOjc6IgpfX19fN18iO3M6NDoiIHllcyI7czo3OiIKX19fXzhfIjtzOjQ6IiB5ZXMiO3M6NzoiCl9fX185XyI7czo0OiIgeWVzIjtzOjE6IgoiO3M6MDoiIjt9', 'Going', 443444),
(787, 'YToxMTp7czo4OiIKX19fXzEwXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMTFfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18xMl8iO3M6NDoiIHllcyI7czo4OiIKX19fXzEzXyI7czozOiIgbm8iO3M6ODoiCl9fX18xNF8iO3M6NDoiIHllcyI7czo4OiIKX19fXzE1XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMTZfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18xN18iO3M6NDoiIHllcyI7czo4OiIKX19fXzE4XyI7czo0OiIgeWVzIjtzOjc6IgpfX19fNF8iO3M6NDoiIHllcyI7czoxOiIKIjtzOjA6IiI7fQ==', 'Fail', 423444),
(788, '', '', NULL),
(789, 'YToxMTp7czo4OiIKX19fXzEwXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMTFfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18xMl8iO3M6NDoiIHllcyI7czo4OiIKX19fXzEzXyI7czozOiIgbm8iO3M6ODoiCl9fX18xNF8iO3M6NDoiIHllcyI7czo4OiIKX19fXzE1XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMTZfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18xN18iO3M6NDoiIHllcyI7czo4OiIKX19fXzE4XyI7czo0OiIgeWVzIjtzOjc6IgpfX19fNF8iO3M6NDoiIHllcyI7czoxOiIKIjtzOjA6IiI7fQ==', '', 423444),
(790, '', '', NULL),
(791, 'YToxMTp7czo4OiIKX19fXzEwXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMTFfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18xMl8iO3M6NDoiIHllcyI7czo4OiIKX19fXzEzXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMTRfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18xNV8iO3M6NDoiIHllcyI7czo4OiIKX19fXzE2XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMTdfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18xOF8iO3M6NDoiIHllcyI7czo3OiIKX19fXzRfIjtzOjM6IiBubyI7czoxOiIKIjtzOjA6IiI7fQ==', 'Working', 423444),
(792, '', '', NULL),
(793, 'YToxMTp7czo4OiIKX19fXzEwXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMTFfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18xMl8iO3M6NDoiIHllcyI7czo4OiIKX19fXzEzXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMTRfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18xNV8iO3M6NDoiIHllcyI7czo4OiIKX19fXzE2XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMTdfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18xOF8iO3M6NDoiIHllcyI7czo3OiIKX19fXzRfIjtzOjM6IiBubyI7czoxOiIKIjtzOjA6IiI7fQ==', 'Working', 423444),
(794, '', '', NULL),
(795, 'YToxMTp7czo4OiIKX19fXzEwXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMTFfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18xMl8iO3M6NDoiIHllcyI7czo4OiIKX19fXzEzXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMTRfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18xNV8iO3M6NDoiIHllcyI7czo4OiIKX19fXzE2XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMTdfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18xOF8iO3M6NDoiIHllcyI7czo3OiIKX19fXzRfIjtzOjM6IiBubyI7czoxOiIKIjtzOjA6IiI7fQ==', 'Ongoing', 443454),
(796, 'YToxOntzOjY6IihudWxsKSI7czowOiIiO30=', '', 423994),
(797, 'YToxOntzOjY6IihudWxsKSI7czowOiIiO30=', '', 443454),
(798, '', '', NULL),
(799, 'YToxOntzOjY6IihudWxsKSI7czowOiIiO30=', '', 443454),
(800, '', '', NULL),
(801, 'YToxOntzOjY6IihudWxsKSI7czowOiIiO30=', '', 423996),
(802, '', '', NULL),
(803, 'YToxOntzOjY6IihudWxsKSI7czowOiIiO30=', '', 423996),
(804, '', '', NULL),
(805, 'YToxOntzOjY6IihudWxsKSI7czowOiIiO30=', '', 423996),
(806, '', '', NULL),
(807, 'YToxOntzOjY6IihudWxsKSI7czowOiIiO30=', '', 423996),
(808, '', '', NULL),
(809, 'YTozNzp7czo4OiIKX19fXzEwXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMTFfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18xMl8iO3M6NDoiIHllcyI7czo4OiIKX19fXzEzXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMTRfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18xNV8iO3M6NDoiIHllcyI7czo4OiIKX19fXzE2XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMTdfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18xOF8iO3M6NDoiIHllcyI7czo4OiIKX19fXzE5XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMjBfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18yMV8iO3M6NDoiIHllcyI7czo4OiIKX19fXzIyXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMjNfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18yNF8iO3M6NDoiIHllcyI7czo4OiIKX19fXzI1XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMjZfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18yN18iO3M6NDoiIHllcyI7czo4OiIKX19fXzI4XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMjlfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18zMF8iO3M6NDoiIHllcyI7czo4OiIKX19fXzMxXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMzJfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18zM18iO3M6NDoiIHllcyI7czo4OiIKX19fXzM0XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMzVfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18zNl8iO3M6NDoiIHllcyI7czo4OiIKX19fXzM3XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMzhfIjtzOjM6IiBubyI7czo4OiIKX19fXzM5XyI7czo0OiIgeWVzIjtzOjc6IgpfX19fNF8iO3M6NDoiIHllcyI7czo4OiIKX19fXzQwXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fNDFfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX180Ml8iO3M6NDoiIHllcyI7czo4OiIKX19fXzQzXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fNDRfIjtzOjQ6IiB5ZXMiO3M6MToiCiI7czowOiIiO30=', 'Working', 423996),
(810, 'YTo3OntzOjg6IgpfX19fNDVfIjtzOjQ6IiB5ZXMiO3M6NzoiCl9fX181XyI7czozOiIgbm8iO3M6NzoiCl9fX182XyI7czo0OiIgeWVzIjtzOjc6IgpfX19fN18iO3M6NDoiIHllcyI7czo3OiIKX19fXzhfIjtzOjQ6IiB5ZXMiO3M6NzoiCl9fX185XyI7czo0OiIgeWVzIjtzOjE6IgoiO3M6MDoiIjt9', 'Fail', 429499),
(811, 'YToxMTp7czo4OiIKX19fXzEwXyI7czozOiIgbm8iO3M6ODoiCl9fX18xMV8iO3M6NDoiIHllcyI7czo4OiIKX19fXzEyXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMTNfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18xNF8iO3M6MzoiIG5vIjtzOjg6IgpfX19fMTVfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18xNl8iO3M6NDoiIHllcyI7czo4OiIKX19fXzE3XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMThfIjtzOjQ6IiB5ZXMiO3M6NzoiCl9fX180XyI7czo0OiIgeWVzIjtzOjE6IgoiO3M6MDoiIjt9', 'Des emerg', 100000),
(812, '', '', NULL),
(813, 'YToxMTp7czo4OiIKX19fXzEwXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMTFfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18xMl8iO3M6NDoiIHllcyI7czo4OiIKX19fXzEzXyI7czozOiIgbm8iO3M6ODoiCl9fX18xNF8iO3M6NDoiIHllcyI7czo4OiIKX19fXzE1XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMTZfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18xN18iO3M6NDoiIHllcyI7czo4OiIKX19fXzE4XyI7czo0OiIgeWVzIjtzOjc6IgpfX19fNF8iO3M6NDoiIHllcyI7czoxOiIKIjtzOjA6IiI7fQ==', 'Fire', 1000),
(814, 'YTo3OntzOjg6IgpfX19fNDVfIjtzOjQ6IiB5ZXMiO3M6NzoiCl9fX181XyI7czo0OiIgeWVzIjtzOjc6IgpfX19fNl8iO3M6MzoiIG5vIjtzOjc6IgpfX19fN18iO3M6NDoiIHllcyI7czo3OiIKX19fXzhfIjtzOjQ6IiB5ZXMiO3M6NzoiCl9fX185XyI7czo0OiIgeWVzIjtzOjE6IgoiO3M6MDoiIjt9', 'Fest', 444),
(815, 'YTowOnt9', NULL, 444),
(816, 'YTowOnt9', NULL, 444),
(817, 'YToxOntzOjY6IihudWxsKSI7czowOiIiO30=', '', 0),
(818, '', '', NULL),
(819, 'YToxMTp7czo4OiIKX19fXzEwXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMTFfIjtzOjM6IiBubyI7czo4OiIKX19fXzEyXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMTNfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18xNF8iO3M6NDoiIHllcyI7czo4OiIKX19fXzE1XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMTZfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18xN18iO3M6NDoiIHllcyI7czo4OiIKX19fXzE4XyI7czo0OiIgeWVzIjtzOjc6IgpfX19fNF8iO3M6NDoiIHllcyI7czoxOiIKIjtzOjA6IiI7fQ==', 'T', 444),
(820, 'YToxOntzOjY6IihudWxsKSI7czowOiIiO30=', '', 544),
(821, 'YToxOntzOjY6IihudWxsKSI7czowOiIiO30=', '', 0),
(822, '', '', NULL),
(823, 'YTozNzp7czo4OiIKX19fXzEwXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMTFfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18xMl8iO3M6NDoiIHllcyI7czo4OiIKX19fXzEzXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMTRfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18xNV8iO3M6NDoiIHllcyI7czo4OiIKX19fXzE2XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMTdfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18xOF8iO3M6NDoiIHllcyI7czo4OiIKX19fXzE5XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMjBfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18yMV8iO3M6NDoiIHllcyI7czo4OiIKX19fXzIyXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMjNfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18yNF8iO3M6NDoiIHllcyI7czo4OiIKX19fXzI1XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMjZfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18yN18iO3M6NDoiIHllcyI7czo4OiIKX19fXzI4XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMjlfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18zMF8iO3M6NDoiIHllcyI7czo4OiIKX19fXzMxXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMzJfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18zM18iO3M6NDoiIHllcyI7czo4OiIKX19fXzM0XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMzVfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18zNl8iO3M6NDoiIHllcyI7czo4OiIKX19fXzM3XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMzhfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18zOV8iO3M6NDoiIHllcyI7czo3OiIKX19fXzRfIjtzOjM6IiBubyI7czo4OiIKX19fXzQwXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fNDFfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX180Ml8iO3M6NDoiIHllcyI7czo4OiIKX19fXzQzXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fNDRfIjtzOjQ6IiB5ZXMiO3M6MToiCiI7czowOiIiO30=', 'Failed', 429999);
INSERT INTO `trip_inspections` (`inspection_id`, `inspection_data`, `comments`, `odometer_reading`) VALUES
(824, 'YTo3OntzOjg6IgpfX19fNDVfIjtzOjQ6IiB5ZXMiO3M6NzoiCl9fX181XyI7czozOiIgbm8iO3M6NzoiCl9fX182XyI7czo0OiIgeWVzIjtzOjc6IgpfX19fN18iO3M6NDoiIHllcyI7czo3OiIKX19fXzhfIjtzOjQ6IiB5ZXMiO3M6NzoiCl9fX185XyI7czo0OiIgeWVzIjtzOjE6IgoiO3M6MDoiIjt9', 'Working', 499499),
(825, 'YTozNzp7czo4OiIKX19fXzEwXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMTFfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18xMl8iO3M6NDoiIHllcyI7czo4OiIKX19fXzEzXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMTRfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18xNV8iO3M6NDoiIHllcyI7czo4OiIKX19fXzE2XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMTdfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18xOF8iO3M6NDoiIHllcyI7czo4OiIKX19fXzE5XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMjBfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18yMV8iO3M6NDoiIHllcyI7czo4OiIKX19fXzIyXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMjNfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18yNF8iO3M6NDoiIHllcyI7czo4OiIKX19fXzI1XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMjZfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18yN18iO3M6NDoiIHllcyI7czo4OiIKX19fXzI4XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMjlfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18zMF8iO3M6NDoiIHllcyI7czo4OiIKX19fXzMxXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMzJfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18zM18iO3M6NDoiIHllcyI7czo4OiIKX19fXzM0XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMzVfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18zNl8iO3M6NDoiIHllcyI7czo4OiIKX19fXzM3XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMzhfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18zOV8iO3M6NDoiIHllcyI7czo3OiIKX19fXzRfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX180MF8iO3M6NDoiIHllcyI7czo4OiIKX19fXzQxXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fNDJfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX180M18iO3M6NDoiIHllcyI7czo4OiIKX19fXzQ0XyI7czozOiIgbm8iO3M6MToiCiI7czowOiIiO30=', 'Fail', 499495),
(826, 'YTo3OntzOjg6IgpfX19fNDVfIjtzOjQ6IiB5ZXMiO3M6NzoiCl9fX181XyI7czozOiIgbm8iO3M6NzoiCl9fX182XyI7czo0OiIgeWVzIjtzOjc6IgpfX19fN18iO3M6NDoiIHllcyI7czo3OiIKX19fXzhfIjtzOjQ6IiB5ZXMiO3M6NzoiCl9fX185XyI7czo0OiIgeWVzIjtzOjE6IgoiO3M6MDoiIjt9', 'Fail', 499944),
(827, 'YTozNzp7czo4OiIKX19fXzEwXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMTFfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18xMl8iO3M6NDoiIHllcyI7czo4OiIKX19fXzEzXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMTRfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18xNV8iO3M6NDoiIHllcyI7czo4OiIKX19fXzE2XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMTdfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18xOF8iO3M6NDoiIHllcyI7czo4OiIKX19fXzE5XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMjBfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18yMV8iO3M6NDoiIHllcyI7czo4OiIKX19fXzIyXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMjNfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18yNF8iO3M6NDoiIHllcyI7czo4OiIKX19fXzI1XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMjZfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18yN18iO3M6NDoiIHllcyI7czo4OiIKX19fXzI4XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMjlfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18zMF8iO3M6NDoiIHllcyI7czo4OiIKX19fXzMxXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMzJfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18zM18iO3M6NDoiIHllcyI7czo4OiIKX19fXzM0XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMzVfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18zNl8iO3M6NDoiIHllcyI7czo4OiIKX19fXzM3XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMzhfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18zOV8iO3M6NDoiIHllcyI7czo3OiIKX19fXzRfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX180MF8iO3M6NDoiIHllcyI7czo4OiIKX19fXzQxXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fNDJfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX180M18iO3M6MzoiIG5vIjtzOjg6IgpfX19fNDRfIjtzOjQ6IiB5ZXMiO3M6MToiCiI7czowOiIiO30=', 'No', 499495),
(828, 'YTo3OntzOjg6IgpfX19fNDVfIjtzOjM6IiBubyI7czo3OiIKX19fXzVfIjtzOjQ6IiB5ZXMiO3M6NzoiCl9fX182XyI7czo0OiIgeWVzIjtzOjc6IgpfX19fN18iO3M6NDoiIHllcyI7czo3OiIKX19fXzhfIjtzOjQ6IiB5ZXMiO3M6NzoiCl9fX185XyI7czo0OiIgeWVzIjtzOjE6IgoiO3M6MDoiIjt9', 'No', 593444),
(829, 'YTo2OntpOjIyO3M6MzoieWVzIjtpOjIxO3M6MzoieWVzIjtpOjIwO3M6Mjoibm8iO2k6MTk7czozOiJ5ZXMiO2k6MTg7czozOiJ5ZXMiO2k6NDc7czozOiJ5ZXMiO30=', 'Pre Trip Inspection', 123456),
(830, '', '', NULL),
(831, 'YToxOntzOjY6IihudWxsKSI7czowOiIiO30=', '', 700),
(832, '', '', NULL),
(833, 'YTowOnt9', NULL, 0),
(834, 'YTowOnt9', NULL, 0),
(835, 'YTozNzp7czo4OiIKX19fXzEwXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMTFfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18xMl8iO3M6MzoiIG5vIjtzOjg6IgpfX19fMTNfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18xNF8iO3M6MzoiIG5vIjtzOjg6IgpfX19fMTVfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18xNl8iO3M6NDoiIHllcyI7czo4OiIKX19fXzE3XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMThfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18xOV8iO3M6NDoiIHllcyI7czo4OiIKX19fXzIwXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMjFfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18yMl8iO3M6NDoiIHllcyI7czo4OiIKX19fXzIzXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMjRfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18yNV8iO3M6NDoiIHllcyI7czo4OiIKX19fXzI2XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMjdfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18yOF8iO3M6NDoiIHllcyI7czo4OiIKX19fXzI5XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMzBfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18zMV8iO3M6NDoiIHllcyI7czo4OiIKX19fXzMyXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMzNfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18zNF8iO3M6NDoiIHllcyI7czo4OiIKX19fXzM1XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMzZfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18zN18iO3M6NDoiIHllcyI7czo4OiIKX19fXzM4XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMzlfIjtzOjQ6IiB5ZXMiO3M6NzoiCl9fX180XyI7czozOiIgbm8iO3M6ODoiCl9fX180MF8iO3M6NDoiIHllcyI7czo4OiIKX19fXzQxXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fNDJfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX180M18iO3M6NDoiIHllcyI7czo4OiIKX19fXzQ0XyI7czo0OiIgeWVzIjtzOjE6IgoiO3M6MDoiIjt9', 'Working', 544),
(836, '', '', NULL),
(837, 'YToxOntzOjY6IihudWxsKSI7czowOiIiO30=', '', 0),
(838, '', '', NULL),
(839, 'YToxOntzOjY6IihudWxsKSI7czowOiIiO30=', '', 0),
(840, '', '', NULL),
(841, 'YToxOntzOjY6IihudWxsKSI7czowOiIiO30=', '', 0),
(842, '', '', NULL),
(843, 'YTozNzp7czo4OiIKX19fXzEwXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMTFfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18xMl8iO3M6NDoiIHllcyI7czo4OiIKX19fXzEzXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMTRfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18xNV8iO3M6NDoiIHllcyI7czo4OiIKX19fXzE2XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMTdfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18xOF8iO3M6NDoiIHllcyI7czo4OiIKX19fXzE5XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMjBfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18yMV8iO3M6NDoiIHllcyI7czo4OiIKX19fXzIyXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMjNfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18yNF8iO3M6NDoiIHllcyI7czo4OiIKX19fXzI1XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMjZfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18yN18iO3M6NDoiIHllcyI7czo4OiIKX19fXzI4XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMjlfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18zMF8iO3M6NDoiIHllcyI7czo4OiIKX19fXzMxXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMzJfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18zM18iO3M6NDoiIHllcyI7czo4OiIKX19fXzM0XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMzVfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18zNl8iO3M6NDoiIHllcyI7czo4OiIKX19fXzM3XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMzhfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18zOV8iO3M6NDoiIHllcyI7czo3OiIKX19fXzRfIjtzOjM6IiBubyI7czo4OiIKX19fXzQwXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fNDFfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX180Ml8iO3M6NDoiIHllcyI7czo4OiIKX19fXzQzXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fNDRfIjtzOjQ6IiB5ZXMiO3M6MToiCiI7czowOiIiO30=', 'Not', 0),
(844, '', '', NULL),
(845, 'YTozNzp7czo4OiIKX19fXzEwXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMTFfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18xMl8iO3M6NDoiIHllcyI7czo4OiIKX19fXzEzXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMTRfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18xNV8iO3M6NDoiIHllcyI7czo4OiIKX19fXzE2XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMTdfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18xOF8iO3M6NDoiIHllcyI7czo4OiIKX19fXzE5XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMjBfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18yMV8iO3M6NDoiIHllcyI7czo4OiIKX19fXzIyXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMjNfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18yNF8iO3M6NDoiIHllcyI7czo4OiIKX19fXzI1XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMjZfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18yN18iO3M6NDoiIHllcyI7czo4OiIKX19fXzI4XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMjlfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18zMF8iO3M6NDoiIHllcyI7czo4OiIKX19fXzMxXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMzJfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18zM18iO3M6NDoiIHllcyI7czo4OiIKX19fXzM0XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMzVfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18zNl8iO3M6NDoiIHllcyI7czo4OiIKX19fXzM3XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMzhfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18zOV8iO3M6NDoiIHllcyI7czo3OiIKX19fXzRfIjtzOjM6IiBubyI7czo4OiIKX19fXzQwXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fNDFfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX180Ml8iO3M6NDoiIHllcyI7czo4OiIKX19fXzQzXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fNDRfIjtzOjQ6IiB5ZXMiO3M6MToiCiI7czowOiIiO30=', '', 0),
(846, 'YToxOntzOjY6IihudWxsKSI7czowOiIiO30=', '', 423444),
(847, 'YTozNzp7czo4OiIKX19fXzEwXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMTFfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18xMl8iO3M6NDoiIHllcyI7czo4OiIKX19fXzEzXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMTRfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18xNV8iO3M6NDoiIHllcyI7czo4OiIKX19fXzE2XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMTdfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18xOF8iO3M6NDoiIHllcyI7czo4OiIKX19fXzE5XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMjBfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18yMV8iO3M6NDoiIHllcyI7czo4OiIKX19fXzIyXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMjNfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18yNF8iO3M6NDoiIHllcyI7czo4OiIKX19fXzI1XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMjZfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18yN18iO3M6NDoiIHllcyI7czo4OiIKX19fXzI4XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMjlfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18zMF8iO3M6NDoiIHllcyI7czo4OiIKX19fXzMxXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMzJfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18zM18iO3M6NDoiIHllcyI7czo4OiIKX19fXzM0XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMzVfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18zNl8iO3M6NDoiIHllcyI7czo4OiIKX19fXzM3XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMzhfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18zOV8iO3M6NDoiIHllcyI7czo3OiIKX19fXzRfIjtzOjM6IiBubyI7czo4OiIKX19fXzQwXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fNDFfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX180Ml8iO3M6NDoiIHllcyI7czo4OiIKX19fXzQzXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fNDRfIjtzOjQ6IiB5ZXMiO3M6MToiCiI7czowOiIiO30=', 'Good', 423444),
(848, 'YTo3OntzOjg6IgpfX19fNDVfIjtzOjQ6IiB5ZXMiO3M6NzoiCl9fX181XyI7czozOiIgbm8iO3M6NzoiCl9fX182XyI7czo0OiIgeWVzIjtzOjc6IgpfX19fN18iO3M6NDoiIHllcyI7czo3OiIKX19fXzhfIjtzOjQ6IiB5ZXMiO3M6NzoiCl9fX185XyI7czo0OiIgeWVzIjtzOjE6IgoiO3M6MDoiIjt9', 'Gpod', 423444),
(849, 'YTowOnt9', NULL, 423444),
(850, 'YTowOnt9', NULL, 423444),
(851, 'YTowOnt9', NULL, 593444),
(852, 'YTowOnt9', NULL, 593444),
(853, 'YTowOnt9', NULL, 593444),
(854, 'YTowOnt9', NULL, 593444),
(855, 'YTowOnt9', NULL, 423444),
(856, 'YTowOnt9', NULL, 423444),
(857, 'YTowOnt9', NULL, 423444),
(858, 'YTo3OntzOjg6IgpfX19fNDVfIjtzOjQ6IiB5ZXMiO3M6NzoiCl9fX181XyI7czozOiIgbm8iO3M6NzoiCl9fX182XyI7czo0OiIgeWVzIjtzOjc6IgpfX19fN18iO3M6NDoiIHllcyI7czo3OiIKX19fXzhfIjtzOjQ6IiB5ZXMiO3M6NzoiCl9fX185XyI7czo0OiIgeWVzIjtzOjE6IgoiO3M6MDoiIjt9', 'Did', 423499),
(859, 'YTowOnt9', NULL, 593444),
(860, 'YTo3OntzOjg6IgpfX19fNDVfIjtzOjQ6IiB5ZXMiO3M6NzoiCl9fX181XyI7czozOiIgbm8iO3M6NzoiCl9fX182XyI7czo0OiIgeWVzIjtzOjc6IgpfX19fN18iO3M6NDoiIHllcyI7czo3OiIKX19fXzhfIjtzOjQ6IiB5ZXMiO3M6NzoiCl9fX185XyI7czo0OiIgeWVzIjtzOjE6IgoiO3M6MDoiIjt9', 'Ok', 923444),
(861, 'YTozNzp7czo4OiIKX19fXzEwXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMTFfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18xMl8iO3M6NDoiIHllcyI7czo4OiIKX19fXzEzXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMTRfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18xNV8iO3M6NDoiIHllcyI7czo4OiIKX19fXzE2XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMTdfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18xOF8iO3M6NDoiIHllcyI7czo4OiIKX19fXzE5XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMjBfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18yMV8iO3M6NDoiIHllcyI7czo4OiIKX19fXzIyXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMjNfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18yNF8iO3M6NDoiIHllcyI7czo4OiIKX19fXzI1XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMjZfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18yN18iO3M6NDoiIHllcyI7czo4OiIKX19fXzI4XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMjlfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18zMF8iO3M6NDoiIHllcyI7czo4OiIKX19fXzMxXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMzJfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18zM18iO3M6NDoiIHllcyI7czo4OiIKX19fXzM0XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMzVfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18zNl8iO3M6NDoiIHllcyI7czo4OiIKX19fXzM3XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMzhfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18zOV8iO3M6NDoiIHllcyI7czo3OiIKX19fXzRfIjtzOjM6IiBubyI7czo4OiIKX19fXzQwXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fNDFfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX180Ml8iO3M6NDoiIHllcyI7czo4OiIKX19fXzQzXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fNDRfIjtzOjQ6IiB5ZXMiO3M6MToiCiI7czowOiIiO30=', 'Ok', 423444),
(862, 'YTo3OntzOjg6IgpfX19fNDVfIjtzOjQ6IiB5ZXMiO3M6NzoiCl9fX181XyI7czozOiIgbm8iO3M6NzoiCl9fX182XyI7czo0OiIgeWVzIjtzOjc6IgpfX19fN18iO3M6NDoiIHllcyI7czo3OiIKX19fXzhfIjtzOjQ6IiB5ZXMiO3M6NzoiCl9fX185XyI7czo0OiIgeWVzIjtzOjE6IgoiO3M6MDoiIjt9', 'M', 623444),
(863, 'YTowOnt9', NULL, 544),
(864, 'YTo3OntzOjg6IgpfX19fNDVfIjtzOjQ6IiB5ZXMiO3M6NzoiCl9fX181XyI7czozOiIgbm8iO3M6NzoiCl9fX182XyI7czo0OiIgeWVzIjtzOjc6IgpfX19fN18iO3M6NDoiIHllcyI7czo3OiIKX19fXzhfIjtzOjQ6IiB5ZXMiO3M6NzoiCl9fX185XyI7czo0OiIgeWVzIjtzOjE6IgoiO3M6MDoiIjt9', 'Ok', 123444),
(865, 'YTowOnt9', NULL, 0),
(866, 'YTowOnt9', NULL, 0),
(867, 'YTowOnt9', NULL, 923444),
(868, 'YTowOnt9', NULL, 923444),
(869, 'YTowOnt9', NULL, 923444),
(870, 'YTowOnt9', NULL, 923444),
(871, 'YTowOnt9', NULL, 623444),
(872, 'YTowOnt9', NULL, 623444),
(873, 'YTowOnt9', NULL, 923444),
(874, 'YTo3OntzOjg6IgpfX19fNDVfIjtzOjQ6IiB5ZXMiO3M6NzoiCl9fX181XyI7czozOiIgbm8iO3M6NzoiCl9fX182XyI7czo0OiIgeWVzIjtzOjc6IgpfX19fN18iO3M6NDoiIHllcyI7czo3OiIKX19fXzhfIjtzOjQ6IiB5ZXMiO3M6NzoiCl9fX185XyI7czo0OiIgeWVzIjtzOjE6IgoiO3M6MDoiIjt9', 'Bob', 444),
(875, 'YTowOnt9', NULL, 0),
(876, 'YTo3OntzOjg6IgpfX19fNDVfIjtzOjQ6IiB5ZXMiO3M6NzoiCl9fX181XyI7czozOiIgbm8iO3M6NzoiCl9fX182XyI7czo0OiIgeWVzIjtzOjc6IgpfX19fN18iO3M6NDoiIHllcyI7czo3OiIKX19fXzhfIjtzOjQ6IiB5ZXMiO3M6NzoiCl9fX185XyI7czo0OiIgeWVzIjtzOjE6IgoiO3M6MDoiIjt9', 'Ok', 423440),
(877, 'YTowOnt9', NULL, 444),
(878, 'YTowOnt9', NULL, 444),
(879, 'YTowOnt9', NULL, 623444),
(880, 'YTowOnt9', NULL, 623444),
(881, 'YToxOntzOjY6IihudWxsKSI7czowOiIiO30=', '', 444),
(882, '', '', NULL),
(883, 'YToxOntzOjY6IihudWxsKSI7czowOiIiO30=', '', 444),
(884, '', '', NULL),
(885, 'YToxOntzOjY6IihudWxsKSI7czowOiIiO30=', '', 444),
(886, '', '', NULL),
(887, 'YTozNzp7czo4OiIKX19fXzEwXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMTFfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18xMl8iO3M6NDoiIHllcyI7czo4OiIKX19fXzEzXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMTRfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18xNV8iO3M6NDoiIHllcyI7czo4OiIKX19fXzE2XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMTdfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18xOF8iO3M6NDoiIHllcyI7czo4OiIKX19fXzE5XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMjBfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18yMV8iO3M6NDoiIHllcyI7czo4OiIKX19fXzIyXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMjNfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18yNF8iO3M6NDoiIHllcyI7czo4OiIKX19fXzI1XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMjZfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18yN18iO3M6NDoiIHllcyI7czo4OiIKX19fXzI4XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMjlfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18zMF8iO3M6NDoiIHllcyI7czo4OiIKX19fXzMxXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMzJfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18zM18iO3M6NDoiIHllcyI7czo4OiIKX19fXzM0XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMzVfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18zNl8iO3M6NDoiIHllcyI7czo4OiIKX19fXzM3XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMzhfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18zOV8iO3M6NDoiIHllcyI7czo3OiIKX19fXzRfIjtzOjM6IiBubyI7czo4OiIKX19fXzQwXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fNDFfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX180Ml8iO3M6NDoiIHllcyI7czo4OiIKX19fXzQzXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fNDRfIjtzOjQ6IiB5ZXMiO3M6MToiCiI7czowOiIiO30=', 'Failed', 444),
(888, '', '', NULL),
(889, 'YTozNzp7czo4OiIKX19fXzEwXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMTFfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18xMl8iO3M6NDoiIHllcyI7czo4OiIKX19fXzEzXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMTRfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18xNV8iO3M6NDoiIHllcyI7czo4OiIKX19fXzE2XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMTdfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18xOF8iO3M6NDoiIHllcyI7czo4OiIKX19fXzE5XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMjBfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18yMV8iO3M6NDoiIHllcyI7czo4OiIKX19fXzIyXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMjNfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18yNF8iO3M6NDoiIHllcyI7czo4OiIKX19fXzI1XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMjZfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18yN18iO3M6NDoiIHllcyI7czo4OiIKX19fXzI4XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMjlfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18zMF8iO3M6NDoiIHllcyI7czo4OiIKX19fXzMxXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMzJfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18zM18iO3M6NDoiIHllcyI7czo4OiIKX19fXzM0XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMzVfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18zNl8iO3M6NDoiIHllcyI7czo4OiIKX19fXzM3XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMzhfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18zOV8iO3M6NDoiIHllcyI7czo3OiIKX19fXzRfIjtzOjM6IiBubyI7czo4OiIKX19fXzQwXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fNDFfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX180Ml8iO3M6NDoiIHllcyI7czo4OiIKX19fXzQzXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fNDRfIjtzOjQ6IiB5ZXMiO3M6MToiCiI7czowOiIiO30=', 'Fail', 623444),
(890, 'YTo3OntzOjg6IgpfX19fNDVfIjtzOjQ6IiB5ZXMiO3M6NzoiCl9fX181XyI7czozOiIgbm8iO3M6NzoiCl9fX182XyI7czo0OiIgeWVzIjtzOjc6IgpfX19fN18iO3M6NDoiIHllcyI7czo3OiIKX19fXzhfIjtzOjQ6IiB5ZXMiO3M6NzoiCl9fX185XyI7czo0OiIgeWVzIjtzOjE6IgoiO3M6MDoiIjt9', 'No', 523444),
(891, 'YTozNzp7czo4OiIKX19fXzEwXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMTFfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18xMl8iO3M6NDoiIHllcyI7czo4OiIKX19fXzEzXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMTRfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18xNV8iO3M6NDoiIHllcyI7czo4OiIKX19fXzE2XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMTdfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18xOF8iO3M6NDoiIHllcyI7czo4OiIKX19fXzE5XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMjBfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18yMV8iO3M6NDoiIHllcyI7czo4OiIKX19fXzIyXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMjNfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18yNF8iO3M6NDoiIHllcyI7czo4OiIKX19fXzI1XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMjZfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18yN18iO3M6NDoiIHllcyI7czo4OiIKX19fXzI4XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMjlfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18zMF8iO3M6NDoiIHllcyI7czo4OiIKX19fXzMxXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMzJfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18zM18iO3M6NDoiIHllcyI7czo4OiIKX19fXzM0XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMzVfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18zNl8iO3M6NDoiIHllcyI7czo4OiIKX19fXzM3XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMzhfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18zOV8iO3M6NDoiIHllcyI7czo3OiIKX19fXzRfIjtzOjM6IiBubyI7czo4OiIKX19fXzQwXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fNDFfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX180Ml8iO3M6NDoiIHllcyI7czo4OiIKX19fXzQzXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fNDRfIjtzOjQ6IiB5ZXMiO3M6MToiCiI7czowOiIiO30=', 'Fail', 44),
(892, 'YTo3OntzOjg6IgpfX19fNDVfIjtzOjQ6IiB5ZXMiO3M6NzoiCl9fX181XyI7czozOiIgbm8iO3M6NzoiCl9fX182XyI7czo0OiIgeWVzIjtzOjc6IgpfX19fN18iO3M6NDoiIHllcyI7czo3OiIKX19fXzhfIjtzOjQ6IiB5ZXMiO3M6NzoiCl9fX185XyI7czo0OiIgeWVzIjtzOjE6IgoiO3M6MDoiIjt9', 'Workling', 444),
(893, 'YTozNzp7czo4OiIKX19fXzEwXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMTFfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18xMl8iO3M6MzoiIG5vIjtzOjg6IgpfX19fMTNfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18xNF8iO3M6MzoiIG5vIjtzOjg6IgpfX19fMTVfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18xNl8iO3M6NDoiIHllcyI7czo4OiIKX19fXzE3XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMThfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18xOV8iO3M6NDoiIHllcyI7czo4OiIKX19fXzIwXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMjFfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18yMl8iO3M6NDoiIHllcyI7czo4OiIKX19fXzIzXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMjRfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18yNV8iO3M6NDoiIHllcyI7czo4OiIKX19fXzI2XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMjdfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18yOF8iO3M6NDoiIHllcyI7czo4OiIKX19fXzI5XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMzBfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18zMV8iO3M6NDoiIHllcyI7czo4OiIKX19fXzMyXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMzNfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18zNF8iO3M6NDoiIHllcyI7czo4OiIKX19fXzM1XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMzZfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18zN18iO3M6NDoiIHllcyI7czo4OiIKX19fXzM4XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMzlfIjtzOjQ6IiB5ZXMiO3M6NzoiCl9fX180XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fNDBfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX180MV8iO3M6NDoiIHllcyI7czo4OiIKX19fXzQyXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fNDNfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX180NF8iO3M6NDoiIHllcyI7czoxOiIKIjtzOjA6IiI7fQ==', 'Works', 0),
(894, 'YTo3OntzOjg6IgpfX19fNDVfIjtzOjQ6IiB5ZXMiO3M6NzoiCl9fX181XyI7czozOiIgbm8iO3M6NzoiCl9fX182XyI7czo0OiIgeWVzIjtzOjc6IgpfX19fN18iO3M6NDoiIHllcyI7czo3OiIKX19fXzhfIjtzOjQ6IiB5ZXMiO3M6NzoiCl9fX185XyI7czo0OiIgeWVzIjtzOjE6IgoiO3M6MDoiIjt9', 'Great', 444),
(895, 'YTozNjp7aToxMDtzOjM6InllcyI7aToxMTtzOjM6InllcyI7aToxMjtzOjM6InllcyI7aToxMztzOjM6InllcyI7aToxNDtzOjM6InllcyI7aToxNTtzOjM6InllcyI7aToxNjtzOjM6InllcyI7aToxNztzOjM6InllcyI7aToxODtzOjM6InllcyI7aToxOTtzOjM6InllcyI7aToyMDtzOjM6InllcyI7aToyMTtzOjM6InllcyI7aToyMjtzOjM6InllcyI7aToyMztzOjM6InllcyI7aToyNDtzOjM6InllcyI7aToyNTtzOjM6InllcyI7aToyNjtzOjM6InllcyI7aToyNztzOjM6InllcyI7aToyODtzOjM6InllcyI7aToyOTtzOjM6InllcyI7aTozMDtzOjM6InllcyI7aTozMTtzOjM6InllcyI7aTozMjtzOjM6InllcyI7aTozMztzOjM6InllcyI7aTozNDtzOjM6InllcyI7aTozNTtzOjM6InllcyI7aTozNjtzOjM6InllcyI7aTozNztzOjM6InllcyI7aTozODtzOjM6InllcyI7aTozOTtzOjM6InllcyI7aTo0O3M6Mjoibm8iO2k6NDA7czozOiJ5ZXMiO2k6NDE7czozOiJ5ZXMiO2k6NDI7czozOiJ5ZXMiO2k6NDM7czozOiJ5ZXMiO2k6NDQ7czozOiJ5ZXMiO30=', 'Fail', 423440),
(896, '', '', NULL),
(897, 'YTozNjp7aToxMDtzOjM6InllcyI7aToxMTtzOjM6InllcyI7aToxMjtzOjM6InllcyI7aToxMztzOjM6InllcyI7aToxNDtzOjM6InllcyI7aToxNTtzOjM6InllcyI7aToxNjtzOjM6InllcyI7aToxNztzOjM6InllcyI7aToxODtzOjM6InllcyI7aToxOTtzOjM6InllcyI7aToyMDtzOjM6InllcyI7aToyMTtzOjM6InllcyI7aToyMjtzOjM6InllcyI7aToyMztzOjM6InllcyI7aToyNDtzOjM6InllcyI7aToyNTtzOjM6InllcyI7aToyNjtzOjM6InllcyI7aToyNztzOjM6InllcyI7aToyODtzOjM6InllcyI7aToyOTtzOjM6InllcyI7aTozMDtzOjM6InllcyI7aTozMTtzOjM6InllcyI7aTozMjtzOjM6InllcyI7aTozMztzOjM6InllcyI7aTozNDtzOjM6InllcyI7aTozNTtzOjM6InllcyI7aTozNjtzOjM6InllcyI7aTozNztzOjM6InllcyI7aTozODtzOjM6InllcyI7aTozOTtzOjM6InllcyI7aTo0O3M6Mjoibm8iO2k6NDA7czozOiJ5ZXMiO2k6NDE7czozOiJ5ZXMiO2k6NDI7czozOiJ5ZXMiO2k6NDM7czozOiJ5ZXMiO2k6NDQ7czozOiJ5ZXMiO30=', 'Failed', 423444),
(898, 'YTo2OntpOjQ1O3M6MzoieWVzIjtpOjU7czoyOiJubyI7aTo2O3M6MzoieWVzIjtpOjc7czozOiJ5ZXMiO2k6ODtzOjM6InllcyI7aTo5O3M6MzoieWVzIjt9', 'Okay', 423494),
(899, 'YTowOnt9', NULL, 723444),
(900, 'YTowOnt9', NULL, 723444),
(901, 'YTowOnt9', NULL, 723444),
(902, 'YTowOnt9', NULL, 723444),
(903, 'YTowOnt9', NULL, 423494),
(904, 'YTowOnt9', NULL, 423494),
(905, 'YTowOnt9', NULL, 444),
(906, 'YTowOnt9', NULL, 444),
(907, 'YTowOnt9', NULL, 423499),
(908, 'YTowOnt9', NULL, 423499),
(909, 'YTowOnt9', NULL, 444),
(910, 'YTowOnt9', NULL, 444),
(911, 'YTowOnt9', NULL, 723444),
(912, 'YTowOnt9', NULL, 723444),
(913, 'YTowOnt9', NULL, 423494),
(914, 'YTowOnt9', NULL, 423494),
(915, 'YTowOnt9', NULL, 423494),
(916, 'YTowOnt9', NULL, 423494),
(917, 'YTowOnt9', NULL, 423499),
(918, 'YTowOnt9', NULL, 423499),
(919, 'YTowOnt9', NULL, 444),
(920, 'YTowOnt9', NULL, 444),
(921, 'YTowOnt9', NULL, 423494),
(922, 'YTowOnt9', NULL, 423494),
(923, 'YTowOnt9', NULL, 444),
(924, 'YTowOnt9', NULL, 444),
(925, 'YTowOnt9', NULL, 423494),
(926, 'YTowOnt9', NULL, 423494),
(927, 'YTowOnt9', NULL, 423499),
(928, 'YTowOnt9', NULL, 423499),
(929, 'YTowOnt9', NULL, 423499),
(930, 'YTowOnt9', NULL, 423499),
(931, 'YTowOnt9', NULL, 423499),
(932, 'YTowOnt9', NULL, 423499),
(933, 'YTowOnt9', NULL, 423499),
(934, 'YTowOnt9', NULL, 423499),
(935, 'YTowOnt9', NULL, 423494),
(936, 'YTowOnt9', NULL, 423494),
(937, 'YTowOnt9', NULL, 0),
(938, 'YTowOnt9', NULL, 0),
(939, 'YTozNjp7aToxMDtzOjM6InllcyI7aToxMTtzOjM6InllcyI7aToxMjtzOjM6InllcyI7aToxMztzOjM6InllcyI7aToxNDtzOjM6InllcyI7aToxNTtzOjM6InllcyI7aToxNjtzOjM6InllcyI7aToxNztzOjM6InllcyI7aToxODtzOjM6InllcyI7aToxOTtzOjM6InllcyI7aToyMDtzOjM6InllcyI7aToyMTtzOjM6InllcyI7aToyMjtzOjM6InllcyI7aToyMztzOjM6InllcyI7aToyNDtzOjM6InllcyI7aToyNTtzOjM6InllcyI7aToyNjtzOjM6InllcyI7aToyNztzOjM6InllcyI7aToyODtzOjM6InllcyI7aToyOTtzOjM6InllcyI7aTozMDtzOjM6InllcyI7aTozMTtzOjM6InllcyI7aTozMjtzOjM6InllcyI7aTozMztzOjM6InllcyI7aTozNDtzOjM6InllcyI7aTozNTtzOjM6InllcyI7aTozNjtzOjM6InllcyI7aTozNztzOjM6InllcyI7aTozODtzOjM6InllcyI7aTozOTtzOjM6InllcyI7aTo0O3M6Mjoibm8iO2k6NDA7czozOiJ5ZXMiO2k6NDE7czozOiJ5ZXMiO2k6NDI7czozOiJ5ZXMiO2k6NDM7czozOiJ5ZXMiO2k6NDQ7czozOiJ5ZXMiO30=', 'Fail', 0),
(940, '', '', NULL),
(941, 'YToxOntzOjY6IihudWxsKSI7czowOiIiO30=', '', 0),
(942, '', '', NULL),
(943, 'YToxOntzOjY6IihudWxsKSI7czowOiIiO30=', '', 0),
(944, '', '', NULL),
(945, 'YTowOnt9', NULL, 0),
(946, 'YTowOnt9', NULL, 0),
(947, 'YTowOnt9', NULL, 0),
(948, 'YTowOnt9', NULL, 0),
(949, 'YTowOnt9', NULL, 0),
(950, 'YTo2OntpOjQ1O3M6MzoieWVzIjtpOjU7czoyOiJubyI7aTo2O3M6MzoieWVzIjtpOjc7czozOiJ5ZXMiO2k6ODtzOjM6InllcyI7aTo5O3M6MzoieWVzIjt9', 'Vd', 423444),
(951, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 423444),
(952, '', '', NULL),
(953, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 423444),
(954, '', '', NULL),
(955, 'YToxOntzOjIyOiJwcmVfaW5zcGVjdGlvbl9zdGVwX2lkIjtzOjE6IjQiO30=', '', 423444),
(956, '', '', NULL),
(957, 'YToxOntzOjY6IihudWxsKSI7czowOiIiO30=', '', 0),
(958, '', '', NULL),
(959, 'YToxOntzOjY6IihudWxsKSI7czowOiIiO30=', '', 423444),
(960, 'YToxOntzOjY6IihudWxsKSI7czowOiIiO30=', '', 423444),
(961, 'YToxOntzOjY6IihudWxsKSI7czowOiIiO30=', '', 423444),
(962, 'YToxOntzOjY6IihudWxsKSI7czowOiIiO30=', '', 423444),
(963, 'YTowOnt9', NULL, 0),
(964, 'YToxOntzOjY6IihudWxsKSI7czowOiIiO30=', '', 444),
(965, 'YTozNjp7aToxMDtzOjM6InllcyI7aToxMTtzOjM6InllcyI7aToxMjtzOjM6InllcyI7aToxMztzOjM6InllcyI7aToxNDtzOjM6InllcyI7aToxNTtzOjM6InllcyI7aToxNjtzOjM6InllcyI7aToxNztzOjM6InllcyI7aToxODtzOjM6InllcyI7aToxOTtzOjM6InllcyI7aToyMDtzOjM6InllcyI7aToyMTtzOjM6InllcyI7aToyMjtzOjM6InllcyI7aToyMztzOjM6InllcyI7aToyNDtzOjM6InllcyI7aToyNTtzOjM6InllcyI7aToyNjtzOjM6InllcyI7aToyNztzOjM6InllcyI7aToyODtzOjM6InllcyI7aToyOTtzOjM6InllcyI7aTozMDtzOjM6InllcyI7aTozMTtzOjM6InllcyI7aTozMjtzOjM6InllcyI7aTozMztzOjM6InllcyI7aTozNDtzOjM6InllcyI7aTozNTtzOjM6InllcyI7aTozNjtzOjM6InllcyI7aTozNztzOjM6InllcyI7aTozODtzOjM6InllcyI7aTozOTtzOjM6InllcyI7aTo0O3M6Mjoibm8iO2k6NDA7czozOiJ5ZXMiO2k6NDE7czozOiJ5ZXMiO2k6NDI7czozOiJ5ZXMiO2k6NDM7czozOiJ5ZXMiO2k6NDQ7czozOiJ5ZXMiO30=', 'Ok', 423444),
(966, 'YTo2OntpOjQ1O3M6MzoieWVzIjtpOjU7czoyOiJubyI7aTo2O3M6MzoieWVzIjtpOjc7czozOiJ5ZXMiO2k6ODtzOjM6InllcyI7aTo5O3M6MzoieWVzIjt9', 'Ok', 453444),
(967, 'YTowOnt9', NULL, 444),
(968, 'YTo2OntpOjQ1O3M6MzoieWVzIjtpOjU7czoyOiJubyI7aTo2O3M6MzoieWVzIjtpOjc7czozOiJ5ZXMiO2k6ODtzOjM6InllcyI7aTo5O3M6MzoieWVzIjt9', 'Ok', 3444),
(969, 'YTowOnt9', NULL, 700),
(970, 'YTowOnt9', NULL, 700),
(971, 'YTowOnt9', NULL, 700),
(972, 'YTowOnt9', NULL, 700),
(973, 'YTowOnt9', NULL, 233733),
(974, 'YTowOnt9', NULL, 233733),
(975, 'YTowOnt9', NULL, 233433),
(976, 'YTowOnt9', NULL, 233433),
(977, 'YTowOnt9', NULL, 3),
(978, 'YTowOnt9', NULL, 3),
(979, 'YTowOnt9', NULL, 999999),
(980, 'YTowOnt9', NULL, 999999),
(981, 'YToxOntzOjY6IihudWxsKSI7czowOiIiO30=', '', 999999),
(982, '', '', NULL),
(983, 'YToxOntzOjY6IihudWxsKSI7czowOiIiO30=', '', 999999),
(984, '', '', NULL),
(985, 'YTozNzp7czo4OiIKX19fXzEwXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMTFfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18xMl8iO3M6NDoiIHllcyI7czo4OiIKX19fXzEzXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMTRfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18xNV8iO3M6NDoiIHllcyI7czo4OiIKX19fXzE2XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMTdfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18xOF8iO3M6NDoiIHllcyI7czo4OiIKX19fXzE5XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMjBfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18yMV8iO3M6NDoiIHllcyI7czo4OiIKX19fXzIyXyI7czozOiIgbm8iO3M6ODoiCl9fX18yM18iO3M6NDoiIHllcyI7czo4OiIKX19fXzI0XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMjVfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18yNl8iO3M6NDoiIHllcyI7czo4OiIKX19fXzI3XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMjhfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18yOV8iO3M6NDoiIHllcyI7czo4OiIKX19fXzMwXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMzFfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18zMl8iO3M6NDoiIHllcyI7czo4OiIKX19fXzMzXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMzRfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18zNV8iO3M6NDoiIHllcyI7czo4OiIKX19fXzM2XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMzdfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18zOF8iO3M6NDoiIHllcyI7czo4OiIKX19fXzM5XyI7czo0OiIgeWVzIjtzOjc6IgpfX19fNF8iO3M6NDoiIHllcyI7czo4OiIKX19fXzQwXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fNDFfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX180Ml8iO3M6NDoiIHllcyI7czo4OiIKX19fXzQzXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fNDRfIjtzOjQ6IiB5ZXMiO3M6MToiCiI7czowOiIiO30=', '', 999999),
(986, '', '', NULL),
(987, 'YTozNzp7czo4OiIKX19fXzEwXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMTFfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18xMl8iO3M6NDoiIHllcyI7czo4OiIKX19fXzEzXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMTRfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18xNV8iO3M6NDoiIHllcyI7czo4OiIKX19fXzE2XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMTdfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18xOF8iO3M6NDoiIHllcyI7czo4OiIKX19fXzE5XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMjBfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18yMV8iO3M6NDoiIHllcyI7czo4OiIKX19fXzIyXyI7czozOiIgbm8iO3M6ODoiCl9fX18yM18iO3M6NDoiIHllcyI7czo4OiIKX19fXzI0XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMjVfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18yNl8iO3M6NDoiIHllcyI7czo4OiIKX19fXzI3XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMjhfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18yOV8iO3M6NDoiIHllcyI7czo4OiIKX19fXzMwXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMzFfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18zMl8iO3M6NDoiIHllcyI7czo4OiIKX19fXzMzXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMzRfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18zNV8iO3M6NDoiIHllcyI7czo4OiIKX19fXzM2XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMzdfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18zOF8iO3M6NDoiIHllcyI7czo4OiIKX19fXzM5XyI7czo0OiIgeWVzIjtzOjc6IgpfX19fNF8iO3M6NDoiIHllcyI7czo4OiIKX19fXzQwXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fNDFfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX180Ml8iO3M6NDoiIHllcyI7czo4OiIKX19fXzQzXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fNDRfIjtzOjQ6IiB5ZXMiO3M6MToiCiI7czowOiIiO30=', '', 999999),
(988, 'YTozNzp7czo4OiIKX19fXzEwXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMTFfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18xMl8iO3M6NDoiIHllcyI7czo4OiIKX19fXzEzXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMTRfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18xNV8iO3M6NDoiIHllcyI7czo4OiIKX19fXzE2XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMTdfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18xOF8iO3M6NDoiIHllcyI7czo4OiIKX19fXzE5XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMjBfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18yMV8iO3M6NDoiIHllcyI7czo4OiIKX19fXzIyXyI7czozOiIgbm8iO3M6ODoiCl9fX18yM18iO3M6NDoiIHllcyI7czo4OiIKX19fXzI0XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMjVfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18yNl8iO3M6NDoiIHllcyI7czo4OiIKX19fXzI3XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMjhfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18yOV8iO3M6NDoiIHllcyI7czo4OiIKX19fXzMwXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMzFfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18zMl8iO3M6NDoiIHllcyI7czo4OiIKX19fXzMzXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMzRfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18zNV8iO3M6NDoiIHllcyI7czo4OiIKX19fXzM2XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMzdfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18zOF8iO3M6NDoiIHllcyI7czo4OiIKX19fXzM5XyI7czo0OiIgeWVzIjtzOjc6IgpfX19fNF8iO3M6NDoiIHllcyI7czo4OiIKX19fXzQwXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fNDFfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX180Ml8iO3M6NDoiIHllcyI7czo4OiIKX19fXzQzXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fNDRfIjtzOjQ6IiB5ZXMiO3M6MToiCiI7czowOiIiO30=', '', 999999),
(989, '', '', NULL),
(990, '', '', NULL),
(991, 'YTozNzp7czo4OiIKX19fXzEwXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMTFfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18xMl8iO3M6NDoiIHllcyI7czo4OiIKX19fXzEzXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMTRfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18xNV8iO3M6NDoiIHllcyI7czo4OiIKX19fXzE2XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMTdfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18xOF8iO3M6NDoiIHllcyI7czo4OiIKX19fXzE5XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMjBfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18yMV8iO3M6NDoiIHllcyI7czo4OiIKX19fXzIyXyI7czozOiIgbm8iO3M6ODoiCl9fX18yM18iO3M6NDoiIHllcyI7czo4OiIKX19fXzI0XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMjVfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18yNl8iO3M6NDoiIHllcyI7czo4OiIKX19fXzI3XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMjhfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18yOV8iO3M6NDoiIHllcyI7czo4OiIKX19fXzMwXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMzFfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18zMl8iO3M6NDoiIHllcyI7czo4OiIKX19fXzMzXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMzRfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18zNV8iO3M6NDoiIHllcyI7czo4OiIKX19fXzM2XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMzdfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18zOF8iO3M6NDoiIHllcyI7czo4OiIKX19fXzM5XyI7czo0OiIgeWVzIjtzOjc6IgpfX19fNF8iO3M6NDoiIHllcyI7czo4OiIKX19fXzQwXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fNDFfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX180Ml8iO3M6NDoiIHllcyI7czo4OiIKX19fXzQzXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fNDRfIjtzOjQ6IiB5ZXMiO3M6MToiCiI7czowOiIiO30=', '', 999999),
(992, '', '', NULL),
(993, 'YTozNzp7czo4OiIKX19fXzEwXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMTFfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18xMl8iO3M6NDoiIHllcyI7czo4OiIKX19fXzEzXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMTRfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18xNV8iO3M6NDoiIHllcyI7czo4OiIKX19fXzE2XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMTdfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18xOF8iO3M6NDoiIHllcyI7czo4OiIKX19fXzE5XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMjBfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18yMV8iO3M6NDoiIHllcyI7czo4OiIKX19fXzIyXyI7czozOiIgbm8iO3M6ODoiCl9fX18yM18iO3M6NDoiIHllcyI7czo4OiIKX19fXzI0XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMjVfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18yNl8iO3M6NDoiIHllcyI7czo4OiIKX19fXzI3XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMjhfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18yOV8iO3M6NDoiIHllcyI7czo4OiIKX19fXzMwXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMzFfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18zMl8iO3M6NDoiIHllcyI7czo4OiIKX19fXzMzXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMzRfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18zNV8iO3M6NDoiIHllcyI7czo4OiIKX19fXzM2XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMzdfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18zOF8iO3M6NDoiIHllcyI7czo4OiIKX19fXzM5XyI7czo0OiIgeWVzIjtzOjc6IgpfX19fNF8iO3M6NDoiIHllcyI7czo4OiIKX19fXzQwXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fNDFfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX180Ml8iO3M6NDoiIHllcyI7czo4OiIKX19fXzQzXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fNDRfIjtzOjQ6IiB5ZXMiO3M6MToiCiI7czowOiIiO30=', '', 999999),
(994, '', '', NULL),
(995, 'YTozNzp7czo4OiIKX19fXzEwXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMTFfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18xMl8iO3M6NDoiIHllcyI7czo4OiIKX19fXzEzXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMTRfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18xNV8iO3M6NDoiIHllcyI7czo4OiIKX19fXzE2XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMTdfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18xOF8iO3M6NDoiIHllcyI7czo4OiIKX19fXzE5XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMjBfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18yMV8iO3M6NDoiIHllcyI7czo4OiIKX19fXzIyXyI7czozOiIgbm8iO3M6ODoiCl9fX18yM18iO3M6NDoiIHllcyI7czo4OiIKX19fXzI0XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMjVfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18yNl8iO3M6NDoiIHllcyI7czo4OiIKX19fXzI3XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMjhfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18yOV8iO3M6NDoiIHllcyI7czo4OiIKX19fXzMwXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMzFfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18zMl8iO3M6NDoiIHllcyI7czo4OiIKX19fXzMzXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMzRfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18zNV8iO3M6NDoiIHllcyI7czo4OiIKX19fXzM2XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMzdfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18zOF8iO3M6NDoiIHllcyI7czo4OiIKX19fXzM5XyI7czo0OiIgeWVzIjtzOjc6IgpfX19fNF8iO3M6NDoiIHllcyI7czo4OiIKX19fXzQwXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fNDFfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX180Ml8iO3M6NDoiIHllcyI7czo4OiIKX19fXzQzXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fNDRfIjtzOjQ6IiB5ZXMiO3M6MToiCiI7czowOiIiO30=', '', 999999),
(996, 'YTozNzp7czo4OiIKX19fXzEwXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMTFfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18xMl8iO3M6NDoiIHllcyI7czo4OiIKX19fXzEzXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMTRfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18xNV8iO3M6NDoiIHllcyI7czo4OiIKX19fXzE2XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMTdfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18xOF8iO3M6NDoiIHllcyI7czo4OiIKX19fXzE5XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMjBfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18yMV8iO3M6NDoiIHllcyI7czo4OiIKX19fXzIyXyI7czozOiIgbm8iO3M6ODoiCl9fX18yM18iO3M6NDoiIHllcyI7czo4OiIKX19fXzI0XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMjVfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18yNl8iO3M6NDoiIHllcyI7czo4OiIKX19fXzI3XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMjhfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18yOV8iO3M6NDoiIHllcyI7czo4OiIKX19fXzMwXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMzFfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18zMl8iO3M6NDoiIHllcyI7czo4OiIKX19fXzMzXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMzRfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18zNV8iO3M6NDoiIHllcyI7czo4OiIKX19fXzM2XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMzdfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18zOF8iO3M6NDoiIHllcyI7czo4OiIKX19fXzM5XyI7czo0OiIgeWVzIjtzOjc6IgpfX19fNF8iO3M6NDoiIHllcyI7czo4OiIKX19fXzQwXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fNDFfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX180Ml8iO3M6NDoiIHllcyI7czo4OiIKX19fXzQzXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fNDRfIjtzOjQ6IiB5ZXMiO3M6MToiCiI7czowOiIiO30=', '', 999999),
(997, 'YTozNzp7czo4OiIKX19fXzEwXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMTFfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18xMl8iO3M6NDoiIHllcyI7czo4OiIKX19fXzEzXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMTRfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18xNV8iO3M6NDoiIHllcyI7czo4OiIKX19fXzE2XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMTdfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18xOF8iO3M6NDoiIHllcyI7czo4OiIKX19fXzE5XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMjBfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18yMV8iO3M6NDoiIHllcyI7czo4OiIKX19fXzIyXyI7czozOiIgbm8iO3M6ODoiCl9fX18yM18iO3M6NDoiIHllcyI7czo4OiIKX19fXzI0XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMjVfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18yNl8iO3M6NDoiIHllcyI7czo4OiIKX19fXzI3XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMjhfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18yOV8iO3M6NDoiIHllcyI7czo4OiIKX19fXzMwXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMzFfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18zMl8iO3M6NDoiIHllcyI7czo4OiIKX19fXzMzXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMzRfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18zNV8iO3M6NDoiIHllcyI7czo4OiIKX19fXzM2XyI7czo0OiIgeWVzIjtzOjg6IgpfX19fMzdfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX18zOF8iO3M6NDoiIHllcyI7czo4OiIKX19fXzM5XyI7czo0OiIgeWVzIjtzOjc6IgpfX19fNF8iO3M6NDoiIHllcyI7czo4OiIKX19fXzQwXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fNDFfIjtzOjQ6IiB5ZXMiO3M6ODoiCl9fX180Ml8iO3M6NDoiIHllcyI7czo4OiIKX19fXzQzXyI7czo0OiIgeWVzIjtzOjg6IgpfX19fNDRfIjtzOjQ6IiB5ZXMiO3M6MToiCiI7czowOiIiO30=', '', 999999),
(998, '', '', NULL),
(999, '', '', NULL),
(1000, '', '', NULL),
(1001, 'YToxOntzOjY6IihudWxsKSI7czowOiIiO30=', '', 999999),
(1002, '', '', NULL),
(1003, 'YToxOntzOjY6IihudWxsKSI7czowOiIiO30=', '', 3544),
(1004, '', '', NULL);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=46 ;

--
-- Dumping data for table `trip_inspection_steps`
--

INSERT INTO `trip_inspection_steps` (`inspection_step_id`, `step`, `step_image`, `inspection_type`) VALUES
(4, 'Look Under Bus for Leaks', '/uploads/inspection-steps/f1322417c7a5dcb4a13d837ac6420033.png', 'pre'),
(5, 'Any students left on the vehicle', '/uploads/inspection-steps/0a697045b3d1d16a73044b882028a7e2.ico', 'post'),
(6, 'Any items left on the vehicle', '/uploads/inspection-steps/2f65502c4b6c6c176f85b7fa654e7985.ico', 'post'),
(7, 'Any Open windows/doors', '/uploads/inspection-steps/055b1fbab05cc3ee1d2988ccc4cb8a29.ico', 'post'),
(8, 'Any mechanical/operational problems to report', '/uploads/inspection-steps/6d0a60c70fef69bfaea4b217b5847e6d.ico', 'post'),
(9, 'Any damage or vandalism', '/uploads/inspection-steps/13edb8fca22aa21e165b9bc8c7a511b3.ico', 'post'),
(10, 'Winshield-glass and window check', '/uploads/inspection-steps/a8ded9468edd89c0c5b458f6af7cc100.PNG', 'pre'),
(11, 'Appearance', '/uploads/inspection-steps/b6849ea0a5b5defa3b3ac07e56bffdae.PNG', 'pre'),
(12, 'First Aid and Body Fluid Kit', '/uploads/inspection-steps/5810ea5b0c884b2f6f2afbc4f51288bf.PNG', 'pre'),
(13, 'Fire Extinguisher', '/uploads/inspection-steps/4405fd15ef814bc31b9fd92b09462d8b.PNG', 'pre'),
(14, 'Emergency Triangles', '/uploads/inspection-steps/c2ad94201bab6e0cfe59ec33665f3973.PNG', 'pre'),
(15, 'Fuses , Windows, Emergency Exit', '/uploads/inspection-steps/1a725c7b81ddf4491a4a4f0c59c4a413.PNG', 'pre'),
(16, 'Horn', '/uploads/inspection-steps/191ee7b4e123730e5d7b4876a0e76386.PNG', 'pre'),
(17, 'Steering Wheel', '/uploads/inspection-steps/311668d297edcf3929b02310d51cd07f.PNG', 'pre'),
(18, 'Washers and Wippers', '/uploads/inspection-steps/4e8f314327eb25e8ed7537e177b23380.PNG', 'pre'),
(19, 'Mirrors', '/uploads/inspection-steps/bceafebd7b2ae8d5f71c61b115cbd6f5.PNG', 'pre'),
(20, 'Defroster and Heater', '/uploads/inspection-steps/cb9cef21adfb457bcebe95cc4dbc7b5d.PNG', 'pre'),
(21, 'Emerg. Door/Window Buzzer', '/uploads/inspection-steps/4578a6c43740cac567bc1e04727897bf.PNG', 'pre'),
(22, 'Brake Warning Light/Buzzer', '/uploads/inspection-steps/fc1c41652471f01bec50546e28717073.PNG', 'pre'),
(23, 'Stop Arm Warning Light', '', 'pre'),
(24, 'Parking Brake', '', 'pre'),
(25, 'Fuel Level-Oil Water Temp.', '', 'pre'),
(26, 'Gear Shift Lever', '', 'pre'),
(27, 'Air Gauges', '', 'pre'),
(28, 'Driver Seat and Belts', '', 'pre'),
(29, 'Front Door Operations', '', 'pre'),
(30, 'Cross Over Mirrors', '', 'pre'),
(31, 'Headlights,Lft,Turn, Backup, Yellows On', '', 'pre'),
(32, 'Seat Backs', '', 'pre'),
(33, 'Open Rear Door, Check Light ', '', 'pre'),
(34, 'Seat Bottoms', '', 'pre'),
(35, 'Rt Turn, Red Loading Light', '', 'pre'),
(36, 'Rt. Side Emergency Window Front Hatch', '', 'pre'),
(37, 'Open Rear Door, Check Lights', '', 'pre'),
(38, 'Left Side Emergency Window Back Panel', '', 'pre'),
(39, 'Right Clearance, Lights and Reflectors', '', 'pre'),
(40, 'Right Front Tire/Wheel, Lug Nuts, Hubs', '', 'pre'),
(41, 'Fuel Cap', '', 'pre'),
(42, 'Right Rear Tire/Wheel, Lug Nuts, Hubs', '', 'pre'),
(43, 'Left Front Tire/Wheel, Lug Nuts, Hubs', '', 'pre'),
(44, 'Left Rear Tire/Wheel, Lug Nuts, Hubs', '', 'pre'),
(45, 'Any problems with vehicle', '/uploads/inspection-steps/5edc4cd3bd829feb0229b1d4fc67f4a4.jpg', 'post');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `vehicles`
--

INSERT INTO `vehicles` (`vehicle_id`, `vehicle_name`, `vehicle_no`, `vehicle_image`, `mileage`, `occupancy`, `authorized_drivers`, `created_date`, `school_id`, `vehicle_type`, `district_id`, `seat_arrangement_csv`, `year_model`) VALUES
(1, NULL, '#KA1234ABCD', '/uploads/vehicle-pics/8f2bbf52f113b8cc83a8232dd53cc9c5.jpg', '54789', 33, NULL, '1970-01-01 00:00:00', NULL, 2, 2, '/uploads/seat-arrangement-csv/c329f4732cdcc08aee95d3b99b7c1c82.csv', '1982'),
(2, NULL, '#AC13045678ABD', '/uploads/vehicle-pics/5b0a672cea0f167bf7441c06e75bcf28.png', '136000', 33, NULL, '1970-01-01 00:00:00', NULL, 1, 3, '/uploads/seat-arrangement-csv/5b0a672cea0f167bf7441c06e75bcf28.csv', '1990'),
(3, NULL, '#KA1234ABCD', '/uploads/vehicle-pics/8f2bbf52f113b8cc83a8232dd53cc9c5.jpg', '54789', 33, NULL, '1970-01-01 00:00:00', NULL, 1, 1, '/uploads/seat-arrangement-csv/c329f4732cdcc08aee95d3b99b7c1c82.csv', '2009'),
(5, NULL, '#US12321', NULL, '14522', 30, NULL, '1970-01-01 00:00:00', NULL, 2, 4, '/uploads/seat-arrangement-csv/c329f4732cdcc08aee95d3b99b7c1c82.csv', '2014'),
(6, NULL, '#US130012', NULL, '12,000', 23, NULL, '1970-01-01 00:00:00', NULL, 3, 2, '/uploads/seat-arrangement-csv/c329f4732cdcc08aee95d3b99b7c1c82.csv', '2010'),
(7, NULL, 'SUB23', NULL, '5,000', 7, NULL, '1970-01-01 00:00:00', NULL, 2, 3, NULL, '2014'),
(8, NULL, 'CAR45', NULL, '20,000', 2, NULL, '1970-01-01 00:00:00', NULL, 3, 1, NULL, '2008'),
(9, NULL, 'SUB78', NULL, '16,876', 5, NULL, '1970-01-01 00:00:00', NULL, 2, 2, NULL, '2007'),
(10, NULL, 'C8965', NULL, '69,987', 3, NULL, '1970-01-01 00:00:00', NULL, 3, 3, NULL, '2009'),
(11, NULL, 'SUB7888', NULL, '4000', 4, NULL, '1970-01-01 00:00:00', NULL, 2, 4, NULL, '2004'),
(12, NULL, 'BUS56', NULL, '40000', 28, NULL, '1970-01-01 00:00:00', NULL, 1, 2, NULL, '2005'),
(13, NULL, 'B6743', NULL, '78456', 30, NULL, '1970-01-01 00:00:00', NULL, 1, 3, NULL, '2009'),
(14, NULL, 'B675', NULL, '23000', 23, NULL, '1970-01-01 00:00:00', NULL, 1, 1, NULL, '2011');

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
  `completion_status` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`issue_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=24 ;

--
-- Dumping data for table `vehicle_maintenance_history`
--

INSERT INTO `vehicle_maintenance_history` (`issue_id`, `school_id`, `vehicle_id`, `driver_id`, `problem_occured_time`, `problem`, `problem_location`, `comments`, `completion_status`) VALUES
(4, 3, 1, 1, '2016-12-12 00:00:00', 1, 'Test', 'Hello World', 0),
(5, 2, 1, 1, '2016-11-23 02:14:00', 2, 'Test', 'Hello World', 0),
(6, 1, 1, 1, '2016-12-12 00:00:00', 4, 'Test', 'Hello World', 1),
(7, 1, 1, 1, '2016-10-10 08:30:00', 1, 'Utah', 'Discipline Referral Comments', 0),
(8, 3, 6, 6, '1970-01-01 00:00:00', 1, 'Utah', 'Nice!!', 0),
(9, 3, 3, 7, '1970-01-01 00:00:00', 1, 'Utah', 'Great!', 0),
(10, 1, 2, 8, '1970-01-01 00:00:00', 1, 'Utah', '', 0),
(11, 1, 2, 1, '1970-01-01 00:00:00', 1, 'Utah', 'Testing app by Lance ', 0),
(12, 1, 14, 1, '1970-01-01 00:00:00', 1, 'Utah', 'Gch', 0),
(13, 2, 10, 20, '1970-01-01 00:00:00', 7, 'Utah', 'Good', 0),
(14, 3, 1, 6, '1970-01-01 00:00:00', 4, 'Utah', 'Good', 0),
(15, 3, 5, 7, '1970-01-01 00:00:00', 6, 'USA', 'Good', 0),
(16, 3, 6, 6, '1970-01-01 00:00:00', 2, 'Newyork', 'Nice', 0),
(17, 3, 6, 6, '1970-01-01 00:00:00', 8, 'pink', 'PinkC', 0),
(18, 1, 10, 8, '1970-01-01 00:00:00', 7, 'locpink', 'Commpink', 0),
(19, 1, 10, 8, '1970-01-01 00:00:00', 7, 'locpink', 'Commpink', 0),
(20, 1, 1, 1, '2016-10-10 08:30:00', 1, 'Utah', 'Discipline Referral Comments', 0),
(21, 1, 1, 1, '2016-10-10 08:30:00', 1, 'Cell', 'Discipline Referral Comments', 0),
(22, 3, 1, 6, '2016-12-07 12:20:00', 1, 'USA', 'Nice', 0),
(23, 1, 1, 9, '2016-12-19 09:35:00', 1, '', 'Daddy''s added', 0);

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_problem`
--

CREATE TABLE IF NOT EXISTS `vehicle_problem` (
  `vehicle_problem_id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(50) NOT NULL,
  PRIMARY KEY (`vehicle_problem_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `vehicle_problem`
--

INSERT INTO `vehicle_problem` (`vehicle_problem_id`, `description`) VALUES
(1, 'Oil Leak'),
(2, 'Flat Tire'),
(3, 'Engine'),
(4, 'Coolant'),
(5, 'Windows/Winshields'),
(6, 'Doors'),
(7, 'A/C or Heating'),
(8, 'Transmission'),
(9, 'Test');

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
