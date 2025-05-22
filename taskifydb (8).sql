-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 22, 2025 at 02:57 AM
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
-- Database: `taskifydb`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `Admin_ID` int(11) NOT NULL,
  `Admin_FirstName` varchar(100) NOT NULL,
  `Admin_LastName` varchar(100) NOT NULL,
  `Admin_Email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`Admin_ID`, `Admin_FirstName`, `Admin_LastName`, `Admin_Email`) VALUES
(2, 'Susam', 'Pudasaini', 'Susam@gmail.com'),
(3, 'Susam', 'Pudasaini', 'Susam1@gmail.com'),
(4, 'Raj', 'Sharma', 'Raj1@gmail.com'),
(5, 'Sita', 'Joshi', 'Sita1@gmail.com'),
(6, 'Aarav', 'Khadka', 'Aarav1@gmail.com'),
(7, 'Priya', 'Yadav', 'Priya1@gmail.com'),
(8, 'Ankit', 'Pandey', 'Ankit1@gmail.com'),
(9, 'Neha', 'Thapa', 'Neha1@gmail.com'),
(10, 'Bikash', 'Tamang', 'Bikash1@gmail.com'),
(11, 'Maya', 'Gurung', 'Maya1@gmail.com'),
(12, 'Sanjay', 'Rai', 'Sanjay1@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `applications`
--

CREATE TABLE `applications` (
  `application_ID` int(11) NOT NULL,
  `application_Status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `applications`
--

INSERT INTO `applications` (`application_ID`, `application_Status`) VALUES
(1, 'Pending'),
(2, 'Rejected'),
(3, 'Rejected'),
(4, 'Pending'),
(5, 'Pending'),
(6, 'Pending'),
(7, 'Pending'),
(8, 'Rejected'),
(9, 'Pending'),
(10, 'Pending'),
(11, 'Pending'),
(12, 'Pending'),
(13, 'Pending'),
(14, 'Pending'),
(15, 'Pending'),
(16, 'Pending'),
(17, 'Accepted'),
(18, 'Pending'),
(19, 'Pending'),
(20, 'Pending'),
(21, 'Pending'),
(22, 'Pending'),
(23, 'Pending'),
(24, 'Pending'),
(25, 'Pending'),
(26, 'Rejected'),
(27, 'Pending'),
(28, 'Pending'),
(29, 'Pending'),
(30, 'Pending'),
(31, 'Pending'),
(32, 'Pending'),
(33, 'Pending'),
(34, 'Pending'),
(35, 'Accepted'),
(36, 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `Job_ID` int(10) NOT NULL,
  `Job_Name` varchar(100) NOT NULL,
  `Job_Description` varchar(100) NOT NULL,
  `Start_Date` date NOT NULL,
  `End_Date` date NOT NULL,
  `Salary` int(255) NOT NULL,
  `Skills_Required` varchar(100) NOT NULL,
  `Company_Picture` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`Job_ID`, `Job_Name`, `Job_Description`, `Start_Date`, `End_Date`, `Salary`, `Skills_Required`, `Company_Picture`) VALUES
