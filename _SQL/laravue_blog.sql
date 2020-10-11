-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 11, 2020 at 05:37 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravue_blog`
--

-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

CREATE TABLE `articles` (
  `article_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `topic_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'article_default.png',
  `article_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `articles`
--

INSERT INTO `articles` (`article_id`, `title`, `user_id`, `topic_id`, `content`, `photo`, `article_status`, `created_at`, `updated_at`) VALUES
(1, 'Proin interdum dolor tortor, et.', 1, '1', '<p><em class=\"ql-font-serif\" style=\"color: rgb(0, 0, 0);\">Quisque facilisis, ligula sollicitudin mollis venenatis, turpis leo gravida quam, eu tincidunt dolor est id erat. Nulla semper varius quam, quis eleifend augue pulvinar eu. Duis vitae lorem eget ipsum consequat iaculis. Curabitur congue nibh vel justo placerat, at vulputate purus dapibus. Aliquam non porttitor nisi. Sed mi felis, varius id dui eget, tempus tincidunt quam. Fusce ullamcorper enim fermentum felis vulputate, sit amet semper lectus aliquam. Aenean vitae nibh sapien. Curabitur a nisi pulvinar, interdum lacus eget, dictum eros. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Donec in urna eget ante pharetra sagittis posuere in dolor. Etiam magna nisl, accumsan quis pretium eget, tincidunt congue turpis.</em></p><p><br></p><ul><li><strong>Maecenas congue arcu sit amet metus congue, vel lacinia arcu fermentum.</strong></li><li><strong>Sed sed ligula viverra, dapibus sem id, bibendum nunc.</strong></li><li><strong>Ut laoreet nunc a est viverra, eu pellentesque mi faucibus.</strong></li><li><strong>Cras accumsan justo a tortor porttitor finibus.</strong></li></ul><p><br></p><ol><li class=\"ql-align-justify\">Aliquam erat volutpat. Pellentesque sit amet accumsan turpis. In eget metus et lectus eleifend bibendum at dapibus lorem. Proin iaculis posuere purus, in congue ante condimentum vitae. Praesent in diam faucibus, vehicula nunc sed, viverra massa. Nullam congue nulla non metus aliquam, sed ullamcorper nunc malesuada. Curabitur consectetur felis velit, et cursus tellus feugiat at. Curabitur consectetur sem velit, eu semper ante pretium a. Pellentesque dolor libero, imperdiet nec commodo quis, ullamcorper sed ligula. Nulla placerat est orci. Vivamus orci nisi, posuere id laoreet vitae, fringilla vitae mi. Mauris at lacus sed orci sagittis dignissim. Aliquam feugiat orci ac risus vestibulum volutpat. Curabitur ex est, varius eget dui a, interdum maximus ante. Nunc eget molestie nunc.</li><li class=\"ql-align-justify\">Nam mollis dui arcu, id pretium lacus sagittis at. Praesent elementum urna lacus, ut suscipit arcu accumsan non. Suspendisse posuere, magna quis egestas placerat, mauris mauris facilisis quam, ut varius nibh metus id urna. Etiam ut nulla aliquam, consequat mi non, congue erat. Vestibulum tortor enim, iaculis at orci in, auctor auctor leo. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Aenean vitae venenatis velit. Nulla vitae porttitor velit, vitae ullamcorper nisi. Sed varius, felis et pretium feugiat, risus lorem dignissim purus, id mattis nibh magna consequat est. Cras a tempor odio. Nulla nec euismod augue. Curabitur varius leo commodo quam pellentesque mattis. Aliquam erat volutpat. Mauris porta cursus eros, nec laoreet lorem iaculis a.</li><li class=\"ql-align-justify\">Sed dolor sapien, posuere nec nisl a, molestie egestas dolor. Integer quis velit erat. Mauris nulla libero, mattis non ullamcorper vel, lacinia vel odio. Donec vitae eros efficitur, tempor mi id, feugiat tellus. Etiam turpis turpis, accumsan non dui id, ornare consequat nisi. Aliquam id vehicula libero. Integer condimentum at justo in ullamcorper.</li></ol>', '1601906571.jpeg', 'published', '2020-10-05 06:02:52', '2020-10-05 06:02:52'),
(2, 'Maecenas ac blandit.', 1, '1', '<ul><li class=\"ql-align-justify\">Ut tortor ligula, tempor ut rhoncus non, rhoncus sit amet elit. Vestibulum aliquam convallis purus non commodo. Nunc sit amet diam ut metus porttitor interdum. Phasellus vel tortor a augue pulvinar elementum quis eu libero. Cras dapibus, sapien at pretium eleifend, risus justo consequat diam, id consectetur nisi magna ac tortor. Nam posuere nisl a suscipit dignissim. Maecenas quis leo nulla. Quisque id sapien ex. Vivamus sit amet pharetra sem.</li><li class=\"ql-align-justify\">Donec id rutrum nibh, quis imperdiet risus. Nam elementum suscipit nibh nec tempus. Morbi tempus velit in tempor efficitur. Curabitur in porta ligula, in rhoncus nisi. Ut sit amet tellus porttitor, ultrices dui facilisis, bibendum ligula. Sed eu turpis sagittis, porttitor urna in, tincidunt lorem. Morbi ullamcorper vehicula lorem, nec faucibus nisi porttitor tristique. Vestibulum ut malesuada lectus. Nulla vulputate odio id ex sagittis lobortis. In quis placerat arcu. Praesent feugiat mi ac interdum condimentum. Aenean aliquam lorem id risus tincidunt, ut laoreet sapien molestie. Nam et blandit nisl, non blandit nulla. Vestibulum ultrices lorem suscipit risus iaculis, et tincidunt mauris interdum.</li><li class=\"ql-align-justify\">Proin egestas porttitor lacus at tempor. Cras non ante vitae ipsum eleifend ultricies. Etiam eu purus neque. Quisque nec dictum mauris, aliquam tristique orci. Ut pulvinar dui sit amet ultricies venenatis. Sed a interdum tellus. Quisque eu quam felis. Donec porta tellus nec odio tincidunt hendrerit. Sed pretium purus at eros eleifend consectetur. Maecenas consectetur ipsum a lectus dapibus efficitur. Morbi a tincidunt mauris. Phasellus ultrices at nibh eget dignissim. Aliquam sit amet consequat erat.</li><li class=\"ql-align-justify\">Quisque porta ultricies tortor. Phasellus id odio finibus, fermentum elit eu, hendrerit orci. Vivamus sit amet varius lorem. Etiam sed augue sodales, posuere risus eget, aliquet velit. Pellentesque vel interdum nulla, ac finibus risus. Vivamus nec tincidunt libero. Nam arcu magna, dictum viverra mi in, congue fermentum odio. Cras imperdiet ullamcorper enim sed gravida. Nullam lorem libero, sagittis nec augue sit amet, tempor vehicula nisi. Aenean sit amet urna tristique, dignissim lacus eu, dapibus enim.</li><li class=\"ql-align-justify\">Ut id venenatis neque. Ut vitae nibh mattis, laoreet nisl et, semper tellus. Sed vitae nunc turpis. Donec ut justo id urna tempor fermentum id id ligula. Quisque vehicula viverra ante vitae viverra. Suspendisse scelerisque auctor est ac tincidunt. Proin id eleifend nulla, non molestie mi. Nulla sed semper libero, ullamcorper ullamcorper neque.</li></ul><p><br></p>', '1601906712.jpeg', 'published', '2020-10-05 06:05:13', '2020-10-05 06:05:13'),
(3, 'Aliquam erat volutpat. In eget.', 3, '2', '<p class=\"ql-align-justify\"><em>Sed pellentesque risus sit amet nulla suscipit aliquet. Aliquam ex erat, placerat eu dignissim ut, porta bibendum nibh. Quisque neque enim, porttitor vitae euismod vel, maximus eu lorem. Suspendisse enim neque, sagittis a felis vel, elementum luctus nibh. In fringilla lectus quis commodo blandit. Maecenas eu orci urna. Nulla eget mi pharetra, auctor felis imperdiet, tempus neque. Nullam lacinia nibh ac ante volutpat, vitae pulvinar massa vestibulum. Aliquam vitae est libero. Nullam turpis nisi, mattis sit amet malesuada non, euismod a est. Sed interdum id quam a molestie. In aliquet volutpat felis, sit amet dignissim tortor accumsan ac.</em></p><p class=\"ql-align-justify\"><br></p><p class=\"ql-align-justify\"><em>Interdum et malesuada fames ac ante ipsum primis in faucibus. Etiam pulvinar sapien id ipsum sollicitudin, ac rutrum quam porttitor. Vestibulum porta suscipit accumsan. Praesent nec vestibulum arcu, sed posuere massa. Phasellus ultricies augue et venenatis rutrum. Suspendisse iaculis, tellus sed elementum blandit, arcu sem lobortis orci, ut porttitor mauris nulla quis ipsum. Maecenas ut risus vulputate magna hendrerit mollis a vitae mi.</em></p><p class=\"ql-align-justify\"><br></p><p class=\"ql-align-justify\"><em>Donec sed sagittis odio, et cursus diam. Suspendisse varius posuere nulla, eget ullamcorper neque tincidunt nec. Aliquam at nulla ullamcorper, sagittis ipsum nec, ornare eros. Nullam vitae eros sit amet urna tempor fringilla. Fusce scelerisque magna eu enim scelerisque, ut iaculis felis vehicula. Phasellus nec lacus ligula. Etiam luctus pellentesque dui, at pretium est hendrerit eu.</em></p><p><br></p>', '1601906848.png', 'published', '2020-10-05 06:07:28', '2020-10-05 06:07:28'),
(4, 'Aenean bibendum dignissim ipsum, id.', 3, '2', '<p><span style=\"color: rgb(0, 0, 0);\">Suspendisse ac eros a augue feugiat mollis. Aenean non ligula dictum, dignissim leo sed, molestie magna. Quisque dapibus mauris in arcu vulputate eleifend. Etiam vel magna purus. Cras aliquam imperdiet rhoncus. Fusce mauris nisl, pretium nec bibendum imperdiet, vestibulum in libero. Suspendisse a sollicitudin dolor. Donec lacinia sem ac facilisis imperdiet. In hac habitasse platea dictumst. Pellentesque augue est, facilisis at odio quis, pulvinar elementum elit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nunc placerat sapien diam, non pulvinar felis tincidunt ut. Phasellus ac imperdiet purus, at auctor ligula. Praesent et libero dictum, rutrum lacus at, finibus metus.</span></p><p><br></p><ul><li class=\"ql-align-justify\">Pellentesque convallis lorem non dictum fringilla.</li><li class=\"ql-align-justify\">Vestibulum vestibulum erat nec ipsum tincidunt fermentum.</li><li class=\"ql-align-justify\">Aliquam non enim ac velit mattis finibus.</li><li class=\"ql-align-justify\">Sed congue libero eu lacinia rhoncus.</li><li class=\"ql-align-justify\">Donec in nisl tincidunt est maximus volutpat vel sed lacus.</li><li class=\"ql-align-justify\">Etiam consectetur nulla non sapien consequat hendrerit.</li></ul><p class=\"ql-align-justify\"><br></p><ul><li class=\"ql-align-justify\">Nullam ullamcorper purus ut nulla mattis, sed volutpat magna auctor.</li><li class=\"ql-align-justify\">Quisque in felis at felis sodales imperdiet a non lacus.</li><li class=\"ql-align-justify\">Maecenas at dolor consectetur justo tincidunt aliquet vitae nec ligula.</li></ul><p class=\"ql-align-justify\"><br></p><ul><li class=\"ql-align-justify\">Aliquam sagittis neque ut lobortis mattis.</li><li class=\"ql-align-justify\">Nunc et turpis vehicula, viverra lectus id, eleifend nibh.</li></ul><p class=\"ql-align-justify\"><br></p><ul><li class=\"ql-align-justify\">Sed eget orci id purus tempus porttitor ut ut lectus.</li><li class=\"ql-align-justify\">Phasellus quis dolor quis magna semper tempor et nec sapien.</li><li class=\"ql-align-justify\">Suspendisse at neque at ligula porta volutpat.</li></ul><p class=\"ql-align-justify\"><br></p><ul><li class=\"ql-align-justify\">Nunc egestas massa et tincidunt maximus.</li><li class=\"ql-align-justify\">Donec vel ipsum eu erat sagittis pharetra.</li></ul><p><br></p>', '1601907014.jpeg', 'published', '2020-10-05 06:10:14', '2020-10-05 06:10:14'),
(5, 'Curabitur sed nunc scelerisque, vestibulum.', 2, '3', '<p class=\"ql-align-justify\"><strong>Curabitur convallis eget purus quis venenatis. Quisque dignissim felis non consequat faucibus. Praesent placerat aliquet lacinia. Nam feugiat feugiat velit, eget blandit est rutrum eget. Sed commodo faucibus auctor. In ultricies consequat gravida. Nunc sagittis, dolor a aliquet accumsan, nibh mauris lobortis ex, eget fringilla diam sapien vel diam. Fusce dapibus a dolor eget aliquam.</strong></p><p class=\"ql-align-justify\"><br></p><p class=\"ql-align-justify\"><em>Morbi hendrerit a magna non rhoncus. Nulla facilisi. Curabitur malesuada eget purus sed placerat. Quisque rhoncus nibh eu nibh vulputate pulvinar. Etiam mi enim, dignissim eu sapien eu, sagittis aliquet purus. Duis et felis eu tortor tempor sodales. Proin quis risus tristique, varius risus imperdiet, pulvinar purus. Duis placerat porta turpis ut dictum. Nam nisi risus, ultrices nec sem quis, interdum laoreet massa. Aliquam at posuere justo. Sed tincidunt libero vitae erat facilisis, in mattis arcu pulvinar. Nulla quis ipsum et ipsum pulvinar porttitor ut at quam. Nulla sit amet luctus tellus, nec egestas enim. Nam sit amet purus ipsum. Aliquam dapibus magna et elit dapibus, ac hendrerit risus dapibus. Nullam lobortis sit amet mi ornare fringilla.</em></p><p class=\"ql-align-justify\"><br></p><ol><li class=\"ql-align-justify\">Maecenas sit amet placerat felis, vehicula luctus tortor. Nullam suscipit orci eu diam posuere commodo. In justo metus, sollicitudin vitae viverra ac, viverra in libero. Praesent turpis eros, sagittis sit amet tellus non, aliquam posuere lorem. Ut rutrum, erat eu tincidunt efficitur, urna ligula imperdiet sapien, nec faucibus ligula sapien non nisi. Aliquam luctus mauris a tincidunt pretium. Integer placerat libero sed ipsum cursus lobortis.</li><li class=\"ql-align-justify\">Sed non euismod ex. Suspendisse viverra, dolor eget iaculis fermentum, lacus velit suscipit nisl, sed malesuada libero nibh sit amet justo. Sed sodales neque nec diam tristique aliquam. In hac habitasse platea dictumst. Maecenas mattis ipsum at malesuada sodales. Morbi a sem gravida, euismod eros eu, ultrices ligula. Mauris mollis ligula eu diam molestie congue. Mauris non congue lorem. Duis fringilla congue rutrum. Vivamus convallis malesuada nisl, ac viverra nisl. Nullam et maximus sem, in vulputate massa.</li></ol><p class=\"ql-align-justify\"><br></p><p><br></p>', '1601907178.jpeg', 'published', '2020-10-05 06:12:59', '2020-10-05 06:12:59'),
(6, 'Donec risus arcu, fermentum venenatis.', 2, '3', '<p class=\"ql-align-justify\">Integer a laoreet purus, ut mollis est. Maecenas quis hendrerit libero, in consequat magna. Duis pulvinar eleifend magna vitae sollicitudin. Etiam dictum placerat sapien. Vivamus quis quam condimentum, sodales turpis ac, vehicula nisl. Sed maximus et felis nec mattis. Duis congue, felis a feugiat ullamcorper, dui nibh tempus eros, eget facilisis nisi purus in metus. Etiam vulputate iaculis erat, a sollicitudin ipsum aliquet eu. Aenean aliquam eros eu arcu imperdiet, eu sagittis ante ornare. Integer in semper purus, vitae convallis nisl. Maecenas mollis augue id nunc euismod volutpat. Nulla blandit, arcu in gravida condimentum, leo libero pharetra tellus, ut blandit velit velit in purus. Nam blandit sapien urna, eu sodales erat pulvinar ac.</p><p class=\"ql-align-justify\"><br></p><p class=\"ql-align-justify\"><strong>Ut sollicitudin nunc nec turpis egestas, eget tincidunt leo semper. Phasellus nec orci sit amet mauris ornare ullamcorper nec et urna. Vivamus quis fermentum neque, nec vestibulum lectus. Maecenas aliquam odio eros, eget tempor ipsum pulvinar quis. Mauris vel pretium mi. Ut rhoncus sollicitudin nulla eget accumsan. Vivamus diam quam, accumsan vitae nibh vitae, mollis tempor nulla. Aliquam venenatis cursus aliquam. Aliquam suscipit augue a metus faucibus malesuada. Aliquam in tempus nibh. Fusce auctor mi elit, ac condimentum justo sodales id. Nunc semper mi eu felis laoreet, non accumsan mi luctus. Curabitur aliquam congue nisi sodales placerat. Vestibulum finibus tempor urna id tincidunt. Proin diam tortor, vestibulum sed tempus eget, molestie eu lacus. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae;</strong></p><p class=\"ql-align-justify\"><br></p><p class=\"ql-align-justify\">Aliquam fringilla ut dolor id dapibus. Etiam dapibus convallis eleifend. Morbi eget sem interdum, porta sapien sed, interdum nibh. In porttitor nisl sem, non mollis odio eleifend eget. Ut vitae eleifend lectus. Ut non dui at elit luctus vestibulum mattis id libero. Aenean ultricies nisi nec tortor tincidunt congue vitae ac dui. Cras posuere eros felis, sit amet volutpat ligula ultrices in. Integer fermentum lectus sed rutrum fermentum.</p><p><br></p>', '1601907290.jpeg', 'published', '2020-10-05 06:14:50', '2020-10-05 06:14:50');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `masters`
--

