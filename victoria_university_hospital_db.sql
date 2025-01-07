-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 06, 2025 at 10:14 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `victoria_university_hospital_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `facility`
--

CREATE TABLE `facility` (
  `Facility_ID` int(11) NOT NULL,
  `Facility_Name` varchar(100) NOT NULL,
  `Location` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lab_tests`
--

CREATE TABLE `lab_tests` (
  `Test_ID` int(11) NOT NULL,
  `Visit_ID` int(11) DEFAULT NULL,
  `Test_Name` varchar(100) NOT NULL,
  `Results` text DEFAULT NULL,
  `Test_Date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `patient_data`
--

CREATE TABLE `patient_data` (
  `Patient_ID` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Contact_Number` varchar(15) DEFAULT NULL,
  `Address` text DEFAULT NULL,
  `Age` int(11) DEFAULT NULL,
  `Gender` enum('Male','Female','Other') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patient_data`
--

INSERT INTO `patient_data` (`Patient_ID`, `Name`, `Contact_Number`, `Address`, `Age`, `Gender`) VALUES
(1, 'kalule abdu', '0767444447', 'Kampala', 35, 'Male'),
(2, 'lois lane', '0734567893', 'Mukono', 29, 'Female');

-- --------------------------------------------------------

--
-- Table structure for table `resource`
--

CREATE TABLE `resource` (
  `Resource_ID` int(11) NOT NULL,
  `Resource_Name` varchar(100) DEFAULT NULL,
  `Type` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `supply_chain`
--

CREATE TABLE `supply_chain` (
  `Supply_ID` int(11) NOT NULL,
  `Facility_ID` int(11) DEFAULT NULL,
  `Resource_ID` int(11) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `treatment`
--

CREATE TABLE `treatment` (
  `Treatment_ID` int(11) NOT NULL,
  `Visit_ID` int(11) DEFAULT NULL,
  `Medicine_Name` varchar(100) DEFAULT NULL,
  `Dosage` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `visit_record`
--

CREATE TABLE `visit_record` (
  `Visit_ID` int(11) NOT NULL,
  `Patient_ID` int(11) DEFAULT NULL,
  `Visit_Date` date NOT NULL,
  `Diagnosis` text DEFAULT NULL,
  `Facility_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `facility`
--
ALTER TABLE `facility`
  ADD PRIMARY KEY (`Facility_ID`);

--
-- Indexes for table `lab_tests`
--
ALTER TABLE `lab_tests`
  ADD PRIMARY KEY (`Test_ID`);

--
-- Indexes for table `patient_data`
--
ALTER TABLE `patient_data`
  ADD PRIMARY KEY (`Patient_ID`),
  ADD UNIQUE KEY `Contact_Number` (`Contact_Number`);

--
-- Indexes for table `resource`
--
ALTER TABLE `resource`
  ADD PRIMARY KEY (`Resource_ID`);

--
-- Indexes for table `supply_chain`
--
ALTER TABLE `supply_chain`
  ADD PRIMARY KEY (`Supply_ID`);

--
-- Indexes for table `treatment`
--
ALTER TABLE `treatment`
  ADD PRIMARY KEY (`Treatment_ID`);

--
-- Indexes for table `visit_record`
--
ALTER TABLE `visit_record`
  ADD PRIMARY KEY (`Visit_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
