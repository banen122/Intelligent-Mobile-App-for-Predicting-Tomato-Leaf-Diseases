-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 26, 2022 at 09:19 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.3.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mobileintelligent`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity`
--

CREATE TABLE `activity` (
  `activity_id` int(8) NOT NULL,
  `farmer_id` int(8) NOT NULL,
  `farm_id` int(8) NOT NULL,
  `crop_id` int(8) NOT NULL,
  `disease_id` int(8) NOT NULL,
  `clinic_id` int(8) NOT NULL,
  `treatment_id` int(8) NOT NULL,
  `image_id` int(8) NOT NULL,
  `diagnose_state` enum('Normal','Unnormal') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `cliniccenter`
--

CREATE TABLE `cliniccenter` (
  `clinic_id` int(8) NOT NULL,
  `clinic_name` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `location` varchar(50) NOT NULL,
  `specialist` varchar(50) NOT NULL,
  `work_time` time NOT NULL,
  `phone_number` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cliniccenter`
--

INSERT INTO `cliniccenter` (`clinic_id`, `clinic_name`, `Email`, `location`, `specialist`, `work_time`, `phone_number`) VALUES
(1, 'Ashty', 'Ali@yahoo.com', 'sulaymaniyah', 'Ali', '10:00:00', '7700608801');

-- --------------------------------------------------------

--
-- Table structure for table `crop`
--

CREATE TABLE `crop` (
  `crop_id` int(8) NOT NULL,
  `farm_id` int(8) NOT NULL,
  `crop_name` varchar(50) NOT NULL,
  `type` enum('summer','winter') NOT NULL,
  `state` enum('cover','uncover') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `crop`
--

INSERT INTO `crop` (`crop_id`, `farm_id`, `crop_name`, `type`, `state`) VALUES
(1, 676, 'tomato', 'summer', 'cover'),
(8, 704, 'tomato', 'winter', 'cover'),
(20, 734, 'tomato', 'summer', 'cover'),
(26, 740, 'tomato', 'summer', 'cover');

-- --------------------------------------------------------

--
-- Table structure for table `disease`
--

CREATE TABLE `disease` (
  `disease_id` int(8) NOT NULL,
  `crop_id` int(8) NOT NULL,
  `disease_name` varchar(50) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `treatment_id` int(8) NOT NULL,
  `disease_number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `disease`
--

INSERT INTO `disease` (`disease_id`, `crop_id`, `disease_name`, `reason`, `treatment_id`, `disease_number`) VALUES
(1, 1, 'Tomato__Tomato_YellowLeaf__Curl_Virus', '...', 1, 1),
(2, 1, 'Tomato__Target_Spot', '...', 1, 2),
(3, 1, 'Tomato__Tomato_mosaic_virus', '...', 1, 3),
(4, 1, 'Tomato_Spider_mites_Two_spotted_spider_mite', '...', 1, 4),
(5, 1, 'Tomato_Septoria_leaf_spot', '...', 1, 5),
(6, 1, 'Tomato_Bacterial_spot', '...', 1, 6),
(7, 1, 'Tomato_Early_blight', '...', 1, 7),
(8, 1, 'Tomato_Late_blight', '...', 1, 8),
(9, 1, 'Tomato_Leaf_Mold', '...', 1, 9),
(10, 1, 'Tomato_healthy', '...', 1, 10);

-- --------------------------------------------------------

--
-- Table structure for table `farm`
--

CREATE TABLE `farm` (
  `farm_id` int(8) NOT NULL,
  `farmer_id` int(8) NOT NULL,
  `farm_name` varchar(50) NOT NULL,
  `location` varchar(50) NOT NULL,
  `space` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `farm`
--

INSERT INTO `farm` (`farm_id`, `farmer_id`, `farm_name`, `location`, `space`) VALUES
(676, 122, 'salimstreet', 'erbil', '100'),
(693, 130, 'hellodd', 'iraq', '500'),
(694, 132, 'basrah', '300', '500'),
(695, 133, 'basrah', '200', '600'),
(696, 134, 'dczc', 'fef as', '700'),
(697, 135, 'fgj', '138', 'basrah'),
(698, 137, 'ff', 'fff', '800'),
(699, 138, 'bbbb', '123', 'bbbb'),
(701, 140, 'lll', '1234', 'lala'),
(702, 141, 'basrah', '100', 'vvv'),
(704, 145, 'iraq', 'sulaymaniyah', '100'),
(706, 147, 'suha', 'sulaymaniyah', '100'),
(709, 159, 'ashty', 'sulaymaniyah', '100'),
(710, 160, 'yan', 'sulaymaniyah', '100'),
(713, 168, 'layan', 'sayan', '100'),
(714, 169, 'aaa', 'erbil', '100'),
(715, 171, 'aaa', 'erbil', '100'),
(716, 173, 'tomato', 'winter', 'covered'),
(717, 174, 'tomato', 'winter', 'covered'),
(718, 175, 'tomato', 'winter', 'covered'),
(719, 176, 'tomato', 'winter', 'covered'),
(720, 176, 'tomato', 'winter', 'covered'),
(721, 178, 'tomato', 'winter', 'covered'),
(722, 178, 'tomato', 'winter', 'covered'),
(723, 180, 'tomato', 'winter', 'covered'),
(724, 181, 'tomato', 'winter', 'covered'),
(725, 183, 'tomato', 'winter', 'covered'),
(726, 183, 'tomato', 'winter', 'covered'),
(727, 184, 'tomato', 'winter', 'covered'),
(728, 185, 'aaa', 'winter', 'covered'),
(730, 187, 'aaa', 'erbil', '100'),
(734, 123, 'banen', 'sulaymaniyah', '100'),
(740, 203, 'mustafa farm', 'Sulaymaniyah', '100');

-- --------------------------------------------------------

--
-- Table structure for table `farmer`
--

CREATE TABLE `farmer` (
  `id_farmer` int(8) NOT NULL,
  `farmer_name` varchar(50) NOT NULL,
  `phone_number` varchar(12) NOT NULL,
  `password` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `farmer`
--

INSERT INTO `farmer` (`id_farmer`, `farmer_name`, `phone_number`, `password`) VALUES
(111, ' hala kkk', '   453541234', ''),
(122, 'ali', '7700815050', '12345678'),
(123, 'banen', '7700608801', '123456'),
(125, 'ali1', '07700815050', '97fa0dc71d34c84c91324c87f9936698'),
(126, 'banen12', '7700608801', 'e10adc3949ba59abbe56e057f20f883e'),
(127, 'banen123', '7700608801', 'e10adc3949ba59abbe56e057f20f883e'),
(128, 'banen1234', '7700608801', 'e10adc3949ba59abbe56e057f20f883e'),
(129, 'banennn', '7700608801', 'e10adc3949ba59abbe56e057f20f883e'),
(130, 'ahmed12f', '7700608801', '123456'),
(131, 'ali3', '7700608801', 'e10adc3949ba59abbe56e057f20f883e'),
(132, 'ali33', '7700608801', '123456'),
(133, 'banen3', '7700608801', '123456'),
(134, 'banen54', '7700608801', '123456'),
(135, 'alll', '7700608801', 'e10adc3949ba59abbe56e057f20f883e'),
(136, 'saeed', '7700608801', 'e10adc3949ba59abbe56e057f20f883e'),
(137, 'saeed12', '7708889952', '123456'),
(138, 'lway', '7708889952', '123456'),
(139, 'lway12', '7708889952', 'e10adc3949ba59abbe56e057f20f883e'),
(140, 'bbbb', '7708889952', 'e10adc3949ba59abbe56e057f20f883e'),
(141, 'zzzz', '7708889952', 'e10adc3949ba59abbe56e057f20f883e'),
(142, 'banen12345', '7708889952', 'e10adc3949ba59abbe56e057f20f883e'),
(144, 'guest', '0000000000', '***************'),
(145, 'mohammed', '7700608801', '123456'),
(146, 'kareem', '7700608801', '123456'),
(147, 'suha', '7700608801', 'e10adc3949ba59abbe56e057f20f883e'),
(148, 'alikkk', '07700608801', '123456'),
(149, 'banenssa', '7700608801', '123456'),
(150, 'banenssas', '7700608801', '123456'),
(151, 'pain', '7700608801', '123456'),
(159, 'dororo', '7700608801', '123456'),
(160, 'ban', '07700608801', '123456'),
(161, 'banentr', '7700608801', '123456'),
(162, 'banensss', '7700608801', '123456'),
(163, 'noor', '7700608801', '123456'),
(168, 'suhan', '7700608801', '123456'),
(169, 'kala', '7700608801', '123456'),
(171, 'kala12', '7700608801', '123456'),
(173, 'kala12df', '7700608801', '123456'),
(174, 'kala12dfdff', '7700608801', '123456'),
(175, 'kala12dfdfffgh', '7700608801', '123456'),
(176, 'kala12dfdfffghffg', '7700608801', '123456'),
(178, 'sia', '7700608801', '123456'),
(180, 'sia1', '7700608801', '123456'),
(181, 'sia12', '7700608801', '123456'),
(183, 'sia123', '7700608801', '123456'),
(184, 'sia1234', '7700608801', '123456'),
(185, 'sia12345', '7700608801', '123456'),
(187, 'success', '7700608801', '123456'),
(197, 'banentaher`', '7700608801', 'e10adc3949ba59abbe56e057f20f883e'),
(198, 'banentaher`12', '7700608801', 'e10adc3949ba59abbe56e057f20f883e'),
(199, 'banentaher12', '7700608801', 'e10adc3949ba59abbe56e057f20f883e'),
(200, 'banentaher123', '7700608801', 'e10adc3949ba59abbe56e057f20f883e'),
(203, 'mustafa', '7700608801', 'm123456');

-- --------------------------------------------------------

--
-- Table structure for table `farmermessage`
--

CREATE TABLE `farmermessage` (
  `message_id` int(11) NOT NULL,
  `farmer_name` varchar(100) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `topic` text NOT NULL,
  `datetime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `farmermessage`
--

INSERT INTO `farmermessage` (`message_id`, `farmer_name`, `subject`, `topic`, `datetime`) VALUES
(1, 'banen', 'suggestion', 'Hello,is it possible to add the detection other than tomato,Thank you', '2022-05-26 04:51:28'),
(2, 'mustafa', 'ss', 'ss', '2022-05-26 04:54:42'),
(3, 'ahmed12f', 'gg', 'gg', '2022-05-26 04:08:30');

-- --------------------------------------------------------

--
-- Table structure for table `image`
--

CREATE TABLE `image` (
  `image_id` int(8) NOT NULL,
  `image_name` varchar(50) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `path` text NOT NULL,
  `farmer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `image`
--

INSERT INTO `image` (`image_id`, `image_name`, `date`, `path`, `farmer_id`) VALUES
(58, 'IMG281759420.jpg', '2022-04-17 01:33:27', 'http://192.168.1.9/matlabwithandroid/images//IMG281759420.jpg', 111),
(59, 'IMG634947521.jpg', '2022-04-17 01:34:18', 'http://192.168.1.9/matlabwithandroid/images//IMG634947521.jpg', 111),
(60, 'IMG1088747200.jpg', '2022-04-17 01:35:41', 'http://192.168.1.9/matlabwithandroid/images//IMG1088747200.jpg', 111),
(61, 'IMG513044290.jpg', '2022-04-17 01:37:01', 'http://192.168.1.9/matlabwithandroid/images//IMG513044290.jpg', 111),
(62, 'IMG379438912.jpg', '2022-04-17 01:54:13', 'http://192.168.1.9/matlabwithandroid/images//IMG379438912.jpg', 111),
(63, 'IMG823395025.jpg', '2022-04-17 01:56:31', 'http://192.168.1.9/matlabwithandroid/images//IMG823395025.jpg', 111),
(64, 'IMG84243433.jpg', '2022-04-17 01:57:53', 'http://192.168.1.9/matlabwithandroid/images//IMG84243433.jpg', 111),
(65, 'IMG1468007421.jpg', '2022-04-17 02:10:29', 'http://192.168.1.9/matlabwithandroid/images//IMG1468007421.jpg', 111),
(66, 'IMG1196911743.jpg', '2022-04-17 02:11:36', 'http://192.168.1.9/matlabwithandroid/images//IMG1196911743.jpg', 111),
(67, 'IMG1447665612.jpg', '2022-04-17 02:12:28', 'http://192.168.1.9/matlabwithandroid/images//IMG1447665612.jpg', 111),
(68, 'IMG912809748.jpg', '2022-04-17 02:13:31', 'http://192.168.1.9/matlabwithandroid/images//IMG912809748.jpg', 111),
(69, 'IMG2103556886.jpg', '2022-04-17 02:14:10', 'http://192.168.1.9/matlabwithandroid/images//IMG2103556886.jpg', 111),
(70, 'IMG348263623.jpg', '2022-04-17 02:15:32', 'http://192.168.1.9/matlabwithandroid/images//IMG348263623.jpg', 111),
(71, 'IMG669652242.jpg', '2022-04-17 02:17:05', 'http://192.168.1.9/matlabwithandroid/images//IMG669652242.jpg', 111),
(72, 'IMG1460789749.jpg', '2022-04-17 02:17:18', 'http://192.168.1.9/matlabwithandroid/images//IMG1460789749.jpg', 111),
(73, 'IMG1302673847.jpg', '2022-04-17 02:22:53', 'http://192.168.1.9/matlabwithandroid/images//IMG1302673847.jpg', 111),
(74, 'IMG1456144916.jpg', '2022-04-17 02:23:30', 'http://192.168.1.9/matlabwithandroid/images//IMG1456144916.jpg', 111),
(75, 'IMG1679133464.jpg', '2022-04-17 02:34:05', 'http://192.168.1.9/matlabwithandroid/images//IMG1679133464.jpg', 111),
(76, 'IMG1016064030.jpg', '2022-04-17 02:39:55', 'http://192.168.1.9/matlabwithandroid/images//IMG1016064030.jpg', 111),
(77, 'IMG794820085.jpg', '2022-04-17 02:40:45', 'http://192.168.1.9/matlabwithandroid/images//IMG794820085.jpg', 111),
(78, 'IMG1188202879.jpg', '2022-04-17 02:43:19', 'http://192.168.1.9/matlabwithandroid/images//IMG1188202879.jpg', 111),
(79, 'IMG1392827783.jpg', '2022-04-17 02:54:33', 'http://192.168.1.9/matlabwithandroid/images//IMG1392827783.jpg', 111),
(80, 'IMG1118972766.jpg', '2022-04-17 02:55:52', 'http://192.168.1.9/matlabwithandroid/images//IMG1118972766.jpg', 111),
(81, 'IMG2090383493.jpg', '2022-04-17 03:04:16', 'http://192.168.1.9/matlabwithandroid/images//IMG2090383493.jpg', 111),
(82, 'IMG323093670.jpg', '2022-04-17 03:05:14', 'http://192.168.1.9/matlabwithandroid/images//IMG323093670.jpg', 111),
(83, 'IMG1741298401.jpg', '2022-04-17 03:08:01', 'http://192.168.1.9/matlabwithandroid/images//IMG1741298401.jpg', 111),
(84, 'IMG1197390472.jpg', '2022-04-17 03:09:07', 'http://192.168.1.9/matlabwithandroid/images//IMG1197390472.jpg', 111),
(85, 'IMG2121022003.jpg', '2022-04-17 03:10:43', 'http://192.168.1.9/matlabwithandroid/images//IMG2121022003.jpg', 111),
(86, 'IMG1797004387.jpg', '2022-04-17 03:21:28', 'http://192.168.1.9/matlabwithandroid/images//IMG1797004387.jpg', 111),
(87, 'IMG342978660.jpg', '2022-04-17 03:31:12', 'http://192.168.1.9/matlabwithandroid/images//IMG342978660.jpg', 111),
(88, 'IMG2038824084.jpg', '2022-04-17 03:31:37', 'http://192.168.1.9/matlabwithandroid/images//IMG2038824084.jpg', 111),
(89, 'IMG615856075.jpg', '2022-04-17 03:39:15', 'http://192.168.1.9/matlabwithandroid/images//IMG615856075.jpg', 111),
(90, 'IMG685737762.jpg', '2022-04-17 03:40:10', 'http://192.168.1.9/matlabwithandroid/images//IMG685737762.jpg', 111),
(91, 'IMG1967079637.jpg', '2022-04-17 03:40:32', 'http://192.168.1.9/matlabwithandroid/images//IMG1967079637.jpg', 111),
(92, 'IMG1391631407.jpg', '2022-04-17 03:41:48', 'http://192.168.1.9/matlabwithandroid/images//IMG1391631407.jpg', 111),
(93, 'IMG1069810796.jpg', '2022-04-17 03:43:38', 'http://192.168.1.9/matlabwithandroid/images//IMG1069810796.jpg', 111),
(94, 'IMG1332514632.jpg', '2022-04-17 09:47:47', 'http://172.20.10.2/matlabwithandroid/images//IMG1332514632.jpg', 111),
(95, 'IMG1077991878.jpg', '2022-04-17 09:48:53', 'http://172.20.10.2/matlabwithandroid/images//IMG1077991878.jpg', 111),
(96, 'IMG814517938.jpg', '2022-04-17 09:51:02', 'http://172.20.10.2/matlabwithandroid/images//IMG814517938.jpg', 111),
(97, 'IMG848939653.jpg', '2022-04-17 09:52:39', 'http://172.20.10.2/matlabwithandroid/images//IMG848939653.jpg', 111),
(98, 'IMG1548999684.jpg', '2022-04-17 09:55:27', 'http://172.20.10.2/matlabwithandroid/images//IMG1548999684.jpg', 111),
(99, 'IMG1359863077.jpg', '2022-04-17 09:58:16', 'http://172.20.10.2/matlabwithandroid/images//IMG1359863077.jpg', 111),
(100, 'IMG320069011.jpg', '2022-04-17 10:01:03', 'http://172.20.10.2/matlabwithandroid/images//IMG320069011.jpg', 111),
(101, 'IMG1007000950.jpg', '2022-04-17 10:03:09', 'http://172.20.10.2/matlabwithandroid/images//IMG1007000950.jpg', 111),
(102, 'IMG2041413660.jpg', '2022-04-17 10:03:52', 'http://172.20.10.2/matlabwithandroid/images//IMG2041413660.jpg', 111),
(103, 'IMG14283578.jpg', '2022-04-17 10:05:01', 'http://172.20.10.2/matlabwithandroid/images//IMG14283578.jpg', 111),
(104, 'IMG2042146434.jpg', '2022-04-17 01:24:45', 'http://192.168.1.9/matlabwithandroid/images//IMG2042146434.jpg', 111),
(105, 'IMG1064092770.jpg', '2022-04-17 01:31:02', 'http://192.168.1.9/matlabwithandroid/images//IMG1064092770.jpg', 111),
(106, 'IMG631574598.jpg', '2022-04-17 01:31:57', 'http://192.168.1.9/matlabwithandroid/images//IMG631574598.jpg', 111),
(107, 'IMG432767663.jpg', '2022-04-17 01:36:33', 'http://192.168.1.9/matlabwithandroid/images//IMG432767663.jpg', 111),
(108, 'IMG146428194.jpg', '2022-04-17 01:50:41', 'http://192.168.1.9/matlabwithandroid/images//IMG146428194.jpg', 111),
(109, 'IMG1949590299.jpg', '2022-04-17 01:58:11', 'http://192.168.1.9/matlabwithandroid/images//IMG1949590299.jpg', 111),
(110, 'IMG511319173.jpg', '2022-04-17 02:02:53', 'http://192.168.1.9/matlabwithandroid/images//IMG511319173.jpg', 111),
(111, 'IMG159743617.jpg', '2022-04-17 02:07:56', 'http://192.168.1.9/matlabwithandroid/images//IMG159743617.jpg', 111),
(112, 'IMG1202537287.jpg', '2022-04-17 02:13:05', 'http://192.168.1.9/matlabwithandroid/images//IMG1202537287.jpg', 111),
(113, 'IMG1596770798.jpg', '2022-04-17 02:14:05', 'http://192.168.1.9/matlabwithandroid/images//IMG1596770798.jpg', 111),
(114, 'IMG1530413207.jpg', '2022-04-17 02:30:45', 'http://192.168.1.9/matlabwithandroid/images//IMG1530413207.jpg', 111),
(115, 'IMG1167518726.jpg', '2022-04-17 02:39:46', 'http://192.168.1.9/matlabwithandroid/images//IMG1167518726.jpg', 111),
(116, 'IMG808910487.jpg', '2022-04-17 02:41:23', 'http://192.168.1.9/matlabwithandroid/images//IMG808910487.jpg', 111),
(117, 'IMG449511685.jpg', '2022-04-17 02:42:19', 'http://192.168.1.9/matlabwithandroid/images//IMG449511685.jpg', 111),
(118, 'IMG390598887.jpg', '2022-04-17 02:49:21', 'http://192.168.1.9/matlabwithandroid/images//IMG390598887.jpg', 111),
(119, 'IMG2055031708.jpg', '2022-04-17 02:50:35', 'http://192.168.1.9/matlabwithandroid/images//IMG2055031708.jpg', 111),
(120, 'IMG1668703619.jpg', '2022-04-17 02:51:21', 'http://192.168.1.9/matlabwithandroid/images//IMG1668703619.jpg', 111),
(121, 'IMG1210399879.jpg', '2022-04-17 02:52:14', 'http://192.168.1.9/matlabwithandroid/images//IMG1210399879.jpg', 111),
(122, 'IMG992424157.jpg', '2022-04-17 02:54:53', 'http://192.168.1.9/matlabwithandroid/images//IMG992424157.jpg', 111),
(123, 'IMG720865669.jpg', '2022-04-17 02:55:24', 'http://192.168.1.9/matlabwithandroid/images//IMG720865669.jpg', 111),
(124, 'IMG543110320.jpg', '2022-04-17 08:53:14', 'http://192.168.1.9/matlabwithandroid/images//IMG543110320.jpg', 111),
(125, 'IMG785009769.jpg', '2022-04-17 08:56:44', 'http://192.168.1.9/matlabwithandroid/images//IMG785009769.jpg', 111),
(126, 'IMG1647837735.jpg', '2022-04-17 10:28:26', 'http://192.168.1.9/matlabwithandroid/images//IMG1647837735.jpg', 111),
(127, 'IMG140948799.jpg', '2022-04-17 10:29:09', 'http://192.168.1.9/matlabwithandroid/images//IMG140948799.jpg', 111),
(128, 'IMG919757280.jpg', '2022-04-18 11:13:21', 'http://192.168.1.9/matlabwithandroid/images//IMG919757280.jpg', 111),
(129, 'IMG1689032678.jpg', '2022-04-18 11:15:35', 'http://192.168.1.9/matlabwithandroid/images//IMG1689032678.jpg', 111),
(130, 'IMG1242413104.jpg', '2022-04-18 11:24:05', 'http://192.168.1.9/matlabwithandroid/images//IMG1242413104.jpg', 111),
(131, 'IMG1183012438.jpg', '2022-04-18 11:24:08', 'http://192.168.1.9/matlabwithandroid/images//IMG1183012438.jpg', 111),
(132, 'IMG1427409385.jpg', '2022-04-18 11:30:48', 'http://192.168.1.9/matlabwithandroid/images//IMG1427409385.jpg', 111),
(133, 'IMG1437135990.jpg', '2022-04-18 11:59:18', 'http://192.168.1.9/matlabwithandroid/images//IMG1437135990.jpg', 111),
(134, 'IMG943285855.jpg', '2022-04-19 12:08:08', 'http://192.168.1.9/matlabwithandroid/images//IMG943285855.jpg', 111),
(135, 'IMG1105661295.jpg', '2022-04-19 12:13:00', 'http://192.168.1.9/matlabwithandroid/images//IMG1105661295.jpg', 111),
(136, 'IMG1233797123.jpg', '2022-04-19 12:15:49', 'http://192.168.1.9/matlabwithandroid/images//IMG1233797123.jpg', 111),
(137, 'IMG2075949308.jpg', '2022-04-19 12:17:49', 'http://192.168.1.9/matlabwithandroid/images//IMG2075949308.jpg', 111),
(138, 'IMG958341550.jpg', '2022-04-19 12:19:34', 'http://192.168.1.9/matlabwithandroid/images//IMG958341550.jpg', 111),
(139, 'IMG450599337.jpg', '2022-04-19 12:20:31', 'http://192.168.1.9/matlabwithandroid/images//IMG450599337.jpg', 111),
(140, 'IMG798448113.jpg', '2022-04-19 12:21:51', 'http://192.168.1.9/matlabwithandroid/images//IMG798448113.jpg', 111),
(141, 'IMG1928829192.jpg', '2022-04-19 12:23:18', 'http://192.168.1.9/matlabwithandroid/images//IMG1928829192.jpg', 111),
(142, 'IMG980877844.jpg', '2022-04-19 12:26:04', 'http://192.168.1.9/matlabwithandroid/images//IMG980877844.jpg', 111),
(143, 'IMG901390726.jpg', '2022-04-19 12:29:00', 'http://192.168.1.9/matlabwithandroid/images//IMG901390726.jpg', 111),
(144, 'IMG1945115295.jpg', '2022-04-19 12:32:17', 'http://192.168.1.9/matlabwithandroid/images//IMG1945115295.jpg', 111),
(145, 'IMG152912020.jpg', '2022-04-19 12:35:38', 'http://192.168.1.9/matlabwithandroid/images//IMG152912020.jpg', 111),
(146, 'IMG1183349057.jpg', '2022-04-20 03:41:37', 'http://192.168.1.9/matlabwithandroid/images//IMG1183349057.jpg', 111),
(147, 'IMG1895654289.jpg', '2022-04-20 03:46:32', 'http://192.168.1.9/matlabwithandroid/images//IMG1895654289.jpg', 111),
(148, 'IMG752413242.jpg', '2022-04-20 03:50:24', 'http://192.168.1.9/matlabwithandroid/images//IMG752413242.jpg', 111),
(149, 'IMG1837911787.jpg', '2022-04-20 03:57:40', 'http://192.168.1.9/matlabwithandroid/images//IMG1837911787.jpg', 111),
(150, 'IMG1624122741.jpg', '2022-04-20 04:06:22', 'http://192.168.1.9/matlabwithandroid/images//IMG1624122741.jpg', 111),
(151, 'IMG7305333.jpg', '2022-04-20 04:08:54', 'http://192.168.1.9/matlabwithandroid/images//IMG7305333.jpg', 111),
(152, 'IMG1977008140.jpg', '2022-04-20 04:11:56', 'http://192.168.1.9/matlabwithandroid/images//IMG1977008140.jpg', 111),
(153, 'IMG1679575578.jpg', '2022-04-20 04:15:17', 'http://192.168.1.9/matlabwithandroid/images//IMG1679575578.jpg', 111),
(155, 'IMG1977166802.jpg', '2022-04-20 04:32:14', 'http://192.168.1.9/matlabwithandroid/images//IMG1977166802.jpg', 111),
(157, 'IMG2027079884.jpg', '2022-04-20 04:52:14', 'http://192.168.1.9/matlabwithandroid/images//IMG2027079884.jpg', 111),
(158, 'IMG1118105894.jpg', '2022-04-20 05:02:50', 'http://192.168.1.9/matlabwithandroid/images//IMG1118105894.jpg', 111),
(161, 'IMG1617679414.jpg', '2022-04-20 05:11:57', 'http://192.168.1.9/matlabwithandroid/images//IMG1617679414.jpg', 111),
(163, 'IMG424150387.jpg', '2022-04-20 06:51:40', 'http://192.168.1.9/matlabwithandroid/images//IMG424150387.jpg', 123),
(164, 'IMG1564051651.jpg', '2022-04-20 06:54:03', 'http://192.168.1.9/matlabwithandroid/images//IMG1564051651.jpg', 123),
(165, 'IMG1681097012.jpg', '2022-04-21 01:08:07', 'http://192.168.1.9/matlabwithandroid/images//IMG1681097012.jpg', 126),
(166, 'IMG1420360027.jpg', '2022-04-21 01:10:28', 'http://192.168.1.9/matlabwithandroid/images//IMG1420360027.jpg', 123),
(167, 'IMG864737391.jpg', '2022-04-21 01:13:30', 'http://192.168.1.9/matlabwithandroid/images//IMG864737391.jpg', 126),
(168, 'IMG715018011.jpg', '2022-04-21 01:17:55', 'http://192.168.1.9/matlabwithandroid/images//IMG715018011.jpg', 126),
(169, 'IMG1751102529.jpg', '2022-04-21 01:24:18', 'http://192.168.1.9/matlabwithandroid/images//IMG1751102529.jpg', 128),
(170, 'IMG145233749.jpg', '2022-04-21 01:27:55', 'http://192.168.1.9/matlabwithandroid/images//IMG145233749.jpg', 128),
(171, 'IMG861457549.jpg', '2022-04-21 01:32:38', 'http://192.168.1.9/matlabwithandroid/images//IMG861457549.jpg', 128),
(172, 'IMG1578998092.jpg', '2022-04-21 01:33:10', 'http://192.168.1.9/matlabwithandroid/images//IMG1578998092.jpg', 128),
(173, 'IMG830549198.jpg', '2022-04-21 03:00:26', 'http://192.168.1.9/matlabwithandroid/images//IMG830549198.jpg', 130),
(174, 'IMG1084144019.jpg', '2022-04-21 03:02:46', 'http://192.168.1.9/matlabwithandroid/images//IMG1084144019.jpg', 130),
(182, 'IMG91396184.jpg', '2022-04-23 03:31:26', 'http://192.168.1.9/matlabwithandroid/images//IMG91396184.jpg', 144),
(183, 'IMG2027408294.jpg', '2022-04-23 03:32:57', 'http://192.168.1.9/matlabwithandroid/images//IMG2027408294.jpg', 144),
(184, 'IMG591371979.jpg', '2022-04-23 03:35:15', 'http://192.168.1.9/matlabwithandroid/images//IMG591371979.jpg', 145),
(185, 'IMG2068758103.jpg', '2022-04-23 09:39:55', 'http://192.168.1.120/matlabwithandroid/images//IMG2068758103.jpg', 146),
(186, 'IMG1048271665.jpg', '2022-04-24 12:38:36', 'http://192.168.1.9/matlabwithandroid/images//IMG1048271665.jpg', 123),
(187, 'IMG1349564152.jpg', '2022-04-24 12:49:08', 'http://192.168.1.9/matlabwithandroid/images//IMG1349564152.jpg', 123),
(188, 'IMG2003474987.jpg', '2022-04-24 01:46:42', 'http://192.168.1.9/matlabwithandroid/images//IMG2003474987.jpg', 123),
(189, 'IMG611441541.jpg', '2022-04-24 02:53:21', 'http://192.168.1.9/matlabwithandroid/images//IMG611441541.jpg', 123),
(190, 'IMG1702373864.jpg', '2022-04-24 11:22:20', 'http://192.168.1.9/matlabwithandroid/images//IMG1702373864.jpg', 123),
(191, 'IMG1389314955.jpg', '2022-04-24 11:33:04', 'http://192.168.1.9/matlabwithandroid/images//IMG1389314955.jpg', 123),
(192, 'IMG1469864456.jpg', '2022-04-24 11:40:27', 'http://192.168.1.9/matlabwithandroid/images//IMG1469864456.jpg', 123),
(193, 'IMG1015833364.jpg', '2022-04-24 11:46:51', 'http://192.168.1.9/matlabwithandroid/images//IMG1015833364.jpg', 123),
(194, 'IMG203741086.jpg', '2022-04-24 11:56:02', 'http://192.168.1.9/matlabwithandroid/images//IMG203741086.jpg', 123),
(195, 'IMG905342532.jpg', '2022-04-25 12:06:38', 'http://192.168.1.9/matlabwithandroid/images//IMG905342532.jpg', 123),
(196, 'IMG2110984084.jpg', '2022-04-25 12:11:11', 'http://192.168.1.9/matlabwithandroid/images//IMG2110984084.jpg', 123),
(197, 'IMG633734514.jpg', '2022-04-25 01:00:01', 'http://192.168.1.9/matlabwithandroid/images//IMG633734514.jpg', 123),
(198, 'IMG2086554688.jpg', '2022-04-25 01:26:16', 'http://192.168.1.9/matlabwithandroid/images//IMG2086554688.jpg', 123),
(199, 'IMG1167435591.jpg', '2022-04-25 01:42:37', 'http://192.168.1.9/matlabwithandroid/images//IMG1167435591.jpg', 123),
(200, 'IMG385301852.jpg', '2022-04-25 01:50:42', 'http://192.168.1.9/matlabwithandroid/images//IMG385301852.jpg', 123),
(201, 'IMG802106043.jpg', '2022-04-25 01:59:28', 'http://192.168.1.9/matlabwithandroid/images//IMG802106043.jpg', 123),
(202, 'IMG1024931939.jpg', '2022-04-25 02:03:39', 'http://192.168.1.9/matlabwithandroid/images//IMG1024931939.jpg', 123),
(203, 'IMG1580028582.jpg', '2022-04-25 02:14:41', 'http://192.168.1.9/matlabwithandroid/images//IMG1580028582.jpg', 123),
(204, 'IMG137612375.jpg', '2022-04-25 02:16:45', 'http://192.168.1.9/matlabwithandroid/images//IMG137612375.jpg', 123),
(205, 'IMG1994181363.jpg', '2022-04-25 02:44:20', 'http://192.168.1.9/matlabwithandroid/images//IMG1994181363.jpg', 123),
(206, 'IMG1553690145.jpg', '2022-04-25 03:00:44', 'http://192.168.1.9/matlabwithandroid/images//IMG1553690145.jpg', 123),
(207, 'IMG1539381261.jpg', '2022-04-25 03:06:09', 'http://192.168.1.9/matlabwithandroid/images//IMG1539381261.jpg', 123),
(208, 'IMG845216269.jpg', '2022-04-25 03:08:34', 'http://192.168.1.9/matlabwithandroid/images//IMG845216269.jpg', 123),
(209, 'IMG1170811850.jpg', '2022-04-25 03:09:42', 'http://192.168.1.9/matlabwithandroid/images//IMG1170811850.jpg', 123),
(210, 'IMG310851.jpg', '2022-04-25 03:12:08', 'http://192.168.1.9/matlabwithandroid/images//IMG310851.jpg', 123),
(211, 'IMG1101291023.jpg', '2022-04-25 03:16:22', 'http://192.168.1.9/matlabwithandroid/images//IMG1101291023.jpg', 123),
(212, 'IMG1553382904.jpg', '2022-04-25 03:20:57', 'http://192.168.1.9/matlabwithandroid/images//IMG1553382904.jpg', 123),
(213, 'IMG1720356195.jpg', '2022-04-25 03:23:22', 'http://192.168.1.9/matlabwithandroid/images//IMG1720356195.jpg', 123),
(214, 'IMG1827923078.jpg', '2022-04-25 03:29:11', 'http://192.168.1.9/matlabwithandroid/images//IMG1827923078.jpg', 123),
(215, 'IMG1060950548.jpg', '2022-04-25 03:31:10', 'http://192.168.1.9/matlabwithandroid/images//IMG1060950548.jpg', 123),
(216, 'IMG526656629.jpg', '2022-04-25 03:34:15', 'http://192.168.1.9/matlabwithandroid/images//IMG526656629.jpg', 123),
(217, 'IMG1184894921.jpg', '2022-04-25 09:43:53', 'http://192.168.1.120/matlabwithandroid/images//IMG1184894921.jpg', 123),
(218, 'IMG667609585.jpg', '2022-04-27 02:06:46', 'http://192.168.1.9/matlabwithandroid/images//IMG667609585.jpg', 144),
(219, 'IMG1210255578.jpg', '2022-04-27 02:11:40', 'http://192.168.1.9/matlabwithandroid/images//IMG1210255578.jpg', 144),
(220, 'IMG1529070402.jpg', '2022-04-27 02:15:00', 'http://192.168.1.9/matlabwithandroid/images//IMG1529070402.jpg', 144),
(221, 'IMG1846943251.jpg', '2022-04-27 02:15:12', 'http://192.168.1.9/matlabwithandroid/images//IMG1846943251.jpg', 144),
(222, 'IMG1992328477.jpg', '2022-04-27 03:28:49', 'http://192.168.1.9/matlabwithandroid/images//IMG1992328477.jpg', 162),
(223, 'IMG733804229.jpg', '2022-04-27 08:14:45', 'http://192.168.1.9/matlabwithandroid/images//IMG733804229.jpg', 123),
(224, 'IMG511831836.jpg', '2022-04-27 08:15:22', 'http://192.168.1.9/matlabwithandroid/images//IMG511831836.jpg', 123),
(225, 'IMG5325649.jpg', '2022-04-27 08:15:29', 'http://192.168.1.9/matlabwithandroid/images//IMG5325649.jpg', 123),
(226, 'IMG112487538.jpg', '2022-04-27 08:19:43', 'http://192.168.1.9/matlabwithandroid/images//IMG112487538.jpg', 123),
(227, 'IMG429376050.jpg', '2022-04-27 08:20:20', 'http://192.168.1.9/matlabwithandroid/images//IMG429376050.jpg', 123),
(228, 'IMG525229678.jpg', '2022-04-27 08:20:45', 'http://192.168.1.9/matlabwithandroid/images//IMG525229678.jpg', 123),
(229, 'IMG922271502.jpg', '2022-04-29 02:47:12', 'http://192.168.1.9/matlabwithandroid/images//IMG922271502.jpg', 123),
(230, 'IMG40993638.jpg', '2022-04-29 02:49:21', 'http://192.168.1.9/matlabwithandroid/images//IMG40993638.jpg', 123),
(231, 'IMG1575403362.jpg', '2022-04-29 02:49:54', 'http://192.168.1.9/matlabwithandroid/images//IMG1575403362.jpg', 123),
(232, 'IMG597616702.jpg', '2022-04-29 02:56:00', 'http://192.168.1.9/matlabwithandroid/images//IMG597616702.jpg', 123),
(233, 'IMG882734647.jpg', '2022-04-29 02:58:19', 'http://192.168.1.9/matlabwithandroid/images//IMG882734647.jpg', 123),
(234, 'IMG353968848.jpg', '2022-04-29 02:59:51', 'http://192.168.1.9/matlabwithandroid/images//IMG353968848.jpg', 123),
(235, 'IMG1404569894.jpg', '2022-04-29 03:02:03', 'http://192.168.1.9/matlabwithandroid/images//IMG1404569894.jpg', 123),
(236, 'IMG837389588.jpg', '2022-04-29 03:08:52', 'http://192.168.1.9/matlabwithandroid/images//IMG837389588.jpg', 123),
(237, 'IMG669667436.jpg', '2022-04-29 03:13:32', 'http://192.168.1.9/matlabwithandroid/images//IMG669667436.jpg', 123),
(238, 'IMG1932152664.jpg', '2022-04-29 03:17:55', 'http://192.168.1.9/matlabwithandroid/images//IMG1932152664.jpg', 123),
(239, 'IMG1537567853.jpg', '2022-04-29 03:20:59', 'http://192.168.1.9/matlabwithandroid/images//IMG1537567853.jpg', 123),
(240, 'IMG471396291.jpg', '2022-04-29 03:27:20', 'http://192.168.1.9/matlabwithandroid/images//IMG471396291.jpg', 123),
(241, 'IMG1625453844.jpg', '2022-04-29 03:32:54', 'http://192.168.1.9/matlabwithandroid/images//IMG1625453844.jpg', 123),
(242, 'IMG656513601.jpg', '2022-04-29 03:38:50', 'http://192.168.1.9/matlabwithandroid/images//IMG656513601.jpg', 123),
(243, 'IMG1831728926.jpg', '2022-04-29 03:42:46', 'http://192.168.1.9/matlabwithandroid/images//IMG1831728926.jpg', 123),
(244, 'IMG1092986575.jpg', '2022-05-05 05:07:50', 'http://192.168.1.9/matlabwithandroid/images//IMG1092986575.jpg', 123),
(245, 'IMG812718502.jpg', '2022-05-06 05:19:05', 'http://192.168.1.9/matlabwithandroid/images//IMG812718502.jpg', 123),
(246, 'IMG1698454673.jpg', '0000-00-00 00:00:00', 'http://192.168.1.9/matlabwithandroid/images//IMG1698454673.jpg', 203),
(247, 'IMG75743507.jpg', '2022-05-08 11:51:52', 'http://192.168.1.9/matlabwithandroid/images//IMG75743507.jpg', 203),
(248, 'IMG508676722.jpg', '2022-05-08 11:52:46', 'http://192.168.1.9/matlabwithandroid/images//IMG508676722.jpg', 203),
(249, 'IMG661914766.jpg', '2022-05-08 11:53:15', 'http://192.168.1.9/matlabwithandroid/images//IMG661914766.jpg', 203),
(250, 'IMG1473074054.jpg', '2022-05-08 11:53:59', 'http://192.168.1.9/matlabwithandroid/images//IMG1473074054.jpg', 203),
(251, 'IMG41780699.jpg', '2022-05-08 11:54:34', 'http://192.168.1.9/matlabwithandroid/images//IMG41780699.jpg', 203),
(252, 'IMG2114094248.jpg', '2022-05-08 11:54:59', 'http://192.168.1.9/matlabwithandroid/images//IMG2114094248.jpg', 203),
(253, 'IMG454311486.jpg', '2022-05-08 11:57:06', 'http://192.168.1.9/matlabwithandroid/images//IMG454311486.jpg', 203),
(254, 'IMG219048734.jpg', '2022-05-23 12:09:50', 'http://192.168.1.9/matlabwithandroid/images//IMG219048734.jpg', 203),
(255, 'IMG1568692780.jpg', '2022-05-23 12:10:06', 'http://192.168.1.9/matlabwithandroid/images//IMG1568692780.jpg', 203),
(256, 'IMG589627652.jpg', '2022-05-23 12:15:23', 'http://192.168.1.9/matlabwithandroid/images//IMG589627652.jpg', 203),
(257, 'IMG1691031425.jpg', '2022-05-23 12:16:28', 'http://192.168.1.9/matlabwithandroid/images//IMG1691031425.jpg', 203),
(258, 'IMG1257535796.jpg', '2022-05-23 12:23:02', 'http://192.168.1.9/matlabwithandroid/images//IMG1257535796.jpg', 203),
(259, 'IMG800174048.jpg', '2022-05-23 12:28:44', 'http://192.168.1.9/matlabwithandroid/images//IMG800174048.jpg', 203),
(260, 'IMG612853329.jpg', '2022-05-23 12:34:51', 'http://192.168.1.9/matlabwithandroid/images//IMG612853329.jpg', 203),
(261, 'IMG830459754.jpg', '2022-05-23 12:45:28', 'http://192.168.1.9/matlabwithandroid/images//IMG830459754.jpg', 203),
(262, 'IMG1887400310.jpg', '2022-05-23 12:47:59', 'http://192.168.1.9/matlabwithandroid/images//IMG1887400310.jpg', 203),
(263, 'IMG832181334.jpg', '2022-05-23 12:50:21', 'http://192.168.1.9/matlabwithandroid/images//IMG832181334.jpg', 203),
(264, 'IMG10770702.jpg', '2022-05-23 12:52:17', 'http://192.168.1.9/matlabwithandroid/images//IMG10770702.jpg', 203),
(265, 'IMG2026744992.jpg', '2022-05-23 12:54:25', 'http://192.168.1.9/matlabwithandroid/images//IMG2026744992.jpg', 203),
(266, 'IMG527891442.jpg', '2022-05-23 01:00:29', 'http://192.168.1.9/matlabwithandroid/images//IMG527891442.jpg', 203),
(267, 'IMG2136842049.jpg', '2022-05-23 01:04:43', 'http://192.168.1.9/matlabwithandroid/images//IMG2136842049.jpg', 203),
(268, 'IMG5059347.jpg', '2022-05-23 01:11:28', 'http://192.168.1.9/matlabwithandroid/images//IMG5059347.jpg', 203),
(269, 'IMG1729396410.jpg', '2022-05-23 01:16:41', 'http://192.168.1.9/matlabwithandroid/images//IMG1729396410.jpg', 203),
(270, 'IMG1629624976.jpg', '2022-05-23 01:18:37', 'http://192.168.1.9/matlabwithandroid/images//IMG1629624976.jpg', 203),
(271, 'IMG2051991943.jpg', '2022-05-23 01:18:52', 'http://192.168.1.9/matlabwithandroid/images//IMG2051991943.jpg', 203),
(272, 'IMG1666956045.jpg', '2022-05-23 04:34:01', 'http://192.168.1.9/matlabwithandroid/images//IMG1666956045.jpg', 203),
(273, 'IMG2050278609.jpg', '2022-05-23 04:36:32', 'http://192.168.1.9/matlabwithandroid/images//IMG2050278609.jpg', 203),
(274, 'IMG1760106530.jpg', '2022-05-23 04:37:23', 'http://192.168.1.9/matlabwithandroid/images//IMG1760106530.jpg', 203),
(275, 'IMG1190556069.jpg', '2022-05-23 04:38:40', 'http://192.168.1.9/matlabwithandroid/images//IMG1190556069.jpg', 203),
(276, 'IMG685280526.jpg', '2022-05-23 04:39:05', 'http://192.168.1.9/matlabwithandroid/images//IMG685280526.jpg', 203),
(277, 'IMG1084097860.jpg', '2022-05-23 04:40:09', 'http://192.168.1.9/matlabwithandroid/images//IMG1084097860.jpg', 203),
(278, 'IMG1593744278.jpg', '2022-05-23 04:40:51', 'http://192.168.1.9/matlabwithandroid/images//IMG1593744278.jpg', 203),
(279, 'IMG1630742659.jpg', '2022-05-23 04:42:24', 'http://192.168.1.9/matlabwithandroid/images//IMG1630742659.jpg', 203),
(280, 'IMG1696780410.jpg', '2022-05-23 04:42:54', 'http://192.168.1.9/matlabwithandroid/images//IMG1696780410.jpg', 203),
(281, 'IMG353088977.jpg', '2022-05-23 04:44:13', 'http://192.168.1.9/matlabwithandroid/images//IMG353088977.jpg', 203),
(282, 'IMG54196548.jpg', '2022-05-23 04:44:33', 'http://192.168.1.9/matlabwithandroid/images//IMG54196548.jpg', 203),
(283, 'IMG759107747.jpg', '2022-05-23 04:44:59', 'http://192.168.1.9/matlabwithandroid/images//IMG759107747.jpg', 203),
(284, 'IMG1861572316.jpg', '2022-05-23 04:46:08', 'http://192.168.1.9/matlabwithandroid/images//IMG1861572316.jpg', 203),
(285, 'IMG1546770875.jpg', '2022-05-23 04:53:52', 'http://192.168.1.9/matlabwithandroid/images//IMG1546770875.jpg', 144),
(286, 'IMG442065464.jpg', '2022-05-23 04:57:04', 'http://192.168.1.9/matlabwithandroid/images//IMG442065464.jpg', 144),
(287, 'IMG1622383795.jpg', '2022-05-23 04:57:38', 'http://192.168.1.9/matlabwithandroid/images//IMG1622383795.jpg', 144),
(288, 'IMG1094312812.jpg', '2022-05-23 04:58:01', 'http://192.168.1.9/matlabwithandroid/images//IMG1094312812.jpg', 144),
(289, 'IMG1398911923.jpg', '2022-05-23 04:59:07', 'http://192.168.1.9/matlabwithandroid/images//IMG1398911923.jpg', 144),
(290, 'IMG894311443.jpg', '2022-05-23 04:59:31', 'http://192.168.1.9/matlabwithandroid/images//IMG894311443.jpg', 144),
(291, 'IMG258719826.jpg', '2022-05-23 05:02:49', 'http://192.168.1.9/matlabwithandroid/images//IMG258719826.jpg', 144),
(292, 'IMG1469103342.jpg', '2022-05-23 05:03:28', 'http://192.168.1.9/matlabwithandroid/images//IMG1469103342.jpg', 144),
(293, 'IMG1890417427.jpg', '2022-05-23 05:05:04', 'http://192.168.1.9/matlabwithandroid/images//IMG1890417427.jpg', 144),
(294, 'IMG1771144162.jpg', '2022-05-23 05:05:36', 'http://192.168.1.9/matlabwithandroid/images//IMG1771144162.jpg', 144),
(295, 'IMG331153519.jpg', '2022-05-23 05:08:39', 'http://192.168.1.9/matlabwithandroid/images//IMG331153519.jpg', 123),
(296, 'IMG2059811069.jpg', '2022-05-23 05:10:32', 'http://192.168.1.9/matlabwithandroid/images//IMG2059811069.jpg', 123),
(297, 'IMG1235101413.jpg', '2022-05-23 05:14:07', 'http://192.168.1.9/matlabwithandroid/images//IMG1235101413.jpg', 123),
(298, 'IMG1461021430.jpg', '2022-05-23 05:16:43', 'http://192.168.1.9/matlabwithandroid/images//IMG1461021430.jpg', 144),
(299, 'IMG202661247.jpg', '2022-05-23 05:19:58', 'http://192.168.1.9/matlabwithandroid/images//IMG202661247.jpg', 144),
(300, 'IMG122662265.jpg', '2022-05-23 05:21:04', 'http://192.168.1.9/matlabwithandroid/images//IMG122662265.jpg', 123),
(301, 'IMG1658023054.jpg', '2022-05-23 05:21:32', 'http://192.168.1.9/matlabwithandroid/images//IMG1658023054.jpg', 123),
(302, 'IMG177979019.jpg', '2022-05-23 05:21:47', 'http://192.168.1.9/matlabwithandroid/images//IMG177979019.jpg', 123),
(303, 'IMG7776868.jpg', '2022-05-23 05:22:19', 'http://192.168.1.9/matlabwithandroid/images//IMG7776868.jpg', 123),
(304, 'IMG809203422.jpg', '2022-05-23 05:22:46', 'http://192.168.1.9/matlabwithandroid/images//IMG809203422.jpg', 123),
(305, 'IMG1928884022.jpg', '2022-05-23 05:24:33', 'http://192.168.1.9/matlabwithandroid/images//IMG1928884022.jpg', 123),
(306, 'IMG674354027.jpg', '2022-05-23 05:25:14', 'http://192.168.1.9/matlabwithandroid/images//IMG674354027.jpg', 123),
(307, 'IMG538018310.jpg', '2022-05-23 05:25:56', 'http://192.168.1.9/matlabwithandroid/images//IMG538018310.jpg', 123),
(308, 'IMG25208421.jpg', '2022-05-23 05:29:29', 'http://192.168.1.9/matlabwithandroid/images//IMG25208421.jpg', 123),
(309, 'IMG958010185.jpg', '2022-05-23 05:30:29', 'http://192.168.1.9/matlabwithandroid/images//IMG958010185.jpg', 123),
(310, 'IMG412450059.jpg', '2022-05-23 05:30:45', 'http://192.168.1.9/matlabwithandroid/images//IMG412450059.jpg', 123),
(311, 'IMG1744304611.jpg', '2022-05-23 05:32:50', 'http://192.168.1.9/matlabwithandroid/images//IMG1744304611.jpg', 123),
(312, 'IMG1269331743.jpg', '2022-05-23 05:34:10', 'http://192.168.1.9/matlabwithandroid/images//IMG1269331743.jpg', 123),
(313, 'IMG891126217.jpg', '2022-05-23 05:34:39', 'http://192.168.1.9/matlabwithandroid/images//IMG891126217.jpg', 123),
(314, 'IMG90152134.jpg', '2022-05-23 05:37:48', 'http://192.168.1.9/matlabwithandroid/images//IMG90152134.jpg', 123),
(315, 'IMG159310250.jpg', '2022-05-23 05:38:32', 'http://192.168.1.9/matlabwithandroid/images//IMG159310250.jpg', 123),
(316, 'IMG1485728063.jpg', '2022-05-23 05:38:53', 'http://192.168.1.9/matlabwithandroid/images//IMG1485728063.jpg', 123),
(317, 'IMG632617631.jpg', '2022-05-23 05:41:32', 'http://192.168.1.9/matlabwithandroid/images//IMG632617631.jpg', 144),
(318, 'IMG637987104.jpg', '2022-05-23 05:44:32', 'http://192.168.1.9/matlabwithandroid/images//IMG637987104.jpg', 144),
(319, 'IMG101236126.jpg', '2022-05-23 05:46:19', 'http://192.168.1.9/matlabwithandroid/images//IMG101236126.jpg', 123),
(320, 'IMG1354696442.jpg', '2022-05-23 05:46:50', 'http://192.168.1.9/matlabwithandroid/images//IMG1354696442.jpg', 123),
(321, 'IMG739291345.jpg', '2022-05-23 05:47:43', 'http://192.168.1.9/matlabwithandroid/images//IMG739291345.jpg', 123),
(322, 'IMG364222737.jpg', '2022-05-23 05:50:35', 'http://192.168.1.9/matlabwithandroid/images//IMG364222737.jpg', 144),
(323, 'IMG1221359554.jpg', '2022-05-23 05:51:36', 'http://192.168.1.9/matlabwithandroid/images//IMG1221359554.jpg', 144),
(324, 'IMG189427876.jpg', '2022-05-23 05:57:41', 'http://192.168.1.9/matlabwithandroid/images//IMG189427876.jpg', 144),
(325, 'IMG1921609796.jpg', '2022-05-23 05:58:48', 'http://192.168.1.9/matlabwithandroid/images//IMG1921609796.jpg', 144),
(326, 'IMG139916677.jpg', '2022-05-23 05:59:29', 'http://192.168.1.9/matlabwithandroid/images//IMG139916677.jpg', 144),
(327, 'IMG566167664.jpg', '2022-05-23 05:59:55', 'http://192.168.1.9/matlabwithandroid/images//IMG566167664.jpg', 144),
(328, 'IMG1568537144.jpg', '2022-05-23 06:00:16', 'http://192.168.1.9/matlabwithandroid/images//IMG1568537144.jpg', 144),
(329, 'IMG477184961.jpg', '2022-05-26 04:38:37', 'http://192.168.1.9/matlabwithandroid/images//IMG477184961.jpg', 123),
(330, 'IMG697726808.jpg', '2022-05-26 04:40:02', 'http://192.168.1.9/matlabwithandroid/images//IMG697726808.jpg', 123),
(331, 'IMG2113115428.jpg', '2022-05-26 05:16:45', 'http://192.168.1.9/matlabwithandroid/images//IMG2113115428.jpg', 123);

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `news_id` int(11) NOT NULL,
  `topic` varchar(100) NOT NULL,
  `info` text NOT NULL,
  `datetime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `notification`
--

INSERT INTO `notification` (`news_id`, `topic`, `info`, `datetime`) VALUES
(34, 'Emerging Tomato Virus Insights Gained', 'Tomato brown rugose fruit virus (ToBRFV) is an emerging virus that is damaging to tomatoes as well as other crops, including peppers. In a recent study, Dr. Ling and colleagues at the USDA Agricultural Research Service, U.S. Vegetable Laboratory in Charleston, South Carolina conducted comprehensive experiments to evaluate two key properties: experimental host range and disease resistance in tomatoes.', '2022-05-06 20:40:52'),
(35, 'Tomato brown rugose fruit virus (ToBRFV): A new concern for tomato and pepper producers', 'Tomato brown rugose fruit virus (ToBRFV) is a newly identified virus affecting tomato, pepper and possibly their relatives. ToBRFV first appeared in Israel in 2014. Since then, it has shown up in several other countries, including eradicated greenhouse outbreaks in 2018 and 2019 in Arizona and California. These back-to-back U.S. outbreaks indicate ToBRFV will probably be something that without good diligence has a high probability of happening again.', '2022-05-06 20:41:36');

-- --------------------------------------------------------

--
-- Table structure for table `servermessage`
--

CREATE TABLE `servermessage` (
  `message_id` int(11) NOT NULL,
  `farmer_name` varchar(100) NOT NULL,
  `message` text NOT NULL,
  `datetime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `servermessage`
--

INSERT INTO `servermessage` (`message_id`, `farmer_name`, `message`, `datetime`) VALUES
(1, 'ahmed12f', 'welldone', '2022-05-26 17:11:00'),
(2, 'banen', 'dfdf', '2022-05-26 05:16:19');

-- --------------------------------------------------------

--
-- Table structure for table `token`
--

CREATE TABLE `token` (
  `id_phone` int(11) NOT NULL,
  `phone_token` varchar(700) NOT NULL,
  `farmer_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `token`
--

INSERT INTO `token` (`id_phone`, `phone_token`, `farmer_name`) VALUES
(1, '12345667', 'kkkkkkkkkk'),
(2, 'dxX8w2xST8mTeOAwChP6Hm:APA91bF7qwBZOVZvVRIy4ptJxBCXAxLegm7zko2VnGE5aB0fNntMoHmgiBX8O5biT3FTW134_UzFBojxfmjVEibulO-XzJL7xjzV5gNrSOm2FKXyJhy_llhbEoxdXzC2Dd2tDY7L6nvn', ''),
(3, 'dxX8w2xST8mTeOAwChP6Hm:APA91bF7qwBZOVZvVRIy4ptJxBCXAxLegm7zko2VnGE5aB0fNntMoHmgiBX8O5biT3FTW134_UzFBojxfmjVEibulO-XzJL7xjzV5gNrSOm2FKXyJhy_llhbEoxdXzC2Dd2tDY7L6nvn', 'banen'),
(4, 'eeJnM7sMSxKZfXT2yBve0O:APA91bHXxYuYLlMljUCNMkPR9TbvDC9HS8M6bWPKQPVVkXirqJr6j8SGCcGHGJqOEYXftJLWodkKRpjcJ5d_ka520VgHDyo2l7EiajGk6V1PsVePzOFssqRk4vslqpvWgfBXCZ9kmDCp', 'ahmed12'),
(5, 'eeJnM7sMSxKZfXT2yBve0O:APA91bHXxYuYLlMljUCNMkPR9TbvDC9HS8M6bWPKQPVVkXirqJr6j8SGCcGHGJqOEYXftJLWodkKRpjcJ5d_ka520VgHDyo2l7EiajGk6V1PsVePzOFssqRk4vslqpvWgfBXCZ9kmDCp', 'banen123456'),
(6, 'eeJnM7sMSxKZfXT2yBve0O:APA91bHXxYuYLlMljUCNMkPR9TbvDC9HS8M6bWPKQPVVkXirqJr6j8SGCcGHGJqOEYXftJLWodkKRpjcJ5d_ka520VgHDyo2l7EiajGk6V1PsVePzOFssqRk4vslqpvWgfBXCZ9kmDCp', 'banentaher'),
(7, 'eeJnM7sMSxKZfXT2yBve0O:APA91bHXxYuYLlMljUCNMkPR9TbvDC9HS8M6bWPKQPVVkXirqJr6j8SGCcGHGJqOEYXftJLWodkKRpjcJ5d_ka520VgHDyo2l7EiajGk6V1PsVePzOFssqRk4vslqpvWgfBXCZ9kmDCp', 'kareem'),
(8, 'eeJnM7sMSxKZfXT2yBve0O:APA91bHXxYuYLlMljUCNMkPR9TbvDC9HS8M6bWPKQPVVkXirqJr6j8SGCcGHGJqOEYXftJLWodkKRpjcJ5d_ka520VgHDyo2l7EiajGk6V1PsVePzOFssqRk4vslqpvWgfBXCZ9kmDCp', 'banensss'),
(12, 'eeJnM7sMSxKZfXT2yBve0O:APA91bHXxYuYLlMljUCNMkPR9TbvDC9HS8M6bWPKQPVVkXirqJr6j8SGCcGHGJqOEYXftJLWodkKRpjcJ5d_ka520VgHDyo2l7EiajGk6V1PsVePzOFssqRk4vslqpvWgfBXCZ9kmDCp', 'banen12'),
(13, 'eeJnM7sMSxKZfXT2yBve0O:APA91bHXxYuYLlMljUCNMkPR9TbvDC9HS8M6bWPKQPVVkXirqJr6j8SGCcGHGJqOEYXftJLWodkKRpjcJ5d_ka520VgHDyo2l7EiajGk6V1PsVePzOFssqRk4vslqpvWgfBXCZ9kmDCp', 'banen'),
(14, 'f7qXQfA0SrC5agXXplRNiX:APA91bEreGE7depfKjwxBKZyvkcPDPV-YKHqabWO5k_GOHpNMYylUKoppQzcq9z5Cy1Ismu40fzAa2bOYBwnPufSN_UnDuTAl8ONwthIxQog5X6njsIXdGOnOyfzrTumP9hQfU11kL_Z', 'banen'),
(15, 'dxX8w2xST8mTeOAwChP6Hm:APA91bF7qwBZOVZvVRIy4ptJxBCXAxLegm7zko2VnGE5aB0fNntMoHmgiBX8O5biT3FTW134_UzFBojxfmjVEibulO-XzJL7xjzV5gNrSOm2FKXyJhy_llhbEoxdXzC2Dd2tDY7L6nvn', 'ahmed12f'),
(16, 'eeJnM7sMSxKZfXT2yBve0O:APA91bHXxYuYLlMljUCNMkPR9TbvDC9HS8M6bWPKQPVVkXirqJr6j8SGCcGHGJqOEYXftJLWodkKRpjcJ5d_ka520VgHDyo2l7EiajGk6V1PsVePzOFssqRk4vslqpvWgfBXCZ9kmDCp', 'ahmed12f'),
(17, 'eeJnM7sMSxKZfXT2yBve0O:APA91bHXxYuYLlMljUCNMkPR9TbvDC9HS8M6bWPKQPVVkXirqJr6j8SGCcGHGJqOEYXftJLWodkKRpjcJ5d_ka520VgHDyo2l7EiajGk6V1PsVePzOFssqRk4vslqpvWgfBXCZ9kmDCp', 'mustafa');

-- --------------------------------------------------------

--
-- Table structure for table `treatment`
--

CREATE TABLE `treatment` (
  `treatment_id` int(8) NOT NULL,
  `treatment_name` varchar(50) NOT NULL,
  `instruction` varchar(255) NOT NULL,
  `discription` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `treatment`
--

INSERT INTO `treatment` (`treatment_id`, `treatment_name`, `instruction`, `discription`) VALUES
(1, 'disease treat', 'this is the way for that', 'try this'),
(2, 'ccc', 'ccc', 'ccc'),
(3, 'zzzz', 'zzzz', 'zzzz'),
(4, 'rr', 'rr', 'rr'),
(5, 'vvv', 'vvv', 'vvv'),
(6, 'fff', 'fff', 'fff'),
(7, 'dfdf', 'dfdf', 'cvc'),
(8, 'mandipropamid, chlorothalonil, fluazinam, mancozeb', 'Use fungicide sprays based on mandipropamid, chlorothalonil, fluazinam, mancozeb to combat late blight. ', 'Fungicides are generally needed only if the disease appears during a time of year when rain is likely or overhead irrigation is practiced.'),
(9, 'dfdf', 'fdfd', 'ssss'),
(10, 'ttt', 'pppp', 'ccc'),
(50, 'dsda', 'mmmmmmmmmm                                ', '        mmmmmmmmmm                        ');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity`
--
ALTER TABLE `activity`
  ADD PRIMARY KEY (`activity_id`),
  ADD KEY `farmer_id` (`farmer_id`,`farm_id`,`crop_id`,`disease_id`,`clinic_id`,`treatment_id`,`image_id`) USING BTREE,
  ADD KEY `farm_id` (`farm_id`) USING BTREE,
  ADD KEY `crop_id` (`crop_id`) USING BTREE,
  ADD KEY `disease_id` (`disease_id`) USING BTREE,
  ADD KEY `clinic_id` (`clinic_id`) USING BTREE,
  ADD KEY `treatment_id` (`treatment_id`) USING BTREE,
  ADD KEY `image_id` (`image_id`) USING BTREE;

--
-- Indexes for table `cliniccenter`
--
ALTER TABLE `cliniccenter`
  ADD PRIMARY KEY (`clinic_id`);

--
-- Indexes for table `crop`
--
ALTER TABLE `crop`
  ADD PRIMARY KEY (`crop_id`),
  ADD KEY `farm_id` (`farm_id`) USING BTREE;

--
-- Indexes for table `disease`
--
ALTER TABLE `disease`
  ADD PRIMARY KEY (`disease_id`),
  ADD UNIQUE KEY `constraint_unique` (`disease_number`),
  ADD KEY `crop_id` (`crop_id`) USING BTREE,
  ADD KEY `treatment_id` (`treatment_id`) USING BTREE;

--
-- Indexes for table `farm`
--
ALTER TABLE `farm`
  ADD PRIMARY KEY (`farm_id`),
  ADD KEY `farmer_id` (`farmer_id`) USING BTREE;

--
-- Indexes for table `farmer`
--
ALTER TABLE `farmer`
  ADD PRIMARY KEY (`id_farmer`),
  ADD UNIQUE KEY `constraint_unique` (`farmer_name`);

--
-- Indexes for table `farmermessage`
--
ALTER TABLE `farmermessage`
  ADD PRIMARY KEY (`message_id`);

--
-- Indexes for table `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`image_id`),
  ADD KEY `farmer_id` (`farmer_id`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`news_id`);

--
-- Indexes for table `servermessage`
--
ALTER TABLE `servermessage`
  ADD PRIMARY KEY (`message_id`);

--
-- Indexes for table `token`
--
ALTER TABLE `token`
  ADD PRIMARY KEY (`id_phone`);

--
-- Indexes for table `treatment`
--
ALTER TABLE `treatment`
  ADD PRIMARY KEY (`treatment_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity`
--
ALTER TABLE `activity`
  MODIFY `activity_id` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cliniccenter`
--
ALTER TABLE `cliniccenter`
  MODIFY `clinic_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `crop`
--
ALTER TABLE `crop`
  MODIFY `crop_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `disease`
--
ALTER TABLE `disease`
  MODIFY `disease_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `farm`
--
ALTER TABLE `farm`
  MODIFY `farm_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=741;

--
-- AUTO_INCREMENT for table `farmer`
--
ALTER TABLE `farmer`
  MODIFY `id_farmer` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=204;

--
-- AUTO_INCREMENT for table `farmermessage`
--
ALTER TABLE `farmermessage`
  MODIFY `message_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `image`
--
ALTER TABLE `image`
  MODIFY `image_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=332;

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `news_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `servermessage`
--
ALTER TABLE `servermessage`
  MODIFY `message_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `token`
--
ALTER TABLE `token`
  MODIFY `id_phone` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `treatment`
--
ALTER TABLE `treatment`
  MODIFY `treatment_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=501;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `activity`
--
ALTER TABLE `activity`
  ADD CONSTRAINT `activity_ibfk_1` FOREIGN KEY (`farmer_id`) REFERENCES `farmer` (`id_farmer`),
  ADD CONSTRAINT `activity_ibfk_2` FOREIGN KEY (`farm_id`) REFERENCES `farm` (`farm_id`),
  ADD CONSTRAINT `activity_ibfk_3` FOREIGN KEY (`crop_id`) REFERENCES `crop` (`crop_id`),
  ADD CONSTRAINT `activity_ibfk_4` FOREIGN KEY (`disease_id`) REFERENCES `disease` (`disease_id`),
  ADD CONSTRAINT `activity_ibfk_5` FOREIGN KEY (`clinic_id`) REFERENCES `cliniccenter` (`clinic_id`),
  ADD CONSTRAINT `activity_ibfk_6` FOREIGN KEY (`treatment_id`) REFERENCES `treatment` (`treatment_id`),
  ADD CONSTRAINT `activity_ibfk_7` FOREIGN KEY (`image_id`) REFERENCES `image` (`image_id`);

--
-- Constraints for table `crop`
--
ALTER TABLE `crop`
  ADD CONSTRAINT `crop_ibfk_1` FOREIGN KEY (`farm_id`) REFERENCES `farm` (`farm_id`);

--
-- Constraints for table `disease`
--
ALTER TABLE `disease`
  ADD CONSTRAINT `disease_ibfk_1` FOREIGN KEY (`crop_id`) REFERENCES `crop` (`crop_id`),
  ADD CONSTRAINT `disease_ibfk_2` FOREIGN KEY (`treatment_id`) REFERENCES `treatment` (`treatment_id`);

--
-- Constraints for table `farm`
--
ALTER TABLE `farm`
  ADD CONSTRAINT `farm_ibfk_1` FOREIGN KEY (`farmer_id`) REFERENCES `farmer` (`id_farmer`);

--
-- Constraints for table `image`
--
ALTER TABLE `image`
  ADD CONSTRAINT `image_ibfk_1` FOREIGN KEY (`farmer_id`) REFERENCES `farmer` (`id_farmer`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
