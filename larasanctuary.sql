-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 27, 2019 at 01:31 AM
-- Server version: 5.7.25-0ubuntu0.18.04.2
-- PHP Version: 7.2.17-0ubuntu0.18.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `larasanctuary`
--

-- --------------------------------------------------------

--
-- Table structure for table `adoptions`
--

CREATE TABLE `adoptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `userid` bigint(20) UNSIGNED NOT NULL,
  `animalid` bigint(20) UNSIGNED NOT NULL,
  `status` enum('approved','denied','pending') COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `adoptions`
--

INSERT INTO `adoptions` (`id`, `created_at`, `updated_at`, `userid`, `animalid`, `status`) VALUES
(1, '2019-04-26 18:15:19', '2019-04-26 18:16:30', 3, 12, 'approved'),
(2, '2019-04-26 18:16:39', '2019-04-26 18:17:01', 5, 12, 'denied'),
(3, '2019-04-26 18:19:55', '2019-04-26 18:20:21', 3, 11, 'approved'),
(4, '2019-04-26 18:21:33', '2019-04-26 18:22:30', 3, 13, 'denied'),
(5, '2019-04-26 18:26:25', '2019-04-26 18:29:22', 2, 13, 'denied'),
(6, '2019-04-26 18:46:32', '2019-04-26 18:50:03', 2, 12, 'approved'),
(7, '2019-04-26 19:08:47', '2019-04-26 19:40:04', 1, 13, 'approved'),
(8, '2019-04-26 19:34:17', '2019-04-26 19:40:02', 5, 3, 'approved'),
(9, '2019-04-26 19:34:50', '2019-04-26 19:39:59', 3, 3, 'denied'),
(10, '2019-04-26 19:49:13', '2019-04-26 20:05:59', 3, 8, 'denied'),
(11, '2019-04-26 20:32:41', '2019-04-26 21:11:38', 4, 14, 'denied'),
(12, '2019-04-26 20:32:57', '2019-04-26 21:11:36', 3, 14, 'denied'),
(13, '2019-04-26 21:20:25', '2019-04-26 21:22:07', 1, 14, 'approved');

-- --------------------------------------------------------

--
-- Table structure for table `animals`
--

CREATE TABLE `animals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `userid` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birth_year` year(4) NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `image` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type_of_pet` enum('cat','dog','bird','rabbit','horse','ferret','fish','rat/mice','amphibian','reptile') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'dog',
  `is_available` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `animals`
--