(6, ' AIML engineer', 'Python, Pandas, Pytorch, Mongo', '2025-05-15', '2025-05-29', 25000, 'HTML,CSS,JavaScript', 'chatgpt.jpg'),
(7, 'Systems Project Manager at Meta', 'A hardworking and punctual manager required', '2025-05-08', '2025-05-23', 56565, 'PowerBI, MS Project , Communication Skills', 'meta.png'),
(8, 'manasd', 'xcvxcv', '2025-05-12', '2025-05-21', 7897, 'HTML,CSS,JavaScript', 'Screenshot (7).png'),
(9, 'sdfsdfsdf', 'zdfzdfzdfzdf', '2025-05-20', '2025-05-22', 454545, 'HTML,CSS,JavaScript', 'Screenshot (11).png'),
(10, 'fghfghfgh', 'fghfghfgh', '2025-05-15', '2025-05-30', 454545, 'HTML,CSS,JavaScript', 'Screenshot (8).png'),
(11, 'ArtistiQ', 'Design lead', '2025-05-19', '2025-05-24', 4545454, 'Blender, photoshop, illustrator ', 'Screenshot (7).png'),
(12, 'Figma Graphic Designer', 'Creative minds needed', '2025-05-21', '2025-05-31', 50000, 'Photoshop, illustrator, after effects', 'figma.png'),
(13, 'dasdasd', 'zxczxc', '2025-05-23', '2025-05-20', 2344234, 'zxczxc', 'Screenshot (8).png'),
(14, 'AWS product designer', 'advanced product designer required', '2025-05-21', '2025-05-30', 30000, 'high level product designer required', 'aws.logo.png');

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `Member_ID` int(11) NOT NULL,
  `Member_FirstName` varchar(50) NOT NULL,
  `Member_LastName` varchar(100) NOT NULL,
  `Member_DOB` date NOT NULL,
  `Member_Gender` varchar(50) NOT NULL,
  `Member_Email` varchar(100) NOT NULL,
  `Member_ContactNumber` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`Member_ID`, `Member_FirstName`, `Member_LastName`, `Member_DOB`, `Member_Gender`, `Member_Email`, `Member_ContactNumber`) VALUES
(55, 'hellow', 'asdasd', '1961-07-05', 'female', 'hellow23@gmail.com', '9877650123'),
(56, 'jjjj', 'jjjj', '1991-03-06', 'female', 'jjjjj@gmail.com', '9851044231'),
(57, 'Manisha', 'asdasd', '2001-03-01', 'female', 'gerty@gmail.com', '9800764431'),
(58, 'Ram', 'Yadav', '1998-03-03', 'male', 'IslingtonRAM@outlook.com', '9876084328'),
(59, 'Himani', 'Das', '1905-11-15', 'male', 'himanidas@gmail.com', '9841392993'),
(60, 'dsada', 'asdasd', '2003-02-19', 'female', 'np01cp4a@islingtoncollege.edu.np', '9810449021'),
(61, 'Susam', 'Tuladhar', '1983-02-09', 'male', 'masus@gmail.com', '9800345521'),
(62, 'Bishes', 'Chapagain', '1997-01-13', 'male', 'bisheschapa@outlook.com', '9856563221'),
(63, 'Rabina', 'sdfsdf', '1991-06-04', 'female', 'rabina123@gmail.com', '9810449083'),
(64, 'Ashika', 'Bhattarai', '1988-02-01', 'female', 'ashika@gmail.com', '9823235455'),
(65, 'Soyam', 'Dangol', '1997-02-27', 'male', 'soyam25@gmail.com', '9812231699'),
(66, 'Ashutosh', 'Shahi', '1985-07-10', 'male', 'ashu@gmail.com', '9812231343');

-- --------------------------------------------------------

--
-- Table structure for table `profiles`
--

