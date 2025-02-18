-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 18, 2025 at 09:53 AM
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
-- Database: `placement`
--

-- --------------------------------------------------------

--
-- Table structure for table `candidate`
--

CREATE TABLE `candidate` (
  `cand_id` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `age` int(11) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `candidate`
--

INSERT INTO `candidate` (`cand_id`, `name`, `email`, `age`, `location`, `created_at`, `password`) VALUES
('Cand1001', 'Aarav Patel', 'aarav.patel@example.com', 28, 'Mumbai', '2025-02-16 12:43:43', '$2a$10$WvIo1MQnUhoo1/qg2Pehy.TQUcow6zPgpAhtbqZiBbOU9Q.yBGoKS'),
('Cand1002', 'Neha Sharma', 'neha.sharma@example.com', 32, 'Delhi', '2025-02-16 12:43:43', '$2a$10$WvIo1MQnUhoo1/qg2Pehy.TQUcow6zPgpAhtbqZiBbOU9Q.yBGoKS'),
('Cand1003', 'Rahul Singh', 'rahul.singh@example.com', 25, 'Bangalore', '2025-02-16 12:43:43', '$2a$10$WvIo1MQnUhoo1/qg2Pehy.TQUcow6zPgpAhtbqZiBbOU9Q.yBGoKS'),
('Cand1004', 'Priya Gupta', 'priya.gupta@example.com', 30, 'Hyderabad', '2025-02-16 12:43:43', '$2a$10$WvIo1MQnUhoo1/qg2Pehy.TQUcow6zPgpAhtbqZiBbOU9Q.yBGoKS'),
('Cand1005', 'Vikram Reddy', 'vikram.reddy@example.com', 35, 'Chennai', '2025-02-16 12:43:43', '$2a$10$WvIo1MQnUhoo1/qg2Pehy.TQUcow6zPgpAhtbqZiBbOU9Q.yBGoKS'),
('Cand1006', 'Ananya Desai', 'ananya.desai@example.com', 27, 'Pune', '2025-02-16 12:43:43', '$2a$10$WvIo1MQnUhoo1/qg2Pehy.TQUcow6zPgpAhtbqZiBbOU9Q.yBGoKS'),
('Cand1007', 'Rohan Mehta', 'rohan.mehta@example.com', 29, 'Ahmedabad', '2025-02-16 12:43:43', '$2a$10$WvIo1MQnUhoo1/qg2Pehy.TQUcow6zPgpAhtbqZiBbOU9Q.yBGoKS'),
('Cand1008', 'Sneha Joshi', 'sneha.joshi@example.com', 31, 'Kolkata', '2025-02-16 12:43:43', '$2a$10$WvIo1MQnUhoo1/qg2Pehy.TQUcow6zPgpAhtbqZiBbOU9Q.yBGoKS'),
('Cand1009', 'Arjun Kumar', 'arjun.kumar@example.com', 26, 'Jaipur', '2025-02-16 12:43:43', '$2a$10$WvIo1MQnUhoo1/qg2Pehy.TQUcow6zPgpAhtbqZiBbOU9Q.yBGoKS'),
('Cand1010', 'Isha Choudhary', 'isha.choudhary@example.com', 33, 'Lucknow', '2025-02-16 12:43:43', '$2a$10$WvIo1MQnUhoo1/qg2Pehy.TQUcow6zPgpAhtbqZiBbOU9Q.yBGoKS'),
('Cand2025001', 'Darshil Kumar', 'darshilkumar0353@gmail.com', NULL, NULL, '2025-02-18 08:17:33', '$2a$10$UGU.4N3FyZG7brrDoVaAq./S.0C7iNJy6BgTQdBX7/AwqDt8iwJ1m');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `emp_id` varchar(11) NOT NULL,
  `emp_name` varchar(60) NOT NULL,
  `emp_email` varchar(100) NOT NULL,
  `emp_password` varchar(110) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`emp_id`, `emp_name`, `emp_email`, `emp_password`) VALUES
('EMP20251000', 'Darshil Kumar', 'darshilkumar@gmail.com', '$2a$10$WvIo1MQnUhoo1/qg2Pehy.TQUcow6zPgpAhtbqZiBbOU9Q.yBGoKS'),
('EMP2025999', 'CHIRAG TYAGI', 'tyagi.chirag1234@gmail.com', '$2a$10$bMhjyMl8vhgkfYUeznIFce9JQIilxJoKvvzqC052WZdFCgKWQ/hgG');

