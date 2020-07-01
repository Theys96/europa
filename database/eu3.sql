-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 01, 2020 at 07:54 PM
-- Server version: 10.1.40-MariaDB
-- PHP Version: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `eu3`
--

-- --------------------------------------------------------

--
-- Table structure for table `maps`
--

CREATE TABLE `maps` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `title` text NOT NULL,
  `map` text NOT NULL,
  `mapFile` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `maps`
--

INSERT INTO `maps` (`id`, `name`, `title`, `map`, `mapFile`) VALUES
(1, 'europa', 'Europa', 'europe_mill_nl', 'europe');

-- --------------------------------------------------------

--
-- Table structure for table `players`
--

CREATE TABLE `players` (
  `id` int(11) NOT NULL,
  `map` int(11) NOT NULL,
  `playerId` int(11) NOT NULL,
  `color` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `players`
--

INSERT INTO `players` (`id`, `map`, `playerId`, `color`) VALUES
(1, 1, 1, '#C00'),
(2, 1, 0, 'grey'),
(3, 1, 3, '#0099CC'),
(4, 1, 4, '#FF9900'),
(5, 1, 5, '#F660AB'),
(6, 1, 6, '#446688'),
(7, 1, 7, '#33AA33'),
(8, 1, 8, '#800080');

-- --------------------------------------------------------

--
-- Table structure for table `regions`
--

CREATE TABLE `regions` (
  `id` int(11) NOT NULL,
  `map` int(11) NOT NULL,
  `code` text NOT NULL,
  `name` text NOT NULL,
  `worth` int(11) NOT NULL,
  `trade` decimal(10,0) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `regions`
--

INSERT INTO `regions` (`id`, `map`, `code`, `name`, `worth`, `trade`) VALUES
(1, 1, 'NL', 'Nederland', 5000, '10'),
(2, 1, 'BE', 'Belgi&euml;', 3000, '4'),
(3, 1, 'DE', 'Duitsland', 9000, '7'),
(4, 1, 'LU', 'Luxemburg', 1515, '2'),
(5, 1, 'FR', 'Frankrijk', 8750, '7'),
(6, 1, 'GB', 'Verenigd Koninkrijk', 7340, '3'),
(7, 1, 'RU', 'Rusland', 9755, '5'),
(8, 1, 'TR', 'Turkije', 6500, '3'),
(9, 1, 'EG', 'Egypte', 5250, '9'),
(10, 1, 'IS', 'IJsland', 2000, '1'),
(11, 1, 'ES', 'Spanje', 4000, '3'),
(12, 1, 'AD', 'Andorra', 0, '0'),
(13, 1, 'FO', 'Faroe Eilanden', 0, '0'),
(14, 1, 'IM', 'Mann', 0, '0'),
(15, 1, 'DK', 'Denemarken', 3000, '4'),
(16, 1, 'NO', 'Noorwegen', 4500, '3'),
(17, 1, 'SE', 'Zweden', 5500, '2'),
(18, 1, 'FI', 'Finland', 4150, '2'),
(19, 1, 'AX', 'Aland', 0, '0'),
(20, 1, 'MA', 'Marokko', 3500, '3'),
(21, 1, 'PT', 'Portugal', 2500, '2'),
(22, 1, 'IE', 'Ierland', 2000, '1'),
(23, 1, 'CH', 'Zwitserland', 3000, '3'),
(24, 1, 'AT', 'Oostenrijk', 2715, '3'),
(25, 1, 'LI', 'Liechtenstein', 0, '0'),
(26, 1, 'JE', 'Jersey', 0, '0'),
(27, 1, 'GG', 'Guernsey', 0, '0'),
(28, 1, 'MT', 'Malta', 0, '0'),
(29, 1, 'IT', 'Itali&euml;', 6000, '6'),
(30, 1, 'GR', 'Griekenland', 3250, '3'),
(31, 1, 'PL', 'Polen', 6000, '4'),
(32, 1, 'SA', 'Saudi Arabi&euml;', 5125, '3'),
(33, 1, 'CZ', 'Tsjechi&euml;', 3500, '2'),
(34, 1, 'GE', 'Georgi&euml;', 2000, '1'),
(35, 1, 'TN', 'Tunesi&euml;', 4000, '5'),
(36, 1, 'PS', 'Westelijk Jordaanoever', 1500, '1'),
(37, 1, 'IL', 'Isra&euml;l', 4000, '4'),
(38, 1, 'CY', 'Cyprus', 1650, '4'),
(39, 1, '_1', 'Noord Cyprus', 0, '0'),
(40, 1, 'SM', 'San Marino', 0, '0'),
(41, 1, 'SI', 'Sloveni&euml;', 500, '2'),
(42, 1, 'MD', 'Moldavi&euml;', 1450, '2'),
(43, 1, 'EE', 'Estland', 3000, '2'),
(44, 1, 'AL', 'Albani&euml;', 3200, '3'),
(45, 1, 'MK', 'Macedoni&euml;', 1000, '1'),
(46, 1, 'ME', 'Montenegro', 1000, '2'),
(47, 1, '_2', 'Kosovo', 500, '1'),
(48, 1, 'UA', 'Oekra&iuml;ne', 5000, '3'),
(49, 1, 'RS', 'Servi&euml;', 2560, '2'),
(50, 1, 'BA', 'Bosni&euml; en Herzegovina', 1000, '2'),
(51, 1, 'HR', 'Kroati&euml;', 2500, '3'),
(52, 1, 'BY', 'Wit-Rusland', 3100, '2'),
(53, 1, 'SK', 'Slowakije', 2055, '1'),
(54, 1, 'HU', 'Hongarije', 4000, '3'),
(55, 1, 'DZ', 'Algarije', 5000, '4'),
(56, 1, 'LY', 'Libi&euml;', 3510, '2'),
(57, 1, 'RO', 'Roemeni&euml;', 3850, '2'),
(58, 1, 'BG', 'Bulgarije', 3350, '2'),
(59, 1, 'LV', 'Letland', 2750, '2'),
(60, 1, 'SY', 'Syri&euml;', 3500, '2'),
(61, 1, 'LB', 'Libanon', 1985, '6'),
(62, 1, 'LT', 'Litouwen', 2500, '1'),
(63, 1, 'IQ', 'Irak', 4000, '3'),
(64, 1, 'JO', 'Jordani&euml;', 2985, '2'),
(65, 1, '_3', 'Westelijke Sahara', 0, '0');

-- --------------------------------------------------------

--
-- Table structure for table `region_neighbors`
--

CREATE TABLE `region_neighbors` (
  `id` int(11) NOT NULL,
  `region1` int(11) NOT NULL,
  `region2` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `region_neighbors`
--

INSERT INTO `region_neighbors` (`id`, `region1`, `region2`) VALUES
(1, 1, 6),
(2, 1, 2),
(3, 1, 3),
(4, 2, 3),
(5, 2, 4),
(6, 2, 5),
(7, 3, 15),
(8, 3, 31),
(9, 3, 33),
(10, 3, 24),
(11, 3, 23),
(12, 3, 5),
(13, 3, 4),
(14, 4, 5),
(15, 5, 29),
(16, 5, 23),
(17, 5, 11),
(18, 5, 6),
(19, 6, 16),
(20, 6, 22),
(21, 6, 10),
(22, 6, 11),
(23, 7, 16),
(24, 7, 18),
(25, 7, 43),
(26, 7, 59),
(27, 7, 62),
(28, 7, 31),
(29, 7, 52),
(30, 7, 48),
(31, 7, 8),
(32, 7, 34),
(34, 8, 58),
(35, 8, 30),
(36, 8, 38),
(37, 8, 60),
(38, 8, 34),
(39, 8, 63),
(40, 9, 37),
(41, 9, 56),
(42, 9, 32),
(43, 9, 38),
(44, 10, 16),
(45, 10, 22),
(46, 11, 55),
(47, 11, 20),
(48, 11, 21),
(49, 11, 22),
(50, 15, 16),
(51, 15, 17),
(52, 16, 17),
(53, 16, 18),
(54, 17, 18),
(55, 17, 31),
(56, 17, 59),
(57, 18, 43),
(58, 20, 55),
(59, 20, 21),
(60, 23, 24),
(61, 23, 29),
(62, 24, 33),
(63, 24, 53),
(64, 24, 54),
(65, 24, 41),
(66, 24, 29),
(67, 29, 41),
(68, 29, 51),
(69, 29, 44),
(70, 29, 30),
(71, 29, 56),
(72, 29, 35),
(73, 30, 44),
(74, 30, 45),
(75, 30, 58),
(76, 30, 56),
(77, 30, 38),
(78, 31, 62),
(79, 31, 52),
(80, 31, 48),
(81, 31, 53),
(82, 31, 33),
(83, 32, 64),
(84, 32, 63),
(85, 33, 53),
(86, 35, 56),
(87, 35, 55),
(88, 36, 37),
(89, 36, 64),
(90, 37, 61),
(91, 37, 60),
(92, 37, 64),
(93, 38, 61),
(94, 41, 51),
(95, 41, 54),
(96, 42, 48),
(97, 42, 57),
(98, 43, 59),
(99, 44, 46),
(100, 44, 47),
(101, 44, 45),
(102, 45, 47),
(103, 45, 49),
(104, 45, 58),
(105, 46, 50),
(106, 46, 49),
(107, 46, 47),
(108, 46, 51),
(109, 47, 49),
(110, 48, 52),
(111, 48, 57),
(112, 48, 54),
(113, 48, 53),
(114, 49, 54),
(115, 49, 57),
(116, 49, 58),
(117, 49, 50),
(118, 49, 51),
(119, 50, 51),
(120, 51, 54),
(121, 52, 62),
(122, 52, 59),
(123, 53, 54),
(124, 54, 57),
(125, 55, 56),
(126, 57, 58),
(127, 59, 62),
(128, 60, 63),
(129, 60, 64),
(130, 60, 61),
(131, 61, 64),
(132, 63, 64);

-- --------------------------------------------------------

--
-- Table structure for table `region_states`
--

CREATE TABLE `region_states` (
  `id` int(11) NOT NULL,
  `owner` int(11) NOT NULL DEFAULT '0',
  `army` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `region_states`
--

INSERT INTO `region_states` (`id`, `owner`, `army`) VALUES
(1, 3, 0),
(2, 1, 0),
(3, 1, 0),
(4, 1, 0),
(5, 4, 0),
(6, 3, 0),
(7, 4, 0),
(8, 4, 0),
(9, 3, 0),
(10, 1, 0),
(11, 3, 0),
(12, 0, 0),
(13, 0, 0),
(14, 0, 0),
(15, 5, 0),
(16, 1, 0),
(17, 1, 0),
(18, 1, 0),
(19, 0, 0),
(20, 3, 0),
(21, 3, 0),
(22, 3, 0),
(23, 1, 0),
(24, 1, 0),
(25, 0, 0),
(26, 0, 0),
(27, 0, 0),
(28, 0, 0),
(29, 4, 0),
(30, 6, 0),
(31, 1, 0),
(32, 4, 0),
(33, 1, 0),
(34, 4, 0),
(35, 7, 0),
(36, 3, 0),
(37, 3, 0),
(38, 3, 0),
(39, 0, 0),
(40, 0, 0),
(41, 4, 0),
(42, 1, 0),
(43, 1, 0),
(44, 4, 0),
(45, 4, 0),
(46, 4, 0),
(47, 4, 0),
(48, 1, 0),
(49, 4, 0),
(50, 4, 0),
(51, 4, 0),
(52, 1, 0),
(53, 1, 0),
(54, 1, 0),
(55, 3, 0),
(56, 3, 0),
(57, 1, 0),
(58, 4, 0),
(59, 4, 0),
(60, 4, 0),
(61, 4, 0),
(62, 8, 0),
(63, 4, 0),
(64, 3, 0),
(65, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `relations`
--

CREATE TABLE `relations` (
  `id` int(11) NOT NULL,
  `type` text NOT NULL,
  `player1` int(11) NOT NULL,
  `player2` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `relations`
--

INSERT INTO `relations` (`id`, `type`, `player1`, `player2`) VALUES
(1, 'ally', 1, 3),
(2, 'ally', 3, 1),
(3, 'trade', 1, 3),
(4, 'trade', 3, 1),
(5, 'trade', 1, 4),
(6, 'trade', 4, 1),
(7, 'ally', 4, 1),
(8, 'ally', 3, 4),
(9, 'ally', 4, 3);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `mail` text NOT NULL,
  `firstname` text NOT NULL,
  `lastname` text NOT NULL,
  `pic` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `mail`, `firstname`, `lastname`, `pic`) VALUES
(1, 'player1', '5d2bbc279b5ce75815849d5e3f0533ec', '', 'Player', '1', 'https://i.imgur.com/9ZNLN6l.jpg'),
(0, 'neutraal', '', '', 'Neutraal', '', ''),
(3, 'player3', '1aa3814dca32e4c0b79a2ca047ef1db0', '', 'Player', '3', ''),
(4, 'player4', '12efaba7fd50f5c66bd295683c0ce2a7', '', 'Player', '4', ''),
(5, 'player5', 'c5aec8b7110bb97bf59ab1a06805ebdd', '', 'Player', '5', ''),
(6, 'player6', '9d470eed6fd655c08563e806848cdc6d', '', 'Player', '6', ''),
(7, 'player7', '10b5d73053b6372f33e28589a0285f80', '', 'Player', '7', ''),
(8, 'player8', '0d4753a9802fe6af7d3bab0c91cb07f3', '', 'Player', '8', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `maps`
--
ALTER TABLE `maps`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `regions`
--
ALTER TABLE `regions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `region_neighbors`
--
ALTER TABLE `region_neighbors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `region_states`
--
ALTER TABLE `region_states`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `relations`
--
ALTER TABLE `relations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `maps`
--
ALTER TABLE `maps`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `players`
--
ALTER TABLE `players`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `regions`
--
ALTER TABLE `regions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `region_neighbors`
--
ALTER TABLE `region_neighbors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=133;

--
-- AUTO_INCREMENT for table `relations`
--
ALTER TABLE `relations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