CREATE TABLE `profiles` (
  `Profile_ID` int(11) NOT NULL,
  `Profile_Occupation` varchar(50) NOT NULL,
  `Profile_Description` varchar(100) NOT NULL DEFAULT 'Enter your description',
  `Profile_skills` varchar(255) NOT NULL,
  `Display_Picture` varchar(255) NOT NULL,
  `Achievements` varchar(255) NOT NULL,
  `Experience` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `profiles`
--

INSERT INTO `profiles` (`Profile_ID`, `Profile_Occupation`, `Profile_Description`, `Profile_skills`, `Display_Picture`, `Achievements`, `Experience`) VALUES
(20, 'sdasddsfsd', 'asdasdsdf', 'asdasd', 'Screenshot (17).png', 'asdasdsdf', 'asdasdsdf'),
(21, 'sadd', 'adasd', 'asdasd', 'Screenshot (5).png', 'asdsda', 'asdasd'),
(22, 'sdfsdf', 'sdfsdfsdf', 'sdfsdf', 'Screenshot (17).png', 'sdfsdf', 'sdfsdfsdf'),
(23, 'Project manager', 'Business minded with growth mindset', 'asdasdasd', 'Screenshot (17).png', '1st position in Science fair', '13 years of experience as a project manager'),
(24, 'Software Engineer', '24 year old software developer from dharan', 'Go and rust', 'Screenshot (8).png', ' Valedictorian, 3x SaReGaMaPa winner', '5 years work experience at white hat ltd.'),
(25, 'Engineer', 'asdasd', 'asdasd', 'default.png', 'sdasd', 'asdasda'),
(26, 'Doctor', 'MERN stack', 'asdasasd', 'Screenshot (8).png', 'asdasd', 'asdasd'),
(27, 'Doctor', 'Hardworker', 'asdasd', 'Screenshot (17).png', 'asdasd', 'asdasd'),
(28, 'QA specialist', 'Hello I am an experienced QA with 2 years', 'Django, MERN', 'Screenshot (10).png', 'first prize in HackMania', '2 years of QA at Bhairav');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `User_ID` int(10) NOT NULL,
  `User_Name` varchar(50) NOT NULL,
  `User_Type` varchar(10) NOT NULL DEFAULT 'NON-ADMIN',
  `User_Password` varchar(512) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`User_ID`, `User_Name`, `User_Type`, `User_Password`) VALUES
