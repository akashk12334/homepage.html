-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 02, 2025 at 05:33 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `school`
--

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `id` int(11) NOT NULL,
  `role` varchar(20) DEFAULT NULL,
  `username` varchar(90) DEFAULT NULL,
  `password` varchar(90) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`id`, `role`, `username`, `password`) VALUES
(0, 'principal', 'principal123', '513629'),
(1, 'student', 'onesimu@2003', '0'),
(2, 'student', 'bino', '1111'),
(3, 'student', 'abin', '1111'),
(4, 'student', 'berashin', '2222'),
(5, 'student', 'edwin@23', '2222'),
(111, 'teacher', 'maria45', '513629Aa'),
(112, 'teacher', 'akash2003', '513629Aa@'),
(113, 'teacher', 'Abhinesh', '513629Aa@');

-- --------------------------------------------------------

--
-- Table structure for table `request`
--

CREATE TABLE `request` (
  `id` int(11) NOT NULL,
  `teachers_id` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `actiontype` varchar(100) DEFAULT NULL,
  `time` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `request`
--

INSERT INTO `request` (`id`, `teachers_id`, `name`, `actiontype`, `time`, `status`) VALUES
(1, 111, 'maria', 'Edit', '2025-11-02 12:03:48', 'approve');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `studentid` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `mark` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`studentid`, `name`, `address`, `mark`) VALUES
(1, 'onesimu', 'verkilambi', 100),
(2, 'bino', 'verkilambi', 100),
(3, 'abin', 'Kaniya kumari', 300),
(4, 'berashin', 'Thiruvanthapuram', 230),
(5, 'edwin', 'pattom', 280);

-- --------------------------------------------------------

--
-- Table structure for table `studentrequest`
--

CREATE TABLE `studentrequest` (
  `studentid` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `actiontype` varchar(50) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `time` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `studentrequest`
--

INSERT INTO `studentrequest` (`studentid`, `name`, `actiontype`, `status`, `time`) VALUES
(2, 'bino', 'Edit', 'approve', '2025-11-02 12:03:17');

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

CREATE TABLE `teachers` (
  `teachers_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `subject` varchar(80) DEFAULT NULL,
  `salary` int(11) DEFAULT NULL,
  `classes` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `teachers`
--

INSERT INTO `teachers` (`teachers_id`, `name`, `subject`, `salary`, `classes`) VALUES
(111, 'maria', 'AI', 2000, '1st year'),
(112, 'akash', 'cs', 20000, '1st year & 2nd year'),
(113, 'Abhinesh', 'Web Technology', 2000, '3st year');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `request`
--
ALTER TABLE `request`
  ADD PRIMARY KEY (`id`),
  ADD KEY `teachers_id` (`teachers_id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`studentid`);

--
-- Indexes for table `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`teachers_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `request`
--
ALTER TABLE `request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `studentid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `teachers`
--
ALTER TABLE `teachers`
  MODIFY `teachers_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `request`
--
ALTER TABLE `request`
  ADD CONSTRAINT `request_ibfk_1` FOREIGN KEY (`teachers_id`) REFERENCES `teachers` (`teachers_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
