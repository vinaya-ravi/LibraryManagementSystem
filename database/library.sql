-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 22, 2019 at 06:31 AM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.1.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `library`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `stu` ()  NO SQL
SELECT username FROM admin$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(100) NOT NULL,
  `first` varchar(100) NOT NULL,
  `last` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `contact` varchar(100) NOT NULL,
  `pic` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `first`, `last`, `username`, `password`, `email`, `contact`, `pic`) VALUES
(1, 'ravi', 'shastri', 'ravi', '123456', 'ravi@gmail.com', '9876532', 'p.png'),
(2, 'ruby', 's', 'ruby', '123456', 'ruby@gmail.com', '7654876', 'g.jfif'),
(3, 'mukesh', 'a', 'mukesh', '234567', 'mukesh@gmail.com', '3456789', 'p.png'),
(4, 'ggg', 'fff', 'fff', '111', '111@gmail.com', '7418529630', 'p.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `bid` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `authors` varchar(100) NOT NULL,
  `edition` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL,
  `quantity` int(100) NOT NULL,
  `department` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`bid`, `name`, `authors`, `edition`, `status`, `quantity`, `department`) VALUES
(1, 'fundamentals of database systems', 'ramezelmasri', '7th', 'available', 2, 'ise'),
(2, 'principles of management', 'p.c.tripathi', '4th', 'available', 5, 'ise'),
(3, 'java the complete reference', 'herbert schildt', '7th', 'available', 2, 'ise');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(50) NOT NULL,
  `username` varchar(100) NOT NULL,
  `comment` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `username`, `comment`) VALUES
(11, 'rahul', 'hello! '),
(12, 'sara', 'machine learning books are not available.please provide it as soon as possible.');

-- --------------------------------------------------------

--
-- Table structure for table `fine`
--

CREATE TABLE `fine` (
  `username` varchar(100) NOT NULL,
  `bid` int(100) NOT NULL,
  `returned` date NOT NULL,
  `day` int(50) NOT NULL,
  `fine` double NOT NULL,
  `status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fine`
--

INSERT INTO `fine` (`username`, `bid`, `returned`, `day`, `fine`, `status`) VALUES
('rahul', 1, '2019-09-01', 31, 3.1, 'not paid'),
('sakshi', 1, '2019-09-03', 1, 0.1, 'not paid'),
('sara', 1, '0000-00-00', 1, 1.2, 'not paid'),
('sara', 1, '0000-00-00', 1, 1.3, 'not paid'),
('sara', 1, '0000-00-00', 1, 1.3, 'not paid');

-- --------------------------------------------------------

--
-- Table structure for table `issue_book`
--

CREATE TABLE `issue_book` (
  `username` varchar(100) NOT NULL,
  `bid` int(100) NOT NULL,
  `approve` varchar(100) NOT NULL,
  `issue` date NOT NULL,
  `return` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `issue_book`
--

INSERT INTO `issue_book` (`username`, `bid`, `approve`, `issue`, `return`) VALUES
('rahul', 3, 'Yes', '2019-11-18', '2019-11-21'),
('rahul', 1, '<p style=\"color:yellow;background-color:green;\">R', '2019-11-01', '2019-11-30'),
('rahul', 2, '<p style=\"color:yellow;background-color:green;\">R', '2019-09-01', '2019-09-30'),
('sakshi', 2, 'Yes', '0000-00-00', '2019-11-21'),
('sakshi', 2, 'Yes', '0000-00-00', '2019-11-21'),
('rahul', 3, 'Yes', '2019-11-18', '2019-11-21'),
('sakshi', 1, 'Yes', '0000-00-00', '2019-11-21'),
('sakshi', 3, 'Yes', '2019-11-22', '2019-11-21'),
('sakshi', 2, 'Yes', '0000-00-00', '2019-11-21'),
('sakshi', 3, 'Yes', '2019-11-22', '2019-11-21');

--
-- Triggers `issue_book`
--
DELIMITER $$
CREATE TRIGGER `date` BEFORE INSERT ON `issue_book` FOR EACH ROW SET
new.issue=NOW()
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `date1` BEFORE UPDATE ON `issue_book` FOR EACH ROW SET
new.issue=NOW()
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `first` varchar(100) NOT NULL,
  `last` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `roll` int(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `contact` varchar(100) NOT NULL,
  `pic` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`first`, `last`, `username`, `password`, `roll`, `email`, `contact`, `pic`) VALUES
('rahul', 'h', 'rahul', '123456', 11, 'rahul@gmail.com', '9876543', 'p.png'),
('sara', 'k', 'sara', '654321', 12, 'sara@gmail.com', '6543217', 'g.jfif'),
('rohit', 's', 'rohit', '56123', 13, 'rohit@gmail.com', '7654321', 'p.png'),
('pavithra', 't', 'pavithra', '987654', 14, 'pavithra@gmail.com', '8765432', 'g.jfif'),
('sakshi', 'r', 'sakshi', '654321', 14, 'sakshi@gmail.com', '6543219', 'g.jfif');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`bid`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