(34, 'RabiRayRana', 'NON-ADMIN', 'vjmJEuiTX/+yZ8Gj7ENwc8iaFEvb1cvtadcLazVqQWknAa22UFdDGIMGDW8yrfcPxugjjN9/'),
(35, 'AlexDadario', 'NON-ADMIN', 'LxDHN5qCFb+aYBHj3bKPq+0sVh3YNkUu/8+t4deQ1bRRlNY69XZE/CV7d28wBAx5u1OO1b0='),
(36, 'Alexix', 'NON-ADMIN', '+dPIQh7gz7X2YeHC4CsH2rItin/i8UcOPgvAwP1zdCRkB45V1EgmUeas6W0FRrkeTQ4+cwKp'),
(37, 'alucard', 'NON-ADMIN', 'WjtFI2Yh4pPh5eridLsZAsUkuzcSNXMEM4e/oWRlokh7mUFv3IKGPE9DRYTnV8l8tDM4Un0DKw=='),
(38, 'asdasdsad', 'NON-ADMIN', 'zLkhwtgMfzXKPd2923DczQdn3svBt3yNCd9qMYT4wR68Xnv2Ebsp3mrBantS6CEv/5yBirOyVg=='),
(39, 'qwerty', 'NON-ADMIN', '8i9oKIEToeSjNlptjxkkbhDGd0ayr8KGEh0v4U6jWWWboKN4ypnWkrnFQ+S3sDrmmHGjkcrn'),
(40, 'dasgas', 'NON-ADMIN', 'WF8z/DvoiYyYXxcM9lXFvx6e2jF+pUiahgcSMIAkQ2NyP3DTByQOb7UgVmJqgVIW3StYkrYI'),
(41, 'asdf', 'NON-ADMIN', 'VeSmpBBtQUjYRC1xFylLyGRK9hMEZ/SBVjqR+GNkpgPRS9KNwIVNFFqjo5hMpIOOZtzkrw=='),
(42, 'sdfqwe', 'NON-ADMIN', 'RM9sWjhCZK8kHm7ROZliks20gp1dbZoe+rXdERNoTx6eAGQFtb0Fj0nuTqLDREsW9AMRkp3t'),
(43, 'pppppp', 'NON-ADMIN', 'PuOLwYuJK2H7loBbNiLbmGfOkEBiA5i7AHn1VBft4xWZ9sqmScSWTvcMRb2gdgPS/5jU73FY'),
(44, 'llama', 'NON-ADMIN', 'gjSGWL7UNHfVApd0PpPfkVEfOfSBm5T9lemT8fHso+MYjXh+KIWwWb0paPjD3sI+SxEmevo='),
(45, 'popop', 'NON-ADMIN', 'Z/3liYIWXNl1/TI/xq5MRp1a3gcB+aCtC/wkEiCzgA6ZyDloyrTDM0CCahQyKdTMNTpoTv4='),
(46, 'hhhhh', 'NON-ADMIN', '0GUCbOfeVuqnohmql98zAgYQJeqTZzlwAC7paNu9ldcya/fPjULcURxvzmhXjKzy6zWvsrI='),
(47, 'xerka', 'NON-ADMIN', 'hpLvmvmLbSi0QeMGF+hL6t6DVwn3u9PgrOme1Cnr6ftkPo2viqH5NhLdqNprT2NlA9FZbw0='),
(48, 'Dora', 'NON-ADMIN', 'HCZfbIndXCA6lnq89VnZL5rsOrGEDXMuq1QxTJ/QcPTADk5zDB4LbX5hv1ihP35T3nTAEw=='),
(49, 'Kronus', 'NON-ADMIN', '1D33IWSXsgnMFy05w9bxL8ulU0loDVj8mEYhy3HX8sK8z1v8ZrJIsl6yeJ7/h+/xsbo3u0K2'),
(50, 'Kronusia', 'ADMIN', '/KqWX/2apOCK53JQ6M1oTDa0LWIcZm3Wbj2b0+6PhEAjeO4T2cCuO1W4YfQRPLHj7cDWO6jJTxw='),
(51, 'Kronusia12', 'ADMIN', 'ygqWccS57+ngmDbTkoOHJgfFFkgpFCh7SV2lQ/YuS1VmQl4p+n0nsMTuBI3k1H1vK2TtV9Qt'),
(52, 'Kronusia123', 'ADMIN', 'DxUj90SzlpWdXNiGmGm3lvwGBGhwNz54QhZn3hBj0bJn18e9Ozc1VdfAKwar4oUOuy0ulkkQ'),
(53, 'nanana', 'ADMIN', 'ScyPsPBo8Sfs6Mj25/tCdipCSkL2XQCwMOtsmlko718kSxDXiFJMUwwbmZHJ+HGUoGMuRA=='),
(54, 'nanana11', 'ADMIN', 'kg7hdlNw3H6YTuPLUSR3ZLSt6wP7iGl8C39Nfj80RvbJOLXJvt6DU1pSe7WDk1dBbdHHzA=='),
(55, 'Kala', 'NON-ADMIN', 'khjd04RRe4YUVE1yxBBauGP43+T2u6M370FfgTFWBuIagXsN8+OI22lFWYgqZ+NxHvpk+A=='),
(56, 'Kala123', 'NON-ADMIN', '7iidHnyFCVTZyrY1qkywsl+txCn5SVuk3k2NGWlXMH6TyJ9F6vStsDK6/ZhutzHUIznuwlw='),
(57, 'Bishu23', 'NON-ADMIN', 'XVrt5r7uEVvwgpWGb6BUWiXEpUYUtHqgBqvIR2Rlv1Vy8zuXlvT15otB3qWbojnTldL7fvI='),
(58, 'Bishu234', 'NON-ADMIN', 'uYb3w75/BTmmiwBbow/z9hv+nGdN8NHhCOuKqunSCRplDHwMudKsEqPaLuSbNAXM+WnlMIg='),
(59, 'alucardioqw', 'NON-ADMIN', 'D+wyaT2wqRjxNNXa7SSxGMSH3H7OSLpWpYMm45BgpHrIT3mMU/Pi6dbQNSNrSShjFkL0jWQ5JZau'),
(60, 'hakino', 'NON-ADMIN', 'IP/84G2EwpyRuv59IaDxTfSoY5caASoezLvZVRyDuiVO2b0rBCOvCVWffEjISDxLDM42BdmW'),
(62, 'burger', 'NON-ADMIN', 'PJ7bCWaj19CGX73OIA50svD0GJ174BI55ITsaFYdl8qteBghUc5cJm+LuLJInp+qn5H43wiY'),
(63, 'burger12', 'NON-ADMIN', 'KE80SOVE1njAsipZ0OZ/FF9uCyTcIBp48dsOQDjMQCJOU7yPXXXoN9vGIjKjl5aZqW8Wc/Nl'),
(64, 'qwertyu', 'NON-ADMIN', 'LUXsRrgQgD/Ws7quSQqoi0W6I5TX3skwEeWLqx7I9d2X7Mi0xrnVZNBosqR3rI0c5vyb34LYzg=='),
(65, 'qwertyuu12', 'NON-ADMIN', '8CJGQAJhjpGwtNHIEZO2dNTJ4bdCl4KOqCbeKkMWAZW6zmMfGULcbbxrTLoj6PbSHRXFJoK3'),
(66, 'Manasaas', 'NON-ADMIN', 'IY068cgMF0vGDkNXyiIcq2V/wz7SxtwnCaHjtn3ScnC6dG5BYYmzaoqG2ZxaqDnkysQPnQ8y'),
(67, 'hellow', 'NON-ADMIN', 'ed/T/oW0O8dYxr2+ZLmfZemVb4NRKHd0GGGut+pc+Udu2dpIglG8D2tyLlqZe2t+KlrpqStb'),
(68, 'jjjjj', 'NON-ADMIN', 'KJTZTL8JAupMib7dLX6IOgBjwKyAqND2CEBiLJMAmX67KfdgvRsikGy04uo39178OuUshnU='),
(69, 'gerty', 'NON-ADMIN', 'hpqPPR11Zy/UBuuXN4HAWmeka6k+4Zs1YS6gxztv8fFxsJh5F5jIEAdPzDqO1uOl2moYgPI='),
(73, 'ramyadav', 'NON-ADMIN', 'XFLqa52ZSTBzh5LmBvXjhg5+W/8GiE0RsaZUNGkT5Pu/Mavj1SJXKl2vl8mCuWXHXhUjKQ=='),
(74, 'himanidas', 'NON-ADMIN', 'T7HEeYjc4w3ldyfVYKt1s3H8KY1bVDUlO3EEzQj3WVOIIZVL8EIc6GrXd8yPE+vBMrN3V7M/'),
(75, 'dasda', 'NON-ADMIN', 'RcMyWWTn0K48WQZ096q8qLqOMWrgxcZ0LW23xLTQzBrJugxZcfazqpxMRTJgQFcM5MfnSYw='),
(76, 'susamtuladhar', 'NON-ADMIN', '9DfGMb3wP4UZZv3cKncDiPBStWzbIkv7SzLmfrLqLl6iRRYrTQUtSzzDmejs/U2BCoOLkhQ='),
(77, 'bisheschapa', 'NON-ADMIN', 'mwsStLbpBa4aKcQy1CWeAIFV6tNDL+TQ7pGejvhqYUSbxbwm0zYw/G9pMckp1njisAxB2uqY'),
(78, 'rabina123', 'NON-ADMIN', '48EVv+OJd7uG1JnYv/PKkLMNEZutlpk0R/GdKF24bO62S0zMNB6CE9L9nTOQxR6iYrm2cicm'),
(79, 'ashika', 'NON-ADMIN', '2RGp0BLoKDN8VEFZGnbqAxPvmdV+gLgChBVwYAbLwbmml2RT4VXhq4HG3dCMKYeZnhZz/eIM'),
(80, 'soyam', 'NON-ADMIN', 'Je0g0ULesTV5xV9+Gm2eI1Iev1V/Qmw+21qlgwKJNOb1pHhAGCq201c7KUEDZh+oiHNkKyQ='),
(81, 'ashuCool', 'NON-ADMIN', 'W/9DhV+4TaWEcNyDtGtyRXJVbyeeNeOOiv+Xc7LRMeSAtUPNuuXkbmPAEWlHFp4N/kN0mlM3m4k=');

