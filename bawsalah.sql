-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 26, 2025 at 03:33 PM
-- Server version: 5.7.24
-- PHP Version: 8.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bawsalah`
--

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `userID` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userID`);

  
--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `categoryID` int(12) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`categoryID`, `name`) VALUES
(1, 'Accommodations'),
(2, 'Cafés & Resturants'),
(3, 'Adventures');

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `cityID` int(12) NOT NULL,
  `name` varchar(50) NOT NULL,
  `image` varchar(255) NOT NULL,
  `countryID` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`cityID`, `name`, `image`, `countryID`) VALUES
(1, 'Al-Ula', 'al-ula.jpg\r\n', 1),
(2, 'Riyadh', 'riyadh.jpg', 1),
(3, 'Jeddah', 'jeddah.webp', 1),
(4, 'Abu Dhabi', 'abu dhabi.webp', 2),
(5, 'Dubai', 'dubai.jpeg', 2),
(6, 'Al-Sharjah', 'sharjah.jpg', 2),
(7, 'Doha', 'doha.jpg', 3),
(8, 'Kuwait', 'kuwait.png', 5),
(9, 'Salalah', 'salalah.jpg', 6),
(10, 'Manama', 'bahrain.jpg', 4);

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `countryID` int(12) NOT NULL,
  `name` varchar(60) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`countryID`, `name`, `image`) VALUES
