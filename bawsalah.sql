-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 09, 2025 at 01:33 PM
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
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `categoryID` int(11) NOT NULL,
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
  `cityID` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `image` varchar(255) NOT NULL,
  `countryID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`cityID`, `name`, `description`, `image`, `countryID`) VALUES
(1, 'Al-Ula', 'AlUla stands with two other great oases in northwest Arabia - Khaybar and Tayma - to create a place of profound history that is continuously evolving. Its strategic position has, throughout millenia, made it a crucial hub for trade, and its distinct geographical features, such as the famed oasis and imposing sandstone mountains, combined with its favourable climate, allowed numerous civilisations to thrive. Those who visit now embark on an authentic journey, travelling back in time, surrounded by wonders and a sense of discovery.', 'al-ula.jpg\r\n', 1),
(2, 'Riyadh', 'Riyadh combines ancient history with modern dynamism, offering a glimpse into Arabia’s past and future. Explore the city\'s rich heritage through souqs, museums, and historical architecture, and experience its modern side with high-rises and a thriving art scene, highlighted by the Riyadh Art initiative that turns the city into an open-air gallery. Don\'t miss Riyadh Season, featuring themed zones like Boulevard City and the Riyadh Zoo, open year-round. For dining, try local delicacies at Najd Village restaurant.  ', 'riyadh.jpg', 1),
(3, 'Jeddah', 'Experience the charm of Jeddah\'s heritage as you wander through the historic streets of Al Balad. Discover a shopping paradise at the Mall of Arabia and Red Sea Mall. Dive into the refreshing waters of the Red Sea or take a leisurely stroll along the Jeddah Corniche. Don\'t miss the spectacular King Fahd Fountain, a marvel that shoots water 312 meters into the sky.', 'jeddah.webp', 1),
(4, 'Abu Dhabi', 'A diverse and globally connected city, the capital of the United Arab Emirates is home to more than 200 nationalities. It is an aspiring global financial centre, a growing innovation hub, a leading energy producer, and a world-class tourist destination and cultural centre.', 'abu dhabi.webp', 2),
(5, 'Dubai', 'Once a small fishing village in the Arabian Gulf, Dubai shares the spotlight with some of the most cosmopolitan cities in the world. One of the seven emirates that make up the United Arab Emirates, the city is home to more than 200 nationalities and offers an unforgettable experience to all visitors. Whether it is by the banks of the Creek, or at the top of Burj Khalifa, the world’s tallest building, Dubai lives and breathes a sense of possibility and innovation. And with an unparalleled coastline, beautiful desert and magnificent cityscapes, memories are just waiting to be made here. ', 'dubai.jpeg', 2),
(6, 'Al-Sharjah', 'Touching borders with every other emirate of the UAE and boasting two very special coastlines, the Arabian Gulf and the Gulf of Oman, the emirate of Sharjah is the third most populated emirate and its exceptionally diverse terrain means that the emirate is home to beautiful natural landscapes made up of mountains, lush valleys and sparkling seas, alongside the city’s iconic architecture, myriad museums and award-winning art galleries. Unmissable for heritage, beauty and unique experiences, find your way to Sharjah for a special welcome.', 'sharjah.jpg', 2),
(7, 'Doha', 'A spectacular skyline welcomes you to Doha, Qatar’s thriving coastal capital on the Arabian peninsula. Get ready to experience one of the Middle East’s most enchanting cities and feel more than ever before. Doha is a melting pot of over 94 nationalities that welcomes visitors with open arms. Doha is the ideal place to start your journey of exploring all that Qatar has to offer.', 'doha.jpg', 3),
(8, 'Kuwait', 'Kuwait City is a bustling metropolis of high-rise office buildings, luxury hotels, wide boulevards and well-tended parks and gardens. Its most dominant landmarks are the Kuwait Towers. Kuwait City is not, however, an attractive city to visit as much of the architecture and its general feel is one of sand-blown dustiness.', 'kuwait.png', 5),
(9, 'Salalah', 'Salalah is a charming coastal city located in the Sultanate of Oman on the Arabian Sea, renowned for its picturesque scenery and unique green nature. It has dozens of tourist attractions and captivating waterfalls, making it an important tourist destination that brings together the cultures of the world.', 'salalah.jpg', 6),
(10, 'Manama', '', 'bahrain.jpg', 4);

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `countryID` int(11) NOT NULL,
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
  `destinationID` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `image` varchar(255) NOT NULL,
  `categoryID` int(11) NOT NULL,
  `cityID` int(11) NOT NULL
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
(26, 'Millennium Capital Gate Abu Dhabi', 'millennium.webp', 1, 4),
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
(42, 'Kulture House', 'kulture.jpg', 2, 5),
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
(73, 'Crowne Plaza Resort Salalah', 'crowne.jpg', 1, 9),
(74, 'Fanar Hotel and Residences', 'fanar.jpg', 1, 9),
(75, 'Souly Ecolodge', 'souly.jpg', 1, 9),
(76, 'Al Baleed Resort Salalah by Anantara', 'baleed.jpg', 1, 9),
(77, 'As Sammak Seafood Resturant', 'assamak.jpg', 2, 9),
(78, 'Oasis Club', 'oasis.jpg', 2, 9),
(79, 'Al Khareef Pub', 'khareef.jpg', 2, 9),
(80, 'Golden Lobster', 'golden.jpg', 2, 9),
(81, 'Wadi Darbat', 'wadi.jpg', 3, 9),
(82, 'Al Mughsail Beach', 'mughsail.jpg', 3, 9),
(83, 'Manreef Cave', 'cave.jpg', 3, 9),
(84, 'Sumhuram Old City', 'sumhuram.jpg', 3, 9),
(85, 'Waldorf Astoria Kuwait', 'waldorf.jpg', 1, 8),
(86, 'Mövenpick Hotel & Resort Al Bida\'a Kuwait', 'bida.jpg', 1, 8),
(87, 'The Regency Hotel Kuwait', 'regency.jpg', 1, 8),
(88, 'Jumeirah Messilah Beach', 'messilah.jpg', 1, 8),
(89, 'Blendz', 'blendz.jpg', 2, 8),
(90, 'Horizon - Kuwait Towers Resturant', 'horizon.jpg', 2, 8),
(91, 'Soul and Spice', 'soul.jpg', 2, 8),
(92, 'Mais Alghanim', 'mais.jpg', 2, 8),
(93, 'Kuwait Towers', 'towers.jpg', 3, 8),
(94, 'Grand Mosque', 'grand.jpg', 3, 8),
(95, 'Mirror House', 'mirror.jpg', 3, 8),
(96, '360 Mall', '360.jpg', 3, 8),
(97, 'Narcissus Hotel & Spa Riyadh', 'narcissus.jpg', 1, 2),
(98, 'Sheraton Riyadh Hotel & Towers', 'sheraton.jpg', 1, 2),
(99, 'Fairmont Riyadh', 'fairmont.jpg', 1, 2),
(100, 'InterContinental Riyadh', 'inter.jpg', 1, 2),
(101, 'Sultan\'s Steakhouse Riyadh', 'sultan.jpg', 2, 2),
(102, 'The Globe', 'globe.jpg', 2, 2),
(103, 'Myazu', 'myazu.jpg', 2, 2),
(104, 'Cafe Bateel', 'bateel.jpg', 2, 2),
(105, 'Kingdom Centre Tower', 'kingdom.jpg', 3, 2),
(106, 'Edge of The World', 'edge.jpg', 3, 2),
(107, 'Al Masmak Fortress', 'fortress.jpg', 3, 2),
(108, 'Al Rajhi Mosque', 'rajhi.jpg', 3, 2),
(109, 'Movenpick Hotel Tahlia Jeddah', 'mhotel.jpg', 1, 3),
(110, 'InterContinental Jeddah', 'intercontinental.jpg', 1, 3),
(111, 'Four Points by Sheraton', 'fourpoints.jpg', 1, 3),
(112, 'The Ritz-carlton Jeddah', 'jritz.jpg', 1, 3),
(113, 'Swiss Butter', 'butter.jpg', 2, 3),
(114, 'Twenty Four Restaurant', '24.jpg', 2, 3),
(115, 'Caffe Aroma', 'aroma.jpg', 2, 3),
(116, 'Reyhana', 'reyhana.jpg', 2, 3),
(117, 'Al-Balad', 'balad.jpg', 3, 3),
(118, 'Red Sea Mall', 'redseamall.jpg', 3, 3),
(119, 'Al Rahma Mosque', 'rahma.jpg', 3, 3),
(120, 'Nassif House Museum ', 'nassif.jpg', 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `favorites`
--

CREATE TABLE `favorites` (
  `favoriteID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `destinationID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `favoriteslist`
--

CREATE TABLE `favoriteslist` (
  `id` int(11) NOT NULL,
  `destinationID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `categoryID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `favoriteslist`
--

INSERT INTO `favoriteslist` (`id`, `destinationID`, `userID`, `categoryID`) VALUES
(1, 2, 4, 1),
(2, 3, 4, 3),
(3, 34, 4, 3),
(4, 14, 4, 1),
(5, 18, 4, 2),
(6, 24, 4, 3),
(7, 17, 4, 2),
(17, 1, 5, 1),
(18, 12, 5, 3);

-- --------------------------------------------------------

--
-- Table structure for table `landscape`
--

CREATE TABLE `landscape` (
  `landscapeID` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `cityID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `landscape`