-- --------------------------------------------------------

--
-- Table structure for table `resume`
--

CREATE TABLE `resume` (
  `resume_id` varchar(20) NOT NULL,
  `cand_id` varchar(20) NOT NULL,
  `profession_title` varchar(100) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `salary` decimal(10,2) DEFAULT NULL,
  `degree` varchar(100) DEFAULT NULL,
  `field_of_study` varchar(100) DEFAULT NULL,
  `school` varchar(100) DEFAULT NULL,
  `education_from` year(4) DEFAULT NULL,
  `education_to` year(4) DEFAULT NULL,
  `company_name` varchar(100) DEFAULT NULL,
  `job_title` varchar(100) DEFAULT NULL,
  `work_from` year(4) DEFAULT NULL,
  `work_to` year(4) DEFAULT NULL,
  `skill_name` varchar(100) DEFAULT NULL,
  `skill_proficiency` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `resume`
--

INSERT INTO `resume` (`resume_id`, `cand_id`, `profession_title`, `website`, `salary`, `degree`, `field_of_study`, `school`, `education_from`, `education_to`, `company_name`, `job_title`, `work_from`, `work_to`, `skill_name`, `skill_proficiency`) VALUES
('Resume2001', 'Cand1001', 'Software Engineer', 'https://aaravpatel.com', 120000.00, 'Bachelor', 'Computer Science', 'IIT Bombay', '2012', '2016', 'Infosys', 'Software Developer', '2016', '2018', 'Java', 90),
('Resume2002', 'Cand1001', 'Data Scientist', 'https://aaravpatel.com', 150000.00, 'Master', 'Data Science', 'IISc Bangalore', '2016', '2018', 'Google', 'Data Analyst', '2018', '2020', 'Python', 95),
('Resume2003', 'Cand1002', 'Marketing Manager', 'https://nehasharma.com', 100000.00, 'MBA', 'Marketing', 'IIM Ahmedabad', '2010', '2012', 'Hindustan Unilever', 'Marketing Executive', '2012', '2015', 'Digital Marketing', 85),
('Resume2004', 'Cand1002', 'Product Manager', 'https://nehasharma.com', 130000.00, 'MBA', 'Marketing', 'IIM Ahmedabad', '2010', '2012', 'Amazon', 'Product Manager', '2015', '2020', 'Product Strategy', 90),
('Resume2005', 'Cand1003', 'Frontend Developer', 'https://rahulsingh.com', 90000.00, 'Bachelor', 'Computer Science', 'NIT Trichy', '2015', '2019', 'TCS', 'UI Developer', '2019', '2021', 'React', 88),
('Resume2006', 'Cand1003', 'Full Stack Developer', 'https://rahulsingh.com', 110000.00, 'Bachelor', 'Computer Science', 'NIT Trichy', '2015', '2019', 'Wipro', 'Full Stack Developer', '2021', '2023', 'Node.js', 92),
('Resume2007', 'Cand1004', 'HR Manager', 'https://priyagupta.com', 95000.00, 'MBA', 'Human Resources', 'XLRI Jamshedpur', '2011', '2013', 'Tata Motors', 'HR Executive', '2013', '2016', 'Recruitment', 80),
('Resume2008', 'Cand1004', 'HR Consultant', 'https://priyagupta.com', 120000.00, 'MBA', 'Human Resources', 'XLRI Jamshedpur', '2011', '2013', 'Deloitte', 'HR Consultant', '2016', '2020', 'Employee Engagement', 85),
('Resume2009', 'Cand1005', 'Civil Engineer', 'https://vikramreddy.com', 80000.00, 'Bachelor', 'Civil Engineering', 'NIT Warangal', '2008', '2012', 'L&T Construction', 'Site Engineer', '2012', '2015', 'AutoCAD', 75),
('Resume2010', 'Cand1005', 'Project Manager', 'https://vikramreddy.com', 110000.00, 'Master', 'Civil Engineering', 'IIT Delhi', '2012', '2014', 'L&T Construction', 'Project Manager', '2015', '2020', 'Project Planning', 85),
('Resume2011', 'Cand1006', 'Graphic Designer', 'https://ananyadesai.com', 70000.00, 'Bachelor', 'Fine Arts', 'JJ School of Arts', '2013', '2017', 'Design Studio', 'Graphic Designer', '2017', '2019', 'Adobe Photoshop', 90),
('Resume2012', 'Cand1006', 'UI/UX Designer', 'https://ananyadesai.com', 95000.00, 'Bachelor', 'Fine Arts', 'JJ School of Arts', '2013', '2017', 'Zomato', 'UI/UX Designer', '2019', '2023', 'Figma', 92),
('Resume2013', 'Cand1007', 'Financial Analyst', 'https://rohanmehta.com', 100000.00, 'MBA', 'Finance', 'IIM Calcutta', '2012', '2014', 'Goldman Sachs', 'Financial Analyst', '2014', '2017', 'Financial Modeling', 88),
('Resume2014', 'Cand1007', 'Investment Banker', 'https://rohanmehta.com', 150000.00, 'MBA', 'Finance', 'IIM Calcutta', '2012', '2014', 'Morgan Stanley', 'Investment Banker', '2017', '2023', 'Valuation', 90),
('Resume2015', 'Cand1008', 'Content Writer', 'https://snehajoshi.com', 60000.00, 'Bachelor', 'English Literature', 'Delhi University', '2014', '2018', 'Times of India', 'Content Writer', '2018', '2020', 'Creative Writing', 85),
('Resume2016', 'Cand1008', 'Editor', 'https://snehajoshi.com', 80000.00, 'Bachelor', 'English Literature', 'Delhi University', '2014', '2018', 'The Hindu', 'Editor', '2020', '2023', 'Editing', 90),
('Resume2017', 'Cand1009', 'Mechanical Engineer', 'https://arjunkumar.com', 85000.00, 'Bachelor', 'Mechanical Engineering', 'IIT Madras', '2013', '2017', 'Tata Motors', 'Design Engineer', '2017', '2019', 'SolidWorks', 80),
('Resume2018', 'Cand1009', 'Automotive Engineer', 'https://arjunkumar.com', 100000.00, 'Master', 'Mechanical Engineering', 'IIT Madras', '2017', '2019', 'Mahindra', 'Automotive Engineer', '2019', '2023', 'CATIA', 85),
('Resume2019', 'Cand1010', 'Fashion Designer', 'https://ishachoudhary.com', 90000.00, 'Bachelor', 'Fashion Design', 'NIFT Mumbai', '2010', '2014', 'FabIndia', 'Fashion Designer', '2014', '2017', 'Fashion Illustration', 88),
('Resume2020', 'Cand1010', 'Design Consultant', 'https://ishachoudhary.com', 120000.00, 'Master', 'Fashion Design', 'NIFT Mumbai', '2014', '2016', 'Myntra', 'Design Consultant', '2017', '2023', 'Trend Analysis', 90),
('Resume2021', 'Cand1004', 'Data Analyst', 'https://random.com', 95000.00, 'Master', 'Data Science', 'BITS Pilani', '2016', '2018', 'Flipkart', 'Data Scientist', '2018', '2022', 'R', 88),
('Resume2022', 'Cand1010', 'Cloud Architect', 'https://random.com', 145000.00, 'Master', 'Cloud Computing', 'IIT Delhi', '2014', '2016', 'Microsoft', 'Cloud Solutions Architect', '2016', '2022', 'AWS', 92),
('Resume2023', 'Cand1007', 'Product Designer', 'https://random.com', 85000.00, 'Bachelor', 'Design', 'National Institute of Design', '2015', '2019', 'Infosys', 'UX Designer', '2019', '2023', 'Sketch', 90),
('Resume2024', 'Cand1006', 'Business Analyst', 'https://random.com', 100000.00, 'MBA', 'Business Administration', 'IIM Bangalore', '2012', '2014', 'Accenture', 'Business Analyst', '2014', '2019', 'Data Analysis', 85),
('Resume2025', 'Cand1006', 'Network Engineer', 'https://random.com', 80000.00, 'Bachelor', 'Electronics', 'NIT Trichy', '2013', '2017', 'Cisco', 'Network Engineer', '2017', '2022', 'Networking', 80);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `candidate`
--
ALTER TABLE `candidate`
  ADD PRIMARY KEY (`cand_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`emp_id`);

--
-- Indexes for table `resume`
--
ALTER TABLE `resume`
  ADD PRIMARY KEY (`resume_id`),
  ADD KEY `cand_id` (`cand_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `resume`
--
ALTER TABLE `resume`
  ADD CONSTRAINT `resume_ibfk_1` FOREIGN KEY (`cand_id`) REFERENCES `candidate` (`cand_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
