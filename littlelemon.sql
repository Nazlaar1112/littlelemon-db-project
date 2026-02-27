-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 27, 2026 at 11:08 AM
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
-- Database: `littlelemon`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddBooking` (IN `bookingDate` DATE, IN `tableNo` INT, IN `guests` INT, IN `custID` INT)   BEGIN
    INSERT INTO Bookings (BookingDate, TableNumber, NumberOfGuests, CustomerID)
    VALUES (bookingDate, tableNo, guests, custID);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `CancelBooking` (IN `bookingID` INT)   BEGIN
    DELETE FROM Bookings
    WHERE BookingID = bookingID;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetMaxQuantity` ()   BEGIN
    SELECT MAX(NumberOfGuests) AS MaxGuests
    FROM Bookings;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ManageBooking` (IN `bookingDate` DATE, IN `tableNo` INT)   BEGIN
    SELECT *
    FROM Bookings
    WHERE BookingDate = bookingDate
    AND TableNumber = tableNo;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateBooking` (IN `bookingID` INT, IN `newDate` DATE)   BEGIN
    UPDATE Bookings
    SET BookingDate = newDate
    WHERE BookingID = bookingID;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `BookingID` int(11) NOT NULL,
  `BookingDate` date DEFAULT NULL,
  `TableNumber` int(11) DEFAULT NULL,
  `NumberOfGuests` int(11) DEFAULT NULL,
  `CustomerID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`BookingID`, `BookingDate`, `TableNumber`, `NumberOfGuests`, `CustomerID`) VALUES
(3, '2026-03-01', 1, 2, 1),
(4, '2026-03-02', 2, 4, 1),
(5, '2026-03-03', 3, 6, 1),
(6, '2026-03-04', 1, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `CustomerID` int(11) NOT NULL,
  `CustomerName` varchar(100) DEFAULT NULL,
  `ContactNumber` varchar(20) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`CustomerID`, `CustomerName`, `ContactNumber`, `Email`) VALUES
(1, 'Nazla', '08123456789', 'nazla@email.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`BookingID`),
  ADD KEY `CustomerID` (`CustomerID`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`CustomerID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `BookingID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `CustomerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customers` (`CustomerID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
