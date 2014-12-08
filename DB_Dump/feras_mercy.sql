-- phpMyAdmin SQL Dump
-- version 4.1.8
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 08, 2014 at 05:28 AM
-- Server version: 5.5.36-cll-lve
-- PHP Version: 5.4.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `feras_mercy`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `date_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf16 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `date_time`, `status`) VALUES
(1, 'Save Me', '2014-12-06 15:46:31', 1),
(2, 'Urgent', '2014-12-06 15:46:31', 1),
(3, 'In Danger', '2014-12-06 15:46:56', 1),
(4, 'Cretical', '2014-12-06 15:46:56', 1);

-- --------------------------------------------------------

--
-- Table structure for table `infections`
--

CREATE TABLE IF NOT EXISTS `infections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `country` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `longitude` varchar(20) NOT NULL,
  `latitude` varchar(20) NOT NULL,
  `description` text NOT NULL,
  `category` int(11) NOT NULL,
  `date_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `infections`
--

INSERT INTO `infections` (`id`, `title`, `country`, `city`, `longitude`, `latitude`, `description`, `category`, `date_time`, `status`) VALUES
(1, 'Infection to a person in Greece', 'Greece', 'Athin', '37.9938135', '23.761857', '24 years old man from athin \r\nthis is just dummy data , it can only represent that we can get the data', 2, '2014-12-06 10:50:05', 1),
(2, 'Infection to a person in Greece', 'Greece', 'Athin', '37.9938135', '23.761857', '24 years old man from athin this is just dummy data , it can only represent that we can get the data', 1, '2014-12-06 10:51:34', 5),
(3, 'Infection to a person in Greece', 'Greece', 'Bondi Beach', '-33.890542', '151.274856', '24 years old man from athin this is just dummy data , it can only represent that we can get the data', 3, '2014-12-06 10:51:34', 2),
(4, 'Infection to a person in Greece', 'Greece', 'Coogee Beach', '-33.923036', '151.259052', '24 years old man from athin this is just dummy data , it can only represent that we can get the data', 4, '2014-12-06 10:51:34', 3),
(5, 'Infection to a person in Greece', 'Greece', 'Cronulla Beach', '-34.028249', '151.157507', '24 years old man from athin this is just dummy data , it can only represent that we can get the data', 1, '2014-12-06 10:51:34', 4),
(6, 'Infection to a person in Greece', 'Greece', 'Manly Beach', '-33.80010128657071', '151.28747820854187', '24 years old man from athin this is just dummy data , it can only represent that we can get the data', 1, '2014-12-06 10:51:34', 2),
(7, 'Infection to a person in Greece', 'Greece', 'Maroubra Beach', '-33.950198', '151.259302', '24 years old man from athin this is just dummy data , it can only represent that we can get the data', 2, '2014-12-06 10:51:34', 2),
(8, 'Infection to a person in Greece', 'Greece', 'Athin', '37.9938135', '23.761857', '24 years old man from athin this is just dummy data , it can only represent that we can get the data', 5, '2014-12-06 10:51:34', 1);

-- --------------------------------------------------------

--
-- Table structure for table `infections_categories`
--

CREATE TABLE IF NOT EXISTS `infections_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `infections_categories`
--

