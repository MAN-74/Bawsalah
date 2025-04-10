-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Apr 10, 2025 at 04:06 PM
-- Server version: 8.0.40
-- PHP Version: 8.3.14

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
  `categoryID` int NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

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
  `cityID` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `image` varchar(255) NOT NULL,
  `countryID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`cityID`, `name`, `description`, `image`, `countryID`) VALUES
(1, 'Al-Ula', 'AlUla, located in the northwest of Saudi Arabia, is one of the most prominent cultural destinations that blends deep history with a modern spirit. The city boasts an authentic Nabatean culture, historically serving as a trade hub and a meeting point between different ancient civilizations, making it a cultural and historical landmark.\r\nThe social culture of AlUla is deeply rooted in traditional Bedouin values, where hospitality and generosity are at the heart of daily life. The local dialect, a distinctive form of Najdi Arabic, is a vital part of the region’s cultural identity. AlUla\'s cuisine is rich with traditional dishes such as \"Mujboos\" and \"Jareesh,\" reflecting a deep connection to the desert environment.\r\nArchitecturally, AlUla is home to the stunning Nabatean rock-cut tombs at Hegra (a UNESCO World Heritage site), and its Old Town presents a historical glimpse into the city’s ancient past. AlUla is also known for its thriving arts scene, with festivals like the \"Winter at Tantora Festival,\" which highlights visual arts, music, and literature. Visitors to AlUla experience a blend of the ancient and the contemporary, with a commitment to preserving heritage while embracing modern cultural expressions.', 'al-ula.jpg\r\n', 1),
(2, 'Riyadh', 'Riyadh is a city that combines authenticity with modernity, reflecting the deep history of the Kingdom and its rooted culture in daily life. Your cultural journey begins in the traditional souqs, such as Souq Al-Zal, where visitors can discover ancient handicrafts like carpets and jewelry, or at the Masmak Fort, a symbol of Riyadh’s early history.\r\nThe values of hospitality and generosity are central to Riyadh’s social customs, where guests are traditionally welcomed with Arabic coffee and dates – a practice deeply embedded in Najdi culture. The official language in Riyadh is Arabic, and the local Najdi dialect holds a special place in the city\'s identity. When it comes to food, Najd Village Restaurant is the perfect place to enjoy traditional dishes like Kabsa and Mandi, reflecting the rich flavors of the Najdi cuisine. Today, Riyadh is not only a historical city but also a thriving modern metropolis, blending traditional and contemporary architecture, while embracing a growing art scene through initiatives like Riyadh Art, which has transformed the streets into open-air art galleries.', 'riyadh.jpg', 1),
(3, 'Jeddah', 'Jeddah boasts a rich cultural heritage that reflects its historical and commercial significance as a key port city. Visitors can explore the historic Al Balad, the heart of Jeddah, where narrow streets and traditional homes with the unique Hijazi architectural style showcase the use of wood and plaster in a distinctive design. In these markets, you can find local handicrafts like pottery and brass items, reflecting the crafts passed down through generations.\"\r\n\"Jeddah is also known for its deep-rooted traditions of hospitality and generosity, with family gatherings and communal meals being an important aspect of daily life. The official language is Arabic, but the local Hijazi dialect adds a special flavor that reflects the region\'s cultural influences.\"\r\n\"When it comes to food, Jeddah offers a rich variety of traditional Hijazi dishes, such as Miftah and grilled fish, along with dates and Arabic coffee, which are always present at social gatherings. Visitors can also enjoy international cuisine at places like Mall of Arabia and Red Sea Mall, which highlight the city’s cultural diversity.\"\r\n\"For a more relaxing experience, a visit to the Jeddah Corniche is ideal, where visitors can enjoy the Red Sea views and explore the visual arts displayed along the waterfront. The King Fahd Fountain, one of the largest fountains in the world, is also a spectacular sight. Jeddah is a place where tradition meets modernity, making it a perfect destination to enjoy history, culture, and nature.', 'jeddah.webp', 1),
(4, 'Abu Dhabi', 'Abu Dhabi, the capital of the United Arab Emirates, is a city that represents a wonderful blend of modernity and rich tradition. With over 200 nationalities calling it home, Abu Dhabi reflects a rich cultural diversity, where local traditions meet global influences.\"\r\n\"As a vibrant cultural hub, Abu Dhabi hosts a wide range of cultural and artistic events, including international exhibitions, festivals, and performances that showcase cultures from around the world. Landmark cultural sites like the Louvre Abu Dhabi and the Zayed National Museum symbolize the city’s role as a center for arts and sciences, balancing heritage with contemporary creativity.\r\n\r\nIn Abu Dhabi, social traditions such as Emirati hospitality and generosity are deeply ingrained in daily life. Welcoming guests with a cup of Arabic coffee and dates is more than a custom – it is a cultural practice passed down through generations. When it comes to food, Abu Dhabi offers authentic Emirati dishes such as Maqbous and Luqaimat, crafted with precision and often served during social gatherings.\"\r\n\"Arabic is the official language, but the city is a multilingual hub, reflecting the diversity of its residents. This diversity is also reflected in the year-round festivals such as the Abu Dhabi Festival and Qasr Al Hosn Festival, where Emirati heritage and global artistic expressions are celebrated.\"\r\n\"Moreover, Abu Dhabi is a leading city in innovation and technology, aiming to become a global center for innovation while still deeply connected to its cultural roots.', 'abu dhabi.webp', 2),
(5, 'Dubai', 'Once a small fishing village on the shores of the Arabian Gulf, Dubai has grown to become one of the most cosmopolitan cities in the world. Home to over 200 nationalities, Dubai reflects a rich cultural diversity, where local traditions blend seamlessly with global influences.\"\r\n\"The city is not only a tourist destination but also a cultural hub, featuring numerous museums and art galleries such as the Dubai Museum and the Museum of the Future, offering unique cultural and artistic experiences. Dubai also celebrates various global cultures through major events like the Dubai Shopping Festival and the Dubai International Film Festival, both of which are key cultural highlights in the region.\r\n\r\nHospitality is at the heart of Dubai’s social fabric, where guests are traditionally welcomed with Arabic coffee and dates in a gesture of Emirati warmth. Dubai’s culinary scene is a blend of local Emirati dishes like Harees and Luqaimat, alongside an impressive range of international cuisines catering to all tastes.\r\n\r\nArabic is the official language of Dubai, but the city’s multilingual atmosphere reflects its global nature, with many languages spoken due to its international population. Dubai continues to offer an unforgettable experience, whether along the banks of the Creek, at the top of the Burj Khalifa – the world’s tallest building, or among its stunning cityscapes.\"\r\n\"With its breathtaking coastline, beautiful desert landscapes, and magnificent skyscrapers, Dubai is a city that never stops innovating, making it an ideal place to explore its diverse culture and unique experiences.', 'dubai.jpeg', 2),
(6, 'Al-Sharjah', 'Sharjah, bordered by every other emirate and boasting two unique coastlines on the Arabian Gulf and the Gulf of Oman, is the third most populous emirate in the UAE. The emirate’s exceptionally diverse terrain includes beautiful natural landscapes made up of mountains, lush valleys, and sparkling seas, alongside the city’s iconic architecture, a wealth of museums, and award-winning art galleries.\r\n\r\nSharjah is a cultural haven, home to a wide range of museums showcasing the UAE’s heritage and history, such as the Sharjah Archaeology Museum and the Sharjah Art Museum, as well as art centers like the Sharjah Art Foundation, which hosts international exhibitions and cultural events. Additionally, the Sharjah Islamic Arts Festival is a highlight that celebrates Islamic arts and fosters cultural exchange between the East and West.\"\r\n\"In terms of cuisine, Sharjah offers a diverse range of traditional Emirati dishes like Maqbous and grilled fish, along with popular Gulf dishes. The food in Sharjah is served in a family-oriented atmosphere, reflecting the importance of hospitality and togetherness among the locals.\r\n\r\nArabic is the official language of Sharjah, and the local Emirati dialect is an integral part of the city’s cultural identity, reflecting the values of the people and their deep-rooted sense of hospitality. Sharjah is not just known for its natural beauty and rich history, but also for offering unique experiences that truly reflect its deep connection to Emirati culture and heritage.\"\r\n\"Sharjah is also an ideal destination to enjoy natural tranquility between mountains and the sea, with numerous cultural sites offering rich, memorable experiences that make it a must-visit for anyone seeking to connect with the UAE’s cultural heart.', 'sharjah.jpg', 2),
(7, 'Doha', 'Doha, the vibrant capital of Qatar, is a city where modernity blends seamlessly with rich tradition, attracting over 94 nationalities and becoming a melting pot of diverse cultures. The city stands as a cultural hub with remarkable landmarks such as the Embrace Doha Foundation, offering workshops on traditional Qatari culture, and the Katara Cultural Village, which hosts numerous art events and performances. Visitors should not miss the National Museum of Qatar, showcasing Qatar’s natural and cultural history through its unique desert rose-inspired architecture, as well as the Doha Cultural Festival, which celebrates local arts and heritage. The people of Doha are known for their exceptional hospitality, offering traditional Qatari dishes like Maqbous and Mehyawa. Arabic is the official language, reflecting the authenticity of the community, while the city\'s traditions play an integral role in its identity, making Doha a unique cultural destination in the region.', 'doha.jpg', 3),
(8, 'Kuwait', 'Kuwait City is rich in culture and history, offering visitors a chance to explore prominent museums such as the Kuwait National Museum and the Tareq Rajab Museum, which showcase the country’s rich past and heritage. The Souq Al-Mubarakiya, one of the oldest markets in the city, offers an authentic experience where visitors can buy local crafts, spices, and traditional foods. The people of Kuwait are known for their exceptional hospitality, which is a key part of the country’s culture.\r\n\r\nArabic is the official language of Kuwait, and it plays a significant role in daily life. Traditional Kuwaiti dishes such as Machboos and Jareed are an integral part of the cultural experience for visitors.', 'kuwait.png', 5),
(9, 'Salalah', 'Salalah is a charming coastal city located in the Sultanate of Oman on the Arabian Sea, renowned for its picturesque scenery and unique green nature. The city attracts visitors from all over the world with its captivating waterfalls and diverse tourist attractions. While its natural beauty is a major draw, Salalah is also home to a rich cultural heritage that reflects Oman’s deep-rooted history. The city blends old traditions with modern life, and local festivals like the Salalah Tourism Festival celebrate Omani folk arts, music, and cultural performances.\r\n\r\nOmani hospitality is a key part of Salalah’s culture, with locals being known for their warm welcomes and generosity. The city’s cuisine reflects its cultural diversity, with traditional Omani dishes such as Shawwah and Madhrooba available for visitors to enjoy. Arabic is the primary language spoken, with local dialects being used in everyday life.', 'salalah.jpg', 6),
(10, 'Manama', 'Manama, the capital of the Kingdom of Bahrain, is a major financial center with a thriving economy. The city’s skyline is adorned with glass and steel spires, and Bahrain is not only a modern and developed city but also one that is rich in culture and art.\r\n\r\nManama is famous for its deep cultural heritage, with the Bab el-Bahrain Souk being one of the city’s key cultural landmarks. Here, visitors can discover a variety of traditional perfumes, spices, and gold, reflecting the authenticity of Bahraini culture. Traditional arts such as Dawaza and Ayyala are an integral part of Bahrain’s identity, celebrated at local festivals such as the Bahrain International Arts Festival.\r\n\r\nArabic is the official language of Bahrain, and it is a significant part of the identity of the Bahraini people, blending modernity with tradition. Bahraini hospitality is renowned for being warm and welcoming, and the locals are known for offering traditional dishes such as Machboos and Harira.', 'bahrain.jpg', 4);

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `countryID` int NOT NULL,
  `name` varchar(60) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

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
  `destinationID` int NOT NULL,
  `name` varchar(60) NOT NULL,
  `image` varchar(255) NOT NULL,
  `categoryID` int NOT NULL,
  `cityID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

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
-- Table structure for table `favoriteslist`
--

