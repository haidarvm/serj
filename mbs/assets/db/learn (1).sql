-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 25, 2016 at 10:27 AM
-- Server version: 5.6.28-0ubuntu0.15.10.1
-- PHP Version: 5.6.11-1ubuntu3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `learn`
--

-- --------------------------------------------------------

--
-- Table structure for table `sl_user`
--

CREATE TABLE `sl_user` (
  `user_id` int(11) NOT NULL,
  `user_code` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `full_name` varchar(200) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `phone2` varchar(20) NOT NULL,
  `address` text NOT NULL,
  `date_birth` date NOT NULL,
  `facebook_id` varchar(1000) NOT NULL,
  `bbm` varchar(10) NOT NULL,
  `whatsapp` varchar(20) NOT NULL,
  `line` varchar(20) NOT NULL,
  `school` varchar(100) NOT NULL,
  `grade` varchar(20) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `class` varchar(2) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sl_user`
--

INSERT INTO `sl_user` (`user_id`, `user_code`, `username`, `password`, `email`, `full_name`, `phone`, `phone2`, `address`, `date_birth`, `facebook_id`, `bbm`, `whatsapp`, `line`, `school`, `grade`, `subject`, `class`, `create_date`) VALUES
(0, '', 'haidarvm', '12e333512696dcac787c2f16d479c610', 'haidarvm@gmail.com', 'haidar', '087722271171', '', '', '0000-00-00', '', '', '', '', '', '', '', '', '2016-03-23 02:02:01');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