INSERT INTO `infections_categories` (`id`, `name`, `status`, `date_time`) VALUES
(1, 'Heart disease', 1, '2014-12-06 10:32:06'),
(2, 'Polio', 1, '2014-12-06 10:32:06'),
(3, 'Autism', 1, '2014-12-06 10:32:35'),
(4, 'Malaria', 1, '2014-12-06 10:34:18'),
(5, 'Tuberculosis', 1, '2014-12-06 10:34:18'),
(6, 'HIV/AIDS', 1, '2014-12-06 10:35:23'),
(7, 'Ebola', 1, '2014-12-06 10:35:23'),
(8, 'influenza', 1, '2014-12-06 10:35:53');

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE IF NOT EXISTS `members` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(200) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(150) NOT NULL,
  `newsletter` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `last_name` varchar(200) NOT NULL,
  `address` varchar(200) NOT NULL,
  `city` varchar(200) NOT NULL,
  `about` text NOT NULL,
  `occupation` varchar(200) NOT NULL,
  `interest` varchar(300) NOT NULL,
  `skills` varchar(300) NOT NULL,
  `website` varchar(200) NOT NULL,
  `facebook` varchar(200) NOT NULL,
  `twitter` varchar(200) NOT NULL,
  `linkedin` varchar(200) NOT NULL,
  `google_plus` varchar(200) NOT NULL,
  `youtube` varchar(200) NOT NULL,
  `date_time_joined` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `last_login` datetime DEFAULT NULL,
  `last_login_ip` varchar(200) NOT NULL,
  `balance` int(11) DEFAULT '0',
  `alert_actions` tinyint(1) NOT NULL,
  `alert_add_funds` tinyint(1) NOT NULL,
  `alert_project` tinyint(1) NOT NULL,
  `alert_comments` tinyint(1) NOT NULL,
  `views` int(11) NOT NULL DEFAULT '0',
  `Country` varchar(120) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `email_2` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf16 AUTO_INCREMENT=27 ;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`id`, `first_name`, `email`, `password`, `newsletter`, `status`, `last_name`, `address`, `city`, `about`, `occupation`, `interest`, `skills`, `website`, `facebook`, `twitter`, `linkedin`, `google_plus`, `youtube`, `date_time_joined`, `last_login`, `last_login_ip`, `balance`, `alert_actions`, `alert_add_funds`, `alert_project`, `alert_comments`, `views`, `Country`) VALUES
