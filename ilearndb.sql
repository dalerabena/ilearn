-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 27, 2019 at 03:49 AM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ilearndb`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `order`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, NULL, 1, 'Category 1', 'category-1', '2019-04-16 00:11:03', '2019-04-16 00:11:03'),
(2, NULL, 1, 'Category 2', 'category-2', '2019-04-16 00:11:03', '2019-04-16 00:11:03');

-- --------------------------------------------------------

--
-- Table structure for table `civilstatuses`
--

CREATE TABLE `civilstatuses` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `civilstatuses`
--

INSERT INTO `civilstatuses` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Single', '2019-04-21 18:03:24', '2019-04-21 18:03:24'),
(2, 'Married', '2019-04-21 18:03:36', '2019-04-21 18:03:36'),
(3, 'Divorced', '2019-04-21 18:03:48', '2019-04-21 18:03:48'),
(4, 'Separated', '2019-04-21 18:03:57', '2019-04-21 18:03:57'),
(5, 'Widowed', '2019-04-21 18:04:08', '2019-04-21 18:04:08');

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abbr` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `department_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `name`, `abbr`, `department_id`, `created_at`, `updated_at`) VALUES
(1, 'Master in Information Technology', 'MIT', 1, '2019-04-21 18:19:41', '2019-04-21 18:19:41');

-- --------------------------------------------------------

--
-- Table structure for table `data_rows`
--

CREATE TABLE `data_rows` (
  `id` int(10) UNSIGNED NOT NULL,
  `data_type_id` int(10) UNSIGNED NOT NULL,
  `field` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `browse` tinyint(1) NOT NULL DEFAULT '1',
  `read` tinyint(1) NOT NULL DEFAULT '1',
  `edit` tinyint(1) NOT NULL DEFAULT '1',
  `add` tinyint(1) NOT NULL DEFAULT '1',
  `delete` tinyint(1) NOT NULL DEFAULT '1',
  `details` text COLLATE utf8mb4_unicode_ci,
  `order` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `data_rows`
--

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, NULL, 3),
(4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, NULL, 4),
(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, NULL, 5),
(6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 6),
(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, NULL, 8),
(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":0}', 10),
(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'Roles', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', 11),
(11, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, NULL, 12),
(12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(13, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(14, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(15, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(16, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(17, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(18, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(19, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(20, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, NULL, 5),
(21, 1, 'role_id', 'text', 'Role', 1, 1, 1, 1, 1, 1, NULL, 9),
(22, 4, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(23, 4, 'parent_id', 'select_dropdown', 'Parent', 0, 0, 1, 1, 1, 1, '{\"default\":\"\",\"null\":\"\",\"options\":{\"\":\"-- None --\"},\"relationship\":{\"key\":\"id\",\"label\":\"name\"}}', 2),
(24, 4, 'order', 'text', 'Order', 1, 1, 1, 1, 1, 1, '{\"default\":1}', 3),
(25, 4, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 4),
(26, 4, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"name\"}}', 5),
(27, 4, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 0, NULL, 6),
(28, 4, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(29, 5, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(30, 5, 'author_id', 'text', 'Author', 1, 0, 1, 1, 0, 1, NULL, 2),
(31, 5, 'category_id', 'text', 'Category', 1, 0, 1, 1, 1, 0, NULL, 3),
(32, 5, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 4),
(33, 5, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 5),
(34, 5, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 6),
(35, 5, 'image', 'image', 'Post Image', 0, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"1000\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}', 7),
(36, 5, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:posts,slug\"}}', 8),
(37, 5, 'meta_description', 'text_area', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 9),
(38, 5, 'meta_keywords', 'text_area', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 10),
(39, 5, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"DRAFT\",\"options\":{\"PUBLISHED\":\"published\",\"DRAFT\":\"draft\",\"PENDING\":\"pending\"}}', 11),
(40, 5, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 12),
(41, 5, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 13),
(42, 5, 'seo_title', 'text', 'SEO Title', 0, 1, 1, 1, 1, 1, NULL, 14),
(43, 5, 'featured', 'checkbox', 'Featured', 1, 1, 1, 1, 1, 1, NULL, 15),
(44, 6, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(45, 6, 'author_id', 'text', 'Author', 1, 0, 0, 0, 0, 0, NULL, 2),
(46, 6, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 3),
(47, 6, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 4),
(48, 6, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 5),
(49, 6, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\"},\"validation\":{\"rule\":\"unique:pages,slug\"}}', 6),
(50, 6, 'meta_description', 'text', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 7),
(51, 6, 'meta_keywords', 'text', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 8),
(52, 6, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"INACTIVE\",\"options\":{\"INACTIVE\":\"INACTIVE\",\"ACTIVE\":\"ACTIVE\"}}', 9),
(53, 6, 'created_at', 'timestamp', 'Created At', 1, 1, 1, 0, 0, 0, NULL, 10),
(54, 6, 'updated_at', 'timestamp', 'Updated At', 1, 0, 0, 0, 0, 0, NULL, 11),
(55, 6, 'image', 'image', 'Page Image', 0, 1, 1, 1, 1, 1, NULL, 12),
(71, 10, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(72, 10, 'code', 'text', 'Code', 1, 1, 1, 1, 1, 1, '{}', 2),
(73, 10, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 3),
(74, 10, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 4),
(75, 10, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 5),
(88, 13, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(89, 13, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(90, 13, 'abbr', 'text', 'Abbr', 1, 1, 1, 1, 1, 1, '{}', 3),
(91, 13, 'department_id', 'text', 'Department Id', 0, 1, 1, 1, 1, 1, '{}', 4),
(92, 13, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 5),
(93, 13, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 6),
(94, 13, 'course_belongsto_department_relationship', 'relationship', 'departments', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Department\",\"table\":\"departments\",\"type\":\"belongsTo\",\"column\":\"department_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":null}', 7),
(95, 14, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(96, 14, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(97, 14, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 3),
(98, 14, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 4),
(99, 15, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(100, 15, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(101, 15, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 3),
(102, 15, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 4),
(103, 16, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(104, 16, 'idnumber', 'text', 'Idnumber', 1, 1, 1, 1, 1, 1, '{}', 2),
(105, 16, 'lastname', 'text', 'Lastname', 1, 1, 1, 1, 1, 1, '{}', 3),
(106, 16, 'firstname', 'text', 'Firstname', 1, 1, 1, 1, 1, 1, '{}', 4),
(107, 16, 'middlename', 'text', 'Middlename', 1, 1, 1, 1, 1, 1, '{}', 5),
(108, 16, 'genderid', 'text', 'Genderid', 0, 1, 1, 1, 1, 1, '{}', 6),
(109, 16, 'civilstatusid', 'text', 'Civilstatusid', 0, 1, 1, 1, 1, 1, '{}', 7),
(110, 16, 'contactnumber', 'text', 'Contactnumber', 0, 0, 1, 1, 1, 1, '{}', 8),
(111, 16, 'address', 'text', 'Address', 0, 0, 1, 1, 1, 1, '{}', 9),
(112, 16, 'password', 'password', 'Password', 0, 0, 1, 1, 1, 1, '{}', 10),
(113, 16, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 1, 0, 1, '{}', 13),
(114, 16, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 14),
(115, 16, 'student_belongsto_gender_relationship', 'relationship', 'Gender', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Gender\",\"table\":\"genders\",\"type\":\"belongsTo\",\"column\":\"genderid\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 11),
(116, 16, 'student_belongsto_civilstatus_relationship', 'relationship', 'Civil Status', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Civilstatus\",\"table\":\"civilstatuses\",\"type\":\"belongsTo\",\"column\":\"civilstatusid\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 12),
(117, 17, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(118, 17, 'idnumber', 'text', 'Idnumber', 0, 1, 1, 1, 1, 1, '{}', 2),
(119, 17, 'lastname', 'text', 'Lastname', 0, 1, 1, 1, 1, 1, '{}', 3),
(120, 17, 'firstname', 'text', 'Firstname', 0, 1, 1, 1, 1, 1, '{}', 4),
(121, 17, 'middlename', 'text', 'Middlename', 0, 1, 1, 1, 1, 1, '{}', 5),
(122, 17, 'genderid', 'text', 'Genderid', 0, 1, 1, 1, 1, 1, '{}', 6),
(123, 17, 'civilstatusid', 'text', 'Civilstatusid', 0, 1, 1, 1, 1, 1, '{}', 7),
(124, 17, 'contactnumber', 'text', 'Contactnumber', 0, 0, 1, 1, 1, 1, '{}', 8),
(125, 17, 'address', 'text', 'Address', 0, 0, 1, 1, 1, 1, '{}', 9),
(126, 17, 'password', 'password', 'Password', 0, 0, 1, 1, 1, 1, '{}', 10),
(127, 17, 'instructor_belongsto_civilstatus_relationship', 'relationship', 'Civil Status', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Civilstatus\",\"table\":\"civilstatuses\",\"type\":\"belongsTo\",\"column\":\"civilstatusid\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 12),
(128, 17, 'instructor_belongsto_gender_relationship', 'relationship', 'Gender', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Gender\",\"table\":\"genders\",\"type\":\"belongsTo\",\"column\":\"genderid\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 11),
(129, 17, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 1, 0, 1, '{}', 13),
(130, 17, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 14),
(131, 18, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(132, 18, 'code', 'text', 'Code', 0, 1, 1, 1, 1, 1, '{}', 2),
(133, 18, 'name', 'text', 'Name', 0, 1, 1, 1, 1, 1, '{}', 3),
(134, 18, 'schoolyear', 'text', 'Schoolyear', 0, 1, 1, 1, 1, 1, '{}', 4),
(135, 18, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 5),
(136, 18, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 6),
(137, 20, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(138, 20, 'yearlevel', 'text', 'Yearlevel', 0, 1, 1, 1, 1, 1, '{}', 2),
(139, 20, 'description', 'text', 'Description', 0, 1, 1, 1, 1, 1, '{}', 3),
(140, 20, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 4),
(141, 20, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 5),
(142, 21, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(143, 21, 'days', 'text', 'Days', 0, 1, 1, 1, 1, 1, '{}', 2),
(144, 21, 'time', 'text', 'Time', 0, 1, 1, 1, 1, 1, '{}', 3),
(145, 21, 'room', 'text', 'Room', 0, 1, 1, 1, 1, 1, '{}', 4),
(146, 21, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 5),
(147, 21, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 6),
(148, 22, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(149, 22, 'code', 'text', 'Code', 0, 1, 1, 1, 1, 1, '{}', 2),
(151, 22, 'name', 'text', 'Name', 0, 1, 1, 1, 1, 1, '{}', 4),
(152, 22, 'units', 'number', 'Units', 0, 1, 1, 1, 1, 1, '{}', 5),
(153, 22, 'lectunits', 'number', 'Lectunits', 0, 0, 1, 1, 1, 1, '{}', 6),
(154, 22, 'labunits', 'number', 'Labunits', 0, 0, 1, 1, 1, 1, '{}', 7),
(155, 22, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 9),
(156, 22, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 10),
(157, 22, 'subject_belongsto_course_relationship', 'relationship', 'Course', 0, 0, 1, 1, 1, 1, '{\"model\":\"App\\\\Course\",\"table\":\"courses\",\"type\":\"belongsTo\",\"column\":\"courseid\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 8),
(158, 22, 'courseid', 'text', 'Courseid', 0, 0, 1, 1, 1, 1, '{}', 3),
(159, 24, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(160, 24, 'code', 'text', 'Code', 0, 1, 1, 1, 1, 1, '{}', 2),
(161, 24, 'enrollid', 'text', 'Enrollid', 0, 1, 1, 1, 1, 1, '{}', 3),
(162, 24, 'periodid', 'text', 'Periodid', 0, 1, 1, 1, 1, 1, '{}', 4),
(163, 24, 'sectionid', 'text', 'Sectionid', 0, 1, 1, 1, 1, 1, '{}', 5),
(164, 24, 'subjectid', 'text', 'Subjectid', 0, 1, 1, 1, 1, 1, '{}', 6),
(165, 24, 'instructorid', 'text', 'Instructorid', 0, 1, 1, 1, 1, 1, '{}', 7),
(166, 24, 'scheduleid', 'text', 'Scheduleid', 0, 1, 1, 1, 1, 1, '{}', 8),
(167, 24, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 9),
(168, 24, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 10),
(169, 24, 'enrollclass_belongsto_period_relationship', 'relationship', 'Period', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Period\",\"table\":\"periods\",\"type\":\"belongsTo\",\"column\":\"periodid\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 11),
(170, 24, 'enrollclass_belongsto_schedule_relationship', 'relationship', 'Schedule', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Schedule\",\"table\":\"schedules\",\"type\":\"belongsTo\",\"column\":\"scheduleid\",\"key\":\"id\",\"label\":\"time\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 14),
(171, 24, 'enrollclass_belongsto_subject_relationship', 'relationship', 'Subject', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Subject\",\"table\":\"subjects\",\"type\":\"belongsTo\",\"column\":\"subjectid\",\"key\":\"id\",\"label\":\"code\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 12),
(172, 24, 'enrollclass_belongsto_instructor_relationship', 'relationship', 'Instructor', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Instructor\",\"table\":\"instructors\",\"type\":\"belongsTo\",\"column\":\"instructorid\",\"key\":\"id\",\"label\":\"idnumber\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 13),
(173, 25, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(174, 25, 'dateenroll', 'date', 'Dateenroll', 0, 1, 1, 1, 1, 1, '{}', 2),
(175, 25, 'studentid', 'text', 'Studentid', 0, 1, 1, 1, 1, 1, '{}', 3),
(176, 25, 'periodid', 'text', 'Periodid', 0, 1, 1, 1, 1, 1, '{}', 4),
(177, 25, 'courseid', 'text', 'Courseid', 0, 1, 1, 1, 1, 1, '{}', 5),
(178, 25, 'yearid', 'text', 'Yearid', 0, 1, 1, 1, 1, 1, '{}', 6),
(179, 25, 'status', 'text', 'Status', 0, 1, 1, 1, 1, 1, '{}', 7),
(180, 25, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 12),
(181, 25, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 13),
(183, 25, 'enrollment_belongsto_student_relationship', 'relationship', 'Stuent', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Student\",\"table\":\"students\",\"type\":\"belongsTo\",\"column\":\"studentid\",\"key\":\"id\",\"label\":\"idnumber\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 8),
(184, 25, 'enrollment_belongsto_period_relationship', 'relationship', 'Period', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Period\",\"table\":\"periods\",\"type\":\"belongsTo\",\"column\":\"periodid\",\"key\":\"id\",\"label\":\"code\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 9),
(185, 25, 'enrollment_belongsto_course_relationship', 'relationship', 'Course', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Course\",\"table\":\"courses\",\"type\":\"belongsTo\",\"column\":\"courseid\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 10),
(186, 25, 'enrollment_belongsto_yearlevel_relationship', 'relationship', 'YearLevel', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Yearlevel\",\"table\":\"yearlevels\",\"type\":\"belongsTo\",\"column\":\"yearid\",\"key\":\"id\",\"label\":\"yearlevel\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 11),
(187, 24, 'enrollclass_belongsto_enrollment_relationship', 'relationship', 'enrollments', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Enrollment\",\"table\":\"enrollments\",\"type\":\"belongsTo\",\"column\":\"enrollid\",\"key\":\"id\",\"label\":\"studentid\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":null}', 15),
(188, 25, 'enrollment_hasmany_enrollclass_relationship', 'relationship', 'enrollclasses', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Enrollclass\",\"table\":\"enrollclasses\",\"type\":\"hasMany\",\"column\":\"enrollid\",\"key\":\"id\",\"label\":\"code\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":null}', 14);

-- --------------------------------------------------------

--
-- Table structure for table `data_types`
--

CREATE TABLE `data_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT '0',
  `server_side` tinyint(4) NOT NULL DEFAULT '0',
  `details` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', '', 1, 0, NULL, '2019-04-16 00:10:58', '2019-04-16 00:10:58'),
