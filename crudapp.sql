-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 07, 2021 at 09:44 PM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `crudapp`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` int(18) NOT NULL,
  `name` varchar(30) NOT NULL,
  `email` varchar(40) NOT NULL,
  `amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `name`, `email`, `amount`) VALUES
(1, 'Aakansha ', 'ametar30@gmail.com', 6000),
(2, 'aryan', 'aryanmhetar0701@gmail.com', 6000),
(3, 'shruti', 'shruti@gmail.com', 5000),
(4, 'sanika', 'sanikamhetar@gmail.com', 14000),
(5, 'Sadanand ', 'sadanandmhetar1967@email.com', 60000),
(6, 'stacy', 'stacy123@gmail.com', 5000),
(7, 'pearl', 'pgethi@gmail.com', 11000),
(8, 'Neha', 'neha16@gmail.com', 11000),
(9, 'Mansi', 'mansi890@gmail.com', 11000),
(10, 'Jayesh', 'jayesh777@gmail.com', 10000),
(11, 'shrushti', 'shrush12@gmail.com', 13000);

-- --------------------------------------------------------

--
-- Table structure for table `history`
--

CREATE TABLE `history` (
  `sid` int(11) NOT NULL,
  `rname` varchar(20) NOT NULL,
  `money` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `history`
--

INSERT INTO `history` (`sid`, `rname`, `money`, `time`) VALUES
(1, 'aryan', 1000, '2021-07-06 18:27:41'),
(9, 'Neha', 1000, '2021-07-06 19:18:38'),
(8, 'Mansi', 1000, '2021-07-06 19:32:33'),
(3, 'sanika', 1000, '2021-07-06 19:39:51'),
(9, 'Jayesh', 2000, '2021-07-06 19:48:30'),
(5, 'sanika', 10000, '2021-07-06 19:52:44');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(18) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