(0, 'Anonymous', 'anonymous', 'c2827ebbbf06d518edf99d75f128adac', 0, 1, '', '', '', '', '', '', '', '', '', '', '', '', '', '2014-12-07 15:07:53', NULL, '', 0, 0, 0, 0, 0, 0, ''),
(2, 'Firas', 'dddd', '8f60c8102d29fcd525162d02eed4566b', 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '2014-12-06 11:54:33', NULL, '', 0, 0, 0, 0, 0, 0, ''),
(4, 'Ohood M.', 'x@p.p', 'e47ca7a09cf6781e29634502345930a7', 0, 0, '', '', '', '', '', '', '', '', 'hamdan.taima', '', '', '', '', '2014-12-06 12:19:38', NULL, '', 0, 0, 0, 0, 0, 0, ''),
(5, 'Eyad', 'p@p.p', 'e47ca7a09cf6781e29634502345930a7', 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '2014-12-06 12:12:14', NULL, '', 0, 0, 0, 0, 0, 0, ''),
(9, 'ohood', 't@p.p', 'e47ca7a09cf6781e29634502345930a7', 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '2014-12-06 12:21:17', NULL, '', 0, 0, 0, 0, 0, 0, ''),
(12, 'qqqqq', 'r@e.e', 'e1e75ca21f1cabe4f2dc94ef7551c8be', 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '2014-12-06 12:52:26', NULL, '', 0, 0, 0, 0, 0, 0, ''),
(13, 'qqqqq', 'r@m.e', 'e1e75ca21f1cabe4f2dc94ef7551c8be', 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '2014-12-06 12:53:36', NULL, '', 0, 0, 0, 0, 0, 0, ''),
(15, 'Tom', 'p@p.k', '01e5c1a600b6df2590ee6b6d023394ec', 1, 1, '', '', '', '', '', '', '', '', '', '', '', '', '', '2014-12-06 16:27:37', NULL, '', 0, 1, 0, 0, 0, 0, ''),
(16, 'Ø³ÙŠØ¨Ø³ÙŠØ¨', 'sdfsdsfsdf@kjsdlfs.com', '1f2af1a8c11f23028daf589ab6d0f729', 0, 1, '', '', '', '', '', '', '', '', '', '', '', '', '', '2014-12-06 18:11:41', NULL, '', 0, 0, 0, 0, 0, 0, ''),
(17, 'Hamdan', 'hamdan@hamdan.com', '202cb962ac59075b964b07152d234b70', 0, 1, 'Kamel', '', '', '', '', '', '', '', '', '', '', '', '', '2014-12-06 18:39:04', NULL, '', 0, 0, 0, 0, 0, 0, ''),
(18, 'eyad farra', 'eyad@farra.com', '4297f44b13955235245b2497399d7a93', 0, 1, '', '', '', '', '', '', '', '', '', '', '', '', '', '2014-12-06 18:43:18', NULL, '', 0, 0, 0, 0, 0, 0, ''),
(19, 'hamdan', 'h@h.com', 'd41d8cd98f00b204e9800998ecf8427e', 0, 1, '', '', '', '', '', '', '', '', '', '', '', '', '', '2014-12-06 19:01:19', NULL, '', 0, 0, 0, 0, 0, 0, ''),
(20, 'eyad farra', 'eyad.farra@exa.com.sa', 'c8837b23ff8aaa8a2dde915473ce0991', 0, 1, '', '', '', '', '', '', '', '', '', '', '', '', '', '2014-12-06 19:37:31', NULL, '', 0, 0, 0, 0, 0, 0, ''),
(21, 'eyad farra', 'eyadm.fa@gmail.com', '4297f44b13955235245b2497399d7a93', 0, 1, '', '', '', '', '', '', '', '', '', '', '', '', '', '2014-12-06 19:39:36', NULL, '', 0, 0, 0, 0, 0, 0, ''),
(24, 'hero', 'hero@hero.com', '202cb962ac59075b964b07152d234b70', 0, 1, '', '', '', '', '', '', '', '', '', '', '', '', '', '2014-12-07 17:50:26', NULL, '', 0, 0, 0, 0, 0, 0, ''),
(25, 'PalPHP Team', 'me@palphp.com', '202cb962ac59075b964b07152d234b70', 1, 1, '', '', '', '', '', '', '', '', '', '', '', '', '', '2014-12-07 17:57:22', NULL, '', 0, 1, 1, 1, 1, 0, ''),
(26, 'Feras Saqqa', 'me@feras.ps', '4168dae809b03a0038d705599e7bb05e', 0, 1, '', '', '', '', '', '', '', '', '', '', '', '', '', '2014-12-08 02:50:24', NULL, '', 0, 0, 0, 0, 0, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `members_campaigns`
--

CREATE TABLE IF NOT EXISTS `members_campaigns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `shortcut` varchar(20) NOT NULL,
  `summary` varchar(500) NOT NULL,
  `goal` float NOT NULL,
  `category` int(11) NOT NULL,
  `total_days` int(11) NOT NULL,
  `city` varchar(30) NOT NULL,
  `contact_mobile` varchar(30) NOT NULL,
  `date_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `description` longtext NOT NULL,
  `video` varchar(200) NOT NULL,
  `last_save` datetime DEFAULT NULL,
  `status` tinyint(1) NOT NULL COMMENT '0, waiting , 1 : publish ',
  `views` int(11) NOT NULL,
  `image` varchar(15) NOT NULL,
  `img1` varchar(15) NOT NULL,
  `img2` varchar(15) NOT NULL,
  `img3` varchar(15) NOT NULL,
  `img4` varchar(15) NOT NULL,
  `img5` varchar(15) NOT NULL,
  `country` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `category` (`category`),
  KEY `member` (`member`),
  KEY `member_2` (`member`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf16 AUTO_INCREMENT=58 ;

--
-- Dumping data for table `members_campaigns`
--

INSERT INTO `members_campaigns` (`id`, `member`, `title`, `shortcut`, `summary`, `goal`, `category`, `total_days`, `city`, `contact_mobile`, `date_time`, `description`, `video`, `last_save`, `status`, `views`, `image`, `img1`, `img2`, `img3`, `img4`, `img5`, `country`) VALUES
(5, 4, 'Help My 10 years old sun to live', 'sunlive', 'my little son is 10 years old , please help him to survive , we need your support to raise funds for his treatment', 55.4, 1, 5, 'Athin', '0597423133', '2014-12-06 15:57:21', 'my little son is 10 years old , please help him to survive , we need your support to raise funds for his treatment', 'http://www.youtube.com/watch?v=92-QkWpacB8', NULL, 1, 150, '3.jpg', '', '', '', '', '', 'Palestine'),
(8, 2, 'Help My 10 years old sun to live', 'sunlive', 'my little son is 10 years old , please help him to survive , we need your support to raise funds for his treatment', 250, 3, 5, 'Athin', '0597423133', '2014-12-06 15:57:21', 'my little son is 10 years old , please help him to survive , we need your support to raise funds for his treatment', 'http://www.youtube.com/watch?v=92-QkWpacB8', NULL, 1, 0, '1.jpg', '', '', '', '', '', ''),
(48, 19, '16 years old girl facing CANCER', '', '16 years old Girl from gaza facing death because of Cancer , the only hope for her to survive is to go on treatment.', 5000, 3, 12, 'GAZA', '', '2014-12-06 22:47:27', '16 years old Girl from gaza facing death because of Cancer , the only hope for her to survive is to go on treatment.', 'http://www.youtube.com/watch?v=92-QkWpacB8', NULL, 1, 50, '48.jpeg', '', '', '', '', '', ''),
(53, 25, 'WOMAN CANCER', '', '16 years old Girl from gaza facing death because of Cancer , the only hope for her to survive is to go on treatment.', 20000, 2, 15, 'Paris', '', '2014-12-07 10:39:32', '', '', NULL, 1, 0, '53.jpeg', '53-1.jpeg', '53-2.jpeg', '53-3.jpeg', '', '', 'france');

-- --------------------------------------------------------

--
-- Table structure for table `members_wallet`
--

CREATE TABLE IF NOT EXISTS `members_wallet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member` int(11) NOT NULL,
  `amount` float NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `details` varchar(400) NOT NULL,
  `campaign` int(11) NOT NULL,
  `date_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `transaction_key` varchar(90) NOT NULL,
  `custom` varchar(90) NOT NULL,
  `date_of_payment` datetime NOT NULL,
  `doner_name` varchar(150) DEFAULT NULL,
  `hide` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `member` (`member`),
  KEY `campaign` (`campaign`),
  KEY `custom` (`custom`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf16 AUTO_INCREMENT=23 ;

--
-- Dumping data for table `members_wallet`
--

INSERT INTO `members_wallet` (`id`, `member`, `amount`, `status`, `details`, `campaign`, `date_time`, `transaction_key`, `custom`, `date_of_payment`, `doner_name`, `hide`) VALUES
(1, 19, 11.5, 1, 'GO Healthy', 5, '2014-12-06 20:41:38', '', '', '0000-00-00 00:00:00', NULL, 0),
(2, 12, 150, 1, 'Good Luck', 5, '2014-12-06 20:41:52', '', '', '0000-00-00 00:00:00', NULL, 0),
(3, 15, 90, 1, 'Blessings', 5, '2014-12-06 20:41:52', '', '', '0000-00-00 00:00:00', NULL, 0),
(4, 19, 11.5, 1, 'A gift', 53, '2014-12-06 20:41:52', '', '', '0000-00-00 00:00:00', NULL, 0),
(5, 19, 3, 1, 'GO Healthy', 5, '2014-12-06 20:41:52', '', '', '0000-00-00 00:00:00', NULL, 0),
(6, 19, 30, 1, 'GO Healthy', 5, '2014-12-06 20:41:52', '', '', '0000-00-00 00:00:00', NULL, 0),
(7, 19, 11.5, 1, 'GO Healthy', 5, '2014-12-06 20:41:52', '', '', '0000-00-00 00:00:00', NULL, 0),
(12, 0, 50, 0, 'Good Luck', 5, '2014-12-07 15:20:36', '', '123123', '0000-00-00 00:00:00', NULL, 0),
(13, 0, 50, 0, 'I Hope that you get better!', 5, '2014-12-07 15:21:57', '', '123123', '0000-00-00 00:00:00', NULL, 0),
(14, 0, 123, 1, 'we hope your doing very well', 53, '2014-12-07 15:40:54', '', '141796679740', '2014-12-16 02:16:09', NULL, 0),
(15, 0, 123, 0, 'we hope your doing very well', 5, '2014-12-07 15:48:50', '', '141796727379', '0000-00-00 00:00:00', NULL, 0),
(16, 25, 123, 1, 'we hope your doing very well', 5, '2014-12-07 15:51:23', '2131232', '141796742466', '0000-00-00 00:00:00', NULL, 0),
(17, 25, 123, 0, 'we hope your doing very well', 5, '2014-12-07 19:30:43', '', '141798058638', '0000-00-00 00:00:00', NULL, 0),
(18, 25, 123, 0, 'we hope your doing very well', 5, '2014-12-07 20:00:21', '', '141798236436', '0000-00-00 00:00:00', 'Firas', 1),
(19, 25, 123, 0, 'we hope your doing very well', 5, '2014-12-07 20:00:36', '', '141798237941', '0000-00-00 00:00:00', 'Firas', 1),
(20, 25, 123, 0, 'we hope your doing very well', 5, '2014-12-07 20:00:39', '', '141798238237', '0000-00-00 00:00:00', 'Firas', 1),
(21, 25, 123, 0, 'we hope your doing very well', 5, '2014-12-07 20:00:41', '', '141798238458', '0000-00-00 00:00:00', 'Firas', 1),
(22, 25, 123, 0, 'we hope your doing very well', 5, '2014-12-07 20:00:42', '', '141798238591', '0000-00-00 00:00:00', 'Firas', 1);

-- --------------------------------------------------------

--
-- Table structure for table `member_withdraw`
--

CREATE TABLE IF NOT EXISTS `member_withdraw` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member` int(11) NOT NULL,
  `gateway` int(11) NOT NULL,
  `date_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `amount` float NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `member` (`member`),
  KEY `gateway` (`gateway`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf16 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `member_withdraw`
--

INSERT INTO `member_withdraw` (`id`, `member`, `gateway`, `date_time`, `amount`, `status`) VALUES
(1, 25, 1, '2014-12-07 18:57:40', 2500, 1);

-- --------------------------------------------------------

--
-- Table structure for table `payment_gateways`
--

CREATE TABLE IF NOT EXISTS `payment_gateways` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `descr` varchar(500) NOT NULL,
  `date_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf16 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `payment_gateways`
--

INSERT INTO `payment_gateways` (`id`, `name`, `descr`, `date_time`, `status`) VALUES
(1, 'PayPal', 'PayPal', '2014-12-07 18:57:21', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(100) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1',
  `email` varchar(200) DEFAULT NULL,
  `passrest` varchar(200) DEFAULT NULL,
  `firstname` varchar(250) DEFAULT NULL,
  `lastname` varchar(250) DEFAULT NULL,
  `username` varchar(200) DEFAULT NULL,
  `level` tinyint(4) DEFAULT '0',
  `date_added` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`userid`),
  KEY `email` (`email`),
  KEY `firstname` (`firstname`),
  KEY `username` (`username`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=91 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userid`, `password`, `status`, `email`, `passrest`, `firstname`, `lastname`, `username`, `level`, `date_added`) VALUES
(90, 'e570bd4aabcc9add3e92a1e432dd9247', 1, '', NULL, 'Hamdan', '', 'hamdan', 0, '2013-08-13 09:57:59');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `members_campaigns`
--
ALTER TABLE `members_campaigns`
  ADD CONSTRAINT `campaign_category` FOREIGN KEY (`category`) REFERENCES `categories` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `campaign_member` FOREIGN KEY (`member`) REFERENCES `members` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `members_wallet`
--
ALTER TABLE `members_wallet`
  ADD CONSTRAINT `member_campaign` FOREIGN KEY (`campaign`) REFERENCES `members_campaigns` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `member_wallet` FOREIGN KEY (`member`) REFERENCES `members` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `member_withdraw`
--
ALTER TABLE `member_withdraw`
  ADD CONSTRAINT `gateway_payment` FOREIGN KEY (`gateway`) REFERENCES `payment_gateways` (`id`) ON DELETE NO ACTION,
  ADD CONSTRAINT `member_withdraw` FOREIGN KEY (`member`) REFERENCES `members` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