--

INSERT INTO `landscape` (`landscapeID`, `image`, `cityID`) VALUES
(1, 'UL1.jpg', 1),
(2, 'UL2.webp', 1),
(3, 'UL3.jpg', 1),
(4, 'AL1.avif', 4),
(5, 'AL2.jpg', 4),
(6, 'AL3.jpg', 4),
(7, 'DL1.jpg', 5),
(8, 'DL2.jpg', 5),
(9, 'DL3.webp', 5),
(10, 'RL1.webp', 2),
(11, 'RL2.jpg', 2),
(12, 'RL3.jpg', 2),
(13, 'JL1.jpg', 3),
(14, 'JL2.jpg', 3),
(15, 'JL3.jpg', 3),
(16, 'SL1.jpg', 6),
(17, 'SL2.jpg', 6),
(18, 'SL3.jpg', 6);

-- --------------------------------------------------------

--
-- Table structure for table `memory`
--

CREATE TABLE `memory` (
  `memoryID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `imagePath` varchar(255) NOT NULL,
  `caption` text
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

--
-- Dumping data for table `memory`
--

INSERT INTO `memory` (`memoryID`, `userID`, `imagePath`, `caption`) VALUES
(10, 2, 'uploads/1743047391_A local\'s guide to Dubai, UAE.jpg', 'Dubai trip'),
(11, 2, 'uploads/1743047427_Unknown-3.jpg', 'amazing stay'),
(12, 2, 'uploads/1743047640_dubai.jpg', ''),
(13, 3, 'uploads/1743047957_Ahmed Ibn Tulun Mosque.jpg', ''),
(14, 3, 'uploads/1743047986_Habitas AlUla - Hotels in Heaven.jpg', 'Al-Ula'),
(15, 3, 'uploads/1743048029_Museum of Islamic Art - Doha, Qatar 🇶🇦.jpg', 'Museum of Islamic Art'),
(16, 3, 'uploads/1743048060_Unknown.jpg', ''),
(17, 3, 'uploads/1743048099_Sheikh Zayed Grand Mosque in Abu Dhabi.jpg', 'Sheikh Zayed Mosque in Abu Dhab'),
(18, 3, 'uploads/1743048117_Colorful modern Arab architecture_ Mina district in Doha, Qatar.jpg', 'Doha'),
(21, 3, 'uploads/1743048182_Escape to the Extraordinary at Banyan Tree Al Ula.jpg', 'Al-Ula'),
(23, 2, 'uploads/1743051695_peter-thomas-rzPOOSDNBM4-unsplash.jpg', '');

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
-- Dumping data for table `user`
--

INSERT INTO `user` (`userID`, `username`, `email`, `password`) VALUES
(1, 'maha ahmed', 'maha@gmail.com', '$2y$10$6J860w3OWkC4NK2pSQ6Aq.hDPJ7kTKRkBN/bjBWfLsUj1tykIlNw6'),
(2, 'sarah', 'sarah@gmail.com', '$2y$10$Zwbjw4bxo9eSMYd3zJM4pe.mLkGyiP.OaGRcQUiNSHtWiR6/8zEJC'),
(3, 'Hatoun', 'hatoun@gmail.com', '$2y$10$IGhUvlZI0NefxWjDWVR/BedOhLbyfBETXHQAcPKysLl3fOGbXxNi6'),
(4, 'Noora', 'noon@gmail.com', '$2y$10$tinteqPzTtuuXl4.SNnbWuKVQXZe14EpyUQZeVYSggJFoe2n3Ek0m'),
(5, 'lama', 'lama@gmail.com', '$2y$10$mzTWmHUp/fH/s2VKqUT48uQxFzv9q2c7wyd1PG.RNDWcLwRgfB0Bq');

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
-- Indexes for table `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`favoriteID`),
  ADD KEY `userID` (`userID`),
  ADD KEY `destinationID` (`destinationID`);

