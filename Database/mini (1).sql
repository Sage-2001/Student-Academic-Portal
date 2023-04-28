-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 28, 2023 at 06:33 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mini`
--

-- --------------------------------------------------------

--
-- Table structure for table `class_srms`
--

CREATE TABLE `class_srms` (
  `class_id` int(11) NOT NULL,
  `class_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `class_code` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `class_status` enum('Enable','Disable') COLLATE utf8_unicode_ci NOT NULL,
  `class_created_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `class_srms`
--

INSERT INTO `class_srms` (`class_id`, `class_name`, `class_code`, `class_status`, `class_created_on`) VALUES
(15, 'SE', '4422affa4e172214c938ae931c9c88f4', 'Enable', '2022-04-05 16:46:21'),
(16, 'DS', 'c75f49dd28a5e02e98773a7658700e27', 'Enable', '2022-10-05 13:27:33');

-- --------------------------------------------------------

--
-- Table structure for table `exam_srms`
--

CREATE TABLE `exam_srms` (
  `exam_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `exam_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `exam_result_date` date NOT NULL,
  `exam_result_published` enum('No','Yes') COLLATE utf8_unicode_ci NOT NULL,
  `exam_added_on` datetime NOT NULL,
  `exam_status` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `exam_srms`
--

INSERT INTO `exam_srms` (`exam_id`, `class_id`, `exam_name`, `exam_result_date`, `exam_result_published`, `exam_added_on`, `exam_status`) VALUES
(12, 15, 'End term', '2022-11-30', 'Yes', '2022-04-05 16:49:01', 'Enable'),
(14, 17, 'Mid sem', '2022-10-13', 'Yes', '2022-10-13 19:23:43', 'Enable');

-- --------------------------------------------------------

--
-- Table structure for table `marks_srms`
--

CREATE TABLE `marks_srms` (
  `marks_id` int(11) NOT NULL,
  `result_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `marks` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `marks_srms`
--

INSERT INTO `marks_srms` (`marks_id`, `result_id`, `subject_id`, `marks`) VALUES
(55, 18, 40, 80),
(56, 18, 42, 100),
(57, 18, 41, 100);

-- --------------------------------------------------------

--
-- Table structure for table `result_srms`
--

CREATE TABLE `result_srms` (
  `result_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `exam_id` int(11) NOT NULL,
  `result_percentage` decimal(5,2) NOT NULL,
  `result_status` enum('Enable','Disabled') COLLATE utf8_unicode_ci NOT NULL,
  `result_added_by` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `result_srms`
--

INSERT INTO `result_srms` (`result_id`, `class_id`, `student_id`, `exam_id`, `result_percentage`, `result_status`, `result_added_by`) VALUES
(18, 16, 69, 13, '93.33', 'Enable', 'Master');

-- --------------------------------------------------------

--
-- Table structure for table `student_srms`
--

CREATE TABLE `student_srms` (
  `student_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `student_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `student_roll_no` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `student_email_id` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `student_gender` enum('Male','Female') COLLATE utf8_unicode_ci NOT NULL,
  `student_dob` date NOT NULL,
  `student_status` enum('Enable','Disable') COLLATE utf8_unicode_ci NOT NULL,
  `student_added_by` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `student_added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `student_srms`
--

INSERT INTO `student_srms` (`student_id`, `class_id`, `student_name`, `student_roll_no`, `student_email_id`, `student_gender`, `student_dob`, `student_status`, `student_added_by`, `student_added_on`) VALUES
(68, 15, 'rahul', '01', 'rkwda@wda.adw', 'Male', '2022-03-30', 'Enable', 'Master', '2022-04-05 16:47:33'),
(69, 16, 'Somya', '12342423', 'ADas@gmail.com', 'Male', '2022-10-06', 'Enable', 'Master', '2022-10-05 13:28:48'),
(70, 17, 'sid', '01', 'rahulrawatrecruit@gmail.com', 'Male', '2022-10-19', 'Enable', 'Master', '2022-10-13 19:23:26');

-- --------------------------------------------------------

--
-- Table structure for table `subject_srms`
--

CREATE TABLE `subject_srms` (
  `subject_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `subject_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `subject_status` enum('Enable','Disable') COLLATE utf8_unicode_ci NOT NULL,
  `subject_created_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `subject_srms`
--

INSERT INTO `subject_srms` (`subject_id`, `class_id`, `subject_name`, `subject_status`, `subject_created_on`) VALUES
(35, 12, 'Operating System', 'Enable', '2021-12-18 05:45:27'),
(36, 12, 'DAA', 'Enable', '2021-12-18 05:45:35'),
(37, 13, 'Compiler', 'Enable', '2022-04-05 16:39:30'),
(38, 15, 'DBMS', 'Enable', '2022-04-05 16:46:28'),
(39, 15, 'compiler', 'Enable', '2022-04-05 16:49:33'),
(40, 16, 'Data str', 'Enable', '2022-10-05 13:27:45'),
(41, 16, 'Eng', 'Enable', '2022-10-05 13:27:51'),
(42, 16, 'DBMS', 'Enable', '2022-10-05 13:27:58'),
(43, 18, 'nn', 'Enable', '2022-11-17 07:52:16');

-- --------------------------------------------------------

--
-- Table structure for table `user_srms`
--

CREATE TABLE `user_srms` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `user_contact_no` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `user_email` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `user_password` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `user_profile` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `user_type` enum('Master','User') COLLATE utf8_unicode_ci NOT NULL,
  `user_status` enum('Enable','Disable') COLLATE utf8_unicode_ci NOT NULL,
  `user_created_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user_srms`
--

INSERT INTO `user_srms` (`user_id`, `user_name`, `user_contact_no`, `user_email`, `user_password`, `user_profile`, `user_type`, `user_status`, `user_created_on`) VALUES
(1, 'Manoj Das', '9404837636', 'manojdas@gmail.com', 'password', '../images/manoj.png', 'Master', 'Enable', '2020-12-15 06:32:20');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `class_srms`
--
ALTER TABLE `class_srms`
  ADD PRIMARY KEY (`class_id`);

--
-- Indexes for table `exam_srms`
--
ALTER TABLE `exam_srms`
  ADD PRIMARY KEY (`exam_id`);

--
-- Indexes for table `marks_srms`
--
ALTER TABLE `marks_srms`
  ADD PRIMARY KEY (`marks_id`);

--
-- Indexes for table `result_srms`
--
ALTER TABLE `result_srms`
  ADD PRIMARY KEY (`result_id`);

--
-- Indexes for table `student_srms`
--
ALTER TABLE `student_srms`
  ADD PRIMARY KEY (`student_id`);

--
-- Indexes for table `subject_srms`
--
ALTER TABLE `subject_srms`
  ADD PRIMARY KEY (`subject_id`);

--
-- Indexes for table `user_srms`
--
ALTER TABLE `user_srms`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `class_srms`
--
ALTER TABLE `class_srms`
  MODIFY `class_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `exam_srms`
--
ALTER TABLE `exam_srms`
  MODIFY `exam_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `marks_srms`
--
ALTER TABLE `marks_srms`
  MODIFY `marks_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `result_srms`
--
ALTER TABLE `result_srms`
  MODIFY `result_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `student_srms`
--
ALTER TABLE `student_srms`
  MODIFY `student_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `subject_srms`
--
ALTER TABLE `subject_srms`
  MODIFY `subject_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `user_srms`
--
ALTER TABLE `user_srms`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
