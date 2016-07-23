-- phpMyAdmin SQL Dump
-- version 4.6.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 23, 2016 at 01:36 PM
-- Server version: 5.7.12-0ubuntu1.1
-- PHP Version: 7.0.8-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kemenpan`
--

-- --------------------------------------------------------

--
-- Table structure for table `tlhp_user`
--

CREATE TABLE `tlhp_user` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `username` varchar(32) DEFAULT NULL,
  `first_name` varchar(200) DEFAULT NULL,
  `last_name` varchar(200) DEFAULT NULL,
  `full_name` varchar(200) NOT NULL,
  `password` varchar(40) DEFAULT NULL,
  `address` text,
  `address2` text,
  `email` varchar(254) NOT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `city` varchar(300) DEFAULT NULL,
  `country` varchar(200) DEFAULT NULL,
  `state` varchar(200) DEFAULT NULL,
  `zip_code` varchar(7) DEFAULT NULL,
  `other_phone` varchar(200) DEFAULT NULL,
  `active` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `group` int(10) UNSIGNED DEFAULT NULL,
  `level_id` tinyint(2) DEFAULT '2',
  `activation_key` varchar(32) DEFAULT NULL,
  `last_visit` datetime DEFAULT NULL,
  `image` varchar(1000) DEFAULT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tlhp_user_history`
--

CREATE TABLE `tlhp_user_history` (
  `log_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `login` datetime NOT NULL,
  `logout` datetime DEFAULT NULL,
  `total_use` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tlhp_user`
--
ALTER TABLE `tlhp_user`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `password` (`password`),
  ADD KEY `group` (`group`);

--
-- Indexes for table `tlhp_user_history`
--
ALTER TABLE `tlhp_user_history`
  ADD PRIMARY KEY (`log_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tlhp_user`
--
ALTER TABLE `tlhp_user`
  MODIFY `user_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tlhp_user_history`
--
ALTER TABLE `tlhp_user_history`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
