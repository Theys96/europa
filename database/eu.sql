-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 01, 2020 at 07:29 PM
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
-- Database: `eu`
--

-- --------------------------------------------------------

--
-- Table structure for table `log`
--

CREATE TABLE `log` (
  `id` int(11) NOT NULL,
  `user` text NOT NULL,
  `ip` text NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `meta` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `log`
--

INSERT INTO `log` (`id`, `user`, `ip`, `timestamp`, `meta`) VALUES
(1, 'player13', '94.212.255.239', '2020-07-01 17:25:07', 'map_europa - Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:77.0) Gecko/20100101 Firefox/77.0');

-- --------------------------------------------------------

--
-- Table structure for table `map_europa`
--

CREATE TABLE `map_europa` (
  `id` char(2) NOT NULL,
  `name` text NOT NULL,
  `neigh` text NOT NULL,
  `army` int(11) NOT NULL DEFAULT '0',
  `recruit` int(11) NOT NULL,
  `owner` text NOT NULL,
  `trade` decimal(11,1) NOT NULL DEFAULT '0.5',
  `worth` int(11) NOT NULL DEFAULT '500',
  `move` text NOT NULL,
  `attack` text NOT NULL,
  `army_new` int(11) NOT NULL DEFAULT '0',
  `pic` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `map_europa`
--

INSERT INTO `map_europa` (`id`, `name`, `neigh`, `army`, `recruit`, `owner`, `trade`, `worth`, `move`, `attack`, `army_new`, `pic`) VALUES
('NL', 'Nederland', 'GB,BE,DE', 0, 0, 'player20', '9.5', 5000, '', '', 0, ''),
('BE', 'Belgi&euml;', 'NL,DE,LU,FR', 12680, 0, 'player20', '4.0', 3000, '', '', 12680, ''),
('DE', 'Duitsland', 'DK,PL,CZ,AT,CH,FR,LU,BE,NL', 356, 0, 'player20', '7.0', 9000, '', '', 356, ''),
('LU', 'Luxemburg', 'DE,BE,FR', 10256, 0, 'player20', '2.0', 1515, '', '', 10256, ''),
('FR', 'Frankrijk', 'LU,DE,BE,IT,CH,ES,GB', 0, 0, 'player13', '6.5', 8750, '', '', 0, ''),
('GB', 'Verenigd Koninkrijk', 'NO,NL,FR,IE,IS,ES', 17889, 0, 'player20', '3.0', 7340, '', '', 17889, ''),
('RU', 'Rusland', 'NO,FI,EE,LV,LT,PL,BY,UA,TR,GE,RO', 274178, 0, 'player10', '4.5', 9755, '', '', 274178, ''),
('TR', 'Turkije', 'UA,BG,GR,CY,SY,RU,GE,IQ', 15000, 0, 'player10', '3.0', 6500, '', '', 15000, ''),
('EG', 'Egypte', 'IL,LY,SA,CY', 1400, 0, 'player13', '9.0', 5250, '', '', 1400, ''),
('IS', 'IJsland', 'GB,NO,IE', 939, 0, 'player20', '1.0', 2000, '', '', 939, ''),
('ES', 'Spanje', 'FR,DZ,MA,PT,GB,IE', 116794, 0, 'player13', '3.0', 4000, '', '', 116794, ''),
('AD', 'Andorra', '', 0, 0, 'neutral', '0.0', 0, '', '', 0, ''),
('FO', 'Faroe Eilanden', '', 0, 0, 'neutral', '0.0', 0, '', '', 0, ''),
('IM', 'Mann', '', 0, 0, 'neutral', '0.0', 0, '', '', 0, ''),
('DK', 'Denemarken', 'NO,SE,DE', 0, 0, 'player20', '4.0', 3000, '', '', 0, ''),
('NO', 'Noorwegen', 'IS,GB,DK,SE,FI,RU', 70000, 0, 'player20', '3.0', 4500, '', '', 70000, ''),
('SE', 'Zweden', 'NO,FI,PL,DK,LV', 50000, 0, 'player20', '2.0', 5500, '', '', 50000, ''),
('FI', 'Finland', 'SE,NO,RU,EE', 0, 0, 'player10', '2.0', 4150, '', '', 0, ''),
('AX', 'Aland', '', 0, 0, 'neutral', '0.0', 0, '', '', 0, ''),
('MA', 'Marokko', 'DZ,ES,PT', 0, 0, 'player13', '3.0', 3500, '', '', 0, ''),
('PT', 'Portugal', 'ES,MA', 0, 0, 'player13', '2.0', 2500, '', '', 0, ''),
('IE', 'Ierland', 'IS,GB,ES', 0, 0, 'player20', '1.0', 2000, '', '', 0, ''),
('CH', 'Zwitserland', 'DE,AT,IT,FR', 0, 0, 'player13', '3.0', 3000, '', '', 0, ''),
('AT', 'Oostenrijk', 'DE,CZ,SK,HU,SI,IT,CH', 300001, 0, 'player13', '3.0', 2715, '', '', 300001, ''),
('LI', 'Liechtenstein', '', 0, 0, 'neutral', '0.0', 0, '', '', 0, ''),
('JE', 'Jersey', '', 0, 0, 'neutral', '0.0', 0, '', '', 0, ''),
('GG', 'Guernsey', '', 0, 0, 'neutral', '0.0', 0, '', '', 0, ''),
('MT', 'Malta', '', 0, 0, 'neutral', '0.0', 0, '', '', 0, ''),
('IT', 'Itali&euml;', 'FR,CH,AT,SI,HR,AL,GR,LY,TN', 5975, 0, 'player13', '5.5', 6000, '', '', 5975, ''),
('GR', 'Griekenland', 'IT,AL,MK,BG,TR,LY,CY', 0, 0, 'player10', '3.0', 3250, '', '', 0, ''),
('PL', 'Polen', 'SE,RU,LT,BY,UA,SK,CZ,DE', 80815, 0, 'player20', '3.5', 6000, '', '', 80815, ''),
('SA', 'Saudi Arabi&euml;', 'EG,JO,IQ', 0, 0, 'player13', '3.0', 5125, '', '', 0, ''),
('CZ', 'Tsjechi&euml;', 'DE,PL,SK,AT', 50003, 0, 'player20', '1.5', 3500, '', '', 50003, ''),
('GE', 'Georgi&euml;', 'RU,TR', 0, 0, 'player10', '1.0', 2000, '', '', 0, ''),
('TN', 'Tunesi&euml;', 'IT,LY,DZ', 0, 0, 'player13', '4.5', 4000, '', '', 0, ''),
('PS', 'Westelijk Jordaanoever', 'IL,JO', 0, 0, 'player10', '1.0', 1500, '', '', 0, ''),
('IL', 'Isra&euml;l', 'EG,LB,SY,JO,PS', 200000, 0, 'neutral', '3.5', 4000, '', '', 200000, ''),
('CY', 'Cyprus', 'TR,EG,LB,GR', 1509, 0, 'player10', '3.5', 1650, '', '', 1509, ''),
('_1', 'Noord Cyprus', '', 0, 0, 'neutral', '0.0', 0, '', '', 0, ''),
('SM', 'San Marino', '', 0, 0, 'neutral', '0.0', 0, '', '', 0, ''),
('SI', 'Sloveni&euml;', 'IT,AT,HR,HU', 1000, 0, 'player13', '1.5', 500, '', '', 1000, ''),
('MD', 'Moldavi&euml;', 'UA,RO', 0, 0, 'player20', '1.5', 1450, '', '', 0, ''),
('EE', 'Estland', 'FI,RU,LV', 0, 0, 'player10', '2.0', 3000, '', '', 0, ''),
('AL', 'Albani&euml;', 'IT,ME,_2,MK,GR', 0, 0, 'player13', '2.5', 3200, '', '', 0, ''),
('MK', 'Macedoni&euml;', 'AL,_2,RS,BG,GR', 0, 0, 'player13', '1.0', 1000, '', '', 0, ''),
('ME', 'Montenegro', 'BA,RS,_2,AL,HR', 0, 0, 'player13', '2.0', 1000, '', '', 0, ''),
('_2', 'Kosovo', 'RS,MK,AL,ME', 0, 0, 'player13', '0.5', 500, '', '', 0, ''),
('UA', 'Oekra&iuml;ne', 'BY,RU,TR,MD,RO,HU,SK,PL', 80567, 0, 'player20', '2.5', 5000, '', '', 80567, ''),
('RS', 'Servi&euml;', 'HU,RO,BG,MK,_2,ME,BA,HR', 6000, 0, 'player10', '1.5', 2560, '', '', 6000, ''),
('BA', 'Bosni&euml; en Herzegovina', 'HR,RS,ME', 0, 0, 'player13', '1.5', 1000, '', '', 0, ''),
('HR', 'Kroati&euml;', 'SI,HU,RS,BA,IT,ME', 138000, 0, 'player13', '2.5', 2500, '', '', 138000, ''),
('BY', 'Wit-Rusland', 'RU,LT,PL,UA,LV', 18300, 0, 'player20', '1.5', 3100, '', '', 18300, ''),
('SK', 'Slowakije', 'AT,HU,PL,CZ,UA', 0, 0, 'player10', '1.0', 2055, '', '', 0, ''),
('HU', 'Hongarije', 'AT,SK,RO,HR,SI,RS,UA', 341413, 0, 'player10', '2.5', 4000, '', '', 341413, ''),
('DZ', 'Algarije', 'MA,ES,TN,LY', 9998, 0, 'player13', '3.5', 5000, '', '', 9998, ''),
('LY', 'Libi&euml;', 'DZ,TN,IT,GR,EG', 0, 0, 'player13', '2.0', 3510, '', '', 0, ''),
('RO', 'Roemeni&euml;', 'HU,BG,RS,MD,UA,RU', 7000, 0, 'player10', '2.0', 3850, '', '', 7000, ''),
('BG', 'Bulgarije', 'RO,RS,MK,GR,TR', 0, 0, 'player10', '2.0', 3350, '', '', 0, ''),
('LV', 'Letland', 'LT,EE,SE,BY,RU', 600, 0, 'player10', '2.0', 2750, '', '', 600, ''),
('SY', 'Syri&euml;', 'TR,IQ,JO,IL,LB', 0, 0, 'player10', '2.0', 3500, '', '', 0, ''),
('LB', 'Libanon', 'SY,JO,IL,CY', 0, 0, 'player10', '5.5', 1985, '', '', 0, ''),
('LT', 'Litouwen', 'LV,BY,RU,PL', 10300, 0, 'player20', '1.0', 2500, '', '', 10300, ''),
('IQ', 'Irak', 'SY,SA,JO,TR', 0, 0, 'player10', '3.0', 4000, '', '', 0, ''),
('JO', 'Jordani&euml;', 'IL,PS,SY,IQ,SA', 0, 0, 'player10', '1.5', 2985, '', '', 0, ''),
('_3', 'Westelijke Sahara', '', 0, 0, 'neutral', '0.0', 0, '', '', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `map_europa2`
--

CREATE TABLE `map_europa2` (
  `id` char(2) NOT NULL,
  `name` text NOT NULL,
  `neigh` text NOT NULL,
  `army` int(11) NOT NULL DEFAULT '0',
  `recruit` int(11) NOT NULL,
  `owner` text NOT NULL,
  `trade` decimal(11,1) NOT NULL DEFAULT '0.5',
  `worth` int(11) NOT NULL DEFAULT '500',
  `move` text NOT NULL,
  `attack` text NOT NULL,
  `army_new` int(11) NOT NULL DEFAULT '0',
  `def` text NOT NULL,
  `pic` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `map_europa2`
--

INSERT INTO `map_europa2` (`id`, `name`, `neigh`, `army`, `recruit`, `owner`, `trade`, `worth`, `move`, `attack`, `army_new`, `def`, `pic`) VALUES
('NL', 'Nederland', 'GB,BE,DE', 0, 0, 'player13', '9.5', 5000, '', '', 0, '', ''),
('BE', 'Belgi&euml;', 'NL,DE,LU,FR', 0, 0, 'player13', '4.0', 3000, '', '', 0, '', ''),
('DE', 'Duitsland', 'DK,PL,CZ,AT,CH,FR,LU,BE,NL', 7994, 0, 'player13', '7.0', 9000, '', '', 7994, '', ''),
('LU', 'Luxemburg', 'DE,BE,FR', 0, 0, 'player13', '2.0', 1515, '', '', 0, '', ''),
('FR', 'Frankrijk', 'LU,DE,BE,IT,CH,ES,GB', 10195, 0, 'player13', '6.5', 8750, '', '', 10195, '', ''),
('GB', 'Verenigd Koninkrijk', 'NO,NL,FR,IE,IS,ES', 1500, 0, 'player13', '3.0', 7340, '', '', 1500, '', ''),
('RU', 'Rusland', 'NO,FI,EE,LV,LT,PL,BY,UA,TR,GE,RO', 20856, 0, 'player2', '4.5', 9755, '', '', 20856, '', ''),
('TR', 'Turkije', 'UA,BG,GR,CY,SY,RU,GE,IQ', 0, 0, 'player2', '3.0', 6500, '', '', 0, '', ''),
('EG', 'Egypte', 'IL,LY,SA,CY', 0, 0, 'player13', '9.0', 5250, '', '', 0, '', ''),
('IS', 'IJsland', 'GB,NO,IE', 903, 0, 'player20', '1.0', 2000, '', '', 903, '', ''),
('ES', 'Spanje', 'FR,DZ,MA,PT,GB,IE', 4996, 0, 'player13', '3.0', 4000, '', '', 4996, '', ''),
('AD', 'Andorra', '', 0, 0, 'neutral', '0.0', 0, '', '', 0, '', ''),
('FO', 'Faroe Eilanden', '', 0, 0, 'neutral', '0.0', 0, '', '', 0, '', ''),
('IM', 'Mann', '', 0, 0, 'neutral', '0.0', 0, '', '', 0, '', ''),
('DK', 'Denemarken', 'NO,SE,DE', 0, 0, 'player20', '4.0', 3000, '', '', 0, '', ''),
('NO', 'Noorwegen', 'IS,GB,DK,SE,FI,RU', 30983, 0, 'player20', '3.0', 4500, '', '', 30983, '', ''),
('SE', 'Zweden', 'NO,FI,PL,DK,LV', 1000, 0, 'player20', '2.0', 5500, '', '', 1000, '', ''),
('FI', 'Finland', 'SE,NO,RU,EE', 30000, 0, 'player20', '2.0', 4150, '', '', 30000, '', ''),
('AX', 'Aland', '', 0, 0, 'neutral', '0.0', 0, '', '', 0, '', ''),
('MA', 'Marokko', 'DZ,ES,PT', 0, 0, 'player13', '3.0', 3500, '', '', 0, '', ''),
('PT', 'Portugal', 'ES,MA', 0, 0, 'player13', '2.0', 2500, '', '', 0, '', ''),
('IE', 'Ierland', 'IS,GB,ES', 9000, 0, 'player20', '1.0', 2000, '', '', 9000, '', ''),
('CH', 'Zwitserland', 'DE,AT,IT,FR', 1167, 0, 'player13', '3.0', 3000, '', '', 1167, '', ''),
('AT', 'Oostenrijk', 'DE,CZ,SK,HU,SI,IT,CH', 1271, 0, 'player13', '3.0', 2715, '', '', 1271, '', ''),
('LI', 'Liechtenstein', '', 0, 0, 'neutral', '0.0', 0, '', '', 0, '', ''),
('JE', 'Jersey', '', 0, 0, 'neutral', '0.0', 0, '', '', 0, '', ''),
('GG', 'Guernsey', '', 0, 0, 'neutral', '0.0', 0, '', '', 0, '', ''),
('MT', 'Malta', '', 0, 0, 'neutral', '0.0', 0, '', '', 0, '', ''),
('IT', 'Itali&euml;', 'FR,CH,AT,SI,HR,AL,GR,LY,TN', 607, 0, 'player13', '5.5', 6000, '', '', 607, '', ''),
('GR', 'Griekenland', 'IT,AL,MK,BG,TR,LY,CY', 0, 0, 'player13', '3.0', 3250, '', '', 0, '', ''),
('PL', 'Polen', 'SE,RU,LT,BY,UA,SK,CZ,DE', 21000, 0, 'player20', '3.5', 6000, '', '', 21000, '', ''),
('SA', 'Saudi Arabi&euml;', 'EG,JO,IQ', 261267, 0, 'player2', '3.0', 5125, '', '', 261267, '', ''),
('CZ', 'Tsjechi&euml;', 'DE,PL,SK,AT', 0, 0, 'player20', '1.5', 3500, '', '', 0, '', ''),
('GE', 'Georgi&euml;', 'RU,TR', 0, 0, 'player2', '1.0', 2000, '', '', 0, '', ''),
('TN', 'Tunesi&euml;', 'IT,LY,DZ', 0, 0, 'player13', '4.5', 4000, '', '', 0, '', ''),
('PS', 'Westelijk Jordaanoever', 'IL,JO', 0, 0, 'player2', '1.0', 1500, '', '', 0, '', ''),
('IL', 'Isra&euml;l', 'EG,LB,SY,JO,PS', 200000, 0, 'neutral', '3.5', 4000, '', '', 200000, '', ''),
('CY', 'Cyprus', 'TR,EG,LB,GR', 50000, 0, 'player2', '3.5', 1650, '', '', 50000, '', ''),
('_1', 'Noord Cyprus', '', 0, 0, 'neutral', '0.0', 0, '', '', 0, '', ''),
('SM', 'San Marino', '', 0, 0, 'neutral', '0.0', 0, '', '', 0, '', ''),
('SI', 'Sloveni&euml;', 'IT,AT,HR,HU', 0, 0, 'player20', '1.5', 500, '', '', 0, '', ''),
('MD', 'Moldavi&euml;', 'UA,RO', 50, 0, 'player2', '1.5', 1450, '', '', 50, '', ''),
('EE', 'Estland', 'FI,RU,LV', 20133, 0, 'player20', '2.0', 3000, '', '', 20133, '', ''),
('AL', 'Albani&euml;', 'IT,ME,_2,MK,GR', 0, 0, 'player13', '2.5', 3200, '', '', 0, '', ''),
('MK', 'Macedoni&euml;', 'AL,_2,RS,BG,GR', 0, 0, 'player20', '1.0', 1000, '', '', 0, '', ''),
('ME', 'Montenegro', 'BA,RS,_2,AL,HR', 0, 0, 'player20', '2.0', 1000, '', '', 0, '', ''),
('_2', 'Kosovo', 'RS,MK,AL,ME', 0, 0, 'player20', '0.5', 500, '', '', 0, '', ''),
('UA', 'Oekra&iuml;ne', 'BY,RU,TR,MD,RO,HU,SK,PL', 2343, 0, 'player2', '2.5', 5000, '', '', 2343, '', ''),
('RS', 'Servi&euml;', 'HU,RO,BG,MK,_2,ME,BA,HR', 4996, 0, 'player20', '1.5', 2560, '', '', 4996, '', ''),
('BA', 'Bosni&euml; en Herzegovina', 'HR,RS,ME', 0, 0, 'player20', '1.5', 1000, '', '', 0, '', ''),
('HR', 'Kroati&euml;', 'SI,HU,RS,BA,IT,ME', 50061, 0, 'player20', '2.5', 2500, '', '', 50061, '', ''),
('BY', 'Wit-Rusland', 'RU,LT,PL,UA,LV', 0, 0, 'player2', '1.5', 3100, '', '', 0, '', ''),
('SK', 'Slowakije', 'AT,HU,PL,CZ,UA', 30999, 0, 'player20', '1.0', 2055, '', '', 30999, '', ''),
('HU', 'Hongarije', 'AT,SK,RO,HR,SI,RS,UA', 69000, 0, 'player20', '2.5', 4000, '', '', 69000, '', ''),
('DZ', 'Algarije', 'MA,ES,TN,LY', 0, 0, 'player13', '3.5', 5000, '', '', 0, '', ''),
('LY', 'Libi&euml;', 'DZ,TN,IT,GR,EG', 443799, 0, 'player13', '2.0', 3510, '', '', 443799, '', ''),
('RO', 'Roemeni&euml;', 'HU,BG,RS,MD,UA,RU', 58946, 0, 'player20', '2.0', 3850, '', '', 58946, '', ''),
('BG', 'Bulgarije', 'RO,RS,MK,GR,TR', 141957, 0, 'player20', '2.0', 3350, '', '', 141957, '', ''),
('LV', 'Letland', 'LT,EE,SE,BY,RU', 20100, 0, 'player20', '2.0', 2750, '', '', 20100, '', ''),
('SY', 'Syri&euml;', 'TR,IQ,JO,IL,LB', 0, 0, 'player2', '2.0', 3500, '', '', 0, '', ''),
('LB', 'Libanon', 'SY,JO,IL,CY', 0, 0, 'player2', '5.5', 1985, '', '', 0, '', ''),
('LT', 'Litouwen', 'LV,BY,RU,PL', 5120, 0, 'player20', '1.0', 2500, '', '', 5120, '', ''),
('IQ', 'Irak', 'SY,SA,JO,TR', 0, 0, 'player2', '3.0', 4000, '', '', 0, '', ''),
('JO', 'Jordani&euml;', 'IL,PS,SY,IQ,SA', 0, 0, 'player2', '1.5', 2985, '', '', 0, '', ''),
('_3', 'Westelijke Sahara', '', 0, 0, 'neutral', '0.0', 0, '', '', 0, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `map_groningen`
--

CREATE TABLE `map_groningen` (
  `id` char(4) NOT NULL,
  `name` text NOT NULL,
  `neigh` text NOT NULL,
  `army` int(11) NOT NULL DEFAULT '0',
  `recruit` int(11) NOT NULL,
  `owner` text NOT NULL,
  `trade` decimal(11,1) NOT NULL DEFAULT '0.5',
  `worth` int(11) NOT NULL DEFAULT '500',
  `move` text NOT NULL,
  `attack` text NOT NULL,
  `army_new` int(11) NOT NULL DEFAULT '0',
  `pic` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `map_groningen`
--

INSERT INTO `map_groningen` (`id`, `name`, `neigh`, `army`, `recruit`, `owner`, `trade`, `worth`, `move`, `attack`, `army_new`, `pic`) VALUES
('GR00', 'Binnenstad', 'GR01,GR02,GR03,GR04,GR05,GR06,GR07', 2326, 0, 'player13', '3.0', 920, '', '', 2326, ''),
('GR01', 'Schilders- en Zeeheldenwijk', 'GR00,GR02,GR07,GR08', 0, 0, 'player13', '1.0', 870, '', '', 0, ''),
('GR02', 'Oranjewijk', 'GR00,GR01,GR03,GR08,GR09', 2258, 0, 'player13', '1.0', 1000, '', '', 2258, ''),
('GR03', 'Korrewegwijk', 'GR00,GR02,GR04,GR09', 0, 0, 'player10', '1.5', 950, '', '', 0, ''),
('GR04', 'Oosterparkwijk', 'GR00,GR03,GR05,GR09', 3367, 0, 'player20', '1.0', 550, '', '', 3367, ''),
('GR05', 'Oosterpoortwijk', 'GR00,GR04,GR06,GR09', 0, 0, 'player20', '2.0', 1390, '', '', 0, ''),
('GR06', 'Herewegwijk en Helpman', 'GR00,GR05,GR07', 100, 0, 'player13', '1.0', 1050, '', '', 100, ''),
('GR07', 'Stadsparkwijk', 'GR00,GR01,GR06,GR08', 4070, 4000, 'player22', '1.0', 910, '', '', 8070, ''),
('GR08', 'Hoogkerk', 'GR01,GR02,GR07', 0, 0, 'player13', '0.5', 1100, '', '', 0, ''),
('GR09', 'Noorddijk', 'GR02,GR03,GR04,GR05', 1206, 0, 'player13', '1.0', 1000, '', '', 1206, '');

-- --------------------------------------------------------

--
-- Table structure for table `map_nederland`
--

CREATE TABLE `map_nederland` (
  `id` char(5) NOT NULL,
  `name` text NOT NULL,
  `neigh` text NOT NULL,
  `army` int(11) NOT NULL DEFAULT '0',
  `recruit` int(11) NOT NULL,
  `owner` text NOT NULL,
  `trade` decimal(11,1) NOT NULL DEFAULT '0.5',
  `worth` int(11) NOT NULL DEFAULT '500',
  `move` text NOT NULL,
  `attack` text NOT NULL,
  `army_new` int(11) NOT NULL DEFAULT '0',
  `pic` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `map_nederland`
--

INSERT INTO `map_nederland` (`id`, `name`, `neigh`, `army`, `recruit`, `owner`, `trade`, `worth`, `move`, `attack`, `army_new`, `pic`) VALUES
('G1651', 'Eemsmond', 'G0088,G1663,G0053,G0005,G0024,G0010', 0, 0, 'player13', '10.5', 880, '', '', 0, ''),
('G0088', 'Schiermonnikoog', 'G1651,G0058,G1663', 0, 0, 'player13', '1.5', 122, '', '', 0, ''),
('G0060', 'Ameland', 'G0058,G0093,G1722,G0063', 0, 0, 'player20', '2.0', 304, '', '', 0, ''),
('G0058', 'Dongeradeel', 'G0088,G0060,G1722,G1891,G0079,G1663', 0, 0, 'player13', '2.0', 1172, '', '', 0, ''),
('G0093', 'Terschelling', 'G0060,G0096,G0063,G0070,G0072', 0, 0, 'player20', '2.5', 377, '', '', 0, ''),
('G0010', 'Delfzijl', 'G1651,G0024,G0003,G0040,G1895', 0, 0, 'player13', '8.0', 1232, '', '', 0, ''),
('G1663', 'De Marne', 'G1651,G0088,G0058,G0079,G0056,G0053', 0, 0, 'player13', '4.5', 646, '', '', 0, ''),
('G0053', 'Winsum', 'G0014,G0005,G1651,G1663,G0056', 0, 0, 'player13', '2.0', 795, '', '', 0, ''),
('G0024', 'Loppersum', 'G0005,G0009,G0040,G0003,G0010,G1651', 0, 0, 'player13', '5.0', 644, '', '', 0, ''),
('G0063', 'het Bildt', 'G0058,G0081,G1908,G0070,G0093,G0060', 0, 0, 'player20', '1.0', 659, '', '', 0, ''),
('G0003', 'Appingedam', 'G0010,G0024,G0040', 0, 0, 'player13', '3.0', 719, '', '', 0, ''),
('G0005', 'Bedum', 'G0053,G0014,G0009,G0024,G1651', 0, 0, 'player13', '4.5', 655, '', '', 0, ''),
('G1895', 'Oldambt', 'G0010,G0040,G1987,G0047,G0765,G0007', 0, 0, 'player13', '0.5', 1628, '', '', 0, ''),
('G0056', 'Zuidhorn', 'G0014,G0053,G1663,G0079,G0059,G0015,G0022', 0, 0, 'player13', '2.0', 978, '', '', 0, ''),
('G1891', 'Dantumadiel', 'G0058,G1722,G0737,G0059,G0079', 0, 0, 'player20', '1.0', 994, '', '', 0, ''),
('G0096', 'Vlieland', 'G0448,G0093,G0072', 0, 0, 'player20', '2.0', 136, '', '', 0, ''),
('G0009', 'Ten Boer', 'G0005,G0014,G0040,G0024', 0, 0, 'player13', '4.5', 516, '', '', 0, ''),
('G0040', 'Slochteren', 'G0014,G0018,G1987,G1895,G0010,G0003,G0024,G0009', 0, 0, 'player13', '5.5', 862, '', '', 0, ''),
('G0081', 'Leeuwarderadeel', 'G1722,G0063,G1908,G0080,G0737', 0, 0, 'player20', '1.0', 645, '', '', 0, ''),
('G0737', 'Tytsjerksteradiel', 'G1891,G1722,G0081,G0080,G0090,G0059', 0, 0, 'player20', '5.5', 1424, '', '', 0, ''),
('G0059', 'Achtkarspelen', 'G0015,G0056,G0079,G1891,G0737,G0090', 0, 0, 'player13', '1.5', 1301, '', '', 0, ''),
('G0014', 'Groningen', 'G0005,G0053,G0056,G0022,G1699,G1730,G0017,G0018,G0040,G0009', 0, 0, 'player13', '5.0', 5054, '', '', 0, ''),
('G0070', 'Franekeradeel', 'G0072,G0093,G0063,G1908,G0140,G1900', 0, 0, 'player20', '2.0', 1042, '', '', 0, ''),
('G0015', 'Grootegast', 'G0056,G0079,G0059,G0090,G0025,G0022', 0, 0, 'player13', '1.5', 726, '', '', 0, ''),
('G1908', 'Menameradiel', 'G0081,G0063,G0070,G0140,G0080', 0, 0, 'player20', '1.0', 788, '', '', 0, ''),
('G0072', 'Harlingen', 'G0096,G0448,G0070,G1900,G1911', 0, 0, 'player20', '6.5', 871, '', '', 0, ''),
('G1987', 'Menterwolde', 'G1895,G0040,G0018,G0047', 0, 0, 'player13', '1.5', 732, '', '', 0, ''),
('G0022', 'Leek', 'G0086,G1699,G0014,G0056,G0015,G0025', 0, 0, 'player13', '2.0', 1011, '', '', 0, ''),
('G0448', 'Texel', 'G0096,G0072,G0400,G1911', 0, 0, 'player20', '3.0', 785, '', '', 0, ''),
('G1699', 'Noordenveld', 'G0014,G0022,G0086,G0085,G1731,G0106,G1730', 0, 0, 'player13', '2.5', 1394, '', '', 0, ''),
('G0018', 'Hoogezand-Sappemeer', 'G0014,G0017,G1730,G1680,G0047,G1987,G0040', 0, 0, 'player13', '3.0', 1502, '', '', 0, ''),
('G0025', 'Marum', 'G0015,G0090,G0086,G0022', 0, 0, 'player13', '1.0', 648, '', '', 0, ''),
('G1730', 'Tynaarlo', 'G0014,G1699,G0106,G1680,G0018,G0017', 0, 0, 'player13', '1.5', 1438, '', '', 0, ''),
('G0017', 'Haren', 'G0014,G0018,G1730', 0, 0, 'player13', '2.0', 976, '', '', 0, ''),
('G0140', 'Littenseradiel', 'G1908,G0070,G1900,G0080', 0, 0, 'player20', '1.5', 672, '', '', 0, ''),
('G0007', 'Bellingwedde', 'G1895,G0765,G0037,G0048', 0, 0, 'player13', '2.0', 585, '', '', 0, ''),
('G0090', 'Smallingerland', 'G0025,G0015,G0059,G0737,G0080,G0074,G0086', 0, 0, 'player20', '3.0', 2093, '', '', 0, ''),
('G0047', 'Veendam', 'G1987,G0018,G1680,G0037,G0765,G1895', 0, 0, 'player13', '2.5', 1294, '', '', 0, ''),
('G0086', 'Opsterland', 'G0090,G0074,G0085,G1699,G0022,G0025', 0, 0, 'player20', '1.5', 1358, '', '', 0, ''),
('G0765', 'Pekela', 'G1895,G0047,G0037,G0007', 0, 0, 'player13', '0.5', 750, '', '', 0, ''),
('G1680', 'Aa en Hunze', 'G0018,G1730,G0106,G1731,G0109,G1681,G0037,G0047', 0, 0, 'player13', '1.5', 1216, '', '', 0, ''),
('G0037', 'Stadskanaal', 'G0007,G0765,G0047,G1680,G1681,G0048', 0, 0, 'player13', '2.0', 1452, '', '', 0, ''),
('G0085', 'Ooststellingwerf', 'G1699,G0086,G0074,G0098,G1701,G1731', 0, 0, 'player20', '1.0', 1226, '', '', 0, ''),
('G0048', 'Vlagtwedde', 'G0007,G0037,G1681,G0114', 0, 0, 'player13', '2.5', 882, '', '', 0, ''),
('G0106', 'Assen', 'G1730,G1699,G1731,G1680', 0, 0, 'player13', '3.0', 2394, '', '', 0, ''),
('G0400', 'Den Helder', 'G0448,G0441,G1911', 0, 0, 'player20', '7.0', 2132, '', '', 0, ''),
('G1731', 'Midden-Drenthe', 'G0106,G1699,G0085,G1701,G0118,G0109,G1680', 0, 0, 'player13', '1.5', 1468, '', '', 0, ''),
('G1681', 'Borger-Odoorn', 'G1680,G0109,G0114,G0048,G0037', 0, 0, 'player13', '1.0', 1220, '', '', 0, ''),
('G0098', 'Weststellingwerf', 'G0085,G0074,G1921,G1708,G1701', 0, 0, 'player9', '1.0', 1218, '', '', 0, ''),
('G1701', 'Westerveld', 'G0085,G0098,G1708,G0119,G1690,G0118,G1731', 0, 0, 'player13', '1.5', 992, '', '', 0, ''),
('G0420', 'Medemblik', 'G1911,G0432,G1598,G0405,G0498,G0532,G0388,G1900', 0, 0, 'player20', '2.5', 1759, '', '', 0, ''),
('G0109', 'Coevorden', 'G0114,G1681,G1680,G1731,G0118,G0160', 0, 0, 'player13', '2.0', 1540, '', '', 0, ''),
('G0114', 'Emmen', 'G0048,G1681,G0109', 0, 0, 'player13', '5.5', 3346, '', '', 0, ''),
('G1708', 'Steenwijkerland', 'G0098,G1921,G0171,G1896,G0180,G0119,G1701', 0, 0, 'player9', '2.0', 1764, '', '', 0, ''),
('G0171', 'Noordoostpolder', 'G1708,G1921,G0388,G0184,G0303,G0166,G1896', 0, 0, 'player9', '1.5', 1844, '', '', 0, ''),
('G0388', 'Enkhuizen', 'G1900,G0420,G0532,G0995,G0184,G0171,G1921', 0, 0, 'player20', '6.5', 964, '', '', 0, ''),
('G0118', 'Hoogeveen', 'G1731,G1701,G1690,G0160,G0109', 0, 0, 'player13', '2.5', 2078, '', '', 0, ''),
('G1690', 'De Wolden', 'G0118,G1701,G0119,G0180,G0160', 0, 0, 'player13', '1.0', 1156, '', '', 0, ''),
('G0119', 'Meppel', 'G1690,G1701,G1708,G0180', 0, 0, 'player13', '2.5', 1447, '', '', 0, ''),
('G0184', 'Urk', 'G0171,G1921,G0388,G0995,G0303', 0, 0, 'player9', '6.5', 997, '', '', 0, ''),
('G0432', 'Opmeer', 'G1911,G0398,G1598,G0420', 0, 0, 'player20', '1.0', 691, '', '', 0, ''),
('G0416', 'Langedijk', 'G0441,G0373,G0361,G0398', 0, 0, 'player20', '1.5', 1261, '', '', 0, ''),
('G0398', 'Heerhugowaard', 'G1911,G0441,G0416,G0361,G0458,G1598,G0432', 0, 0, 'player20', '1.5', 2025, '', '', 0, ''),
('G0532', 'Stede Broec', 'G0995,G0388,G0420,G0498', 0, 0, 'player20', '1.5', 1076, '', '', 0, ''),
('G0498', 'Drechterland', 'G0995,G0532,G0420,G0405', 0, 0, 'player20', '1.5', 1000, '', '', 0, ''),
('G1598', 'Koggenland', 'G0405,G0420,G0432,G0398,G0458,G0370,G0478', 0, 0, 'player20', '2.0', 1109, '', '', 0, ''),
('G0180', 'Staphorst', 'G1690,G0119,G1708,G1896,G0193,G0148,G0160', 0, 0, 'player9', '0.5', 887, '', '', 0, ''),
('G0995', 'Lelystad', 'G0303,G0050,G0034,G0405,G0498,G0532,G0388,G0184', 0, 0, 'player8', '4.5', 2604, '', '', 0, ''),
('G0405', 'Hoorn', 'G0498,G0420,G1598,G0478,G0034,G0995', 0, 0, 'player8', '4.0', 2497, '', '', 0, ''),
('G0361', 'Alkmaar', 'G0398,G0416,G0373,G0399,G0383,G0458', 0, 0, 'player20', '3.0', 3040, '', '', 0, ''),
('G0160', 'Hardenberg', 'G0109,G0118,G1690,G0180,G0148,G0175,G1700', 0, 0, 'player9', '3.5', 2201, '', '', 0, ''),
('G1896', 'Zwartewaterland', 'G1708,G0171,G0166,G0193,G0180', 0, 0, 'player9', '2.0', 1101, '', '', 0, ''),
('G0303', 'Dronten', 'G0171,G0184,G0995,G0050,G0243,G0302,G0230,G0269,G0166', 100000, 0, 'player8', '2.5', 1685, '', '', 100000, ''),
('G0458', 'Schermer', 'G1598,G0398,G0361,G0383,G0365,G0370', 0, 0, 'player20', '1.5', 415, '', '', 0, ''),
('G0166', 'Kampen', 'G0171,G0303,G0269,G0244,G0193,G1896', 0, 0, 'player9', '4.0', 1972, '', '', 0, ''),
('G0399', 'Heiloo', 'G0361,G0373,G0383', 0, 0, 'player20', '1.5', 1116, '', '', 0, ''),
('G0370', 'Beemster', 'G1598,G0458,G0365,G0880,G0439,G0478', 0, 0, 'player20', '1.0', 576, '', '', 0, ''),
('G0478', 'Zeevang', 'G0034,G0405,G1598,G0370,G0439,G0385', 0, 0, 'player8', '3.5', 457, '', '', 0, ''),
('G0148', 'Dalfsen', 'G0160,G0180,G0193,G0177,G0175', 0, 0, 'player9', '1.5', 1283, '', '', 0, ''),
('G0175', 'Ommen', 'G0160,G0148,G0177,G0163,G1700', 0, 0, 'player9', '2.0', 927, '', '', 0, ''),
('G0383', 'Castricum', 'G0373,G0399,G0361,G0458,G0356,G0450,G0396', 0, 0, 'player20', '2.0', 1498, '', '', 0, ''),
('G0193', 'Zwolle', 'G0180,G1896,G0166,G0244,G0246,G1773,G0177,G0148', 0, 0, 'player9', '4.5', 3646, '', '', 0, ''),
('G0034', 'Almere', 'G0050,G0995,G0405,G0478,G0385,G0852,G0363,G0424,G0425,G0406,G0376', 169995, 0, 'player8', '5.5', 5051, '', '', 169995, ''),
('G0365', 'Graft-De Rijp', 'G0458,G0383,G0450,G0479,G0880,G0370', 0, 0, 'player20', '1.0', 463, '', '', 0, ''),
('G0450', 'Uitgeest', 'G0365,G0383,G0396,G0479', 0, 0, 'player2', '1.5', 761, '', '', 0, ''),
('G0385', 'Edam-Volendam', 'G0034,G0478,G0439,G0852', 0, 0, 'player8', '6.0', 1322, '', '', 0, ''),
('G0880', 'Wormerland', 'G0370,G0365,G0479,G0431,G0415,G0439', 0, 0, 'player2', '1.5', 867, '', '', 0, ''),
('G0396', 'Heemskerk', 'G0383,G0375,G0479,G0450', 0, 0, 'player2', '2.0', 1639, '', '', 0, ''),
('G0439', 'Purmerend', 'G0478,G0370,G0880,G0415,G0852,G0385', 0, 0, 'player2', '3.5', 2693, '', '', 0, ''),
('G0269', 'Oldebroek', 'G0166,G0303,G0230,G0232,G0246,G0244', 0, 0, 'player8', '1.5', 1123, '', '', 0, ''),
('G0479', 'Zaanstad', 'G0880,G0365,G0450,G0396,G0375,G0453,G0393,G0363,G0431', 0, 0, 'player2', '4.0', 4193, '', '', 0, ''),
('G0244', 'Hattem', 'G0193,G0166,G0269,G0246', 0, 0, 'player8', '1.0', 707, '', '', 0, ''),
('G0375', 'Beverwijk', 'G0396,G0479,G0453', 0, 0, 'player2', '2.0', 1667, '', '', 0, ''),
('G1700', 'Twenterand', 'G0160,G0175,G0163,G0189,G0141,G0183', 0, 0, 'player9', '1.5', 1485, '', '', 0, ''),
('G0852', 'Waterland', 'G0424,G0034,G0385,G0439,G0415,G0363', 0, 0, 'player8', '3.0', 918, '', '', 0, ''),
('G0453', 'Velsen', 'G0375,G0479,G0393,G0392,G0377', 0, 0, 'player2', '4.5', 2392, '', '', 0, ''),
('G0415', 'Landsmeer', 'G0439,G0880,G0431,G0363,G0852', 0, 0, 'player2', '1.5', 651, '', '', 0, ''),
('G0183', 'Tubbergen', 'G1700,G0141,G0147,G1774', 0, 0, 'player9', '3.0', 1067, '', '', 0, ''),
('G0431', 'Oostzaan', 'G0880,G0479,G0363,G0415', 0, 0, 'player2', '1.0', 593, '', '', 0, ''),
('G1774', 'Dinkelland', 'G0183,G0147,G0164,G0153,G0173,G0168', 0, 0, 'player9', '3.5', 1233, '', '', 0, ''),
('G0177', 'Raalte', 'G0148,G0193,G1773,G0150,G1742,G0163,G0175', 0, 0, 'player9', '1.5', 1561, '', '', 0, ''),
('G0230', 'Elburg', 'G0269,G0303,G0302,G0232', 0, 0, 'player8', '2.0', 1113, '', '', 0, ''),
('G0163', 'Hellendoorn', 'G1700,G0175,G0177,G1742,G0189', 0, 0, 'player9', '2.5', 1539, '', '', 0, ''),
('G0246', 'Heerde', 'G0193,G0244,G0269,G0232,G1773', 0, 0, 'player8', '1.5', 967, '', '', 0, ''),
('G1773', 'Olst-Wijhe', 'G0193,G0246,G0232,G0285,G0150,G0177', 0, 0, 'player9', '3.0', 943, '', '', 0, ''),
('G0050', 'Zeewolde', 'G0303,G0995,G0034,G0376,G0317,G0313,G0267,G0273,G0233,G0243', 0, 0, 'player8', '3.0', 1070, '', '', 0, ''),
('G0377', 'Bloemendaal', 'G0453,G0392,G0397,G0394,G0534,G0576,G0473', 0, 0, 'player2', '2.5', 1103, '', '', 0, ''),
('G0392', 'Haarlem', 'G0453,G0377,G0397,G0394,G0393', 0, 0, 'player2', '4.0', 4261, '', '', 0, ''),
('G0189', 'Wierden', 'G1700,G0163,G1742,G1735,G0141', 0, 0, 'player9', '1.5', 1158, '', '', 0, ''),
('G0473', 'Zandvoort', 'G0377,G0576,G0575', 0, 0, 'player2', '2.0', 899, '', '', 0, ''),
('G0302', 'Nunspeet', 'G0230,G0303,G0243,G0233,G0200,G0232', 0, 0, 'player8', '2.5', 1252, '', '', 0, ''),
('G0141', 'Almelo', 'G0183,G1700,G0189,G1735,G0147', 0, 0, 'player9', '4.0', 2530, '', '', 0, ''),
('G0232', 'Epe', 'G0269,G0230,G0302,G0200,G0285,G1773,G0246', 0, 0, 'player8', '3.5', 1436, '', '', 0, ''),
('G0168', 'Losser', 'G1774,G0173,G0153', 0, 0, 'player9', '2.5', 1115, '', '', 0, ''),
('G0424', 'Muiden', 'G0034,G0852,G0363,G0384,G0457,G0425', 0, 0, 'player8', '3.0', 461, '', '', 0, ''),
('G0394', 'Haarlemmermeer', 'G0363,G0393,G0392,G0397,G0377,G0534,G0553,G1525,G1884,G0358,G0362', 0, 0, 'player2', '11.0', 4085, '', '', 0, ''),
('G0243', 'Harderwijk', 'G0303,G0050,G0233,G0302', 0, 0, 'player8', '5.5', 1826, '', '', 0, ''),
('G0397', 'Heemstede', 'G0392,G0377,G0394', 0, 0, 'player2', '1.5', 1242, '', '', 0, ''),
('G0384', 'Diemen', 'G0363,G0437,G0424,G0457', 0, 0, 'player2', '2.0', 1206, '', '', 0, ''),
('G0147', 'Borne', 'G0183,G0141,G1735,G0164,G1774', 0, 0, 'player9', '2.0', 1088, '', '', 0, ''),
('G0173', 'Oldenzaal', 'G0168,G1774,G0153', 0, 0, 'player9', '2.0', 1431, '', '', 0, ''),
('G0437', 'Ouder-Amstel', 'G0363,G0362,G0736,G0384', 0, 0, 'player2', '1.5', 768, '', '', 0, ''),
('G0575', 'Noordwijk', 'G0473,G0576,G1525,G0537', 0, 0, 'player33', '3.0', 1221, '', '', 0, ''),
('G0285', 'Voorst', 'G1773,G0232,G0200,G0213,G0301,G0262,G0150', 0, 0, 'player8', '1.5', 1155, '', '', 0, ''),
('G0233', 'Ermelo', 'G0302,G0243,G0050,G0273,G0203,G0200', 0, 0, 'player8', '3.0', 1236, '', '', 0, ''),
('G0363', 'Amsterdam', 'G0852,G0415,G0431,G0479,G0393,G0394,G0362,G0437,G0736,G0457,G0424,G0034,G0384', 0, 0, 'player8', '9.0', 13548, '', '', 0, ''),
('G0362', 'Amstelveen', 'G0363,G0394,G0358,G0451,G0736,G0437', 0, 0, 'player27', '3.5', 2808, '', '', 0, ''),
('G1742', 'Rijssen-Holten', 'G0163,G0177,G0150,G0262,G1735,G0189', 0, 0, 'player9', '1.5', 1595, '', '', 0, ''),
('G0425', 'Naarden', 'G0034,G0424,G0457,G0402,G0381,G0406', 0, 0, 'player8', '1.5', 925, '', '', 0, ''),
('G0406', 'Huizen', 'G0034,G0425,G0381,G0402,G0417,G0376', 0, 0, 'player8', '2.0', 1707, '', '', 0, ''),
('G0457', 'Weesp', 'G0424,G0384,G0363,G0736,G1904,G1696,G0402,G0425', 100000, 0, 'player8', '1.5', 958, '', '', 100000, ''),
('G0150', 'Deventer', 'G0177,G1773,G0285,G0262,G1742', 0, 0, 'player9', '6.0', 3131, '', '', 0, ''),
('G0164', 'Hengelo', 'G1774,G0147,G1735,G0158,G0153', 0, 0, 'player9', '4.0', 2727, '', '', 0, ''),
('G0534', 'Hillegom', 'G0377,G0576,G0553,G0394', 0, 0, 'player33', '1.5', 1056, '', '', 0, ''),
('G0576', 'Noordwijkerhout', 'G0473,G0377,G0534,G0553,G1525,G0575', 0, 0, 'player33', '1.5', 867, '', '', 0, ''),
('G1735', 'Hof van Twente', 'G0147,G0141,G0189,G1742,G0262,G1859,G0158,G0164', 0, 0, 'player9', '2.5', 1523, '', '', 0, ''),
('G0376', 'Blaricum', 'G0050,G0034,G0406,G0417,G0317', 0, 0, 'player8', '2.0', 591, '', '', 0, ''),
('G0358', 'Aalsmeer', 'G0394,G1884,G0451,G0362', 0, 0, 'player27', '2.5', 1381, '', '', 0, ''),
('G0736', 'De Ronde Venen', 'G0457,G0363,G0437,G0362,G0451,G0569,G0632,G1904', 0, 0, 'player36', '3.0', 1747, '', '', 0, ''),
('G0153', 'Enschede', 'G0168,G0173,G1774,G0164,G0158', 0, 0, 'player9', '5.0', 4368, '', '', 0, ''),
('G0273', 'Putten', 'G0233,G0050,G0267,G0203', 0, 0, 'player8', '1.5', 1164, '', '', 0, ''),
('G0317', 'Eemnes', 'G0050,G0376,G0417,G0308,G0313', 0, 0, 'player8', '1.0', 577, '', '', 0, ''),
('G1904', 'Stichtse Vecht', 'G0457,G0736,G0632,G0344,G0310,G1696', 0, 0, 'player36', '3.0', 2301, '', '', 0, ''),
('G0553', 'Lisse', 'G0534,G0576,G1525,G0394', 0, 0, 'player33', '1.5', 1109, '', '', 0, ''),
('G0313', 'Bunschoten', 'G0050,G0317,G0308,G0307,G0267', 0, 0, 'player36', '2.5', 1036, '', '', 0, ''),
('G0200', 'Apeldoorn', 'G0232,G0302,G0233,G0203,G0228,G0202,G0277,G0213,G0285', 0, 0, 'player8', '5.5', 4342, '', '', 0, ''),
('G0402', 'Hilversum', 'G0381,G0425,G0457,G1696,G0310,G0308,G0417,G0406', 0, 0, 'player36', '5.0', 2846, '', '', 0, ''),
('G1722', 'Ferwerderadiel', 'G0058,G1891,G0737,G0081,G0063,G0060', 0, 0, 'player20', '1.0', 580, '', '', 0, ''),
('G0079', 'Kollumerland en Nieuwkruisland', 'G1663,G0056,G0015,G0059,G1891,G0058', 0, 0, 'player13', '1.5', 751, '', '', 0, ''),
('G0373', 'Bergen (NH.)', 'G0441,G0383,G0399,G0361,G0416', 0, 0, 'player20', '2.0', 1372, '', '', 0, ''),
('G0393', 'Haarlemmerliede en Spaarnwoude', 'G0479,G0453,G0392,G0394,G0363', 0, 0, 'player2', '1.5', 417, '', '', 0, ''),
('G1696', 'Wijdemeren', 'G0402,G0381,G0457,G1904,G0310', 0, 0, 'player36', '1.5', 1138, '', '', 0, ''),
('G0381', 'Bussum', 'G0406,G0425,G0402,G1696', 0, 0, 'player8', '1.5', 1444, '', '', 0, ''),
('G0417', 'Laren', 'G0376,G0406,G0402,G0308,G0317', 0, 0, 'player8', '1.0', 670, '', '', 0, ''),
('G0267', 'Nijkerk', 'G0273,G0050,G0313,G0307,G0203', 0, 0, 'player8', '3.0', 1675, '', '', 0, ''),
('G0451', 'Uithoorn', 'G0362,G0358,G1884,G0569,G0736', 0, 0, 'player27', '2.5', 1310, '', '', 0, ''),
('G1525', 'Teylingen', 'G0553,G0576,G0575,G0537,G0579,G0546,G0547,G1884,G0394', 0, 0, 'player33', '2.0', 1541, '', '', 0, ''),
('G0262', 'Lochem', 'G1742,G0150,G0285,G0301,G1876,G1859,G1735', 100000, 0, 'player8', '1.5', 1465, '', '', 100000, ''),
('G0203', 'Barneveld', 'G0233,G0273,G0267,G0307,G0327,G0351,G0279,G0339,G0228,G0200', 0, 0, 'player8', '2.0', 2048, '', '', 0, ''),
('G1884', 'Kaag en Braassem', 'G0394,G1525,G0547,G0484,G0569,G0451,G0358', 0, 0, 'player27', '2.0', 1222, '', '', 0, ''),
('G0308', 'Baarn', 'G0313,G0317,G0417,G0402,G0310,G0355,G0342,G0307', 0, 0, 'player36', '2.5', 1174, '', '', 0, ''),
('G0569', 'Nieuwkoop', 'G0451,G1884,G0484,G1901,G0632,G0736', 0, 0, 'player27', '1.5', 1267, '', '', 0, ''),
('G0537', 'Katwijk', 'G0575,G1525,G0579,G0546,G0629', 0, 0, 'player33', '3.5', 2280, '', '', 0, ''),
('G0307', 'Amersfoort', 'G0267,G0313,G0308,G0342,G0355,G0327,G0203', 0, 0, 'player36', '5.5', 4194, '', '', 0, ''),
('G0158', 'Haaksbergen', 'G0153,G0164,G1735,G1859', 0, 0, 'player9', '3.5', 1175, '', '', 0, ''),
('G0579', 'Oegstgeest', 'G1525,G0537,G0546', 0, 0, 'player33', '2.0', 1136, '', '', 0, ''),
('G0342', 'Soest', 'G0307,G0308,G0355', 0, 0, 'player36', '2.0', 1822, '', '', 0, ''),
('G0310', 'De Bilt', 'G0308,G0402,G1696,G1904,G0344,G0355', 0, 0, 'player36', '5.5', 1724, '', '', 0, ''),
('G0629', 'Wassenaar', 'G0537,G0546,G0626,G1916,G0518', 0, 0, 'player33', '3.5', 1220, '', '', 0, ''),
('G1859', 'Berkelland', 'G0158,G1735,G0262,G1876,G1586', 0, 0, 'player11', '2.5', 1802, '', '', 0, ''),
('G0546', 'Leiden', 'G1525,G0579,G0537,G0629,G0626,G1916,G0638,G0547', 0, 0, 'player33', '5.0', 3589, '', '', 0, ''),
('G0547', 'Leiderdorp', 'G1884,G1525,G0546,G0638,G0484', 0, 0, 'player33', '3.0', 1256, '', '', 0, ''),
('G0301', 'Zutphen', 'G0262,G0285,G0213,G1876', 0, 0, 'player8', '3.0', 1871, '', '', 0, ''),
('G0355', 'Zeist', 'G0342,G0308,G0310,G0344,G0312,G1581,G0351,G0327,G0307', 0, 0, 'player36', '3.5', 2248, '', '', 0, ''),
('G0213', 'Brummen', 'G0301,G0285,G0200,G0277,G0275,G1876', 0, 0, 'player8', '2.0', 1069, '', '', 0, ''),
('G0632', 'Woerden', 'G0736,G0569,G1901,G0335,G0344,G1904', 0, 0, 'player36', '2.5', 1956, '', '', 0, ''),
('G0327', 'Leusden', 'G0203,G0307,G0355,G0351', 0, 0, 'player36', '1.5', 1328, '', '', 0, ''),
('G0626', 'Voorschoten', 'G0546,G0629,G1916', 0, 0, 'player33', '1.0', 1187, '', '', 0, ''),
('G0228', 'Ede', 'G0200,G0203,G0339,G0345,G0340,G0289,G0274,G0202', 0, 0, 'player8', '4.5', 3377, '', '', 0, ''),
('G0638', 'Zoeterwoude', 'G0547,G0546,G1916,G0637,G0484', 0, 0, 'player33', '1.5', 545, '', '', 0, ''),
('G0344', 'Utrecht', 'G0310,G1904,G0632,G0335,G0353,G0356,G0321,G0312,G0355', 0, 0, 'player36', '7.5', 7168, '', '', 0, ''),
('G1876', 'Bronckhorst', 'G0262,G0301,G0213,G0275,G0221,G0299,G0222,G1509,G1586,G1859', 0, 0, 'player11', '2.0', 1583, '', '', 0, ''),
('G1916', 'Leidschendam-Voorburg', 'G0546,G0626,G0629,G0518,G0603,G0637,G0638', 0, 0, 'player33', '2.5', 2527, '', '', 0, ''),
('G1901', 'Bodegraven-Reeuwijk', 'G0569,G0484,G0627,G0513,G0623,G0589,G0632', 0, 0, 'player27', '1.5', 1450, '', '', 0, ''),
('G0351', 'Woudenberg', 'G0327,G0355,G1581,G0339,G0279,G0203', 0, 0, 'player36', '1.5', 730, '', '', 0, ''),
('G0279', 'Scherpenzeel', 'G0203,G0351,G0339', 0, 0, 'player8', '2.0', 604, '', '', 0, ''),
('G0339', 'Renswoude', 'G0203,G0279,G0351,G1581,G0345,G0228', 0, 0, 'player36', '2.0', 383, '', '', 0, ''),
('G0637', 'Zoetermeer', 'G0638,G1916,G0518,G1926,G1621,G0484', 0, 0, 'player33', '6.0', 3657, '', '', 0, ''),
('G0275', 'Rheden', 'G0213,G0277,G0202,G0293,G0299,G0221,G1876', 0, 0, 'player11', '2.5', 1771, '', '', 0, ''),
('G1581', 'Utrechtse Heuvelrug', 'G0351,G0355,G0312,G0352,G0214,G0340,G0345,G0339', 0, 0, 'player36', '2.0', 1894, '', '', 0, ''),
('G0335', 'Montfoort', 'G0632,G1901,G0589,G0331,G0353,G0344', 0, 0, 'player36', '2.5', 783, '', '', 0, ''),
('G0312', 'Bunnik', 'G0355,G0344,G0321,G0352,G1581', 0, 0, 'player36', '1.5', 821, '', '', 0, ''),
('G0277', 'Rozendaal', 'G0200,G0202,G0275,G0213', 0, 0, 'player11', '2.0', 167, '', '', 0, ''),
('G0627', 'Waddinxveen', 'G0484,G1892,G0513,G1901', 0, 0, 'player27', '1.5', 1206, '', '', 0, ''),
('G0202', 'Arnhem', 'G0200,G0228,G0274,G1734,G1705,G0293,G0275,G0277', 0, 0, 'player11', '6.5', 4197, '', '', 0, ''),
('G1586', 'Oost Gelre', 'G1859,G1876,G1509,G0197,G0294', 0, 0, 'player11', '2.0', 1357, '', '', 0, ''),
('G1892', 'Zuidplas', 'G0484,G1621,G0599,G0502,G0644,G0513,G0627', 0, 0, 'player27', '2.5', 1688, '', '', 0, ''),
('G1783', 'Westland', 'G0518,G0603,G1842,G0556,G0599', 0, 0, 'player33', '5.0', 3222, '', '', 0, ''),
('G0603', 'Rijswijk', 'G1916,G0518,G1783,G1842,G0503', 0, 0, 'player33', '3.0', 1874, '', '', 0, ''),
('G0589', 'Oudewater', 'G0335,G1901,G0623,G0331', 0, 0, 'player36', '2.0', 625, '', '', 0, ''),
('G1621', 'Lansingerland', 'G0484,G0637,G1926,G0599,G1892', 0, 0, 'player33', '4.5', 2121, '', '', 0, ''),
('G0356', 'Nieuwegein', 'G0344,G0353,G0620,G0321', 0, 0, 'player36', '3.5', 2235, '', '', 0, ''),
('G0353', 'IJsselstein', 'G0344,G0335,G0331,G0620,G0356', 0, 0, 'player36', '2.0', 1494, '', '', 0, ''),
('G1926', 'Pijnacker-Nootdorp', 'G0637,G0518,G0503,G0599,G1621', 0, 0, 'player33', '2.5', 1959, '', '', 0, ''),
('G0321', 'Houten', 'G0312,G0344,G0356,G0620,G0216,G0352', 0, 0, 'player36', '2.5', 1904, '', '', 0, ''),
('G0345', 'Veenendaal', 'G0228,G0339,G1581,G0340', 0, 0, 'player36', '3.5', 2289, '', '', 0, ''),
('G0294', 'Winterswijk', 'G1586,G0197', 0, 0, 'player11', '1.5', 1328, '', '', 0, ''),
('G0221', 'Doesburg', 'G1876,G0275,G0299', 0, 0, 'player11', '1.5', 697, '', '', 0, ''),
('G0513', 'Gouda', 'G1901,G0627,G1892,G0644,G0623', 0, 0, 'player27', '4.0', 2486, '', '', 0, ''),
('G0503', 'Delft', 'G0518,G0603,G1842,G1926,G0599', 0, 0, 'player33', '4.5', 3142, '', '', 0, ''),
('G0352', 'Wijk bij Duurstede', 'G1581,G0312,G0321,G0216,G0214', 0, 0, 'player36', '1.5', 1132, '', '', 0, ''),
('G0331', 'Lopik', 'G0353,G0335,G0589,G0623,G0608,G1927,G0707,G0620', 0, 0, 'player36', '1.0', 798, '', '', 0, ''),
('G1842', 'Midden-Delfland', 'G0603,G1783,G0556,G0622,G0606,G0599,G0503', 0, 0, 'player12', '2.5', 961, '', '', 0, ''),
('G0274', 'Renkum', 'G0228,G0289,G1734,G0202', 0, 0, 'player8', '2.0', 1411, '', '', 0, ''),
('G0623', 'Vlist', 'G1901,G0513,G0644,G0491,G0608,G0331,G0589', 0, 0, 'player27', '1.0', 619, '', '', 0, ''),
('G0340', 'Rhenen', 'G0228,G0345,G1581,G0214,G1740,G0289', 0, 0, 'player36', '1.5', 991, '', '', 0, ''),
('G0299', 'Zevenaar', 'G0221,G0275,G0226,G0196,G1955,G0222,G1876,G0293', 0, 0, 'player11', '2.5', 1437, '', '', 0, ''),
('G0599', 'Rotterdam', 'G1783,G0556,G0622,G0606,G1842,G0503,G1926,G1621,G1892,G0502,G0542,G0643,G0597,G0489,G0613,G0612,G0568,G0501,G0614', 0, 0, 'player12', '12.0', 11294, '', '', 0, ''),
('G0644', 'Ouderkerk', 'G0513,G1892,G0502,G0542,G0643,G0491,G0623', 0, 0, 'player27', '1.5', 547, '', '', 0, ''),
('G0620', 'Vianen', 'G0356,G0353,G0331,G0707,G0545,G0216,G0321', 0, 0, 'player36', '2.5', 1013, '', '', 0, ''),
('G0289', 'Wageningen', 'G0228,G0340,G1740,G1734,G0274', 10000, 0, 'player8', '3.5', 1589, '', '', 10000, ''),
('G0222', 'Doetinchem', 'G1876,G0299,G1955,G1509', 0, 0, 'player11', '3.0', 2118, '', '', 0, ''),
('G0491', 'Bergambacht', 'G0623,G0644,G0643,G1927,G0608', 0, 0, 'player27', '2.0', 628, '', '', 0, ''),
('G0214', 'Buren', 'G0340,G1581,G0352,G0216,G0236,G0281,G1740', 0, 0, 'player11', '2.0', 1230, '', '', 0, ''),
('G0226', 'Duiven', 'G0299,G0293,G1705,G0196', 0, 0, 'player11', '2.5', 1217, '', '', 0, ''),
('G1509', 'Oude IJsselstreek', 'G0197,G1586,G1876,G0222,G1955', 0, 0, 'player11', '1.5', 1659, '', '', 0, ''),
('G1955', 'Montferland', 'G1509,G0222,G0299', 0, 0, 'player11', '2.0', 1511, '', '', 0, ''),
('G0293', 'Westervoort', 'G0226,G0299,G0275,G0202,G1705', 0, 0, 'player11', '2.5', 846, '', '', 0, ''),
('G0197', 'Aalten', 'G0294,G1586,G1509', 0, 0, 'player11', '2.5', 1267, '', '', 0, ''),
('G0216', 'Culemborg', 'G0321,G0620,G0545,G0236,G0214,G0352', 0, 0, 'player11', '2.0', 1287, '', '', 0, ''),
('G0707', 'Zederik', 'G0620,G0331,G1927,G0689,G0545', 0, 0, 'player27', '1.5', 780, '', '', 0, ''),
('G1734', 'Overbetuwe', 'G0202,G0274,G0289,G1740,G0209,G0268,G1705', 0, 0, 'player11', '3.0', 1851, '', '', 0, ''),
('G0608', 'Schoonhoven', 'G0331,G0623,G0491,G1927', 0, 0, 'player27', '1.0', 711, '', '', 0, ''),
('G0502', 'Capelle aan den IJssel', 'G1892,G0599,G0542,G0644', 0, 0, 'player27', '3.5', 2365, '', '', 0, ''),
('G0606', 'Schiedam', 'G0599,G1842,G0622', 0, 0, 'player12', '4.0', 2615, '', '', 0, ''),
('G1705', 'Lingewaard', 'G0293,G0202,G1734,G0268,G0282,G0265,G0196,G0226', 0, 0, 'player11', '2.5', 1831, '', '', 0, ''),
('G0622', 'Vlaardingen', 'G0606,G1842,G0556,G0599', 0, 0, 'player12', '3.5', 2486, '', '', 0, ''),
('G1740', 'Neder-Betuwe', 'G0289,G0340,G0214,G0281,G0668,G0225,G0209,G1734', 0, 0, 'player11', '1.5', 1116, '', '', 0, ''),
('G0556', 'Maassluis', 'G1842,G1783,G0599,G0622', 0, 0, 'player12', '5.0', 1424, '', '', 0, ''),
('G0545', 'Leerdam', 'G0620,G0707,G0689,G0753,G0236,G0216', 0, 0, 'player27', '3.0', 1051, '', '', 0, ''),
('G0614', 'Westvoorne', 'G0599,G0501,G0530,G1924', 0, 0, 'player12', '2.5', 794, '', '', 0, ''),
('G0501', 'Brielle', 'G0599,G0614,G0530,G0568', 0, 0, 'player12', '2.5', 889, '', '', 0, ''),
('G0236', 'Geldermalsen', 'G0214,G0216,G0545,G0733,G0304,G0281', 0, 0, 'player11', '2.5', 1240, '', '', 0, ''),
('G0689', 'Giessenlanden', 'G0707,G1927,G0523,G0512,G0733,G0545', 0, 0, 'player27', '2.0', 817, '', '', 0, ''),
('G0643', 'Nederlek', 'G0491,G0644,G0542,G0599,G0597,G1927', 0, 0, 'player27', '2.0', 804, '', '', 0, ''),
('G0542', 'Krimpen aan den IJssel', 'G0644,G0502,G0599,G0597,G0643', 0, 0, 'player27', '2.5', 1325, '', '', 0, ''),
('G0281', 'Tiel', 'G1740,G0214,G0236,G0304,G0668', 0, 0, 'player11', '3.5', 1716, '', '', 0, ''),
('G0196', 'Rijnwaarden', 'G0299,G0226,G1705,G0265', 0, 0, 'player11', '2.5', 673, '', '', 0, ''),
('G0597', 'Ridderkerk', 'G0643,G0542,G0599,G0489,G0642,G0531,G0482,G1927', 0, 0, 'player27', '3.0', 1817, '', '', 0, ''),
('G0225', 'Druten', 'G1740,G0668,G0296,G0209', 0, 0, 'player11', '2.0', 960, '', '', 0, ''),
('G0209', 'Beuningen', 'G1734,G1740,G0225,G0296,G0268', 0, 0, 'player11', '2.5', 1209, '', '', 0, ''),
('G0268', 'Nijmegen', 'G1705,G1734,G0209,G0296,G0252,G0241,G0282', 0, 0, 'player11', '5.5', 4516, '', '', 0, ''),
('G0668', 'West Maas en Waal', 'G1740,G0281,G0304,G0263,G0828,G0296,G0225', 0, 0, 'player11', '2.0', 967, '', '', 0, ''),
('G0733', 'Lingewaal', 'G0236,G0545,G0689,G0512,G0297,G0304', 0, 0, 'player11', '2.0', 675, '', '', 0, ''),
('G0530', 'Hellevoetsluis', 'G0614,G1924,G0568,G0501', 0, 0, 'player12', '6.0', 1638, '', '', 0, ''),
('G0265', 'Millingen aan de Rijn', 'G0196,G1705,G0282', 0, 0, 'player11', '1.5', 437, '', '', 0, ''),
('G0482', 'Alblasserdam', 'G1927,G0597,G0531,G0590', 0, 0, 'player27', '1.5', 1012, '', '', 0, ''),
('G0568', 'Bernisse', 'G0599,G0501,G0530,G1924,G0588,G0612', 0, 0, 'player12', '3.0', 733, '', '', 0, ''),
('G0613', 'Albrandswaard', 'G0599,G0612,G0584,G0585,G0489', 0, 0, 'player12', '4.0', 1202, '', '', 0, ''),
('G0489', 'Barendrecht', 'G0599,G0613,G0585,G0642,G0597', 0, 0, 'player27', '4.0', 1874, '', '', 0, ''),
('G0282', 'Ubbergen', 'G0265,G1705,G0268,G0241', 0, 0, 'player11', '2.0', 609, '', '', 0, ''),
('G0531', 'Hendrik-Ido-Ambacht', 'G0482,G0597,G0642,G0590', 0, 0, 'player27', '2.0', 1318, '', '', 0, ''),
('G0612', 'Spijkenisse', 'G0613,G0599,G0568,G0588,G0584', 0, 0, 'player27', '4.5', 2522, '', '', 0, ''),
('G0296', 'Wijchen', 'G0209,G0225,G0668,G0828,G0786,G0252,G0268', 0, 0, 'player11', '2.5', 1694, '', '', 0, ''),
('G0512', 'Gorinchem', 'G0733,G0689,G0523,G0870,G0874,G0297', 0, 0, 'player27', '3.0', 1520, '', '', 0, ''),
('G0304', 'Neerijnen', 'G0281,G0236,G0733,G0297,G0263,G0668', 0, 0, 'player11', '2.0', 718, '', '', 0, ''),
('G0523', 'Hardinxveld-Giessendam', 'G0689,G1927,G0610,G0505,G0870,G0512', 0, 0, 'player27', '1.5', 942, '', '', 0, ''),
('G0590', 'Papendrecht', 'G1927,G0482,G0531,G0642,G0505,G0610', 0, 0, 'player27', '2.5', 1427, '', '', 0, ''),
('G0642', 'Zwijndrecht', 'G0590,G0531,G0597,G0489,G0585,G0505', 0, 0, 'player27', '2.0', 1797, '', '', 0, ''),
('G0610', 'Sliedrecht', 'G1927,G0590,G0505,G0523', 0, 0, 'player27', '2.0', 1178, '', '', 0, ''),
('G0584', 'Oud-Beijerland', 'G0613,G0612,G0588,G0611,G0585', 0, 0, 'player27', '2.0', 1145, '', '', 0, ''),
('G0585', 'Binnenmaas', 'G0489,G0613,G0584,G0611,G0617,G0505,G0642', 0, 0, 'player27', '2.5', 1328, '', '', 0, ''),
('G0263', 'Maasdriel', 'G0668,G0304,G0297,G0797,G0796,G0828', 0, 0, 'player11', '2.5', 1168, '', '', 0, ''),
('G0828', 'Oss', 'G0296,G0668,G0263,G0796,G1671,G1721,G1685,G0786', 0, 0, 'player21', '4.5', 2819, '', '', 0, ''),
('G0241', 'Groesbeek', 'G0282,G0268,G0252,G0944,G0907', 0, 0, 'player11', '2.0', 989, '', '', 0, ''),
('G0870', 'Werkendam', 'G0512,G0523,G0505,G1719,G0779,G0867,G0738,G0874', 0, 0, 'player6', '2.5', 1245, '', '', 0, ''),
('G0588', 'Korendijk', 'G0568,G0612,G0584,G0611,G1924', 0, 0, 'player12', '2.0', 665, '', '', 0, ''),
('G0297', 'Zaltbommel', 'G0304,G0733,G0512,G0874,G0738,G0797,G0263', 0, 0, 'player11', '2.5', 1263, '', '', 0, ''),
('G0505', 'Dordrecht', 'G0610,G0590,G0642,G0585,G0617,G1709,G1719,G0870,G0523', 0, 0, 'player27', '6.5', 3561, '', '', 0, ''),
('G0874', 'Woudrichem', 'G0297,G0512,G0870,G0738', 0, 0, 'player6', '1.5', 816, '', '', 0, ''),
('G0252', 'Heumen', 'G0241,G0268,G0296,G0786,G1684,G0944', 0, 0, 'player11', '2.0', 894, '', '', 0, ''),
('G1676', 'Schouwen-Duiveland', 'G1924,G0716,G1695,G0717', 0, 0, 'player12', '1.5', 1487, '', '', 0, ''),
('G0611', 'Cromstrijen', 'G0585,G0584,G0588,G1924,G1709,G0617', 0, 0, 'player6', '2.5', 748, '', '', 0, ''),
('G0617', 'Strijen', 'G0505,G0585,G0611,G1709', 0, 0, 'player6', '2.0', 576, '', '', 0, ''),
('G0738', 'Aalburg', 'G0297,G0874,G0870,G0867,G0797', 0, 0, 'player6', '1.5', 749, '', '', 0, ''),
('G0944', 'Mook en Middelaar', 'G0241,G0252,G1684,G0907', 0, 0, 'player10', '1.0', 532, '', '', 0, ''),
('G0786', 'Grave', 'G0252,G0296,G0282,G1685,G0815,G1684', 0, 0, 'player21', '2.0', 747, '', '', 0, ''),
('G1671', 'Maasdonk', 'G0828,G0796,G0845,G1721', 0, 0, 'player21', '2.0', 684, '', '', 0, ''),
('G1685', 'Landerd', 'G0786,G0828,G1721,G0856,G0815', 0, 0, 'player21', '1.0', 847, '', '', 0, ''),
('G1719', 'Drimmelen', 'G0870,G0505,G1709,G0758,G0826,G0779', 0, 0, 'player6', '2.5', 1256, '', '', 0, ''),
('G1684', 'Cuijk', 'G0944,G0252,G0786,G0815,G1702,G0756,G0907', 0, 0, 'player21', '2.0', 1190, '', '', 0, ''),
('G0907', 'Gennep', 'G0241,G0944,G1684,G0756,G0893', 0, 0, 'player10', '1.5', 927, '', '', 0, ''),
('G0797', 'Heusden', 'G0263,G0297,G0738,G0867,G0809,G0855,G0788,G0865,G0796', 0, 0, 'player6', '2.5', 1759, '', '', 0, ''),
('G1721', 'Bernheze', 'G1685,G0828,G1671,G0845,G0844,G0860,G0856', 0, 0, 'player21', '2.0', 1354, '', '', 0, ''),
('G0815', 'Mill en Sint Hubert', 'G1684,G0786,G1685,G0856,G1702', 0, 0, 'player21', '2.0', 670, '', '', 0, ''),
('G0867', 'Waalwijk', 'G0738,G0870,G0779,G0766,G0809,G0797', 0, 0, 'player6', '3.5', 1848, '', '', 0, ''),
('G1709', 'Moerdijk', 'G1719,G0505,G0617,G0611,G1924,G0851,G1655,G0777,G0758', 0, 0, 'player6', '7.0', 1565, '', '', 0, ''),
('G0779', 'Geertruidenberg', 'G0870,G1719,G0826,G0766,G0867', 0, 0, 'player6', '4.5', 1079, '', '', 0, ''),
('G0756', 'Boxmeer', 'G0907,G1684,G1702,G0984,G0893', 0, 0, 'player21', '3.0', 1305, '', '', 0, ''),
('G0856', 'Uden', 'G1685,G1721,G0860,G0755,G1702,G0815', 0, 0, 'player21', '2.5', 1693, '', '', 0, ''),
('G0845', 'Sint-Michielsgestel', 'G1671,G0796,G0865,G0757,G0846,G0844,G1721', 0, 0, 'player21', '2.0', 1299, '', '', 0, ''),
('G0865', 'Vught', 'G0796,G0797,G0788,G0757,G0845', 0, 0, 'player21', '3.5', 1217, '', '', 0, ''),
('G0826', 'Oosterhout', 'G0779,G1719,G0758,G0784,G0766', 0, 0, 'player6', '3.0', 2046, '', '', 0, ''),
('G1702', 'Sint Anthonis', 'G0756,G1684,G0815,G0856,G0755,G1652,G0984', 0, 0, 'player21', '1.5', 707, '', '', 0, ''),
('G0766', 'Dongen', 'G0867,G0779,G0826,G0784,G0855,G0809', 0, 0, 'player6', '2.0', 1211, '', '', 0, ''),
('G0809', 'Loon op Zand', 'G0867,G0766,G0855,G0797', 0, 0, 'player6', '2.0', 1133, '', '', 0, ''),
('G0788', 'Haaren', 'G0865,G0797,G0855,G0824,G0757', 0, 0, 'player6', '2.5', 781, '', '', 0, ''),
('G0851', 'Steenbergen', 'G1924,G0716,G0748,G1674,G1655,G1709', 0, 0, 'player6', '3.0', 1144, '', '', 0, ''),
('G0716', 'Tholen', 'G1924,G1676,G1695,G0678,G0703,G0748,G0851', 0, 0, 'player12', '2.0', 1215, '', '', 0, ''),
('G0717', 'Veere', 'G1676,G1714,G0718,G0687,G1695', 0, 0, 'player12', '2.5', 1092, '', '', 0, ''),
('G0844', 'Schijndel', 'G1721,G0845,G0846,G0860', 0, 0, 'player21', '2.5', 1139, '', '', 0, ''),
('G0860', 'Veghel', 'G0856,G1721,G0844,G0846,G1659,G1652,G0755', 0, 0, 'player21', '3.0', 1590, '', '', 0, ''),
('G0758', 'Breda', 'G1719,G1709,G0777,G0879,G1723,G0784,G0826', 0, 0, 'player6', '5.5', 4737, '', '', 0, ''),
('G0855', 'Tilburg', 'G0797,G0809,G0766,G0784,G0785,G0798,G0824,G0788', 0, 0, 'player6', '6.5', 5289, '', '', 0, ''),
('G0777', 'Etten-Leur', 'G1709,G1655,G0840,G0879,G0758', 0, 0, 'player6', '3.5', 1731, '', '', 0, ''),
('G0757', 'Boxtel', 'G0845,G0865,G0788,G0824,G0823,G0753,G0846', 0, 0, 'player6', '3.5', 1375, '', '', 0, ''),
('G1655', 'Halderberge', 'G1709,G0851,G1674,G0840,G0777', 0, 0, 'player6', '3.0', 1337, '', '', 0, ''),
('G0718', 'Vlissingen', 'G0687,G0717,G1714,G0715,G0654', 0, 0, 'player12', '7.5', 1793, '', '', 0, ''),
('G0755', 'Boekel', 'G0856,G0860,G1652,G1702', 0, 0, 'player21', '1.5', 634, '', '', 0, ''),
('G1695', 'Noord-Beveland', 'G1676,G0717,G0687,G0664,G0678,G0716', 0, 0, 'player12', '2.0', 516, '', '', 0, ''),
('G0784', 'Gilze en Rijen', 'G0766,G0826,G0758,G1723,G0785,G0855', 0, 0, 'player6', '3.0', 1227, '', '', 0, ''),
('G0846', 'Sint-Oedenrode', 'G0860,G0844,G0845,G0757,G0753,G0848,G0820,G1659', 0, 0, 'player21', '1.5', 949, '', '', 0, ''),
('G0824', 'Oisterwijk', 'G0788,G0855,G0798,G0823,G0757', 0, 0, 'player6', '2.0', 1224, '', '', 0, ''),
('G1652', 'Gemert-Bakel', 'G1702,G0755,G0860,G1659,G0794,G0762,G0984', 0, 0, 'player21', '2.0', 1333, '', '', 0, ''),
('G0748', 'Bergen op Zoom', 'G0851,G0716,G0703,G0873,G1674', 0, 0, 'player6', '4.0', 2371, '', '', 0, ''),
('G1674', 'Roosendaal', 'G0840,G1655,G0851,G0784,G0873', 0, 0, 'player6', '4.5', 2637, '', '', 0, ''),
('G0984', 'Venray', 'G0893,G0756,G1702,G1652,G0762,G1507', 0, 0, 'player10', '3.0', 1753, '', '', 0, ''),
('G0840', 'Rucphen', 'G1674,G1655,G0777,G0879', 0, 0, 'player6', '2.0', 1105, '', '', 0, ''),
('G1659', 'Laarbeek', 'G0860,G0846,G0820,G0794,G1652', 0, 0, 'player21', '2.5', 1088, '', '', 0, ''),
('G0664', 'Goes', 'G0678,G1695,G0687,G0654', 0, 0, 'player12', '3.5', 1576, '', '', 0, ''),
('G0678', 'Kapelle', 'G0703,G0716,G1695,G0664,G0654', 0, 0, 'player12', '2.5', 737, '', '', 0, ''),
('G1723', 'Alphen-Chaam', 'G0758,G0784,G0785,G0744', 0, 0, 'player6', '2.0', 615, '', '', 0, ''),
('G0823', 'Oirschot', 'G0757,G0824,G0798,G1667,G1728,G0770,G0772,G0753', 0, 0, 'player21', '2.5', 949, '', '', 0, ''),
('G0879', 'Zundert', 'G0840,G0777,G0758', 0, 0, 'player6', '2.0', 1069, '', '', 0, ''),
('G0687', 'Middelburg', 'G0664,G1695,G0717,G0718,G0654', 0, 0, 'player12', '3.5', 1879, '', '', 0, ''),
('G0753', 'Best', 'G0846,G0757,G0823,G0772,G0848', 0, 0, 'player21', '3.5', 1318, '', '', 0, ''),
('G0703', 'Reimerswaal', 'G0873,G0748,G0716,G0678,G0654,G0677', 0, 0, 'player12', '3.0', 1091, '', '', 0, ''),
('G0798', 'Hilvarenbeek', 'G0785,G0855,G0824,G0823,G1728,G1667', 0, 0, 'player6', '2.5', 841, '', '', 0, ''),
('G0848', 'Son en Breugel', 'G0846,G0753,G0772,G0820', 0, 0, 'player21', '2.5', 882, '', '', 0, ''),
('G0785', 'Goirle', 'G0855,G0784,G1723,G0798', 0, 0, 'player6', '3.0', 1128, '', '', 0, ''),
('G1507', 'Horst aan de Maas', 'G0893,G0984,G0762,G1894,G0983', 0, 0, 'player10', '2.5', 1717, '', '', 0, ''),
('G0654', 'Borsele', 'G0703,G0678,G0664,G0687,G0718,G0715,G0677', 0, 0, 'player12', '11.5', 1119, '', '', 0, ''),
('G0983', 'Venlo', 'G0893,G1507,G1894,G0889', 0, 0, 'player10', '4.5', 3166, '', '', 0, ''),
('G0794', 'Helmond', 'G1659,G0820,G1771,G0847,G0743,G0762,G1652', 0, 0, 'player21', '4.5', 2915, '', '', 0, ''),
('G0762', 'Deurne', 'G1652,G0794,G0743,G1894,G1507,G0984', 0, 0, 'player10', '2.5', 1416, '', '', 0, ''),
('G0772', 'Eindhoven', 'G0848,G0753,G0823,G0770,G0861,G0866,G1658,G1771,G0820', 0, 0, 'player21', '8.5', 5464, '', '', 0, ''),
('G0873', 'Woensdrecht', 'G0703,G0748,G1674', 0, 0, 'player6', '4.0', 1083, '', '', 0, ''),
('G0770', 'Eersel', 'G0823,G1728,G1724,G0861,G0772', 0, 0, 'player21', '2.5', 959, '', '', 0, ''),
('G1771', 'Geldrop-Mierlo', 'G0794,G0820,G0772,G1658,G0847', 0, 0, 'player21', '3.5', 1629, '', '', 0, ''),
('G0847', 'Someren', 'G0794,G1771,G1658,G1706,G0946,G0743', 0, 0, 'player21', '1.5', 975, '', '', 0, ''),
('G0743', 'Asten', 'G0762,G0794,G0874,G0946,G1894', 0, 0, 'player10', '2.0', 892, '', '', 0, ''),
('G0861', 'Veldhoven', 'G0772,G0770,G1724,G0866', 0, 0, 'player21', '3.5', 1783, '', '', 0, ''),
('G1728', 'Bladel', 'G1667,G0798,G0823,G0770,G1724', 0, 0, 'player21', '2.0', 1012, '', '', 0, ''),
('G1667', 'Reusel-De Mierden', 'G0798,G0823,G1728', 0, 0, 'player6', '2.5', 745, '', '', 0, ''),
('G0677', 'Hulst', 'G0703,G0654,G0715', 0, 0, 'player12', '3.0', 1281, '', '', 0, ''),
('G1714', 'Sluis', 'G0718,G0715', 0, 0, 'player12', '2.5', 1161, '', '', 0, ''),
('G1658', 'Heeze-Leende', 'G1771,G0772,G0866,G0858,G1706,G0847', 0, 0, 'player21', '1.5', 854, '', '', 0, ''),
('G0744', 'Baarle-Nassau', 'G1723', 0, 0, 'player6', '4.0', 477, '', '', 0, ''),
('G0715', 'Terneuzen', 'G1714,G0718,G0654,G0677', 0, 0, 'player12', '5.0', 2074, '', '', 0, ''),
('G0866', 'Waalre', 'G0772,G0861,G1724,G0858,G1658', 0, 0, 'player21', '2.5', 904, '', '', 0, ''),
('G1894', 'Peel en Maas', 'G1507,G0762,G0743,G0946,G1640,G0889,G0983', 0, 0, 'player10', '2.5', 1760, '', '', 0, ''),
('G1724', 'Bergeijk', 'G1728,G0770,G0861,G0866,G0858', 0, 0, 'player21', '2.0', 959, '', '', 0, ''),
('G0858', 'Valkenswaard', 'G1724,G0866,G1658', 0, 0, 'player21', '3.0', 1380, '', '', 0, ''),
('G1706', 'Cranendonck', 'G1658,G0847,G0946,G0988', 0, 0, 'player10', '1.5', 1037, '', '', 0, ''),
('G0946', 'Nederweert', 'G0743,G0847,G1706,G0988,G1640,G1894', 0, 0, 'player10', '2.0', 907, '', '', 0, ''),
('G1640', 'Leudal', 'G0988,G0946,G1894,G0889,G0957,G1641', 0, 0, 'player10', '1.5', 1560, '', '', 0, ''),
('G0889', 'Beesel', 'G0983,G1894,G1640,G0957', 0, 0, 'player10', '2.0', 786, '', '', 0, ''),
('G0988', 'Weert', 'G1706,G0946,G1640', 0, 0, 'player10', '3.0', 1908, '', '', 0, ''),
('G0957', 'Roermond', 'G0889,G1640,G1641,G1669', 0, 0, 'player10', '4.0', 2125, '', '', 0, ''),
('G1641', 'Maasgouw', 'G1640,G0957,G1669,G1711', 0, 0, 'player10', '9.0', 1165, '', '', 0, ''),
('G1669', 'Roerdalen', 'G0957,G1641,G1711', 0, 0, 'player10', '2.5', 1060, '', '', 0, ''),
('G1711', 'Echt-Susteren', 'G1669,G1641,G1883', 0, 0, 'player10', '2.0', 1427, '', '', 0, ''),
('G1883', 'Sittard-Geleen', 'G1711,G0971,G0888,G0962', 0, 0, 'player10', '7.0', 3029, '', '', 0, ''),
('G0971', 'Stein', 'G1883,G0888,G0938', 0, 0, 'player10', '2.5', 1213, '', '', 0, ''),
('G0881', 'Onderbanken', 'G0962,G0889', 0, 0, 'player10', '2.0', 535, '', '', 0, ''),
('G0962', 'Schinnen', 'G0881,G0889,G0917,G0951,G0888,G1883', 0, 0, 'player10', '2.0', 756, '', '', 0, ''),
('G0899', 'Brunssum', 'G0881,G0962,G0917,G0882', 0, 0, 'player10', '3.5', 1332, '', '', 0, ''),
('G0888', 'Beek', 'G1883,G0971,G0938,G0951,G0962', 0, 0, 'player10', '1.5', 891, '', '', 0, ''),
('G0938', 'Meerssen', 'G0971,G0888,G0951,G0994,G0935', 0, 0, 'player10', '2.5', 1002, '', '', 0, ''),
('G0917', 'Heerlen', 'G0899,G0962,G0951,G0986,G0965,G0928,G0882', 0, 0, 'player10', '5.0', 2909, '', '', 0, ''),
('G0882', 'Landgraaf', 'G0899,G0917,G0928', 0, 0, 'player10', '2.5', 1604, '', '', 0, ''),
('G0951', 'Nuth', 'G0962,G0888,G0938,G0994,G0986,G0917', 0, 0, 'player10', '2.5', 857, '', '', 0, ''),
('G0935', 'Maastricht', 'G0938,G0994,G1903', 0, 0, 'player10', '8.5', 3631, '', '', 0, ''),
('G0928', 'Kerkrade', 'G0882,G0917', 0, 0, 'player10', '4.0', 1869, '', '', 0, ''),
('G0986', 'Voerendaal', 'G0917,G0951,G0994,G1729,G0965', 0, 0, 'player10', '2.0', 742, '', '', 0, ''),
('G0994', 'Valkenburg aan de Geul', 'G0951,G0938,G0935,G1903,G1729,G0986', 0, 0, 'player10', '3.0', 908, '', '', 0, ''),
('G0965', 'Simpelveld', 'G0917,G0986,G1729', 0, 0, 'player10', '1.5', 671, '', '', 0, ''),
('G1903', 'Eijsden-Margraten', 'G0935,G0994,G1729', 0, 0, 'player10', '3.0', 1200, '', '', 0, ''),
('G1729', 'Gulpen-Wittem', 'G1903,G0994,G0986,G0965,G0981', 0, 0, 'player10', '2.5', 816, '', '', 0, ''),
('G0981', 'Vaals', 'G1729', 0, 0, 'player10', '4.5', 621, '', '', 0, ''),
('G1911', 'Hollands Kroon', 'G0448,G0400,G0441,G0398,G0432,G0420,G1900,G0072', 0, 0, 'player20', '2.5', 1882, '', '', 0, ''),
('G0441', 'Schagen', 'G0400,G1911,G0398,G0416,G0373', 0, 0, 'player20', '1.5', 1842, '', '', 0, ''),
('G1927', 'Molenwaard', 'G0331,G0608,G0491,G0643,G0597,G0482,G0590,G0610,G0523,G0689,G0707', 0, 0, 'player27', '2.5', 1336, '', '', 0, ''),
('G1924', 'Goeree-Overflakkee', 'G0614,G0530,G0568,G0588,G0611,G1709,G0851,G0716,G1676', 0, 0, 'player12', '3.5', 1899, '', '', 0, ''),
('G0074', 'Heerenveen', 'G1921,G0098,G0085,G0086,G0090,G0080', 0, 0, 'player20', '3.5', 1930, '', '', 0, ''),
('G0080', 'Leeuwarden', 'G0081,G1908,G0140,G1900,G1921,G0074,G0090,G0737', 0, 0, 'player20', '5.0', 3340, '', '', 0, ''),
('G0484', 'Alphen aan den Rijn', 'G1884,G0547,G0638,G0637,G1621,G1892,G0627,G1901,G0569', 0, 0, 'player27', '4.0', 3312, '', '', 0, ''),
('G0893', 'Bergen (L.)', 'G0907,G0756,G0984,G1507,G0983', 0, 0, 'player10', '1.5', 769, '', '', 0, ''),
('G0820', 'Nuenen, Gerwen en Nederwetten', 'G1659,G0846,G0848,G0772,G1771,G0794', 0, 0, 'player21', '2.0', 1118, '', '', 0, ''),
('G1900', 'SÃºdwest-FryslÃ¢n', 'G0072,G0070,G0140,G0080,G1921,G1911,G0420,G0388', 0, 0, 'player20', '3.0', 2805, '', '', 0, ''),
('G1921', 'De Friese Meren', 'G1900,G0080,G0074,G0098,G1708,G0171,G0184,G0388', 0, 0, 'player9', '2.0', 1980, '', '', 0, ''),
('G0518', '\'s-Gravenhage', 'G0629,G1916,G0637,G1926,G0503,G0603,G1783', 0, 0, 'player33', '9.5', 9836, '', '', 0, ''),
('G0796', '\'s-Hertogenbosch', 'G0263,G0797,G0865,G0845,G1671,G0828', 0, 0, 'player21', '5.0', 4058, '', '', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `map_provgron`
--

CREATE TABLE `map_provgron` (
  `id` char(2) NOT NULL,
  `name` text NOT NULL,
  `neigh` text NOT NULL,
  `army` int(255) NOT NULL DEFAULT '0',
  `recruit` int(11) NOT NULL,
  `owner` text NOT NULL,
  `trade` decimal(11,1) NOT NULL DEFAULT '0.5',
  `worth` int(11) NOT NULL DEFAULT '500',
  `move` text NOT NULL,
  `attack` text NOT NULL,
  `army_new` int(11) NOT NULL DEFAULT '0',
  `pic` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `map_provgron`
--

INSERT INTO `map_provgron` (`id`, `name`, `neigh`, `army`, `recruit`, `owner`, `trade`, `worth`, `move`, `attack`, `army_new`, `pic`) VALUES
('GR', 'Groningen', 'HO,AD,ZO,TH,HK,FX,HR', 108, 0, 'player13', '5.0', 3080, '', '', 108, ''),
('HR', 'Haren', 'GR,FX,GL', 10, 0, 'player13', '2.0', 975, '', '', 10, ''),
('GL', 'Glimmen', 'HR,FX', 10, 0, 'player13', '1.0', 480, '', '', 10, ''),
('FX', 'Foxhol', 'GL,HR,GR,HK,FB,HS', 0, 0, 'player13', '2.0', 820, '', '', 0, ''),
('HK', 'Harkstede', 'GR,TH,LL,SO,FB,FX', 9, 0, 'player13', '1.0', 490, '', '', 9, ''),
('LL', 'Lageland', 'TH,TB,TP,OV,SO,HK', 0, 0, 'player13', '1.5', 375, '', '', 0, ''),
('TH', 'Thesinge', 'GR,ZO,BD,TB,LL,HK', 0, 0, 'player13', '1.0', 394, '', '', 0, ''),
('ZO', 'Zuidwolde', 'GR,AD,BD,TH', 0, 0, 'player13', '1.0', 400, '', '', 0, ''),
('AD', 'Adorp', 'GR,AU,EZ,SW,ZO', 5000, 0, 'player13', '1.0', 475, '', '', 5000, ''),
('AU', 'Aduard', 'HO,EU,ZH,EZ,AD', 0, 0, 'player13', '1.5', 543, '', '', 0, ''),
('HO', 'Hoogkerk', 'GR,AU,EU,OO', 16455, 0, 'player13', '2.0', 970, '', '', 16455, ''),
('EU', 'Enumatil', 'OO,OK,ZH,AU,HO', 0, 0, 'player13', '1.0', 354, '', '', 0, ''),
('OO', 'Oostwold', 'LK,BR,OK,EU,HO', 197, 0, 'player13', '1.0', 329, '', '', 197, ''),
('LK', 'Leek', 'ZV,NU,BR,OO', 98, 0, 'player13', '2.5', 1212, '', '', 98, ''),
('ZV', 'Zevenhuizen', 'DW,NU,LK', 0, 0, 'player13', '2.0', 621, '', '', 0, ''),
('NU', 'Nuis', 'ZV,DW,MA,BR,LK', 0, 0, 'player13', '1.5', 333, '', '', 0, ''),
('DW', 'De Wilp', 'ON,MA,NU,ZV', 0, 0, 'player13', '1.0', 295, '', '', 0, ''),
('MA', 'Marum', 'DW,ON,BR,NU,ZV', 97, 0, 'player13', '2.0', 890, '', '', 97, ''),
('ON', 'Opende', 'GG,BR,MA,DW', 0, 0, 'player13', '1.5', 380, '', '', 0, ''),
('GG', 'Grootegast', 'ON,BR,OK,LU', 0, 0, 'player13', '2.0', 1095, '', '', 0, ''),
('BR', 'Boerakker', 'OO,LK,NU,MA,ON,GG', 0, 0, 'player13', '1.5', 450, '', '', 0, ''),
('OK', 'Oldekerk', 'EU,OO,GG,LU,GK,ZH', 0, 0, 'player13', '1.0', 412, '', '', 0, ''),
('LU', 'Lutjegast', 'GG,OK,GK', 0, 0, 'player13', '1.5', 380, '', '', 0, ''),
('GK', 'Grijpskerk', 'LZ,ZH,OK,LU', 0, 0, 'player13', '2.0', 1180, '', '', 0, ''),
('ZH', 'Zuidhorn', 'AU,EU,OK,GK,LZ,OH,EZ', 97, 0, 'player13', '2.0', 1325, '', '', 97, ''),
('LZ', 'Lauwerzijl', 'ZK,OH,ZH,GK', 0, 0, 'player13', '1.0', 360, '', '', 0, ''),
('OH', 'Oldehove', 'LZ,ZK,WH,EZ,ZH', 0, 0, 'player20', '1.5', 635, '', '', 0, ''),
('ZK', 'Zoutkamp', 'LW,UL,LE,WH,OH,LZ', 0, 0, 'player20', '3.0', 885, '', '', 0, ''),
('LW', 'Lauwersoog', 'ZK,UL', 0, 0, 'player20', '5.0', 795, '', '', 0, ''),
('UL', 'Ulrum', 'LW,LE,KB,ER', 299998, 0, 'player20', '1.0', 405, '', '', 299998, ''),
('KB', 'Kloosterburen', 'UL,LE,ER,PB', 0, 0, 'player20', '1.0', 268, '', '', 0, ''),
('LE', 'Leens', 'UL,KB,ER,WH,ZK', 0, 0, 'player20', '1.5', 375, '', '', 0, ''),
('PB', 'Pieterburen', 'KB,ER,DA,WF', 28703, 0, 'player20', '2.0', 725, '', '', 28703, ''),
('ER', 'Eenrum', 'WH,LE,KB,PB,DA,BF,WI', 0, 0, 'player20', '1.0', 365, '', '', 0, ''),
('WH', 'Wehe-den-Hoorn', 'LE,ER,WI,EZ,OH,ZK', 299996, 0, 'player20', '1.5', 420, '', '', 299996, ''),
('EZ', 'Ezinge', 'OH,WH,WI,SW,AD,AU,ZH', 5214, 0, 'player13', '1.0', 380, '', '', 5214, ''),
('SW', 'Sauwerd', 'AD,EZ,WI,OD,BD', 0, 0, 'player13', '1.0', 394, '', '', 0, ''),
('WI', 'Winsum', 'SW,EZ,WH,ER,BF,OD', 0, 0, 'player20', '2.0', 1020, '', '', 0, ''),
('BF', 'Baflo', 'WI,ER,DA,WF,KA,OD', 15001, 0, 'player13', '1.5', 610, '', '', 15001, ''),
('DA', 'Den Andel', 'PB,WF,BF,ER', 149999, 0, 'player13', '1.0', 280, '', '', 149999, ''),
('WF', 'Warffum', 'PB,DA,BF,KA,UQ', 999, 0, 'player20', '1.5', 716, '', '', 999, ''),
('UQ', 'Usquert', 'WF,KA,UI', 4998, 0, 'player20', '1.0', 674, '', '', 4998, ''),
('UI', 'Uithuizen', 'UQ,ZN,UM', 0, 0, 'player20', '2.5', 1111, '', '', 0, ''),
('UM', 'Uithuizermeeden', 'UI,ZN,ZA,RO', 899, 0, 'player20', '1.5', 875, '', '', 899, ''),
('RO', 'Roodeschool', 'UM,ZA,SP,EH', 99, 0, 'player20', '2.0', 626, '', '', 99, ''),
('EH', 'Eemshaven', 'RO,DZ', 0, 0, 'player20', '10.5', 1366, '', '', 0, ''),
('SP', 'Spijk', 'RO,ZA,BI', 0, 0, 'player20', '1.5', 525, '', '', 0, ''),
('BI', 'Bierum', 'DZ,AP,LM,ZA,SP', 0, 0, 'player12', '1.5', 483, '', '', 0, ''),
('ZA', '\'t Zandt', 'RO,SP,BI,LM,WE,UM', 687, 0, 'player20', '1.0', 618, '', '', 687, ''),
('ZN', 'Zandeweer', 'UI,UM,WE,MI,KA', 500, 0, 'player13', '1.0', 372, '', '', 500, ''),
('KA', 'Kantens', 'ZN,MI,OD,BF,WF,UQ', 62477, 0, 'player13', '1.5', 420, '', '', 62477, ''),
('OD', 'Onderdendam', 'BD,SW,WI,BF,KA,MI', 0, 0, 'player13', '1.5', 299, '', '', 0, ''),
('BD', 'Bedum', 'TB,TH,ZO,SW,OD,MI', 0, 0, 'player13', '2.0', 990, '', '', 0, ''),
('MI', 'Middelstum', 'BD,OD,KA,ZN,WE,ST', 0, 0, 'player13', '2.0', 1135, '', '', 0, ''),
('WE', 'Westeremden', 'LM,LO,ST,MI,ZN,ZA', 50000, 0, 'player20', '1.0', 330, '', '', 50000, ''),
('ST', 'Stedum', 'WE,LO,TP,TB,MI', 0, 0, 'player13', '1.5', 595, '', '', 0, ''),
('TB', 'Ten Boer', 'ST,TP,LL,TH,BD', 0, 0, 'player13', '2.0', 799, '', '', 0, ''),
('TP', 'Ten Post', 'LL,TB,ST,LO,GW,OV', 0, 0, 'player13', '1.0', 644, '', '', 0, ''),
('LO', 'Loppersum', 'LM,WE,ST,TP,GW,AP', 2306, 0, 'player20', '5.0', 926, '', '', 2306, ''),
('GW', 'Garrelsweer', 'LO,TP,OV,AP', 0, 0, 'player13', '1.5', 462, '', '', 0, ''),
('LM', 'Leermens', 'BI,ZA,WE,LO,AP', 2563, 0, 'player20', '1.0', 345, '', '', 2563, ''),
('AP', 'Appingedam', 'DZ,BI,LM,LO,GW,OV,TJ', 0, 0, 'player20', '2.0', 1015, '', '', 0, ''),
('DZ', 'Delfzijl', 'BI,AP,TJ,WB,FR,EH', 0, 0, 'player20', '7.5', 1354, '', '', 0, ''),
('OV', 'Overschild', 'LL,TP,GW,AP,SO', 500, 0, 'player13', '1.0', 380, '', '', 500, ''),
('TJ', 'Tjuchem', 'AP,DZ,WB,SI', 0, 0, 'player20', '1.0', 418, '', '', 0, ''),
('SI', 'Siddeburen', 'TJ,WB,NW,NB,SO', 0, 0, 'player20', '1.5', 720, '', '', 0, ''),
('SO', 'Slochteren', 'OV,SI,NB,FB,HK,LL', 99, 0, 'player13', '4.5', 917, '', '', 99, ''),
('FB', 'Froombosch', 'SO,NB,HS,FX,HK', 0, 0, 'player13', '1.5', 630, '', '', 0, ''),
('HS', 'Hoogezand-Sappemeer', 'FB,NB,ZB,MU,KW,FX', 0, 0, 'player13', '2.5', 1441, '', '', 0, ''),
('KW', 'Kiel-Windeweer', 'HS,MU,VE,BV', 0, 0, 'player13', '1.0', 665, '', '', 0, ''),
('FR', 'Farmsum', 'DZ,WB,NW,TR', 0, 0, 'player20', '4.5', 795, '', '', 0, ''),
('TR', 'Termunten', 'FR,NW,FW,HW', 0, 0, 'player20', '2.5', 625, '', '', 0, ''),
('WB', 'Wagenborgen', 'FR,NW,SI,TJ,DZ', 0, 0, 'player20', '1.5', 501, '', '', 0, ''),
('NW', 'Nieuwolda', 'FR,TR,FW,MW,NB,SI,WB', 0, 0, 'player20', '1.0', 685, '', '', 0, ''),
('HW', 'Hongerige Wolf', 'TR,FW,BN', 0, 0, 'player20', '1.5', 530, '', '', 0, ''),
('FW', 'Finsterwolde', 'TR,HW,BN,BE,MW,NW', 0, 0, 'player20', '1.5', 640, '', '', 0, ''),
('NB', 'Noordbroek', 'NW,MW,SC,ZB,HS,FB,SO,SI', 3861, 0, 'player20', '1.5', 631, '', '', 3861, ''),
('ZB', 'Zuidbroek', 'NB,SC,ME,MU,HS', 0, 0, 'player20', '2.0', 760, '', '', 0, ''),
('MU', 'Muntendam', 'ZB,ME,VE,KW,HS', 0, 0, 'player20', '1.5', 725, '', '', 0, ''),
('VE', 'Veendam', 'MU,OM,BV,KW', 0, 0, 'player20', '3.0', 1488, '', '', 0, ''),
('BV', 'Bareveld', 'KW,VE,OM,SK', 0, 0, 'player20', '1.0', 460, '', '', 0, ''),
('SK', 'Stadskanaal', 'BV,OM,NP,OW,MK', 0, 0, 'player20', '2.5', 1249, '', '', 0, ''),
('MK', 'Musselkanaal', 'TA,SE,JI,OW,SK', 0, 0, 'player20', '1.5', 762, '', '', 0, ''),
('TA', 'Ter Apel', 'MK,SE', 0, 0, 'player20', '2.0', 845, '', '', 0, ''),
('SE', 'Sellingen', 'TA,MK,JI,BT', 7, 0, 'player20', '1.5', 777, '', '', 7, ''),
('OM', 'Ommelanderwijk', 'ME,WL,OP,NP,SK,BV,VE', 0, 0, 'player20', '1.0', 510, '', '', 0, ''),
('NP', 'Nieuwe Pekela', 'SK,OM,OP,OW', 0, 0, 'player20', '1.5', 872, '', '', 0, ''),
('OP', 'Oude Pekela', 'WL,WS,BH,WD,OW,NP,OM', 0, 0, 'player20', '2.0', 960, '', '', 0, ''),
('ME', 'Meeden', 'SC,WL,OM,MU,ZB', 0, 0, 'player20', '1.0', 578, '', '', 0, ''),
('SC', 'Scheemda', 'MW,WI,WL,ME,ZB,NB', 0, 0, 'player20', '2.0', 775, '', '', 0, ''),
('MW', 'Midwolda', 'WS,SC,NB,NW,FW', 0, 0, 'player20', '1.0', 645, '', '', 0, ''),
('BE', 'Beerta', 'FW,BN,BW,BH,WS', 0, 0, 'player20', '2.0', 840, '', '', 0, ''),
('BN', 'Bad Nieuweschans', 'HW,FW,BE,BW', 0, 0, 'player20', '3.0', 1286, '', '', 0, ''),
('BW', 'Bellingwolde', 'BN,BE,BH,VR', 0, 0, 'player20', '1.5', 810, '', '', 0, ''),
('VR', 'Vriescheloo', 'BW,BH,WD,VW,BT', 0, 0, 'player20', '1.5', 630, '', '', 0, ''),
('BT', 'Bourtange', 'SE,JI,VW,VR', 0, 0, 'player20', '2.5', 830, '', '', 0, ''),
('VW', 'Vlagtwedde', 'BT,JI,OW,WD,VR', 0, 0, 'player20', '1.5', 820, '', '', 0, ''),
('JI', 'Jipsingboertange', 'SE,MK,OW,VW,BT', 0, 0, 'player20', '1.0', 466, '', '', 0, ''),
('OW', 'Onstwedde', 'MK,SK,NP,OP,WD,VW,JI', 5, 0, 'player20', '1.0', 489, '', '', 5, ''),
('WL', 'Westerlee', 'OP,OM,ME,SC,MW,WS', 0, 0, 'player20', '1.0', 710, '', '', 0, ''),
('WS', 'Winschoten', 'MW,BE,BH,OP,WL', 0, 0, 'player20', '4.0', 1430, '', '', 0, ''),
('BH', 'Blijham', 'BE,BW,VR,WD,OP,WS', 0, 0, 'player20', '1.5', 680, '', '', 0, ''),
('WD', 'Wedde', 'BH,VR,VW,OW,OP', 0, 0, 'player20', '1.0', 446, '', '', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `map_usa`
--

CREATE TABLE `map_usa` (
  `id` char(5) NOT NULL,
  `name` text NOT NULL,
  `neigh` text NOT NULL,
  `army` int(11) NOT NULL DEFAULT '0',
  `recruit` int(11) NOT NULL,
  `owner` text NOT NULL,
  `trade` decimal(11,1) NOT NULL DEFAULT '0.5',
  `worth` int(11) NOT NULL DEFAULT '500',
  `move` text NOT NULL,
  `attack` text NOT NULL,
  `army_new` int(11) NOT NULL DEFAULT '0',
  `pic` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `map_usa`
--

INSERT INTO `map_usa` (`id`, `name`, `neigh`, `army`, `recruit`, `owner`, `trade`, `worth`, `move`, `attack`, `army_new`, `pic`) VALUES
('USOR', 'Oregon', 'USWA,USHI,USCA,USNV,USID', 30000, 0, 'player20', '2.5', 2025, '', '', 30000, ''),
('USWA', 'Washington', 'USAK,USOR,USID', 0, 0, 'player20', '2.5', 4020, '', '', 0, ''),
('USTX', 'Texas', 'USNM,USOK,USAR,USLA', 0, 0, 'player13', '3.0', 4190, '', '', 0, ''),
('USHI', 'Hawaii', 'USAK,USCA,USOR', 0, 0, 'player13', '3.0', 2495, '', '', 0, ''),
('USAL', 'Alabama', 'USMS,USTN,USFL,USGA', 42, 0, 'player13', '2.0', 2280, '', '', 42, ''),
('USCA', 'California', 'USHI,USOR,USNV,USAZ', 221595, 0, 'player13', '3.5', 5681, '', '', 221595, ''),
('USID', 'Idaho', 'USWA,USOR,USNV,USUT,USWY,USMT', 29524, 0, 'player20', '1.5', 1625, '', '', 29524, ''),
('USNV', 'Nevada', 'USCA,USOR,USID,USUT,USAZ', 15000, 0, 'player13', '2.5', 2950, '', '', 15000, ''),
('USUT', 'Utah', 'USNV,USID,USWY,USCO,USAZ,USNM', 0, 0, 'player13', '1.5', 1655, '', '', 0, ''),
('USAZ', 'Arizona', 'USCA,USNV,USUT,USCO,USNM', 0, 0, 'player13', '2.0', 1786, '', '', 0, ''),
('USMT', 'Montana', 'USID,USWY,USND,USSD', 0, 0, 'player20', '1.5', 1665, '', '', 0, ''),
('USWY', 'Wyoming', 'USMT,USID,USUT,USCO,USNE,USSD', 0, 0, 'player20', '1.5', 2400, '', '', 0, ''),
('USCO', 'Colorado', 'USWY,USUT,USAZ,USNM,USOK,USKS,USNE', 200, 0, 'player20', '1.5', 1750, '', '', 200, ''),
('USNM', 'New Mexico', 'USAZ,USUT,USCO,USOK,USTX', 170, 0, 'player13', '1.5', 1540, '', '', 170, ''),
('USND', 'North Dakota', 'USMT,USSD,USMN', 0, 0, 'player20', '1.5', 2265, '', '', 0, ''),
('USSD', 'South Dakota', 'USMT,USWY,USNE,USIA,USMN,USND', 0, 0, 'player20', '1.5', 2360, '', '', 0, ''),
('USNE', 'Nebraska', 'USWY,USCO,USKS,USMO,USIA,USSD', 0, 0, 'player20', '1.5', 2381, '', '', 0, ''),
('USKS', 'Kansas', 'USNE,USCO,USOK,USMO', 0, 0, 'player20', '2.0', 1485, '', '', 0, ''),
('USOK', 'Oklahoma', 'USKS,USCO,USNM,USTX,USAR,USMO', 0, 0, 'player13', '2.0', 1575, '', '', 0, ''),
('USMN', 'Minnesota', 'USND,USSD,USIA,USWI', 0, 0, 'player20', '1.5', 2415, '', '', 0, ''),
('USIA', 'Iowa', 'USMN,USSD,USNE,USMO,USIL,USWI', 0, 0, 'player20', '1.5', 2310, '', '', 0, ''),
('USMO', 'Missouri', 'USIA,USNE,USKS,USOK,USAR,USTN,USKY,USIL', 100, 0, 'player20', '1.5', 1665, '', '', 100, ''),
('USAR', 'Arkansas', 'USMO,USOK,USTX,USLA,USMS,USTN', 0, 0, 'player13', '1.5', 1510, '', '', 0, ''),
('USLA', 'Louisiana', 'USMS,USTX,USAR', 0, 0, 'player13', '1.5', 1865, '', '', 0, ''),
('USMI', 'Michigan', 'USWI,USIN,USOH', 0, 0, 'player20', '2.5', 2570, '', '', 0, ''),
('USWI', 'Wisconsin', 'USMN,USIA,USIL,USMI', 0, 0, 'player20', '1.5', 1835, '', '', 0, ''),
('USIL', 'Illinois', 'USWI,USIA,USMO,USKY,USIN', 0, 0, 'player20', '3.0', 3315, '', '', 0, ''),
('USIN', 'Indiana', 'USMI,USIL,USKY,USOH', 0, 0, 'player20', '2.0', 1720, '', '', 0, ''),
('USKY', 'Kentucky', 'USMO,USTN,USVA,USWV,USOH,USIN,USIL', 1500, 0, 'player20', '2.0', 2410, '', '', 1500, ''),
('USTN', 'Tennessee', 'USMO,USAR,USMS,USAL,USGA,USNC,USVA,USKY', 42, 0, 'player13', '2.0', 2395, '', '', 42, ''),
('USMS', 'Mississippi', 'USAR,USLA,USAL,USTN', 42, 0, 'player13', '2.0', 2423, '', '', 42, ''),
('USFL', 'Florida', 'USAL,USGA', 42, 0, 'player13', '3.5', 4095, '', '', 42, ''),
('USGA', 'Georgia', 'USFL,USSC,USNC,USTN,USAL', 42, 0, 'player13', '2.5', 2560, '', '', 42, ''),
('USSC', 'South Carolina', 'USGA,USNC', 1000, 0, 'player8', '2.5', 1695, '', '', 1000, ''),
('USNC', 'North Carolina', 'USVA,USTN,USGA,USSC', 1000, 0, 'player8', '2.5', 1635, '', 'USTN:500', 500, ''),
('USWV', 'West Virginia', 'USPA,USOH,USKY,USVA,USMD', 866, 0, 'player20', '2.5', 1685, '', '', 866, ''),
('USVA', 'Virginia', 'USDC,USMD,USWV,USKY,USTN,USNC', 1000, 0, 'player8', '2.0', 1765, '', '', 1000, ''),
('USMD', 'Maryland', 'USDE,USPA,USWV,USVA,USDC', 1000, 0, 'player8', '2.0', 1490, '', '', 1000, ''),
('USPA', 'Pennsylvania', 'USOH,USWV,USMD,USDE,USNJ,USNY', 0, 0, 'player20', '2.5', 1245, '', '', 0, ''),
('USDE', 'Delaware', 'USMD,USPA,USNJ', 1905, 0, 'player8', '2.0', 1425, '', '', 1905, ''),
('USDC', 'District of Columbia', 'USMD,USVA', 1000, 0, 'player8', '3.5', 2565, '', '', 1000, ''),
('USNJ', 'New Jersey', 'USNY,USPA,USDE', 0, 0, 'player20', '2.0', 1655, '', '', 0, ''),
('USNY', 'New York', 'USPA,USNJ,USCT,USMA,USVT', 534933, 0, 'player20', '4.5', 4330, '', '', 534933, ''),
('USCT', 'Connecticut', 'USNY,USMA,USRI', 0, 0, 'player20', '2.5', 1280, '', '', 0, ''),
('USRI', 'Rhode Island', 'USMA,USCT', 0, 0, 'player20', '2.0', 1030, '', '', 0, ''),
('USMA', 'Massachusetts', 'USNH,USVT,USNY,USCT,USRI', 8, 0, 'player20', '2.5', 1476, '', '', 8, ''),
('USVT', 'Vermont', 'USNH,USMA,USNY', 0, 0, 'player20', '2.0', 1405, '', '', 0, ''),
('USNH', 'New Hampshire', 'USME,USMA,USVT', 199989, 0, 'player20', '2.0', 1337, '', '', 199989, ''),
('USME', 'Maine', 'USNH', 0, 0, 'player20', '2.0', 1365, '', '', 0, ''),
('USAK', 'Alaska', 'USWA,USHI', 30000, 0, 'player20', '1.5', 2125, '', '', 30000, ''),
('USOH', 'Ohio', 'USMI,USIN,USKY,USWV,USPA', 0, 0, 'player20', '1.5', 1960, '', '', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `map_wereld`
--

CREATE TABLE `map_wereld` (
  `id` char(2) NOT NULL,
  `name` text NOT NULL,
  `neigh` text NOT NULL,
  `army` int(11) NOT NULL DEFAULT '0',
  `recruit` int(11) NOT NULL,
  `owner` text NOT NULL,
  `trade` decimal(11,1) NOT NULL DEFAULT '0.5',
  `worth` int(11) NOT NULL DEFAULT '500',
  `move` text NOT NULL,
  `attack` text NOT NULL,
  `army_new` int(11) NOT NULL DEFAULT '0',
  `pic` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `map_wereld`
--

INSERT INTO `map_wereld` (`id`, `name`, `neigh`, `army`, `recruit`, `owner`, `trade`, `worth`, `move`, `attack`, `army_new`, `pic`) VALUES
('NL', 'Nederland', 'GB,BE,DE', 0, 0, 'player20', '9.5', 3720, '', '', 0, ''),
('BE', 'Belgi&euml;', 'NL,DE,LU,FR', 0, 0, 'player20', '4.0', 1850, '', '', 0, ''),
('DE', 'Duitsland', 'DK,PL,CZ,AT,CH,FR,LU,BE,NL', 599882, 0, 'player2', '7.0', 7750, '', '', 599882, ''),
('LU', 'Luxemburg', 'DE,BE,FR', 0, 0, 'player20', '2.0', 890, '', '', 0, ''),
('FR', 'Frankrijk', 'LU,DE,BE,IT,CH,ES,GB,BR,SR', 2646, 0, 'player20', '6.5', 7210, '', '', 2646, ''),
('GB', 'Verenigd Koninkrijk', 'NO,NL,FR,IE,IS,ES,US', 4996, 0, 'player20', '3.0', 5950, '', '', 4996, ''),
('RU', 'Rusland', 'NO,FI,EE,LV,LT,PL,BY,UA,TR,GE,AZ,KZ,CA,US,JP,CN,KP,MN,RO', 19988, 0, 'player20', '4.5', 28800, '', '', 19988, ''),
('TR', 'Turkije', 'UA,BG,GR,CY,SY,RU,GE,IR,AM,IQ,AZ', 5997, 0, 'player20', '3.0', 8050, '', '', 5997, ''),
('EG', 'Egypte', 'IL,LY,SA,CY,SD', 0, 0, 'player20', '9.0', 4175, '', '', 0, ''),
('IS', 'IJsland', 'GB,NO,IE,GL', 1000, 0, 'player20', '1.0', 1400, '', '', 1000, ''),
('ES', 'Spanje', 'FR,DZ,MA,PT,GB,IE', 499997, 0, 'player2', '3.0', 2670, '', '', 499997, ''),
('AD', 'Andorra', '', 0, 0, 'neutral', '0.0', 0, '', '', 0, ''),
('FO', 'Faroe Eilanden', '', 0, 0, 'neutral', '0.0', 0, '', '', 0, ''),
('IM', 'Mann', '', 0, 0, 'neutral', '0.0', 0, '', '', 0, ''),
('DK', 'Denemarken', 'NO,SE,DE', 0, 0, 'player20', '4.0', 1625, '', '', 0, ''),
('NO', 'Noorwegen', 'IS,GB,DK,SE,FI,RU,GL', 1997, 0, 'player20', '3.0', 3300, '', '', 1997, ''),
('SE', 'Zweden', 'NO,FI,PL,DK,LV', 0, 0, 'player20', '2.0', 4300, '', '', 0, ''),
('FI', 'Finland', 'SE,NO,RU,EE', 0, 0, 'player20', '2.0', 3100, '', '', 0, ''),
('AX', 'Aland', '', 0, 0, 'neutral', '0.0', 0, '', '', 0, ''),
('MA', 'Marokko', 'DZ,ES,PT,MR,_2', 0, 0, 'player20', '3.0', 4810, '', '', 0, ''),
('PT', 'Portugal', 'ES,MA,US', 99, 0, 'player20', '2.0', 1375, '', '', 99, ''),
('IE', 'Ierland', 'IS,GB,ES', 0, 0, 'player20', '1.0', 1440, '', '', 0, ''),
('CH', 'Zwitserland', 'DE,AT,IT,FR', 60, 0, 'player20', '3.0', 1800, '', '', 60, ''),
('AT', 'Oostenrijk', 'DE,CZ,SK,HU,SI,IT,CH', 8997, 0, 'player20', '3.0', 2500, '', '', 8997, ''),
('LI', 'Liechtenstein', '', 0, 0, 'neutral', '0.0', 0, '', '', 0, ''),
('JE', 'Jersey', '', 0, 0, 'neutral', '0.0', 0, '', '', 0, ''),
('GG', 'Guernsey', '', 0, 0, 'neutral', '0.0', 0, '', '', 0, ''),
('MT', 'Malta', '', 0, 0, 'neutral', '0.0', 0, '', '', 0, ''),
('IT', 'Itali&euml;', 'FR,CH,AT,SI,HR,AL,GR,LY,TN', 4993, 0, 'player20', '5.5', 6000, '', '', 4993, ''),
('GR', 'Griekenland', 'IT,AL,MK,BG,TR,LY,CY', 0, 0, 'player20', '3.0', 3250, '', '', 0, ''),
('PL', 'Polen', 'SE,RU,LT,BY,UA,SK,CZ,DE', 0, 0, 'player20', '3.5', 6000, '', '', 0, ''),
('SA', 'Saudi Arabi&euml;', 'EG,JO,IQ,SD,KW,QA,AE,OM,YE,ER', 0, 0, 'player20', '3.0', 8690, '', '', 0, ''),
('CZ', 'Tsjechi&euml;', 'DE,PL,SK,AT', 0, 0, 'player20', '1.5', 3500, '', '', 0, ''),
('GE', 'Georgi&euml;', 'RU,TR,AZ,AM', 0, 0, 'player20', '1.0', 3200, '', '', 0, ''),
('TN', 'Tunesi&euml;', 'IT,LY,DZ', 0, 0, 'player20', '4.5', 6125, '', '', 0, ''),
('PS', 'Westelijk Jordaanoever', 'IL,JO', 0, 0, 'player2', '1.0', 800, '', '', 0, ''),
('IL', 'Isra&euml;l', 'EG,LB,SY,JO,PS', 0, 0, 'player2', '3.5', 1990, '', '', 0, ''),
('CY', 'Cyprus', 'TR,EG,LB,GR', 0, 0, 'player20', '3.5', 3100, '', '', 0, ''),
('_0', 'Noord Cyprus', '', 0, 0, 'neutral', '0.0', 0, '', '', 0, ''),
('SM', 'San Marino', '', 0, 0, 'neutral', '0.0', 0, '', '', 0, ''),
('SI', 'Sloveni&euml;', 'IT,AT,HR,HU', 0, 0, 'player20', '1.5', 500, '', '', 0, ''),
('MD', 'Moldavi&euml;', 'UA,RO', 0, 0, 'player20', '1.5', 1500, '', '', 0, ''),
('EE', 'Estland', 'FI,RU,LV', 0, 0, 'player20', '2.0', 5200, '', '', 0, ''),
('AL', 'Albani&euml;', 'IT,ME,_1,MK,GR', 568590, 0, 'player20', '2.5', 3250, '', '', 568590, ''),
('MK', 'Macedoni&euml;', 'AL,_1,RS,BG,GR', 500000, 0, 'player2', '1.0', 1000, '', '', 500000, ''),
('ME', 'Montenegro', 'BA,RS,_1,AL,HR', 0, 0, 'player20', '2.0', 1000, '', '', 0, ''),
('_1', 'Kosovo', 'RS,MK,AL,ME', 0, 0, 'player20', '0.5', 500, '', '', 0, ''),
('UA', 'Oekra&iuml;ne', 'BY,RU,TR,MD,RO,HU,SK,PL', 0, 0, 'player20', '2.5', 5000, '', '', 0, ''),
('RS', 'Servi&euml;', 'HU,RO,BG,MK,_1,ME,BA,HR', 0, 0, 'player20', '1.5', 2500, '', '', 0, ''),
('BA', 'Bosni&euml; en Herzegovina', 'HR,RS,ME', 0, 0, 'player20', '1.5', 1000, '', '', 0, ''),
('HR', 'Kroati&euml;', 'SI,HU,RS,BA,IT,ME', 49999, 0, 'player20', '2.5', 2600, '', '', 49999, ''),
('BY', 'Wit-Rusland', 'RU,LT,PL,UA,LV', 0, 0, 'player20', '1.5', 3950, '', '', 0, ''),
('SK', 'Slowakije', 'AT,HU,PL,CZ,UA', 0, 0, 'player20', '1.0', 1750, '', '', 0, ''),
('HU', 'Hongarije', 'AT,SK,RO,HR,SI,RS,UA', 0, 0, 'player20', '2.5', 4000, '', '', 0, ''),
('DZ', 'Algarije', 'MA,ES,TN,LY,MR,ML,NE', 0, 0, 'player20', '3.5', 5710, '', '', 0, ''),
('LY', 'Libi&euml;', 'DZ,TN,IT,GR,EG,NE,TD,SD', 2997, 0, 'player20', '2.0', 7500, '', '', 2997, ''),
('RO', 'Roemeni&euml;', 'HU,BG,RS,MD,UA,RU', 4996, 0, 'player20', '2.0', 3750, '', '', 4996, ''),
('BG', 'Bulgarije', 'RO,RS,MK,GR,TR', 0, 0, 'player20', '2.0', 3250, '', '', 0, ''),
('LV', 'Letland', 'LT,EE,SE,BY,RU', 0, 0, 'player20', '2.0', 4200, '', '', 0, ''),
('SY', 'Syri&euml;', 'TR,IQ,JO,IL,LB', 0, 0, 'player20', '2.0', 1665, '', '', 0, ''),
('LB', 'Libanon', 'SY,IL,CY', 0, 0, 'player2', '5.5', 1900, '', '', 0, ''),
('LT', 'Litouwen', 'LV,BY,RU,PL', 0, 0, 'player20', '1.0', 4750, '', '', 0, ''),
('IQ', 'Irak', 'SY,SA,JO,KW,IR,TR', 0, 0, 'player20', '3.0', 2375, '', '', 0, ''),
('JO', 'Jordani&euml;', 'IL,PS,SY,IQ,SA', 0, 0, 'player2', '1.5', 1425, '', '', 0, ''),
('GY', 'Guyana', 'VE,SR,BR', 0, 0, 'player20', '1.5', 3500, '', '', 0, ''),
('SO', 'Somali&euml;', '_3,ET,KE,IN,YE', 3997, 0, 'player20', '3.0', 1375, '', '', 3997, ''),
('_2', 'Westelijke Sahara', 'MA,MR', 0, 0, 'player20', '1.0', 420, '', '', 0, ''),
('MR', 'Mauritani&euml;', 'MA,DZ,ML,SN,_2', 9, 0, 'player20', '2.5', 3500, '', '', 9, ''),
('ML', 'Mali', 'MR,DZ,NE,BF,CI,GN,SN', 998, 0, 'player20', '2.0', 2200, '', '', 998, ''),
('NE', 'Niger', 'DZ,LY,TD,CM,NG,BJ,BF,ML', 1998, 0, 'player20', '2.5', 1800, '', '', 1998, ''),
('TD', 'Tsjaad', 'LY,SD,CF,CM,NE', 0, 0, 'player20', '1.5', 3060, '', '', 0, ''),
('GL', 'Groenland', 'CA,IS,NO', 0, 0, 'player20', '3.5', 5900, '', '', 0, ''),
('SD', 'Soedan', 'EG,SA,ER,ET,SS,CF,TD,LY', 0, 0, 'player20', '2.0', 3325, '', '', 0, ''),
('KW', 'Koeweit', 'IQ,SA', 0, 0, 'player2', '5.0', 5250, '', '', 0, ''),
('QA', 'Qatar', 'IR,AE,SA', 0, 0, 'player20', '2.0', 5415, '', '', 0, ''),
('AE', 'Verenigde Arabische Emiraten', 'SA,QA,IR,OM', 0, 0, 'player20', '3.0', 4840, '', '', 0, ''),
('IR', 'Iran', 'AZ,TM,AF,PK,OM,AE,QA,IQ,TR,AM', 18998, 0, 'player20', '3.0', 9320, '', '', 18998, ''),
('OM', 'Oman', 'AE,IR,YE,SA,IN', 2997, 0, 'player20', '2.5', 3780, '', '', 2997, ''),
('AM', 'Armeni&euml;', 'AM,AZ,IR,TR', 0, 0, 'player20', '1.5', 3900, '', '', 0, ''),
('AZ', 'Azerbeidzjan', 'RU,TM,IR,AM,GE,TR', 13109250, 0, 'player2', '1.0', 2900, '', '', 13109250, ''),
('KZ', 'Kazachtstan', 'RU,CN,KG,UZ,TM', 0, 0, 'player20', '2.0', 6970, '', '', 0, ''),
('UZ', 'Oezbekistan', 'KZ,KG,TJ,AF,TM', 0, 0, 'player20', '1.5', 3400, '', '', 0, ''),
('TM', 'Turkemistan', 'KZ,UZ,AF,IR,AZ', 0, 0, 'player20', '1.5', 6200, '', '', 0, ''),
('CA', 'Canada', 'GL,US,RU', 0, 0, 'player20', '5.0', 15450, '', '', 0, ''),
('US', 'Verenigde Staten van Amerika', 'CA,MX,CU,RU,CN,JP,GB,PT,BS', 4995, 0, 'player20', '7.0', 31725, '', '', 4995, ''),
('KG', 'Kirgizi&euml;', 'KZ,CN,TJ,UZ', 0, 0, 'player20', '1.0', 2300, '', '', 0, ''),
('TJ', 'Tadzjikistan', 'UZ,KG,CN,AF', 0, 0, 'player20', '1.0', 4200, '', '', 0, ''),
('AF', 'Afghanistan', 'TM,UZ,TJ,CN,PK,IR', 997, 0, 'player20', '1.5', 3200, '', '', 997, ''),
('CN', 'China', 'MN,RU,KP,JP,KR,TW,PH,US,VN,LA,MM,IN,BT,NP,PK,AF,TJ,KG,KZ,PA', 14979, 0, 'player20', '11.0', 21520, '', '', 14979, ''),
('MN', 'Mongoli&euml;', 'RU,CN', 0, 0, 'player20', '3.0', 760, '', '', 0, ''),
('IN', 'India', 'PK,CN,NP,BT,MM,BD,LK,SO,OM', 4996, 0, 'player20', '5.5', 4640, '', '', 4996, ''),
('LK', 'Sri Lanka', 'IN,ID', 0, 0, 'player20', '1.5', 520, '', '', 0, ''),
('PK', 'Pakistan', 'AF,CN,IN,IR', 0, 0, 'player20', '1.0', 5200, '', '', 0, ''),
('NP', 'Nepal', 'IN,CN', 0, 0, 'player20', '2.0', 680, '', '', 0, ''),
('BT', 'Bhoetan', 'IN,CN', 0, 0, 'player20', '1.5', 530, '', '', 0, ''),
('JP', 'Japan', 'KR,KP,CN,RU,US,MX', 0, 0, 'player20', '6.5', 8700, '', '', 0, ''),
('KR', 'Zuid-Korea', 'KP,CN,JP', 0, 0, 'player20', '3.0', 6175, '', '', 0, ''),
('KP', 'Noord-Korea', 'RU,JP,KR,CN', 0, 0, 'player20', '1.0', 330, '', '', 0, ''),
('ID', 'Indonesi&euml;', 'TH,MY,PH,PG,AU,TL,LK', 0, 0, 'player20', '4.5', 6500, '', '', 0, ''),
('AU', 'Australi&euml;', 'ID,PG,SB,VU,NC,FJ,NZ,TL,MG,TF', 993, 0, 'player20', '6.0', 13350, '', '', 993, ''),
('NZ', 'Nieuw Zeeland', 'AU,NC,FJ,VU,CL,PE', 4994, 0, 'player20', '5.0', 6350, '', '', 4994, ''),
('PE', 'Peru', 'EC,CO,BR,BO,CL,NZ', 498, 0, 'player20', '3.5', 6070, '', '', 498, ''),
('CL', 'Chili', 'PE,BO,AR,NZ', 0, 0, 'player20', '2.0', 6900, '', '', 0, ''),
('BD', 'Bangladesh', 'IN,MM', 0, 0, 'player20', '1.5', 320, '', '', 0, ''),
('MM', 'Myanmar', 'BD,IN,CN,LA,TH', 0, 0, 'player20', '2.0', 400, '', '', 0, ''),
('TH', 'Thailand', 'MM,LA,KH,MY,ID', 0, 0, 'player20', '2.5', 5700, '', '', 0, ''),
('MY', 'Maleisi&euml;', 'TH,VN,BN,PH,ID', 0, 0, 'player20', '1.5', 5750, '', '', 0, ''),
('VN', 'Vietnam', 'CN,PH,BN,MY,KH,LA', 997, 0, 'player20', '1.0', 1900, '', '', 997, ''),
('BN', 'Brunei', 'VN,MY', 0, 0, 'player20', '0.5', 1135, '', '', 0, ''),
('PH', 'Filipijnen', 'CN,TW,ID,MY,VN', 0, 0, 'player20', '1.5', 2700, '', '', 0, ''),
('TW', 'Taiwan', 'CN,PH', 0, 0, 'player20', '1.0', 1995, '', '', 0, ''),
('LA', 'Laos', 'CN,VN,KH,TH,MM', 1998, 0, 'player20', '0.5', 1005, '', '', 1998, ''),
('KH', 'Cambodja', 'TH,LA,VN', 0, 0, 'player20', '1.0', 1350, '', '', 0, ''),
('TL', 'Oost Timor', 'ID,AU', 0, 0, 'player20', '1.0', 800, '', '', 0, ''),
('PG', 'Papoea-Nieuw-Guinea', 'ID,SB,AU', 0, 0, 'player20', '2.0', 1200, '', '', 0, ''),
('SB', 'Solomon Eilanden', 'VU,FJ,NC,AU,PG', 0, 0, 'player20', '1.5', 800, '', '', 0, ''),
('VU', 'Vanatau', 'SB,FJ,NC,AU', 0, 0, 'player20', '0.5', 500, '', '', 0, ''),
('NC', 'Nieuw Caledoni&euml;', 'SB,VU,NZ,AU,FJ', 0, 0, 'player20', '0.5', 600, '', '', 0, ''),
('FJ', 'Fiji', 'SB,VU,NC,NZ,AU', 0, 0, 'player20', '0.5', 1200, '', '', 0, ''),
('BS', 'Bahama\'s', 'CU,US', 0, 0, 'player20', '0.5', 1100, '', '', 0, ''),
('MX', 'Mexico', 'US,GT,BZ,CU,JP', 9998, 0, 'player20', '4.5', 9550, '', '', 9998, ''),
('ER', 'Eritrea', 'SD,ET,DJ,YE,SA', 0, 0, 'player2', '1.0', 480, '', '', 0, ''),
('DJ', 'Djibouti', 'YE,ER,ET,_3', 0, 0, 'player2', '0.5', 720, '', '', 0, ''),
('ET', 'Ethiopi&euml;', 'DJ,ER,SD,SS,KE,SO,_3', 0, 0, 'player20', '1.5', 1420, '', '', 0, ''),
('YE', 'Jemen', 'SA,OM,ER,DJ,_3,SO', 0, 0, 'player20', '1.5', 1800, '', '', 0, ''),
('CU', 'Cuba', 'BS,MX,JM,HT,US', 4997, 0, 'player20', '2.0', 315, '', '', 4997, ''),
('JM', 'Jamaica', 'CU,HT', 0, 0, 'player20', '2.0', 1820, '', '', 0, ''),
('HT', 'Ha&iuml;ti', 'JM,CU,DO', 0, 0, 'player20', '1.5', 1050, '', '', 0, ''),
('DO', 'Dominicaanse Republiek', 'PR,HT', 97, 0, 'player20', '1.0', 2100, '', '', 97, ''),
('PR', 'Puerto Rico', 'DO,TT', 0, 0, 'player20', '2.0', 1480, '', '', 0, ''),
('TT', 'Trinidad en Tobago', 'PR,VE', 0, 0, 'player20', '1.0', 890, '', '', 0, ''),
('VE', 'Venezuela', 'TT,GY,BR,CO', 9, 0, 'player20', '2.5', 5200, '', '', 9, ''),
('SR', 'Suriname', 'FR,GY,BR', 0, 0, 'player20', '3.0', 4220, '', '', 0, ''),
('CO', 'Colombia', 'VE,BR,PE,EC,PA', 486, 0, 'player20', '2.5', 4520, '', '', 486, ''),
('EC', 'Ecuador', 'PE,CO', 0, 0, 'player20', '3.0', 3700, '', '', 0, ''),
('BR', 'Brazili&euml;', 'FR,SR,GY,VE,CO,PE,BO,PY,AR,UY,LR', 11013, 0, 'player20', '5.0', 15660, '', '', 11013, ''),
('PA', 'Panama', 'CO,CR,CN', 4113, 0, 'player20', '7.0', 2690, '', '', 4113, ''),
('NI', 'Nicaragua', 'CR,HN', 0, 0, 'player20', '1.5', 2430, '', '', 0, ''),
('CR', 'Costa Rica', 'PA,NI', 7, 0, 'player20', '1.0', 2200, '', '', 7, ''),
('HN', 'Honduras', 'NI,SV,GT', 998972, 0, 'player2', '1.0', 2160, '', '', 998972, ''),
('SV', 'El Salvador', 'GT,HN', 0, 0, 'player2', '1.5', 1790, '', '', 0, ''),
('GT', 'Guatemala', 'BZ,MX,HN,SV', 0, 0, 'player20', '2.0', 2990, '', '', 0, ''),
('BZ', 'Belize', 'MX,GT', 0, 0, 'player20', '1.0', 1900, '', '', 0, ''),
('BO', 'Bolivia', 'PE,BR,PY,AR,CL', 0, 0, 'player20', '1.0', 4100, '', '', 0, ''),
('PY', 'Paraguay', 'BR,BO,AR', 0, 0, 'player20', '1.5', 3621, '', '', 0, ''),
('AR', 'Argentini&euml;', 'BR,BO,PY,UY,CL,FK,ZA', 999, 0, 'player20', '3.0', 11960, '', '', 999, ''),
('UY', 'Uruguay', 'AR,BR', 0, 0, 'player20', '1.5', 2700, '', '', 0, ''),
('FK', 'Falklandeilanden', 'AR', 0, 0, 'player13', '4.5', 1200, '', '', 0, ''),
('KE', 'Kenia', 'SO,ET,SS,UG,TZ', 0, 0, 'player20', '2.0', 2250, '', '', 0, ''),
('UG', 'Oeganda', 'KE,SS,CD,RW,TZ', 0, 0, 'player20', '1.5', 1250, '', '', 0, ''),
('SS', 'Zuid-Soedan', 'SD,ET,KE,UG,CD,CF', 0, 0, 'player2', '1.0', 2250, '', '', 0, ''),
('RW', 'Rwanda', 'BI,TZ,UG,CD', 0, 0, 'player20', '2.0', 950, '', '', 0, ''),
('BI', 'Burundi', 'RW,CD,TZ', 0, 0, 'player20', '1.0', 1400, '', '', 0, ''),
('TZ', 'Tanzania', 'KE,UG,RW,BI,CD,ZM,MW,MZ', 4996, 0, 'player20', '1.0', 2300, '', '', 4996, ''),
('MW', 'Malawi', 'TZ,ZM,MZ', 0, 0, 'player20', '0.5', 975, '', '', 0, ''),
('MZ', 'Mozambique', 'MW,TZ,ZM,ZW,SZ,ZA,MG', 40991, 0, 'player20', '2.0', 2750, '', '', 40991, ''),
('MG', 'Madagaskar', 'MZ,TF,AU', 0, 0, 'player20', '3.0', 1800, '', '', 0, ''),
('SZ', 'Swaziland', 'MZ,ZA', 0, 0, 'player20', '0.5', 1020, '', '', 0, ''),
('ZA', 'Zuid-Afrika', 'LS,SZ,MZ,ZW,BW,NA,TF,AR', 0, 0, 'player20', '4.0', 8750, '', '', 0, ''),
('LS', 'Lesotho', 'ZA', 0, 0, 'player20', '1.0', 800, '', '', 0, ''),
('NA', 'Namibi&euml;', 'ZA,BW,ZW,ZM,AO', 1998, 0, 'player20', '1.0', 2860, '', '', 1998, ''),
('ZW', 'Zimbabwe', 'BW,NA,ZM,MZ,ZA', 1000, 0, 'player20', '1.0', 1740, '', '', 1000, ''),
('BW', 'Botswana', 'ZA,ZW,NA,ZM', 0, 0, 'player20', '1.5', 4750, '', '', 0, ''),
('AO', 'Angola', 'CG,CD,ZM,NA', 1998, 0, 'player20', '1.0', 3100, '', '', 1998, ''),
('ZM', 'Zambia', 'MZ,ZW,NA,AO,CD,TZ,MW,BW', 0, 0, 'player20', '2.0', 1830, '', '', 0, ''),
('CD', 'Democratische Republiek Congo', 'SS,UG,RW,BI,TZ,ZM,AO,CG,CF', 0, 0, 'player20', '3.0', 2680, '', '', 0, ''),
('CF', 'Centraal-Afrikaanse Republiek', 'TD,SD,SS,CD,CG,CM', 0, 0, 'player2', '2.5', 1800, '', '', 0, ''),
('CG', 'Republiek Congo', 'CD,CF,CM,GA,AO', 0, 0, 'player20', '1.5', 1740, '', '', 0, ''),
('GA', 'Gabon', 'CG,GQ,CM', 0, 0, 'player2', '1.5', 3250, '', '', 0, ''),
('GQ', 'Equestrisch-Guinea', 'GA,CM', 0, 0, 'player2', '1.5', 2390, '', '', 0, ''),
('CM', 'Kameroen', 'GQ,GA,CG,CF,TD,NE,NG', 0, 0, 'player20', '1.0', 1995, '', '', 0, ''),
('NG', 'Nigeria', 'CM,NE,BJ', 0, 0, 'player20', '1.0', 2920, '', '', 0, ''),
('TF', 'Franse Zuidelijke en Antarctische Gebieden', 'MG,ZA,AU', 0, 0, 'player20', '2.5', 400, '', '', 0, ''),
('BJ', 'Benin', 'NG,NE,BF,TG', 0, 0, 'player20', '0.5', 1800, '', '', 0, ''),
('BF', 'Burkina Faso', 'ML,NE,BJ,TG,GH,CI', 2998, 0, 'player20', '1.5', 1750, '', '', 2998, ''),
('TG', 'Togo', 'BF,BJ,GH', 0, 0, 'player20', '0.5', 875, '', '', 0, ''),
('GH', 'Ghana', 'TG,BF,CI', 0, 0, 'player20', '2.0', 2625, '', '', 0, ''),
('CI', 'Ivoorkust', 'LR,GN,ML,BF,TG', 1997, 0, 'player20', '1.5', 3080, '', '', 1997, ''),
('LR', 'Liberia', 'SL,GN,CI,BR', 2997, 0, 'player20', '1.0', 815, '', '', 2997, ''),
('SN', 'Senegal', 'MR,ML,GN,GW,GM', 1998, 0, 'player20', '2.0', 2200, '', '', 1998, ''),
('GM', 'Gambia', 'SN', 0, 0, 'player20', '2.0', 450, '', '', 0, ''),
('GW', 'Guinee-Bissau', 'SN,GN', 0, 0, 'player20', '1.0', 360, '', '', 0, ''),
('GN', 'Guinee', 'GW,SN,ML,CI,LR,SL', 997, 0, 'player20', '1.0', 1250, '', '', 997, ''),
('SL', 'Sierra Leone', 'GN,LR', 0, 0, 'player20', '0.5', 720, '', '', 0, ''),
('_3', 'Somaliland', 'ET,DJ,SO', 0, 0, 'player20', '1.5', 950, '', '', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `map_westeros`
--

CREATE TABLE `map_westeros` (
  `id` char(2) NOT NULL,
  `name` text NOT NULL,
  `neigh` text NOT NULL,
  `army` int(11) NOT NULL DEFAULT '0',
  `recruit` int(11) NOT NULL,
  `owner` text NOT NULL,
  `trade` decimal(11,1) NOT NULL DEFAULT '0.5',
  `worth` int(11) NOT NULL DEFAULT '500',
  `move` text NOT NULL,
  `attack` text NOT NULL,
  `army_new` int(11) NOT NULL DEFAULT '0',
  `pic` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `map_westeros`
--

INSERT INTO `map_westeros` (`id`, `name`, `neigh`, `army`, `recruit`, `owner`, `trade`, `worth`, `move`, `attack`, `army_new`, `pic`) VALUES
('NO', 'The North', 'DM,QC,HR,KH', 0, 0, 'player10', '1.0', 3000, '', '', 0, ''),
('DM', 'Deepwood Motte', 'NO,QC,WO,TS,SS', 0, 0, 'player10', '2.5', 2000, '', '', 0, ''),
('QC', 'Queenscrown', 'NO,HR,LY,WF,WO,DM', 837565, 0, 'player10', '1.5', 1000, '', '', 837565, ''),
('HR', 'Last Hearth', 'NO,KH,LY,QC', 856775, 0, 'player10', '1.0', 750, '', '', 856775, ''),
('KH', 'Karhold', 'NO,DF,LY,HR', 49, 0, 'player10', '3.5', 3500, '', '', 49, ''),
('WF', 'Winterfell', 'QC,LY,WH,TS,WO', 0, 0, 'player10', '3.0', 5500, '', '', 0, ''),
('WO', 'Wolfswood', 'DM,WF,QC,TS', 0, 0, 'player10', '1.0', 500, '', '', 0, ''),
('LY', 'Lonely Hills', 'WF,QC,HR,KH,WH,DF', 0, 0, 'player10', '1.5', 750, '', '', 0, ''),
('TS', 'Torrhen\'s Square', 'DM,WO,WF,SS,RI,BT,MC,WH', 0, 0, 'player10', '2.0', 2500, '', '', 0, ''),
('SS', 'The Stony Shore', 'DM,TS,RI', 0, 0, 'player10', '1.5', 1000, '', '', 0, ''),
('DF', 'The Dreadfort', 'LY,KH,WW,WH', 0, 0, 'player10', '2.0', 4500, '', '', 0, ''),
('WH', 'White Harbor', 'WF,TS,MC,WW,DF,LY,FI', 0, 0, 'player10', '8.5', 6500, '', '', 0, ''),
('WW', 'Widows Watch', 'WH,DF', 0, 0, 'player10', '2.5', 1250, '', '', 0, ''),
('MC', 'Moat Cailin', 'TS,WH,BT,NE,TW', 0, 0, 'player10', '2.0', 750, '', '', 0, ''),
('BT', 'Barrowtown', 'MC,TS,RI,NE,FF', 0, 0, 'player10', '1.5', 1500, '', '', 0, ''),
('FI', 'The Fingers', 'WH,ST,EY,LH', 0, 0, 'player13', '2.5', 3500, '', '', 0, ''),
('RI', 'The Rills', 'BT,TS,SS,FF', 0, 0, 'player10', '0.5', 750, '', '', 0, ''),
('NE', 'The Neck', 'MC,TW,BT,FF', 0, 0, 'player10', '2.0', 1000, '', '', 0, ''),
('FF', 'Flint\'s Finger', 'NE,BT,RI,GW,TT', 0, 0, 'player10', '2.0', 750, '', '', 0, ''),
('TW', 'The Twins', 'SG,NE,MC,BF,RR,ST', 0, 0, 'player10', '4.5', 6000, '', '', 0, ''),
('SG', 'Seagard', 'TW,TT,RR', 0, 0, 'player10', '6.0', 3750, '', '', 0, ''),
('TT', 'Ten Towers', 'SG,BA,GW,PY,FF', 0, 0, 'player10', '2.5', 1500, '', '', 0, ''),
('GW', 'Great Wyk', 'TT,FF,PY', 0, 0, 'player10', '3.0', 1250, '', '', 0, ''),
('PY', 'Pyke', 'TT,GW,BA', 0, 0, 'player10', '3.5', 2000, '', '', 0, ''),
('BA', 'Banefort', 'PY,TT,RR,GT,CR', 0, 0, 'player10', '3.0', 1250, '', '', 0, ''),
('RR', 'Riverrun', 'BA,GT,AH,HH,BF,TW,SG', 0, 0, 'player10', '5.0', 8000, '', '', 0, ''),
('GT', 'Golden Tooh', 'RR,BA,AH,SY,DE,CA,CR', 0, 0, 'player10', '2.5', 8000, '', '', 0, ''),
('ST', 'Strongsong', 'TW,FI,BF,TR,EY', 49729, 0, 'player10', '1.5', 3500, '', '', 49729, ''),
('BF', 'Blue Fork', 'ST,TW,RR,HH,TR', 0, 0, 'player10', '3.0', 2500, '', '', 0, ''),
('LH', 'Longbow Hall', 'FI,EY', 0, 0, 'player13', '5.5', 11000, '', '', 0, ''),
('EY', 'The Eyrie', 'ST,FI,LH,SP,TR', 999998, 0, 'player13', '4.0', 8000, '', '', 999998, ''),
('TR', 'The Trident', 'EY,BF,ST,SP,HH', 0, 0, 'player10', '3.5', 4500, '', '', 0, ''),
('SP', 'Saltpans', 'TR,EY,HH,MP,CC', 0, 0, 'player13', '4.0', 4250, '', '', 0, ''),
('CC', 'Crackclaw Point', 'SP,MP,DS', 0, 0, 'player13', '1.5', 2500, '', '', 0, ''),
('MP', 'Maidenpool', 'CC,SP,HH,DD,HE', 0, 0, 'player10', '3.5', 3750, '', '', 0, ''),
('HH', 'Harrenhal', 'HE,AH,RR,BF,TR,SP,MP,DD', 499, 0, 'player10', '2.0', 4500, '', '', 499, ''),
('DS', 'Dragonstone', 'CC,HY,DD', 0, 0, 'player13', '3.5', 8500, '', '', 0, ''),
('DD', 'Duskensdale', 'MP,HH,HE,KL,BB,DS', 0, 0, 'player10', '4.5', 3500, '', '', 0, ''),
('KL', 'King\'s Landing', 'KW,BB,DD', 99998, 0, 'player13', '7.0', 17500, '', '', 99998, ''),
('KW', 'The Kingswood', 'KL,BB,GV,SM,SH,SE,HY', 125468, 0, 'player13', '5.5', 2750, '', '', 125468, ''),
('HY', 'Haystack Hall', 'DS,KW,SE,TH', 6561, 0, 'player13', '1.5', 3000, '', '', 6561, ''),
('SE', 'Storm\'s end', 'KW,HY,TH,MW,SH', 0, 0, 'player13', '4.5', 9000, '', '', 0, ''),
('TH', 'Tarth', 'HY,SE,MW', 0, 0, 'player13', '2.5', 3000, '', '', 0, ''),
('BB', 'Bitterbridge', 'KL,HE,DD,RH,CI,GV,KW', 0, 0, 'player10', '3.0', 3000, '', '', 0, ''),
('HE', 'Heart Hall', 'HH,DD,BB,RH,SY,AH,MP', 498, 0, 'player10', '1.5', 1000, '', '', 498, ''),
('AH', 'Acorn Hall', 'GT,RR,HH,HE,SY', 0, 0, 'player10', '2.0', 2000, '', '', 0, ''),
('MW', 'Mistwood', 'SE,TH,SH,SU', 9998, 0, 'player13', '2.5', 2750, '', '', 9998, ''),
('SU', 'Sunspear', 'MW,TO,SR', 0, 0, 'player13', '4.0', 8750, '', '', 0, ''),
('TO', 'The Tor', 'SU,SR,HT,YW', 0, 0, 'player13', '3.0', 2000, '', '', 0, ''),
('SR', 'Salt Shore', 'SU,TO,HT', 0, 0, 'player13', '2.5', 3500, '', '', 0, ''),
('YW', 'Yronwood', 'TO,HT,SA,HM,WY', 0, 0, 'player13', '4.0', 5000, '', '', 0, ''),
('HT', 'Hellholt', 'SA,YW,TO,SR', 0, 0, 'player13', '1.5', 1500, '', '', 0, ''),
('SH', 'Stonehelm', 'MW,SE,KW,SM', 39000, 0, 'player20', '3.5', 4500, '', '', 39000, ''),
('SA', 'Sandstone', 'HT,YW,HM,SF', 0, 0, 'player13', '1.5', 2000, '', '', 0, ''),
('WY', 'Wyl', 'YW,HM,DO,BH,SM', 6240, 0, 'player13', '2.5', 3000, '', '', 6240, ''),
('SM', 'Summerhall', 'KW,SH,WY,BH,GV', 0, 0, 'player13', '1.0', 4000, '', '', 0, ''),
('CR', 'The Crag', 'CA,GT,BA', 0, 0, 'player10', '2.0', 2500, '', '', 0, ''),
('CA', 'Casterly Rock', 'GT,CR,DE,LP', 0, 0, 'player10', '5.5', 10000, '', '', 0, ''),
('SF', 'Starfall', 'SA,HM,UL,OT,AR', 0, 0, 'player13', '3.0', 4000, '', '', 0, ''),
('AR', 'The Arbor', 'SF,OT,BC', 0, 0, 'player13', '10.0', 3250, '', '', 0, ''),
('OT', 'Oldtown', 'AR,SF,BC,HO,UL', 0, 0, 'player13', '8.0', 6500, '', '', 0, ''),
('RH', 'The Reach', 'BB,HE,SY,SL,GG,HG,CI', 0, 0, 'player10', '5.0', 2250, '', '', 0, ''),
('UL', 'Uplands', 'SF,OT,HO,DO,HM', 0, 0, 'player13', '1.5', 2500, '', '', 0, ''),
('HM', 'High Hermitage', 'WY,YW,SA,SF,UL,DO', 0, 0, 'player13', '2.5', 2000, '', '', 0, ''),
('DO', 'Dornish Marches', 'UL,HM,WY,HO,HL,BH', 0, 0, 'player13', '1.0', 1500, '', '', 0, ''),
('LP', 'Lannisport', 'CA,DE,SL,CH', 0, 0, 'player10', '6.5', 6500, '', '', 0, ''),
('BH', 'Blackhaven', 'SM,WY,DO,HL,GV', 0, 0, 'player13', '1.5', 3000, '', '', 0, ''),
('GV', 'Grassy Vale', 'BB,KW,SM,BH,HL,CI', 0, 0, 'player13', '3.0', 2500, '', '', 0, ''),
('BC', 'Blackcrown', 'OT,AR,HO,BW', 0, 0, 'player13', '3.0', 1250, '', '', 0, ''),
('HL', 'Hornhill', 'DO,BH,HO,HG,CI,GV', 210000, 0, 'player13', '4.5', 2500, '', '', 210000, ''),
('CI', 'Cider Hall', 'HL,GV,BB,RH,HG', 0, 0, 'player13', '1.5', 1000, '', '', 0, ''),
('HO', 'Honeyholt', 'BW,HG,HL,DO,UL,OT,BC', 0, 0, 'player13', '2.0', 1250, '', '', 0, ''),
('HG', 'Highgarden', 'SI,OO,GG,RH,CI,HL,HO,BW', 0, 0, 'player13', '6.5', 4500, '', '', 0, ''),
('SY', 'Stoney Sept', 'RH,SL,DE,GT,AH,HE', 0, 0, 'player10', '2.0', 1750, '', '', 0, ''),
('BW', 'Brightwater', 'BC,HO,HG,SI', 0, 0, 'player13', '4.5', 3500, '', '', 0, ''),
('SI', 'Shield Islands', 'BW,HG,OO', 0, 0, 'player13', '2.5', 500, '', '', 0, ''),
('OO', 'Old Oak', 'SI,HG,GG,CH', 0, 0, 'player13', '3.5', 1250, '', '', 0, ''),
('GG', 'Goldengrove', 'OO,HG,RH,SL,CH', 0, 0, 'player10', '1.0', 2000, '', '', 0, ''),
('SL', 'Silverhill', 'LP,DE,SY,RH,GG,CH', 0, 0, 'player10', '2.0', 3000, '', '', 0, ''),
('DE', 'Deep Den', 'SY,SL,LP,CA,GT', 0, 0, 'player10', '1.5', 2000, '', '', 0, ''),
('CH', 'Crakenhall', 'OO,GG,SL,LP', 0, 0, 'player10', '2.0', 1000, '', '', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `players`
--

CREATE TABLE `players` (
  `id` int(11) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `mail` text NOT NULL,
  `firstname` text NOT NULL,
  `lastname` text NOT NULL,
  `settings` text NOT NULL,
  `pic` text NOT NULL,
  `title` text NOT NULL,
  `suftitle` text NOT NULL,
  `rating` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `players`
--

INSERT INTO `players` (`id`, `username`, `password`, `mail`, `firstname`, `lastname`, `settings`, `pic`, `title`, `suftitle`, `rating`) VALUES
(1, 'player1', 'player1', '', 'Player', '1', '', 'http://www.crossed-flag-pins.com/animated-flag-gif/gifs/Israel_240-animated-flag-gifs.gif', '', '', 17),
(2, 'player2', 'player2', '', 'Player', '2', 'showtitle:false,showspectitle:,showsuftitle:true,chatcolor:true', '', 'Premium Betatester', '', 11),
(21, 'player21', 'player21', '', 'Player', '21', '', 'http://dakiniland.files.wordpress.com/2011/08/god-monty-python.jpg', '', '', 0),
(3, 'player3', 'player3', '', 'Player', '3', 'showtitle:true,showspectitle:true,showsuftitle:true,chatcolor:true', 'http://fc05.deviantart.net/fs71/i/2012/339/c/8/avenged_sevenfold___logo__1__png__deathbat_by_lightsinaugust-d5klaeb.png', 'Premium Betatester', '', 4),
(4, 'player4', 'player4', '', 'Player', '4', '', 'http://img.pandawhale.com/post-21462-E3-in-a-nutshell-gif-JGL-bike-0r97.gif', 'Betatester', '', 0),
(5, 'player5', 'player5', '', 'Player', '5', 'showtitle:,showspectitle:,showsuftitle:,chatcolor:true', '', 'Betatester', '', 0),
(6, 'player6', 'player6', '', 'Player', '6', 'showtitle:true,showspectitle:false,showsuftitle:true,chatcolor:true', '', 'Betatester', '', 14),
(8, 'player8', 'player8', '', 'Player', '8', 'showtitle:true,showspectitle:false,showsuftitle:false,chatcolor:true', 'http://i.imgur.com/vq4p4J7.gif', 'Schepper', '', 18),
(9, 'player9', 'player9', '', 'Player', '9', 'showtitle:true,showspectitle:true,showsuftitle:true,chatcolor:true', 'https://global3.memecdn.com/goddammit-moon-moon_fb_2418393.jpg', 'Betatester', '', 3),
(10, 'player10', 'player10', '', 'Player', '10', 'showtitle:true,showspectitle:,showsuftitle:,chatcolor:true', '', 'Betatester', '', 12),
(11, 'player11', 'player11', '', 'Player', '11', 'showtitle:,showspectitle:,showsuftitle:true,chatcolor:', 'http://i.imgur.com/KqmKxaP.gif?1', 'Betatester', '', 1),
(12, 'player12', 'player12', '', 'Player', '12', 'showtitle:true,showspectitle:true,showsuftitle:true,chatcolor:true', 'http://www.open-source-embroidery.org.uk/wiki/lib/exe/fetch.php?cache=cache&media=hex:666666.png', 'Betatester', '', 2),
(13, 'player13', 'player13', '', 'Player', '13', 'showtitle:,showspectitle:true,showsuftitle:,chatcolor:true', 'http://24.media.tumblr.com/b1766fe23a733b9a62418f111e7a170f/tumblr_mie0tjPNZb1risb5no1_1280.png', 'Premium Betatester', '', 23),
(16, 'player16', 'player16', '', 'Player', '16', 'showtitle:true,showspectitle:true,showsuftitle:true,chatcolor:true', 'http://www.fact.co.uk/media/494868/a_clockwork_orange_3.jpg', 'Premium Betaster', '', 0),
(14, 'player14', 'player14', '', 'Player', '14', '', '', 'Betatester', '', 0),
(17, 'player17', 'player17', '', 'Player', '17', 'showtitle:true,showspectitle:true,showsuftitle:true,chatcolor:true', '', 'Betatester', '', 0),
(15, 'player15', 'player15', '', 'Player', '15', '', '', 'Betatester', '', 0),
(20, 'player20', 'player20', '', 'Player', '20', 'showtitle:,showspectitle:,showsuftitle:,chatcolor:', 'http://2.bp.blogspot.com/-hDtKRxzX_Bk/Tq681Nah0ZI/AAAAAAAAPsU/VyYR1Z8Sz-s/s1600/Mooie-sneeuwpop-achtergronden-leuke-hd-sneeuwpop-wallpapers-afbeelding-plaatje-4.jpg', 'Betatester', '', 17),
(22, 'player22', 'player22', '', 'Player', '22', 'showtitle:true,showspectitle:true,showsuftitle:true,chatcolor:true', 'http://gifs.gifbin.com/042009/1240479616_cock_vs_pussy.gif', 'Betatester', '', 9),
(24, 'player24', 'player24', '', 'Player', '24', '', 'http://www.recroninnovatiecampagne.nl/cmslib/www.recroninnovatiecampagne.nl/gastvrijnl/webshop/KenuwGast.jpg', '', '', 0),
(28, 'player28', 'player28', '', 'Player', '28', 'showtitle:,showspectitle:,showsuftitle:,chatcolor:', '', '', '', 0),
(27, 'player27', 'player27', '', 'Player', '27', 'showtitle:,showspectitle:,showsuftitle:,chatcolor:', '', '', '', 0),
(29, 'player29', 'player29', '', 'Player', '29', 'showtitle:,showspectitle:,showsuftitle:,chatcolor:true', 'http://www.nerdtests.com/picsarea/c7975dc9584871ad81bb16c77587107c.jpg', '', '', 0),
(30, 'player30', 'player30', '', 'Player', '30', 'showtitle:,showspectitle:,showsuftitle:,chatcolor:', 'http://i.pinger.pl/pgr384/1964fe350000ced44d1dc8c3/p1.gif', '', '', 0),
(31, 'player31', 'player31', '', 'Player', '31', '', '', '', '', 0),
(33, 'player33', 'player33', '', 'Player', '33', '', 'http://static4.wikia.nocookie.net/__cb20120605015935/gameofthrones/images/c/c7/White_Walker_2x10.jpg', '', '', 0),
(34, 'player34', 'player34', '', 'Player', '34', 'showtitle:true,showspectitle:true,showsuftitle:true,chatcolor:', '', '', '', 0),
(35, 'player35', 'player35', '', 'Player', '35', '', '', '', '', 0),
(36, 'player36', 'player36', '', 'Player', '36', 'showtitle:true,showspectitle:true,showsuftitle:true,chatcolor:true', 'http://s22.postimg.org/uhaazqh41/kaasschaaf1.jpg', '', '', 0),
(37, 'player37', 'player37', '', 'Player', '37', '', '', '', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `players_europa`
--

CREATE TABLE `players_europa` (
  `id` int(11) NOT NULL,
  `color` text NOT NULL,
  `money` int(11) NOT NULL,
  `money_new` int(11) NOT NULL,
  `trade` text NOT NULL,
  `bg` text NOT NULL,
  `intro` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `players_europa`
--

INSERT INTO `players_europa` (`id`, `color`, `money`, `money_new`, `trade`, `bg`, `intro`) VALUES
(12, '#666666', 0, 0, '12,13,2,20,9,10', '12,13,20,8,2', 1),
(6, '#ff9900', 27533, 27533, '6,22,9,2', '6', 0),
(20, '#330000', 81180, 81180, '20,8,13,9,6,12,2,10', '20', 1),
(9, '#336699', 19142, 19142, '9,22,20,12,10', '9', 1),
(22, '#ff33cc', 27528, 27528, '22,6,20,10,8', '22', 1),
(2, '#000033', 0, 0, '2,12,6,20,9,22,13,11,10,8', '2,12', 1),
(13, '#cc9900', 84534, 84534, '13,20,12,2,10,11,8,9,22,6', '13,12', 0),
(11, '#ff00cc', 249976, 249976, '11,10,8,13', '11,8', 1),
(10, '#0099cc', 75036, 75036, '10,8,11,13,22,20,2,12,9', '10', 1),
(8, '#cc0000', 6254, 6254, '8,20,22,10,13,6,12,9,11,2', '8,6,10,12,20,9,22,2,13,11', 1);

-- --------------------------------------------------------

--
-- Table structure for table `players_europa2`
--

CREATE TABLE `players_europa2` (
  `id` int(11) NOT NULL,
  `color` text NOT NULL,
  `money` int(11) NOT NULL,
  `money_new` int(11) NOT NULL,
  `trade` text NOT NULL,
  `bg` text NOT NULL,
  `intro` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `players_europa2`
--

INSERT INTO `players_europa2` (`id`, `color`, `money`, `money_new`, `trade`, `bg`, `intro`) VALUES
(34, '#cccccc', 51114, 51114, '34', '34', 1),
(8, '#660000', 3389, 3389, '8', '8', 1),
(13, '#cc9900', 104015, 104015, '13,20,34,8,3,2,10,22,9', '13', 1),
(20, '#00ffcc', 71051, 71051, '20,13,2,8,22,10', '20,2', 1),
(2, '#cc0000', 58171, 58171, '2,34,8,13,20,22,3,9,11,10', '2,20', 1),
(22, '#ff33cc', 52355, 52355, '22,34,3', '22,34,3', 1),
(3, '#00ff00', 55550, 55550, '3,22', '3', 1),
(9, '#ff6600', 51788, 51788, '9', '9', 1),
(11, '#0000ff', 65732, 65732, '11,9,2,3', '11', 1),
(10, '#0099cc', 102286, 102286, '10,13,3,11,2', '10', 1);

-- --------------------------------------------------------

--
-- Table structure for table `players_groningen`
--

CREATE TABLE `players_groningen` (
  `id` int(11) NOT NULL,
  `color` text NOT NULL,
  `money` int(11) NOT NULL,
  `money_new` int(11) NOT NULL,
  `trade` text NOT NULL,
  `bg` text NOT NULL,
  `intro` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `players_groningen`
--

INSERT INTO `players_groningen` (`id`, `color`, `money`, `money_new`, `trade`, `bg`, `intro`) VALUES
(13, '#cc9900', 6372, 6372, '13,10,8,20,22', '13', 1),
(8, '#cc0000', 4000, 4000, '8', '8', 1),
(10, '#0099cc', 1013, 1013, '10,20,13', '10', 1),
(20, '#00ffcc', 2094, 2094, '20,13,22', '20', 1),
(22, '#cccccc', 4089, 89, '22,20,13', '22', 1);

-- --------------------------------------------------------

--
-- Table structure for table `players_nederland`
--

CREATE TABLE `players_nederland` (
  `id` int(11) NOT NULL,
  `color` text NOT NULL,
  `money` int(11) NOT NULL,
  `money_new` int(11) NOT NULL,
  `trade` text NOT NULL,
  `bg` text NOT NULL,
  `intro` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `players_nederland`
--

INSERT INTO `players_nederland` (`id`, `color`, `money`, `money_new`, `trade`, `bg`, `intro`) VALUES
(8, '#ccff00', 145842260, 145842260, '8', '8', 1),
(2, '#ff00ee', 61714553, 61714553, '2', '2', 1),
(13, '#cc9900', 102230235, 102230235, '13', '13', 1),
(20, '#00ffcc', 95906902, 95906902, '20', '20', 1),
(10, '#339966', 102498864, 102498864, '10', '10', 1),
(12, '#6666ff', 100340336, 100340336, '12,2,11,6,8,27,33', '12', 1),
(9, '#333333', 102239130, 102239130, '9', '9', 1),
(36, '#66ccff', 103050354, 103050354, '36', '36', 1),
(11, '#ccffcc', 103146420, 103146420, '11', '11', 1),
(33, '#99cc33', 101686376, 101686376, '33', '33', 1),
(27, '#33ff33', 102326528, 102326528, '27', '27', 1),
(6, '#cc0000', 101556793, 101556793, '6', '6', 1),
(21, '#33ccff', 102632289, 102632289, '21', '21', 1);

-- --------------------------------------------------------

--
-- Table structure for table `players_provgron`
--

CREATE TABLE `players_provgron` (
  `id` int(11) NOT NULL,
  `color` text NOT NULL,
  `money` int(11) NOT NULL,
  `money_new` int(11) NOT NULL,
  `trade` text NOT NULL,
  `bg` text NOT NULL,
  `intro` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `players_provgron`
--

INSERT INTO `players_provgron` (`id`, `color`, `money`, `money_new`, `trade`, `bg`, `intro`) VALUES
(13, '#cc9900', 531973, 531973, '13,10,36,2,22,20', '13', 1),
(2, '#cc6600', 73730, 73730, '2,13,10,12,36,22,37,20', '2', 1),
(10, '#0099cc', 59465, 59465, '10,2,12,13,36', '10', 1),
(12, '#666666', 8340, 8340, '12,36', '12,36', 1),
(36, '#003300', 0, 0, '36,22,12,13,2,10', '36,12', 1),
(22, '#ccff33', 37180, 37180, '22', '22', 1),
(37, '#cccccc', 40974, 40974, '37', '37,12', 1),
(20, '#00ffcc', 419846, 419846, '20,22,37,13', '20', 1);

-- --------------------------------------------------------

--
-- Table structure for table `players_usa`
--

CREATE TABLE `players_usa` (
  `id` int(11) NOT NULL,
  `color` text NOT NULL,
  `money` int(11) NOT NULL,
  `money_new` int(11) NOT NULL,
  `trade` text NOT NULL,
  `bg` text NOT NULL,
  `intro` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `players_usa`
--

INSERT INTO `players_usa` (`id`, `color`, `money`, `money_new`, `trade`, `bg`, `intro`) VALUES
(22, '#ff33ff', 32201, 32201, '22', '22', 1),
(12, '#666666', 4314, 4314, '12,9,22,2', '12,9', 1),
(9, '#ffff33', 21630, 21630, '9,12', '9,12', 1),
(2, '#ffff00', 20267, 20267, '2,22,12,9,13,8,10,20', '2', 1),
(13, '#cc9900', 964730, 964730, '13,8,20,2,12', '13,8,20', 1),
(8, '#cc0000', 252134, 252134, '8,13,20,10', '8,13,20', 1),
(10, '#0099cc', 28190, 28190, '10,20,8', '10', 1),
(20, '#00ffcc', 317416, 317416, '20,10,8,13,22,2', '20,13,8', 1);

-- --------------------------------------------------------

--
-- Table structure for table `players_wereld`
--

CREATE TABLE `players_wereld` (
  `id` int(11) NOT NULL,
  `color` text NOT NULL,
  `money` int(11) NOT NULL,
  `money_new` int(11) NOT NULL,
  `trade` text NOT NULL,
  `bg` text NOT NULL,
  `intro` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `players_wereld`
--

INSERT INTO `players_wereld` (`id`, `color`, `money`, `money_new`, `trade`, `bg`, `intro`) VALUES
(6, '#ff9900', 22997, 22997, '6,2,20,34,3,11', '6,2,11', 0),
(20, '#00ffcc', 1704658, 1704658, '20,10,3,34,2,29,11,8,13,22,6', '20,10,2,13', 1),
(10, '#0099cc', 372368, 372368, '10,9,22,20,29,11', '10,20,29', 1),
(34, '#330033', 214512, 214512, '34,22', '34,22', 1),
(11, '#0000ff', 49866, 49866, '11,9,2,8,6', '11,6', 0),
(2, '#cc0000', 3411365, 3411365, '2,6,10,34,11,8,3,29,22,9', '2,20,13', 1),
(8, '#663300', 72306, 72306, '8,13,2,11,3', '8,6', 1),
(3, '#00ff00', 783, 783, '3', '3', 1),
(29, '#990066', 169638, 169638, '29,10,3,22,2', '29,10,2', 1),
(13, '#cc9900', -369504, -369504, '13,11,9,8,3,2,22,10,20', '13,20,2', 1),
(9, '#ff3300', 131232, 131232, '9,13,11', '9', 1),
(22, '#ff33cc', 2754, 2754, '22,10,13,9,29,20,11', '22,11', 1);

-- --------------------------------------------------------

--
-- Table structure for table `players_westeros`
--

CREATE TABLE `players_westeros` (
  `id` int(11) NOT NULL,
  `color` text NOT NULL,
  `money` int(11) NOT NULL,
  `money_new` int(11) NOT NULL,
  `trade` text NOT NULL,
  `bg` text NOT NULL,
  `intro` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `players_westeros`
--

INSERT INTO `players_westeros` (`id`, `color`, `money`, `money_new`, `trade`, `bg`, `intro`) VALUES
(2, '#000033', 283045, 283045, '2,12,9,10,20,36,22,13,33', '2,33', 1),
(12, '#666666', 20301, 20301, '12,20,9,13,2,10', '12,36', 1),
(9, '#ff99cc', 3280, 3280, '9,12,22,10', '9', 1),
(10, '#cc9900', 162410, 162410, '10,9,22,13,2,12', '10', 1),
(20, '#00ffcc', 32320, 32320, '20,9,12,22,2,36,13', '20,13', 1),
(36, '#ff00ff', 3294, 3294, '36,20,22,13', '36,12', 1),
(22, '#ff66ff', 7272, 7272, '22,36', '22', 1),
(13, '#ff9900', 2070927, 2070927, '13,22,36,2,10,20,9,12', '13,20', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` text NOT NULL,
  `name` text NOT NULL,
  `mapname` text NOT NULL,
  `startconfig` text NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `paused` tinyint(4) NOT NULL DEFAULT '0',
  `rating` text NOT NULL,
  `required` int(11) NOT NULL,
  `params` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `name`, `mapname`, `startconfig`, `active`, `paused`, `rating`, `required`, `params`) VALUES
('europa', 'Europa', 'europe_mill_en', 'europa', 1, 1, '3,2,1', 1, 'backgroundColor: \'#776677\''),
('europa2', 'Europa 2', 'europe_mill_en', 'europa', 1, 1, '3,2,1', 0, 'backgroundColor: \'#776677\''),
('wereld', 'Wereld', 'world_mill_en', 'wereld', 1, 1, '4,3,2', 0, 'backgroundColor: \'#776677\''),
('usa', 'USA', 'us_aea_en', 'usa', 1, 1, '2,1,1', 0, 'backgroundColor: \'#776677\''),
('groningen', 'Groningen', 'groningen_merc_nl', 'groningen', 0, 1, '1,0,0', 1, 'backgroundColor: \'#776677\''),
('westeros', 'Westeros', 'westeros_merc_en', 'westeros', 1, 1, '3,2,1', 0, 'backgroundColor: \'#FFB870\',zoomMin: 2.5,focusOn:{scale: 2.5,x: 0.5,y: 0.5,}'),
('provgron', 'Groningen', 'provgron_merc_nl', 'provgron', 1, 1, '3,2,1', 0, 'backgroundColor: \'#776677\''),
('nederland', 'Nederland', 'nederland_merc_nl', 'nederland', 1, 0, '5,3,2', 0, 'backgroundColor: \'#776677\',\nregionStyle: {\n  initial: {\n    fill: \'white\',\n    \"fill-opacity\": 1,\n    stroke: \'#776677\',\n    \"stroke-width\": 0.3,\n    \"stroke-opacity\": 1\n  },\n  hover: {\n    \"fill-opacity\": 0.8\n  },\n  selected: {\n    fill: \'yellow\'\n  },\n  selectedHover: {\n  }\n}'),
('europa-speed', 'Europa SPEED', 'europa_mill_nl', 'europa', 1, 1, '0,0,0', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `subs_europa`
--

CREATE TABLE `subs_europa` (
  `n` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `type` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subs_europa`
--

INSERT INTO `subs_europa` (`n`, `id`, `type`) VALUES
(1, 13, 'sub'),
(2, 22, 'sub'),
(3, 10, 'sub'),
(4, 6, 'sub'),
(5, 3, 'intro'),
(6, 12, 'sub'),
(7, 2, 'sub'),
(8, 20, 'sub'),
(9, 8, 'sub');

-- --------------------------------------------------------

--
-- Table structure for table `subs_europa2`
--

CREATE TABLE `subs_europa2` (
  `n` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `type` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subs_europa2`
--

INSERT INTO `subs_europa2` (`n`, `id`, `type`) VALUES
(1, 20, 'sub'),
(2, 13, 'sub'),
(3, 22, 'sub'),
(4, 2, 'sub'),
(5, 10, 'sub'),
(6, 8, 'sub'),
(7, 12, 'sub'),
(8, 36, 'sub');

-- --------------------------------------------------------

--
-- Table structure for table `subs_groningen`
--

CREATE TABLE `subs_groningen` (
  `n` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `type` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subs_groningen`
--

INSERT INTO `subs_groningen` (`n`, `id`, `type`) VALUES
(1, 22, 'sub'),
(2, 2, 'sub'),
(3, 13, 'sub');

-- --------------------------------------------------------

--
-- Table structure for table `subs_nederland`
--

CREATE TABLE `subs_nederland` (
  `n` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `type` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subs_nederland`
--

INSERT INTO `subs_nederland` (`n`, `id`, `type`) VALUES
(1, 13, 'sub'),
(2, 20, 'sub'),
(3, 8, 'sub');

-- --------------------------------------------------------

--
-- Table structure for table `subs_provgron`
--

CREATE TABLE `subs_provgron` (
  `n` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `type` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subs_provgron`
--

INSERT INTO `subs_provgron` (`n`, `id`, `type`) VALUES
(1, 10, 'sub'),
(2, 12, 'sub'),
(3, 13, 'sub'),
(4, 22, 'sub'),
(5, 20, 'sub');

-- --------------------------------------------------------

--
-- Table structure for table `subs_usa`
--

CREATE TABLE `subs_usa` (
  `n` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `type` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subs_usa`
--

INSERT INTO `subs_usa` (`n`, `id`, `type`) VALUES
(1, 8, 'sub'),
(2, 10, 'sub'),
(3, 22, 'sub'),
(4, 13, 'sub'),
(5, 20, 'sub');

-- --------------------------------------------------------

--
-- Table structure for table `subs_wereld`
--

CREATE TABLE `subs_wereld` (
  `n` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `type` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subs_wereld`
--

INSERT INTO `subs_wereld` (`n`, `id`, `type`) VALUES
(1, 13, 'sub'),
(2, 6, 'sub'),
(3, 2, 'sub'),
(4, 11, 'sub'),
(5, 8, 'sub'),
(6, 20, 'sub'),
(7, 22, 'sub'),
(8, 10, 'sub'),
(9, 12, 'sub'),
(10, 36, 'sub'),
(11, 16, 'sub');

-- --------------------------------------------------------

--
-- Table structure for table `subs_westeros`
--

CREATE TABLE `subs_westeros` (
  `n` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `type` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subs_westeros`
--

INSERT INTO `subs_westeros` (`n`, `id`, `type`) VALUES
(1, 10, 'sub'),
(2, 13, 'sub'),
(3, 22, 'sub'),
(4, 20, 'sub');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `log`
--
ALTER TABLE `log`
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `map_europa`
--
ALTER TABLE `map_europa`
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `map_europa2`
--
ALTER TABLE `map_europa2`
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `map_groningen`
--
ALTER TABLE `map_groningen`
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `map_nederland`
--
ALTER TABLE `map_nederland`
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `map_provgron`
--
ALTER TABLE `map_provgron`
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `map_usa`
--
ALTER TABLE `map_usa`
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `map_wereld`
--
ALTER TABLE `map_wereld`
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `map_westeros`
--
ALTER TABLE `map_westeros`
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `players_europa`
--
ALTER TABLE `players_europa`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `players_europa2`
--
ALTER TABLE `players_europa2`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `players_groningen`
--
ALTER TABLE `players_groningen`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `players_nederland`
--
ALTER TABLE `players_nederland`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `players_provgron`
--
ALTER TABLE `players_provgron`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `players_usa`
--
ALTER TABLE `players_usa`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `players_wereld`
--
ALTER TABLE `players_wereld`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `players_westeros`
--
ALTER TABLE `players_westeros`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subs_europa`
--
ALTER TABLE `subs_europa`
  ADD PRIMARY KEY (`n`),
  ADD UNIQUE KEY `n` (`n`),
  ADD UNIQUE KEY `n_2` (`n`);

--
-- Indexes for table `subs_europa2`
--
ALTER TABLE `subs_europa2`
  ADD PRIMARY KEY (`n`),
  ADD UNIQUE KEY `n` (`n`),
  ADD UNIQUE KEY `n_2` (`n`);

--
-- Indexes for table `subs_groningen`
--
ALTER TABLE `subs_groningen`
  ADD PRIMARY KEY (`n`),
  ADD UNIQUE KEY `n` (`n`),
  ADD UNIQUE KEY `n_2` (`n`);

--
-- Indexes for table `subs_nederland`
--
ALTER TABLE `subs_nederland`
  ADD PRIMARY KEY (`n`),
  ADD UNIQUE KEY `n` (`n`),
  ADD UNIQUE KEY `n_2` (`n`);

--
-- Indexes for table `subs_provgron`
--
ALTER TABLE `subs_provgron`
  ADD PRIMARY KEY (`n`),
  ADD UNIQUE KEY `n` (`n`),
  ADD UNIQUE KEY `n_2` (`n`);

--
-- Indexes for table `subs_usa`
--
ALTER TABLE `subs_usa`
  ADD PRIMARY KEY (`n`),
  ADD UNIQUE KEY `n` (`n`),
  ADD UNIQUE KEY `n_2` (`n`);

--
-- Indexes for table `subs_wereld`
--
ALTER TABLE `subs_wereld`
  ADD PRIMARY KEY (`n`),
  ADD UNIQUE KEY `n` (`n`),
  ADD UNIQUE KEY `n_2` (`n`);

--
-- Indexes for table `subs_westeros`
--
ALTER TABLE `subs_westeros`
  ADD PRIMARY KEY (`n`),
  ADD UNIQUE KEY `n` (`n`),
  ADD UNIQUE KEY `n_2` (`n`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `log`
--
ALTER TABLE `log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `players`
--
ALTER TABLE `players`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `subs_europa`
--
ALTER TABLE `subs_europa`
  MODIFY `n` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `subs_europa2`
--
ALTER TABLE `subs_europa2`
  MODIFY `n` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `subs_groningen`
--
ALTER TABLE `subs_groningen`
  MODIFY `n` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `subs_nederland`
--
ALTER TABLE `subs_nederland`
  MODIFY `n` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `subs_provgron`
--
ALTER TABLE `subs_provgron`
  MODIFY `n` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `subs_usa`
--
ALTER TABLE `subs_usa`
  MODIFY `n` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `subs_wereld`
--
ALTER TABLE `subs_wereld`
  MODIFY `n` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `subs_westeros`
--
ALTER TABLE `subs_westeros`
  MODIFY `n` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
