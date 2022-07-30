-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 30, 2022 at 10:44 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `votingdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_07_28_025000_create_nominees_table', 1),
(6, '2022_07_28_124859_create_votes_table', 2),
(7, '2022_07_28_141929_create_nominee_votes_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `nominees`
--

CREATE TABLE `nominees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `nominees`
--

INSERT INTO `nominees` (`id`, `name`, `description`, `category`, `image`, `created_at`, `updated_at`) VALUES
(20, 'Gil Pacturan', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vitae vehicula odio. Aliquam interdum, nisi sit amet pharetra fermentum, purus ligula dignissim odio, pretium ultricies lorem lacus et est. Vestibulum pulvinar pellentesque ante vel tincidunt.', 'President', '1659023134.jpg', '2022-07-28 07:45:34', '2022-07-28 07:45:34'),
(21, 'Matt Kenji', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vitae vehicula odio. Aliquam interdum, nisi sit amet pharetra fermentum, purus ligula dignissim odio, pretium ultricies lorem lacus et est. Vestibulum pulvinar pellentesque ante vel tincidunt.', 'President', '1659054286.jpg', '2022-07-28 16:24:46', '2022-07-28 16:24:46'),
(22, 'Leah Ki', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vitae vehicula odio. Aliquam interdum, nisi sit amet pharetra fermentum, purus ligula dignissim odio, pretium ultricies lorem lacus et est. Vestibulum pulvinar pellentesque ante vel tincidunt.', 'President', '1659054298.jpg', '2022-07-28 16:24:58', '2022-07-28 16:24:58'),
(23, 'Magnum Junior', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vitae vehicula odio. Aliquam interdum, nisi sit amet pharetra fermentum, purus ligula dignissim odio, pretium ultricies lorem lacus et est. Vestibulum pulvinar pellentesque ante vel tincidunt.', 'Vice President', '1659054318.jpg', '2022-07-28 16:25:18', '2022-07-28 16:25:18'),
(24, 'Kevin Durant', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vitae vehicula odio. Aliquam interdum, nisi sit amet pharetra fermentum, purus ligula dignissim odio, pretium ultricies lorem lacus et est. Vestibulum pulvinar pellentesque ante vel tincidunt.', 'Vice President', '1659054330.jpg', '2022-07-28 16:25:30', '2022-07-28 16:25:30'),
(25, 'George Gil', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vitae vehicula odio. Aliquam interdum, nisi sit amet pharetra fermentum, purus ligula dignissim odio, pretium ultricies lorem lacus et est. Vestibulum pulvinar pellentesque ante vel tincidunt.', 'Vice President', '1659054338.jpg', '2022-07-28 16:25:38', '2022-07-28 16:25:38'),
(26, 'Jean Mary', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vitae vehicula odio. Aliquam interdum, nisi sit amet pharetra fermentum, purus ligula dignissim odio, pretium ultricies lorem lacus et est. Vestibulum pulvinar pellentesque ante vel tincidunt.', 'Treasurer', '1659054447.jpg', '2022-07-28 16:27:27', '2022-07-28 16:27:27'),
(27, 'Antonio Luna', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vitae vehicula odio. Aliquam interdum, nisi sit amet pharetra fermentum, purus ligula dignissim odio, pretium ultricies lorem lacus et est. Vestibulum pulvinar pellentesque ante vel tincidunt.', 'Treasurer', '1659054459.jpg', '2022-07-28 16:27:39', '2022-07-28 16:27:39'),
(28, 'Kite Mike', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vitae vehicula odio. Aliquam interdum, nisi sit amet pharetra fermentum, purus ligula dignissim odio, pretium ultricies lorem lacus et est. Vestibulum pulvinar pellentesque ante vel tincidunt.', 'Treasurer', '1659054466.jpg', '2022-07-28 16:27:46', '2022-07-28 16:27:46');

-- --------------------------------------------------------

--
-- Table structure for table `nominee_votes`
--

CREATE TABLE `nominee_votes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `voter_id` bigint(20) UNSIGNED NOT NULL,
  `president_id` bigint(20) UNSIGNED NOT NULL,
  `vice_president_id` bigint(20) UNSIGNED NOT NULL,
  `treasurer_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
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
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `votes`
--

CREATE TABLE `votes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `lastName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `age` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `occupation` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `completeAddress` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `nominees`
--
ALTER TABLE `nominees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `nominee_votes`
--
ALTER TABLE `nominee_votes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nominee_votes_voter_id_foreign` (`voter_id`),
  ADD KEY `nominee_votes_president_id_foreign` (`president_id`),
  ADD KEY `nominee_votes_vice_president_id_foreign` (`vice_president_id`),
  ADD KEY `nominee_votes_treasurer_id_foreign` (`treasurer_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `votes`
--
ALTER TABLE `votes`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `nominees`
--
ALTER TABLE `nominees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `nominee_votes`
--
ALTER TABLE `nominee_votes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `votes`
--
ALTER TABLE `votes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `nominee_votes`
--
ALTER TABLE `nominee_votes`
  ADD CONSTRAINT `nominee_votes_president_id_foreign` FOREIGN KEY (`president_id`) REFERENCES `nominees` (`id`),
  ADD CONSTRAINT `nominee_votes_treasurer_id_foreign` FOREIGN KEY (`treasurer_id`) REFERENCES `nominees` (`id`),
  ADD CONSTRAINT `nominee_votes_vice_president_id_foreign` FOREIGN KEY (`vice_president_id`) REFERENCES `nominees` (`id`),
  ADD CONSTRAINT `nominee_votes_voter_id_foreign` FOREIGN KEY (`voter_id`) REFERENCES `votes` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