INSERT INTO `animals` (`id`, `userid`, `name`, `birth_year`, `description`, `image`, `type_of_pet`, `is_available`, `created_at`, `updated_at`) VALUES
(3, 5, 'Princess', 1972, 'Quo laborum et similique non.', NULL, 'horse', 0, NULL, '2019-04-26 19:40:02'),
(4, 3, 'Chyna', 1978, 'Nemo voluptates fuga et aperiam recusandae incidunt.', NULL, 'ferret', 0, NULL, NULL),
(5, 2, 'Caleigh', 2005, 'Id dolorum accusamus numquam.', NULL, 'cat', 0, NULL, NULL),
(6, 1, 'Liliana', 2002, 'Omnis quod asperiores corporis provident iure veritatis.', NULL, 'reptile', 0, NULL, NULL),
(7, 3, 'Antonio', 2001, 'Quo non cupiditate laudantium omnis expedita.', NULL, 'horse', 0, NULL, NULL),
(8, 1, 'Loyce', 1988, 'Quos aliquid dolore illo ratione pariatur nemo reprehenderit.', NULL, 'amphibian', 0, NULL, NULL),
(9, 4, 'Viva', 2005, 'Fugit dolorem dicta omnis sapiente recusandae corporis qui.', NULL, 'dog', 0, NULL, NULL),
(10, 3, 'Madilyn', 2014, 'Amet ipsa minima magnam vel.', NULL, 'rat/mice', 0, NULL, NULL),
(11, 3, 'Mobeen', 2018, 'A funny rascal!', 'noImage.jpg', 'dog', 0, '2019-04-25 22:03:20', '2019-04-26 18:20:21'),
(12, 2, 'Adelina', 2011, 'A beautiful lovable beast!', 'noImage.jpg', 'reptile', 0, '2019-04-25 22:12:55', '2019-04-26 18:50:03'),
(13, 1, 'Aliman', 2015, 'A cat that listens to DnB', 'noImage.jpg', 'cat', 0, '2019-04-26 13:51:27', '2019-04-26 19:40:04'),
(14, 1, 'Daniel', 2001, 'Really well behave, likes to have a laugh and joke!', 'daniel_1556314252.jpeg', 'dog', 0, '2019-04-26 20:30:52', '2019-04-26 21:22:07'),
(15, 5, 'Ricardo', 1970, 'Architecto debitis sequi consectetur repudiandae et nostrum.', NULL, 'horse', 1, NULL, NULL),
(16, 5, 'Tyler', 1983, 'Commodi cumque natus ut quia in sunt quibusdam.', NULL, 'rat/mice', 1, NULL, NULL),
(17, 5, 'Yasmin', 1995, 'Et deleniti autem sint dolorem ipsam id.', NULL, 'ferret', 1, NULL, NULL),
(18, 5, 'Levi', 2017, 'Rerum debitis occaecati totam debitis accusantium est dolor.', NULL, 'bird', 1, NULL, NULL),
(19, 5, 'Morgan', 2016, 'Cupiditate doloremque laudantium provident tenetur.', NULL, 'amphibian', 1, NULL, NULL),
(20, 5, 'Mable', 1977, 'Vitae ut illo modi.', NULL, 'dog', 1, NULL, NULL),
(21, 5, 'Hailie', 2008, 'In ut quia fugit dolorem cupiditate dicta illo.', NULL, 'rabbit', 1, NULL, NULL),
(22, 5, 'Sonny', 1972, 'Itaque et autem reprehenderit alias est.', NULL, 'horse', 1, NULL, NULL),
(23, 5, 'Lauretta', 1988, 'Repellat vel eos magni.', NULL, 'reptile', 1, NULL, NULL),
(24, 5, 'Mauricio', 2002, 'Similique est id praesentium in.', NULL, 'rat/mice', 1, NULL, NULL),
(25, 5, 'Clyde', 1986, 'Voluptas aut nobis vel exercitationem officia et delectus sed.', NULL, 'reptile', 1, '2019-04-26 21:50:46', NULL),
(26, 5, 'Cindy', 1978, 'Nisi quis laborum voluptatem esse accusamus aut quisquam.', NULL, 'rabbit', 1, '2019-04-26 21:50:46', NULL),
(27, 5, 'Daniella', 1984, 'Eos laudantium consequatur itaque sit.', NULL, 'horse', 1, '2019-04-26 21:50:46', NULL),
(28, 5, 'Maud', 2013, 'Alias qui saepe doloremque earum aliquam molestias.', NULL, 'fish', 1, '2019-04-26 21:50:46', NULL),
(29, 5, 'Alex', 2008, 'Dolorum facilis adipisci natus ipsam ad.', NULL, 'bird', 1, '2019-04-26 21:50:46', NULL),
(30, 5, 'Zella', 1999, 'Molestiae illo qui eos quia repellendus.', NULL, 'bird', 1, '2019-04-26 21:50:46', NULL),
(31, 5, 'Mya', 1991, 'Aliquid numquam illum voluptate accusamus accusantium.', NULL, 'amphibian', 1, '2019-04-26 21:50:46', NULL),
(32, 5, 'Clifton', 1995, 'Non temporibus recusandae adipisci dignissimos dolores necessitatibus aspernatur non.', NULL, 'horse', 1, '2019-04-26 21:50:46', NULL),
(33, 5, 'Mireya', 1997, 'Rem quos delectus nostrum quia.', NULL, 'rat/mice', 1, '2019-04-26 21:50:46', NULL),
(34, 5, 'Olga', 2003, 'Vel pariatur optio blanditiis id tenetur.', NULL, 'ferret', 1, '2019-04-26 21:50:46', NULL),
(35, 5, 'Gregorio', 2007, 'Asperiores consequatur ut ut expedita.', NULL, 'horse', 1, '2019-04-26 21:50:46', NULL),
(36, 5, 'Jane', 2005, 'Debitis minus consectetur maxime aut.', NULL, 'dog', 1, '2019-04-26 21:50:46', NULL),
(37, 5, 'Hailey', 2017, 'Voluptatem quasi id odio assumenda.', NULL, 'fish', 1, '2019-04-26 21:50:46', NULL),
(38, 5, 'Mariane', 1999, 'Nihil eos eum non eius.', NULL, 'ferret', 1, '2019-04-26 21:50:46', NULL),
(39, 5, 'Guy', 1993, 'Provident at fugiat nam dolor accusamus asperiores provident.', NULL, 'amphibian', 1, '2019-04-26 21:50:46', NULL),
(40, 5, 'Trenton', 1989, 'Nesciunt nulla veniam aut sequi autem doloremque.', NULL, 'ferret', 1, '2019-04-26 21:50:46', NULL),
(41, 5, 'Manley', 1973, 'Molestiae rem aperiam aut mollitia est impedit.', NULL, 'dog', 1, '2019-04-26 21:50:46', NULL),
(42, 5, 'Jo', 2005, 'Praesentium et animi totam corrupti.', NULL, 'amphibian', 1, '2019-04-26 21:50:46', NULL),
(43, 5, 'Lisa', 2015, 'Totam quia voluptatem sunt consequatur asperiores aut.', NULL, 'rat/mice', 1, '2019-04-26 21:50:46', NULL),
(44, 5, 'Tracy', 1977, 'Rerum nihil eligendi voluptas commodi a odit.', NULL, 'bird', 1, '2019-04-26 21:50:46', NULL),
(45, 5, 'Nelson', 1999, 'Molestias quo minus architecto veniam aperiam placeat quod.', NULL, 'rat/mice', 1, '2019-04-26 21:50:46', NULL),
(46, 5, 'Lori', 1983, 'Corrupti qui animi aut quis eum.', NULL, 'horse', 1, '2019-04-26 21:50:46', NULL),
(47, 5, 'Dillan', 2002, 'Dolores nemo nemo et eum.', NULL, 'bird', 1, '2019-04-26 21:50:46', NULL),
(48, 5, 'Gussie', 2018, 'Tempore perferendis modi expedita nobis.', NULL, 'rabbit', 1, '2019-04-26 21:50:46', NULL),
(49, 5, 'Rebekah', 2003, 'Nobis quis aut eum velit voluptas.', NULL, 'ferret', 1, '2019-04-26 21:50:46', NULL),
(50, 5, 'Clarabelle', 1993, 'Non doloremque enim ea autem odio odit.', NULL, 'bird', 1, '2019-04-26 21:50:46', NULL),
(51, 5, 'Celine', 2016, 'Consequatur dolores quaerat rerum repellat iste officia aliquid.', NULL, 'reptile', 1, '2019-04-26 21:50:46', NULL),
(52, 5, 'Courtney', 2016, 'Dolor repellendus optio qui.', NULL, 'ferret', 1, '2019-04-26 21:50:46', NULL),
(53, 5, 'Laurianne', 2013, 'Est eveniet voluptatibus est saepe in harum.', NULL, 'amphibian', 1, '2019-04-26 21:50:46', NULL),
(54, 5, 'Gavin', 1970, 'Debitis doloribus dolor reiciendis et non et.', NULL, 'rabbit', 1, '2019-04-26 21:50:46', NULL),
(55, 5, 'Doris', 1986, 'Assumenda ad et ducimus rerum.', NULL, 'ferret', 1, '2019-04-26 21:50:46', NULL),
(56, 5, 'Nick', 1972, 'Officia consequatur sint magni dolore perspiciatis esse.', NULL, 'bird', 1, '2019-04-26 21:50:46', NULL),
(57, 5, 'Brenna', 1993, 'Assumenda molestiae libero ea quasi ab vel et.', NULL, 'amphibian', 1, '2019-04-26 21:50:46', NULL),
(58, 5, 'Mike', 1989, 'Eligendi nemo autem vero nam soluta aperiam neque.', NULL, 'cat', 1, '2019-04-26 21:50:46', NULL),
(59, 5, 'Leora', 1979, 'At et sit quae soluta optio.', NULL, 'bird', 1, '2019-04-26 21:50:46', NULL),
(60, 5, 'Magnolia', 1990, 'Atque suscipit perferendis et animi qui corporis.', NULL, 'fish', 1, '2019-04-26 21:50:46', NULL),
(61, 5, 'Marilyne', 2015, 'Vitae qui deserunt qui et.', NULL, 'cat', 1, '2019-04-26 21:50:46', NULL),
(62, 5, 'Jade', 2016, 'Ad adipisci cum veniam non et harum.', NULL, 'horse', 1, '2019-04-26 21:50:46', NULL),
(63, 5, 'Sydnie', 2001, 'Esse rerum ab ut.', NULL, 'cat', 1, '2019-04-26 21:50:46', NULL),
(64, 5, 'Raoul', 1977, 'Consequatur minima omnis distinctio sint.', NULL, 'rabbit', 1, '2019-04-26 21:50:46', NULL),
(65, 5, 'Dana', 1994, 'Aut eius eum ad non optio perferendis qui.', NULL, 'amphibian', 1, '2019-04-26 21:50:46', NULL),
(66, 5, 'Chadrick', 2002, 'Sit fugiat sed recusandae ut nulla qui consectetur.', NULL, 'rabbit', 1, '2019-04-26 21:50:46', NULL),
(67, 5, 'Quinn', 2002, 'Nam modi repudiandae veritatis tempore ut libero occaecati.', NULL, 'cat', 1, '2019-04-26 21:50:46', NULL),
(68, 5, 'Dustin', 1997, 'Qui qui animi hic tenetur.', NULL, 'ferret', 1, '2019-04-26 21:50:46', NULL),
(69, 5, 'Sydni', 2013, 'Qui eligendi molestiae dolores illum laborum et.', NULL, 'reptile', 1, '2019-04-26 21:50:46', NULL),
(70, 5, 'Evangeline', 1995, 'Enim sit itaque ut magnam nihil est praesentium.', NULL, 'horse', 1, '2019-04-26 21:50:46', NULL),
(71, 5, 'Alek', 2016, 'Sit facilis voluptatibus consequuntur consequuntur iure nulla debitis.', NULL, 'dog', 1, '2019-04-26 21:50:46', NULL),
(72, 5, 'Edison', 2013, 'Et rerum quia aut eligendi.', NULL, 'horse', 1, '2019-04-26 21:50:46', NULL),
(73, 5, 'Delphine', 2018, 'Et porro nobis illum et.', NULL, 'cat', 1, '2019-04-26 21:50:46', NULL),
(74, 5, 'Clyde', 1988, 'Sit earum perferendis quia.', NULL, 'cat', 1, '2019-04-26 21:50:46', NULL),
(75, 5, 'Rosamond', 1995, 'Consectetur nesciunt ut illo provident blanditiis quod quos.', NULL, 'rabbit', 1, '2019-04-26 21:50:46', NULL),
(76, 5, 'Cecil', 1977, 'Sequi aut commodi consequuntur non.', NULL, 'horse', 1, '2019-04-26 21:50:46', NULL),
(77, 5, 'Carol', 1993, 'Voluptates ea eos vero.', NULL, 'ferret', 1, '2019-04-26 21:50:46', NULL),
(78, 5, 'Angelo', 2014, 'Quae asperiores quisquam error laborum corporis.', NULL, 'reptile', 1, '2019-04-26 21:50:46', NULL),
(79, 5, 'Glenda', 1985, 'Est fuga cum iste.', NULL, 'dog', 1, '2019-04-26 21:50:46', NULL),
(80, 5, 'Rahsaan', 1987, 'Ducimus sequi illum nihil et atque unde.', NULL, 'cat', 1, '2019-04-26 21:50:46', NULL),
(81, 5, 'Kennith', 2000, 'Aspernatur nobis explicabo dignissimos rerum nostrum.', NULL, 'horse', 1, '2019-04-26 21:50:46', NULL),
(82, 5, 'Carley', 1976, 'Deserunt in eligendi est qui nihil ut.', NULL, 'bird', 1, '2019-04-26 21:50:46', NULL),
(83, 5, 'Tatyana', 2000, 'Eum adipisci quo corrupti aspernatur amet dolores.', NULL, 'rat/mice', 1, '2019-04-26 21:50:46', NULL),
(84, 5, 'Bessie', 1979, 'Inventore unde inventore eos qui modi nihil recusandae.', NULL, 'fish', 1, '2019-04-26 21:50:46', NULL),
(85, 5, 'Kirk', 2002, 'Aut hic aut fuga rerum ea eos doloremque ad.', NULL, 'fish', 1, '2019-04-26 21:50:46', NULL),
(86, 5, 'Crystal', 1978, 'Nesciunt et culpa placeat nobis harum sed voluptatem.', NULL, 'cat', 1, '2019-04-26 21:50:46', NULL),
(87, 5, 'Colt', 2019, 'Cum et sed quia hic.', NULL, 'reptile', 1, '2019-04-26 21:50:46', NULL),
(88, 5, 'Alyce', 1976, 'Minus odit unde in nemo laborum.', NULL, 'dog', 1, '2019-04-26 21:50:46', NULL),
(89, 5, 'Barrett', 2017, 'Autem earum ut quibusdam.', NULL, 'cat', 1, '2019-04-26 21:50:46', NULL),
(90, 5, 'Francesco', 1981, 'Quisquam voluptatem eaque pariatur non natus.', NULL, 'rat/mice', 1, '2019-04-26 21:50:46', NULL),
(91, 5, 'Eusebio', 1974, 'Esse quibusdam non consequatur nemo voluptatem cumque molestiae.', NULL, 'ferret', 1, '2019-04-26 21:50:46', NULL),
(92, 5, 'Chelsey', 1988, 'Quasi odit quia quis qui.', NULL, 'rabbit', 1, '2019-04-26 21:50:46', NULL),
(93, 5, 'Bert', 2000, 'Aut ea ipsam velit enim.', NULL, 'rat/mice', 1, '2019-04-26 21:50:46', NULL),
(94, 5, 'Madalyn', 1998, 'Accusamus vel quia eaque minus dicta sint.', NULL, 'rabbit', 1, '2019-04-26 21:50:46', NULL),
(95, 5, 'Ambrose', 1979, 'Sit delectus odit dolores voluptas.', NULL, 'dog', 1, '2019-04-26 21:50:46', NULL),
(96, 5, 'Maurice', 1987, 'Nobis ducimus exercitationem voluptatum.', NULL, 'horse', 1, '2019-04-26 21:50:46', NULL),
(97, 5, 'Naomi', 1992, 'Deleniti vitae nisi nesciunt quia laudantium qui.', NULL, 'ferret', 1, '2019-04-26 21:50:46', NULL),
(98, 5, 'Katharina', 2008, 'Voluptas voluptatum enim reiciendis animi voluptate.', NULL, 'ferret', 1, '2019-04-26 21:50:46', NULL),
(99, 5, 'Rachelle', 1991, 'Reiciendis optio quia rem sint culpa facere enim.', NULL, 'amphibian', 1, '2019-04-26 21:50:46', NULL),
(100, 5, 'Kassandra', 1974, 'Aut ut est molestiae esse voluptas voluptatibus.', NULL, 'cat', 1, '2019-04-26 21:50:46', NULL),
(101, 5, 'Gunnar', 1999, 'Quia culpa provident dolor omnis.', NULL, 'reptile', 1, '2019-04-26 21:50:46', NULL),
(102, 5, 'Christelle', 2007, 'Corporis error enim repellat.', NULL, 'amphibian', 1, '2019-04-26 21:50:46', NULL),
(103, 5, 'Soledad', 1970, 'Et repellendus expedita incidunt aut odio nihil quod.', NULL, 'rabbit', 1, '2019-04-26 21:50:46', NULL),
(104, 5, 'Davin', 1988, 'Quia occaecati exercitationem ut dolor laboriosam.', NULL, 'rabbit', 1, '2019-04-26 21:50:46', NULL),
(105, 5, 'Tabitha', 1984, 'Perferendis libero saepe enim quam possimus aliquid nihil laboriosam.', NULL, 'bird', 1, '2019-04-26 21:50:46', NULL),
(106, 5, 'Anjali', 2010, 'Voluptates beatae dolorem beatae excepturi assumenda laborum et.', NULL, 'rabbit', 1, '2019-04-26 21:50:46', NULL),
(107, 5, 'Mercedes', 1989, 'Sit mollitia culpa totam sed vitae commodi et.', NULL, 'rabbit', 1, '2019-04-26 21:50:46', NULL),
(108, 5, 'Michale', 2000, 'Libero occaecati laboriosam dolor facere.', NULL, 'amphibian', 1, '2019-04-26 21:50:46', NULL),
(109, 5, 'Deborah', 2004, 'Corporis excepturi qui repellendus voluptatem perferendis repellat rerum.', NULL, 'fish', 1, '2019-04-26 21:50:46', NULL),
(110, 5, 'Sarina', 2015, 'Accusantium dolores omnis debitis non accusantium saepe corrupti.', NULL, 'rabbit', 1, '2019-04-26 21:50:46', NULL),
(111, 5, 'Darren', 2002, 'Provident dolores non et quia.', NULL, 'rabbit', 1, '2019-04-26 21:50:46', NULL),
(112, 5, 'Shirley', 2008, 'Perspiciatis voluptatem perferendis ut.', NULL, 'rat/mice', 1, '2019-04-26 21:50:46', NULL),
(113, 5, 'Narciso', 2016, 'Aut et sequi explicabo et dolorum.', NULL, 'bird', 1, '2019-04-26 21:50:46', NULL),
(114, 5, 'Kathryn', 1981, 'Voluptates qui dolores commodi cupiditate consequatur.', NULL, 'fish', 1, '2019-04-26 21:50:46', NULL),
(115, 5, 'Gerald', 2003, 'Accusamus sint dolores sit culpa voluptatem quia.', NULL, 'dog', 1, '2019-04-26 21:50:46', NULL),
(116, 5, 'Dwight', 1993, 'Magnam perferendis possimus quis nam labore recusandae.', NULL, 'rabbit', 1, '2019-04-26 21:50:46', NULL),
(117, 5, 'Maggie', 2004, 'Qui quaerat voluptatibus iusto consequuntur explicabo.', NULL, 'rat/mice', 1, '2019-04-26 21:50:46', NULL),
(118, 5, 'Thad', 1987, 'Rerum veritatis mollitia voluptas officiis repudiandae architecto.', NULL, 'amphibian', 1, '2019-04-26 21:50:46', NULL),
(119, 5, 'Julio', 1998, 'Qui qui aut maiores saepe repellendus at voluptatem.', NULL, 'reptile', 1, '2019-04-26 21:50:46', NULL),
(120, 5, 'Hermann', 1979, 'Nobis rem dolorem aut ducimus.', NULL, 'ferret', 1, '2019-04-26 21:50:46', NULL),
(121, 5, 'Julie', 1998, 'Fugiat sunt et quam facilis ducimus pariatur at molestiae.', NULL, 'cat', 1, '2019-04-26 21:50:46', NULL),
(122, 5, 'Alvis', 1993, 'Recusandae sit magni voluptas autem consectetur.', NULL, 'amphibian', 1, '2019-04-26 21:50:46', NULL),
(123, 5, 'Hermina', 2018, 'Soluta id aut voluptates ipsam nihil vel.', NULL, 'fish', 1, '2019-04-26 21:50:46', NULL),
(124, 5, 'Hassie', 2002, 'Aut sed debitis optio soluta dicta eaque aut itaque.', NULL, 'bird', 1, '2019-04-26 21:50:46', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(21, '2014_10_12_000000_create_users_table', 1),
(22, '2014_10_12_100000_create_password_resets_table', 1),
(23, '2019_03_30_005041_create_animals_table', 1),
(24, '2019_04_05_152904_create_adoptions_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` tinyint(1) NOT NULL DEFAULT '0',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `role`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Khadija', 'khadija@gmail.com', 0, NULL, '$2y$10$bg9/j21bCVx.BcGubJKNNeyUtP4kL7n/knT.GOUyixt9nJMgZNH4a', NULL, '2019-04-10 14:07:02', '2019-04-10 14:07:02'),
(2, 'Nimra', 'nimra@gmail.com', 0, NULL, '$2y$10$vDjmLpNPbjZAbx8f7G6XtedwbhZpm07znDFanAn9GJm7b3GcfjYci', NULL, '2019-04-10 14:07:17', '2019-04-10 14:07:17'),
(3, 'Habiba', 'habiba@gmail.com', 0, NULL, '$2y$10$oLLQlQ6sDpYCe3tF916ZaOFHEx7m2dw3fRvKWpDmb4dxxmlsHHnGq', NULL, '2019-04-10 14:07:36', '2019-04-10 14:07:36'),
(4, 'Sarah', 'sarah@gmai.com', 0, NULL, '$2y$10$dA1SNBumHp5LFW4MVxEGCegzo0qQvX51ZQUNdX2TQ5hKJv3tw1sli', NULL, '2019-04-10 14:07:51', '2019-04-10 14:07:51'),
(5, 'admin', 'admin@aas.com', 1, NULL, '$2y$10$64dMeo2m60GE1UQWcVvn2eD9efP.AbfMqBpPjHf1M7WpgJ0Nhe1OK', NULL, '2019-04-10 14:08:52', '2019-04-10 14:08:52');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adoptions`
--
ALTER TABLE `adoptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `adoptions_userid_foreign` (`userid`),
  ADD KEY `adoptions_animalid_foreign` (`animalid`);

--
-- Indexes for table `animals`
--
ALTER TABLE `animals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `animals_userid_foreign` (`userid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adoptions`
--
ALTER TABLE `adoptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `animals`
--
ALTER TABLE `animals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=125;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `adoptions`
--
ALTER TABLE `adoptions`
  ADD CONSTRAINT `adoptions_animalid_foreign` FOREIGN KEY (`animalid`) REFERENCES `animals` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `adoptions_userid_foreign` FOREIGN KEY (`userid`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `animals`
--
ALTER TABLE `animals`
  ADD CONSTRAINT `animals_userid_foreign` FOREIGN KEY (`userid`) REFERENCES `users` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