CREATE TABLE `masters` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'author',
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user_photo.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `masters`
--

INSERT INTO `masters` (`id`, `name`, `email`, `role`, `photo`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@gmail.com', 'admin', 'user_default.png', NULL, '$2y$10$ZJAun8WYaB5OmwyMpr5nsu5oFncoY76PTecvbV9fdcUOGA4Lomzd6', NULL, NULL, NULL),
(2, 'Ben Parker', 'ben@gmail.com', 'author', 'user_default.png', NULL, '$2y$10$dyEbG3sjt7jnZtiehM.Sd.C7TtMosGKKFTHRtMN4z0J13eM00JFuG', NULL, '2020-10-05 05:43:23', '2020-10-05 05:43:23'),
(3, 'Carlie Ferrer', 'carlie@gmail.com', 'author', 'user_default.png', NULL, '$2y$10$IKrsPpOrF2vhJVtuzCuJkOB5kL.f7uQqSj0ifehQUSb2poSozVM6e', NULL, '2020-10-05 05:44:03', '2020-10-05 05:44:03');

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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(6, '2016_06_01_000004_create_oauth_clients_table', 1),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(8, '2019_08_19_000000_create_failed_jobs_table', 1),
(9, '2020_09_05_141140_create_topics_table', 1),
(10, '2020_09_06_072958_create_articles_table', 1),
(11, '2020_09_10_122616_create_masters_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'EtwTKaCzK12QNpGxFkoVGT77hcSpNFFUZuhkKkKk', NULL, 'http://localhost', 1, 0, 0, '2020-10-05 05:41:46', '2020-10-05 05:41:46'),
(2, NULL, 'Laravel Password Grant Client', 'VER1AcJNwCpItvkrwxd1NLM47oZwuQj6ShPYKooc', 'users', 'http://localhost', 0, 1, 0, '2020-10-05 05:41:47', '2020-10-05 05:41:47');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2020-10-05 05:41:47', '2020-10-05 05:41:47');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `topics`
--

CREATE TABLE `topics` (
  `topic_id` int(10) UNSIGNED NOT NULL,
  `topic_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `topic_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `topics`
--

INSERT INTO `topics` (`topic_id`, `topic_name`, `topic_status`, `created_at`, `updated_at`) VALUES
(1, 'Entertainment', 'active', '2020-10-05 05:56:23', '2020-10-05 05:56:23'),
(2, 'Health', 'active', '2020-10-05 05:56:33', '2020-10-05 05:56:33'),
(3, 'Sports', 'active', '2020-10-05 05:56:42', '2020-10-05 05:56:42');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
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
(1, 'Kath Ocampo', 'kath@gmail.com', 'user', NULL, '$2y$10$rHrwz6Rqko8alaRA09hVmevaFwE/tSk6cNfJq/thoA/j3XFhepzYK', NULL, '2020-10-05 05:54:31', '2020-10-05 05:54:31'),
(2, 'Jennifer Reyes', 'jenn@gmail.com', 'user', NULL, '$2y$10$Ke9HQoASfS9eBAs69s8HVu1LoyADndfUpS7wVTyhbdSOxK4eud8yG', NULL, '2020-10-05 05:55:22', '2020-10-05 05:55:22');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`article_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `masters`
--
ALTER TABLE `masters`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `masters_email_unique` (`email`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `topics`
--
ALTER TABLE `topics`
  ADD PRIMARY KEY (`topic_id`);

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
-- AUTO_INCREMENT for table `articles`
--
ALTER TABLE `articles`
  MODIFY `article_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `masters`
--
ALTER TABLE `masters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `topics`
--
ALTER TABLE `topics`
  MODIFY `topic_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
