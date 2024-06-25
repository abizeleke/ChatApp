

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Database: `chat_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `password` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`password`) VALUES
('4a7d1ed414474e4033ac29ccb8653d9b');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `feedbackId` int(11) NOT NULL,
  `senderId` int(11) DEFAULT NULL,
  `content` varchar(1000) DEFAULT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`feedbackId`, `senderId`, `content`, `time`) VALUES
(10, 23, 'better good job', '2024-02-22 11:44:18');

-- --------------------------------------------------------

--
-- Table structure for table `groupmessage`
--

CREATE TABLE `groupmessage` (
  `messageId` int(11) NOT NULL,
  `senderId` int(11) DEFAULT NULL,
  `content` varchar(100) DEFAULT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `groupmessage`
--

INSERT INTO `groupmessage` (`messageId`, `senderId`, `content`, `time`) VALUES
(47, 23, 'hi', '2024-02-22 11:43:16'),
(48, 20, 'hi', '2024-02-22 11:43:36');

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `messageId` int(11) NOT NULL,
  `senderId` int(11) DEFAULT NULL,
  `recieverId` int(11) DEFAULT NULL,
  `content` varchar(10000) DEFAULT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `message`
--

INSERT INTO `message` (`messageId`, `senderId`, `recieverId`, `content`, `time`) VALUES
(105, 23, 20, 'hi', '2024-02-22 11:41:29'),
(106, 20, 23, 'hi', '2024-02-22 11:41:41'),
(107, 23, 20, 'selam ', '2024-02-22 11:41:51');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `userId` int(11) NOT NULL,
  `firstName` varchar(100) DEFAULT NULL,
  `lastName` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phoneNumber` int(20) DEFAULT NULL,
  `country` varchar(30) DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL,
  `password` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userId`, `firstName`, `lastName`, `email`, `phoneNumber`, `country`, `city`, `password`) VALUES
(20, 'Abdi ', 'Sileshi', 'abdi@gmail.com', 964347926, 'usa', 'adama', '81dc9bdb52d04dc20036dbd8313ed055'),
(21, 'Debela', 'Berako', 'Debelaberako@gmail.com', 979801635, 'ethiopia', 'adama', '202cb962ac59075b964b07152d234b70'),
(22, 'mihret', 'habtamu', 'mihret@gmail.com', 93797538, 'ethiopia', 'adama', '4a7d1ed414474e4033ac29ccb8653d9b'),
(23, 'Tesfaye', 'Zeleke', 'tesfaye@gmail.com', 909785831, 'ethiopia', 'addis ababa', '81dc9bdb52d04dc20036dbd8313ed055');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`feedbackId`),
  ADD KEY `senderId` (`senderId`);

--
-- Indexes for table `groupmessage`
--
ALTER TABLE `groupmessage`
  ADD PRIMARY KEY (`messageId`),
  ADD KEY `senderId` (`senderId`);

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`messageId`),
  ADD KEY `senderId` (`senderId`),
  ADD KEY `recieverId` (`recieverId`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userId`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `feedbackId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `groupmessage`
--
ALTER TABLE `groupmessage`
  MODIFY `messageId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
  MODIFY `messageId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=108;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`senderId`) REFERENCES `user` (`userId`);

--
-- Constraints for table `groupmessage`
--
ALTER TABLE `groupmessage`
  ADD CONSTRAINT `groupmessage_ibfk_1` FOREIGN KEY (`senderId`) REFERENCES `user` (`userId`);

--
-- Constraints for table `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `message_ibfk_1` FOREIGN KEY (`senderId`) REFERENCES `user` (`userId`),
  ADD CONSTRAINT `message_ibfk_2` FOREIGN KEY (`recieverId`) REFERENCES `user` (`userId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
