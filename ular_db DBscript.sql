-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 09, 2024 at 01:47 PM
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
  `UserID` int(11) NOT NULL,
  `TStamp` varchar(30) NOT NULL,
  `IP_Address` varchar(30) NOT NULL,
  `Device_Info` varchar(50) NOT NULL,
  `GeoLoc` varchar(30) NOT NULL,
  `Login_Status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(3, 'Sara', 'sarahstar', 1),
(4, 'Amit', 'vadapavvm', 1),
(5, 'ADMIN', 'DBA_ADMIN', 2);

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
