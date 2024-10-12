-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 12, 2024 at 07:01 PM
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
-- Database: `ular_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `access_level`
--

CREATE TABLE `access_level` (
  `AL_ID` int(11) NOT NULL,
  `AccessLevel` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `access_level`
--

INSERT INTO `access_level` (`AL_ID`, `AccessLevel`) VALUES
(1, 'RegularUser'),
(2, 'DBAdmin'),
(3, 'BoardDirective');

-- --------------------------------------------------------

--
-- Table structure for table `login_event`
--

CREATE TABLE `login_event` (
  `Username` varchar(30) NOT NULL,
  `TStamp` varchar(30) NOT NULL,
  `IP_Address` varchar(30) NOT NULL,
  `Device_Info` varchar(50) NOT NULL,
  `GeoLoc` varchar(30) NOT NULL,
  `Login_Status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `login_event`
--

INSERT INTO `login_event` (`Username`, `TStamp`, `IP_Address`, `Device_Info`, `GeoLoc`, `Login_Status`) VALUES
('ADMIN', '2024-10-12 08:05:20', '::1', 'Edge', 'India', 'Success'),
('Darcy', '2024-10-12 09:59:01', '::1', 'Edge', 'India', 'Fail'),
('Darcy', '2024-10-12 09:59:14', '::1', 'Edge', 'India', 'Success'),
('ADMIN', '2024-10-12 11:05:42', '::1', 'Edge', 'India', 'Success'),
('ADMIN', '2024-10-12 14:37:35', '::1', 'Edge', 'India', 'Success'),
('Alice', '2024-10-12 14:40:12', '::1', 'Chrome', 'Scotland', 'Success'),
('Benedict', '2024-10-12 14:44:10', '::1', 'Firefox', 'United Kingdom', 'Success'),
('Kiara', '2024-10-12 14:45:02', '::1', 'Edge', 'France', 'Success'),
('Alice', '2024-10-12 14:45:43', '::1', 'Edge', 'France', 'Fail'),
('Alice', '2024-10-12 14:46:14', '::1', 'Edge', 'France', 'Fail'),
('Alice', '2024-10-12 14:46:31', '::1', 'Edge', 'France', 'Fail'),
('Adar', '2024-10-12 15:01:24', '::1', 'Firefox', 'France', 'Success'),
('Krish', '2024-10-12 15:02:15', '::1', 'Safari', 'India', 'Success'),
('Jeremy', '2024-10-12 15:03:29', '::1', 'Opera', 'Scotland', 'Success'),
('Raj', '2024-10-12 15:04:48', '::1', 'Safari', 'United States', 'Fail'),
('Raj', '2024-10-12 15:04:59', '::1', 'Safari', 'United States', 'Fail'),
('Raj', '2024-10-12 15:05:09', '::1', 'Safari', 'United States', 'Success'),
('Rana', '2024-10-12 15:06:16', '::1', 'Firefox', 'Singapore', 'Success'),
('Morfydd', '2024-10-12 15:07:38', '::1', 'Firefox', 'Norway', 'Success'),
('Morfydd', '2024-10-12 15:08:21', '::1', 'Edge', 'France', 'Fail'),
('Calypso', '2024-10-12 15:09:58', '::1', 'Opera', 'Canada', 'Success'),
('Luna', '2024-10-12 15:10:46', '::1', 'Chrome', 'Norway', 'Fail'),
('Luna', '2024-10-12 15:10:57', '::1', 'Chrome', 'Norway', 'Success'),
('Janey', '2024-10-12 15:12:44', '::1', 'Firefox', 'New Zealand', 'Fail'),
('Janey', '2024-10-12 15:12:58', '::1', 'Firefox', 'New Zealand', 'Fail'),
('ADMIN', '2024-10-12 15:13:43', '::1', 'Edge', 'India', 'Success'),
('Krish', '2024-10-12 15:14:40', '::1', 'Safari', 'India', 'Success'),
('ADMIN', '2024-10-12 16:23:18', '::1', 'Safari', 'India', 'Success'),
('Meghara', '2024-10-12 18:05:46', '::1', 'Chrome', 'Canada', 'Success'),
('ADMIN', '2024-10-12 18:51:36', '::1', 'Chrome', 'Canada', 'Success'),
('ADMIN', '2024-10-12 18:57:45', '::1', 'Chrome', 'Canada', 'Success'),
('Raj', '2024-10-12 18:58:54', '::1', 'Chrome', 'Canada', 'Fail');

-- --------------------------------------------------------

--
-- Table structure for table `user_info`
--

CREATE TABLE `user_info` (
  `UserID` int(11) NOT NULL,
  `Username` varchar(30) NOT NULL,
  `Userpass` varchar(20) NOT NULL,
  `AL_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_info`
--

INSERT INTO `user_info` (`UserID`, `Username`, `Userpass`, `AL_ID`) VALUES
(1, 'Darcy', 'Darcylene123', 3),
(2, 'Denvyl', 'densha_01', 3),
(3, 'Sara', 'sarahstar', 3),
(4, 'Amit', 'vadapavvm', 3),
(5, 'ADMIN', 'DBA_ADMIN', 2),
(6, 'Bluey', 'bluebam237', 1),
(7, 'Meghara', 'MegheRa', 1),
(8, 'Raj', 'RajRules_1', 1),
(9, 'Dylan', 'dylanworks01', 1),
(10, 'Benedict', 'cucumberbatch', 1),
(11, 'Bates', 'Bateman66', 1),
(12, 'Chris', 'chris987', 1),
(13, 'Alice', 'Alicia5709', 1),
(14, 'Ally', 'Cooper_28', 1),
(15, 'Jim', 'Halpam_97', 1),
(16, 'Kiara', '1_queenclara', 1),
(17, 'Rana', 'RanaIsSane99', 1),
(18, 'Dhruv', 'dhruv_vurdh', 1),
(19, 'Morfydd', 'Clark111', 1),
(20, 'Adar', '17Galad_01', 1),
(21, 'Charlotte', 'nicole00', 1),
(22, 'Luna', 'Lalala2356', 1),
(23, 'Calypso', 'Calata792', 1),
(24, 'Sparrow', 'Cap1Jack', 1),
(25, 'Jeremy', 'Runner2468', 1),
(26, 'Emma', 'emmagoldson_01', 1),
(27, 'Diya', 'diya24', 1),
(28, 'Daya', 'daya24', 1),
(29, 'Theo', '10_theodo_01', 1),
(30, 'Krish', 'harish114', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `user_info`
--
ALTER TABLE `user_info`
  ADD PRIMARY KEY (`UserID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
