-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 10, 2024 at 11:26 AM
-- Server version: 8.0.39
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bookstore`
--

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `BookID` varchar(50) NOT NULL,
  `BookTitle` varchar(200) DEFAULT NULL,
  `Price` double(12,2) DEFAULT NULL,
  `Author` varchar(128) DEFAULT NULL,
  `Type` varchar(128) DEFAULT NULL,
  `Image` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`BookID`, `BookTitle`, `Price`, `Author`, `Type`, `Image`) VALUES
('B-001', 'Games Untold: An Inheritance Games Collection', 150000.00, 'Jennifer Lynn Barnes', 'Fiction', 'image/gamesuntold.jpg'),
('B-002', 'The Sun Flower House', 150000.00, 'Adriana Allegri', 'Historical Fiction', 'image/thesunflowerhouse.jpg'),
('B-003', 'You Can\'t Hurt Me', 100000.00, 'Emma Cook', 'Thriller', 'image/youcanthurtme.jpg'),
('B-004', 'Variation', 75000.00, 'Rebecca Yarros', 'Fiction', 'image/variation.jpg'),
('B-005', 'The Songbird & the Heart of Stone', 99000.00, 'Carissa Broadbent', 'Fantasy', 'image/thesongbird.jpg'),
('B-006', 'Skyshade', 100000.00, 'Alex Aster', 'Fantasy', 'image/skyshade.jpg'),
('B-007', 'Where the Library Hides', 70000.00, 'Isabel Ibanez', 'Fantasy', 'image/wherethelibraryhides.jpg'),
('B-008', 'Tale of the Heart Queen', 120000.00, 'Jennifer Lynn Barnes', 'Fantasy', 'image/taleoftheheartqueen.jpg'),
('B-009', 'Harry Potter and the Sorcerer’s Stone', 150000.00, 'J.K. Rowling', 'Fantasy', 'image/Harry Potter and the Sorcerer’s Stone.jpg'),
('B-010', 'Lincoln vs. Davis: The War of the Presidents', 125000.00, 'Nigel Hamilton', 'Biography', 'image/lincolnvsdavisthewarofthepresidents.jpg'),
('B-011', 'The Lies We Leave Behind', 100000.00, 'Noelle Salazar', 'Historical Fiction', 'image/theliesweleavebehind.jpg'),
('B-012', 'The Improvisers', 160000.00, 'Nicole Glover', 'HIstorical Fiction', 'image/theimprovisers.jpg'),
('B-013', 'Eleanore of Avignon', 175000.00, 'Elizabeth DeLozier', 'Historical Fiction', 'image/eleanoreofavignon.jpg'),
('B-014', 'Her Lotus Year: China, the Roaring Twenties, and the Making of Wallis Simpson', 140000.00, 'Paul French', 'Biography', 'image/herlotusyearchina,theroaringtwenties,andthemakingofwallissimpson.jpg'),
('B-015', 'One Punch-Man', 120000.00, 'One', 'Manga', 'image/onepunchman.jpg'),
('B-016', 'ONE PIECE', 110000.00, 'Eiichiro Oda', 'Manga', 'image/onepiece.jpg'),
('B-017', 'The Shining', 160000.00, 'Stephen King', 'Classics', 'image/theshining.jpg'),
('B-018', 'Romeo and Juliet', 150000.00, 'William Shakespeare', 'Classics', 'image/romeoandjuliet'),
('B-019', 'Deadly Animals', 70000.00, 'Marie Tierney', 'Crime', 'image/deadlyanimals.jpg'),
('B-020', 'To Die For', 65000.00, 'David Baldacci', 'Crime', 'image/todiefor.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `CartID` int NOT NULL,
  `CustomerID` int DEFAULT NULL,
  `BookID` varchar(50) DEFAULT NULL,
  `Price` double(12,2) DEFAULT NULL,
  `Quantity` int DEFAULT NULL,
  `TotalPrice` double(12,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `CustomerID` int NOT NULL,
  `CustomerName` varchar(128) DEFAULT NULL,
  `CustomerPhone` varchar(12) DEFAULT NULL,
  `CustomerIC` varchar(14) DEFAULT NULL,
  `CustomerEmail` varchar(200) DEFAULT NULL,
  `CustomerAddress` varchar(200) DEFAULT NULL,
  `CustomerGender` varchar(10) DEFAULT NULL,
  `UserID` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`CustomerID`, `CustomerName`, `CustomerPhone`, `CustomerIC`, `CustomerEmail`, `CustomerAddress`, `CustomerGender`, `UserID`) VALUES
(1, 'John Thor', '012345678901', NULL, 'Johnt@gmail.com', 'UMN', 'Male', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `OrderID` int NOT NULL,
  `CustomerID` int DEFAULT NULL,
  `BookID` varchar(50) DEFAULT NULL,
  `DatePurchase` datetime DEFAULT NULL,
  `Quantity` int DEFAULT NULL,
  `TotalPrice` double(12,2) DEFAULT NULL,
  `Status` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `UserID` int NOT NULL,
  `UserName` varchar(128) DEFAULT NULL,
  `Password` varchar(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`UserID`, `UserName`, `Password`) VALUES
(1, 'JohnT', '12345');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`BookID`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`CartID`),
  ADD KEY `BookID` (`BookID`),
  ADD KEY `CustomerID` (`CustomerID`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`CustomerID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`OrderID`),
  ADD KEY `BookID` (`BookID`),
  ADD KEY `CustomerID` (`CustomerID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`UserID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `CartID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `CustomerID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `OrderID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `UserID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`BookID`) REFERENCES `book` (`BookID`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`BookID`) REFERENCES `book` (`BookID`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