--
-- Indexes for table `favoriteslist`
--
ALTER TABLE `favoriteslist`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `destinationID` (`destinationID`),
  ADD KEY `userID` (`userID`),
  ADD KEY `categoryID` (`categoryID`);

--
-- Indexes for table `landscape`
--
ALTER TABLE `landscape`
  ADD PRIMARY KEY (`landscapeID`),
  ADD KEY `cityID` (`cityID`),
  ADD KEY `cityID_2` (`cityID`);

--
-- Indexes for table `memory`
--
ALTER TABLE `memory`
  ADD PRIMARY KEY (`memoryID`),
  ADD KEY `userID` (`userID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `favorites`
--
ALTER TABLE `favorites`
  MODIFY `favoriteID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `favoriteslist`
--
ALTER TABLE `favoriteslist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `memory`
--
ALTER TABLE `memory`
  MODIFY `memoryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `userID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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

--
-- Constraints for table `favorites`
--
ALTER TABLE `favorites`
  ADD CONSTRAINT `favorites_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`) ON DELETE CASCADE,
  ADD CONSTRAINT `favorites_ibfk_2` FOREIGN KEY (`destinationID`) REFERENCES `destination` (`destinationID`) ON DELETE CASCADE;

--
-- Constraints for table `favoriteslist`
--
ALTER TABLE `favoriteslist`
  ADD CONSTRAINT `favoriteslist_ibfk_1` FOREIGN KEY (`destinationID`) REFERENCES `destination` (`destinationID`),
  ADD CONSTRAINT `favoriteslist_ibfk_2` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`),
  ADD CONSTRAINT `favoriteslist_ibfk_3` FOREIGN KEY (`categoryID`) REFERENCES `category` (`categoryID`);

--
-- Constraints for table `landscape`
--
ALTER TABLE `landscape`
  ADD CONSTRAINT `landscape_ibfk_1` FOREIGN KEY (`cityID`) REFERENCES `city` (`cityID`);

--
-- Constraints for table `memory`
--
ALTER TABLE `memory`
  ADD CONSTRAINT `memory_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