(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2019-04-16 00:10:58', '2019-04-16 00:10:58'),
(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, '', '', 1, 0, NULL, '2019-04-16 00:10:58', '2019-04-16 00:10:58'),
(4, 'categories', 'categories', 'Category', 'Categories', 'voyager-categories', 'TCG\\Voyager\\Models\\Category', NULL, '', '', 1, 0, NULL, '2019-04-16 00:11:03', '2019-04-16 00:11:03'),
(5, 'posts', 'posts', 'Post', 'Posts', 'voyager-news', 'TCG\\Voyager\\Models\\Post', 'TCG\\Voyager\\Policies\\PostPolicy', '', '', 1, 0, NULL, '2019-04-16 00:11:04', '2019-04-16 00:11:04'),
(6, 'pages', 'pages', 'Page', 'Pages', 'voyager-file-text', 'TCG\\Voyager\\Models\\Page', NULL, '', '', 1, 0, NULL, '2019-04-16 00:11:05', '2019-04-16 00:11:05'),
(10, 'departments', 'departments', 'Department', 'Departments', 'voyager-tree', 'App\\Department', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2019-04-21 17:41:05', '2019-04-21 17:41:05'),
(13, 'courses', 'courses', 'Course', 'Courses', 'voyager-leaf', 'App\\Course', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2019-04-21 17:51:25', '2019-04-21 17:51:25'),
(14, 'genders', 'genders', 'Gender', 'Genders', NULL, 'App\\Gender', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2019-04-21 17:56:32', '2019-04-21 17:56:32'),
(15, 'civilstatuses', 'civilstatuses', 'Civil Status', 'Civil Statuses', NULL, 'App\\Civilstatus', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2019-04-21 17:59:35', '2019-04-21 18:02:19'),
(16, 'students', 'students', 'Student', 'Students', 'voyager-people', 'App\\Student', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2019-04-21 18:32:35', '2019-04-21 18:44:52'),
(17, 'instructors', 'instructors', 'Instructor', 'Instructors', 'voyager-person', 'App\\Instructor', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2019-04-21 18:57:25', '2019-04-21 19:12:35'),
(18, 'periods', 'periods', 'Period', 'Periods', 'voyager-calendar', 'App\\Period', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2019-04-21 19:22:38', '2019-04-21 19:22:38'),
(20, 'yearlevels', 'yearlevels', 'Yearlevel', 'Yearlevels', 'voyager-list', 'App\\Yearlevel', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2019-04-21 19:28:34', '2019-04-21 19:28:34'),
(21, 'schedules', 'schedules', 'Schedule', 'Schedules', 'voyager-calendar', 'App\\Schedule', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2019-04-21 19:34:07', '2019-04-21 19:34:07'),
(22, 'subjects', 'subjects', 'Subject', 'Subjects', 'voyager-book', 'App\\Subject', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2019-04-21 19:39:52', '2019-04-21 19:45:22'),
(24, 'enrollclasses', 'enrollclasses', 'Enrollclass', 'Enrollclasses', 'voyager-group', 'App\\Enrollclass', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2019-04-21 21:29:28', '2019-04-21 21:33:46'),
(25, 'enrollments', 'enrollments', 'Enrollment', 'Enrollments', 'voyager-archive', 'App\\Enrollment', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2019-04-21 21:38:37', '2019-04-21 21:45:10');

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `code`, `name`, `created_at`, `updated_at`) VALUES
(1, 'DCS', 'Department of Computer Science', '2019-04-21 17:53:57', '2019-04-21 17:53:57');

-- --------------------------------------------------------

--
-- Table structure for table `enrollclasses`
--

CREATE TABLE `enrollclasses` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enrollid` int(11) DEFAULT NULL,
  `periodid` int(11) DEFAULT NULL,
  `sectionid` int(11) DEFAULT '0',
  `subjectid` int(11) DEFAULT NULL,
  `instructorid` int(11) DEFAULT NULL,
  `scheduleid` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `enrollclasses`
--

INSERT INTO `enrollclasses` (`id`, `code`, `enrollid`, `periodid`, `sectionid`, `subjectid`, `instructorid`, `scheduleid`, `created_at`, `updated_at`) VALUES
(1, 'aaa', 1, 1, 1, 1, 1, 1, '2019-04-21 21:48:10', '2019-04-21 21:48:10'),
(2, 'bbb', 1, 1, 1, 2, 1, 2, '2019-04-21 21:50:10', '2019-04-21 21:50:10'),
(3, 'ccc', 1, 1, 1, 3, 1, 3, '2019-04-21 21:50:29', '2019-04-21 21:50:29');

-- --------------------------------------------------------

--
-- Table structure for table `enrollments`
--

CREATE TABLE `enrollments` (
  `id` int(10) UNSIGNED NOT NULL,
  `dateenroll` date DEFAULT NULL,
  `studentid` int(11) DEFAULT NULL,
  `periodid` int(11) DEFAULT NULL,
  `courseid` int(11) DEFAULT NULL,
  `yearid` int(11) DEFAULT NULL,
  `status` varchar(126) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `enrollments`
--

INSERT INTO `enrollments` (`id`, `dateenroll`, `studentid`, `periodid`, `courseid`, `yearid`, `status`, `created_at`, `updated_at`) VALUES
(1, '2019-04-10', 1, 1, 1, 1, 'test', '2019-04-21 21:45:30', '2019-04-21 21:45:30');

-- --------------------------------------------------------

--
-- Table structure for table `genders`
--

CREATE TABLE `genders` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `genders`
--

INSERT INTO `genders` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Male', '2019-04-21 17:57:07', '2019-04-21 17:57:07'),
(2, 'Female', '2019-04-21 17:57:13', '2019-04-21 17:57:13');

-- --------------------------------------------------------

--
-- Table structure for table `instructors`
--

CREATE TABLE `instructors` (
  `id` int(10) UNSIGNED NOT NULL,
  `idnumber` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `firstname` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `middlename` varbinary(128) DEFAULT NULL,
  `genderid` int(11) DEFAULT NULL,
  `civilstatusid` int(11) DEFAULT NULL,
  `contactnumber` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `instructors`
--

INSERT INTO `instructors` (`id`, `idnumber`, `lastname`, `firstname`, `middlename`, `genderid`, `civilstatusid`, `contactnumber`, `address`, `password`, `created_at`, `updated_at`) VALUES
(1, '123', 'aaa', 'aaa', 0x616161, 1, 2, '1234567890', 'batac city', '$2y$10$x6X8k1r69bAWYN92khqppePKRdBWdl3Z1/5viz9hzzpHOZ/KJqASy', '2019-04-21 19:13:09', '2019-04-21 19:13:09');

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2019-04-16 00:10:59', '2019-04-16 00:10:59');

-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, 'Dashboard', '', '_self', 'voyager-boat', NULL, NULL, 1, '2019-04-16 00:10:59', '2019-04-16 00:10:59', 'voyager.dashboard', NULL),
(2, 1, 'Media', '', '_self', 'voyager-images', NULL, NULL, 4, '2019-04-16 00:10:59', '2019-04-21 17:37:44', 'voyager.media.index', NULL),
(3, 1, 'Users', '', '_self', 'voyager-person', NULL, NULL, 3, '2019-04-16 00:10:59', '2019-04-16 00:10:59', 'voyager.users.index', NULL),
(4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, NULL, 2, '2019-04-16 00:10:59', '2019-04-16 00:10:59', 'voyager.roles.index', NULL),
(5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 6, '2019-04-16 00:10:59', '2019-04-21 17:37:44', NULL, NULL),
(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 1, '2019-04-16 00:10:59', '2019-04-21 17:37:44', 'voyager.menus.index', NULL),
(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 2, '2019-04-16 00:10:59', '2019-04-21 17:37:44', 'voyager.database.index', NULL),
(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 3, '2019-04-16 00:10:59', '2019-04-21 17:37:44', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 4, '2019-04-16 00:10:59', '2019-04-21 17:37:44', 'voyager.bread.index', NULL),
(10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, NULL, 7, '2019-04-16 00:10:59', '2019-04-21 17:37:44', 'voyager.settings.index', NULL),
(11, 1, 'Categories', '', '_self', 'voyager-categories', NULL, NULL, 5, '2019-04-16 00:11:03', '2019-04-21 17:37:44', 'voyager.categories.index', NULL),
(14, 1, 'Hooks', '', '_self', 'voyager-hook', NULL, 5, 5, '2019-04-16 00:11:08', '2019-04-21 17:37:44', 'voyager.hooks', NULL),
(18, 1, 'Departments', '', '_self', 'voyager-tree', NULL, NULL, 8, '2019-04-21 17:41:05', '2019-04-21 17:41:05', 'voyager.departments.index', NULL),
(21, 1, 'Courses', '', '_self', 'voyager-leaf', NULL, NULL, 9, '2019-04-21 17:51:25', '2019-04-21 17:51:25', 'voyager.courses.index', NULL),
(22, 1, 'Genders', '', '_self', NULL, NULL, NULL, 10, '2019-04-21 17:56:33', '2019-04-21 17:56:33', 'voyager.genders.index', NULL),
(23, 1, 'Civil Statuses', '', '_self', NULL, '#000000', NULL, 11, '2019-04-21 17:59:35', '2019-04-21 18:00:15', 'voyager.civilstatuses.index', 'null'),
(24, 1, 'Students', '', '_self', 'voyager-people', NULL, NULL, 12, '2019-04-21 18:32:35', '2019-04-21 18:32:35', 'voyager.students.index', NULL),
(25, 1, 'Instructors', '', '_self', 'voyager-person', NULL, NULL, 13, '2019-04-21 18:57:25', '2019-04-21 18:57:25', 'voyager.instructors.index', NULL),
(26, 1, 'Periods', '', '_self', 'voyager-calendar', NULL, NULL, 14, '2019-04-21 19:22:38', '2019-04-21 19:22:38', 'voyager.periods.index', NULL),
(28, 1, 'Yearlevels', '', '_self', 'voyager-list', NULL, NULL, 15, '2019-04-21 19:28:35', '2019-04-21 19:28:35', 'voyager.yearlevels.index', NULL),
(29, 1, 'Schedules', '', '_self', 'voyager-calendar', NULL, NULL, 16, '2019-04-21 19:34:07', '2019-04-21 19:34:07', 'voyager.schedules.index', NULL),
(30, 1, 'Subjects', '', '_self', 'voyager-book', NULL, NULL, 17, '2019-04-21 19:39:52', '2019-04-21 19:39:52', 'voyager.subjects.index', NULL),
(31, 1, 'Enrollclasses', '', '_self', 'voyager-group', NULL, NULL, 18, '2019-04-21 21:29:29', '2019-04-21 21:29:29', 'voyager.enrollclasses.index', NULL),
(32, 1, 'Enrollments', '', '_self', 'voyager-archive', '#000000', NULL, 19, '2019-04-21 21:38:37', '2019-04-21 21:44:21', 'voyager.enrollments.index', 'null');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(53, '2014_10_12_000000_create_users_table', 1),
(54, '2014_10_12_100000_create_password_resets_table', 1),
(55, '2016_01_01_000000_add_voyager_user_fields', 1),
(56, '2016_01_01_000000_create_data_types_table', 1),
(57, '2016_01_01_000000_create_pages_table', 1),
(58, '2016_01_01_000000_create_posts_table', 1),
(59, '2016_02_15_204651_create_categories_table', 1),
(60, '2016_05_19_173453_create_menu_table', 1),
(61, '2016_10_21_190000_create_roles_table', 1),
(62, '2016_10_21_190000_create_settings_table', 1),
(63, '2016_11_30_135954_create_permission_table', 1),
(64, '2016_11_30_141208_create_permission_role_table', 1),
(65, '2016_12_26_201236_data_types__add__server_side', 1),
(66, '2017_01_13_000000_add_route_to_menu_items_table', 1),
(67, '2017_01_14_005015_create_translations_table', 1),
(68, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1),
(69, '2017_03_06_000000_add_controller_to_data_types_table', 1),
(70, '2017_04_11_000000_alter_post_nullable_fields_table', 1),
(71, '2017_04_21_000000_add_order_to_data_rows_table', 1),
(72, '2017_07_05_210000_add_policyname_to_data_types_table', 1),
(73, '2017_08_05_000000_add_group_to_settings_table', 1),
(74, '2017_11_26_013050_add_user_role_relationship', 1),
(75, '2017_11_26_015000_create_user_roles_table', 1),
(76, '2018_03_11_000000_add_user_settings', 1),
(77, '2018_03_14_000000_add_details_to_data_types_table', 1),
(78, '2018_03_16_000000_make_settings_value_nullable', 1);

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `author_id` int(11) NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `author_id`, `title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `created_at`, `updated_at`) VALUES
(1, 0, 'Hello World', 'Hang the jib grog grog blossom grapple dance the hempen jig gangway pressgang bilge rat to go on account lugger. Nelsons folly gabion line draught scallywag fire ship gaff fluke fathom case shot. Sea Legs bilge rat sloop matey gabion long clothes run a shot across the bow Gold Road cog league.', '<p>Hello World. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', 'pages/page1.jpg', 'hello-world', 'Yar Meta Description', 'Keyword1, Keyword2', 'ACTIVE', '2019-04-16 00:11:06', '2019-04-16 00:11:06');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `periods`
--

CREATE TABLE `periods` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `schoolyear` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `periods`
--

INSERT INTO `periods` (`id`, `code`, `name`, `schoolyear`, `created_at`, `updated_at`) VALUES
(1, '2nd', 'Second Semester', '2018-2019', '2019-04-21 19:23:24', '2019-04-21 19:23:24');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
(1, 'browse_admin', NULL, '2019-04-16 00:11:00', '2019-04-16 00:11:00'),
(2, 'browse_bread', NULL, '2019-04-16 00:11:00', '2019-04-16 00:11:00'),
(3, 'browse_database', NULL, '2019-04-16 00:11:00', '2019-04-16 00:11:00'),
(4, 'browse_media', NULL, '2019-04-16 00:11:00', '2019-04-16 00:11:00'),
(5, 'browse_compass', NULL, '2019-04-16 00:11:00', '2019-04-16 00:11:00'),
(6, 'browse_menus', 'menus', '2019-04-16 00:11:00', '2019-04-16 00:11:00'),
(7, 'read_menus', 'menus', '2019-04-16 00:11:00', '2019-04-16 00:11:00'),
(8, 'edit_menus', 'menus', '2019-04-16 00:11:00', '2019-04-16 00:11:00'),
(9, 'add_menus', 'menus', '2019-04-16 00:11:00', '2019-04-16 00:11:00'),
(10, 'delete_menus', 'menus', '2019-04-16 00:11:00', '2019-04-16 00:11:00'),
(11, 'browse_roles', 'roles', '2019-04-16 00:11:00', '2019-04-16 00:11:00'),
(12, 'read_roles', 'roles', '2019-04-16 00:11:00', '2019-04-16 00:11:00'),
(13, 'edit_roles', 'roles', '2019-04-16 00:11:00', '2019-04-16 00:11:00'),
(14, 'add_roles', 'roles', '2019-04-16 00:11:00', '2019-04-16 00:11:00'),
(15, 'delete_roles', 'roles', '2019-04-16 00:11:00', '2019-04-16 00:11:00'),
(16, 'browse_users', 'users', '2019-04-16 00:11:00', '2019-04-16 00:11:00'),
(17, 'read_users', 'users', '2019-04-16 00:11:00', '2019-04-16 00:11:00'),
(18, 'edit_users', 'users', '2019-04-16 00:11:00', '2019-04-16 00:11:00'),
(19, 'add_users', 'users', '2019-04-16 00:11:01', '2019-04-16 00:11:01'),
(20, 'delete_users', 'users', '2019-04-16 00:11:01', '2019-04-16 00:11:01'),
(21, 'browse_settings', 'settings', '2019-04-16 00:11:01', '2019-04-16 00:11:01'),
(22, 'read_settings', 'settings', '2019-04-16 00:11:01', '2019-04-16 00:11:01'),
(23, 'edit_settings', 'settings', '2019-04-16 00:11:01', '2019-04-16 00:11:01'),
(24, 'add_settings', 'settings', '2019-04-16 00:11:01', '2019-04-16 00:11:01'),
(25, 'delete_settings', 'settings', '2019-04-16 00:11:01', '2019-04-16 00:11:01'),
(26, 'browse_categories', 'categories', '2019-04-16 00:11:03', '2019-04-16 00:11:03'),
(27, 'read_categories', 'categories', '2019-04-16 00:11:03', '2019-04-16 00:11:03'),
(28, 'edit_categories', 'categories', '2019-04-16 00:11:03', '2019-04-16 00:11:03'),
(29, 'add_categories', 'categories', '2019-04-16 00:11:03', '2019-04-16 00:11:03'),
(30, 'delete_categories', 'categories', '2019-04-16 00:11:03', '2019-04-16 00:11:03'),
(31, 'browse_posts', 'posts', '2019-04-16 00:11:04', '2019-04-16 00:11:04'),
(32, 'read_posts', 'posts', '2019-04-16 00:11:04', '2019-04-16 00:11:04'),
(33, 'edit_posts', 'posts', '2019-04-16 00:11:04', '2019-04-16 00:11:04'),
(34, 'add_posts', 'posts', '2019-04-16 00:11:04', '2019-04-16 00:11:04'),
(35, 'delete_posts', 'posts', '2019-04-16 00:11:05', '2019-04-16 00:11:05'),
(36, 'browse_pages', 'pages', '2019-04-16 00:11:06', '2019-04-16 00:11:06'),
(37, 'read_pages', 'pages', '2019-04-16 00:11:06', '2019-04-16 00:11:06'),
(38, 'edit_pages', 'pages', '2019-04-16 00:11:06', '2019-04-16 00:11:06'),
(39, 'add_pages', 'pages', '2019-04-16 00:11:06', '2019-04-16 00:11:06'),
(40, 'delete_pages', 'pages', '2019-04-16 00:11:06', '2019-04-16 00:11:06'),
(41, 'browse_hooks', NULL, '2019-04-16 00:11:08', '2019-04-16 00:11:08'),
(57, 'browse_departments', 'departments', '2019-04-21 17:41:05', '2019-04-21 17:41:05'),
(58, 'read_departments', 'departments', '2019-04-21 17:41:05', '2019-04-21 17:41:05'),
(59, 'edit_departments', 'departments', '2019-04-21 17:41:05', '2019-04-21 17:41:05'),
(60, 'add_departments', 'departments', '2019-04-21 17:41:05', '2019-04-21 17:41:05'),
(61, 'delete_departments', 'departments', '2019-04-21 17:41:05', '2019-04-21 17:41:05'),
(72, 'browse_courses', 'courses', '2019-04-21 17:51:25', '2019-04-21 17:51:25'),
(73, 'read_courses', 'courses', '2019-04-21 17:51:25', '2019-04-21 17:51:25'),
(74, 'edit_courses', 'courses', '2019-04-21 17:51:25', '2019-04-21 17:51:25'),
(75, 'add_courses', 'courses', '2019-04-21 17:51:25', '2019-04-21 17:51:25'),
(76, 'delete_courses', 'courses', '2019-04-21 17:51:25', '2019-04-21 17:51:25'),
(77, 'browse_genders', 'genders', '2019-04-21 17:56:32', '2019-04-21 17:56:32'),
(78, 'read_genders', 'genders', '2019-04-21 17:56:32', '2019-04-21 17:56:32'),
(79, 'edit_genders', 'genders', '2019-04-21 17:56:32', '2019-04-21 17:56:32'),
(80, 'add_genders', 'genders', '2019-04-21 17:56:33', '2019-04-21 17:56:33'),
(81, 'delete_genders', 'genders', '2019-04-21 17:56:33', '2019-04-21 17:56:33'),
(82, 'browse_civilstatuses', 'civilstatuses', '2019-04-21 17:59:35', '2019-04-21 17:59:35'),
(83, 'read_civilstatuses', 'civilstatuses', '2019-04-21 17:59:35', '2019-04-21 17:59:35'),
(84, 'edit_civilstatuses', 'civilstatuses', '2019-04-21 17:59:35', '2019-04-21 17:59:35'),
(85, 'add_civilstatuses', 'civilstatuses', '2019-04-21 17:59:35', '2019-04-21 17:59:35'),
(86, 'delete_civilstatuses', 'civilstatuses', '2019-04-21 17:59:35', '2019-04-21 17:59:35'),
(87, 'browse_students', 'students', '2019-04-21 18:32:35', '2019-04-21 18:32:35'),
(88, 'read_students', 'students', '2019-04-21 18:32:35', '2019-04-21 18:32:35'),
(89, 'edit_students', 'students', '2019-04-21 18:32:35', '2019-04-21 18:32:35'),
(90, 'add_students', 'students', '2019-04-21 18:32:35', '2019-04-21 18:32:35'),
(91, 'delete_students', 'students', '2019-04-21 18:32:35', '2019-04-21 18:32:35'),
(92, 'browse_instructors', 'instructors', '2019-04-21 18:57:25', '2019-04-21 18:57:25'),
(93, 'read_instructors', 'instructors', '2019-04-21 18:57:25', '2019-04-21 18:57:25'),
(94, 'edit_instructors', 'instructors', '2019-04-21 18:57:25', '2019-04-21 18:57:25'),
(95, 'add_instructors', 'instructors', '2019-04-21 18:57:25', '2019-04-21 18:57:25'),
(96, 'delete_instructors', 'instructors', '2019-04-21 18:57:25', '2019-04-21 18:57:25'),
(97, 'browse_periods', 'periods', '2019-04-21 19:22:38', '2019-04-21 19:22:38'),
(98, 'read_periods', 'periods', '2019-04-21 19:22:38', '2019-04-21 19:22:38'),
(99, 'edit_periods', 'periods', '2019-04-21 19:22:38', '2019-04-21 19:22:38'),
(100, 'add_periods', 'periods', '2019-04-21 19:22:38', '2019-04-21 19:22:38'),
(101, 'delete_periods', 'periods', '2019-04-21 19:22:38', '2019-04-21 19:22:38'),
(107, 'browse_yearlevels', 'yearlevels', '2019-04-21 19:28:34', '2019-04-21 19:28:34'),
(108, 'read_yearlevels', 'yearlevels', '2019-04-21 19:28:34', '2019-04-21 19:28:34'),
(109, 'edit_yearlevels', 'yearlevels', '2019-04-21 19:28:35', '2019-04-21 19:28:35'),
(110, 'add_yearlevels', 'yearlevels', '2019-04-21 19:28:35', '2019-04-21 19:28:35'),
(111, 'delete_yearlevels', 'yearlevels', '2019-04-21 19:28:35', '2019-04-21 19:28:35'),
(112, 'browse_schedules', 'schedules', '2019-04-21 19:34:07', '2019-04-21 19:34:07'),
(113, 'read_schedules', 'schedules', '2019-04-21 19:34:07', '2019-04-21 19:34:07'),
(114, 'edit_schedules', 'schedules', '2019-04-21 19:34:07', '2019-04-21 19:34:07'),
(115, 'add_schedules', 'schedules', '2019-04-21 19:34:07', '2019-04-21 19:34:07'),
(116, 'delete_schedules', 'schedules', '2019-04-21 19:34:07', '2019-04-21 19:34:07'),
(117, 'browse_subjects', 'subjects', '2019-04-21 19:39:52', '2019-04-21 19:39:52'),
(118, 'read_subjects', 'subjects', '2019-04-21 19:39:52', '2019-04-21 19:39:52'),
(119, 'edit_subjects', 'subjects', '2019-04-21 19:39:52', '2019-04-21 19:39:52'),
(120, 'add_subjects', 'subjects', '2019-04-21 19:39:52', '2019-04-21 19:39:52'),
(121, 'delete_subjects', 'subjects', '2019-04-21 19:39:52', '2019-04-21 19:39:52'),
(122, 'browse_enrollclasses', 'enrollclasses', '2019-04-21 21:29:29', '2019-04-21 21:29:29'),
(123, 'read_enrollclasses', 'enrollclasses', '2019-04-21 21:29:29', '2019-04-21 21:29:29'),
(124, 'edit_enrollclasses', 'enrollclasses', '2019-04-21 21:29:29', '2019-04-21 21:29:29'),
(125, 'add_enrollclasses', 'enrollclasses', '2019-04-21 21:29:29', '2019-04-21 21:29:29'),
(126, 'delete_enrollclasses', 'enrollclasses', '2019-04-21 21:29:29', '2019-04-21 21:29:29'),
(127, 'browse_enrollments', 'enrollments', '2019-04-21 21:38:37', '2019-04-21 21:38:37'),
(128, 'read_enrollments', 'enrollments', '2019-04-21 21:38:37', '2019-04-21 21:38:37'),
(129, 'edit_enrollments', 'enrollments', '2019-04-21 21:38:37', '2019-04-21 21:38:37'),
(130, 'add_enrollments', 'enrollments', '2019-04-21 21:38:37', '2019-04-21 21:38:37'),
(131, 'delete_enrollments', 'enrollments', '2019-04-21 21:38:37', '2019-04-21 21:38:37');

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 4),
(2, 1),
(2, 4),
(3, 1),
(3, 4),
(4, 1),
(4, 4),
(5, 1),
(5, 4),
(6, 1),
(6, 4),
(7, 1),
(7, 4),
(8, 1),
(8, 4),
(9, 1),
(9, 4),
(10, 1),
(10, 4),
(11, 1),
(11, 4),
(12, 1),
(12, 4),
(13, 1),
(13, 4),
(14, 1),
(14, 4),
(15, 1),
(15, 4),
(16, 1),
(16, 4),
(17, 1),
(17, 4),
(18, 1),
(18, 4),
(19, 1),
(19, 4),
(20, 1),
(20, 4),
(21, 1),
(21, 4),
(22, 1),
(22, 4),
(23, 1),
(23, 4),
(24, 1),
(24, 4),
(25, 1),
(25, 4),
(26, 4),
(27, 4),
(28, 4),
(29, 4),
(30, 4),
(31, 4),
(32, 4),
(33, 4),
(34, 4),
(35, 4),
(36, 4),
(37, 4),
(38, 4),
(39, 4),
(40, 4),
(41, 1),
(41, 4),
(72, 1),
(73, 1),
(74, 1),
(75, 1),
(76, 1),
(87, 1),
(88, 1),
(89, 1),
(90, 1),
(91, 1),
(92, 1),
(93, 1),
(94, 1),
(95, 1),
(96, 1),
(97, 1),
(98, 1),
(99, 1),
(100, 1),
(101, 1),
(112, 1),
(113, 1),
(114, 1),
(115, 1),
(116, 1),
(117, 1),
(118, 1),
(119, 1),
(120, 1),
(121, 1),
(122, 1),
(123, 1),
(124, 1),
(125, 1),
(126, 1),
(127, 1),
(128, 1),
(129, 1),
(130, 1),
(131, 1);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `author_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` enum('PUBLISHED','DRAFT','PENDING') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `author_id`, `category_id`, `title`, `seo_title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `featured`, `created_at`, `updated_at`) VALUES
(1, 0, NULL, 'Lorem Ipsum Post', NULL, 'This is the excerpt for the Lorem Ipsum Post', '<p>This is the body of the lorem ipsum post</p>', 'posts/post1.jpg', 'lorem-ipsum-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2019-04-16 00:11:05', '2019-04-16 00:11:05'),
(2, 0, NULL, 'My Sample Post', NULL, 'This is the excerpt for the sample Post', '<p>This is the body for the sample post, which includes the body.</p>\n                <h2>We can use all kinds of format!</h2>\n                <p>And include a bunch of other stuff.</p>', 'posts/post2.jpg', 'my-sample-post', 'Meta Description for sample post', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2019-04-16 00:11:05', '2019-04-16 00:11:05'),
(3, 0, NULL, 'Latest Post', NULL, 'This is the excerpt for the latest post', '<p>This is the body for the latest post</p>', 'posts/post3.jpg', 'latest-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2019-04-16 00:11:05', '2019-04-16 00:11:05'),
(4, 0, NULL, 'Yarr Post', NULL, 'Reef sails nipperkin bring a spring upon her cable coffer jury mast spike marooned Pieces of Eight poop deck pillage. Clipper driver coxswain galleon hempen halter come about pressgang gangplank boatswain swing the lead. Nipperkin yard skysail swab lanyard Blimey bilge water ho quarter Buccaneer.', '<p>Swab deadlights Buccaneer fire ship square-rigged dance the hempen jig weigh anchor cackle fruit grog furl. Crack Jennys tea cup chase guns pressgang hearties spirits hogshead Gold Road six pounders fathom measured fer yer chains. Main sheet provost come about trysail barkadeer crimp scuttle mizzenmast brig plunder.</p>\n<p>Mizzen league keelhaul galleon tender cog chase Barbary Coast doubloon crack Jennys tea cup. Blow the man down lugsail fire ship pinnace cackle fruit line warp Admiral of the Black strike colors doubloon. Tackle Jack Ketch come about crimp rum draft scuppers run a shot across the bow haul wind maroon.</p>\n<p>Interloper heave down list driver pressgang holystone scuppers tackle scallywag bilged on her anchor. Jack Tar interloper draught grapple mizzenmast hulk knave cable transom hogshead. Gaff pillage to go on account grog aft chase guns piracy yardarm knave clap of thunder.</p>', 'posts/post4.jpg', 'yarr-post', 'this be a meta descript', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2019-04-16 00:11:05', '2019-04-16 00:11:05');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator', '2019-04-16 00:10:59', '2019-04-16 00:10:59'),
(2, 'user', 'Normal User', '2019-04-16 00:11:00', '2019-04-16 00:11:00'),
(4, 'developer', 'Developer', '2019-04-21 17:22:31', '2019-04-21 17:22:31');

-- --------------------------------------------------------

--
-- Table structure for table `schedules`
--

CREATE TABLE `schedules` (
  `id` int(10) UNSIGNED NOT NULL,
  `days` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `room` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `schedules`
--

INSERT INTO `schedules` (`id`, `days`, `time`, `room`, `created_at`, `updated_at`) VALUES
(1, 'Saturday', '8-11', 'DCS Lab Room', '2019-04-21 19:36:18', '2019-04-21 19:36:18'),
(2, 'Saturday', '11-2', 'DCS Lab Room', '2019-04-21 19:36:38', '2019-04-21 19:36:38'),
(3, 'Saturday', '2:30-5:30', 'DCS Lab Room', '2019-04-21 19:37:04', '2019-04-21 19:37:04');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `details` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `group` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1, 'site.title', 'Site Title', 'Site Title', '', 'text', 1, 'Site'),
(2, 'site.description', 'Site Description', 'Site Description', '', 'text', 2, 'Site'),
(3, 'site.logo', 'Site Logo', '', '', 'image', 3, 'Site'),
(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', '', '', 'text', 4, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', '', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin Title', 'Voyager', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'Welcome to Voyager. The Missing Admin for Laravel', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', '', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', '', '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', '', '', 'text', 1, 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(10) UNSIGNED NOT NULL,
  `idnumber` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `middlename` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `genderid` int(11) DEFAULT NULL,
  `civilstatusid` int(11) DEFAULT NULL,
  `contactnumber` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `password` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `idnumber`, `lastname`, `firstname`, `middlename`, `genderid`, `civilstatusid`, `contactnumber`, `address`, `password`, `created_at`, `updated_at`) VALUES
(1, '18-111413', 'rabena', 'dake', 'bustin', 1, 1, '1234567890', 'aaa', '$2y$10$J0xezFkZkZn5UpcqsRx1Z.UuaFTrKV8JOg0IW5G5k4Ed3u9ifzneK', '2019-04-21 18:37:24', '2019-04-21 18:37:24');

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `courseid` int(11) DEFAULT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `units` int(11) DEFAULT NULL,
  `lectunits` int(11) DEFAULT NULL,
  `labunits` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`id`, `code`, `courseid`, `name`, `units`, `lectunits`, `labunits`, `created_at`, `updated_at`) VALUES
(1, 'MIT 291', 1, 'Advance Knowledge-Based Management', 3, 3, 0, '2019-04-21 19:40:43', '2019-04-21 19:40:43'),
(2, 'MIT 294', 1, 'E-Learning Systems Development', 3, 3, 0, '2019-04-21 19:40:00', '2019-04-21 19:44:49'),
(3, 'MIT 297', 1, 'Mobile Systems Development', 3, 3, 0, '2019-04-21 19:41:00', '2019-04-21 19:44:42');

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

CREATE TABLE `translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `table_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `translations`
--

INSERT INTO `translations` (`id`, `table_name`, `column_name`, `foreign_key`, `locale`, `value`, `created_at`, `updated_at`) VALUES
(1, 'data_types', 'display_name_singular', 5, 'pt', 'Post', '2019-04-16 00:11:06', '2019-04-16 00:11:06'),
(2, 'data_types', 'display_name_singular', 6, 'pt', 'Página', '2019-04-16 00:11:06', '2019-04-16 00:11:06'),
(3, 'data_types', 'display_name_singular', 1, 'pt', 'Utilizador', '2019-04-16 00:11:06', '2019-04-16 00:11:06'),
(4, 'data_types', 'display_name_singular', 4, 'pt', 'Categoria', '2019-04-16 00:11:06', '2019-04-16 00:11:06'),
(5, 'data_types', 'display_name_singular', 2, 'pt', 'Menu', '2019-04-16 00:11:06', '2019-04-16 00:11:06'),
(6, 'data_types', 'display_name_singular', 3, 'pt', 'Função', '2019-04-16 00:11:06', '2019-04-16 00:11:06'),
(7, 'data_types', 'display_name_plural', 5, 'pt', 'Posts', '2019-04-16 00:11:06', '2019-04-16 00:11:06'),
(8, 'data_types', 'display_name_plural', 6, 'pt', 'Páginas', '2019-04-16 00:11:06', '2019-04-16 00:11:06'),
(9, 'data_types', 'display_name_plural', 1, 'pt', 'Utilizadores', '2019-04-16 00:11:06', '2019-04-16 00:11:06'),
(10, 'data_types', 'display_name_plural', 4, 'pt', 'Categorias', '2019-04-16 00:11:06', '2019-04-16 00:11:06'),
(11, 'data_types', 'display_name_plural', 2, 'pt', 'Menus', '2019-04-16 00:11:07', '2019-04-16 00:11:07'),
(12, 'data_types', 'display_name_plural', 3, 'pt', 'Funções', '2019-04-16 00:11:07', '2019-04-16 00:11:07'),
(13, 'categories', 'slug', 1, 'pt', 'categoria-1', '2019-04-16 00:11:07', '2019-04-16 00:11:07'),
(14, 'categories', 'name', 1, 'pt', 'Categoria 1', '2019-04-16 00:11:07', '2019-04-16 00:11:07'),
(15, 'categories', 'slug', 2, 'pt', 'categoria-2', '2019-04-16 00:11:07', '2019-04-16 00:11:07'),
(16, 'categories', 'name', 2, 'pt', 'Categoria 2', '2019-04-16 00:11:07', '2019-04-16 00:11:07'),
(17, 'pages', 'title', 1, 'pt', 'Olá Mundo', '2019-04-16 00:11:07', '2019-04-16 00:11:07'),
(18, 'pages', 'slug', 1, 'pt', 'ola-mundo', '2019-04-16 00:11:07', '2019-04-16 00:11:07'),
(19, 'pages', 'body', 1, 'pt', '<p>Olá Mundo. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', '2019-04-16 00:11:07', '2019-04-16 00:11:07'),
(20, 'menu_items', 'title', 1, 'pt', 'Painel de Controle', '2019-04-16 00:11:07', '2019-04-16 00:11:07'),
(21, 'menu_items', 'title', 2, 'pt', 'Media', '2019-04-16 00:11:07', '2019-04-16 00:11:07'),
(22, 'menu_items', 'title', 12, 'pt', 'Publicações', '2019-04-16 00:11:07', '2019-04-16 00:11:07'),
(23, 'menu_items', 'title', 3, 'pt', 'Utilizadores', '2019-04-16 00:11:07', '2019-04-16 00:11:07'),
(24, 'menu_items', 'title', 11, 'pt', 'Categorias', '2019-04-16 00:11:07', '2019-04-16 00:11:07'),
(25, 'menu_items', 'title', 13, 'pt', 'Páginas', '2019-04-16 00:11:07', '2019-04-16 00:11:07'),
(26, 'menu_items', 'title', 4, 'pt', 'Funções', '2019-04-16 00:11:07', '2019-04-16 00:11:07'),
(27, 'menu_items', 'title', 5, 'pt', 'Ferramentas', '2019-04-16 00:11:07', '2019-04-16 00:11:07'),
(28, 'menu_items', 'title', 6, 'pt', 'Menus', '2019-04-16 00:11:07', '2019-04-16 00:11:07'),
(29, 'menu_items', 'title', 7, 'pt', 'Base de dados', '2019-04-16 00:11:07', '2019-04-16 00:11:07'),
(30, 'menu_items', 'title', 10, 'pt', 'Configurações', '2019-04-16 00:11:07', '2019-04-16 00:11:07');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`) VALUES
(1, 1, 'Admin', 'admin@admin.com', 'users/default.png', NULL, '$2y$10$MsJ4sDER2t4sJw4h7V8UtOa/cpeIt4nDtbALVGCZBgeRkqVy5BvAO', 'C6lHUfv0AFMtWe9HRMkVhdOlAn96UTuIrdFQeXubxDFwGQ1ixRRRGP4NlR7e', NULL, '2019-04-16 00:11:04', '2019-04-16 00:11:04'),
(3, 4, 'Dsrabena', 'dsrabena@developer.com', 'users/default.png', NULL, '$2y$10$uY/9XHdBPiBVzm5mslkV0eGZnfvvqOiYbMIPYX24gkIcK2cX.cfd.', NULL, '{\"locale\":\"en\"}', '2019-04-21 17:23:22', '2019-04-21 17:23:22');

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `yearlevels`
--

CREATE TABLE `yearlevels` (
  `id` int(10) UNSIGNED NOT NULL,
  `yearlevel` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `yearlevels`
--

INSERT INTO `yearlevels` (`id`, `yearlevel`, `description`, `created_at`, `updated_at`) VALUES
(1, '1', 'First Year', '2019-04-21 19:28:00', '2019-04-21 19:29:25'),
(2, '2', 'Second Year', '2019-04-21 19:29:00', '2019-04-21 19:29:29'),
(3, '3', 'Third Year', '2019-04-21 19:29:00', '2019-04-21 19:29:34'),
(4, '4', 'Fourth Year', '2019-04-21 19:29:47', '2019-04-21 19:29:47'),
(5, '5', 'Fifth Year', '2019-04-21 19:29:55', '2019-04-21 19:29:55');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `civilstatuses`
--
ALTER TABLE `civilstatuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `data_rows`
--
ALTER TABLE `data_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_rows_data_type_id_foreign` (`data_type_id`);

--
-- Indexes for table `data_types`
--
ALTER TABLE `data_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `data_types_name_unique` (`name`),
  ADD UNIQUE KEY `data_types_slug_unique` (`slug`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `enrollclasses`
--
ALTER TABLE `enrollclasses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `enrollments`
--
ALTER TABLE `enrollments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `genders`
--
ALTER TABLE `genders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `instructors`
--
ALTER TABLE `instructors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_name_unique` (`name`);

--
-- Indexes for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_menu_id_foreign` (`menu_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_slug_unique` (`slug`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `periods`
--
ALTER TABLE `periods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_key_index` (`key`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_permission_id_index` (`permission_id`),
  ADD KEY `permission_role_role_id_index` (`role_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indexes for table `schedules`
--
ALTER TABLE `schedules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `user_roles_user_id_index` (`user_id`),
  ADD KEY `user_roles_role_id_index` (`role_id`);

--
-- Indexes for table `yearlevels`
--
ALTER TABLE `yearlevels`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `civilstatuses`
--
ALTER TABLE `civilstatuses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=189;

--
-- AUTO_INCREMENT for table `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `enrollclasses`
--
ALTER TABLE `enrollclasses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `enrollments`
--
ALTER TABLE `enrollments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `genders`
--
ALTER TABLE `genders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `instructors`
--
ALTER TABLE `instructors`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `periods`
--
ALTER TABLE `periods`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=132;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `schedules`
--
ALTER TABLE `schedules`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `yearlevels`
--
ALTER TABLE `yearlevels`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Constraints for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