-- --------------------------------------------------------

--
-- Table structure for table `users_admins`
--

CREATE TABLE `users_admins` (
  `User_ID` int(11) NOT NULL,
  `Admin_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users_admins`
--

INSERT INTO `users_admins` (`User_ID`, `Admin_ID`) VALUES
(51, 9),
(52, 11),
(53, 5),
(54, 10),
(55, 6);

-- --------------------------------------------------------

--
-- Table structure for table `users_members`
--

CREATE TABLE `users_members` (
  `User_ID` int(11) NOT NULL,
  `Member_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users_members`
--

INSERT INTO `users_members` (`User_ID`, `Member_ID`) VALUES
(73, 58),
(74, 59),
(75, 60),
(76, 61),
(77, 62),
(78, 63),
(79, 64),
(80, 65),
(81, 66);

-- --------------------------------------------------------

--
-- Table structure for table `users_members_jobs`
--

CREATE TABLE `users_members_jobs` (
  `User_ID` int(11) NOT NULL,
  `Member_ID` int(11) NOT NULL,
  `Job_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users_members_jobs`
--

INSERT INTO `users_members_jobs` (`User_ID`, `Member_ID`, `Job_ID`) VALUES
(73, 58, 6),
(73, 58, 7),
(73, 58, 10),
(73, 58, 14),
(74, 59, 11),
(74, 59, 12),
(74, 59, 13);

-- --------------------------------------------------------

--
-- Table structure for table `users_members_jobs_applications`
--

CREATE TABLE `users_members_jobs_applications` (
  `User_ID` int(11) NOT NULL,
  `Member_ID` int(11) NOT NULL,
  `Job_ID` int(11) NOT NULL,
  `Application_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users_members_jobs_applications`
--

INSERT INTO `users_members_jobs_applications` (`User_ID`, `Member_ID`, `Job_ID`, `Application_ID`) VALUES
(73, 58, 6, 35),
(73, 58, 11, 19),
(74, 59, 11, 32),
(80, 65, 6, 26),
(81, 66, 6, 36);

-- --------------------------------------------------------

--
-- Table structure for table `users_members_profiles`
--

CREATE TABLE `users_members_profiles` (
  `User_ID` int(11) NOT NULL,
  `Member_ID` int(11) NOT NULL,
  `Profile_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users_members_profiles`
--

INSERT INTO `users_members_profiles` (`User_ID`, `Member_ID`, `Profile_ID`) VALUES
(67, 55, 20),
(68, 56, 21),
(69, 57, 22),
(73, 58, 23),
(74, 59, 24),
(75, 60, 25),
(79, 64, 26),
(80, 65, 27),
(81, 66, 28);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`Admin_ID`);

--
-- Indexes for table `applications`
--
ALTER TABLE `applications`
  ADD PRIMARY KEY (`application_ID`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`Job_ID`);

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`Member_ID`);

--
-- Indexes for table `profiles`
--
ALTER TABLE `profiles`
  ADD PRIMARY KEY (`Profile_ID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`User_ID`);

--
-- Indexes for table `users_admins`
--
ALTER TABLE `users_admins`
  ADD PRIMARY KEY (`User_ID`,`Admin_ID`),
  ADD KEY `user_admins_fk2` (`Admin_ID`);

--
-- Indexes for table `users_members`
--
ALTER TABLE `users_members`
  ADD PRIMARY KEY (`User_ID`,`Member_ID`),
  ADD KEY `user_member_fk2` (`Member_ID`);

--
-- Indexes for table `users_members_jobs`
--
ALTER TABLE `users_members_jobs`
  ADD PRIMARY KEY (`User_ID`,`Member_ID`,`Job_ID`),
  ADD KEY `Users_Members_Jobs_FK2` (`Member_ID`),
  ADD KEY `Users_Members_Jobs_FK3` (`Job_ID`);

--
-- Indexes for table `users_members_jobs_applications`
--
ALTER TABLE `users_members_jobs_applications`
  ADD PRIMARY KEY (`User_ID`,`Member_ID`,`Job_ID`,`Application_ID`),
  ADD KEY `Users_Members_Jobs_apps_FK1` (`Application_ID`),
  ADD KEY `Users_Members_Jobs_app_FK3` (`Member_ID`),
  ADD KEY `Users_Member_Jobs_app_FK2` (`Job_ID`);

--
-- Indexes for table `users_members_profiles`
--
ALTER TABLE `users_members_profiles`
  ADD PRIMARY KEY (`User_ID`,`Member_ID`,`Profile_ID`),
  ADD KEY `user_member_profile_fk1` (`Member_ID`),
  ADD KEY `user_member_profile_fk2` (`Profile_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `Admin_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `applications`
--
ALTER TABLE `applications`
  MODIFY `application_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `Job_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `members`
--
ALTER TABLE `members`
  MODIFY `Member_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `profiles`
--
ALTER TABLE `profiles`
  MODIFY `Profile_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `User_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `users_admins`
--
ALTER TABLE `users_admins`
  ADD CONSTRAINT `user_admins_fk1` FOREIGN KEY (`User_ID`) REFERENCES `users` (`User_ID`),
  ADD CONSTRAINT `user_admins_fk2` FOREIGN KEY (`Admin_ID`) REFERENCES `admins` (`Admin_ID`);

--
-- Constraints for table `users_members`
--
ALTER TABLE `users_members`
  ADD CONSTRAINT `user_member_fk1` FOREIGN KEY (`User_ID`) REFERENCES `users` (`User_ID`),
  ADD CONSTRAINT `user_member_fk2` FOREIGN KEY (`Member_ID`) REFERENCES `members` (`Member_ID`);

--
-- Constraints for table `users_members_jobs`
--
ALTER TABLE `users_members_jobs`
  ADD CONSTRAINT `Users_Members_Jobs_FK1` FOREIGN KEY (`User_ID`) REFERENCES `users` (`User_ID`),
  ADD CONSTRAINT `Users_Members_Jobs_FK2` FOREIGN KEY (`Member_ID`) REFERENCES `members` (`Member_ID`),
  ADD CONSTRAINT `Users_Members_Jobs_FK3` FOREIGN KEY (`Job_ID`) REFERENCES `jobs` (`Job_ID`);

--
-- Constraints for table `users_members_jobs_applications`
--
ALTER TABLE `users_members_jobs_applications`
  ADD CONSTRAINT `Users_Member_Jobs_app_FK2` FOREIGN KEY (`Job_ID`) REFERENCES `jobs` (`Job_ID`),
  ADD CONSTRAINT `Users_Member_Jobs_app_FK4` FOREIGN KEY (`User_ID`) REFERENCES `users` (`User_ID`),
  ADD CONSTRAINT `Users_Members_Jobs_app_FK3` FOREIGN KEY (`Member_ID`) REFERENCES `members` (`Member_ID`),
  ADD CONSTRAINT `Users_Members_Jobs_apps_FK1` FOREIGN KEY (`Application_ID`) REFERENCES `applications` (`application_ID`);

--
-- Constraints for table `users_members_profiles`
--
ALTER TABLE `users_members_profiles`
  ADD CONSTRAINT `user_member_profile_fk1` FOREIGN KEY (`Member_ID`) REFERENCES `members` (`Member_ID`),
  ADD CONSTRAINT `user_member_profile_fk2` FOREIGN KEY (`Profile_ID`) REFERENCES `profiles` (`Profile_ID`),
  ADD CONSTRAINT `user_member_profile_fk3` FOREIGN KEY (`User_ID`) REFERENCES `users` (`User_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