CREATE TABLE `favoriteslist` (
  `id` int NOT NULL,
  `destinationID` int NOT NULL,
  `userID` int NOT NULL,
  `categoryID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

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
(20, 76, 6, 1),
(22, 27, 6, 1),
(23, 19, 6, 2),
(28, 20, 6, 2),
(29, 13, 6, 1),
(30, 15, 6, 1),
(31, 16, 6, 1),
(36, 21, 6, 3),
(37, 22, 6, 3),
(38, 23, 6, 3),
(40, 1, 6, 1),
(43, 4, 6, 1),
(44, 5, 6, 2),
(45, 6, 6, 2),
(46, 7, 6, 2),
(47, 8, 6, 2),
(48, 9, 6, 3),
(49, 10, 6, 3),
(50, 11, 6, 3),
(51, 12, 6, 3);

-- --------------------------------------------------------

--
-- Table structure for table `landscape`
--

CREATE TABLE `landscape` (
  `landscapeID` int NOT NULL,
  `image` varchar(255) NOT NULL,
  `cityID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

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
(18, 'SL3.jpg', 6),
(19, 'QL1.jpg', 7),
(20, 'QL2.jpg', 7),
(21, 'QL3.jpg', 7),
(22, 'KL1.jpg', 8),
(23, 'KL2.jpg', 8),
(24, 'KL3.jpg', 8),
(25, 'ML1.jpg', 10),
(26, 'ML2.jpg', 10),
(27, 'ML3.jpg', 10),
(28, 'OL1.jpg', 9),
(29, 'OL2.jpg', 9),
(30, 'OL3.jpg', 9);

-- --------------------------------------------------------

--
-- Table structure for table `memory`
--

CREATE TABLE `memory` (
  `memoryID` int NOT NULL,
  `userID` int NOT NULL,
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
  `userID` int NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userID`, `username`, `email`, `password`) VALUES
(1, 'maha ahmed', 'maha@gmail.com', '$2y$10$6J860w3OWkC4NK2pSQ6Aq.hDPJ7kTKRkBN/bjBWfLsUj1tykIlNw6'),
(2, 'sarah', 'sarah@gmail.com', '$2y$10$Zwbjw4bxo9eSMYd3zJM4pe.mLkGyiP.OaGRcQUiNSHtWiR6/8zEJC'),
(3, 'Hatoun', 'hatoun@gmail.com', '$2y$10$IGhUvlZI0NefxWjDWVR/BedOhLbyfBETXHQAcPKysLl3fOGbXxNi6'),
(4, 'Noora', 'noon@gmail.com', '$2y$10$tinteqPzTtuuXl4.SNnbWuKVQXZe14EpyUQZeVYSggJFoe2n3Ek0m'),
(5, 'lama', 'lama@gmail.com', '$2y$10$mzTWmHUp/fH/s2VKqUT48uQxFzv9q2c7wyd1PG.RNDWcLwRgfB0Bq'),
(6, 'maha', 'maha@outlook.com', '$2y$10$Ew3SjfWey23EY7jzlq15l.Hvn8lEMVElIfYV4.wW55CVBsRtnRu4G');

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
-- AUTO_INCREMENT for table `favoriteslist`
--
ALTER TABLE `favoriteslist`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `memory`
--
ALTER TABLE `memory`
  MODIFY `memoryID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `userID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