(1, 'Kingdom of Saudi Arabia', 'Saudi.jpg'),
(2, 'United Arab Emarites', 'Emarites.jpg'),
(3, 'Qatar', 'qatar.jpg'),
(4, 'Bahrain', 'bahrain.jpg'),
(5, 'Kuwait', 'kuwait.png'),
(6, 'Oman', 'oman.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `destination`
--

CREATE TABLE `destination` (
  `destinationID` int(12) NOT NULL,
  `name` varchar(60) NOT NULL,
  `image` varchar(255) NOT NULL,
  `categoryID` int(12) NOT NULL,
  `cityID` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `destination`
--

INSERT INTO `destination` (`destinationID`, `name`, `image`, `categoryID`, `cityID`) VALUES
(1, 'Self-Camping at Pangaea Centre', 'camp.webp', 1, 1),
(2, 'Ashar Tented Resort', 'ashar.webp', 1, 1),
(3, 'Banyan Tree AlUla', 'banyan.webp', 1, 1),
(4, 'Caravan by Habitas', 'caravan.webp', 1, 1),
(5, 'Saffron', 'saffron.webp', 2, 1),
(6, 'Tama', 'tama.webp', 2, 1),
(7, 'Maqha Café ', 'maqha.webp', 2, 1),
(8, 'Charcood', 'charcood.webp', 2, 1),
(9, 'Old Town', 'old-town.webp', 3, 1),
(10, 'Harrat Viewpoint', 'harrat.webp', 3, 1),
(11, 'Dandan Culinary Arts Center', 'dandan.webp', 3, 1),
(12, 'Elephant Rock', 'al-ula.jpg', 3, 1),
(13, 'Banana Island Resort Doha', 'banana-island.webp', 1, 7),
(14, 'The Ritz-Carlton Sharq Village', 'sharq-village.webp', 1, 7),
(15, 'Four Seasons Hotel', '4seasons.webp', 1, 7),
(16, 'La Cigale Hotel', 'cigale.webp', 1, 7),
(17, 'Three Sixty - The Torch', 'three-sixty.webp', 2, 7),
(18, 'Bayt El Talleh', 'bayt-el-talleh.webp', 2, 7),
(19, 'Chapati and Karak', 'chapati-and-karak.webp', 2, 7),
(20, 'Nobu Doha', 'nobu.webp', 2, 7),
(21, 'Doha Golf Club', 'doha-golf-club.webp', 3, 7),
(22, 'The Corniche', 'corniche.webp', 3, 7),
(23, 'Doha Quest', 'quest.webp', 3, 7),
(24, 'Angry Birds World', 'themeparks.webp', 3, 7),
(25, 'Bab Al Nojoum Bateen Liwa', 'bab.webp', 1, 4),
(26, 'Millennium Capital Gate Abu Dhabi', 'millennium .webp', 1, 4),
(27, 'Anantara Eastern Mangroves Abu Dhabi Hotel', 'anantara.webp', 1, 4),
(28, 'Liwa Hotel', 'liwa.webp', 1, 4),
(29, 'Maté ', 'mate.webp', 2, 4),
(30, 'Cyan Brasserie', 'cyan.webp', 2, 4),
(31, 'McGettigan\'s', 'mc.webp', 2, 4),
(32, 'The Director\'s Club', 'director.webp', 2, 4),
(33, 'Yas Waterworl Anu Dhabi', 'yas.webp', 3, 4),
(34, 'Al Fay Park', 'fay.webp', 3, 4),
(35, 'KidZania Abu Dhabi', 'kidzania.webp', 3, 4),
(36, 'Al Jimi Oasis', 'jim.webp', 3, 4),
(37, 'Al Seef Heritage Hotel Dubai, Curio Collection by Hilton', 'alseef.avif', 1, 5),
(38, 'Vida Dubai Mall', 'vida.avif', 1, 5),
(39, 'Mama Shelter Dubai', 'mama.avif', 1, 5),
(40, 'Five Luxe', 'five.avif', 1, 5),
(41, 'Bella', 'bella.avif', 2, 5),
(42, 'Kulture House', 'kulture.jpeg', 2, 5),
(43, 'Shabestan', 'shabestan.avif', 2, 5),
(44, 'Itadaku', 'itadaku.avif', 2, 5),
(45, 'Thw Dubai Balloon', 'balloon.avif', 3, 5),
(46, 'Theatre of Digital Art', 'digital.avif', 3, 5),
(47, 'Jumeirah Marsa Al Arab', 'marsa.avif', 3, 5),
(48, 'O Beach Dubai', 'beach.avif', 3, 5),
(49, 'Tulip In Al Khan Hotel', 'tulip.png', 1, 6),
(50, ' The Chedi Al Bait Sharjah Hotel', 'chedi.png', 1, 6),
(51, 'Kingfisher Retreat', 'kingfisher.png', 1, 6),
(52, 'Centro Sharjah Hotel', 'centro.png', 1, 6),
(53, 'Chie', 'chie.png', 2, 6),
(54, 'Beit Setti', 'beit.png', 2, 6),
(55, 'Link  Café ', 'link.png', 2, 6),
(56, 'Black Salt', 'black.png', 2, 6),
(57, 'Sharjah Mosque', 'smosque.jpg', 3, 6),
(58, 'Sharjah Academy for Astronomy, Space Sciences and Technology', 'astronomy.png', 3, 6),
(59, 'Sharjah Equestrian & Racing Club', 'racing.jpeg', 3, 6),
(60, 'Al Rafisah Hiking Trail', 'rafisah.png', 3, 6),
(61, 'The Merchant House', 'merchant.webp', 1, 10),
(62, 'The Gulf Hotel Bahrain Convention & Spa', 'gulf.webp', 1, 10),
(63, 'Swiss-Belsuites Admiral Juffair', 'swiss.webp', 1, 10),
(64, 'La Meridian City Center', 'meridian.webp', 1, 10),
(65, 'CUT by Wolfgang Puck', 'CUT.webp', 2, 10),
(66, 'Monsoon', 'monsoon.webp', 2, 10),
(67, 'Darseen Cafe', 'darseen.webp', 2, 10),
(68, 'Haji\'s Cafe', 'haji.webp', 2, 10),
(69, 'Albareh Art Gallery', 'albareh.webp', 3, 10),
(70, 'Bahrain Fort', 'fort.webp', 3, 10),
(71, 'Bahrain National Museum', 'BNM.webp', 3, 10),
(72, 'Reef Clubhouse and Lagoon Beach', 'lagoon.webp', 3, 10),
(73, 'Crowne Plaza Resort Salalah', 'crowne.jpeg', 1, 9),
(74, 'Fanar Hotel and Residences', 'fanar.jpeg', 1, 9),
(75, 'Souly Ecolodge', 'souly.jpeg', 1, 9),
(76, 'Al Baleed Resort Salalah by Anantara', 'baleed.jpeg', 1, 9),
(77, 'As Sammak Seafood Resturant', 'assamak.jpeg', 2, 9),
(78, 'Oasis Club', 'oasis.jpeg', 2, 9),
(79, 'Al Khareef Pub', 'khareef.jpeg', 2, 9),
(80, 'Golden Lobster', 'golden.jpeg', 2, 9),
(81, 'Wadi Darbat', 'wadi.jpeg', 3, 9),
(82, 'Al Mughsail Beach', 'mughsail.jpeg', 3, 9),
(83, 'Manreef Cave', 'cave.jpeg', 3, 9),
(84, 'Sumhuram Old City', 'sumhuram.jpeg', 3, 9),
(85, 'Waldorf Astoria Kuwait', 'waldorf.jpeg', 1, 8),
(86, 'Mövenpick Hotel & Resort Al Bida\'a Kuwait', 'bida.jpeg', 1, 8),
(87, 'The Regency Hotel Kuwait', 'regency.jpeg', 1, 8),
(88, 'Jumeirah Messilah Beach', 'messilah.jpeg', 1, 8),
(89, 'Blendz', 'blendz.jpeg', 2, 8),
(90, 'Horizon - Kuwait Towers Resturant', 'horizon.jpeg', 2, 8),
(91, 'Soul and Spice', 'soul.jpeg', 2, 8),
(92, 'Mais Alghanim', 'mais.jpeg', 2, 8),
(93, 'Kuwait Towers', 'towers.jpeg', 3, 8),
(94, 'Grand Mosque', 'grand.jpeg', 3, 8),
(95, 'Mirror House', 'mirror.jpeg', 3, 8),
(96, '360 Mall', '360.jpeg', 3, 8),
(97, 'Narcissus Hotel & Spa Riyadh', 'narcissus.jpeg', 1, 2),
(98, 'Sheraton Riyadh Hotel & Towers', 'sheraton.jpeg', 1, 2),
(99, 'Fairmont Riyadh', 'fairmont.jpeg', 1, 2),
(100, 'InterContinental Riyadh', 'inter.jpeg', 1, 2),
(101, 'Sultan\'s Steakhouse Riyadh', 'sultan.jpeg', 2, 2),
(102, 'The Globe', 'globe.jpeg', 2, 2),
(103, 'Myazu', 'myazu.jpeg', 2, 2),
(104, 'Cafe Bateel', 'bateel.jpeg', 2, 2),
(105, 'Kingdom Centre Tower', 'kingdom.jpeg', 3, 2),
(106, 'Edge of The World', 'edge.jpeg', 3, 2),
(107, 'Al Masmak Fortress', 'fortress.jpeg', 3, 2),
(108, 'Al Rajhi Mosque', 'rajhi.jpeg', 3, 2),
(109, 'Movenpick Hotel Tahlia Jeddah', 'mhotel.jpeg', 1, 3),
(110, 'InterContinental Jeddah', 'intercontinental.jpeg', 1, 3),
(111, 'Four Points by Sheraton', 'fourpoints.jpeg', 1, 3),
(112, 'The Ritz-carlton Jeddah', 'jritz.jpeg', 1, 3),
(113, 'Swiss Butter', 'butter.jpeg', 2, 3),
(114, 'Twenty Four Restaurant', '24.jpeg', 2, 3),
(115, 'Caffe Aroma', 'aroma.jpeg', 2, 3),
(116, 'Reyhana', 'reyhana.jpeg', 2, 3),
(117, 'Al-Balad', 'balad.jpeg', 3, 3),
(118, 'Red Sea Mall', 'redseamall.jpeg', 3, 3),
(119, 'Al Rahma Mosque', 'rahma.jpeg', 3, 3),
(120, 'Nassif House Museum ', 'nassif.jpeg', 3, 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`categoryID`);

--
-- Indexes for table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`cityID`),
  ADD KEY `countryID` (`countryID`);

--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`countryID`);

--
-- Indexes for table `destination`
--
ALTER TABLE `destination`
  ADD PRIMARY KEY (`destinationID`),
  ADD KEY `categoryID` (`categoryID`),
  ADD KEY `cityID` (`cityID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `city`
--
ALTER TABLE `city`
  ADD CONSTRAINT `city_ibfk_1` FOREIGN KEY (`countryID`) REFERENCES `country` (`countryID`);

--
-- Constraints for table `destination`
--
ALTER TABLE `destination`
  ADD CONSTRAINT `destination_ibfk_1` FOREIGN KEY (`categoryID`) REFERENCES `category` (`categoryID`),
  ADD CONSTRAINT `destination_ibfk_2` FOREIGN KEY (`cityID`) REFERENCES `city` (`cityID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
