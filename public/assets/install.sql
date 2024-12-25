-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Aug 28, 2024 at 11:40 AM
-- Server version: 5.7.39
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `test`
--

-- --------------------------------------------------------

--
-- Table structure for table `addtocarts`
--

CREATE TABLE `addtocarts` (
  `id` int(11) NOT NULL,
  `course_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `applications`
--

CREATE TABLE `applications` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `description` longtext,
  `document` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `category_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `thumbnail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `banner` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `keywords` text COLLATE utf8_unicode_ci,
  `is_popular` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blog_categories`
--

CREATE TABLE `blog_categories` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subtitle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blog_comments`
--

CREATE TABLE `blog_comments` (
  `id` int(11) NOT NULL,
  `blog_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `check` int(11) DEFAULT NULL,
  `comment` longtext COLLATE utf8_unicode_ci,
  `likes` longtext COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blog_likes`
--

CREATE TABLE `blog_likes` (
  `id` int(255) NOT NULL,
  `blog_id` int(255) DEFAULT NULL,
  `user_id` int(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `bootcamps`
--

CREATE TABLE `bootcamps` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `description` longtext,
  `short_description` text,
  `is_paid` int(11) DEFAULT NULL,
  `price` double(10,2) DEFAULT NULL,
  `discount_flag` int(11) DEFAULT NULL,
  `discounted_price` double(10,2) DEFAULT NULL,
  `publish_date` int(11) DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `faqs` longtext,
  `requirements` longtext,
  `outcomes` longtext,
  `meta_keywords` text,
  `meta_description` longtext,
  `status` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `bootcamp_categories`
--

CREATE TABLE `bootcamp_categories` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `bootcamp_live_classes`
--

CREATE TABLE `bootcamp_live_classes` (
  `id` int(11) NOT NULL,
  `module_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `description` longtext,
  `start_time` int(11) DEFAULT NULL,
  `end_time` int(11) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `joining_data` longtext,
  `force_stop` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `bootcamp_modules`
--

CREATE TABLE `bootcamp_modules` (
  `id` int(11) NOT NULL,
  `bootcamp_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `publish_date` int(11) DEFAULT NULL,
  `expiry_date` int(11) DEFAULT NULL,
  `restriction` varchar(255) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `bootcamp_purchases`
--

CREATE TABLE `bootcamp_purchases` (
  `id` int(11) NOT NULL,
  `invoice` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `bootcamp_id` int(11) DEFAULT NULL,
  `price` double(10,2) DEFAULT NULL,
  `tax` double(10,2) DEFAULT NULL,
  `payment_method` varchar(255) DEFAULT NULL,
  `payment_details` text,
  `status` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `admin_revenue` double(10,2) DEFAULT NULL,
  `instructor_revenue` double(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `bootcamp_resources`
--

CREATE TABLE `bootcamp_resources` (
  `id` int(11) NOT NULL,
  `module_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `upload_type` varchar(255) DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `uploaded_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `builder_blocks`
--

CREATE TABLE `builder_blocks` (
  `id` int(11) NOT NULL,
  `identifier` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `html` longtext,
  `thumbnail` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `builder_blocks`
--

INSERT INTO `builder_blocks` (`id`, `identifier`, `title`, `html`, `thumbnail`, `created_at`, `updated_at`) VALUES
(1, 'topbar', 'Topbar', '<span class=\"topbar\">\n    <div class=\"sub-header\">\n        <div class=\"container\">\n            <div class=\"row\">\n                <div class=\"col-lg-6 col-md-6\">\n                    <div class=\"sub-header-left\">\n                        <ul class=\"d-flex\">\n                            <li>\n                                <a href=\"tel:+143-52-9933631\">\n                                    <svg width=\"20\" height=\"20\" viewBox=\"0 0 20 20\" fill=\"none\"\n                                        xmlns=\"http://www.w3.org/2000/svg\">\n                                        <path\n                                            d=\"M18.3018 15.2734C18.3018 15.5734 18.2352 15.8817 18.0935 16.1817C17.9518 16.4817 17.7685 16.765 17.5268 17.0317C17.1185 17.4817 16.6685 17.8067 16.1602 18.015C15.6602 18.2234 15.1185 18.3317 14.5352 18.3317C13.6852 18.3317 12.7768 18.1317 11.8185 17.7234C10.8602 17.315 9.90182 16.765 8.95182 16.0734C7.99349 15.3734 7.08516 14.5984 6.21849 13.74C5.36016 12.8734 4.58516 11.965 3.89349 11.015C3.21016 10.065 2.66016 9.11504 2.26016 8.17337C1.86016 7.22337 1.66016 6.31504 1.66016 5.44837C1.66016 4.88171 1.76016 4.34004 1.96016 3.84004C2.16016 3.33171 2.47682 2.86504 2.91849 2.44837C3.45182 1.92337 4.03516 1.66504 4.65182 1.66504C4.88516 1.66504 5.11849 1.71504 5.32682 1.81504C5.54349 1.91504 5.73516 2.06504 5.88516 2.28171L7.81849 5.00671C7.96849 5.21504 8.07682 5.40671 8.15182 5.59004C8.22682 5.76504 8.26849 5.94004 8.26849 6.09837C8.26849 6.29837 8.21016 6.49837 8.09349 6.69004C7.98516 6.8817 7.82682 7.0817 7.62682 7.2817L6.99349 7.94004C6.90182 8.0317 6.86016 8.14004 6.86016 8.27337C6.86016 8.34004 6.86849 8.39837 6.88516 8.46504C6.91016 8.5317 6.93516 8.5817 6.95182 8.6317C7.10182 8.9067 7.36016 9.26504 7.72682 9.69837C8.10182 10.1317 8.50182 10.5734 8.93516 11.015C9.38516 11.4567 9.81849 11.865 10.2602 12.24C10.6935 12.6067 11.0518 12.8567 11.3352 13.0067C11.3768 13.0234 11.4268 13.0484 11.4852 13.0734C11.5518 13.0984 11.6185 13.1067 11.6935 13.1067C11.8352 13.1067 11.9435 13.0567 12.0352 12.965L12.6685 12.34C12.8768 12.1317 13.0768 11.9734 13.2685 11.8734C13.4602 11.7567 13.6518 11.6984 13.8602 11.6984C14.0185 11.6984 14.1852 11.7317 14.3685 11.8067C14.5518 11.8817 14.7435 11.99 14.9518 12.1317L17.7102 14.09C17.9268 14.24 18.0768 14.415 18.1685 14.6234C18.2518 14.8317 18.3018 15.04 18.3018 15.2734Z\"\n                                            stroke=\"#192335\" stroke-width=\"1.25\" stroke-miterlimit=\"10\"></path>\n                                    </svg>\n                                    +143-52-9933631\n                                </a>\n                            </li>\n                            <li>\n                                <a href=\"#\"><svg width=\"20\" height=\"20\" viewBox=\"0 0 20 20\" fill=\"none\"\n                                        xmlns=\"http://www.w3.org/2000/svg\">\n                                        <path\n                                            d=\"M9.99453 11.1912C11.4305 11.1912 12.5945 10.0272 12.5945 8.59121C12.5945 7.15527 11.4305 5.99121 9.99453 5.99121C8.55859 5.99121 7.39453 7.15527 7.39453 8.59121C7.39453 10.0272 8.55859 11.1912 9.99453 11.1912Z\"\n                                            stroke=\"#192335\" stroke-width=\"1.25\"></path>\n                                        <path\n                                            d=\"M3.0187 7.0763C4.66037 -0.140363 15.352 -0.132029 16.9854 7.08464C17.9437 11.318 15.3104 14.9013 13.002 17.118C11.327 18.7346 8.67704 18.7346 6.9937 17.118C4.6937 14.9013 2.06037 11.3096 3.0187 7.0763Z\"\n                                            stroke=\"#192335\" stroke-width=\"1.25\"></path>\n                                    </svg>\n                                    Sydney, Australia\n                                </a>\n                            </li>\n                        </ul>\n                    </div>\n                </div>\n                <div class=\"col-lg-6 col-md-6\">\n                    <div class=\"sub-header-left right-sub\">\n\n                        <ul class=\"d-flex\">\n                            <li>\n                                <a href=\"https://twitter.com\">\n                                    <i class=\"fa-brands fa-twitter\"></i>\n                                </a>\n                            </li>\n                            <li>\n                                <a href=\"https://linkedin.com\">\n                                    <i class=\"fa-brands fa-linkedin\"></i>\n                                </a>\n                            </li>\n                            <li>\n                                <a href=\"https://facebook.com\">\n                                    <i class=\"fa-brands fa-square-facebook\"></i>\n                                </a>\n                            </li>\n                        </ul>\n                    </div>\n                </div>\n            </div>\n        </div>\n    </div>\n</span>', '', '2024-08-27 04:48:22', '2024-08-27 04:48:22'),
(2, 'menu', 'Menu', '<span class=\"header-menu\">\n<header class=\"header-area\">\n    <div class=\"container\">\n        <div class=\"row\">\n            <div class=\"col-auto\">\n                <div class=\"logo-image\">\n                    <a href=\"\">\n                        <img src=\"/assets/page-builder/block-image/logo.png\"\n                            alt=\"system logo\" class=\"object-fit-cover rounded\">\n                    </a>\n                </div>\n            </div>\n            <div class=\"col-auto\">\n                <div class=\"header-menu d-flex justify-content-end me-lg-auto ms-auto ms-lg-0 mt-2 pt-1\">\n                    <div class=\"nav-menu w-100\">\n                        <ul class=\"primary-menu main-menu-ul d-flex align-items-center w-100\">\n                            <li><a href=\"#\" class=\"\">Home</a></li>\n                            <li class=\"have-mega-menu\"><a class=\"menu-parent-a  active \"\n                                    href=\"#\">Courses</a>\n                                <ul class=\"mega-dropdown-menu mega main-mega-menu\">\n                                    <div class=\"mega-menu-items\">\n                                        <ul class=\"mega_list\">\n                                            <li>\n                                                <a href=\"#\">\n                                                    <span class=\"me-3\"><i class=\"fas fa-music\"></i></span>\n                                                    <span class=\"me-auto\">Music</span>\n                                                    <span><i class=\"fi fi-sr-angle-small-right\"></i></span>\n                                                </a>\n\n                                                <ul class=\"child_category_menu\">\n                                                    <li>\n                                                        <a\n                                                            href=\"#\">\n                                                            Learing Guitar\n                                                        </a>\n                                                    </li>\n                                                    <li>\n                                                        <a\n                                                            href=\"#\">\n                                                            Basic Piano\n                                                        </a>\n                                                    </li>\n                                                </ul>\n                                            </li>\n                                            <li>\n                                                <a href=\"#\">\n                                                    <span class=\"me-3\"><i class=\"far fa-hand-peace\"></i></span>\n                                                    <span class=\"me-auto\">Yoga</span>\n                                                    <span><i class=\"fi fi-sr-angle-small-right\"></i></span>\n                                                </a>\n\n                                                <ul class=\"child_category_menu\">\n                                                    <li>\n                                                        <a\n                                                            href=\"#vinyasa-yoga\">\n                                                            Vinyasa yoga\n                                                        </a>\n                                                    </li>\n                                                    <li>\n                                                        <a\n                                                            href=\"#restorative-yoga\">\n                                                            Restorative Yoga\n                                                        </a>\n                                                    </li>\n                                                    <li>\n                                                        <a\n                                                            href=\"#tanya-wiggins\">\n                                                            Tanya Wiggins\n                                                        </a>\n                                                    </li>\n                                                </ul>\n                                            </li>\n                                            <li>\n                                                <a href=\"#fashion\">\n                                                    <span class=\"me-3\"><i class=\"fas fa-user-secret\"></i></span>\n                                                    <span class=\"me-auto\">Fashion</span>\n                                                    <span><i class=\"fi fi-sr-angle-small-right\"></i></span>\n                                                </a>\n\n                                                <ul class=\"child_category_menu\">\n                                                    <li>\n                                                        <a\n                                                            href=\"#fashion-design\">\n                                                            Fashion Design\n                                                        </a>\n                                                    </li>\n                                                    <li>\n                                                        <a href=\"#sewing\">\n                                                            Sewing\n                                                        </a>\n                                                    </li>\n                                                    <li>\n                                                        <a\n                                                            href=\"#t-shirt-design\">\n                                                            T-shirt Design\n                                                        </a>\n                                                    </li>\n                                                    <li>\n                                                        <a\n                                                            href=\"#jewelry-design\">\n                                                            Jewelry Design\n                                                        </a>\n                                                    </li>\n                                                </ul>\n                                            </li>\n                                            <li>\n                                                <a\n                                                    href=\"#3d-and-animation\">\n                                                    <span class=\"me-3\"><i class=\"fas fa-cube\"></i></span>\n                                                    <span class=\"me-auto\">3D and Animation</span>\n                                                    <span><i class=\"fi fi-sr-angle-small-right\"></i></span>\n                                                </a>\n\n                                                <ul class=\"child_category_menu\">\n                                                    <li>\n                                                        <a href=\"#blender\">\n                                                            Blender\n                                                        </a>\n                                                    </li>\n                                                    <li>\n                                                        <a\n                                                            href=\"#motion-graphics\">\n                                                            Motion Graphics\n                                                        </a>\n                                                    </li>\n                                                    <li>\n                                                        <a\n                                                            href=\"#after-effects\">\n                                                            After Effects\n                                                        </a>\n                                                    </li>\n                                                    <li>\n                                                        <a href=\"#maya\">\n                                                            Maya\n                                                        </a>\n                                                    </li>\n                                                    <li>\n                                                        <a href=\"#zbrush\">\n                                                            ZBrush\n                                                        </a>\n                                                    </li>\n                                                    <li>\n                                                        <a\n                                                            href=\"#character-modeling\">\n                                                            Character Modeling\n                                                        </a>\n                                                    </li>\n                                                </ul>\n                                            </li>\n                                            <li>\n                                                <a href=\"#interior-design\">\n                                                    <span class=\"me-3\"><i\n                                                            class=\"fab fa-yandex-international\"></i></span>\n                                                    <span class=\"me-auto\">Interior Design</span>\n                                                    <span><i class=\"fi fi-sr-angle-small-right\"></i></span>\n                                                </a>\n\n                                                <ul class=\"child_category_menu\">\n                                                    <li>\n                                                        <a\n                                                            href=\"#color-theory\">\n                                                            Color Theory\n                                                        </a>\n                                                    </li>\n                                                    <li>\n                                                        <a\n                                                            href=\"#lighting-design\">\n                                                            Lighting Design\n                                                        </a>\n                                                    </li>\n                                                    <li>\n                                                        <a\n                                                            href=\"#sketch-up\">\n                                                            Sketch Up\n                                                        </a>\n                                                    </li>\n                                                    <li>\n                                                        <a\n                                                            href=\"#home-improvement\">\n                                                            Home Improvement\n                                                        </a>\n                                                    </li>\n                                                    <li>\n                                                        <a\n                                                            href=\"#3d-lighting\">\n                                                            3D Lighting\n                                                        </a>\n                                                    </li>\n                                                </ul>\n                                            </li>\n                                            <li>\n                                                <a href=\"#user-experience\">\n                                                    <span class=\"me-3\"><i class=\"fas fa-male\"></i></span>\n                                                    <span class=\"me-auto\">User Experience</span>\n                                                    <span><i class=\"fi fi-sr-angle-small-right\"></i></span>\n                                                </a>\n\n                                                <ul class=\"child_category_menu\">\n                                                    <li>\n                                                        <a\n                                                            href=\"#user-experience-design\">\n                                                            User Experience Design\n                                                        </a>\n                                                    </li>\n                                                    <li>\n                                                        <a\n                                                            href=\"#mobile-app-design\">\n                                                            Mobile App Design\n                                                        </a>\n                                                    </li>\n                                                    <li>\n                                                        <a\n                                                            href=\"#user-interface\">\n                                                            User Interface\n                                                        </a>\n                                                    </li>\n                                                    <li>\n                                                        <a\n                                                            href=\"#design-thinking\">\n                                                            Design Thinking\n                                                        </a>\n                                                    </li>\n                                                    <li>\n                                                        <a href=\"#figma\">\n                                                            Figma\n                                                        </a>\n                                                    </li>\n                                                    <li>\n                                                        <a\n                                                            href=\"#prototyping\">\n                                                            Prototyping\n                                                        </a>\n                                                    </li>\n                                                </ul>\n                                            </li>\n                                            <li>\n                                                <a href=\"#graphic-design\">\n                                                    <span class=\"me-3\"><i class=\"fas fa-pencil-alt\"></i></span>\n                                                    <span class=\"me-auto\">Graphic Design</span>\n                                                    <span><i class=\"fi fi-sr-angle-small-right\"></i></span>\n                                                </a>\n\n                                                <ul class=\"child_category_menu\">\n                                                    <li>\n                                                        <a\n                                                            href=\"#photoshop\">\n                                                            Photoshop\n                                                        </a>\n                                                    </li>\n                                                    <li>\n                                                        <a\n                                                            href=\"#adobe-illustrator\">\n                                                            Adobe Illustrator\n                                                        </a>\n                                                    </li>\n                                                    <li>\n                                                        <a href=\"#drawing\">\n                                                            Drawing\n                                                        </a>\n                                                    </li>\n                                                    <li>\n                                                        <a\n                                                            href=\"#logo-design\">\n                                                            Logo Design\n                                                        </a>\n                                                    </li>\n                                                    <li>\n                                                        <a\n                                                            href=\"#digital-art\">\n                                                            Digital Art\n                                                        </a>\n                                                    </li>\n                                                </ul>\n                                            </li>\n                                            <li>\n                                                <a href=\"#web-development\">\n                                                    <span class=\"me-3\"><i class=\"far fa-object-ungroup\"></i></span>\n                                                    <span class=\"me-auto\">Web Development</span>\n                                                    <span><i class=\"fi fi-sr-angle-small-right\"></i></span>\n                                                </a>\n\n                                                <ul class=\"child_category_menu\">\n                                                    <li>\n                                                        <a\n                                                            href=\"#wordpress\">\n                                                            Wordpress\n                                                        </a>\n                                                    </li>\n                                                    <li>\n                                                        <a\n                                                            href=\"#responsive-design\">\n                                                            Responsive Design\n                                                        </a>\n                                                    </li>\n                                                    <li>\n                                                        <a\n                                                            href=\"#bootstrap\">\n                                                            Bootstrap\n                                                        </a>\n                                                    </li>\n                                                    <li>\n                                                        <a\n                                                            href=\"#html-css\">\n                                                            HTML &amp; CSS\n                                                        </a>\n                                                    </li>\n                                                </ul>\n                                            </li>\n                                            <li>\n                                                <a href=\"#>\n                                                    <span class=\"me-3\"><i class=\"fas fa-list-ul\"></i></span>\n                                                    <span class=\"me-auto\">All Courses</span>\n                                                </a>\n                                            </li>\n                                        </ul>\n                                    </div>\n                                </ul>\n                            </li>\n                            <li class=\"ps-5 pe-2\"><a href=\"#blogs\"\n                                    class=\"\">Blog</a></li>\n                        </ul>\n                    </div>\n                </div>\n            </div>\n            <div class=\"col-auto col-sm-5 col-md-4 ms-auto ms-lg-0\">\n                <form action=\"# method=\"get\"\n                    class=\"Esearch_entry ms-4 mt-2 d-none d-sm-inline-block w-100\">\n                    <input type=\"text\" name=\"search\" class=\"form-control\" placeholder=\"Search...\">\n                    <button type=\"submit\"><i class=\"fa-solid fa-magnifying-glass\"></i></button>\n                </form>\n                <div class=\"floating-searchbar d-inline-block d-sm-none \">\n                    <button type=\"button\" class=\"py-3 mt-1\"\n                        onclick=\"this.parentElement.querySelector(\'form\').classList.toggle(\'show\')\"><i\n                            class=\"fa-solid fa-magnifying-glass\"></i></button>\n                    <form action=\"# method=\"get\">\n                        <input type=\"text\" name=\"search\" class=\"form-control\" placeholder=\"Search courses\">\n                        <button type=\"submit\"><i class=\"fa-solid fa-magnifying-glass\"></i></button>\n                    </form>\n                </div>\n            </div>\n            <div class=\"col-auto ms-lg-auto pt-1\">\n                <div class=\"primary-end d-flex align-items-center \">\n                    <div class=\"d-flex align-items-center gap-2\">\n\n                        <a href=\"#cart\" class=\"ms-4 me-4 me-md-5 position-relative\"\n                            data-bs-toggle=\"tooltip\" data-bs-title=\"Cart\" data-bs-placement=\"bottom\">\n                            <span class=\"cart-top-number\">\n                                0\n                            </span>\n                            <svg width=\"24\" height=\"24\" viewBox=\"0 0 24 24\" fill=\"none\"\n                                xmlns=\"http://www.w3.org/2000/svg\">\n                                <path\n                                    d=\"M2 2H3.74001C4.82001 2 5.67 2.93 5.58 4L4.75 13.96C4.61 15.59 5.89999 16.99 7.53999 16.99H18.19C19.63 16.99 20.89 15.81 21 14.38L21.54 6.88C21.66 5.22 20.4 3.87 18.73 3.87H5.82001\"\n                                    stroke=\"#192335\" stroke-width=\"1.5\" stroke-miterlimit=\"10\" stroke-linecap=\"round\"\n                                    stroke-linejoin=\"round\"></path>\n                                <path\n                                    d=\"M16.25 22C16.9404 22 17.5 21.4404 17.5 20.75C17.5 20.0596 16.9404 19.5 16.25 19.5C15.5596 19.5 15 20.0596 15 20.75C15 21.4404 15.5596 22 16.25 22Z\"\n                                    stroke=\"#192335\" stroke-width=\"1.5\" stroke-miterlimit=\"10\" stroke-linecap=\"round\"\n                                    stroke-linejoin=\"round\"></path>\n                                <path\n                                    d=\"M8.25 22C8.94036 22 9.5 21.4404 9.5 20.75C9.5 20.0596 8.94036 19.5 8.25 19.5C7.55964 19.5 7 20.0596 7 20.75C7 21.4404 7.55964 22 8.25 22Z\"\n                                    stroke=\"#192335\" stroke-width=\"1.5\" stroke-miterlimit=\"10\" stroke-linecap=\"round\"\n                                    stroke-linejoin=\"round\"></path>\n                                <path d=\"M9 8H21\" stroke=\"#192335\" stroke-width=\"1.5\" stroke-miterlimit=\"10\"\n                                    stroke-linecap=\"round\" stroke-linejoin=\"round\"></path>\n                            </svg>\n                        </a>\n\n                    </div>\n\n\n                    <a href=\"#login\"\n                        class=\"d-none d-lg-inline-block eBtn btn gradient mb-1\">Login</a>\n                    <span class=\"toggle-bar text-dark ms-0\" data-bs-toggle=\"offcanvas\"\n                        data-bs-target=\"#offcanvasWithBothOptions\" aria-controls=\"offcanvasWithBothOptions\"><i\n                            class=\"fa-sharp fa-solid fa-bars\"></i></span>\n                </div>\n            </div>\n        </div>\n\n\n\n\n        <!-- Off Canves Menu -->\n        <div class=\"offcanvas offcanvas-start\" data-bs-scroll=\"true\" tabindex=\"-1\" id=\"offcanvasWithBothOptions\"\n            aria-labelledby=\"offcanvasWithBothOptionsLabel\">\n            <div class=\"offcanvas-header\">\n                <h5 class=\"offcanvas-title\" id=\"offcanvasWithBothOptionsLabel\"></h5>\n            </div>\n            <div class=\"offcanvas-body px-4\">\n                <div class=\"off-menu\">\n                    <div class=\"logo-image d-flex align-items-center justify-content-between mb-4\">\n                        <a href=\"#\">\n                            <img src=\"#public/assets/upload/dark_logo/dark-logo-1716465907.png\"\n                                alt=\"system logo\">\n                        </a>\n                        <button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"offcanvas\" aria-label=\"Close\"></button>\n                    </div>\n                    <div class=\"flex-shrink-0 mt-3\">\n                        <ul class=\"list-unstyled ps-0\">\n\n\n                            <li><a href=\"#\"\n                                    class=\"btn btn-toggle-list d-inline-flex align-items-center rounded border-0 text-16px fw-500 w-100 py-3\">\n                                    Home</a></li>\n                            <li>\n                                <button\n                                    class=\"btn btn-toggle d-inline-flex align-items-center rounded border-0 text-16px fw-500 w-100 py-3 collapsed\"\n                                    data-bs-toggle=\"collapse\" data-bs-target=\"#category-collapse\" aria-expanded=\"false\">\n                                    Courses\n                                    <span class=\"icons ms-auto float-end\"><i class=\"fa-solid fa-angle-down\"></i></span>\n                                </button>\n                                <div class=\"collapse\" id=\"category-collapse\">\n                                    <ul class=\"btn-toggle-nav list-unstyled fw-normal pb-1 small bg-white pt-0 pb-3\">\n                                        <li>\n                                            <a class=\"py-2 px-3 w-100\"\n                                                href=\"#music\">Music</a>\n                                        </li>\n                                        <li>\n                                            <a class=\"py-2 px-3 w-100\"\n                                                href=\"#yoga\">Yoga</a>\n                                        </li>\n                                        <li>\n                                            <a class=\"py-2 px-3 w-100\"\n                                                href=\"#fashion\">Fashion</a>\n                                        </li>\n                                        <li>\n                                            <a class=\"py-2 px-3 w-100\"\n                                                href=\"#3d-and-animation\">3D\n                                                and Animation</a>\n                                        </li>\n                                        <li>\n                                            <a class=\"py-2 px-3 w-100\"\n                                                href=\"#interior-design\">Interior\n                                                Design</a>\n                                        </li>\n                                        <li>\n                                            <a class=\"py-2 px-3 w-100\"\n                                                href=\"#user-experience\">User\n                                                Experience</a>\n                                        </li>\n                                        <li>\n                                            <a class=\"py-2 px-3 w-100\"\n                                                href=\"#graphic-design\">Graphic\n                                                Design</a>\n                                        </li>\n                                        <li>\n                                            <a class=\"py-2 px-3 w-100\"\n                                                href=\"#web-development\">Web\n                                                Development</a>\n                                        </li>\n                                    </ul>\n                                </div>\n                            </li>\n                        </ul>\n                    </div>\n                    <div class=\"btn-off\">\n                        <a href=\"#login\" class=\"eBtn btn gradient mb-3\">Login</a>\n                        <a href=\"#register\" class=\"eBtn btn gradient sign\">Sign\n                            Up</a>\n                    </div>\n                </div>\n            </div>\n        </div>\n    </div>\n</header>\n</span>\n', '', '2024-08-27 04:48:22', '2024-08-27 04:48:22'),
(3, 'hero', 'Hero', '<section class=\"banner-wraper mt-0 mt-md-5\">\n    <div class=\"container\">\n        <div class=\"row justify-content-center\">\n            <div class=\"col-md-6 order-2 order-md-1\">\n                <div class=\"banner-content\">\n                    <h5 class=\"d-flex builder_text parent\" content_type=\"text\" id=\"placeholder_id\"><img src=\"/assets/page-builder/block-image/roket.svg\" alt=\"...\"> The Leader in online learning</h5>\n                    <h1 class=\"builder_text parent\" content_type=\"text\" id=\"placeholder_id\">Start learning from the world\'s pro \n                        <span class=\"gradient color shadow-none builder_text parent\" content_type=\"text\" id=\"placeholder_id\">instructors</span></h1>\n                    <p class=\"builder_text parent\" content_type=\"text\" id=\"placeholder_id\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum.</p>\n                    <span class=\"hero-button\">\n                        <div class=\"banner-btn\">\n                            <a href=\"#\" class=\"eBtn gradient\">Get Started</a>\n                            <a href=\"#\" class=\"ps-4 learn-btn\"><i class=\"fa-solid fa-play\"></i>Learn More</a>\n                        </div>\n                    </span>\n                    \n                </div>\n            </div>\n            <div class=\"col-sm-8 col-md-6 order-1 order-md-2\">\n                <span class=\"hero-banner\">\n                    <div class=\"banner-image mt-0 mt-md-5\">\n                        <img class=\"large-img\" src=\"/assets/page-builder/block-image/banner.png\" alt=\"...\">\n                        <div class=\"over-text\">\n                            <span>\n                                <svg width=\"30\" height=\"30\" viewBox=\"0 0 30 30\" fill=\"none\" xmlns=\"http://www.w3.org/2000/svg\">\n                                <g clip-path=\"url(#clip0_47_63)\">\n                                <mask id=\"mask0_47_63\" style=\"mask-type:luminance\" maskUnits=\"userSpaceOnUse\" x=\"0\" y=\"0\" width=\"30\" height=\"30\">\n                                <path d=\"M0 1.90735e-06H30V30H0V1.90735e-06Z\" fill=\"white\"/>\n                                </mask>\n                                <g mask=\"url(#mask0_47_63)\">\n                                <path d=\"M7.36816 27.2279V29.5615\" stroke=\"white\" stroke-width=\"0.878906\" stroke-miterlimit=\"10\" stroke-linecap=\"round\" stroke-linejoin=\"round\"/>\n                                <path d=\"M22.6289 27.2279V29.5615\" stroke=\"white\" stroke-width=\"0.878906\" stroke-miterlimit=\"10\" stroke-linecap=\"round\" stroke-linejoin=\"round\"/>\n                                </g>\n                                <path d=\"M5.94995 4.26311V7.34473\" stroke=\"white\" stroke-width=\"0.878906\" stroke-miterlimit=\"10\" stroke-linecap=\"round\" stroke-linejoin=\"round\"/>\n                                <mask id=\"mask1_47_63\" style=\"mask-type:luminance\" maskUnits=\"userSpaceOnUse\" x=\"0\" y=\"0\" width=\"30\" height=\"30\">\n                                <path d=\"M0 1.90735e-06H30V30H0V1.90735e-06Z\" fill=\"white\"/>\n                                </mask>\n                                <g mask=\"url(#mask1_47_63)\">\n                                <path d=\"M3.56714 27.2547V28.1348C3.56714 28.9227 4.20587 29.5615 4.9939 29.5615H25.0054C25.7933 29.5615 26.4321 28.9227 26.4321 28.1348V23.8904C26.4321 22.1012 25.2529 20.5261 23.5362 20.0221L21.7134 19.487L14.9996 23.4764L8.28622 19.4872L6.46331 20.0222C4.74646 20.5261 3.56714 22.1013 3.56714 23.8906V25.2003\" stroke=\"white\" stroke-width=\"0.878906\" stroke-miterlimit=\"10\" stroke-linecap=\"round\" stroke-linejoin=\"round\"/>\n                                <path d=\"M21.7133 19.4871L17.6291 16.8194C17.6291 18.5262 17.1336 20.1963 16.2029 21.6269L14.9995 23.4766\" stroke=\"white\" stroke-width=\"0.878906\" stroke-miterlimit=\"10\" stroke-linecap=\"round\" stroke-linejoin=\"round\"/>\n                                <path d=\"M8.28589 19.4871L12.3702 16.8194C12.3702 18.5262 12.8656 20.1963 13.7963 21.6269L14.9997 23.4766\" stroke=\"white\" stroke-width=\"0.878906\" stroke-miterlimit=\"10\" stroke-linecap=\"round\" stroke-linejoin=\"round\"/>\n                                <path d=\"M11.2968 7.40565V8.73256C11.2968 9.26494 10.8652 9.6966 10.3328 9.6966H9.37549V11.273C9.37549 11.6758 9.70203 12.0024 10.1049 12.0024C10.232 12.0024 10.3354 12.1019 10.3434 12.2288C10.4972 14.6673 12.5224 16.5977 14.9996 16.5977C17.4769 16.5977 19.5021 14.6673 19.6559 12.2288C19.664 12.1019 19.7673 12.0024 19.8944 12.0024C20.2972 12.0024 20.6238 11.6758 20.6238 11.273V9.6966H19.6665C19.1341 9.6966 18.7025 9.26494 18.7025 8.73256V7.40565\" stroke=\"white\" stroke-width=\"0.878906\" stroke-miterlimit=\"10\" stroke-linecap=\"round\" stroke-linejoin=\"round\"/>\n                                <path d=\"M12.3682 15.7837V16.8203L12.3701 16.8191\" stroke=\"white\" stroke-width=\"0.878906\" stroke-miterlimit=\"10\" stroke-linecap=\"round\" stroke-linejoin=\"round\"/>\n                                <path d=\"M17.6292 16.8193V15.7851\" stroke=\"white\" stroke-width=\"0.878906\" stroke-miterlimit=\"10\" stroke-linecap=\"round\" stroke-linejoin=\"round\"/>\n                                <path d=\"M17.7716 4.37924L16.0506 4.16631C15.352 4.07994 14.6455 4.07994 13.947 4.16637L10.0603 4.6473L9.01416 4.77674V6.975C9.01416 7.18898 9.1702 7.36611 9.37457 7.39998C9.39771 7.40379 9.42121 7.40625 9.44541 7.40625H20.5539C20.5775 7.40625 20.6004 7.40385 20.6229 7.40027C20.8282 7.36711 20.9853 7.18963 20.9853 6.975V4.77674L19.9371 4.64707L19.8139 4.63189\" stroke=\"white\" stroke-width=\"0.878906\" stroke-miterlimit=\"10\" stroke-linecap=\"round\" stroke-linejoin=\"round\"/>\n                                <path d=\"M20.6228 9.69629V7.39936\" stroke=\"white\" stroke-width=\"0.878906\" stroke-miterlimit=\"10\" stroke-linecap=\"round\" stroke-linejoin=\"round\"/>\n                                <path d=\"M9.37451 7.39906L9.37545 9.69629\" stroke=\"white\" stroke-width=\"0.878906\" stroke-miterlimit=\"10\" stroke-linecap=\"round\" stroke-linejoin=\"round\"/>\n                                <path d=\"M20.984 4.77625L23.9943 4.26355C24.5087 4.17596 24.5588 3.45666 24.0616 3.29857L15.1495 0.463867C15.0513 0.432637 14.9459 0.432637 14.8477 0.463867L5.93555 3.29857C5.43838 3.45666 5.48854 4.17596 6.00288 4.26355L9.01401 4.77637\" stroke=\"white\" stroke-width=\"0.878906\" stroke-miterlimit=\"10\" stroke-linecap=\"round\" stroke-linejoin=\"round\"/>\n                                <path d=\"M5.01803 9.03922L4.4243 12.5241C4.36823 12.8531 4.62165 13.1533 4.9554 13.1533H6.9446C7.27823 13.1533 7.53165 12.8531 7.47563 12.5241L6.88196 9.03922\" stroke=\"white\" stroke-width=\"0.878906\" stroke-miterlimit=\"10\" stroke-linecap=\"round\" stroke-linejoin=\"round\"/>\n                                <path d=\"M6.88199 7.81557C6.88199 7.55559 6.67123 7.34482 6.41125 7.34482H5.48881C5.22883 7.34482 5.01807 7.55559 5.01807 7.81557V9.03906H6.88199V7.81557Z\" stroke=\"white\" stroke-width=\"0.878906\" stroke-miterlimit=\"10\" stroke-linecap=\"round\" stroke-linejoin=\"round\"/>\n                                <path d=\"M17.2406 19.4043C16.5501 19.5564 15.7935 19.6406 14.9996 19.6406C14.2056 19.6406 13.449 19.5564 12.7585 19.4043\" stroke=\"white\" stroke-width=\"0.878906\" stroke-miterlimit=\"10\" stroke-linecap=\"round\" stroke-linejoin=\"round\"/>\n                                </g>\n                                </g>\n                                <defs>\n                                <clipPath id=\"clip0_47_63\">\n                                <rect width=\"30\" height=\"30\" fill=\"white\"/>\n                                </clipPath>\n                                </defs>\n                                </svg>\n                            </span>\n                            <div class=\"b-text\">\n                                <h5>250k +</h5>\n                                <p>Students has Enrolled</p>\n                            </div>\n                        </div>\n                    </div>\n                </span>\n            </div>\n        </div>\n    </div>\n</section>', '', '2024-08-27 04:48:22', '2024-08-27 04:48:22'),
(4, 'features', 'Features', '<section class=\"performance-wrapper section-padding\">\n    <div class=\"container\">\n        <div class=\"pr-wrap\">\n            <div class=\"row\">\n                <div class=\"col-lg-3 col-md-6 col-sm-6  ps-border\">\n                    <div class=\"ps-single-wrap\">\n                        <span class=\"builder_image parent\" content_type=\"image\" id=\"placeholder_id\">\n                            <img src=\"/assets/page-builder/block-image/p1.png\" alt=\"...\">\n                        </span>\n                        <h4>\n                            <span class=\"builder_text parent\" content_type=\"text\" id=\"placeholder_id\">\n                                Fast Performance\n                            </span>\n                        </h4>\n\n                        <p class=\"description\">\n                            <span class=\"builder_text parent\" content_type=\"text\" id=\"placeholder_id\">\n                                It is a long established fact that a reader will be distracted.</span>\n                        </p>\n                    </div>\n                </div>\n                <div class=\"col-lg-3 col-md-6 col-sm-6 ps-border\">\n                    <div class=\"ps-single-wrap\">\n                        <span class=\"builder_image parent\" content_type=\"image\" id=\"placeholder_id\">\n                            <img src=\"/assets/page-builder/block-image/p2.png\" alt=\"...\">\n                        </span>\n                        <h4>\n                            <span class=\"builder_text parent\" content_type=\"text\" id=\"placeholder_id\">\n                                Perfect Responsive\n                            </span>\n                        </h4>\n                        <p class=\"description\">\n                            <span class=\"builder_text parent\" content_type=\"text\" id=\"placeholder_id\">\n                                It is a long established fact that a reader will be distracted.\n                            </span>\n                        </p>\n                    </div>\n                </div>\n                <div class=\"col-lg-3 col-md-6 col-sm-6 ps-border\">\n                    <div class=\"ps-single-wrap\">\n                        <span class=\"builder_image parent\" content_type=\"image\" id=\"placeholder_id\">\n                            <img src=\"/assets/page-builder/block-image/p3.png\" alt=\"...\">\n                        </span>\n                        <h4>\n                            <span class=\"builder_text parent\" content_type=\"text\" id=\"placeholder_id\">\n                                Fast & Friendly Support\n                            </span>\n                        </h4>\n                        <p class=\"description\">\n                            <span class=\"builder_text parent\" content_type=\"text\" id=\"placeholder_id\">\n                                It is a long established fact that a reader will be distracted.\n                            </span>\n                        </p>\n                    </div>\n                </div>\n                <div class=\"col-lg-3 col-md-6 col-sm-6 ps-border\">\n                    <div class=\"ps-single-wrap\">\n                        <span class=\"builder_image parent\" content_type=\"image\" id=\"placeholder_id\">\n                            <img src=\"/assets/page-builder/block-image/p4.png\" alt=\"...\">\n                        </span>\n                        <h4>\n                            <span class=\"builder_text parent\" content_type=\"text\" id=\"placeholder_id\">\n                                Easy to Use\n                            </span>\n                        </h4>\n                        <p class=\"description\">\n                            <span class=\"builder_text parent\" content_type=\"text\" id=\"placeholder_id\">\n                                It is a long established fact that a reader will be distracted.\n                            </span>\n                        </p>\n                    </div>\n                </div>\n            </div>\n        </div>\n    </div>\n</section>', '', '2024-08-27 04:48:22', '2024-08-27 04:48:22');
INSERT INTO `builder_blocks` (`id`, `identifier`, `title`, `html`, `thumbnail`, `created_at`, `updated_at`) VALUES
(5, 'category', 'Category', '<section class=\"category-wrapper section-padding\">\n    <div class=\"container\">\n        <div class=\"row\">\n            <div class=\"col-lg-12\">\n                <div class=\"section-title text-center\">\n                    <span class=\"title-head builder_text parent\" content_type=\"text\" id=\"placeholder_id\">Categories</span>\n                    <h2 class=\"title builder_text parent\" content_type=\"text\" id=\"placeholder_id\">Explore Top Courses Caterories</h2>\n                </div>\n            </div>\n        </div>\n        <span class=\"category\">\n            <div class=\"row\">\n                <div class=\"col-lg-3 col-md-4 col-sm-6 mb-30\">\n                    <a href=\"#\" class=\"single-category\">\n                        <span>\n                            <img src=\"/assets/page-builder/block-image/image 36.svg\" alt=\"\">\n                        </span>\n                        <h4>Web Design</h4>\n                        <p>04 Courses</p>\n                    </a>\n                </div>\n                <div class=\"col-lg-3 col-md-4 col-sm-6 mb-30\">\n                    <a href=\"#\" class=\"single-category\">\n                        <span>\n                        <img src=\"/assets/page-builder/block-image/image 37.svg\" alt=\"\">\n                        </span>\n                        <h4>Graphic Design</h4>\n                        <p>12 Courses</p>\n                    </a>\n                </div>\n                <div class=\"col-lg-3 col-md-4 col-sm-6 mb-30\">\n                    <a href=\"#\" class=\"single-category\">\n                        <span>\n                        <img src=\"/assets/page-builder/block-image/image 38.svg\" alt=\"\">\n                        </span>\n                        <h4>Web Development</h4>\n                        <p>10 Courses</p>\n                    </a>\n                </div>\n                <div class=\"col-lg-3 col-md-4 col-sm-6 mb-30\">\n                    <a href=\"#\" class=\"single-category\">\n                        <span>\n                        <img src=\"/assets/page-builder/block-image/image 39.svg\" alt=\"\">   \n                        </span>\n                        <h4>Digital Marketing</h4>\n                        <p>11 Courses</p>\n                    </a>\n                </div>\n                <div class=\"col-lg-3 col-md-4 col-sm-6 mb-30\">\n                    <a href=\"#\" class=\"single-category\">\n                        <span>\n                        <img src=\"/assets/page-builder/block-image/image 40.svg\" alt=\"\">   \n                        </span>\n                        <h4>Art & Humanities</h4>\n                        <p>9 Courses</p>\n                    </a>\n                </div>\n                <div class=\"col-lg-3 col-md-4 col-sm-6 mb-30\">\n                    <a href=\"#\" class=\"single-category\">\n                        <span>  \n                            <img src=\"/assets/page-builder/block-image/image 41.svg\" alt=\"\">  \n                        </span>\n                        <h4>Color Theory</h4>\n                        <p>10 Courses</p>\n                    </a>\n                </div>\n                <div class=\"col-lg-3 col-md-4 col-sm-6 mb-30\">\n                    <a href=\"#\" class=\"single-category\">\n                        <span>\n                            <img src=\"/assets/page-builder/block-image/image 42.svg\" alt=\"...\">   \n                        </span>\n                        <h4>Motion Graphic</h4>\n                        <p>8 Courses</p>\n                    </a>\n                </div>\n                <div class=\"col-lg-3 col-md-4 col-sm-6 mb-30\">\n                    <a href=\"#\" class=\"single-category\">\n                        <span>\n                            <img src=\"/assets/page-builder/block-image/image 43.svg\" alt=\"...\">    \n                        </span>\n                        <h4>Blander 3D</h4>\n                        <p>12 Courses</p>\n                    </a>\n                </div>\n            </div>\n        </span>\n    </div>\n</section>', '', '2024-08-27 04:48:22', '2024-08-27 04:48:22'),
(6, 'featured-course', 'featured course', '<section class=\"feature-wrapper section-padding\">\n    <div class=\"container\">\n        <div class=\"row\">\n            <div class=\"col-lg-12\">\n                <div class=\"res-control d-flex align-items-center justify-content-between\">\n                    <div class=\"section-title mb-0\">\n                        <span class=\"title-head builder_text parent\" content_type=\"text\"\n                            id=\"placeholder_id\">Courses</span>\n                        <h2 class=\"title builder_text parent\" content_type=\"text\" id=\"placeholder_id\">Featured Courses\n                        </h2>\n                    </div>\n                    <span class=\"featured-course-all-button\">\n                        <a href=\"#\" class=\"eBtn gradient\">View All Courses</a>\n                    </span>\n                </div>\n            </div>\n        </div>\n        <span class=\"featured-course\">\n            <div class=\"row mt-50\">\n                <div class=\"col-lg-6 col-md-12 col-sm-6 mb-30\">\n                    <a href=\"#\" class=\"single-feature\">\n                        <div class=\"row\">\n                            <div class=\"col-lg-4 col-md-4\">\n                                <div class=\"courses-img\">\n                                    <img src=\"/assets/page-builder/block-image/course-1.png\"\n                                        alt=\"...\">\n                                    <div class=\"cText d-flex\">\n                                        <h4>$60.00</h4>\n                                        <del>$30.00</del>\n                                    </div>\n                                </div>\n                            </div>\n                            <div class=\"col-lg-8 col-md-8\">\n                                <div class=\"entry-details\">\n                                    <div class=\"entry-title\">\n                                        <h3>Complete Blender Creator : Learn 3D Modelling</h3>\n                                        <span class=\"heart\"><i class=\"fa-regular fa-heart\"></i></span>\n                                    </div>\n                                    <ul>\n                                        <li>\n                                            <svg width=\"20\" height=\"20\" viewBox=\"0 0 20 20\" fill=\"none\"\n                                                xmlns=\"http://www.w3.org/2000/svg\">\n                                                <path\n                                                    d=\"M12.6521 9.54004L14.8477 8.27081C14.9758 8.19549 15.0399 8.08879 15.0399 7.95071C15.0399 7.81263 14.9758 7.70458 14.8477 7.62658L12.6521 6.35735C12.5395 6.29326 12.4144 6.26121 12.2768 6.26121C12.1392 6.26121 12.0133 6.29326 11.8989 6.35735L9.70344 7.62658C9.57523 7.7019 9.51113 7.8086 9.51113 7.94669C9.51113 8.08479 9.57523 8.19283 9.70344 8.27081L11.8989 9.54004C12.0115 9.60414 12.1366 9.63619 12.2743 9.63619C12.4119 9.63619 12.5378 9.60414 12.6521 9.54004ZM12.6521 11.9968L14.1265 11.1554C14.2395 11.0928 14.3305 11.0021 14.3995 10.8832C14.4686 10.7643 14.5031 10.636 14.5031 10.4984V9.32371L12.6521 10.399C12.5392 10.4685 12.4136 10.5032 12.2755 10.5032C12.1374 10.5032 12.0119 10.4685 11.8989 10.399L10.048 9.32371V10.4984C10.048 10.636 10.0825 10.7643 10.1515 10.8832C10.2206 11.0021 10.3116 11.0928 10.4246 11.1554L11.8989 11.9968C12.0115 12.0609 12.1366 12.0929 12.2743 12.0929C12.4119 12.0929 12.5378 12.0609 12.6521 11.9968ZM16.4101 16.25H12.2755C12.2755 16.0416 12.2684 15.8333 12.2543 15.625C12.2401 15.4166 12.2189 15.2083 12.1906 15H16.4101C16.4849 15 16.5464 14.9759 16.5944 14.9279C16.6425 14.8798 16.6666 14.8183 16.6666 14.7435V5.25642C16.6666 5.18163 16.6425 5.12019 16.5944 5.0721C16.5464 5.02402 16.4849 4.99998 16.4101 4.99998H3.58967C3.51488 4.99998 3.45344 5.02402 3.40536 5.0721C3.35727 5.12019 3.33323 5.18163 3.33323 5.25642V6.14263C3.1249 6.11431 2.91657 6.09307 2.70825 6.07892C2.49992 6.06476 2.29159 6.05769 2.08325 6.05769V5.25642C2.08325 4.84215 2.23076 4.48752 2.52577 4.19252C2.82077 3.89751 3.17541 3.75 3.58967 3.75H16.4101C16.8244 3.75 17.179 3.89751 17.474 4.19252C17.769 4.48752 17.9165 4.84215 17.9165 5.25642V14.7435C17.9165 15.1578 17.769 15.5124 17.474 15.8074C17.179 16.1025 16.8244 16.25 16.4101 16.25ZM6.58498 16.25C6.41715 16.25 6.27127 16.1973 6.14734 16.0921C6.02341 15.9869 5.94595 15.8498 5.91498 15.681C5.79425 14.8274 5.42592 14.1017 4.81 13.504C4.19409 12.9062 3.45664 12.5443 2.59767 12.4182C2.43692 12.3974 2.31099 12.3219 2.2199 12.1917C2.1288 12.0615 2.08325 11.913 2.08325 11.7464C2.08325 11.5693 2.14362 11.4209 2.26436 11.3013C2.38508 11.1816 2.52556 11.133 2.68581 11.1555C3.8685 11.2901 4.87623 11.7759 5.70902 12.613C6.54181 13.45 7.02712 14.4599 7.16494 15.6426C7.18737 15.8114 7.1409 15.9548 7.02552 16.0729C6.91013 16.1909 6.76329 16.25 6.58498 16.25ZM9.82361 16.25C9.64091 16.25 9.49107 16.1869 9.37409 16.0609C9.25711 15.9348 9.18741 15.7777 9.16496 15.5897C9.00257 13.86 8.31027 12.3918 7.08804 11.1851C5.86582 9.97834 4.3872 9.3034 2.65217 9.16023C2.48336 9.14313 2.34634 9.07206 2.24111 8.94702C2.13587 8.82197 2.08325 8.67607 2.08325 8.50933C2.08325 8.33217 2.14148 8.18162 2.25794 8.05769C2.37438 7.93377 2.5154 7.88035 2.681 7.89744C4.7622 8.0406 6.53275 8.84135 7.99267 10.2997C9.4526 11.758 10.2627 13.5235 10.4229 15.5961C10.44 15.7788 10.3887 15.9334 10.2689 16.06C10.1491 16.1867 10.0007 16.25 9.82361 16.25ZM2.93215 16.25C2.6942 16.25 2.49324 16.1678 2.32925 16.0035C2.16525 15.8392 2.08325 15.6381 2.08325 15.4001C2.08325 15.1622 2.1654 14.9612 2.32971 14.7972C2.494 14.6332 2.69512 14.5512 2.93306 14.5512C3.17101 14.5512 3.37197 14.6334 3.53596 14.7977C3.69996 14.962 3.78196 15.1631 3.78196 15.4011C3.78196 15.639 3.69981 15.84 3.5355 16.004C3.37121 16.168 3.17009 16.25 2.93215 16.25Z\"\n                                                    fill=\"#6B7385\" />\n                                            </svg>\n                                            12 lesson\n                                        </li>\n                                        <li>\n                                            <svg width=\"20\" height=\"20\" viewBox=\"0 0 20 20\" fill=\"none\"\n                                                xmlns=\"http://www.w3.org/2000/svg\">\n                                                <path\n                                                    d=\"M2.25174 16.0896C2.03834 16.0896 1.85945 16.0174 1.71508 15.873C1.57072 15.7287 1.49854 15.5498 1.49854 15.3364V14.237C1.49854 13.8075 1.60938 13.4243 1.83108 13.0872C2.05276 12.7501 2.34881 12.4879 2.71924 12.3005C3.5112 11.9131 4.30755 11.6145 5.10828 11.4045C5.90904 11.1946 6.78911 11.0896 7.74852 11.0896C8.70792 11.0896 9.58799 11.1946 10.3887 11.4045C11.1895 11.6145 11.9858 11.9131 12.7778 12.3005C13.1482 12.4879 13.4443 12.7501 13.666 13.0872C13.8876 13.4243 13.9985 13.8075 13.9985 14.237V15.3364C13.9985 15.5498 13.9263 15.7287 13.7819 15.873C13.6376 16.0174 13.4587 16.0896 13.2453 16.0896H2.25174ZM15.3414 16.0896C15.4437 16.0024 15.5232 15.8934 15.58 15.7626C15.6367 15.6318 15.6651 15.4855 15.6651 15.3236V14.1345C15.6651 13.5875 15.5312 13.0662 15.2633 12.5705C14.9955 12.0749 14.6155 11.6497 14.1235 11.2948C14.6823 11.3781 15.2127 11.5071 15.7148 11.6818C16.217 11.8565 16.6961 12.0629 17.1523 12.3012C17.5829 12.5309 17.9154 12.8016 18.1499 13.1133C18.3844 13.4251 18.5017 13.7655 18.5017 14.1345V15.3364C18.5017 15.5498 18.4295 15.7287 18.2851 15.873C18.1407 16.0174 17.9619 16.0896 17.7485 16.0896H15.3414ZM7.74852 9.74343C6.94645 9.74343 6.25982 9.45784 5.68864 8.88668C5.11746 8.3155 4.83187 7.62887 4.83187 6.8268C4.83187 6.02472 5.11746 5.33809 5.68864 4.76693C6.25982 4.19575 6.94645 3.91016 7.74852 3.91016C8.55058 3.91016 9.23721 4.19575 9.80839 4.76693C10.3796 5.33809 10.6651 6.02472 10.6651 6.8268C10.6651 7.62887 10.3796 8.3155 9.80839 8.88668C9.23721 9.45784 8.55058 9.74343 7.74852 9.74343ZM14.944 6.8268C14.944 7.62887 14.6584 8.3155 14.0872 8.88668C13.516 9.45784 12.8294 9.74343 12.0273 9.74343C11.9333 9.74343 11.8136 9.73275 11.6683 9.71139C11.5231 9.69003 11.4034 9.66653 11.3094 9.64089C11.638 9.24579 11.8906 8.80748 12.0671 8.32595C12.2436 7.84442 12.3318 7.34437 12.3318 6.8258C12.3318 6.30725 12.2418 5.80918 12.0618 5.33162C11.8818 4.85406 11.631 4.41443 11.3094 4.01272C11.429 3.96998 11.5487 3.94221 11.6683 3.92939C11.788 3.91657 11.9077 3.91016 12.0273 3.91016C12.8294 3.91016 13.516 4.19575 14.0872 4.76693C14.6584 5.33809 14.944 6.02472 14.944 6.8268ZM2.74851 14.8396H12.7485V14.237C12.7485 14.0629 12.705 13.908 12.6179 13.7723C12.5308 13.6366 12.3927 13.518 12.2036 13.4165C11.5177 13.0629 10.8115 12.795 10.0851 12.6128C9.35856 12.4307 8.57971 12.3396 7.74852 12.3396C6.91732 12.3396 6.13847 12.4307 5.41197 12.6128C4.68549 12.795 3.97929 13.0629 3.29339 13.4165C3.10429 13.518 2.9662 13.6366 2.87912 13.7723C2.79205 13.908 2.74851 14.0629 2.74851 14.237V14.8396ZM7.74852 8.49347C8.20685 8.49347 8.59921 8.33028 8.9256 8.00389C9.25199 7.6775 9.41518 7.28514 9.41518 6.8268C9.41518 6.36847 9.25199 5.97611 8.9256 5.64972C8.59921 5.32333 8.20685 5.16014 7.74852 5.16014C7.29018 5.16014 6.89782 5.32333 6.57143 5.64972C6.24504 5.97611 6.08185 6.36847 6.08185 6.8268C6.08185 7.28514 6.24504 7.6775 6.57143 8.00389C6.89782 8.33028 7.29018 8.49347 7.74852 8.49347Z\"\n                                                    fill=\"#6B7385\" />\n                                            </svg>\n                                            50 Students\n                                        </li>\n                                    </ul>\n                                    <p class=\"description\">It is a long established fact that a reader will be\n                                        distracted by the readable...</p>\n                                    <div class=\"creator\">\n                                        <img src=\"/assets/page-builder/block-image/profile.png\"\n                                            alt=\"...\">\n                                        <p>by <span>Angelina Ross</span> in <span>Design</span></p>\n                                    </div>\n                                </div>\n                            </div>\n                        </div>\n                    </a>\n                </div>\n                <div class=\"col-lg-6 col-md-12 col-sm-6 mb-30\">\n                    <a href=\"#\" class=\"single-feature\">\n                        <div class=\"row\">\n                            <div class=\"col-lg-4 col-md-4\">\n                                <div class=\"courses-img\">\n                                    <img src=\"/assets/page-builder/block-image/course-2.png\"\n                                        alt=\"...\">\n                                    <div class=\"cText d-flex\">\n                                        <h4>$60.00</h4>\n                                        <del>$30.00</del>\n                                    </div>\n                                </div>\n                            </div>\n                            <div class=\"col-lg-8 col-md-8\">\n                                <div class=\"entry-details\">\n                                    <div class=\"entry-title\">\n                                        <h3>The Complete Digital Marketing Guide</h3>\n                                        <span class=\"heart\"><i class=\"fa-regular fa-heart\"></i></span>\n                                    </div>\n                                    <ul>\n                                        <li>\n                                            <svg width=\"20\" height=\"20\" viewBox=\"0 0 20 20\" fill=\"none\"\n                                                xmlns=\"http://www.w3.org/2000/svg\">\n                                                <path\n                                                    d=\"M12.6521 9.54004L14.8477 8.27081C14.9758 8.19549 15.0399 8.08879 15.0399 7.95071C15.0399 7.81263 14.9758 7.70458 14.8477 7.62658L12.6521 6.35735C12.5395 6.29326 12.4144 6.26121 12.2768 6.26121C12.1392 6.26121 12.0133 6.29326 11.8989 6.35735L9.70344 7.62658C9.57523 7.7019 9.51113 7.8086 9.51113 7.94669C9.51113 8.08479 9.57523 8.19283 9.70344 8.27081L11.8989 9.54004C12.0115 9.60414 12.1366 9.63619 12.2743 9.63619C12.4119 9.63619 12.5378 9.60414 12.6521 9.54004ZM12.6521 11.9968L14.1265 11.1554C14.2395 11.0928 14.3305 11.0021 14.3995 10.8832C14.4686 10.7643 14.5031 10.636 14.5031 10.4984V9.32371L12.6521 10.399C12.5392 10.4685 12.4136 10.5032 12.2755 10.5032C12.1374 10.5032 12.0119 10.4685 11.8989 10.399L10.048 9.32371V10.4984C10.048 10.636 10.0825 10.7643 10.1515 10.8832C10.2206 11.0021 10.3116 11.0928 10.4246 11.1554L11.8989 11.9968C12.0115 12.0609 12.1366 12.0929 12.2743 12.0929C12.4119 12.0929 12.5378 12.0609 12.6521 11.9968ZM16.4101 16.25H12.2755C12.2755 16.0416 12.2684 15.8333 12.2543 15.625C12.2401 15.4166 12.2189 15.2083 12.1906 15H16.4101C16.4849 15 16.5464 14.9759 16.5944 14.9279C16.6425 14.8798 16.6666 14.8183 16.6666 14.7435V5.25642C16.6666 5.18163 16.6425 5.12019 16.5944 5.0721C16.5464 5.02402 16.4849 4.99998 16.4101 4.99998H3.58967C3.51488 4.99998 3.45344 5.02402 3.40536 5.0721C3.35727 5.12019 3.33323 5.18163 3.33323 5.25642V6.14263C3.1249 6.11431 2.91657 6.09307 2.70825 6.07892C2.49992 6.06476 2.29159 6.05769 2.08325 6.05769V5.25642C2.08325 4.84215 2.23076 4.48752 2.52577 4.19252C2.82077 3.89751 3.17541 3.75 3.58967 3.75H16.4101C16.8244 3.75 17.179 3.89751 17.474 4.19252C17.769 4.48752 17.9165 4.84215 17.9165 5.25642V14.7435C17.9165 15.1578 17.769 15.5124 17.474 15.8074C17.179 16.1025 16.8244 16.25 16.4101 16.25ZM6.58498 16.25C6.41715 16.25 6.27127 16.1973 6.14734 16.0921C6.02341 15.9869 5.94595 15.8498 5.91498 15.681C5.79425 14.8274 5.42592 14.1017 4.81 13.504C4.19409 12.9062 3.45664 12.5443 2.59767 12.4182C2.43692 12.3974 2.31099 12.3219 2.2199 12.1917C2.1288 12.0615 2.08325 11.913 2.08325 11.7464C2.08325 11.5693 2.14362 11.4209 2.26436 11.3013C2.38508 11.1816 2.52556 11.133 2.68581 11.1555C3.8685 11.2901 4.87623 11.7759 5.70902 12.613C6.54181 13.45 7.02712 14.4599 7.16494 15.6426C7.18737 15.8114 7.1409 15.9548 7.02552 16.0729C6.91013 16.1909 6.76329 16.25 6.58498 16.25ZM9.82361 16.25C9.64091 16.25 9.49107 16.1869 9.37409 16.0609C9.25711 15.9348 9.18741 15.7777 9.16496 15.5897C9.00257 13.86 8.31027 12.3918 7.08804 11.1851C5.86582 9.97834 4.3872 9.3034 2.65217 9.16023C2.48336 9.14313 2.34634 9.07206 2.24111 8.94702C2.13587 8.82197 2.08325 8.67607 2.08325 8.50933C2.08325 8.33217 2.14148 8.18162 2.25794 8.05769C2.37438 7.93377 2.5154 7.88035 2.681 7.89744C4.7622 8.0406 6.53275 8.84135 7.99267 10.2997C9.4526 11.758 10.2627 13.5235 10.4229 15.5961C10.44 15.7788 10.3887 15.9334 10.2689 16.06C10.1491 16.1867 10.0007 16.25 9.82361 16.25ZM2.93215 16.25C2.6942 16.25 2.49324 16.1678 2.32925 16.0035C2.16525 15.8392 2.08325 15.6381 2.08325 15.4001C2.08325 15.1622 2.1654 14.9612 2.32971 14.7972C2.494 14.6332 2.69512 14.5512 2.93306 14.5512C3.17101 14.5512 3.37197 14.6334 3.53596 14.7977C3.69996 14.962 3.78196 15.1631 3.78196 15.4011C3.78196 15.639 3.69981 15.84 3.5355 16.004C3.37121 16.168 3.17009 16.25 2.93215 16.25Z\"\n                                                    fill=\"#6B7385\" />\n                                            </svg>\n                                            12 lesson\n                                        </li>\n                                        <li>\n                                            <svg width=\"20\" height=\"20\" viewBox=\"0 0 20 20\" fill=\"none\"\n                                                xmlns=\"http://www.w3.org/2000/svg\">\n                                                <path\n                                                    d=\"M2.25174 16.0896C2.03834 16.0896 1.85945 16.0174 1.71508 15.873C1.57072 15.7287 1.49854 15.5498 1.49854 15.3364V14.237C1.49854 13.8075 1.60938 13.4243 1.83108 13.0872C2.05276 12.7501 2.34881 12.4879 2.71924 12.3005C3.5112 11.9131 4.30755 11.6145 5.10828 11.4045C5.90904 11.1946 6.78911 11.0896 7.74852 11.0896C8.70792 11.0896 9.58799 11.1946 10.3887 11.4045C11.1895 11.6145 11.9858 11.9131 12.7778 12.3005C13.1482 12.4879 13.4443 12.7501 13.666 13.0872C13.8876 13.4243 13.9985 13.8075 13.9985 14.237V15.3364C13.9985 15.5498 13.9263 15.7287 13.7819 15.873C13.6376 16.0174 13.4587 16.0896 13.2453 16.0896H2.25174ZM15.3414 16.0896C15.4437 16.0024 15.5232 15.8934 15.58 15.7626C15.6367 15.6318 15.6651 15.4855 15.6651 15.3236V14.1345C15.6651 13.5875 15.5312 13.0662 15.2633 12.5705C14.9955 12.0749 14.6155 11.6497 14.1235 11.2948C14.6823 11.3781 15.2127 11.5071 15.7148 11.6818C16.217 11.8565 16.6961 12.0629 17.1523 12.3012C17.5829 12.5309 17.9154 12.8016 18.1499 13.1133C18.3844 13.4251 18.5017 13.7655 18.5017 14.1345V15.3364C18.5017 15.5498 18.4295 15.7287 18.2851 15.873C18.1407 16.0174 17.9619 16.0896 17.7485 16.0896H15.3414ZM7.74852 9.74343C6.94645 9.74343 6.25982 9.45784 5.68864 8.88668C5.11746 8.3155 4.83187 7.62887 4.83187 6.8268C4.83187 6.02472 5.11746 5.33809 5.68864 4.76693C6.25982 4.19575 6.94645 3.91016 7.74852 3.91016C8.55058 3.91016 9.23721 4.19575 9.80839 4.76693C10.3796 5.33809 10.6651 6.02472 10.6651 6.8268C10.6651 7.62887 10.3796 8.3155 9.80839 8.88668C9.23721 9.45784 8.55058 9.74343 7.74852 9.74343ZM14.944 6.8268C14.944 7.62887 14.6584 8.3155 14.0872 8.88668C13.516 9.45784 12.8294 9.74343 12.0273 9.74343C11.9333 9.74343 11.8136 9.73275 11.6683 9.71139C11.5231 9.69003 11.4034 9.66653 11.3094 9.64089C11.638 9.24579 11.8906 8.80748 12.0671 8.32595C12.2436 7.84442 12.3318 7.34437 12.3318 6.8258C12.3318 6.30725 12.2418 5.80918 12.0618 5.33162C11.8818 4.85406 11.631 4.41443 11.3094 4.01272C11.429 3.96998 11.5487 3.94221 11.6683 3.92939C11.788 3.91657 11.9077 3.91016 12.0273 3.91016C12.8294 3.91016 13.516 4.19575 14.0872 4.76693C14.6584 5.33809 14.944 6.02472 14.944 6.8268ZM2.74851 14.8396H12.7485V14.237C12.7485 14.0629 12.705 13.908 12.6179 13.7723C12.5308 13.6366 12.3927 13.518 12.2036 13.4165C11.5177 13.0629 10.8115 12.795 10.0851 12.6128C9.35856 12.4307 8.57971 12.3396 7.74852 12.3396C6.91732 12.3396 6.13847 12.4307 5.41197 12.6128C4.68549 12.795 3.97929 13.0629 3.29339 13.4165C3.10429 13.518 2.9662 13.6366 2.87912 13.7723C2.79205 13.908 2.74851 14.0629 2.74851 14.237V14.8396ZM7.74852 8.49347C8.20685 8.49347 8.59921 8.33028 8.9256 8.00389C9.25199 7.6775 9.41518 7.28514 9.41518 6.8268C9.41518 6.36847 9.25199 5.97611 8.9256 5.64972C8.59921 5.32333 8.20685 5.16014 7.74852 5.16014C7.29018 5.16014 6.89782 5.32333 6.57143 5.64972C6.24504 5.97611 6.08185 6.36847 6.08185 6.8268C6.08185 7.28514 6.24504 7.6775 6.57143 8.00389C6.89782 8.33028 7.29018 8.49347 7.74852 8.49347Z\"\n                                                    fill=\"#6B7385\" />\n                                            </svg>\n                                            50 Students\n                                        </li>\n                                    </ul>\n                                    <p class=\"description\">It is a long established fact that a reader will be\n                                        distracted by the readable...</p>\n                                    <div class=\"creator\">\n                                        <img src=\"/assets/page-builder/block-image/profile.png\"\n                                            alt=\"...\">\n                                        <p>by <span>Angelina Ross</span> in <span>Design</span></p>\n                                    </div>\n                                </div>\n                            </div>\n                        </div>\n                    </a>\n                </div>\n                <div class=\"col-lg-6 col-md-12 col-sm-6 mb-30\">\n                    <a href=\"#\" class=\"single-feature\">\n                        <div class=\"row\">\n                            <div class=\"col-lg-4 col-md-4\">\n                                <div class=\"courses-img\">\n                                    <img src=\"/assets/page-builder/block-image/course-3.png\"\n                                        alt=\"...\">\n                                    <div class=\"cText d-flex\">\n                                        <h4>$60.00</h4>\n                                        <del>$30.00</del>\n                                    </div>\n                                </div>\n                            </div>\n                            <div class=\"col-lg-8 col-md-8\">\n                                <div class=\"entry-details\">\n                                    <div class=\"entry-title\">\n                                        <h3>After Effect 2023 Complete Course</h3>\n                                        <span class=\"heart\"><i class=\"fa-regular fa-heart\"></i></span>\n                                    </div>\n                                    <ul>\n                                        <li>\n                                            <svg width=\"20\" height=\"20\" viewBox=\"0 0 20 20\" fill=\"none\"\n                                                xmlns=\"http://www.w3.org/2000/svg\">\n                                                <path\n                                                    d=\"M12.6521 9.54004L14.8477 8.27081C14.9758 8.19549 15.0399 8.08879 15.0399 7.95071C15.0399 7.81263 14.9758 7.70458 14.8477 7.62658L12.6521 6.35735C12.5395 6.29326 12.4144 6.26121 12.2768 6.26121C12.1392 6.26121 12.0133 6.29326 11.8989 6.35735L9.70344 7.62658C9.57523 7.7019 9.51113 7.8086 9.51113 7.94669C9.51113 8.08479 9.57523 8.19283 9.70344 8.27081L11.8989 9.54004C12.0115 9.60414 12.1366 9.63619 12.2743 9.63619C12.4119 9.63619 12.5378 9.60414 12.6521 9.54004ZM12.6521 11.9968L14.1265 11.1554C14.2395 11.0928 14.3305 11.0021 14.3995 10.8832C14.4686 10.7643 14.5031 10.636 14.5031 10.4984V9.32371L12.6521 10.399C12.5392 10.4685 12.4136 10.5032 12.2755 10.5032C12.1374 10.5032 12.0119 10.4685 11.8989 10.399L10.048 9.32371V10.4984C10.048 10.636 10.0825 10.7643 10.1515 10.8832C10.2206 11.0021 10.3116 11.0928 10.4246 11.1554L11.8989 11.9968C12.0115 12.0609 12.1366 12.0929 12.2743 12.0929C12.4119 12.0929 12.5378 12.0609 12.6521 11.9968ZM16.4101 16.25H12.2755C12.2755 16.0416 12.2684 15.8333 12.2543 15.625C12.2401 15.4166 12.2189 15.2083 12.1906 15H16.4101C16.4849 15 16.5464 14.9759 16.5944 14.9279C16.6425 14.8798 16.6666 14.8183 16.6666 14.7435V5.25642C16.6666 5.18163 16.6425 5.12019 16.5944 5.0721C16.5464 5.02402 16.4849 4.99998 16.4101 4.99998H3.58967C3.51488 4.99998 3.45344 5.02402 3.40536 5.0721C3.35727 5.12019 3.33323 5.18163 3.33323 5.25642V6.14263C3.1249 6.11431 2.91657 6.09307 2.70825 6.07892C2.49992 6.06476 2.29159 6.05769 2.08325 6.05769V5.25642C2.08325 4.84215 2.23076 4.48752 2.52577 4.19252C2.82077 3.89751 3.17541 3.75 3.58967 3.75H16.4101C16.8244 3.75 17.179 3.89751 17.474 4.19252C17.769 4.48752 17.9165 4.84215 17.9165 5.25642V14.7435C17.9165 15.1578 17.769 15.5124 17.474 15.8074C17.179 16.1025 16.8244 16.25 16.4101 16.25ZM6.58498 16.25C6.41715 16.25 6.27127 16.1973 6.14734 16.0921C6.02341 15.9869 5.94595 15.8498 5.91498 15.681C5.79425 14.8274 5.42592 14.1017 4.81 13.504C4.19409 12.9062 3.45664 12.5443 2.59767 12.4182C2.43692 12.3974 2.31099 12.3219 2.2199 12.1917C2.1288 12.0615 2.08325 11.913 2.08325 11.7464C2.08325 11.5693 2.14362 11.4209 2.26436 11.3013C2.38508 11.1816 2.52556 11.133 2.68581 11.1555C3.8685 11.2901 4.87623 11.7759 5.70902 12.613C6.54181 13.45 7.02712 14.4599 7.16494 15.6426C7.18737 15.8114 7.1409 15.9548 7.02552 16.0729C6.91013 16.1909 6.76329 16.25 6.58498 16.25ZM9.82361 16.25C9.64091 16.25 9.49107 16.1869 9.37409 16.0609C9.25711 15.9348 9.18741 15.7777 9.16496 15.5897C9.00257 13.86 8.31027 12.3918 7.08804 11.1851C5.86582 9.97834 4.3872 9.3034 2.65217 9.16023C2.48336 9.14313 2.34634 9.07206 2.24111 8.94702C2.13587 8.82197 2.08325 8.67607 2.08325 8.50933C2.08325 8.33217 2.14148 8.18162 2.25794 8.05769C2.37438 7.93377 2.5154 7.88035 2.681 7.89744C4.7622 8.0406 6.53275 8.84135 7.99267 10.2997C9.4526 11.758 10.2627 13.5235 10.4229 15.5961C10.44 15.7788 10.3887 15.9334 10.2689 16.06C10.1491 16.1867 10.0007 16.25 9.82361 16.25ZM2.93215 16.25C2.6942 16.25 2.49324 16.1678 2.32925 16.0035C2.16525 15.8392 2.08325 15.6381 2.08325 15.4001C2.08325 15.1622 2.1654 14.9612 2.32971 14.7972C2.494 14.6332 2.69512 14.5512 2.93306 14.5512C3.17101 14.5512 3.37197 14.6334 3.53596 14.7977C3.69996 14.962 3.78196 15.1631 3.78196 15.4011C3.78196 15.639 3.69981 15.84 3.5355 16.004C3.37121 16.168 3.17009 16.25 2.93215 16.25Z\"\n                                                    fill=\"#6B7385\" />\n                                            </svg>\n                                            12 lesson\n                                        </li>\n                                        <li>\n                                            <svg width=\"20\" height=\"20\" viewBox=\"0 0 20 20\" fill=\"none\"\n                                                xmlns=\"http://www.w3.org/2000/svg\">\n                                                <path\n                                                    d=\"M2.25174 16.0896C2.03834 16.0896 1.85945 16.0174 1.71508 15.873C1.57072 15.7287 1.49854 15.5498 1.49854 15.3364V14.237C1.49854 13.8075 1.60938 13.4243 1.83108 13.0872C2.05276 12.7501 2.34881 12.4879 2.71924 12.3005C3.5112 11.9131 4.30755 11.6145 5.10828 11.4045C5.90904 11.1946 6.78911 11.0896 7.74852 11.0896C8.70792 11.0896 9.58799 11.1946 10.3887 11.4045C11.1895 11.6145 11.9858 11.9131 12.7778 12.3005C13.1482 12.4879 13.4443 12.7501 13.666 13.0872C13.8876 13.4243 13.9985 13.8075 13.9985 14.237V15.3364C13.9985 15.5498 13.9263 15.7287 13.7819 15.873C13.6376 16.0174 13.4587 16.0896 13.2453 16.0896H2.25174ZM15.3414 16.0896C15.4437 16.0024 15.5232 15.8934 15.58 15.7626C15.6367 15.6318 15.6651 15.4855 15.6651 15.3236V14.1345C15.6651 13.5875 15.5312 13.0662 15.2633 12.5705C14.9955 12.0749 14.6155 11.6497 14.1235 11.2948C14.6823 11.3781 15.2127 11.5071 15.7148 11.6818C16.217 11.8565 16.6961 12.0629 17.1523 12.3012C17.5829 12.5309 17.9154 12.8016 18.1499 13.1133C18.3844 13.4251 18.5017 13.7655 18.5017 14.1345V15.3364C18.5017 15.5498 18.4295 15.7287 18.2851 15.873C18.1407 16.0174 17.9619 16.0896 17.7485 16.0896H15.3414ZM7.74852 9.74343C6.94645 9.74343 6.25982 9.45784 5.68864 8.88668C5.11746 8.3155 4.83187 7.62887 4.83187 6.8268C4.83187 6.02472 5.11746 5.33809 5.68864 4.76693C6.25982 4.19575 6.94645 3.91016 7.74852 3.91016C8.55058 3.91016 9.23721 4.19575 9.80839 4.76693C10.3796 5.33809 10.6651 6.02472 10.6651 6.8268C10.6651 7.62887 10.3796 8.3155 9.80839 8.88668C9.23721 9.45784 8.55058 9.74343 7.74852 9.74343ZM14.944 6.8268C14.944 7.62887 14.6584 8.3155 14.0872 8.88668C13.516 9.45784 12.8294 9.74343 12.0273 9.74343C11.9333 9.74343 11.8136 9.73275 11.6683 9.71139C11.5231 9.69003 11.4034 9.66653 11.3094 9.64089C11.638 9.24579 11.8906 8.80748 12.0671 8.32595C12.2436 7.84442 12.3318 7.34437 12.3318 6.8258C12.3318 6.30725 12.2418 5.80918 12.0618 5.33162C11.8818 4.85406 11.631 4.41443 11.3094 4.01272C11.429 3.96998 11.5487 3.94221 11.6683 3.92939C11.788 3.91657 11.9077 3.91016 12.0273 3.91016C12.8294 3.91016 13.516 4.19575 14.0872 4.76693C14.6584 5.33809 14.944 6.02472 14.944 6.8268ZM2.74851 14.8396H12.7485V14.237C12.7485 14.0629 12.705 13.908 12.6179 13.7723C12.5308 13.6366 12.3927 13.518 12.2036 13.4165C11.5177 13.0629 10.8115 12.795 10.0851 12.6128C9.35856 12.4307 8.57971 12.3396 7.74852 12.3396C6.91732 12.3396 6.13847 12.4307 5.41197 12.6128C4.68549 12.795 3.97929 13.0629 3.29339 13.4165C3.10429 13.518 2.9662 13.6366 2.87912 13.7723C2.79205 13.908 2.74851 14.0629 2.74851 14.237V14.8396ZM7.74852 8.49347C8.20685 8.49347 8.59921 8.33028 8.9256 8.00389C9.25199 7.6775 9.41518 7.28514 9.41518 6.8268C9.41518 6.36847 9.25199 5.97611 8.9256 5.64972C8.59921 5.32333 8.20685 5.16014 7.74852 5.16014C7.29018 5.16014 6.89782 5.32333 6.57143 5.64972C6.24504 5.97611 6.08185 6.36847 6.08185 6.8268C6.08185 7.28514 6.24504 7.6775 6.57143 8.00389C6.89782 8.33028 7.29018 8.49347 7.74852 8.49347Z\"\n                                                    fill=\"#6B7385\" />\n                                            </svg>\n                                            50 Students\n                                        </li>\n                                    </ul>\n                                    <p class=\"description\">It is a long established fact that a reader will be\n                                        distracted by the readable...</p>\n                                    <div class=\"creator\">\n                                        <img src=\"/assets/page-builder/block-image/profile.png\"\n                                            alt=\"...\">\n                                        <p>by <span>Angelina Ross</span> in <span>Design</span></p>\n                                    </div>\n                                </div>\n                            </div>\n                        </div>\n                    </a>\n                </div>\n                <div class=\"col-lg-6 col-md-12 col-sm-6 mb-30\">\n                    <a href=\"#\" class=\"single-feature\">\n                        <div class=\"row\">\n                            <div class=\"col-lg-4 col-md-4\">\n                                <div class=\"courses-img\">\n                                    <img src=\"/assets/page-builder/block-image/course-4.png\"\n                                        alt=\"...\">\n                                    <div class=\"cText d-flex\">\n                                        <h4>$60.00</h4>\n                                        <del>$30.00</del>\n                                    </div>\n                                </div>\n                            </div>\n                            <div class=\"col-lg-8 col-md-8\">\n                                <div class=\"entry-details\">\n                                    <div class=\"entry-title\">\n                                        <h3>The Complete Graphic Design Theory</h3>\n                                        <span class=\"heart\"><i class=\"fa-regular fa-heart\"></i></span>\n                                    </div>\n                                    <ul>\n                                        <li>\n                                            <svg width=\"20\" height=\"20\" viewBox=\"0 0 20 20\" fill=\"none\"\n                                                xmlns=\"http://www.w3.org/2000/svg\">\n                                                <path\n                                                    d=\"M12.6521 9.54004L14.8477 8.27081C14.9758 8.19549 15.0399 8.08879 15.0399 7.95071C15.0399 7.81263 14.9758 7.70458 14.8477 7.62658L12.6521 6.35735C12.5395 6.29326 12.4144 6.26121 12.2768 6.26121C12.1392 6.26121 12.0133 6.29326 11.8989 6.35735L9.70344 7.62658C9.57523 7.7019 9.51113 7.8086 9.51113 7.94669C9.51113 8.08479 9.57523 8.19283 9.70344 8.27081L11.8989 9.54004C12.0115 9.60414 12.1366 9.63619 12.2743 9.63619C12.4119 9.63619 12.5378 9.60414 12.6521 9.54004ZM12.6521 11.9968L14.1265 11.1554C14.2395 11.0928 14.3305 11.0021 14.3995 10.8832C14.4686 10.7643 14.5031 10.636 14.5031 10.4984V9.32371L12.6521 10.399C12.5392 10.4685 12.4136 10.5032 12.2755 10.5032C12.1374 10.5032 12.0119 10.4685 11.8989 10.399L10.048 9.32371V10.4984C10.048 10.636 10.0825 10.7643 10.1515 10.8832C10.2206 11.0021 10.3116 11.0928 10.4246 11.1554L11.8989 11.9968C12.0115 12.0609 12.1366 12.0929 12.2743 12.0929C12.4119 12.0929 12.5378 12.0609 12.6521 11.9968ZM16.4101 16.25H12.2755C12.2755 16.0416 12.2684 15.8333 12.2543 15.625C12.2401 15.4166 12.2189 15.2083 12.1906 15H16.4101C16.4849 15 16.5464 14.9759 16.5944 14.9279C16.6425 14.8798 16.6666 14.8183 16.6666 14.7435V5.25642C16.6666 5.18163 16.6425 5.12019 16.5944 5.0721C16.5464 5.02402 16.4849 4.99998 16.4101 4.99998H3.58967C3.51488 4.99998 3.45344 5.02402 3.40536 5.0721C3.35727 5.12019 3.33323 5.18163 3.33323 5.25642V6.14263C3.1249 6.11431 2.91657 6.09307 2.70825 6.07892C2.49992 6.06476 2.29159 6.05769 2.08325 6.05769V5.25642C2.08325 4.84215 2.23076 4.48752 2.52577 4.19252C2.82077 3.89751 3.17541 3.75 3.58967 3.75H16.4101C16.8244 3.75 17.179 3.89751 17.474 4.19252C17.769 4.48752 17.9165 4.84215 17.9165 5.25642V14.7435C17.9165 15.1578 17.769 15.5124 17.474 15.8074C17.179 16.1025 16.8244 16.25 16.4101 16.25ZM6.58498 16.25C6.41715 16.25 6.27127 16.1973 6.14734 16.0921C6.02341 15.9869 5.94595 15.8498 5.91498 15.681C5.79425 14.8274 5.42592 14.1017 4.81 13.504C4.19409 12.9062 3.45664 12.5443 2.59767 12.4182C2.43692 12.3974 2.31099 12.3219 2.2199 12.1917C2.1288 12.0615 2.08325 11.913 2.08325 11.7464C2.08325 11.5693 2.14362 11.4209 2.26436 11.3013C2.38508 11.1816 2.52556 11.133 2.68581 11.1555C3.8685 11.2901 4.87623 11.7759 5.70902 12.613C6.54181 13.45 7.02712 14.4599 7.16494 15.6426C7.18737 15.8114 7.1409 15.9548 7.02552 16.0729C6.91013 16.1909 6.76329 16.25 6.58498 16.25ZM9.82361 16.25C9.64091 16.25 9.49107 16.1869 9.37409 16.0609C9.25711 15.9348 9.18741 15.7777 9.16496 15.5897C9.00257 13.86 8.31027 12.3918 7.08804 11.1851C5.86582 9.97834 4.3872 9.3034 2.65217 9.16023C2.48336 9.14313 2.34634 9.07206 2.24111 8.94702C2.13587 8.82197 2.08325 8.67607 2.08325 8.50933C2.08325 8.33217 2.14148 8.18162 2.25794 8.05769C2.37438 7.93377 2.5154 7.88035 2.681 7.89744C4.7622 8.0406 6.53275 8.84135 7.99267 10.2997C9.4526 11.758 10.2627 13.5235 10.4229 15.5961C10.44 15.7788 10.3887 15.9334 10.2689 16.06C10.1491 16.1867 10.0007 16.25 9.82361 16.25ZM2.93215 16.25C2.6942 16.25 2.49324 16.1678 2.32925 16.0035C2.16525 15.8392 2.08325 15.6381 2.08325 15.4001C2.08325 15.1622 2.1654 14.9612 2.32971 14.7972C2.494 14.6332 2.69512 14.5512 2.93306 14.5512C3.17101 14.5512 3.37197 14.6334 3.53596 14.7977C3.69996 14.962 3.78196 15.1631 3.78196 15.4011C3.78196 15.639 3.69981 15.84 3.5355 16.004C3.37121 16.168 3.17009 16.25 2.93215 16.25Z\"\n                                                    fill=\"#6B7385\" />\n                                            </svg>\n                                            12 lesson\n                                        </li>\n                                        <li>\n                                            <svg width=\"20\" height=\"20\" viewBox=\"0 0 20 20\" fill=\"none\"\n                                                xmlns=\"http://www.w3.org/2000/svg\">\n                                                <path\n                                                    d=\"M2.25174 16.0896C2.03834 16.0896 1.85945 16.0174 1.71508 15.873C1.57072 15.7287 1.49854 15.5498 1.49854 15.3364V14.237C1.49854 13.8075 1.60938 13.4243 1.83108 13.0872C2.05276 12.7501 2.34881 12.4879 2.71924 12.3005C3.5112 11.9131 4.30755 11.6145 5.10828 11.4045C5.90904 11.1946 6.78911 11.0896 7.74852 11.0896C8.70792 11.0896 9.58799 11.1946 10.3887 11.4045C11.1895 11.6145 11.9858 11.9131 12.7778 12.3005C13.1482 12.4879 13.4443 12.7501 13.666 13.0872C13.8876 13.4243 13.9985 13.8075 13.9985 14.237V15.3364C13.9985 15.5498 13.9263 15.7287 13.7819 15.873C13.6376 16.0174 13.4587 16.0896 13.2453 16.0896H2.25174ZM15.3414 16.0896C15.4437 16.0024 15.5232 15.8934 15.58 15.7626C15.6367 15.6318 15.6651 15.4855 15.6651 15.3236V14.1345C15.6651 13.5875 15.5312 13.0662 15.2633 12.5705C14.9955 12.0749 14.6155 11.6497 14.1235 11.2948C14.6823 11.3781 15.2127 11.5071 15.7148 11.6818C16.217 11.8565 16.6961 12.0629 17.1523 12.3012C17.5829 12.5309 17.9154 12.8016 18.1499 13.1133C18.3844 13.4251 18.5017 13.7655 18.5017 14.1345V15.3364C18.5017 15.5498 18.4295 15.7287 18.2851 15.873C18.1407 16.0174 17.9619 16.0896 17.7485 16.0896H15.3414ZM7.74852 9.74343C6.94645 9.74343 6.25982 9.45784 5.68864 8.88668C5.11746 8.3155 4.83187 7.62887 4.83187 6.8268C4.83187 6.02472 5.11746 5.33809 5.68864 4.76693C6.25982 4.19575 6.94645 3.91016 7.74852 3.91016C8.55058 3.91016 9.23721 4.19575 9.80839 4.76693C10.3796 5.33809 10.6651 6.02472 10.6651 6.8268C10.6651 7.62887 10.3796 8.3155 9.80839 8.88668C9.23721 9.45784 8.55058 9.74343 7.74852 9.74343ZM14.944 6.8268C14.944 7.62887 14.6584 8.3155 14.0872 8.88668C13.516 9.45784 12.8294 9.74343 12.0273 9.74343C11.9333 9.74343 11.8136 9.73275 11.6683 9.71139C11.5231 9.69003 11.4034 9.66653 11.3094 9.64089C11.638 9.24579 11.8906 8.80748 12.0671 8.32595C12.2436 7.84442 12.3318 7.34437 12.3318 6.8258C12.3318 6.30725 12.2418 5.80918 12.0618 5.33162C11.8818 4.85406 11.631 4.41443 11.3094 4.01272C11.429 3.96998 11.5487 3.94221 11.6683 3.92939C11.788 3.91657 11.9077 3.91016 12.0273 3.91016C12.8294 3.91016 13.516 4.19575 14.0872 4.76693C14.6584 5.33809 14.944 6.02472 14.944 6.8268ZM2.74851 14.8396H12.7485V14.237C12.7485 14.0629 12.705 13.908 12.6179 13.7723C12.5308 13.6366 12.3927 13.518 12.2036 13.4165C11.5177 13.0629 10.8115 12.795 10.0851 12.6128C9.35856 12.4307 8.57971 12.3396 7.74852 12.3396C6.91732 12.3396 6.13847 12.4307 5.41197 12.6128C4.68549 12.795 3.97929 13.0629 3.29339 13.4165C3.10429 13.518 2.9662 13.6366 2.87912 13.7723C2.79205 13.908 2.74851 14.0629 2.74851 14.237V14.8396ZM7.74852 8.49347C8.20685 8.49347 8.59921 8.33028 8.9256 8.00389C9.25199 7.6775 9.41518 7.28514 9.41518 6.8268C9.41518 6.36847 9.25199 5.97611 8.9256 5.64972C8.59921 5.32333 8.20685 5.16014 7.74852 5.16014C7.29018 5.16014 6.89782 5.32333 6.57143 5.64972C6.24504 5.97611 6.08185 6.36847 6.08185 6.8268C6.08185 7.28514 6.24504 7.6775 6.57143 8.00389C6.89782 8.33028 7.29018 8.49347 7.74852 8.49347Z\"\n                                                    fill=\"#6B7385\" />\n                                            </svg>\n                                            50 Students\n                                        </li>\n                                    </ul>\n                                    <p class=\"description\">It is a long established fact that a reader will be\n                                        distracted by the readable...</p>\n                                    <div class=\"creator\">\n                                        <img src=\"/assets/page-builder/block-image/profile.png\"\n                                            alt=\"...\">\n                                        <p>by <span>Angelina Ross</span> in <span>Design</span></p>\n                                    </div>\n                                </div>\n                            </div>\n                        </div>\n                    </a>\n                </div>\n            </div>\n        </span>\n    </div>\n</section>', '', '2024-08-27 04:48:22', '2024-08-27 04:48:22');
INSERT INTO `builder_blocks` (`id`, `identifier`, `title`, `html`, `thumbnail`, `created_at`, `updated_at`) VALUES
(7, 'promo', 'Promo', '<section class=\"skill-wrapper section-padding\">\n    <div class=\"container\">\n        <div class=\"row align-items-center\">\n            <div class=\"col-lg-5 col-md-6\">\n                <div class=\"skill-image position-relative\">\n                    <span class=\"builder_image parent\" content_type=\"image\" id=\"placeholder_id\">\n                        <img src=\"/assets/page-builder/block-image/skill-image.png\" alt=\"...\">\n                    </span>\n                    <div class=\"over-text\">\n                        <span>\n                            <svg width=\"30\" height=\"30\" viewBox=\"0 0 30 30\" fill=\"none\" xmlns=\"http://www.w3.org/2000/svg\">\n                                <path d=\"M8.12494 20.0241C9.16021 20.0241 10.1674 20.1415 11.1466 20.3763C12.1258 20.6111 13.0977 20.9793 14.0625 21.4809V9.19239C13.1843 8.62028 12.2339 8.1912 11.2115 7.90514C10.1891 7.61907 9.16021 7.47604 8.12494 7.47604C7.37494 7.47604 6.67422 7.53493 6.02278 7.6527C5.37134 7.77049 4.70188 7.9632 4.01438 8.23082C3.91821 8.26289 3.85009 8.30897 3.81003 8.36907C3.76997 8.42918 3.74994 8.49528 3.74994 8.56739V20.3895C3.74994 20.5017 3.79 20.5838 3.87013 20.6359C3.95027 20.688 4.03843 20.694 4.13459 20.6539C4.72753 20.452 5.35332 20.2966 6.01197 20.1876C6.67061 20.0786 7.37494 20.0241 8.12494 20.0241ZM15.9374 21.4809C16.9022 20.9793 17.8741 20.6111 18.8533 20.3763C19.8324 20.1415 20.8397 20.0241 21.8749 20.0241C22.6249 20.0241 23.3293 20.0786 23.9879 20.1876C24.6466 20.2966 25.2723 20.452 25.8653 20.6539C25.9614 20.694 26.0496 20.688 26.1297 20.6359C26.2099 20.5838 26.2499 20.5017 26.2499 20.3895V8.56739C26.2499 8.49528 26.2299 8.43118 26.1898 8.37507C26.1498 8.31897 26.0817 8.27089 25.9855 8.23082C25.298 7.9632 24.6285 7.77049 23.9771 7.6527C23.3257 7.53493 22.6249 7.47604 21.8749 7.47604C20.8397 7.47604 19.8108 7.61907 18.7884 7.90514C17.7659 8.1912 16.8156 8.62028 15.9374 9.19239V21.4809ZM14.9999 23.7068C14.7564 23.7068 14.5284 23.6763 14.3161 23.6154C14.1037 23.5545 13.903 23.4736 13.7139 23.3726C12.8533 22.8854 11.9531 22.5181 11.0132 22.2704C10.0733 22.0229 9.11052 21.8991 8.12494 21.8991C7.36212 21.8991 6.61294 21.9836 5.87738 22.1527C5.14179 22.3217 4.43266 22.5705 3.74997 22.899C3.30447 23.1042 2.88059 23.0717 2.47834 22.8017C2.07611 22.5317 1.875 22.149 1.875 21.6539V8.08183C1.875 7.8126 1.9443 7.55979 2.08291 7.32342C2.22153 7.08704 2.42146 6.91677 2.68269 6.8126C3.52883 6.40075 4.41064 6.09587 5.32809 5.89795C6.24555 5.70003 7.17783 5.60107 8.12494 5.60107C9.34129 5.60107 10.5296 5.76734 11.6898 6.09989C12.8501 6.43241 13.9535 6.92319 14.9999 7.57223C16.0464 6.92319 17.1498 6.43241 18.31 6.09989C19.4703 5.76734 20.6586 5.60107 21.8749 5.60107C22.822 5.60107 23.7543 5.70003 24.6718 5.89795C25.5892 6.09587 26.471 6.40075 27.3172 6.8126C27.5784 6.91677 27.7783 7.08704 27.917 7.32342C28.0556 7.55979 28.1249 7.8126 28.1249 8.08183V21.6539C28.1249 22.149 27.9158 22.5276 27.4975 22.7897C27.0792 23.0517 26.6393 23.0801 26.1778 22.875C25.5031 22.5545 24.804 22.3117 24.0804 22.1467C23.3569 21.9816 22.6217 21.8991 21.8749 21.8991C20.8894 21.8991 19.9266 22.0229 18.9867 22.2704C18.0468 22.5181 17.1466 22.8854 16.286 23.3726C16.0969 23.4736 15.8961 23.5545 15.6838 23.6154C15.4715 23.6763 15.2435 23.7068 14.9999 23.7068ZM17.4278 11.077C17.4278 10.9376 17.4775 10.795 17.5768 10.6491C17.6762 10.5033 17.7892 10.4031 17.9158 10.3487C18.536 10.1003 19.1742 9.91195 19.8305 9.78376C20.4867 9.65555 21.1682 9.59145 21.8749 9.59145C22.2836 9.59145 22.679 9.61548 23.0612 9.66354C23.4434 9.71163 23.8284 9.77733 24.2163 9.86067C24.3637 9.89431 24.4911 9.97444 24.5985 10.101C24.7058 10.2276 24.7595 10.3751 24.7595 10.5434C24.7595 10.8254 24.671 11.0317 24.4939 11.1623C24.3168 11.2929 24.0873 11.3246 23.8052 11.2573C23.5056 11.1948 23.1943 11.1499 22.8713 11.1227C22.5484 11.0954 22.2163 11.0818 21.8749 11.0818C21.2692 11.0818 20.6758 11.1399 20.0949 11.2561C19.5139 11.3723 18.9598 11.5297 18.4326 11.7284C18.1377 11.8422 17.8966 11.8358 17.7091 11.7092C17.5216 11.5826 17.4278 11.3719 17.4278 11.077ZM17.4278 17.9039C17.4278 17.7645 17.4775 17.6199 17.5768 17.47C17.6762 17.3202 17.7892 17.218 17.9158 17.1635C18.5199 16.9151 19.1582 16.7289 19.8305 16.6047C20.5027 16.4805 21.1842 16.4184 21.8749 16.4184C22.2836 16.4184 22.679 16.4424 23.0612 16.4905C23.4434 16.5385 23.8284 16.6042 24.2163 16.6876C24.3637 16.7212 24.4911 16.8014 24.5985 16.928C24.7058 17.0546 24.7595 17.202 24.7595 17.3703C24.7595 17.6523 24.671 17.8586 24.4939 17.9892C24.3168 18.1198 24.0873 18.1515 23.8052 18.0842C23.5056 18.0217 23.1943 17.9768 22.8713 17.9496C22.5484 17.9223 22.2163 17.9087 21.8749 17.9087C21.2772 17.9087 20.6898 17.9656 20.1129 18.0794C19.536 18.1932 18.9839 18.3534 18.4567 18.5602C18.1618 18.682 17.9166 18.6788 17.7211 18.5505C17.5256 18.4223 17.4278 18.2068 17.4278 17.9039ZM17.4278 14.5025C17.4278 14.3631 17.4775 14.2204 17.5768 14.0746C17.6762 13.9288 17.7892 13.8286 17.9158 13.7741C18.536 13.5257 19.1742 13.3374 19.8305 13.2092C20.4867 13.081 21.1682 13.0169 21.8749 13.0169C22.2836 13.0169 22.679 13.041 23.0612 13.089C23.4434 13.1371 23.8284 13.2028 24.2163 13.2861C24.3637 13.3198 24.4911 13.3999 24.5985 13.5265C24.7058 13.6531 24.7595 13.8006 24.7595 13.9688C24.7595 14.2509 24.671 14.4572 24.4939 14.5878C24.3168 14.7184 24.0873 14.7501 23.8052 14.6828C23.5056 14.6203 23.1943 14.5754 22.8713 14.5481C22.5484 14.5209 22.2163 14.5073 21.8749 14.5073C21.2692 14.5073 20.6758 14.5654 20.0949 14.6815C19.5139 14.7977 18.9598 14.9552 18.4326 15.1539C18.1377 15.2677 17.8966 15.2613 17.7091 15.1347C17.5216 15.0081 17.4278 14.7974 17.4278 14.5025Z\" fill=\"white\"/>\n                                </svg>\n                                \n                        </span>\n                        <div class=\"b-text\">\n                            <h5>150k +</h5>\n                            <p>Top rated Courses</p>\n                        </div>\n                    </div>\n                </div>\n            </div>\n            <div class=\"col-lg-7 col-md-6\">\n                <div class=\"skil-content\">\n                    <span class=\"title-head builder_text parent\" content_type=\"text\" id=\"placeholder_id\">Know About Us</span>\n                    <h2 class=\"title builder_text parent\" content_type=\"text\" id=\"placeholder_id\">Learn & Grow Your Skills From <span class=\"gradient shadow-none color\">Educate</span></h2>\n                    <p class=\"description mt-5 builder_text parent\" content_type=\"text\" id=\"placeholder_id\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum.</p>\n                    <ul>\n                        <li>\n                            <div class=\"svg\">\n                                <svg width=\"28\" height=\"28\" viewBox=\"0 0 28 28\" fill=\"none\" xmlns=\"http://www.w3.org/2000/svg\">\n                                    <path d=\"M21.4083 16.3111L24.8186 12.8896C24.9709 12.7356 25.1492 12.6585 25.3535 12.6585C25.5578 12.6585 25.7407 12.7356 25.9022 12.8896C26.0638 13.0437 26.1427 13.224 26.1389 13.4307C26.1352 13.6373 26.0563 13.8144 25.9022 13.962L22.059 17.7761C21.874 17.9676 21.6539 18.0633 21.3986 18.0633C21.1434 18.0633 20.92 17.9676 20.7286 17.7761L18.8978 15.9274C18.7437 15.7804 18.6648 15.6083 18.6611 15.4111C18.6573 15.2138 18.7362 15.0345 18.8978 14.8729C19.0518 14.7189 19.2324 14.64 19.4396 14.6362C19.6468 14.6325 19.8274 14.7114 19.9814 14.8729L21.4083 16.3111ZM10.628 21.9694C8.90488 20.4288 7.48318 19.0886 6.36289 17.9489C5.24258 16.8091 4.36009 15.7924 3.71543 14.8987C3.07077 14.005 2.62092 13.1891 2.36589 12.4509C2.1109 11.7128 1.9834 10.9653 1.9834 10.2085C1.9834 8.64995 2.51737 7.32997 3.58532 6.24857C4.65325 5.16717 5.95675 4.62646 7.49584 4.62646C8.47555 4.62646 9.41374 4.85495 10.3104 5.31191C11.2071 5.76885 11.9703 6.42286 12.6 7.27392C13.2355 6.42101 13.9837 5.76654 14.8444 5.31051C15.7051 4.85448 16.6195 4.62646 17.5875 4.62646C18.992 4.62646 20.2312 5.07706 21.3051 5.97825C22.379 6.87942 23.0072 8.01729 23.1897 9.39186H21.6417C21.4517 8.48544 20.9918 7.71737 20.2619 7.08766C19.532 6.45796 18.6405 6.1431 17.5875 6.1431C16.5016 6.1431 15.6491 6.42018 15.0298 6.97435C14.4106 7.52852 13.7614 8.23712 13.0824 9.10016H12.1176C11.4042 8.21019 10.7393 7.49486 10.1231 6.95417C9.50685 6.41346 8.6311 6.1431 7.49584 6.1431C6.37255 6.1431 5.42576 6.53386 4.65544 7.31537C3.88515 8.0969 3.50001 9.06128 3.50001 10.2085C3.50001 10.8259 3.62153 11.4525 3.86459 12.0883C4.10765 12.7242 4.56459 13.4688 5.23542 14.3221C5.90626 15.1754 6.82987 16.188 8.00626 17.3599C9.18265 18.5318 10.7139 19.9689 12.6 21.671C13.131 21.1983 13.8418 20.5589 14.7325 19.7527C15.6232 18.9465 16.2743 18.3475 16.6856 17.9556L16.8531 18.1232L17.2218 18.4918L17.5904 18.8605L17.758 19.028C17.3347 19.4393 16.9043 19.8421 16.4668 20.2362C16.0293 20.6303 15.6363 20.9859 15.2878 21.303L13.2215 23.1697C13.03 23.3222 12.8229 23.3985 12.6 23.3985C12.3772 23.3985 12.17 23.3222 11.9786 23.1697L10.628 21.9694Z\" fill=\"#F81163\"/>\n                                    </svg>\n                            </div>\n                            <div class=\"skill-text\">\n                                <span class=\"builder_text parent\" content_type=\"text\" id=\"placeholder_id\">Life time Access</span>\n                                <p class=\"builder_text parent\" content_type=\"text\" id=\"placeholder_id\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.</p>\n                            </div>\n                        </li>\n                        <li>\n                            <div class=\"svg color-dash\">\n                                <svg width=\"28\" height=\"28\" viewBox=\"0 0 28 28\" fill=\"none\" xmlns=\"http://www.w3.org/2000/svg\">\n                                    <path d=\"M6.31752 20.0083C4.63719 20.0083 3.21281 19.4264 2.04437 18.2627C0.875956 17.0989 0.291748 15.6806 0.291748 14.0077C0.291748 12.3349 0.875995 10.914 2.04449 9.74505C3.213 8.57615 4.63712 7.9917 6.31685 7.9917C6.98557 7.9917 7.62746 8.10762 8.24252 8.33945C8.85757 8.57129 9.41637 8.90932 9.91894 9.35355L12.4699 11.5814L11.3212 12.5776L8.952 10.4798C8.59152 10.1672 8.18948 9.92712 7.74587 9.75961C7.30225 9.59207 6.84178 9.50831 6.36448 9.50831C5.10613 9.50831 4.03219 9.94615 3.14264 10.8218C2.25312 11.6975 1.80836 12.7584 1.80836 14.0044C1.80836 15.2504 2.25312 16.3147 3.14264 17.1971C4.03219 18.0796 5.10613 18.5209 6.36448 18.5209C6.84178 18.5209 7.30225 18.4371 7.74587 18.2696C8.18948 18.1021 8.59152 17.862 8.952 17.5494L18.0812 9.35355C18.5762 8.92128 19.1323 8.58623 19.7493 8.34841C20.3664 8.1106 21.0106 7.9917 21.6821 7.9917C23.3622 7.9917 24.7865 8.57532 25.9553 9.74255C27.124 10.9098 27.7084 12.3286 27.7084 13.999C27.7084 15.6868 27.1201 17.1104 25.9435 18.2695C24.767 19.4287 23.333 20.0083 21.6417 20.0083C20.9734 20.0083 20.3355 19.8905 19.7281 19.655C19.1207 19.4194 18.562 19.0832 18.052 18.6465L15.4943 16.3894L16.6789 15.4112L19.0481 17.5202C19.4086 17.8418 19.8106 18.0841 20.2542 18.2471C20.6979 18.4102 21.1583 18.4917 21.6356 18.4917C22.894 18.4917 23.9679 18.0539 24.8575 17.1782C25.747 16.3025 26.1917 15.2416 26.1917 13.9956C26.1917 12.7496 25.747 11.6854 24.8575 10.8029C23.9679 9.92038 22.894 9.47914 21.6356 9.47914C21.1583 9.47914 20.6979 9.56291 20.2542 9.73044C19.8106 9.89796 19.4086 10.138 19.0481 10.4506L9.92596 18.6442C9.4262 19.0974 8.86775 19.4381 8.2506 19.6662C7.63347 19.8943 6.98911 20.0083 6.31752 20.0083Z\" fill=\"#2F57EF\"/>\n                                    </svg>\n                            </div>\n                                <div class=\"skill-text\">\n                                    <span class=\"builder_text parent\" content_type=\"text\" id=\"placeholder_id\">Learn from Anywhere</span>\n                                    <p class=\"builder_text parent\" content_type=\"text\" id=\"placeholder_id\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.</p> \n                             </div>\n                        </li>\n                    </ul>\n                    <span class=\"promo-more-button\">\n                        <a href=\"#\" class=\"eBtn gradient mt-50\">More about us <i class=\"fa-solid fa-arrow-right-long ms-2\"></i></a>\n                    </span>\n                </div>\n            </div>\n        </div>\n    </div>\n</section>', '', '2024-08-27 04:48:22', '2024-08-27 04:48:22'),
(8, 'testimonial', 'Testimonial', '<section class=\"testimonials-wrapper section-padding\">\n    <span class=\"elips left-elips\"><img src=\"/assets/page-builder/block-image/Ellipse 8.png\" alt=\"...\"></span>\n    <span class=\"elips right-elips\"><img src=\"/assets/page-builder/block-image/Ellipse 9.png\" alt=\"...\"></span>\n    <div class=\"container\">\n        <div class=\"row\">\n            <div class=\"col-lg-4 col-md-4\">\n                <div class=\"section-title \">\n                    <span class=\"title-head builder_text parent\" content_type=\"text\" id=\"placeholder_id\">Testimonial</span>\n                    <h2 class=\"title builder_text parent\" content_type=\"text\" id=\"placeholder_id\">What our clients says about us</h2>\n                    <p class=\"description mt-5 builder_text parent\" content_type=\"text\" id=\"placeholder_id\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.</p>\n                </div>\n            </div>\n            <div class=\"col-lg-8 col-md-8\">\n                <div class=\"user-slider owl-carousel owl-theme\">\n                    <!-- Single User Opinion -->\n                    <div class=\"single-opinion\">\n                        <div class=\"user-image\">\n                            <span class=\"builder_image parent\" content_type=\"image\" id=\"placeholder_id\"><img src=\"/assets/page-builder/block-image/test-image.png\" alt=\"\"></span>\n                        </div>\n                        <div class=\"testimonial-border\">\n                            <div class=\"testimonial-des\">\n                                <p class=\"description\">\n                                    <span class=\"builder_text parent\" content_type=\"text\" id=\"placeholder_id\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of use Lorem Ipsum.</span>\n                                </p>\n                                <div class=\"user-info d-flex\">\n                                    <div>\n                                        <h4><span class=\"builder_text parent\" content_type=\"text\" id=\"placeholder_id\">Linchon Philips</span></h4>\n                                        <p><span class=\"builder_text parent\" content_type=\"text\" id=\"placeholder_id\">CEO @ Yahoo</span></p>\n                                    </div>\n                                    <ul class=\"d-flex align-items-center\">\n                                        <li><i class=\"fa fa-star\"></i></li>\n                                        <li><i class=\"fa fa-star\"></i></li>\n                                        <li><i class=\"fa fa-star\"></i></li>\n                                        <li><i class=\"fa fa-star\"></i></li>\n                                        <li><i class=\"fa fa-star\"></i></li>\n                                    </ul>\n                                </div>\n                            </div>\n                        </div>\n                    </div>\n                    <!-- Single User Opinion -->\n                    <div class=\"single-opinion\">\n                        <div class=\"user-image\">\n                            <span class=\"builder_image parent\" content_type=\"image\" id=\"placeholder_id\"><img src=\"/assets/page-builder/block-image/test-image.png\" alt=\"\"></span>\n                        </div>\n                        <div class=\"testimonial-border\">\n                            <div class=\"testimonial-des\">\n                                <p class=\"description\"><span class=\"builder_text parent\" content_type=\"text\" id=\"placeholder_id\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of use Lorem Ipsum.</span></p>\n                                <div class=\"user-info d-flex\">\n                                    <div>\n                                        <h4><span class=\"builder_text parent\" content_type=\"text\" id=\"placeholder_id\">Linchon Philips</span></h4>\n                                        <p><span class=\"builder_text parent\" content_type=\"text\" id=\"placeholder_id\">CEO @ Yahoo</span></p>\n                                    </div>\n                                    <ul class=\"d-flex align-items-center\">\n                                        <li><i class=\"fa fa-star\"></i></li>\n                                        <li><i class=\"fa fa-star\"></i></li>\n                                        <li><i class=\"fa fa-star\"></i></li>\n                                        <li><i class=\"fa fa-star\"></i></li>\n                                        <li><i class=\"fa fa-star\"></i></li>\n                                    </ul>\n                                </div>\n                            </div>\n                        </div>\n                    </div>\n                    <!-- Single User Opinion -->\n                    <div class=\"single-opinion\">\n                        <div class=\"user-image\">\n                            <span class=\"builder_image parent\" content_type=\"image\" id=\"placeholder_id\"><img src=\"/assets/page-builder/block-image/test-image.png\" alt=\"\"></span>\n                        </div>\n                        <div class=\"testimonial-border\">\n                            <div class=\"testimonial-des\">\n                                <span class=\"description\"><span class=\"builder_text parent\" content_type=\"text\" id=\"placeholder_id\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of use Lorem Ipsum.</span></p>\n                                    <div class=\"user-info d-flex\">\n                                        <div>\n                                            <h4><span class=\"builder_text parent\" content_type=\"text\" id=\"placeholder_id\">Linchon Philips</span></h4>\n                                            <p><span class=\"builder_text parent\" content_type=\"text\" id=\"placeholder_id\">CEO @ Yahoo</span></p>\n                                        </div>\n                                        <ul class=\"d-flex align-items-center\">\n                                            <li><i class=\"fa fa-star\"></i></li>\n                                            <li><i class=\"fa fa-star\"></i></li>\n                                            <li><i class=\"fa fa-star\"></i></li>\n                                            <li><i class=\"fa fa-star\"></i></li>\n                                            <li><i class=\"fa fa-star\"></i></li>\n                                        </ul>\n                                    </div>\n                            </div>\n                        </div>\n                    </div>\n                    <!-- Single User Opinion -->\n                    <div class=\"single-opinion\">\n                        <div class=\"user-image\">\n                            <span class=\"builder_image parent\" content_type=\"image\" id=\"placeholder_id\"><img src=\"/assets/page-builder/block-image/test-image.png\" alt=\"\"></span>\n                        </div>\n                        <div class=\"testimonial-border\">\n                            <div class=\"testimonial-des\">\n                                <p class=\"description\"><span class=\"builder_text parent\" content_type=\"text\" id=\"placeholder_id\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of use Lorem Ipsum.</span></p>\n                                <div class=\"user-info d-flex\">\n                                    <div>\n                                        <h4><span class=\"builder_text parent\" content_type=\"text\" id=\"placeholder_id\">Linchon Philips</span></h4>\n                                        <p><span class=\"builder_text parent\" content_type=\"text\" id=\"placeholder_id\">CEO @ Yahoo</span></p>\n                                    </div>\n                                    <ul class=\"d-flex align-items-center\">\n                                        <li><i class=\"fa fa-star\"></i></li>\n                                        <li><i class=\"fa fa-star\"></i></li>\n                                        <li><i class=\"fa fa-star\"></i></li>\n                                        <li><i class=\"fa fa-star\"></i></li>\n                                        <li><i class=\"fa fa-star\"></i></li>\n                                    </ul>\n                                </div>\n                            </div>\n                        </div>\n                    </div>\n                    <!-- Single User Opinion -->\n                    <div class=\"single-opinion\">\n                        <div class=\"user-image\">\n                            <span class=\"builder_image parent\" content_type=\"image\" id=\"placeholder_id\"><img src=\"/assets/page-builder/block-image/test-image.png\" alt=\"\"></span>\n                        </div>\n                        <div class=\"testimonial-border\">\n                            <div class=\"testimonial-des\">\n                                <p class=\"description\"><span class=\"builder_text parent\" content_type=\"text\" id=\"placeholder_id\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of use Lorem Ipsum.</span></p>\n                                <div class=\"user-info d-flex\">\n                                    <div>\n                                        <h4><span class=\"builder_text parent\" content_type=\"text\" id=\"placeholder_id\">Linchon Philips</span></h4>\n                                        <p><span class=\"builder_text parent\" content_type=\"text\" id=\"placeholder_id\">CEO @ Yahoo</span></p>\n                                    </div>\n                                    <ul class=\"d-flex align-items-center\">\n                                        <li><i class=\"fa fa-star\"></i></li>\n                                        <li><i class=\"fa fa-star\"></i></li>\n                                        <li><i class=\"fa fa-star\"></i></li>\n                                        <li><i class=\"fa fa-star\"></i></li>\n                                        <li><i class=\"fa fa-star\"></i></li>\n                                    </ul>\n                                </div>\n                            </div>\n                        </div>\n                    </div>\n                    <!-- Single User Opinion -->\n                </div>\n            </div>\n        </div>\n    </div>\n</section>\n<script>\n    $(\'.testimonials-wrapper .user-slider\').owlCarousel({\n        loop: true,\n        autoplay: false,\n        margin: 10,\n        nav: true,\n        navText: [\'<i class=\"fa-solid fa-chevron-left\"></i>\', \'<i class=\"fa-solid fa-chevron-right\"></i>\'],\n        dots: false,\n        responsive: {\n            0: {\n                items: 1\n            },\n            600: {\n                items: 1\n            },\n            1000: {\n                items: 1\n            }\n        }\n    });\n</script>', '', '2024-08-27 04:48:22', '2024-08-27 04:48:22'),
(9, 'blog', 'Blog', '<section class=\"blog-wrapper section-padding\">\n    <div class=\"container\">\n        <div class=\"row\">\n            <div class=\"col-lg-12\">\n                <div class=\"res-control d-flex align-items-center justify-content-between\">\n                    <div class=\"section-title mb-0\">\n                        <span class=\"title-head mb-10 builder_text parent\" content_type=\"text\" id=\"placeholder_id\">Our Blog</span>\n                        <h2 class=\"title builder_text parent\" content_type=\"text\" id=\"placeholder_id\">Have a look on our news</h2>\n                    </div>\n                    <span class=\"blog-view-all-button\">\n                        <a href=\"#\" class=\"eBtn gradient\">View All Blogs</a>\n                    </span>\n               </div>\n            </div>\n        </div>\n        <span class=\'blog\'>\n            <div class=\"row justify-content-center mt-50\">\n                <div class=\"col-lg-4 col-md-6 col-sm-6 mb-20\">\n                    <div class=\"Ecard card b-card\">\n                        <div class=\"card-head\">\n                            <img src=\"/assets/page-builder/block-image/blog1.png\" alt=\"...\">\n                            <span>Bussiness</span>\n                        </div>\n                        <div class=\"card-body\">\n                            <h4>Skills That You Can Learn From Education</h4>\n                            <p class=\"description\">It is a long established fact that a reader will be distracted by the readable...</p>\n                            <div class=\"b_bottom d-flex justify-content-between\">\n                                <a href=\"#\" class=\"read-text mt-0 stretched-link\">Read More<i class=\"fa-solid fa-arrow-right-long ms-2\"></i></a>\n                            <span>01 Jan, 2024</span>\n                            </div>\n                        </div>\n                    </div>\n                </div>\n                <div class=\"col-lg-4 col-md-6 col-sm-6 mb-20\">\n                    <div class=\"Ecard card b-card\">\n                        <div class=\"card-head\">\n                            <img src=\"/assets/page-builder/block-image/blog2.png\" alt=\"...\">\n                            <span>Bussiness</span>\n                        </div>\n                        <div class=\"card-body\">\n                            <h4>Skills That You Can Learn From Education</h4>\n                            <p class=\"description\">It is a long established fact that a reader will be distracted by the readable...</p>\n                            <div class=\"b_bottom d-flex justify-content-between\">\n                                <a href=\"#\" class=\"read-text mt-0 stretched-link\">Read More<i class=\"fa-solid fa-arrow-right-long ms-2\"></i></a>\n                            <span>01 Jan, 2024</span>\n                            </div>\n                        </div>\n                    </div>\n                </div>\n                <div class=\"col-lg-4 col-md-6 col-sm-6 mb-20\">\n                    <div class=\"Ecard card b-card\">\n                        <div class=\"card-head\">\n                            <img src=\"/assets/page-builder/block-image/blog3.png\" alt=\"...\">\n                            <span>Bussiness</span>\n                        </div>\n                        <div class=\"card-body\">\n                            <h4>Skills That You Can Learn From Education</h4>\n                            <p class=\"description\">It is a long established fact that a reader will be distracted by the readable...</p>\n                            <div class=\"b_bottom d-flex justify-content-between\">\n                                <a href=\"#\" class=\"read-text mt-0 stretched-link\">Read More<i class=\"fa-solid fa-arrow-right-long ms-2\"></i></a>\n                            <span>01 Jan, 2024</span>\n                            </div>\n                        </div>\n                    </div>\n                </div>\n            </div>\n        </span>\n    </div>\n</section>', '', '2024-08-27 04:48:22', '2024-08-27 04:48:22'),
(10, 'footer', 'Footer', '<footer class=\"footer-area\">\n    <div class=\"container\">\n        <div class=\"row\">\n            <div class=\"col-lg-4 col-md-4\">\n                <div class=\"footer-content\">\n                    <span class=\"builder_image parent\" content_type=\"image\" id=\"placeholder_id\" >\n                        <img src=\"/assets/page-builder/block-image/footer-logo.png\" alt=\"...\">\n                    </span>\n                    <p class=\"description builder_text parent\" content_type=\"text\" id=\"placeholder_id\">It is a long established fact that a reader will be the distract by the read content of a page  layout.</p>\n\n                    <span class=\"footer-social-contact\">\n                        <ul class=\"f-socials d-flex\">\n                            <li><a href=\"#\"><i class=\"fa-brands fa-twitter\"></i></a></li>\n                            <li><a href=\"#\"><i class=\"fa-brands fa-facebook-f\"></i></a></li>\n                            <li><a href=\"#\"><i class=\"fa-brands fa-linkedin-in\"></i></a></li>\n                            <li><a href=\"#\"><i class=\"fa-brands fa-instagram\"></i></a></li>\n                        </ul>\n                        <div class=\"gradient-border2\">\n                            <a href=\"#\" class=\"gradient-border-btn\">Contact with Us <i class=\"fa-solid fa-arrow-right-long ms-2\"></i></a>\n                        </div>\n                    </span>\n                </div>\n            </div>\n            <div class=\"col-lg-8 col-md-8\">\n                <div class=\"row\">\n                    <div class=\"col-lg-3 col-md-6\">\n                        <span class=\"footer-widget-1\">\n                            <div class=\"footer-widget\">\n                                <h4>Resources</h4>\n                                <ul>\n                                    <li><a href=\"#\">Academy</a></li>\n                                    <li><a href=\"#\">Blog</a></li>\n                                    <li><a href=\"#\">Themes</a></li>\n                                    <li><a href=\"#\">Hosting</a></li>\n                                    <li><a href=\"#\">Developer</a></li>\n                                </ul>\n                            </div>\n                        </span>\n                    </div>\n                    <div class=\"col-lg-3 col-md-6\">\n                        <span class=\"footer-widget-2\">\n                            <div class=\"footer-widget\">\n                                <h4>Company</h4>\n                                <ul>\n                                    <li><a href=\"#\">About Us</a></li>\n                                    <li><a href=\"#\">Careers</a></li>\n                                    <li><a href=\"#\">FAQs</a></li>\n                                    <li><a href=\"#\">Teams</a></li>\n                                    <li><a href=\"#\">Contact Us</a></li>\n                                </ul>\n                            </div>\n                        </span>\n                    </div>\n                    <div class=\"col-lg-6 col-md-6\">\n                        <div class=\"footer-widget\">\n                            <span class=\"footer-widget-3\">\n                                <h4>Company</h4>\n                                <ul>\n                                    <li><a href=\"#\">Phone : +76 398 380 422</a></li>\n                                    <li><a href=\"#\">Email : companyname@gmail.com</a></li>\n                                </ul>\n                            </span>\n                           <div class=\"newslater-bottom\">\n                                <h4 class=\"builder_text parent\" content_type=\"text\" id=\"placeholder_id\">Newsletter</h4>\n                                <p class=\"description builder_text parent\" content_type=\"text\" id=\"placeholder_id\">Subscribe to stay tuned for new web design and latest updates. Let\'s do it! </p>\n                                <span class=\"footer-subscription-form\">\n                                    <form action=\"#\" class=\"newslater-form\">\n                                        <input type=\"text\" class=\"form-control\" placeholder=\"Enter your email here\">\n                                        <button class=\"eBtn gradient\">Submit</button>\n                                    </form>\n                                </span>\n                           </div>\n                        </div>\n                    </div>\n                </div>\n            </div>\n        </div>\n    </div>\n    <span class=\"footer-bottom\">\n        <div class=\"footer-bottom\">\n            <div class=\"container\">\n                <div class=\"row\">\n                    <div class=\"col-lg-8\">\n                        <ul class=\"footer-policy\">\n                            <li><a href=\"#\">Privacy Policy</a></li>\n                            <li><a href=\"#\">Terms And Use</a></li>\n                            <li><a href=\"#\">Sales and Refunds</a></li>\n                            <li><a href=\"#\">Legal</a></li>\n                            <li><a href=\"#\">Site Map</a></li>\n                        </ul>\n                    </div>\n                    <div class=\"col-lg-4\">\n                        <div class=\"copyright-text\">\n                            <p>© 2023 All Rights Reserved</p>\n                        </div>\n                    </div>\n                </div>\n            </div>\n        </div>\n    </span>\n</footer>', '', '2024-08-27 04:48:22', '2024-08-27 04:48:22');

-- --------------------------------------------------------

--
-- Table structure for table `builder_pages`
--

CREATE TABLE `builder_pages` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `html` longtext,
  `identifier` varchar(255) DEFAULT NULL,
  `is_permanent` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `edit_home_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `builder_pages`
--

INSERT INTO `builder_pages` (`id`, `name`, `html`, `identifier`, `is_permanent`, `status`, `edit_home_id`, `created_at`, `updated_at`) VALUES
(12, 'Elegant', '', 'elegant', 1, 0, NULL, '2024-08-27 04:25:11', '2024-08-27 04:25:11'),
(13, 'Kindergarden', NULL, 'kindergarden', 1, 0, 1, '2024-08-27 04:25:11', '2024-08-27 04:25:11'),
(14, 'Cooking', NULL, 'cooking', 1, 0, 1, '2024-08-27 04:25:11', '2024-08-27 04:25:11'),
(15, 'University', NULL, 'university', 1, 0, 1, '2024-08-27 04:25:11', '2024-08-27 04:25:11'),
(16, 'Language', NULL, 'language', 1, 0, NULL, '2024-08-27 04:25:11', '2024-08-27 04:25:11'),
(17, 'Development', NULL, 'development', 1, 0, 1, '2024-08-27 04:25:11', '2024-08-27 04:25:11'),
(18, 'Marketplace', NULL, 'marketplace', 1, 0, 1, '2024-08-27 04:25:11', '2024-08-27 04:25:11'),
(19, 'Meditation', NULL, 'meditation', 1, 0, 1, '2024-08-27 04:25:11', '2024-08-27 04:25:11');
INSERT INTO `builder_pages` (`id`, `name`, `html`, `identifier`, `is_permanent`, `status`, `edit_home_id`, `created_at`, `updated_at`) VALUES
(23, 'Default', '<div class=\"section parent ui-sortable-handle\" id=\"722\" bis_skin_checked=\"1\">\n                                <span class=\"topbar\">\n    <div class=\"sub-header\" bis_skin_checked=\"1\">\n        <div class=\"container\" bis_skin_checked=\"1\">\n            <div class=\"row\" bis_skin_checked=\"1\">\n                <div class=\"col-lg-6 col-md-6\" bis_skin_checked=\"1\">\n                    <div class=\"sub-header-left\" bis_skin_checked=\"1\">\n                        <ul class=\"d-flex\">\n                            <li>\n                                <a href=\"tel:+143-52-9933631\">\n                                    <svg width=\"20\" height=\"20\" viewBox=\"0 0 20 20\" fill=\"none\" xmlns=\"http://www.w3.org/2000/svg\">\n                                        <path d=\"M18.3018 15.2734C18.3018 15.5734 18.2352 15.8817 18.0935 16.1817C17.9518 16.4817 17.7685 16.765 17.5268 17.0317C17.1185 17.4817 16.6685 17.8067 16.1602 18.015C15.6602 18.2234 15.1185 18.3317 14.5352 18.3317C13.6852 18.3317 12.7768 18.1317 11.8185 17.7234C10.8602 17.315 9.90182 16.765 8.95182 16.0734C7.99349 15.3734 7.08516 14.5984 6.21849 13.74C5.36016 12.8734 4.58516 11.965 3.89349 11.015C3.21016 10.065 2.66016 9.11504 2.26016 8.17337C1.86016 7.22337 1.66016 6.31504 1.66016 5.44837C1.66016 4.88171 1.76016 4.34004 1.96016 3.84004C2.16016 3.33171 2.47682 2.86504 2.91849 2.44837C3.45182 1.92337 4.03516 1.66504 4.65182 1.66504C4.88516 1.66504 5.11849 1.71504 5.32682 1.81504C5.54349 1.91504 5.73516 2.06504 5.88516 2.28171L7.81849 5.00671C7.96849 5.21504 8.07682 5.40671 8.15182 5.59004C8.22682 5.76504 8.26849 5.94004 8.26849 6.09837C8.26849 6.29837 8.21016 6.49837 8.09349 6.69004C7.98516 6.8817 7.82682 7.0817 7.62682 7.2817L6.99349 7.94004C6.90182 8.0317 6.86016 8.14004 6.86016 8.27337C6.86016 8.34004 6.86849 8.39837 6.88516 8.46504C6.91016 8.5317 6.93516 8.5817 6.95182 8.6317C7.10182 8.9067 7.36016 9.26504 7.72682 9.69837C8.10182 10.1317 8.50182 10.5734 8.93516 11.015C9.38516 11.4567 9.81849 11.865 10.2602 12.24C10.6935 12.6067 11.0518 12.8567 11.3352 13.0067C11.3768 13.0234 11.4268 13.0484 11.4852 13.0734C11.5518 13.0984 11.6185 13.1067 11.6935 13.1067C11.8352 13.1067 11.9435 13.0567 12.0352 12.965L12.6685 12.34C12.8768 12.1317 13.0768 11.9734 13.2685 11.8734C13.4602 11.7567 13.6518 11.6984 13.8602 11.6984C14.0185 11.6984 14.1852 11.7317 14.3685 11.8067C14.5518 11.8817 14.7435 11.99 14.9518 12.1317L17.7102 14.09C17.9268 14.24 18.0768 14.415 18.1685 14.6234C18.2518 14.8317 18.3018 15.04 18.3018 15.2734Z\" stroke=\"#192335\" stroke-width=\"1.25\" stroke-miterlimit=\"10\"></path>\n                                    </svg>\n                                    +143-52-9933631\n                                </a>\n                            </li>\n                            <li>\n                                <a href=\"#\"><svg width=\"20\" height=\"20\" viewBox=\"0 0 20 20\" fill=\"none\" xmlns=\"http://www.w3.org/2000/svg\">\n                                        <path d=\"M9.99453 11.1912C11.4305 11.1912 12.5945 10.0272 12.5945 8.59121C12.5945 7.15527 11.4305 5.99121 9.99453 5.99121C8.55859 5.99121 7.39453 7.15527 7.39453 8.59121C7.39453 10.0272 8.55859 11.1912 9.99453 11.1912Z\" stroke=\"#192335\" stroke-width=\"1.25\"></path>\n                                        <path d=\"M3.0187 7.0763C4.66037 -0.140363 15.352 -0.132029 16.9854 7.08464C17.9437 11.318 15.3104 14.9013 13.002 17.118C11.327 18.7346 8.67704 18.7346 6.9937 17.118C4.6937 14.9013 2.06037 11.3096 3.0187 7.0763Z\" stroke=\"#192335\" stroke-width=\"1.25\"></path>\n                                    </svg>\n                                    Sydney, Australia\n                                </a>\n                            </li>\n                        </ul>\n                    </div>\n                </div>\n                <div class=\"col-lg-6 col-md-6\" bis_skin_checked=\"1\">\n                    <div class=\"sub-header-left right-sub\" bis_skin_checked=\"1\">\n\n                        <ul class=\"d-flex\">\n                            <li>\n                                <a href=\"https://twitter.com\">\n                                    <i class=\"fa-brands fa-twitter\"></i>\n                                </a>\n                            </li>\n                            <li>\n                                <a href=\"https://linkedin.com\">\n                                    <i class=\"fa-brands fa-linkedin\"></i>\n                                </a>\n                            </li>\n                            <li>\n                                <a href=\"https://facebook.com\">\n                                    <i class=\"fa-brands fa-square-facebook\"></i>\n                                </a>\n                            </li>\n                        </ul>\n                    </div>\n                </div>\n            </div>\n        </div>\n    </div>\n</span>\n            </div><div class=\"section parent ui-sortable-handle\" id=\"649\" bis_skin_checked=\"1\">\n                                <span class=\"header-menu\">\n<header class=\"header-area\">\n    <div class=\"container\" bis_skin_checked=\"1\">\n        <div class=\"row\" bis_skin_checked=\"1\">\n            <div class=\"col-auto\" bis_skin_checked=\"1\">\n                <div class=\"logo-image\" bis_skin_checked=\"1\">\n                    <a href=\"\">\n                        <img src=\"http://localhost/academy-laravel/sham/academy/public/assets/page-builder/block-image/logo.png\" alt=\"system logo\" class=\"object-fit-cover rounded\">\n                    </a>\n                </div>\n            </div>\n            <div class=\"col-auto\" bis_skin_checked=\"1\">\n                <div class=\"header-menu d-flex justify-content-end me-lg-auto ms-auto ms-lg-0 mt-2 pt-1\" bis_skin_checked=\"1\">\n                    <div class=\"nav-menu w-100\" bis_skin_checked=\"1\">\n                        <ul class=\"primary-menu main-menu-ul d-flex align-items-center w-100\">\n                            <li><a href=\"#\" class=\"\">Home</a></li>\n                            <li class=\"have-mega-menu\"><a class=\"menu-parent-a  active \" href=\"#\">Courses</a>\n                                <ul class=\"mega-dropdown-menu mega main-mega-menu\">\n                                    <div class=\"mega-menu-items\" bis_skin_checked=\"1\">\n                                        <ul class=\"mega_list\">\n                                            <li>\n                                                <a href=\"#\">\n                                                    <span class=\"me-3\"><i class=\"fas fa-music\"></i></span>\n                                                    <span class=\"me-auto\">Music</span>\n                                                    <span><i class=\"fi fi-sr-angle-small-right\"></i></span>\n                                                </a>\n\n                                                <ul class=\"child_category_menu\">\n                                                    <li>\n                                                        <a href=\"#\">\n                                                            Learing Guitar\n                                                        </a>\n                                                    </li>\n                                                    <li>\n                                                        <a href=\"#\">\n                                                            Basic Piano\n                                                        </a>\n                                                    </li>\n                                                </ul>\n                                            </li>\n                                            <li>\n                                                <a href=\"#\">\n                                                    <span class=\"me-3\"><i class=\"far fa-hand-peace\"></i></span>\n                                                    <span class=\"me-auto\">Yoga</span>\n                                                    <span><i class=\"fi fi-sr-angle-small-right\"></i></span>\n                                                </a>\n\n                                                <ul class=\"child_category_menu\">\n                                                    <li>\n                                                        <a href=\"#vinyasa-yoga\">\n                                                            Vinyasa yoga\n                                                        </a>\n                                                    </li>\n                                                    <li>\n                                                        <a href=\"#restorative-yoga\">\n                                                            Restorative Yoga\n                                                        </a>\n                                                    </li>\n                                                    <li>\n                                                        <a href=\"#tanya-wiggins\">\n                                                            Tanya Wiggins\n                                                        </a>\n                                                    </li>\n                                                </ul>\n                                            </li>\n                                            <li>\n                                                <a href=\"#fashion\">\n                                                    <span class=\"me-3\"><i class=\"fas fa-user-secret\"></i></span>\n                                                    <span class=\"me-auto\">Fashion</span>\n                                                    <span><i class=\"fi fi-sr-angle-small-right\"></i></span>\n                                                </a>\n\n                                                <ul class=\"child_category_menu\">\n                                                    <li>\n                                                        <a href=\"#fashion-design\">\n                                                            Fashion Design\n                                                        </a>\n                                                    </li>\n                                                    <li>\n                                                        <a href=\"#sewing\">\n                                                            Sewing\n                                                        </a>\n                                                    </li>\n                                                    <li>\n                                                        <a href=\"#t-shirt-design\">\n                                                            T-shirt Design\n                                                        </a>\n                                                    </li>\n                                                    <li>\n                                                        <a href=\"#jewelry-design\">\n                                                            Jewelry Design\n                                                        </a>\n                                                    </li>\n                                                </ul>\n                                            </li>\n                                            <li>\n                                                <a href=\"#3d-and-animation\">\n                                                    <span class=\"me-3\"><i class=\"fas fa-cube\"></i></span>\n                                                    <span class=\"me-auto\">3D and Animation</span>\n                                                    <span><i class=\"fi fi-sr-angle-small-right\"></i></span>\n                                                </a>\n\n                                                <ul class=\"child_category_menu\">\n                                                    <li>\n                                                        <a href=\"#blender\">\n                                                            Blender\n                                                        </a>\n                                                    </li>\n                                                    <li>\n                                                        <a href=\"#motion-graphics\">\n                                                            Motion Graphics\n                                                        </a>\n                                                    </li>\n                                                    <li>\n                                                        <a href=\"#after-effects\">\n                                                            After Effects\n                                                        </a>\n                                                    </li>\n                                                    <li>\n                                                        <a href=\"#maya\">\n                                                            Maya\n                                                        </a>\n                                                    </li>\n                                                    <li>\n                                                        <a href=\"#zbrush\">\n                                                            ZBrush\n                                                        </a>\n                                                    </li>\n                                                    <li>\n                                                        <a href=\"#character-modeling\">\n                                                            Character Modeling\n                                                        </a>\n                                                    </li>\n                                                </ul>\n                                            </li>\n                                            <li>\n                                                <a href=\"#interior-design\">\n                                                    <span class=\"me-3\"><i class=\"fab fa-yandex-international\"></i></span>\n                                                    <span class=\"me-auto\">Interior Design</span>\n                                                    <span><i class=\"fi fi-sr-angle-small-right\"></i></span>\n                                                </a>\n\n                                                <ul class=\"child_category_menu\">\n                                                    <li>\n                                                        <a href=\"#color-theory\">\n                                                            Color Theory\n                                                        </a>\n                                                    </li>\n                                                    <li>\n                                                        <a href=\"#lighting-design\">\n                                                            Lighting Design\n                                                        </a>\n                                                    </li>\n                                                    <li>\n                                                        <a href=\"#sketch-up\">\n                                                            Sketch Up\n                                                        </a>\n                                                    </li>\n                                                    <li>\n                                                        <a href=\"#home-improvement\">\n                                                            Home Improvement\n                                                        </a>\n                                                    </li>\n                                                    <li>\n                                                        <a href=\"#3d-lighting\">\n                                                            3D Lighting\n                                                        </a>\n                                                    </li>\n                                                </ul>\n                                            </li>\n                                            <li>\n                                                <a href=\"#user-experience\">\n                                                    <span class=\"me-3\"><i class=\"fas fa-male\"></i></span>\n                                                    <span class=\"me-auto\">User Experience</span>\n                                                    <span><i class=\"fi fi-sr-angle-small-right\"></i></span>\n                                                </a>\n\n                                                <ul class=\"child_category_menu\">\n                                                    <li>\n                                                        <a href=\"#user-experience-design\">\n                                                            User Experience Design\n                                                        </a>\n                                                    </li>\n                                                    <li>\n                                                        <a href=\"#mobile-app-design\">\n                                                            Mobile App Design\n                                                        </a>\n                                                    </li>\n                                                    <li>\n                                                        <a href=\"#user-interface\">\n                                                            User Interface\n                                                        </a>\n                                                    </li>\n                                                    <li>\n                                                        <a href=\"#design-thinking\">\n                                                            Design Thinking\n                                                        </a>\n                                                    </li>\n                                                    <li>\n                                                        <a href=\"#figma\">\n                                                            Figma\n                                                        </a>\n                                                    </li>\n                                                    <li>\n                                                        <a href=\"#prototyping\">\n                                                            Prototyping\n                                                        </a>\n                                                    </li>\n                                                </ul>\n                                            </li>\n                                            <li>\n                                                <a href=\"#graphic-design\">\n                                                    <span class=\"me-3\"><i class=\"fas fa-pencil-alt\"></i></span>\n                                                    <span class=\"me-auto\">Graphic Design</span>\n                                                    <span><i class=\"fi fi-sr-angle-small-right\"></i></span>\n                                                </a>\n\n                                                <ul class=\"child_category_menu\">\n                                                    <li>\n                                                        <a href=\"#photoshop\">\n                                                            Photoshop\n                                                        </a>\n                                                    </li>\n                                                    <li>\n                                                        <a href=\"#adobe-illustrator\">\n                                                            Adobe Illustrator\n                                                        </a>\n                                                    </li>\n                                                    <li>\n                                                        <a href=\"#drawing\">\n                                                            Drawing\n                                                        </a>\n                                                    </li>\n                                                    <li>\n                                                        <a href=\"#logo-design\">\n                                                            Logo Design\n                                                        </a>\n                                                    </li>\n                                                    <li>\n                                                        <a href=\"#digital-art\">\n                                                            Digital Art\n                                                        </a>\n                                                    </li>\n                                                </ul>\n                                            </li>\n                                            <li>\n                                                <a href=\"#web-development\">\n                                                    <span class=\"me-3\"><i class=\"far fa-object-ungroup\"></i></span>\n                                                    <span class=\"me-auto\">Web Development</span>\n                                                    <span><i class=\"fi fi-sr-angle-small-right\"></i></span>\n                                                </a>\n\n                                                <ul class=\"child_category_menu\">\n                                                    <li>\n                                                        <a href=\"#wordpress\">\n                                                            Wordpress\n                                                        </a>\n                                                    </li>\n                                                    <li>\n                                                        <a href=\"#responsive-design\">\n                                                            Responsive Design\n                                                        </a>\n                                                    </li>\n                                                    <li>\n                                                        <a href=\"#bootstrap\">\n                                                            Bootstrap\n                                                        </a>\n                                                    </li>\n                                                    <li>\n                                                        <a href=\"#html-css\">\n                                                            HTML &amp; CSS\n                                                        </a>\n                                                    </li>\n                                                </ul>\n                                            </li>\n                                            <li>\n                                                <a href=\"#>\n                                                    <span class=\" me-3\"=\"\"><i class=\"fas fa-list-ul\"></i>\n                                                    <span class=\"me-auto\">All Courses</span>\n                                                </a>\n                                            </li>\n                                        </ul>\n                                    </div>\n                                </ul>\n                            </li>\n                            <li class=\"ps-5 pe-2\"><a href=\"#blogs\" class=\"\">Blog</a></li>\n                        </ul>\n                    </div>\n                </div>\n            </div>\n            <div class=\"col-auto col-sm-5 col-md-4 ms-auto ms-lg-0\" bis_skin_checked=\"1\">\n                <form action=\"# method=\" get\"=\"\" class=\"Esearch_entry ms-4 mt-2 d-none d-sm-inline-block w-100\">\n                    <input type=\"text\" name=\"search\" class=\"form-control\" placeholder=\"Search...\">\n                    <button type=\"submit\"><i class=\"fa-solid fa-magnifying-glass\"></i></button>\n                </form>\n                <div class=\"floating-searchbar d-inline-block d-sm-none \" bis_skin_checked=\"1\">\n                    <button type=\"button\" class=\"py-3 mt-1\" onclick=\"this.parentElement.querySelector(\'form\').classList.toggle(\'show\')\"><i class=\"fa-solid fa-magnifying-glass\"></i></button>\n                    <form action=\"# method=\" get\"=\"\">\n                        <input type=\"text\" name=\"search\" class=\"form-control\" placeholder=\"Search courses\">\n                        <button type=\"submit\"><i class=\"fa-solid fa-magnifying-glass\"></i></button>\n                    </form>\n                </div>\n            </div>\n            <div class=\"col-auto ms-lg-auto pt-1\" bis_skin_checked=\"1\">\n                <div class=\"primary-end d-flex align-items-center \" bis_skin_checked=\"1\">\n                    <div class=\"d-flex align-items-center gap-2\" bis_skin_checked=\"1\">\n\n                        <a href=\"#cart\" class=\"ms-4 me-4 me-md-5 position-relative\" data-bs-toggle=\"tooltip\" data-bs-title=\"Cart\" data-bs-placement=\"bottom\">\n                            <span class=\"cart-top-number\">\n                                0\n                            </span>\n                            <svg width=\"24\" height=\"24\" viewBox=\"0 0 24 24\" fill=\"none\" xmlns=\"http://www.w3.org/2000/svg\">\n                                <path d=\"M2 2H3.74001C4.82001 2 5.67 2.93 5.58 4L4.75 13.96C4.61 15.59 5.89999 16.99 7.53999 16.99H18.19C19.63 16.99 20.89 15.81 21 14.38L21.54 6.88C21.66 5.22 20.4 3.87 18.73 3.87H5.82001\" stroke=\"#192335\" stroke-width=\"1.5\" stroke-miterlimit=\"10\" stroke-linecap=\"round\" stroke-linejoin=\"round\"></path>\n                                <path d=\"M16.25 22C16.9404 22 17.5 21.4404 17.5 20.75C17.5 20.0596 16.9404 19.5 16.25 19.5C15.5596 19.5 15 20.0596 15 20.75C15 21.4404 15.5596 22 16.25 22Z\" stroke=\"#192335\" stroke-width=\"1.5\" stroke-miterlimit=\"10\" stroke-linecap=\"round\" stroke-linejoin=\"round\"></path>\n                                <path d=\"M8.25 22C8.94036 22 9.5 21.4404 9.5 20.75C9.5 20.0596 8.94036 19.5 8.25 19.5C7.55964 19.5 7 20.0596 7 20.75C7 21.4404 7.55964 22 8.25 22Z\" stroke=\"#192335\" stroke-width=\"1.5\" stroke-miterlimit=\"10\" stroke-linecap=\"round\" stroke-linejoin=\"round\"></path>\n                                <path d=\"M9 8H21\" stroke=\"#192335\" stroke-width=\"1.5\" stroke-miterlimit=\"10\" stroke-linecap=\"round\" stroke-linejoin=\"round\"></path>\n                            </svg>\n                        </a>\n\n                    </div>\n\n\n                    <a href=\"#login\" class=\"d-none d-lg-inline-block eBtn btn gradient mb-1\">Login</a>\n                    <span class=\"toggle-bar text-dark ms-0\" data-bs-toggle=\"offcanvas\" data-bs-target=\"#offcanvasWithBothOptions\" aria-controls=\"offcanvasWithBothOptions\"><i class=\"fa-sharp fa-solid fa-bars\"></i></span>\n                </div>\n            </div>\n        </div>\n\n\n\n\n        <!-- Off Canves Menu -->\n        <div class=\"offcanvas offcanvas-start\" data-bs-scroll=\"true\" tabindex=\"-1\" id=\"offcanvasWithBothOptions\" aria-labelledby=\"offcanvasWithBothOptionsLabel\" bis_skin_checked=\"1\">\n            <div class=\"offcanvas-header\" bis_skin_checked=\"1\">\n                <h5 class=\"offcanvas-title\" id=\"offcanvasWithBothOptionsLabel\"></h5>\n            </div>\n            <div class=\"offcanvas-body px-4\" bis_skin_checked=\"1\">\n                <div class=\"off-menu\" bis_skin_checked=\"1\">\n                    <div class=\"logo-image d-flex align-items-center justify-content-between mb-4\" bis_skin_checked=\"1\">\n                        <a href=\"#\">\n                            <img src=\"#public/assets/upload/dark_logo/dark-logo-1716465907.png\" alt=\"system logo\">\n                        </a>\n                        <button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"offcanvas\" aria-label=\"Close\"></button>\n                    </div>\n                    <div class=\"flex-shrink-0 mt-3\" bis_skin_checked=\"1\">\n                        <ul class=\"list-unstyled ps-0\">\n\n\n                            <li><a href=\"#\" class=\"btn btn-toggle-list d-inline-flex align-items-center rounded border-0 text-16px fw-500 w-100 py-3\">\n                                    Home</a></li>\n                            <li>\n                                <button class=\"btn btn-toggle d-inline-flex align-items-center rounded border-0 text-16px fw-500 w-100 py-3 collapsed\" data-bs-toggle=\"collapse\" data-bs-target=\"#category-collapse\" aria-expanded=\"false\">\n                                    Courses\n                                    <span class=\"icons ms-auto float-end\"><i class=\"fa-solid fa-angle-down\"></i></span>\n                                </button>\n                                <div class=\"collapse\" id=\"category-collapse\" bis_skin_checked=\"1\">\n                                    <ul class=\"btn-toggle-nav list-unstyled fw-normal pb-1 small bg-white pt-0 pb-3\">\n                                        <li>\n                                            <a class=\"py-2 px-3 w-100\" href=\"#music\">Music</a>\n                                        </li>\n                                        <li>\n                                            <a class=\"py-2 px-3 w-100\" href=\"#yoga\">Yoga</a>\n                                        </li>\n                                        <li>\n                                            <a class=\"py-2 px-3 w-100\" href=\"#fashion\">Fashion</a>\n                                        </li>\n                                        <li>\n                                            <a class=\"py-2 px-3 w-100\" href=\"#3d-and-animation\">3D\n                                                and Animation</a>\n                                        </li>\n                                        <li>\n                                            <a class=\"py-2 px-3 w-100\" href=\"#interior-design\">Interior\n                                                Design</a>\n                                        </li>\n                                        <li>\n                                            <a class=\"py-2 px-3 w-100\" href=\"#user-experience\">User\n                                                Experience</a>\n                                        </li>\n                                        <li>\n                                            <a class=\"py-2 px-3 w-100\" href=\"#graphic-design\">Graphic\n                                                Design</a>\n                                        </li>\n                                        <li>\n                                            <a class=\"py-2 px-3 w-100\" href=\"#web-development\">Web\n                                                Development</a>\n                                        </li>\n                                    </ul>\n                                </div>\n                            </li>\n                        </ul>\n                    </div>\n                    <div class=\"btn-off\" bis_skin_checked=\"1\">\n                        <a href=\"#login\" class=\"eBtn btn gradient mb-3\">Login</a>\n                        <a href=\"#register\" class=\"eBtn btn gradient sign\">Sign\n                            Up</a>\n                    </div>\n                </div>\n            </div>\n        </div>\n    </div>\n</header>\n</span>\n\n            </div><div class=\"section parent ui-sortable-handle\" id=\"750\" bis_skin_checked=\"1\">\n                                <section class=\"banner-wraper mt-0 mt-md-5\">\n    <div class=\"container\" bis_skin_checked=\"1\">\n        <div class=\"row justify-content-center\" bis_skin_checked=\"1\">\n            <div class=\"col-md-6 order-2 order-md-1\" bis_skin_checked=\"1\">\n                <div class=\"banner-content\" bis_skin_checked=\"1\">\n                    <h5 class=\"d-flex builder_text parent\" content_type=\"text\" id=\"169\"><img src=\"http://localhost/academy-laravel/sham/academy/public/assets/page-builder/block-image/roket.svg\" alt=\"...\"> The Leader in online learning</h5>\n                    <h1 class=\"builder_text parent\" content_type=\"text\" id=\"964\">Start learning from the world\'s pro \n                        <span class=\"gradient color shadow-none builder_text parent\" content_type=\"text\" id=\"180\">instructors</span></h1>\n                    <p class=\"builder_text parent\" content_type=\"text\" id=\"794\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum.</p>\n                    <span class=\"hero-button\">\n                        <div class=\"banner-btn\" bis_skin_checked=\"1\">\n                            <a href=\"#\" class=\"eBtn gradient\">Get Started</a>\n                            <a href=\"#\" class=\"ps-4 learn-btn\"><i class=\"fa-solid fa-play\"></i>Learn More</a>\n                        </div>\n                    </span>\n                    \n                </div>\n            </div>\n            <div class=\"col-sm-8 col-md-6 order-1 order-md-2\" bis_skin_checked=\"1\">\n                <span class=\"hero-banner\">\n                    <div class=\"banner-image mt-0 mt-md-5\" bis_skin_checked=\"1\">\n                        <img class=\"large-img\" src=\"http://localhost/academy-laravel/sham/academy/public/assets/page-builder/block-image/banner.png\" alt=\"...\">\n                        <div class=\"over-text\" bis_skin_checked=\"1\">\n                            <span>\n                                <svg width=\"30\" height=\"30\" viewBox=\"0 0 30 30\" fill=\"none\" xmlns=\"http://www.w3.org/2000/svg\">\n                                <g clip-path=\"url(#clip0_47_63)\">\n                                <mask id=\"mask0_47_63\" style=\"mask-type:luminance\" maskUnits=\"userSpaceOnUse\" x=\"0\" y=\"0\" width=\"30\" height=\"30\">\n                                <path d=\"M0 1.90735e-06H30V30H0V1.90735e-06Z\" fill=\"white\"></path>\n                                </mask>\n                                <g mask=\"url(#mask0_47_63)\">\n                                <path d=\"M7.36816 27.2279V29.5615\" stroke=\"white\" stroke-width=\"0.878906\" stroke-miterlimit=\"10\" stroke-linecap=\"round\" stroke-linejoin=\"round\"></path>\n                                <path d=\"M22.6289 27.2279V29.5615\" stroke=\"white\" stroke-width=\"0.878906\" stroke-miterlimit=\"10\" stroke-linecap=\"round\" stroke-linejoin=\"round\"></path>\n                                </g>\n                                <path d=\"M5.94995 4.26311V7.34473\" stroke=\"white\" stroke-width=\"0.878906\" stroke-miterlimit=\"10\" stroke-linecap=\"round\" stroke-linejoin=\"round\"></path>\n                                <mask id=\"mask1_47_63\" style=\"mask-type:luminance\" maskUnits=\"userSpaceOnUse\" x=\"0\" y=\"0\" width=\"30\" height=\"30\">\n                                <path d=\"M0 1.90735e-06H30V30H0V1.90735e-06Z\" fill=\"white\"></path>\n                                </mask>\n                                <g mask=\"url(#mask1_47_63)\">\n                                <path d=\"M3.56714 27.2547V28.1348C3.56714 28.9227 4.20587 29.5615 4.9939 29.5615H25.0054C25.7933 29.5615 26.4321 28.9227 26.4321 28.1348V23.8904C26.4321 22.1012 25.2529 20.5261 23.5362 20.0221L21.7134 19.487L14.9996 23.4764L8.28622 19.4872L6.46331 20.0222C4.74646 20.5261 3.56714 22.1013 3.56714 23.8906V25.2003\" stroke=\"white\" stroke-width=\"0.878906\" stroke-miterlimit=\"10\" stroke-linecap=\"round\" stroke-linejoin=\"round\"></path>\n                                <path d=\"M21.7133 19.4871L17.6291 16.8194C17.6291 18.5262 17.1336 20.1963 16.2029 21.6269L14.9995 23.4766\" stroke=\"white\" stroke-width=\"0.878906\" stroke-miterlimit=\"10\" stroke-linecap=\"round\" stroke-linejoin=\"round\"></path>\n                                <path d=\"M8.28589 19.4871L12.3702 16.8194C12.3702 18.5262 12.8656 20.1963 13.7963 21.6269L14.9997 23.4766\" stroke=\"white\" stroke-width=\"0.878906\" stroke-miterlimit=\"10\" stroke-linecap=\"round\" stroke-linejoin=\"round\"></path>\n                                <path d=\"M11.2968 7.40565V8.73256C11.2968 9.26494 10.8652 9.6966 10.3328 9.6966H9.37549V11.273C9.37549 11.6758 9.70203 12.0024 10.1049 12.0024C10.232 12.0024 10.3354 12.1019 10.3434 12.2288C10.4972 14.6673 12.5224 16.5977 14.9996 16.5977C17.4769 16.5977 19.5021 14.6673 19.6559 12.2288C19.664 12.1019 19.7673 12.0024 19.8944 12.0024C20.2972 12.0024 20.6238 11.6758 20.6238 11.273V9.6966H19.6665C19.1341 9.6966 18.7025 9.26494 18.7025 8.73256V7.40565\" stroke=\"white\" stroke-width=\"0.878906\" stroke-miterlimit=\"10\" stroke-linecap=\"round\" stroke-linejoin=\"round\"></path>\n                                <path d=\"M12.3682 15.7837V16.8203L12.3701 16.8191\" stroke=\"white\" stroke-width=\"0.878906\" stroke-miterlimit=\"10\" stroke-linecap=\"round\" stroke-linejoin=\"round\"></path>\n                                <path d=\"M17.6292 16.8193V15.7851\" stroke=\"white\" stroke-width=\"0.878906\" stroke-miterlimit=\"10\" stroke-linecap=\"round\" stroke-linejoin=\"round\"></path>\n                                <path d=\"M17.7716 4.37924L16.0506 4.16631C15.352 4.07994 14.6455 4.07994 13.947 4.16637L10.0603 4.6473L9.01416 4.77674V6.975C9.01416 7.18898 9.1702 7.36611 9.37457 7.39998C9.39771 7.40379 9.42121 7.40625 9.44541 7.40625H20.5539C20.5775 7.40625 20.6004 7.40385 20.6229 7.40027C20.8282 7.36711 20.9853 7.18963 20.9853 6.975V4.77674L19.9371 4.64707L19.8139 4.63189\" stroke=\"white\" stroke-width=\"0.878906\" stroke-miterlimit=\"10\" stroke-linecap=\"round\" stroke-linejoin=\"round\"></path>\n                                <path d=\"M20.6228 9.69629V7.39936\" stroke=\"white\" stroke-width=\"0.878906\" stroke-miterlimit=\"10\" stroke-linecap=\"round\" stroke-linejoin=\"round\"></path>\n                                <path d=\"M9.37451 7.39906L9.37545 9.69629\" stroke=\"white\" stroke-width=\"0.878906\" stroke-miterlimit=\"10\" stroke-linecap=\"round\" stroke-linejoin=\"round\"></path>\n                                <path d=\"M20.984 4.77625L23.9943 4.26355C24.5087 4.17596 24.5588 3.45666 24.0616 3.29857L15.1495 0.463867C15.0513 0.432637 14.9459 0.432637 14.8477 0.463867L5.93555 3.29857C5.43838 3.45666 5.48854 4.17596 6.00288 4.26355L9.01401 4.77637\" stroke=\"white\" stroke-width=\"0.878906\" stroke-miterlimit=\"10\" stroke-linecap=\"round\" stroke-linejoin=\"round\"></path>\n                                <path d=\"M5.01803 9.03922L4.4243 12.5241C4.36823 12.8531 4.62165 13.1533 4.9554 13.1533H6.9446C7.27823 13.1533 7.53165 12.8531 7.47563 12.5241L6.88196 9.03922\" stroke=\"white\" stroke-width=\"0.878906\" stroke-miterlimit=\"10\" stroke-linecap=\"round\" stroke-linejoin=\"round\"></path>\n                                <path d=\"M6.88199 7.81557C6.88199 7.55559 6.67123 7.34482 6.41125 7.34482H5.48881C5.22883 7.34482 5.01807 7.55559 5.01807 7.81557V9.03906H6.88199V7.81557Z\" stroke=\"white\" stroke-width=\"0.878906\" stroke-miterlimit=\"10\" stroke-linecap=\"round\" stroke-linejoin=\"round\"></path>\n                                <path d=\"M17.2406 19.4043C16.5501 19.5564 15.7935 19.6406 14.9996 19.6406C14.2056 19.6406 13.449 19.5564 12.7585 19.4043\" stroke=\"white\" stroke-width=\"0.878906\" stroke-miterlimit=\"10\" stroke-linecap=\"round\" stroke-linejoin=\"round\"></path>\n                                </g>\n                                </g>\n                                <defs>\n                                <clipPath id=\"clip0_47_63\">\n                                <rect width=\"30\" height=\"30\" fill=\"white\"></rect>\n                                </clipPath>\n                                </defs>\n                                </svg>\n                            </span>\n                            <div class=\"b-text\" bis_skin_checked=\"1\">\n                                <h5>250k +</h5>\n                                <p>Students has Enrolled</p>\n                            </div>\n                        </div>\n                    </div>\n                </span>\n            </div>\n        </div>\n    </div>\n</section>\n            </div><div class=\"section parent ui-sortable-handle\" id=\"383\" bis_skin_checked=\"1\">\n                                <section class=\"performance-wrapper section-padding\">\n    <div class=\"container\" bis_skin_checked=\"1\">\n        <div class=\"pr-wrap\" bis_skin_checked=\"1\">\n            <div class=\"row\" bis_skin_checked=\"1\">\n                <div class=\"col-lg-3 col-md-6 col-sm-6  ps-border\" bis_skin_checked=\"1\">\n                    <div class=\"ps-single-wrap\" bis_skin_checked=\"1\">\n                        <span class=\"builder_image parent\" content_type=\"image\" id=\"87\">\n                            <img src=\"http://localhost/academy-laravel/sham/academy/public/assets/page-builder/block-image/p1.png\" alt=\"...\">\n                        </span>\n                        <h4>\n                            <span class=\"builder_text parent\" content_type=\"text\" id=\"762\">\n                                Fast Performance\n                            </span>\n                        </h4>\n\n                        <p class=\"description\">\n                            <span class=\"builder_text parent\" content_type=\"text\" id=\"677\">\n                                It is a long established fact that a reader will be distracted.</span>\n                        </p>\n                    </div>\n                </div>\n                <div class=\"col-lg-3 col-md-6 col-sm-6 ps-border\" bis_skin_checked=\"1\">\n                    <div class=\"ps-single-wrap\" bis_skin_checked=\"1\">\n                        <span class=\"builder_image parent\" content_type=\"image\" id=\"723\">\n                            <img src=\"http://localhost/academy-laravel/sham/academy/public/assets/page-builder/block-image/p2.png\" alt=\"...\">\n                        </span>\n                        <h4>\n                            <span class=\"builder_text parent\" content_type=\"text\" id=\"54\">\n                                Perfect Responsive\n                            </span>\n                        </h4>\n                        <p class=\"description\">\n                            <span class=\"builder_text parent\" content_type=\"text\" id=\"597\">\n                                It is a long established fact that a reader will be distracted.\n                            </span>\n                        </p>\n                    </div>\n                </div>\n                <div class=\"col-lg-3 col-md-6 col-sm-6 ps-border\" bis_skin_checked=\"1\">\n                    <div class=\"ps-single-wrap\" bis_skin_checked=\"1\">\n                        <span class=\"builder_image parent\" content_type=\"image\" id=\"693\">\n                            <img src=\"http://localhost/academy-laravel/sham/academy/public/assets/page-builder/block-image/p3.png\" alt=\"...\">\n                        </span>\n                        <h4>\n                            <span class=\"builder_text parent\" content_type=\"text\" id=\"503\">\n                                Fast &amp; Friendly Support\n                            </span>\n                        </h4>\n                        <p class=\"description\">\n                            <span class=\"builder_text parent\" content_type=\"text\" id=\"319\">\n                                It is a long established fact that a reader will be distracted.\n                            </span>\n                        </p>\n                    </div>\n                </div>\n                <div class=\"col-lg-3 col-md-6 col-sm-6 ps-border\" bis_skin_checked=\"1\">\n                    <div class=\"ps-single-wrap\" bis_skin_checked=\"1\">\n                        <span class=\"builder_image parent\" content_type=\"image\" id=\"424\">\n                            <img src=\"http://localhost/academy-laravel/sham/academy/public/assets/page-builder/block-image/p4.png\" alt=\"...\">\n                        </span>\n                        <h4>\n                            <span class=\"builder_text parent\" content_type=\"text\" id=\"668\">\n                                Easy to Use\n                            </span>\n                        </h4>\n                        <p class=\"description\">\n                            <span class=\"builder_text parent\" content_type=\"text\" id=\"325\">\n                                It is a long established fact that a reader will be distracted.\n                            </span>\n                        </p>\n                    </div>\n                </div>\n            </div>\n        </div>\n    </div>\n</section>\n            </div><div class=\"section parent ui-sortable-handle\" id=\"131\" bis_skin_checked=\"1\">\n                                <section class=\"category-wrapper section-padding\">\n    <div class=\"container\" bis_skin_checked=\"1\">\n        <div class=\"row\" bis_skin_checked=\"1\">\n            <div class=\"col-lg-12\" bis_skin_checked=\"1\">\n                <div class=\"section-title text-center\" bis_skin_checked=\"1\">\n                    <span class=\"title-head builder_text parent\" content_type=\"text\" id=\"796\">Categories</span>\n                    <h2 class=\"title builder_text parent\" content_type=\"text\" id=\"470\">Explore Top Courses Caterories</h2>\n                </div>\n            </div>\n        </div>\n        <span class=\"category\">\n            <div class=\"row\" bis_skin_checked=\"1\">\n                <div class=\"col-lg-3 col-md-4 col-sm-6 mb-30\" bis_skin_checked=\"1\">\n                    <a href=\"#\" class=\"single-category\">\n                        <span>\n                            <img src=\"http://localhost/academy-laravel/sham/academy/public/assets/page-builder/block-image/image 36.svg\" alt=\"\">\n                        </span>\n                        <h4>Web Design</h4>\n                        <p>04 Courses</p>\n                    </a>\n                </div>\n                <div class=\"col-lg-3 col-md-4 col-sm-6 mb-30\" bis_skin_checked=\"1\">\n                    <a href=\"#\" class=\"single-category\">\n                        <span>\n                        <img src=\"http://localhost/academy-laravel/sham/academy/public/assets/page-builder/block-image/image 37.svg\" alt=\"\">\n                        </span>\n                        <h4>Graphic Design</h4>\n                        <p>12 Courses</p>\n                    </a>\n                </div>\n                <div class=\"col-lg-3 col-md-4 col-sm-6 mb-30\" bis_skin_checked=\"1\">\n                    <a href=\"#\" class=\"single-category\">\n                        <span>\n                        <img src=\"http://localhost/academy-laravel/sham/academy/public/assets/page-builder/block-image/image 38.svg\" alt=\"\">\n                        </span>\n                        <h4>Web Development</h4>\n                        <p>10 Courses</p>\n                    </a>\n                </div>\n                <div class=\"col-lg-3 col-md-4 col-sm-6 mb-30\" bis_skin_checked=\"1\">\n                    <a href=\"#\" class=\"single-category\">\n                        <span>\n                        <img src=\"http://localhost/academy-laravel/sham/academy/public/assets/page-builder/block-image/image 39.svg\" alt=\"\">   \n                        </span>\n                        <h4>Digital Marketing</h4>\n                        <p>11 Courses</p>\n                    </a>\n                </div>\n                <div class=\"col-lg-3 col-md-4 col-sm-6 mb-30\" bis_skin_checked=\"1\">\n                    <a href=\"#\" class=\"single-category\">\n                        <span>\n                        <img src=\"http://localhost/academy-laravel/sham/academy/public/assets/page-builder/block-image/image 40.svg\" alt=\"\">   \n                        </span>\n                        <h4>Art &amp; Humanities</h4>\n                        <p>9 Courses</p>\n                    </a>\n                </div>\n                <div class=\"col-lg-3 col-md-4 col-sm-6 mb-30\" bis_skin_checked=\"1\">\n                    <a href=\"#\" class=\"single-category\">\n                        <span>  \n                            <img src=\"http://localhost/academy-laravel/sham/academy/public/assets/page-builder/block-image/image 41.svg\" alt=\"\">  \n                        </span>\n                        <h4>Color Theory</h4>\n                        <p>10 Courses</p>\n                    </a>\n                </div>\n                <div class=\"col-lg-3 col-md-4 col-sm-6 mb-30\" bis_skin_checked=\"1\">\n                    <a href=\"#\" class=\"single-category\">\n                        <span>\n                            <img src=\"http://localhost/academy-laravel/sham/academy/public/assets/page-builder/block-image/image 42.svg\" alt=\"...\">   \n                        </span>\n                        <h4>Motion Graphic</h4>\n                        <p>8 Courses</p>\n                    </a>\n                </div>\n                <div class=\"col-lg-3 col-md-4 col-sm-6 mb-30\" bis_skin_checked=\"1\">\n                    <a href=\"#\" class=\"single-category\">\n                        <span>\n                            <img src=\"http://localhost/academy-laravel/sham/academy/public/assets/page-builder/block-image/image 43.svg\" alt=\"...\">    \n                        </span>\n                        <h4>Blander 3D</h4>\n                        <p>12 Courses</p>\n                    </a>\n                </div>\n            </div>\n        </span>\n    </div>\n</section>\n            </div><div class=\"section parent ui-sortable-handle\" id=\"342\" bis_skin_checked=\"1\">\n                                <section class=\"feature-wrapper section-padding\">\n    <div class=\"container\" bis_skin_checked=\"1\">\n        <div class=\"row\" bis_skin_checked=\"1\">\n            <div class=\"col-lg-12\" bis_skin_checked=\"1\">\n                <div class=\"res-control d-flex align-items-center justify-content-between\" bis_skin_checked=\"1\">\n                    <div class=\"section-title mb-0\" bis_skin_checked=\"1\">\n                        <span class=\"title-head builder_text parent\" content_type=\"text\" id=\"316\">Courses</span>\n                        <h2 class=\"title builder_text parent\" content_type=\"text\" id=\"767\">Featured Courses\n                        </h2>\n                    </div>\n                    <span class=\"featured-course-all-button\">\n                        <a href=\"#\" class=\"eBtn gradient\">View All Courses</a>\n                    </span>\n                </div>\n            </div>\n        </div>\n        <span class=\"featured-course\">\n            <div class=\"row mt-50\" bis_skin_checked=\"1\">\n                <div class=\"col-lg-6 col-md-12 col-sm-6 mb-30\" bis_skin_checked=\"1\">\n                    <a href=\"#\" class=\"single-feature\">\n                        <div class=\"row\" bis_skin_checked=\"1\">\n                            <div class=\"col-lg-4 col-md-4\" bis_skin_checked=\"1\">\n                                <div class=\"courses-img\" bis_skin_checked=\"1\">\n                                    <img src=\"http://localhost/academy-laravel/sham/academy/public/assets/page-builder/block-image/course-1.png\" alt=\"...\">\n                                    <div class=\"cText d-flex\" bis_skin_checked=\"1\">\n                                        <h4>$60.00</h4>\n                                        <del>$30.00</del>\n                                    </div>\n                                </div>\n                            </div>\n                            <div class=\"col-lg-8 col-md-8\" bis_skin_checked=\"1\">\n                                <div class=\"entry-details\" bis_skin_checked=\"1\">\n                                    <div class=\"entry-title\" bis_skin_checked=\"1\">\n                                        <h3>Complete Blender Creator : Learn 3D Modelling</h3>\n                                        <span class=\"heart\"><i class=\"fa-regular fa-heart\"></i></span>\n                                    </div>\n                                    <ul>\n                                        <li>\n                                            <svg width=\"20\" height=\"20\" viewBox=\"0 0 20 20\" fill=\"none\" xmlns=\"http://www.w3.org/2000/svg\">\n                                                <path d=\"M12.6521 9.54004L14.8477 8.27081C14.9758 8.19549 15.0399 8.08879 15.0399 7.95071C15.0399 7.81263 14.9758 7.70458 14.8477 7.62658L12.6521 6.35735C12.5395 6.29326 12.4144 6.26121 12.2768 6.26121C12.1392 6.26121 12.0133 6.29326 11.8989 6.35735L9.70344 7.62658C9.57523 7.7019 9.51113 7.8086 9.51113 7.94669C9.51113 8.08479 9.57523 8.19283 9.70344 8.27081L11.8989 9.54004C12.0115 9.60414 12.1366 9.63619 12.2743 9.63619C12.4119 9.63619 12.5378 9.60414 12.6521 9.54004ZM12.6521 11.9968L14.1265 11.1554C14.2395 11.0928 14.3305 11.0021 14.3995 10.8832C14.4686 10.7643 14.5031 10.636 14.5031 10.4984V9.32371L12.6521 10.399C12.5392 10.4685 12.4136 10.5032 12.2755 10.5032C12.1374 10.5032 12.0119 10.4685 11.8989 10.399L10.048 9.32371V10.4984C10.048 10.636 10.0825 10.7643 10.1515 10.8832C10.2206 11.0021 10.3116 11.0928 10.4246 11.1554L11.8989 11.9968C12.0115 12.0609 12.1366 12.0929 12.2743 12.0929C12.4119 12.0929 12.5378 12.0609 12.6521 11.9968ZM16.4101 16.25H12.2755C12.2755 16.0416 12.2684 15.8333 12.2543 15.625C12.2401 15.4166 12.2189 15.2083 12.1906 15H16.4101C16.4849 15 16.5464 14.9759 16.5944 14.9279C16.6425 14.8798 16.6666 14.8183 16.6666 14.7435V5.25642C16.6666 5.18163 16.6425 5.12019 16.5944 5.0721C16.5464 5.02402 16.4849 4.99998 16.4101 4.99998H3.58967C3.51488 4.99998 3.45344 5.02402 3.40536 5.0721C3.35727 5.12019 3.33323 5.18163 3.33323 5.25642V6.14263C3.1249 6.11431 2.91657 6.09307 2.70825 6.07892C2.49992 6.06476 2.29159 6.05769 2.08325 6.05769V5.25642C2.08325 4.84215 2.23076 4.48752 2.52577 4.19252C2.82077 3.89751 3.17541 3.75 3.58967 3.75H16.4101C16.8244 3.75 17.179 3.89751 17.474 4.19252C17.769 4.48752 17.9165 4.84215 17.9165 5.25642V14.7435C17.9165 15.1578 17.769 15.5124 17.474 15.8074C17.179 16.1025 16.8244 16.25 16.4101 16.25ZM6.58498 16.25C6.41715 16.25 6.27127 16.1973 6.14734 16.0921C6.02341 15.9869 5.94595 15.8498 5.91498 15.681C5.79425 14.8274 5.42592 14.1017 4.81 13.504C4.19409 12.9062 3.45664 12.5443 2.59767 12.4182C2.43692 12.3974 2.31099 12.3219 2.2199 12.1917C2.1288 12.0615 2.08325 11.913 2.08325 11.7464C2.08325 11.5693 2.14362 11.4209 2.26436 11.3013C2.38508 11.1816 2.52556 11.133 2.68581 11.1555C3.8685 11.2901 4.87623 11.7759 5.70902 12.613C6.54181 13.45 7.02712 14.4599 7.16494 15.6426C7.18737 15.8114 7.1409 15.9548 7.02552 16.0729C6.91013 16.1909 6.76329 16.25 6.58498 16.25ZM9.82361 16.25C9.64091 16.25 9.49107 16.1869 9.37409 16.0609C9.25711 15.9348 9.18741 15.7777 9.16496 15.5897C9.00257 13.86 8.31027 12.3918 7.08804 11.1851C5.86582 9.97834 4.3872 9.3034 2.65217 9.16023C2.48336 9.14313 2.34634 9.07206 2.24111 8.94702C2.13587 8.82197 2.08325 8.67607 2.08325 8.50933C2.08325 8.33217 2.14148 8.18162 2.25794 8.05769C2.37438 7.93377 2.5154 7.88035 2.681 7.89744C4.7622 8.0406 6.53275 8.84135 7.99267 10.2997C9.4526 11.758 10.2627 13.5235 10.4229 15.5961C10.44 15.7788 10.3887 15.9334 10.2689 16.06C10.1491 16.1867 10.0007 16.25 9.82361 16.25ZM2.93215 16.25C2.6942 16.25 2.49324 16.1678 2.32925 16.0035C2.16525 15.8392 2.08325 15.6381 2.08325 15.4001C2.08325 15.1622 2.1654 14.9612 2.32971 14.7972C2.494 14.6332 2.69512 14.5512 2.93306 14.5512C3.17101 14.5512 3.37197 14.6334 3.53596 14.7977C3.69996 14.962 3.78196 15.1631 3.78196 15.4011C3.78196 15.639 3.69981 15.84 3.5355 16.004C3.37121 16.168 3.17009 16.25 2.93215 16.25Z\" fill=\"#6B7385\"></path>\n                                            </svg>\n                                            12 lesson\n                                        </li>\n                                        <li>\n                                            <svg width=\"20\" height=\"20\" viewBox=\"0 0 20 20\" fill=\"none\" xmlns=\"http://www.w3.org/2000/svg\">\n                                                <path d=\"M2.25174 16.0896C2.03834 16.0896 1.85945 16.0174 1.71508 15.873C1.57072 15.7287 1.49854 15.5498 1.49854 15.3364V14.237C1.49854 13.8075 1.60938 13.4243 1.83108 13.0872C2.05276 12.7501 2.34881 12.4879 2.71924 12.3005C3.5112 11.9131 4.30755 11.6145 5.10828 11.4045C5.90904 11.1946 6.78911 11.0896 7.74852 11.0896C8.70792 11.0896 9.58799 11.1946 10.3887 11.4045C11.1895 11.6145 11.9858 11.9131 12.7778 12.3005C13.1482 12.4879 13.4443 12.7501 13.666 13.0872C13.8876 13.4243 13.9985 13.8075 13.9985 14.237V15.3364C13.9985 15.5498 13.9263 15.7287 13.7819 15.873C13.6376 16.0174 13.4587 16.0896 13.2453 16.0896H2.25174ZM15.3414 16.0896C15.4437 16.0024 15.5232 15.8934 15.58 15.7626C15.6367 15.6318 15.6651 15.4855 15.6651 15.3236V14.1345C15.6651 13.5875 15.5312 13.0662 15.2633 12.5705C14.9955 12.0749 14.6155 11.6497 14.1235 11.2948C14.6823 11.3781 15.2127 11.5071 15.7148 11.6818C16.217 11.8565 16.6961 12.0629 17.1523 12.3012C17.5829 12.5309 17.9154 12.8016 18.1499 13.1133C18.3844 13.4251 18.5017 13.7655 18.5017 14.1345V15.3364C18.5017 15.5498 18.4295 15.7287 18.2851 15.873C18.1407 16.0174 17.9619 16.0896 17.7485 16.0896H15.3414ZM7.74852 9.74343C6.94645 9.74343 6.25982 9.45784 5.68864 8.88668C5.11746 8.3155 4.83187 7.62887 4.83187 6.8268C4.83187 6.02472 5.11746 5.33809 5.68864 4.76693C6.25982 4.19575 6.94645 3.91016 7.74852 3.91016C8.55058 3.91016 9.23721 4.19575 9.80839 4.76693C10.3796 5.33809 10.6651 6.02472 10.6651 6.8268C10.6651 7.62887 10.3796 8.3155 9.80839 8.88668C9.23721 9.45784 8.55058 9.74343 7.74852 9.74343ZM14.944 6.8268C14.944 7.62887 14.6584 8.3155 14.0872 8.88668C13.516 9.45784 12.8294 9.74343 12.0273 9.74343C11.9333 9.74343 11.8136 9.73275 11.6683 9.71139C11.5231 9.69003 11.4034 9.66653 11.3094 9.64089C11.638 9.24579 11.8906 8.80748 12.0671 8.32595C12.2436 7.84442 12.3318 7.34437 12.3318 6.8258C12.3318 6.30725 12.2418 5.80918 12.0618 5.33162C11.8818 4.85406 11.631 4.41443 11.3094 4.01272C11.429 3.96998 11.5487 3.94221 11.6683 3.92939C11.788 3.91657 11.9077 3.91016 12.0273 3.91016C12.8294 3.91016 13.516 4.19575 14.0872 4.76693C14.6584 5.33809 14.944 6.02472 14.944 6.8268ZM2.74851 14.8396H12.7485V14.237C12.7485 14.0629 12.705 13.908 12.6179 13.7723C12.5308 13.6366 12.3927 13.518 12.2036 13.4165C11.5177 13.0629 10.8115 12.795 10.0851 12.6128C9.35856 12.4307 8.57971 12.3396 7.74852 12.3396C6.91732 12.3396 6.13847 12.4307 5.41197 12.6128C4.68549 12.795 3.97929 13.0629 3.29339 13.4165C3.10429 13.518 2.9662 13.6366 2.87912 13.7723C2.79205 13.908 2.74851 14.0629 2.74851 14.237V14.8396ZM7.74852 8.49347C8.20685 8.49347 8.59921 8.33028 8.9256 8.00389C9.25199 7.6775 9.41518 7.28514 9.41518 6.8268C9.41518 6.36847 9.25199 5.97611 8.9256 5.64972C8.59921 5.32333 8.20685 5.16014 7.74852 5.16014C7.29018 5.16014 6.89782 5.32333 6.57143 5.64972C6.24504 5.97611 6.08185 6.36847 6.08185 6.8268C6.08185 7.28514 6.24504 7.6775 6.57143 8.00389C6.89782 8.33028 7.29018 8.49347 7.74852 8.49347Z\" fill=\"#6B7385\"></path>\n                                            </svg>\n                                            50 Students\n                                        </li>\n                                    </ul>\n                                    <p class=\"description\">It is a long established fact that a reader will be\n                                        distracted by the readable...</p>\n                                    <div class=\"creator\" bis_skin_checked=\"1\">\n                                        <img src=\"http://localhost/academy-laravel/sham/academy/public/assets/page-builder/block-image/profile.png\" alt=\"...\">\n                                        <p>by <span>Angelina Ross</span> in <span>Design</span></p>\n                                    </div>\n                                </div>\n                            </div>\n                        </div>\n                    </a>\n                </div>\n                <div class=\"col-lg-6 col-md-12 col-sm-6 mb-30\" bis_skin_checked=\"1\">\n                    <a href=\"#\" class=\"single-feature\">\n                        <div class=\"row\" bis_skin_checked=\"1\">\n                            <div class=\"col-lg-4 col-md-4\" bis_skin_checked=\"1\">\n                                <div class=\"courses-img\" bis_skin_checked=\"1\">\n                                    <img src=\"http://localhost/academy-laravel/sham/academy/public/assets/page-builder/block-image/course-2.png\" alt=\"...\">\n                                    <div class=\"cText d-flex\" bis_skin_checked=\"1\">\n                                        <h4>$60.00</h4>\n                                        <del>$30.00</del>\n                                    </div>\n                                </div>\n                            </div>\n                            <div class=\"col-lg-8 col-md-8\" bis_skin_checked=\"1\">\n                                <div class=\"entry-details\" bis_skin_checked=\"1\">\n                                    <div class=\"entry-title\" bis_skin_checked=\"1\">\n                                        <h3>The Complete Digital Marketing Guide</h3>\n                                        <span class=\"heart\"><i class=\"fa-regular fa-heart\"></i></span>\n                                    </div>\n                                    <ul>\n                                        <li>\n                                            <svg width=\"20\" height=\"20\" viewBox=\"0 0 20 20\" fill=\"none\" xmlns=\"http://www.w3.org/2000/svg\">\n                                                <path d=\"M12.6521 9.54004L14.8477 8.27081C14.9758 8.19549 15.0399 8.08879 15.0399 7.95071C15.0399 7.81263 14.9758 7.70458 14.8477 7.62658L12.6521 6.35735C12.5395 6.29326 12.4144 6.26121 12.2768 6.26121C12.1392 6.26121 12.0133 6.29326 11.8989 6.35735L9.70344 7.62658C9.57523 7.7019 9.51113 7.8086 9.51113 7.94669C9.51113 8.08479 9.57523 8.19283 9.70344 8.27081L11.8989 9.54004C12.0115 9.60414 12.1366 9.63619 12.2743 9.63619C12.4119 9.63619 12.5378 9.60414 12.6521 9.54004ZM12.6521 11.9968L14.1265 11.1554C14.2395 11.0928 14.3305 11.0021 14.3995 10.8832C14.4686 10.7643 14.5031 10.636 14.5031 10.4984V9.32371L12.6521 10.399C12.5392 10.4685 12.4136 10.5032 12.2755 10.5032C12.1374 10.5032 12.0119 10.4685 11.8989 10.399L10.048 9.32371V10.4984C10.048 10.636 10.0825 10.7643 10.1515 10.8832C10.2206 11.0021 10.3116 11.0928 10.4246 11.1554L11.8989 11.9968C12.0115 12.0609 12.1366 12.0929 12.2743 12.0929C12.4119 12.0929 12.5378 12.0609 12.6521 11.9968ZM16.4101 16.25H12.2755C12.2755 16.0416 12.2684 15.8333 12.2543 15.625C12.2401 15.4166 12.2189 15.2083 12.1906 15H16.4101C16.4849 15 16.5464 14.9759 16.5944 14.9279C16.6425 14.8798 16.6666 14.8183 16.6666 14.7435V5.25642C16.6666 5.18163 16.6425 5.12019 16.5944 5.0721C16.5464 5.02402 16.4849 4.99998 16.4101 4.99998H3.58967C3.51488 4.99998 3.45344 5.02402 3.40536 5.0721C3.35727 5.12019 3.33323 5.18163 3.33323 5.25642V6.14263C3.1249 6.11431 2.91657 6.09307 2.70825 6.07892C2.49992 6.06476 2.29159 6.05769 2.08325 6.05769V5.25642C2.08325 4.84215 2.23076 4.48752 2.52577 4.19252C2.82077 3.89751 3.17541 3.75 3.58967 3.75H16.4101C16.8244 3.75 17.179 3.89751 17.474 4.19252C17.769 4.48752 17.9165 4.84215 17.9165 5.25642V14.7435C17.9165 15.1578 17.769 15.5124 17.474 15.8074C17.179 16.1025 16.8244 16.25 16.4101 16.25ZM6.58498 16.25C6.41715 16.25 6.27127 16.1973 6.14734 16.0921C6.02341 15.9869 5.94595 15.8498 5.91498 15.681C5.79425 14.8274 5.42592 14.1017 4.81 13.504C4.19409 12.9062 3.45664 12.5443 2.59767 12.4182C2.43692 12.3974 2.31099 12.3219 2.2199 12.1917C2.1288 12.0615 2.08325 11.913 2.08325 11.7464C2.08325 11.5693 2.14362 11.4209 2.26436 11.3013C2.38508 11.1816 2.52556 11.133 2.68581 11.1555C3.8685 11.2901 4.87623 11.7759 5.70902 12.613C6.54181 13.45 7.02712 14.4599 7.16494 15.6426C7.18737 15.8114 7.1409 15.9548 7.02552 16.0729C6.91013 16.1909 6.76329 16.25 6.58498 16.25ZM9.82361 16.25C9.64091 16.25 9.49107 16.1869 9.37409 16.0609C9.25711 15.9348 9.18741 15.7777 9.16496 15.5897C9.00257 13.86 8.31027 12.3918 7.08804 11.1851C5.86582 9.97834 4.3872 9.3034 2.65217 9.16023C2.48336 9.14313 2.34634 9.07206 2.24111 8.94702C2.13587 8.82197 2.08325 8.67607 2.08325 8.50933C2.08325 8.33217 2.14148 8.18162 2.25794 8.05769C2.37438 7.93377 2.5154 7.88035 2.681 7.89744C4.7622 8.0406 6.53275 8.84135 7.99267 10.2997C9.4526 11.758 10.2627 13.5235 10.4229 15.5961C10.44 15.7788 10.3887 15.9334 10.2689 16.06C10.1491 16.1867 10.0007 16.25 9.82361 16.25ZM2.93215 16.25C2.6942 16.25 2.49324 16.1678 2.32925 16.0035C2.16525 15.8392 2.08325 15.6381 2.08325 15.4001C2.08325 15.1622 2.1654 14.9612 2.32971 14.7972C2.494 14.6332 2.69512 14.5512 2.93306 14.5512C3.17101 14.5512 3.37197 14.6334 3.53596 14.7977C3.69996 14.962 3.78196 15.1631 3.78196 15.4011C3.78196 15.639 3.69981 15.84 3.5355 16.004C3.37121 16.168 3.17009 16.25 2.93215 16.25Z\" fill=\"#6B7385\"></path>\n                                            </svg>\n                                            12 lesson\n                                        </li>\n                                        <li>\n                                            <svg width=\"20\" height=\"20\" viewBox=\"0 0 20 20\" fill=\"none\" xmlns=\"http://www.w3.org/2000/svg\">\n                                                <path d=\"M2.25174 16.0896C2.03834 16.0896 1.85945 16.0174 1.71508 15.873C1.57072 15.7287 1.49854 15.5498 1.49854 15.3364V14.237C1.49854 13.8075 1.60938 13.4243 1.83108 13.0872C2.05276 12.7501 2.34881 12.4879 2.71924 12.3005C3.5112 11.9131 4.30755 11.6145 5.10828 11.4045C5.90904 11.1946 6.78911 11.0896 7.74852 11.0896C8.70792 11.0896 9.58799 11.1946 10.3887 11.4045C11.1895 11.6145 11.9858 11.9131 12.7778 12.3005C13.1482 12.4879 13.4443 12.7501 13.666 13.0872C13.8876 13.4243 13.9985 13.8075 13.9985 14.237V15.3364C13.9985 15.5498 13.9263 15.7287 13.7819 15.873C13.6376 16.0174 13.4587 16.0896 13.2453 16.0896H2.25174ZM15.3414 16.0896C15.4437 16.0024 15.5232 15.8934 15.58 15.7626C15.6367 15.6318 15.6651 15.4855 15.6651 15.3236V14.1345C15.6651 13.5875 15.5312 13.0662 15.2633 12.5705C14.9955 12.0749 14.6155 11.6497 14.1235 11.2948C14.6823 11.3781 15.2127 11.5071 15.7148 11.6818C16.217 11.8565 16.6961 12.0629 17.1523 12.3012C17.5829 12.5309 17.9154 12.8016 18.1499 13.1133C18.3844 13.4251 18.5017 13.7655 18.5017 14.1345V15.3364C18.5017 15.5498 18.4295 15.7287 18.2851 15.873C18.1407 16.0174 17.9619 16.0896 17.7485 16.0896H15.3414ZM7.74852 9.74343C6.94645 9.74343 6.25982 9.45784 5.68864 8.88668C5.11746 8.3155 4.83187 7.62887 4.83187 6.8268C4.83187 6.02472 5.11746 5.33809 5.68864 4.76693C6.25982 4.19575 6.94645 3.91016 7.74852 3.91016C8.55058 3.91016 9.23721 4.19575 9.80839 4.76693C10.3796 5.33809 10.6651 6.02472 10.6651 6.8268C10.6651 7.62887 10.3796 8.3155 9.80839 8.88668C9.23721 9.45784 8.55058 9.74343 7.74852 9.74343ZM14.944 6.8268C14.944 7.62887 14.6584 8.3155 14.0872 8.88668C13.516 9.45784 12.8294 9.74343 12.0273 9.74343C11.9333 9.74343 11.8136 9.73275 11.6683 9.71139C11.5231 9.69003 11.4034 9.66653 11.3094 9.64089C11.638 9.24579 11.8906 8.80748 12.0671 8.32595C12.2436 7.84442 12.3318 7.34437 12.3318 6.8258C12.3318 6.30725 12.2418 5.80918 12.0618 5.33162C11.8818 4.85406 11.631 4.41443 11.3094 4.01272C11.429 3.96998 11.5487 3.94221 11.6683 3.92939C11.788 3.91657 11.9077 3.91016 12.0273 3.91016C12.8294 3.91016 13.516 4.19575 14.0872 4.76693C14.6584 5.33809 14.944 6.02472 14.944 6.8268ZM2.74851 14.8396H12.7485V14.237C12.7485 14.0629 12.705 13.908 12.6179 13.7723C12.5308 13.6366 12.3927 13.518 12.2036 13.4165C11.5177 13.0629 10.8115 12.795 10.0851 12.6128C9.35856 12.4307 8.57971 12.3396 7.74852 12.3396C6.91732 12.3396 6.13847 12.4307 5.41197 12.6128C4.68549 12.795 3.97929 13.0629 3.29339 13.4165C3.10429 13.518 2.9662 13.6366 2.87912 13.7723C2.79205 13.908 2.74851 14.0629 2.74851 14.237V14.8396ZM7.74852 8.49347C8.20685 8.49347 8.59921 8.33028 8.9256 8.00389C9.25199 7.6775 9.41518 7.28514 9.41518 6.8268C9.41518 6.36847 9.25199 5.97611 8.9256 5.64972C8.59921 5.32333 8.20685 5.16014 7.74852 5.16014C7.29018 5.16014 6.89782 5.32333 6.57143 5.64972C6.24504 5.97611 6.08185 6.36847 6.08185 6.8268C6.08185 7.28514 6.24504 7.6775 6.57143 8.00389C6.89782 8.33028 7.29018 8.49347 7.74852 8.49347Z\" fill=\"#6B7385\"></path>\n                                            </svg>\n                                            50 Students\n                                        </li>\n                                    </ul>\n                                    <p class=\"description\">It is a long established fact that a reader will be\n                                        distracted by the readable...</p>\n                                    <div class=\"creator\" bis_skin_checked=\"1\">\n                                        <img src=\"http://localhost/academy-laravel/sham/academy/public/assets/page-builder/block-image/profile.png\" alt=\"...\">\n                                        <p>by <span>Angelina Ross</span> in <span>Design</span></p>\n                                    </div>\n                                </div>\n                            </div>\n                        </div>\n                    </a>\n                </div>\n                <div class=\"col-lg-6 col-md-12 col-sm-6 mb-30\" bis_skin_checked=\"1\">\n                    <a href=\"#\" class=\"single-feature\">\n                        <div class=\"row\" bis_skin_checked=\"1\">\n                            <div class=\"col-lg-4 col-md-4\" bis_skin_checked=\"1\">\n                                <div class=\"courses-img\" bis_skin_checked=\"1\">\n                                    <img src=\"http://localhost/academy-laravel/sham/academy/public/assets/page-builder/block-image/course-3.png\" alt=\"...\">\n                                    <div class=\"cText d-flex\" bis_skin_checked=\"1\">\n                                        <h4>$60.00</h4>\n                                        <del>$30.00</del>\n                                    </div>\n                                </div>\n                            </div>\n                            <div class=\"col-lg-8 col-md-8\" bis_skin_checked=\"1\">\n                                <div class=\"entry-details\" bis_skin_checked=\"1\">\n                                    <div class=\"entry-title\" bis_skin_checked=\"1\">\n                                        <h3>After Effect 2023 Complete Course</h3>\n                                        <span class=\"heart\"><i class=\"fa-regular fa-heart\"></i></span>\n                                    </div>\n                                    <ul>\n                                        <li>\n                                            <svg width=\"20\" height=\"20\" viewBox=\"0 0 20 20\" fill=\"none\" xmlns=\"http://www.w3.org/2000/svg\">\n                                                <path d=\"M12.6521 9.54004L14.8477 8.27081C14.9758 8.19549 15.0399 8.08879 15.0399 7.95071C15.0399 7.81263 14.9758 7.70458 14.8477 7.62658L12.6521 6.35735C12.5395 6.29326 12.4144 6.26121 12.2768 6.26121C12.1392 6.26121 12.0133 6.29326 11.8989 6.35735L9.70344 7.62658C9.57523 7.7019 9.51113 7.8086 9.51113 7.94669C9.51113 8.08479 9.57523 8.19283 9.70344 8.27081L11.8989 9.54004C12.0115 9.60414 12.1366 9.63619 12.2743 9.63619C12.4119 9.63619 12.5378 9.60414 12.6521 9.54004ZM12.6521 11.9968L14.1265 11.1554C14.2395 11.0928 14.3305 11.0021 14.3995 10.8832C14.4686 10.7643 14.5031 10.636 14.5031 10.4984V9.32371L12.6521 10.399C12.5392 10.4685 12.4136 10.5032 12.2755 10.5032C12.1374 10.5032 12.0119 10.4685 11.8989 10.399L10.048 9.32371V10.4984C10.048 10.636 10.0825 10.7643 10.1515 10.8832C10.2206 11.0021 10.3116 11.0928 10.4246 11.1554L11.8989 11.9968C12.0115 12.0609 12.1366 12.0929 12.2743 12.0929C12.4119 12.0929 12.5378 12.0609 12.6521 11.9968ZM16.4101 16.25H12.2755C12.2755 16.0416 12.2684 15.8333 12.2543 15.625C12.2401 15.4166 12.2189 15.2083 12.1906 15H16.4101C16.4849 15 16.5464 14.9759 16.5944 14.9279C16.6425 14.8798 16.6666 14.8183 16.6666 14.7435V5.25642C16.6666 5.18163 16.6425 5.12019 16.5944 5.0721C16.5464 5.02402 16.4849 4.99998 16.4101 4.99998H3.58967C3.51488 4.99998 3.45344 5.02402 3.40536 5.0721C3.35727 5.12019 3.33323 5.18163 3.33323 5.25642V6.14263C3.1249 6.11431 2.91657 6.09307 2.70825 6.07892C2.49992 6.06476 2.29159 6.05769 2.08325 6.05769V5.25642C2.08325 4.84215 2.23076 4.48752 2.52577 4.19252C2.82077 3.89751 3.17541 3.75 3.58967 3.75H16.4101C16.8244 3.75 17.179 3.89751 17.474 4.19252C17.769 4.48752 17.9165 4.84215 17.9165 5.25642V14.7435C17.9165 15.1578 17.769 15.5124 17.474 15.8074C17.179 16.1025 16.8244 16.25 16.4101 16.25ZM6.58498 16.25C6.41715 16.25 6.27127 16.1973 6.14734 16.0921C6.02341 15.9869 5.94595 15.8498 5.91498 15.681C5.79425 14.8274 5.42592 14.1017 4.81 13.504C4.19409 12.9062 3.45664 12.5443 2.59767 12.4182C2.43692 12.3974 2.31099 12.3219 2.2199 12.1917C2.1288 12.0615 2.08325 11.913 2.08325 11.7464C2.08325 11.5693 2.14362 11.4209 2.26436 11.3013C2.38508 11.1816 2.52556 11.133 2.68581 11.1555C3.8685 11.2901 4.87623 11.7759 5.70902 12.613C6.54181 13.45 7.02712 14.4599 7.16494 15.6426C7.18737 15.8114 7.1409 15.9548 7.02552 16.0729C6.91013 16.1909 6.76329 16.25 6.58498 16.25ZM9.82361 16.25C9.64091 16.25 9.49107 16.1869 9.37409 16.0609C9.25711 15.9348 9.18741 15.7777 9.16496 15.5897C9.00257 13.86 8.31027 12.3918 7.08804 11.1851C5.86582 9.97834 4.3872 9.3034 2.65217 9.16023C2.48336 9.14313 2.34634 9.07206 2.24111 8.94702C2.13587 8.82197 2.08325 8.67607 2.08325 8.50933C2.08325 8.33217 2.14148 8.18162 2.25794 8.05769C2.37438 7.93377 2.5154 7.88035 2.681 7.89744C4.7622 8.0406 6.53275 8.84135 7.99267 10.2997C9.4526 11.758 10.2627 13.5235 10.4229 15.5961C10.44 15.7788 10.3887 15.9334 10.2689 16.06C10.1491 16.1867 10.0007 16.25 9.82361 16.25ZM2.93215 16.25C2.6942 16.25 2.49324 16.1678 2.32925 16.0035C2.16525 15.8392 2.08325 15.6381 2.08325 15.4001C2.08325 15.1622 2.1654 14.9612 2.32971 14.7972C2.494 14.6332 2.69512 14.5512 2.93306 14.5512C3.17101 14.5512 3.37197 14.6334 3.53596 14.7977C3.69996 14.962 3.78196 15.1631 3.78196 15.4011C3.78196 15.639 3.69981 15.84 3.5355 16.004C3.37121 16.168 3.17009 16.25 2.93215 16.25Z\" fill=\"#6B7385\"></path>\n                                            </svg>\n                                            12 lesson\n                                        </li>\n                                        <li>\n                                            <svg width=\"20\" height=\"20\" viewBox=\"0 0 20 20\" fill=\"none\" xmlns=\"http://www.w3.org/2000/svg\">\n                                                <path d=\"M2.25174 16.0896C2.03834 16.0896 1.85945 16.0174 1.71508 15.873C1.57072 15.7287 1.49854 15.5498 1.49854 15.3364V14.237C1.49854 13.8075 1.60938 13.4243 1.83108 13.0872C2.05276 12.7501 2.34881 12.4879 2.71924 12.3005C3.5112 11.9131 4.30755 11.6145 5.10828 11.4045C5.90904 11.1946 6.78911 11.0896 7.74852 11.0896C8.70792 11.0896 9.58799 11.1946 10.3887 11.4045C11.1895 11.6145 11.9858 11.9131 12.7778 12.3005C13.1482 12.4879 13.4443 12.7501 13.666 13.0872C13.8876 13.4243 13.9985 13.8075 13.9985 14.237V15.3364C13.9985 15.5498 13.9263 15.7287 13.7819 15.873C13.6376 16.0174 13.4587 16.0896 13.2453 16.0896H2.25174ZM15.3414 16.0896C15.4437 16.0024 15.5232 15.8934 15.58 15.7626C15.6367 15.6318 15.6651 15.4855 15.6651 15.3236V14.1345C15.6651 13.5875 15.5312 13.0662 15.2633 12.5705C14.9955 12.0749 14.6155 11.6497 14.1235 11.2948C14.6823 11.3781 15.2127 11.5071 15.7148 11.6818C16.217 11.8565 16.6961 12.0629 17.1523 12.3012C17.5829 12.5309 17.9154 12.8016 18.1499 13.1133C18.3844 13.4251 18.5017 13.7655 18.5017 14.1345V15.3364C18.5017 15.5498 18.4295 15.7287 18.2851 15.873C18.1407 16.0174 17.9619 16.0896 17.7485 16.0896H15.3414ZM7.74852 9.74343C6.94645 9.74343 6.25982 9.45784 5.68864 8.88668C5.11746 8.3155 4.83187 7.62887 4.83187 6.8268C4.83187 6.02472 5.11746 5.33809 5.68864 4.76693C6.25982 4.19575 6.94645 3.91016 7.74852 3.91016C8.55058 3.91016 9.23721 4.19575 9.80839 4.76693C10.3796 5.33809 10.6651 6.02472 10.6651 6.8268C10.6651 7.62887 10.3796 8.3155 9.80839 8.88668C9.23721 9.45784 8.55058 9.74343 7.74852 9.74343ZM14.944 6.8268C14.944 7.62887 14.6584 8.3155 14.0872 8.88668C13.516 9.45784 12.8294 9.74343 12.0273 9.74343C11.9333 9.74343 11.8136 9.73275 11.6683 9.71139C11.5231 9.69003 11.4034 9.66653 11.3094 9.64089C11.638 9.24579 11.8906 8.80748 12.0671 8.32595C12.2436 7.84442 12.3318 7.34437 12.3318 6.8258C12.3318 6.30725 12.2418 5.80918 12.0618 5.33162C11.8818 4.85406 11.631 4.41443 11.3094 4.01272C11.429 3.96998 11.5487 3.94221 11.6683 3.92939C11.788 3.91657 11.9077 3.91016 12.0273 3.91016C12.8294 3.91016 13.516 4.19575 14.0872 4.76693C14.6584 5.33809 14.944 6.02472 14.944 6.8268ZM2.74851 14.8396H12.7485V14.237C12.7485 14.0629 12.705 13.908 12.6179 13.7723C12.5308 13.6366 12.3927 13.518 12.2036 13.4165C11.5177 13.0629 10.8115 12.795 10.0851 12.6128C9.35856 12.4307 8.57971 12.3396 7.74852 12.3396C6.91732 12.3396 6.13847 12.4307 5.41197 12.6128C4.68549 12.795 3.97929 13.0629 3.29339 13.4165C3.10429 13.518 2.9662 13.6366 2.87912 13.7723C2.79205 13.908 2.74851 14.0629 2.74851 14.237V14.8396ZM7.74852 8.49347C8.20685 8.49347 8.59921 8.33028 8.9256 8.00389C9.25199 7.6775 9.41518 7.28514 9.41518 6.8268C9.41518 6.36847 9.25199 5.97611 8.9256 5.64972C8.59921 5.32333 8.20685 5.16014 7.74852 5.16014C7.29018 5.16014 6.89782 5.32333 6.57143 5.64972C6.24504 5.97611 6.08185 6.36847 6.08185 6.8268C6.08185 7.28514 6.24504 7.6775 6.57143 8.00389C6.89782 8.33028 7.29018 8.49347 7.74852 8.49347Z\" fill=\"#6B7385\"></path>\n                                            </svg>\n                                            50 Students\n                                        </li>\n                                    </ul>\n                                    <p class=\"description\">It is a long established fact that a reader will be\n                                        distracted by the readable...</p>\n                                    <div class=\"creator\" bis_skin_checked=\"1\">\n                                        <img src=\"http://localhost/academy-laravel/sham/academy/public/assets/page-builder/block-image/profile.png\" alt=\"...\">\n                                        <p>by <span>Angelina Ross</span> in <span>Design</span></p>\n                                    </div>\n                                </div>\n                            </div>\n                        </div>\n                    </a>\n                </div>\n                <div class=\"col-lg-6 col-md-12 col-sm-6 mb-30\" bis_skin_checked=\"1\">\n                    <a href=\"#\" class=\"single-feature\">\n                        <div class=\"row\" bis_skin_checked=\"1\">\n                            <div class=\"col-lg-4 col-md-4\" bis_skin_checked=\"1\">\n                                <div class=\"courses-img\" bis_skin_checked=\"1\">\n                                    <img src=\"http://localhost/academy-laravel/sham/academy/public/assets/page-builder/block-image/course-4.png\" alt=\"...\">\n                                    <div class=\"cText d-flex\" bis_skin_checked=\"1\">\n                                        <h4>$60.00</h4>\n                                        <del>$30.00</del>\n                                    </div>\n                                </div>\n                            </div>\n                            <div class=\"col-lg-8 col-md-8\" bis_skin_checked=\"1\">\n                                <div class=\"entry-details\" bis_skin_checked=\"1\">\n                                    <div class=\"entry-title\" bis_skin_checked=\"1\">\n                                        <h3>The Complete Graphic Design Theory</h3>\n                                        <span class=\"heart\"><i class=\"fa-regular fa-heart\"></i></span>\n                                    </div>\n                                    <ul>\n                                        <li>\n                                            <svg width=\"20\" height=\"20\" viewBox=\"0 0 20 20\" fill=\"none\" xmlns=\"http://www.w3.org/2000/svg\">\n                                                <path d=\"M12.6521 9.54004L14.8477 8.27081C14.9758 8.19549 15.0399 8.08879 15.0399 7.95071C15.0399 7.81263 14.9758 7.70458 14.8477 7.62658L12.6521 6.35735C12.5395 6.29326 12.4144 6.26121 12.2768 6.26121C12.1392 6.26121 12.0133 6.29326 11.8989 6.35735L9.70344 7.62658C9.57523 7.7019 9.51113 7.8086 9.51113 7.94669C9.51113 8.08479 9.57523 8.19283 9.70344 8.27081L11.8989 9.54004C12.0115 9.60414 12.1366 9.63619 12.2743 9.63619C12.4119 9.63619 12.5378 9.60414 12.6521 9.54004ZM12.6521 11.9968L14.1265 11.1554C14.2395 11.0928 14.3305 11.0021 14.3995 10.8832C14.4686 10.7643 14.5031 10.636 14.5031 10.4984V9.32371L12.6521 10.399C12.5392 10.4685 12.4136 10.5032 12.2755 10.5032C12.1374 10.5032 12.0119 10.4685 11.8989 10.399L10.048 9.32371V10.4984C10.048 10.636 10.0825 10.7643 10.1515 10.8832C10.2206 11.0021 10.3116 11.0928 10.4246 11.1554L11.8989 11.9968C12.0115 12.0609 12.1366 12.0929 12.2743 12.0929C12.4119 12.0929 12.5378 12.0609 12.6521 11.9968ZM16.4101 16.25H12.2755C12.2755 16.0416 12.2684 15.8333 12.2543 15.625C12.2401 15.4166 12.2189 15.2083 12.1906 15H16.4101C16.4849 15 16.5464 14.9759 16.5944 14.9279C16.6425 14.8798 16.6666 14.8183 16.6666 14.7435V5.25642C16.6666 5.18163 16.6425 5.12019 16.5944 5.0721C16.5464 5.02402 16.4849 4.99998 16.4101 4.99998H3.58967C3.51488 4.99998 3.45344 5.02402 3.40536 5.0721C3.35727 5.12019 3.33323 5.18163 3.33323 5.25642V6.14263C3.1249 6.11431 2.91657 6.09307 2.70825 6.07892C2.49992 6.06476 2.29159 6.05769 2.08325 6.05769V5.25642C2.08325 4.84215 2.23076 4.48752 2.52577 4.19252C2.82077 3.89751 3.17541 3.75 3.58967 3.75H16.4101C16.8244 3.75 17.179 3.89751 17.474 4.19252C17.769 4.48752 17.9165 4.84215 17.9165 5.25642V14.7435C17.9165 15.1578 17.769 15.5124 17.474 15.8074C17.179 16.1025 16.8244 16.25 16.4101 16.25ZM6.58498 16.25C6.41715 16.25 6.27127 16.1973 6.14734 16.0921C6.02341 15.9869 5.94595 15.8498 5.91498 15.681C5.79425 14.8274 5.42592 14.1017 4.81 13.504C4.19409 12.9062 3.45664 12.5443 2.59767 12.4182C2.43692 12.3974 2.31099 12.3219 2.2199 12.1917C2.1288 12.0615 2.08325 11.913 2.08325 11.7464C2.08325 11.5693 2.14362 11.4209 2.26436 11.3013C2.38508 11.1816 2.52556 11.133 2.68581 11.1555C3.8685 11.2901 4.87623 11.7759 5.70902 12.613C6.54181 13.45 7.02712 14.4599 7.16494 15.6426C7.18737 15.8114 7.1409 15.9548 7.02552 16.0729C6.91013 16.1909 6.76329 16.25 6.58498 16.25ZM9.82361 16.25C9.64091 16.25 9.49107 16.1869 9.37409 16.0609C9.25711 15.9348 9.18741 15.7777 9.16496 15.5897C9.00257 13.86 8.31027 12.3918 7.08804 11.1851C5.86582 9.97834 4.3872 9.3034 2.65217 9.16023C2.48336 9.14313 2.34634 9.07206 2.24111 8.94702C2.13587 8.82197 2.08325 8.67607 2.08325 8.50933C2.08325 8.33217 2.14148 8.18162 2.25794 8.05769C2.37438 7.93377 2.5154 7.88035 2.681 7.89744C4.7622 8.0406 6.53275 8.84135 7.99267 10.2997C9.4526 11.758 10.2627 13.5235 10.4229 15.5961C10.44 15.7788 10.3887 15.9334 10.2689 16.06C10.1491 16.1867 10.0007 16.25 9.82361 16.25ZM2.93215 16.25C2.6942 16.25 2.49324 16.1678 2.32925 16.0035C2.16525 15.8392 2.08325 15.6381 2.08325 15.4001C2.08325 15.1622 2.1654 14.9612 2.32971 14.7972C2.494 14.6332 2.69512 14.5512 2.93306 14.5512C3.17101 14.5512 3.37197 14.6334 3.53596 14.7977C3.69996 14.962 3.78196 15.1631 3.78196 15.4011C3.78196 15.639 3.69981 15.84 3.5355 16.004C3.37121 16.168 3.17009 16.25 2.93215 16.25Z\" fill=\"#6B7385\"></path>\n                                            </svg>\n                                            12 lesson\n                                        </li>\n                                        <li>\n                                            <svg width=\"20\" height=\"20\" viewBox=\"0 0 20 20\" fill=\"none\" xmlns=\"http://www.w3.org/2000/svg\">\n                                                <path d=\"M2.25174 16.0896C2.03834 16.0896 1.85945 16.0174 1.71508 15.873C1.57072 15.7287 1.49854 15.5498 1.49854 15.3364V14.237C1.49854 13.8075 1.60938 13.4243 1.83108 13.0872C2.05276 12.7501 2.34881 12.4879 2.71924 12.3005C3.5112 11.9131 4.30755 11.6145 5.10828 11.4045C5.90904 11.1946 6.78911 11.0896 7.74852 11.0896C8.70792 11.0896 9.58799 11.1946 10.3887 11.4045C11.1895 11.6145 11.9858 11.9131 12.7778 12.3005C13.1482 12.4879 13.4443 12.7501 13.666 13.0872C13.8876 13.4243 13.9985 13.8075 13.9985 14.237V15.3364C13.9985 15.5498 13.9263 15.7287 13.7819 15.873C13.6376 16.0174 13.4587 16.0896 13.2453 16.0896H2.25174ZM15.3414 16.0896C15.4437 16.0024 15.5232 15.8934 15.58 15.7626C15.6367 15.6318 15.6651 15.4855 15.6651 15.3236V14.1345C15.6651 13.5875 15.5312 13.0662 15.2633 12.5705C14.9955 12.0749 14.6155 11.6497 14.1235 11.2948C14.6823 11.3781 15.2127 11.5071 15.7148 11.6818C16.217 11.8565 16.6961 12.0629 17.1523 12.3012C17.5829 12.5309 17.9154 12.8016 18.1499 13.1133C18.3844 13.4251 18.5017 13.7655 18.5017 14.1345V15.3364C18.5017 15.5498 18.4295 15.7287 18.2851 15.873C18.1407 16.0174 17.9619 16.0896 17.7485 16.0896H15.3414ZM7.74852 9.74343C6.94645 9.74343 6.25982 9.45784 5.68864 8.88668C5.11746 8.3155 4.83187 7.62887 4.83187 6.8268C4.83187 6.02472 5.11746 5.33809 5.68864 4.76693C6.25982 4.19575 6.94645 3.91016 7.74852 3.91016C8.55058 3.91016 9.23721 4.19575 9.80839 4.76693C10.3796 5.33809 10.6651 6.02472 10.6651 6.8268C10.6651 7.62887 10.3796 8.3155 9.80839 8.88668C9.23721 9.45784 8.55058 9.74343 7.74852 9.74343ZM14.944 6.8268C14.944 7.62887 14.6584 8.3155 14.0872 8.88668C13.516 9.45784 12.8294 9.74343 12.0273 9.74343C11.9333 9.74343 11.8136 9.73275 11.6683 9.71139C11.5231 9.69003 11.4034 9.66653 11.3094 9.64089C11.638 9.24579 11.8906 8.80748 12.0671 8.32595C12.2436 7.84442 12.3318 7.34437 12.3318 6.8258C12.3318 6.30725 12.2418 5.80918 12.0618 5.33162C11.8818 4.85406 11.631 4.41443 11.3094 4.01272C11.429 3.96998 11.5487 3.94221 11.6683 3.92939C11.788 3.91657 11.9077 3.91016 12.0273 3.91016C12.8294 3.91016 13.516 4.19575 14.0872 4.76693C14.6584 5.33809 14.944 6.02472 14.944 6.8268ZM2.74851 14.8396H12.7485V14.237C12.7485 14.0629 12.705 13.908 12.6179 13.7723C12.5308 13.6366 12.3927 13.518 12.2036 13.4165C11.5177 13.0629 10.8115 12.795 10.0851 12.6128C9.35856 12.4307 8.57971 12.3396 7.74852 12.3396C6.91732 12.3396 6.13847 12.4307 5.41197 12.6128C4.68549 12.795 3.97929 13.0629 3.29339 13.4165C3.10429 13.518 2.9662 13.6366 2.87912 13.7723C2.79205 13.908 2.74851 14.0629 2.74851 14.237V14.8396ZM7.74852 8.49347C8.20685 8.49347 8.59921 8.33028 8.9256 8.00389C9.25199 7.6775 9.41518 7.28514 9.41518 6.8268C9.41518 6.36847 9.25199 5.97611 8.9256 5.64972C8.59921 5.32333 8.20685 5.16014 7.74852 5.16014C7.29018 5.16014 6.89782 5.32333 6.57143 5.64972C6.24504 5.97611 6.08185 6.36847 6.08185 6.8268C6.08185 7.28514 6.24504 7.6775 6.57143 8.00389C6.89782 8.33028 7.29018 8.49347 7.74852 8.49347Z\" fill=\"#6B7385\"></path>\n                                            </svg>\n                                            50 Students\n                                        </li>\n                                    </ul>\n                                    <p class=\"description\">It is a long established fact that a reader will be\n                                        distracted by the readable...</p>\n                                    <div class=\"creator\" bis_skin_checked=\"1\">\n                                        <img src=\"http://localhost/academy-laravel/sham/academy/public/assets/page-builder/block-image/profile.png\" alt=\"...\">\n                                        <p>by <span>Angelina Ross</span> in <span>Design</span></p>\n                                    </div>\n                                </div>\n                            </div>\n                        </div>\n                    </a>\n                </div>\n            </div>\n        </span>\n    </div>\n</section>\n            </div><div class=\"section parent ui-sortable-handle\" id=\"255\" bis_skin_checked=\"1\">\n                                <section class=\"skill-wrapper section-padding\">\n    <div class=\"container\" bis_skin_checked=\"1\">\n        <div class=\"row align-items-center\" bis_skin_checked=\"1\">\n            <div class=\"col-lg-5 col-md-6\" bis_skin_checked=\"1\">\n                <div class=\"skill-image position-relative\" bis_skin_checked=\"1\">\n                    <span class=\"builder_image parent\" content_type=\"image\" id=\"782\">\n                        <img src=\"http://localhost/academy-laravel/sham/academy/public/assets/page-builder/block-image/skill-image.png\" alt=\"...\">\n                    </span>\n                    <div class=\"over-text\" bis_skin_checked=\"1\">\n                        <span>\n                            <svg width=\"30\" height=\"30\" viewBox=\"0 0 30 30\" fill=\"none\" xmlns=\"http://www.w3.org/2000/svg\">\n                                <path d=\"M8.12494 20.0241C9.16021 20.0241 10.1674 20.1415 11.1466 20.3763C12.1258 20.6111 13.0977 20.9793 14.0625 21.4809V9.19239C13.1843 8.62028 12.2339 8.1912 11.2115 7.90514C10.1891 7.61907 9.16021 7.47604 8.12494 7.47604C7.37494 7.47604 6.67422 7.53493 6.02278 7.6527C5.37134 7.77049 4.70188 7.9632 4.01438 8.23082C3.91821 8.26289 3.85009 8.30897 3.81003 8.36907C3.76997 8.42918 3.74994 8.49528 3.74994 8.56739V20.3895C3.74994 20.5017 3.79 20.5838 3.87013 20.6359C3.95027 20.688 4.03843 20.694 4.13459 20.6539C4.72753 20.452 5.35332 20.2966 6.01197 20.1876C6.67061 20.0786 7.37494 20.0241 8.12494 20.0241ZM15.9374 21.4809C16.9022 20.9793 17.8741 20.6111 18.8533 20.3763C19.8324 20.1415 20.8397 20.0241 21.8749 20.0241C22.6249 20.0241 23.3293 20.0786 23.9879 20.1876C24.6466 20.2966 25.2723 20.452 25.8653 20.6539C25.9614 20.694 26.0496 20.688 26.1297 20.6359C26.2099 20.5838 26.2499 20.5017 26.2499 20.3895V8.56739C26.2499 8.49528 26.2299 8.43118 26.1898 8.37507C26.1498 8.31897 26.0817 8.27089 25.9855 8.23082C25.298 7.9632 24.6285 7.77049 23.9771 7.6527C23.3257 7.53493 22.6249 7.47604 21.8749 7.47604C20.8397 7.47604 19.8108 7.61907 18.7884 7.90514C17.7659 8.1912 16.8156 8.62028 15.9374 9.19239V21.4809ZM14.9999 23.7068C14.7564 23.7068 14.5284 23.6763 14.3161 23.6154C14.1037 23.5545 13.903 23.4736 13.7139 23.3726C12.8533 22.8854 11.9531 22.5181 11.0132 22.2704C10.0733 22.0229 9.11052 21.8991 8.12494 21.8991C7.36212 21.8991 6.61294 21.9836 5.87738 22.1527C5.14179 22.3217 4.43266 22.5705 3.74997 22.899C3.30447 23.1042 2.88059 23.0717 2.47834 22.8017C2.07611 22.5317 1.875 22.149 1.875 21.6539V8.08183C1.875 7.8126 1.9443 7.55979 2.08291 7.32342C2.22153 7.08704 2.42146 6.91677 2.68269 6.8126C3.52883 6.40075 4.41064 6.09587 5.32809 5.89795C6.24555 5.70003 7.17783 5.60107 8.12494 5.60107C9.34129 5.60107 10.5296 5.76734 11.6898 6.09989C12.8501 6.43241 13.9535 6.92319 14.9999 7.57223C16.0464 6.92319 17.1498 6.43241 18.31 6.09989C19.4703 5.76734 20.6586 5.60107 21.8749 5.60107C22.822 5.60107 23.7543 5.70003 24.6718 5.89795C25.5892 6.09587 26.471 6.40075 27.3172 6.8126C27.5784 6.91677 27.7783 7.08704 27.917 7.32342C28.0556 7.55979 28.1249 7.8126 28.1249 8.08183V21.6539C28.1249 22.149 27.9158 22.5276 27.4975 22.7897C27.0792 23.0517 26.6393 23.0801 26.1778 22.875C25.5031 22.5545 24.804 22.3117 24.0804 22.1467C23.3569 21.9816 22.6217 21.8991 21.8749 21.8991C20.8894 21.8991 19.9266 22.0229 18.9867 22.2704C18.0468 22.5181 17.1466 22.8854 16.286 23.3726C16.0969 23.4736 15.8961 23.5545 15.6838 23.6154C15.4715 23.6763 15.2435 23.7068 14.9999 23.7068ZM17.4278 11.077C17.4278 10.9376 17.4775 10.795 17.5768 10.6491C17.6762 10.5033 17.7892 10.4031 17.9158 10.3487C18.536 10.1003 19.1742 9.91195 19.8305 9.78376C20.4867 9.65555 21.1682 9.59145 21.8749 9.59145C22.2836 9.59145 22.679 9.61548 23.0612 9.66354C23.4434 9.71163 23.8284 9.77733 24.2163 9.86067C24.3637 9.89431 24.4911 9.97444 24.5985 10.101C24.7058 10.2276 24.7595 10.3751 24.7595 10.5434C24.7595 10.8254 24.671 11.0317 24.4939 11.1623C24.3168 11.2929 24.0873 11.3246 23.8052 11.2573C23.5056 11.1948 23.1943 11.1499 22.8713 11.1227C22.5484 11.0954 22.2163 11.0818 21.8749 11.0818C21.2692 11.0818 20.6758 11.1399 20.0949 11.2561C19.5139 11.3723 18.9598 11.5297 18.4326 11.7284C18.1377 11.8422 17.8966 11.8358 17.7091 11.7092C17.5216 11.5826 17.4278 11.3719 17.4278 11.077ZM17.4278 17.9039C17.4278 17.7645 17.4775 17.6199 17.5768 17.47C17.6762 17.3202 17.7892 17.218 17.9158 17.1635C18.5199 16.9151 19.1582 16.7289 19.8305 16.6047C20.5027 16.4805 21.1842 16.4184 21.8749 16.4184C22.2836 16.4184 22.679 16.4424 23.0612 16.4905C23.4434 16.5385 23.8284 16.6042 24.2163 16.6876C24.3637 16.7212 24.4911 16.8014 24.5985 16.928C24.7058 17.0546 24.7595 17.202 24.7595 17.3703C24.7595 17.6523 24.671 17.8586 24.4939 17.9892C24.3168 18.1198 24.0873 18.1515 23.8052 18.0842C23.5056 18.0217 23.1943 17.9768 22.8713 17.9496C22.5484 17.9223 22.2163 17.9087 21.8749 17.9087C21.2772 17.9087 20.6898 17.9656 20.1129 18.0794C19.536 18.1932 18.9839 18.3534 18.4567 18.5602C18.1618 18.682 17.9166 18.6788 17.7211 18.5505C17.5256 18.4223 17.4278 18.2068 17.4278 17.9039ZM17.4278 14.5025C17.4278 14.3631 17.4775 14.2204 17.5768 14.0746C17.6762 13.9288 17.7892 13.8286 17.9158 13.7741C18.536 13.5257 19.1742 13.3374 19.8305 13.2092C20.4867 13.081 21.1682 13.0169 21.8749 13.0169C22.2836 13.0169 22.679 13.041 23.0612 13.089C23.4434 13.1371 23.8284 13.2028 24.2163 13.2861C24.3637 13.3198 24.4911 13.3999 24.5985 13.5265C24.7058 13.6531 24.7595 13.8006 24.7595 13.9688C24.7595 14.2509 24.671 14.4572 24.4939 14.5878C24.3168 14.7184 24.0873 14.7501 23.8052 14.6828C23.5056 14.6203 23.1943 14.5754 22.8713 14.5481C22.5484 14.5209 22.2163 14.5073 21.8749 14.5073C21.2692 14.5073 20.6758 14.5654 20.0949 14.6815C19.5139 14.7977 18.9598 14.9552 18.4326 15.1539C18.1377 15.2677 17.8966 15.2613 17.7091 15.1347C17.5216 15.0081 17.4278 14.7974 17.4278 14.5025Z\" fill=\"white\"></path>\n                                </svg>\n                                \n                        </span>\n                        <div class=\"b-text\" bis_skin_checked=\"1\">\n                            <h5>150k +</h5>\n                            <p>Top rated Courses</p>\n                        </div>\n                    </div>\n                </div>\n            </div>\n            <div class=\"col-lg-7 col-md-6\" bis_skin_checked=\"1\">\n                <div class=\"skil-content\" bis_skin_checked=\"1\">\n                    <span class=\"title-head builder_text parent\" content_type=\"text\" id=\"995\">Know About Us</span>\n                    <h2 class=\"title builder_text parent\" content_type=\"text\" id=\"848\">Learn &amp; Grow Your Skills From <span class=\"gradient shadow-none color\">Educate</span></h2>\n                    <p class=\"description mt-5 builder_text parent\" content_type=\"text\" id=\"475\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum.</p>\n                    <ul>\n                        <li>\n                            <div class=\"svg\" bis_skin_checked=\"1\">\n                                <svg width=\"28\" height=\"28\" viewBox=\"0 0 28 28\" fill=\"none\" xmlns=\"http://www.w3.org/2000/svg\">\n                                    <path d=\"M21.4083 16.3111L24.8186 12.8896C24.9709 12.7356 25.1492 12.6585 25.3535 12.6585C25.5578 12.6585 25.7407 12.7356 25.9022 12.8896C26.0638 13.0437 26.1427 13.224 26.1389 13.4307C26.1352 13.6373 26.0563 13.8144 25.9022 13.962L22.059 17.7761C21.874 17.9676 21.6539 18.0633 21.3986 18.0633C21.1434 18.0633 20.92 17.9676 20.7286 17.7761L18.8978 15.9274C18.7437 15.7804 18.6648 15.6083 18.6611 15.4111C18.6573 15.2138 18.7362 15.0345 18.8978 14.8729C19.0518 14.7189 19.2324 14.64 19.4396 14.6362C19.6468 14.6325 19.8274 14.7114 19.9814 14.8729L21.4083 16.3111ZM10.628 21.9694C8.90488 20.4288 7.48318 19.0886 6.36289 17.9489C5.24258 16.8091 4.36009 15.7924 3.71543 14.8987C3.07077 14.005 2.62092 13.1891 2.36589 12.4509C2.1109 11.7128 1.9834 10.9653 1.9834 10.2085C1.9834 8.64995 2.51737 7.32997 3.58532 6.24857C4.65325 5.16717 5.95675 4.62646 7.49584 4.62646C8.47555 4.62646 9.41374 4.85495 10.3104 5.31191C11.2071 5.76885 11.9703 6.42286 12.6 7.27392C13.2355 6.42101 13.9837 5.76654 14.8444 5.31051C15.7051 4.85448 16.6195 4.62646 17.5875 4.62646C18.992 4.62646 20.2312 5.07706 21.3051 5.97825C22.379 6.87942 23.0072 8.01729 23.1897 9.39186H21.6417C21.4517 8.48544 20.9918 7.71737 20.2619 7.08766C19.532 6.45796 18.6405 6.1431 17.5875 6.1431C16.5016 6.1431 15.6491 6.42018 15.0298 6.97435C14.4106 7.52852 13.7614 8.23712 13.0824 9.10016H12.1176C11.4042 8.21019 10.7393 7.49486 10.1231 6.95417C9.50685 6.41346 8.6311 6.1431 7.49584 6.1431C6.37255 6.1431 5.42576 6.53386 4.65544 7.31537C3.88515 8.0969 3.50001 9.06128 3.50001 10.2085C3.50001 10.8259 3.62153 11.4525 3.86459 12.0883C4.10765 12.7242 4.56459 13.4688 5.23542 14.3221C5.90626 15.1754 6.82987 16.188 8.00626 17.3599C9.18265 18.5318 10.7139 19.9689 12.6 21.671C13.131 21.1983 13.8418 20.5589 14.7325 19.7527C15.6232 18.9465 16.2743 18.3475 16.6856 17.9556L16.8531 18.1232L17.2218 18.4918L17.5904 18.8605L17.758 19.028C17.3347 19.4393 16.9043 19.8421 16.4668 20.2362C16.0293 20.6303 15.6363 20.9859 15.2878 21.303L13.2215 23.1697C13.03 23.3222 12.8229 23.3985 12.6 23.3985C12.3772 23.3985 12.17 23.3222 11.9786 23.1697L10.628 21.9694Z\" fill=\"#F81163\"></path>\n                                    </svg>\n                            </div>\n                            <div class=\"skill-text\" bis_skin_checked=\"1\">\n                                <span class=\"builder_text parent\" content_type=\"text\" id=\"335\">Life time Access</span>\n                                <p class=\"builder_text parent\" content_type=\"text\" id=\"953\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.</p>\n                            </div>\n                        </li>\n                        <li>\n                            <div class=\"svg color-dash\" bis_skin_checked=\"1\">\n                                <svg width=\"28\" height=\"28\" viewBox=\"0 0 28 28\" fill=\"none\" xmlns=\"http://www.w3.org/2000/svg\">\n                                    <path d=\"M6.31752 20.0083C4.63719 20.0083 3.21281 19.4264 2.04437 18.2627C0.875956 17.0989 0.291748 15.6806 0.291748 14.0077C0.291748 12.3349 0.875995 10.914 2.04449 9.74505C3.213 8.57615 4.63712 7.9917 6.31685 7.9917C6.98557 7.9917 7.62746 8.10762 8.24252 8.33945C8.85757 8.57129 9.41637 8.90932 9.91894 9.35355L12.4699 11.5814L11.3212 12.5776L8.952 10.4798C8.59152 10.1672 8.18948 9.92712 7.74587 9.75961C7.30225 9.59207 6.84178 9.50831 6.36448 9.50831C5.10613 9.50831 4.03219 9.94615 3.14264 10.8218C2.25312 11.6975 1.80836 12.7584 1.80836 14.0044C1.80836 15.2504 2.25312 16.3147 3.14264 17.1971C4.03219 18.0796 5.10613 18.5209 6.36448 18.5209C6.84178 18.5209 7.30225 18.4371 7.74587 18.2696C8.18948 18.1021 8.59152 17.862 8.952 17.5494L18.0812 9.35355C18.5762 8.92128 19.1323 8.58623 19.7493 8.34841C20.3664 8.1106 21.0106 7.9917 21.6821 7.9917C23.3622 7.9917 24.7865 8.57532 25.9553 9.74255C27.124 10.9098 27.7084 12.3286 27.7084 13.999C27.7084 15.6868 27.1201 17.1104 25.9435 18.2695C24.767 19.4287 23.333 20.0083 21.6417 20.0083C20.9734 20.0083 20.3355 19.8905 19.7281 19.655C19.1207 19.4194 18.562 19.0832 18.052 18.6465L15.4943 16.3894L16.6789 15.4112L19.0481 17.5202C19.4086 17.8418 19.8106 18.0841 20.2542 18.2471C20.6979 18.4102 21.1583 18.4917 21.6356 18.4917C22.894 18.4917 23.9679 18.0539 24.8575 17.1782C25.747 16.3025 26.1917 15.2416 26.1917 13.9956C26.1917 12.7496 25.747 11.6854 24.8575 10.8029C23.9679 9.92038 22.894 9.47914 21.6356 9.47914C21.1583 9.47914 20.6979 9.56291 20.2542 9.73044C19.8106 9.89796 19.4086 10.138 19.0481 10.4506L9.92596 18.6442C9.4262 19.0974 8.86775 19.4381 8.2506 19.6662C7.63347 19.8943 6.98911 20.0083 6.31752 20.0083Z\" fill=\"#2F57EF\"></path>\n                                    </svg>\n                            </div>\n                                <div class=\"skill-text\" bis_skin_checked=\"1\">\n                                    <span class=\"builder_text parent\" content_type=\"text\" id=\"589\">Learn from Anywhere</span>\n                                    <p class=\"builder_text parent\" content_type=\"text\" id=\"848\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.</p> \n                             </div>\n                        </li>\n                    </ul>\n                    <span class=\"promo-more-button\">\n                        <a href=\"#\" class=\"eBtn gradient mt-50\">More about us <i class=\"fa-solid fa-arrow-right-long ms-2\"></i></a>\n                    </span>\n                </div>\n            </div>\n        </div>\n    </div>\n</section>\n            </div><div class=\"section parent ui-sortable-handle\" id=\"228\" bis_skin_checked=\"1\">\n                                <section class=\"testimonials-wrapper section-padding\">\n    <span class=\"elips left-elips\"><img src=\"http://localhost/academy-laravel/sham/academy/public/assets/page-builder/block-image/Ellipse 8.png\" alt=\"...\"></span>\n    <span class=\"elips right-elips\"><img src=\"http://localhost/academy-laravel/sham/academy/public/assets/page-builder/block-image/Ellipse 9.png\" alt=\"...\"></span>\n    <div class=\"container\" bis_skin_checked=\"1\">\n        <div class=\"row\" bis_skin_checked=\"1\">\n            <div class=\"col-lg-4 col-md-4\" bis_skin_checked=\"1\">\n                <div class=\"section-title \" bis_skin_checked=\"1\">\n                    <span class=\"title-head builder_text parent\" content_type=\"text\" id=\"368\">Testimonial</span>\n                    <h2 class=\"title builder_text parent\" content_type=\"text\" id=\"83\">What our clients says about us</h2>\n                    <p class=\"description mt-5 builder_text parent\" content_type=\"text\" id=\"85\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.</p>\n                </div>\n            </div>\n            <div class=\"col-lg-8 col-md-8\" bis_skin_checked=\"1\">\n                <div class=\"user-slider owl-carousel owl-theme owl-loaded owl-drag\" bis_skin_checked=\"1\">\n                    <!-- Single User Opinion -->\n                    \n                    <!-- Single User Opinion -->\n                    \n                    <!-- Single User Opinion -->\n                    \n                    <!-- Single User Opinion -->\n                    \n                    <!-- Single User Opinion -->\n                    \n                    <!-- Single User Opinion -->\n                <div class=\"owl-stage-outer\" bis_skin_checked=\"1\"><div class=\"owl-stage\" bis_skin_checked=\"1\" style=\"transform: translate3d(-4590px, 0px, 0px); transition: all; width: 17595px;\"><div class=\"owl-item cloned\" bis_skin_checked=\"1\" style=\"width: 755px; margin-right: 10px;\"><div class=\"single-opinion\" bis_skin_checked=\"1\">\n                        <div class=\"user-image\" bis_skin_checked=\"1\">\n                            <span class=\"builder_image parent\" content_type=\"image\" id=\"429\"><img src=\"http://localhost/academy-laravel/sham/academy/public/assets/page-builder/block-image/test-image.png\" alt=\"\"></span>\n                        </div>\n                        <div class=\"testimonial-border\" bis_skin_checked=\"1\">\n                            <div class=\"testimonial-des\" bis_skin_checked=\"1\">\n                                <span class=\"description\"><span class=\"builder_text parent\" content_type=\"text\" id=\"690\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of use Lorem Ipsum.</span><p></p>\n                                    <div class=\"user-info d-flex\" bis_skin_checked=\"1\">\n                                        <div bis_skin_checked=\"1\">\n                                            <h4><span class=\"builder_text parent\" content_type=\"text\" id=\"692\">Linchon Philips</span></h4>\n                                            <p><span class=\"builder_text parent\" content_type=\"text\" id=\"967\">CEO @ Yahoo</span></p>\n                                        </div>\n                                        <ul class=\"d-flex align-items-center\">\n                                            <li><i class=\"fa fa-star\"></i></li>\n                                            <li><i class=\"fa fa-star\"></i></li>\n                                            <li><i class=\"fa fa-star\"></i></li>\n                                            <li><i class=\"fa fa-star\"></i></li>\n                                            <li><i class=\"fa fa-star\"></i></li>\n                                        </ul>\n                                    </div>\n                            </span></div>\n                        </div>\n                    </div></div><div class=\"owl-item cloned\" bis_skin_checked=\"1\" style=\"width: 755px; margin-right: 10px;\"><div class=\"single-opinion\" bis_skin_checked=\"1\">\n                        <div class=\"user-image\" bis_skin_checked=\"1\">\n                            <span class=\"builder_image parent\" content_type=\"image\" id=\"341\"><img src=\"http://localhost/academy-laravel/sham/academy/public/assets/page-builder/block-image/test-image.png\" alt=\"\"></span>\n                        </div>\n                        <div class=\"testimonial-border\" bis_skin_checked=\"1\">\n                            <div class=\"testimonial-des\" bis_skin_checked=\"1\">\n                                <p class=\"description\"><span class=\"builder_text parent\" content_type=\"text\" id=\"184\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of use Lorem Ipsum.</span></p>\n                                <div class=\"user-info d-flex\" bis_skin_checked=\"1\">\n                                    <div bis_skin_checked=\"1\">\n                                        <h4><span class=\"builder_text parent\" content_type=\"text\" id=\"656\">Linchon Philips</span></h4>\n                                        <p><span class=\"builder_text parent\" content_type=\"text\" id=\"778\">CEO @ Yahoo</span></p>\n                                    </div>\n                                    <ul class=\"d-flex align-items-center\">\n                                        <li><i class=\"fa fa-star\"></i></li>\n                                        <li><i class=\"fa fa-star\"></i></li>\n                                        <li><i class=\"fa fa-star\"></i></li>\n                                        <li><i class=\"fa fa-star\"></i></li>\n                                        <li><i class=\"fa fa-star\"></i></li>\n                                    </ul>\n                                </div>\n                            </div>\n                        </div>\n                    </div></div><div class=\"owl-item cloned\" bis_skin_checked=\"1\" style=\"width: 755px; margin-right: 10px;\"><div class=\"single-opinion\" bis_skin_checked=\"1\">\n                        <div class=\"user-image\" bis_skin_checked=\"1\">\n                            <span class=\"builder_image parent\" content_type=\"image\" id=\"768\"><img src=\"http://localhost/academy-laravel/sham/academy/public/assets/page-builder/block-image/test-image.png\" alt=\"\"></span>\n                        </div>\n                        <div class=\"testimonial-border\" bis_skin_checked=\"1\">\n                            <div class=\"testimonial-des\" bis_skin_checked=\"1\">\n                                <p class=\"description\"><span class=\"builder_text parent\" content_type=\"text\" id=\"546\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of use Lorem Ipsum.</span></p>\n                                <div class=\"user-info d-flex\" bis_skin_checked=\"1\">\n                                    <div bis_skin_checked=\"1\">\n                                        <h4><span class=\"builder_text parent\" content_type=\"text\" id=\"600\">Linchon Philips</span></h4>\n                                        <p><span class=\"builder_text parent\" content_type=\"text\" id=\"435\">CEO @ Yahoo</span></p>\n                                    </div>\n                                    <ul class=\"d-flex align-items-center\">\n                                        <li><i class=\"fa fa-star\"></i></li>\n                                        <li><i class=\"fa fa-star\"></i></li>\n                                        <li><i class=\"fa fa-star\"></i></li>\n                                        <li><i class=\"fa fa-star\"></i></li>\n                                        <li><i class=\"fa fa-star\"></i></li>\n                                    </ul>\n                                </div>\n                            </div>\n                        </div>\n                    </div></div><div class=\"owl-item cloned\" bis_skin_checked=\"1\" style=\"width: 755px; margin-right: 10px;\"><div class=\"single-opinion\" bis_skin_checked=\"1\">\n                        <div class=\"user-image\" bis_skin_checked=\"1\">\n                            <span class=\"builder_image parent\" content_type=\"image\" id=\"507\"><img src=\"http://localhost/academy-laravel/sham/academy/public/assets/page-builder/block-image/test-image.png\" alt=\"\"></span>\n                        </div>\n                        <div class=\"testimonial-border\" bis_skin_checked=\"1\">\n                            <div class=\"testimonial-des\" bis_skin_checked=\"1\">\n                                <p class=\"description\">\n                                    <span class=\"builder_text parent\" content_type=\"text\" id=\"678\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of use Lorem Ipsum.</span>\n                                </p>\n                                <div class=\"user-info d-flex\" bis_skin_checked=\"1\">\n                                    <div bis_skin_checked=\"1\">\n                                        <h4><span class=\"builder_text parent\" content_type=\"text\" id=\"105\">Linchon Philips</span></h4>\n                                        <p><span class=\"builder_text parent\" content_type=\"text\" id=\"960\">CEO @ Yahoo</span></p>\n                                    </div>\n                                    <ul class=\"d-flex align-items-center\">\n                                        <li><i class=\"fa fa-star\"></i></li>\n                                        <li><i class=\"fa fa-star\"></i></li>\n                                        <li><i class=\"fa fa-star\"></i></li>\n                                        <li><i class=\"fa fa-star\"></i></li>\n                                        <li><i class=\"fa fa-star\"></i></li>\n                                    </ul>\n                                </div>\n                            </div>\n                        </div>\n                    </div></div><div class=\"owl-item cloned\" bis_skin_checked=\"1\" style=\"width: 755px; margin-right: 10px;\"><div class=\"single-opinion\" bis_skin_checked=\"1\">\n                        <div class=\"user-image\" bis_skin_checked=\"1\">\n                            <span class=\"builder_image parent\" content_type=\"image\" id=\"592\"><img src=\"http://localhost/academy-laravel/sham/academy/public/assets/page-builder/block-image/test-image.png\" alt=\"\"></span>\n                        </div>\n                        <div class=\"testimonial-border\" bis_skin_checked=\"1\">\n                            <div class=\"testimonial-des\" bis_skin_checked=\"1\">\n                                <p class=\"description\"><span class=\"builder_text parent\" content_type=\"text\" id=\"215\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of use Lorem Ipsum.</span></p>\n                                <div class=\"user-info d-flex\" bis_skin_checked=\"1\">\n                                    <div bis_skin_checked=\"1\">\n                                        <h4><span class=\"builder_text parent\" content_type=\"text\" id=\"340\">Linchon Philips</span></h4>\n                                        <p><span class=\"builder_text parent\" content_type=\"text\" id=\"774\">CEO @ Yahoo</span></p>\n                                    </div>\n                                    <ul class=\"d-flex align-items-center\">\n                                        <li><i class=\"fa fa-star\"></i></li>\n                                        <li><i class=\"fa fa-star\"></i></li>\n                                        <li><i class=\"fa fa-star\"></i></li>\n                                        <li><i class=\"fa fa-star\"></i></li>\n                                        <li><i class=\"fa fa-star\"></i></li>\n                                    </ul>\n                                </div>\n                            </div>\n                        </div>\n                    </div></div><div class=\"owl-item cloned\" bis_skin_checked=\"1\" style=\"width: 755px; margin-right: 10px;\"><div class=\"single-opinion\" bis_skin_checked=\"1\">\n                        <div class=\"user-image\" bis_skin_checked=\"1\">\n                            <span class=\"builder_image parent\" content_type=\"image\" id=\"429\"><img src=\"http://localhost/academy-laravel/sham/academy/public/assets/page-builder/block-image/test-image.png\" alt=\"\"></span>\n                        </div>\n                        <div class=\"testimonial-border\" bis_skin_checked=\"1\">\n                            <div class=\"testimonial-des\" bis_skin_checked=\"1\">\n                                <span class=\"description\"><span class=\"builder_text parent\" content_type=\"text\" id=\"690\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of use Lorem Ipsum.</span><p></p>\n                                    <div class=\"user-info d-flex\" bis_skin_checked=\"1\">\n                                        <div bis_skin_checked=\"1\">\n                                            <h4><span class=\"builder_text parent\" content_type=\"text\" id=\"692\">Linchon Philips</span></h4>\n                                            <p><span class=\"builder_text parent\" content_type=\"text\" id=\"967\">CEO @ Yahoo</span></p>\n                                        </div>\n                                        <ul class=\"d-flex align-items-center\">\n                                            <li><i class=\"fa fa-star\"></i></li>\n                                            <li><i class=\"fa fa-star\"></i></li>\n                                            <li><i class=\"fa fa-star\"></i></li>\n                                            <li><i class=\"fa fa-star\"></i></li>\n                                            <li><i class=\"fa fa-star\"></i></li>\n                                        </ul>\n                                    </div>\n                            </span></div>\n                        </div>\n                    </div></div><div class=\"owl-item active\" bis_skin_checked=\"1\" style=\"width: 755px; margin-right: 10px;\"><div class=\"single-opinion\" bis_skin_checked=\"1\">\n                        <div class=\"user-image\" bis_skin_checked=\"1\">\n                            <span class=\"builder_image parent\" content_type=\"image\" id=\"507\"><img src=\"http://localhost/academy-laravel/sham/academy/public/assets/page-builder/block-image/test-image.png\" alt=\"\"></span>\n                        </div>\n                        <div class=\"testimonial-border\" bis_skin_checked=\"1\">\n                            <div class=\"testimonial-des\" bis_skin_checked=\"1\">\n                                <p class=\"description\">\n                                    <span class=\"builder_text parent\" content_type=\"text\" id=\"678\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of use Lorem Ipsum.</span>\n                                </p>\n                                <div class=\"user-info d-flex\" bis_skin_checked=\"1\">\n                                    <div bis_skin_checked=\"1\">\n                                        <h4><span class=\"builder_text parent\" content_type=\"text\" id=\"105\">Linchon Philips</span></h4>\n                                        <p><span class=\"builder_text parent\" content_type=\"text\" id=\"960\">CEO @ Yahoo</span></p>\n                                    </div>\n                                    <ul class=\"d-flex align-items-center\">\n                                        <li><i class=\"fa fa-star\"></i></li>\n                                        <li><i class=\"fa fa-star\"></i></li>\n                                        <li><i class=\"fa fa-star\"></i></li>\n                                        <li><i class=\"fa fa-star\"></i></li>\n                                        <li><i class=\"fa fa-star\"></i></li>\n                                    </ul>\n                                </div>\n                            </div>\n                        </div>\n                    </div></div><div class=\"owl-item\" bis_skin_checked=\"1\" style=\"width: 755px; margin-right: 10px;\"><div class=\"single-opinion\" bis_skin_checked=\"1\">\n                        <div class=\"user-image\" bis_skin_checked=\"1\">\n                            <span class=\"builder_image parent\" content_type=\"image\" id=\"592\"><img src=\"http://localhost/academy-laravel/sham/academy/public/assets/page-builder/block-image/test-image.png\" alt=\"\"></span>\n                        </div>\n                        <div class=\"testimonial-border\" bis_skin_checked=\"1\">\n                            <div class=\"testimonial-des\" bis_skin_checked=\"1\">\n                                <p class=\"description\"><span class=\"builder_text parent\" content_type=\"text\" id=\"215\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of use Lorem Ipsum.</span></p>\n                                <div class=\"user-info d-flex\" bis_skin_checked=\"1\">\n                                    <div bis_skin_checked=\"1\">\n                                        <h4><span class=\"builder_text parent\" content_type=\"text\" id=\"340\">Linchon Philips</span></h4>\n                                        <p><span class=\"builder_text parent\" content_type=\"text\" id=\"774\">CEO @ Yahoo</span></p>\n                                    </div>\n                                    <ul class=\"d-flex align-items-center\">\n                                        <li><i class=\"fa fa-star\"></i></li>\n                                        <li><i class=\"fa fa-star\"></i></li>\n                                        <li><i class=\"fa fa-star\"></i></li>\n                                        <li><i class=\"fa fa-star\"></i></li>\n                                        <li><i class=\"fa fa-star\"></i></li>\n                                    </ul>\n                                </div>\n                            </div>\n                        </div>\n                    </div></div><div class=\"owl-item\" bis_skin_checked=\"1\" style=\"width: 755px; margin-right: 10px;\"><div class=\"single-opinion\" bis_skin_checked=\"1\">\n                        <div class=\"user-image\" bis_skin_checked=\"1\">\n                            <span class=\"builder_image parent\" content_type=\"image\" id=\"429\"><img src=\"http://localhost/academy-laravel/sham/academy/public/assets/page-builder/block-image/test-image.png\" alt=\"\"></span>\n                        </div>\n                        <div class=\"testimonial-border\" bis_skin_checked=\"1\">\n                            <div class=\"testimonial-des\" bis_skin_checked=\"1\">\n                                <span class=\"description\"><span class=\"builder_text parent\" content_type=\"text\" id=\"690\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of use Lorem Ipsum.</span><p></p>\n                                    <div class=\"user-info d-flex\" bis_skin_checked=\"1\">\n                                        <div bis_skin_checked=\"1\">\n                                            <h4><span class=\"builder_text parent\" content_type=\"text\" id=\"692\">Linchon Philips</span></h4>\n                                            <p><span class=\"builder_text parent\" content_type=\"text\" id=\"967\">CEO @ Yahoo</span></p>\n                                        </div>\n                                        <ul class=\"d-flex align-items-center\">\n                                            <li><i class=\"fa fa-star\"></i></li>\n                                            <li><i class=\"fa fa-star\"></i></li>\n                                            <li><i class=\"fa fa-star\"></i></li>\n                                            <li><i class=\"fa fa-star\"></i></li>\n                                            <li><i class=\"fa fa-star\"></i></li>\n                                        </ul>\n                                    </div>\n                            </span></div>\n                        </div>\n                    </div></div><div class=\"owl-item\" bis_skin_checked=\"1\" style=\"width: 755px; margin-right: 10px;\"><div class=\"single-opinion\" bis_skin_checked=\"1\">\n                        <div class=\"user-image\" bis_skin_checked=\"1\">\n                            <span class=\"builder_image parent\" content_type=\"image\" id=\"341\"><img src=\"http://localhost/academy-laravel/sham/academy/public/assets/page-builder/block-image/test-image.png\" alt=\"\"></span>\n                        </div>\n                        <div class=\"testimonial-border\" bis_skin_checked=\"1\">\n                            <div class=\"testimonial-des\" bis_skin_checked=\"1\">\n                                <p class=\"description\"><span class=\"builder_text parent\" content_type=\"text\" id=\"184\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of use Lorem Ipsum.</span></p>\n                                <div class=\"user-info d-flex\" bis_skin_checked=\"1\">\n                                    <div bis_skin_checked=\"1\">\n                                        <h4><span class=\"builder_text parent\" content_type=\"text\" id=\"656\">Linchon Philips</span></h4>\n                                        <p><span class=\"builder_text parent\" content_type=\"text\" id=\"778\">CEO @ Yahoo</span></p>\n                                    </div>\n                                    <ul class=\"d-flex align-items-center\">\n                                        <li><i class=\"fa fa-star\"></i></li>\n                                        <li><i class=\"fa fa-star\"></i></li>\n                                        <li><i class=\"fa fa-star\"></i></li>\n                                        <li><i class=\"fa fa-star\"></i></li>\n                                        <li><i class=\"fa fa-star\"></i></li>\n                                    </ul>\n                                </div>\n                            </div>\n                        </div>\n                    </div></div><div class=\"owl-item\" bis_skin_checked=\"1\" style=\"width: 755px; margin-right: 10px;\"><div class=\"single-opinion\" bis_skin_checked=\"1\">\n                        <div class=\"user-image\" bis_skin_checked=\"1\">\n                            <span class=\"builder_image parent\" content_type=\"image\" id=\"768\"><img src=\"http://localhost/academy-laravel/sham/academy/public/assets/page-builder/block-image/test-image.png\" alt=\"\"></span>\n                        </div>\n                        <div class=\"testimonial-border\" bis_skin_checked=\"1\">\n                            <div class=\"testimonial-des\" bis_skin_checked=\"1\">\n                                <p class=\"description\"><span class=\"builder_text parent\" content_type=\"text\" id=\"546\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of use Lorem Ipsum.</span></p>\n                                <div class=\"user-info d-flex\" bis_skin_checked=\"1\">\n                                    <div bis_skin_checked=\"1\">\n                                        <h4><span class=\"builder_text parent\" content_type=\"text\" id=\"600\">Linchon Philips</span></h4>\n                                        <p><span class=\"builder_text parent\" content_type=\"text\" id=\"435\">CEO @ Yahoo</span></p>\n                                    </div>\n                                    <ul class=\"d-flex align-items-center\">\n                                        <li><i class=\"fa fa-star\"></i></li>\n                                        <li><i class=\"fa fa-star\"></i></li>\n                                        <li><i class=\"fa fa-star\"></i></li>\n                                        <li><i class=\"fa fa-star\"></i></li>\n                                        <li><i class=\"fa fa-star\"></i></li>\n                                    </ul>\n                                </div>\n                            </div>\n                        </div>\n                    </div></div><div class=\"owl-item cloned\" bis_skin_checked=\"1\" style=\"width: 755px; margin-right: 10px;\"><div class=\"single-opinion\" bis_skin_checked=\"1\">\n                        <div class=\"user-image\" bis_skin_checked=\"1\">\n                            <span class=\"builder_image parent\" content_type=\"image\" id=\"429\"><img src=\"http://localhost/academy-laravel/sham/academy/public/assets/page-builder/block-image/test-image.png\" alt=\"\"></span>\n                        </div>\n                        <div class=\"testimonial-border\" bis_skin_checked=\"1\">\n                            <div class=\"testimonial-des\" bis_skin_checked=\"1\">\n                                <span class=\"description\"><span class=\"builder_text parent\" content_type=\"text\" id=\"690\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of use Lorem Ipsum.</span><p></p>\n                                    <div class=\"user-info d-flex\" bis_skin_checked=\"1\">\n                                        <div bis_skin_checked=\"1\">\n                                            <h4><span class=\"builder_text parent\" content_type=\"text\" id=\"692\">Linchon Philips</span></h4>\n                                            <p><span class=\"builder_text parent\" content_type=\"text\" id=\"967\">CEO @ Yahoo</span></p>\n                                        </div>\n                                        <ul class=\"d-flex align-items-center\">\n                                            <li><i class=\"fa fa-star\"></i></li>\n                                            <li><i class=\"fa fa-star\"></i></li>\n                                            <li><i class=\"fa fa-star\"></i></li>\n                                            <li><i class=\"fa fa-star\"></i></li>\n                                            <li><i class=\"fa fa-star\"></i></li>\n                                        </ul>\n                                    </div>\n                            </span></div>\n                        </div>\n                    </div></div><div class=\"owl-item cloned\" bis_skin_checked=\"1\" style=\"width: 755px; margin-right: 10px;\"><div class=\"single-opinion\" bis_skin_checked=\"1\">\n                        <div class=\"user-image\" bis_skin_checked=\"1\">\n                            <span class=\"builder_image parent\" content_type=\"image\" id=\"341\"><img src=\"http://localhost/academy-laravel/sham/academy/public/assets/page-builder/block-image/test-image.png\" alt=\"\"></span>\n                        </div>\n                        <div class=\"testimonial-border\" bis_skin_checked=\"1\">\n                            <div class=\"testimonial-des\" bis_skin_checked=\"1\">\n                                <p class=\"description\"><span class=\"builder_text parent\" content_type=\"text\" id=\"184\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of use Lorem Ipsum.</span></p>\n                                <div class=\"user-info d-flex\" bis_skin_checked=\"1\">\n                                    <div bis_skin_checked=\"1\">\n                                        <h4><span class=\"builder_text parent\" content_type=\"text\" id=\"656\">Linchon Philips</span></h4>\n                                        <p><span class=\"builder_text parent\" content_type=\"text\" id=\"778\">CEO @ Yahoo</span></p>\n                                    </div>\n                                    <ul class=\"d-flex align-items-center\">\n                                        <li><i class=\"fa fa-star\"></i></li>\n                                        <li><i class=\"fa fa-star\"></i></li>\n                                        <li><i class=\"fa fa-star\"></i></li>\n                                        <li><i class=\"fa fa-star\"></i></li>\n                                        <li><i class=\"fa fa-star\"></i></li>\n                                    </ul>\n                                </div>\n                            </div>\n                        </div>\n                    </div></div><div class=\"owl-item cloned\" bis_skin_checked=\"1\" style=\"width: 755px; margin-right: 10px;\"><div class=\"single-opinion\" bis_skin_checked=\"1\">\n                        <div class=\"user-image\" bis_skin_checked=\"1\">\n                            <span class=\"builder_image parent\" content_type=\"image\" id=\"768\"><img src=\"http://localhost/academy-laravel/sham/academy/public/assets/page-builder/block-image/test-image.png\" alt=\"\"></span>\n                        </div>\n                        <div class=\"testimonial-border\" bis_skin_checked=\"1\">\n                            <div class=\"testimonial-des\" bis_skin_checked=\"1\">\n                                <p class=\"description\"><span class=\"builder_text parent\" content_type=\"text\" id=\"546\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of use Lorem Ipsum.</span></p>\n                                <div class=\"user-info d-flex\" bis_skin_checked=\"1\">\n                                    <div bis_skin_checked=\"1\">\n                                        <h4><span class=\"builder_text parent\" content_type=\"text\" id=\"600\">Linchon Philips</span></h4>\n                                        <p><span class=\"builder_text parent\" content_type=\"text\" id=\"435\">CEO @ Yahoo</span></p>\n                                    </div>\n                                    <ul class=\"d-flex align-items-center\">\n                                        <li><i class=\"fa fa-star\"></i></li>\n                                        <li><i class=\"fa fa-star\"></i></li>\n                                        <li><i class=\"fa fa-star\"></i></li>\n                                        <li><i class=\"fa fa-star\"></i></li>\n                                        <li><i class=\"fa fa-star\"></i></li>\n                                    </ul>\n                                </div>\n                            </div>\n                        </div>\n                    </div></div><div class=\"owl-item cloned\" bis_skin_checked=\"1\" style=\"width: 755px; margin-right: 10px;\"><div class=\"single-opinion\" bis_skin_checked=\"1\">\n                        <div class=\"user-image\" bis_skin_checked=\"1\">\n                            <span class=\"builder_image parent\" content_type=\"image\" id=\"507\"><img src=\"http://localhost/academy-laravel/sham/academy/public/assets/page-builder/block-image/test-image.png\" alt=\"\"></span>\n                        </div>\n                        <div class=\"testimonial-border\" bis_skin_checked=\"1\">\n                            <div class=\"testimonial-des\" bis_skin_checked=\"1\">\n                                <p class=\"description\">\n                                    <span class=\"builder_text parent\" content_type=\"text\" id=\"678\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of use Lorem Ipsum.</span>\n                                </p>\n                                <div class=\"user-info d-flex\" bis_skin_checked=\"1\">\n                                    <div bis_skin_checked=\"1\">\n                                        <h4><span class=\"builder_text parent\" content_type=\"text\" id=\"105\">Linchon Philips</span></h4>\n                                        <p><span class=\"builder_text parent\" content_type=\"text\" id=\"960\">CEO @ Yahoo</span></p>\n                                    </div>\n                                    <ul class=\"d-flex align-items-center\">\n                                        <li><i class=\"fa fa-star\"></i></li>\n                                        <li><i class=\"fa fa-star\"></i></li>\n                                        <li><i class=\"fa fa-star\"></i></li>\n                                        <li><i class=\"fa fa-star\"></i></li>\n                                        <li><i class=\"fa fa-star\"></i></li>\n                                    </ul>\n                                </div>\n                            </div>\n                        </div>\n                    </div></div><div class=\"owl-item cloned\" bis_skin_checked=\"1\" style=\"width: 755px; margin-right: 10px;\"><div class=\"single-opinion\" bis_skin_checked=\"1\">\n                        <div class=\"user-image\" bis_skin_checked=\"1\">\n                            <span class=\"builder_image parent\" content_type=\"image\" id=\"592\"><img src=\"http://localhost/academy-laravel/sham/academy/public/assets/page-builder/block-image/test-image.png\" alt=\"\"></span>\n                        </div>\n                        <div class=\"testimonial-border\" bis_skin_checked=\"1\">\n                            <div class=\"testimonial-des\" bis_skin_checked=\"1\">\n                                <p class=\"description\"><span class=\"builder_text parent\" content_type=\"text\" id=\"215\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of use Lorem Ipsum.</span></p>\n                                <div class=\"user-info d-flex\" bis_skin_checked=\"1\">\n                                    <div bis_skin_checked=\"1\">\n                                        <h4><span class=\"builder_text parent\" content_type=\"text\" id=\"340\">Linchon Philips</span></h4>\n                                        <p><span class=\"builder_text parent\" content_type=\"text\" id=\"774\">CEO @ Yahoo</span></p>\n                                    </div>\n                                    <ul class=\"d-flex align-items-center\">\n                                        <li><i class=\"fa fa-star\"></i></li>\n                                        <li><i class=\"fa fa-star\"></i></li>\n                                        <li><i class=\"fa fa-star\"></i></li>\n                                        <li><i class=\"fa fa-star\"></i></li>\n                                        <li><i class=\"fa fa-star\"></i></li>\n                                    </ul>\n                                </div>\n                            </div>\n                        </div>\n                    </div></div><div class=\"owl-item cloned\" bis_skin_checked=\"1\" style=\"width: 755px; margin-right: 10px;\"><div class=\"single-opinion\" bis_skin_checked=\"1\">\n                        <div class=\"user-image\" bis_skin_checked=\"1\">\n                            <span class=\"builder_image parent\" content_type=\"image\" id=\"429\"><img src=\"http://localhost/academy-laravel/sham/academy/public/assets/page-builder/block-image/test-image.png\" alt=\"\"></span>\n                        </div>\n                        <div class=\"testimonial-border\" bis_skin_checked=\"1\">\n                            <div class=\"testimonial-des\" bis_skin_checked=\"1\">\n                                <span class=\"description\"><span class=\"builder_text parent\" content_type=\"text\" id=\"690\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of use Lorem Ipsum.</span><p></p>\n                                    <div class=\"user-info d-flex\" bis_skin_checked=\"1\">\n                                        <div bis_skin_checked=\"1\">\n                                            <h4><span class=\"builder_text parent\" content_type=\"text\" id=\"692\">Linchon Philips</span></h4>\n                                            <p><span class=\"builder_text parent\" content_type=\"text\" id=\"967\">CEO @ Yahoo</span></p>\n                                        </div>\n                                        <ul class=\"d-flex align-items-center\">\n                                            <li><i class=\"fa fa-star\"></i></li>\n                                            <li><i class=\"fa fa-star\"></i></li>\n                                            <li><i class=\"fa fa-star\"></i></li>\n                                            <li><i class=\"fa fa-star\"></i></li>\n                                            <li><i class=\"fa fa-star\"></i></li>\n                                        </ul>\n                                    </div>\n                            </span></div>\n                        </div>\n                    </div></div></div></div><div class=\"owl-nav\" bis_skin_checked=\"1\"><button type=\"button\" role=\"presentation\" class=\"owl-prev\"><i class=\"fa-solid fa-chevron-left\"></i></button><button type=\"button\" role=\"presentation\" class=\"owl-next\"><i class=\"fa-solid fa-chevron-right\"></i></button></div><div class=\"owl-dots disabled\" bis_skin_checked=\"1\"></div><div class=\"owl-nav\" bis_skin_checked=\"1\"><button type=\"button\" role=\"presentation\" class=\"owl-prev\"><i class=\"fa-solid fa-chevron-left\"></i></button><button type=\"button\" role=\"presentation\" class=\"owl-next\"><i class=\"fa-solid fa-chevron-right\"></i></button></div><div class=\"owl-dots disabled\" bis_skin_checked=\"1\"></div><div class=\"owl-nav\" bis_skin_checked=\"1\"><button type=\"button\" role=\"presentation\" class=\"owl-prev\"><i class=\"fa-solid fa-chevron-left\"></i></button><button type=\"button\" role=\"presentation\" class=\"owl-next\"><i class=\"fa-solid fa-chevron-right\"></i></button></div><div class=\"owl-dots disabled\" bis_skin_checked=\"1\"></div></div>\n            </div>\n        </div>\n    </div>\n</section>\n<script>\n    $(\'.testimonials-wrapper .user-slider\').owlCarousel({\n        loop: true,\n        autoplay: false,\n        margin: 10,\n        nav: true,\n        navText: [\'<i class=\"fa-solid fa-chevron-left\"></i>\', \'<i class=\"fa-solid fa-chevron-right\"></i>\'],\n        dots: false,\n        responsive: {\n            0: {\n                items: 1\n            },\n            600: {\n                items: 1\n            },\n            1000: {\n                items: 1\n            }\n        }\n    });\n</script>\n            </div><div class=\"section parent ui-sortable-handle\" id=\"691\" bis_skin_checked=\"1\">\n                                <section class=\"blog-wrapper section-padding\">\n    <div class=\"container\" bis_skin_checked=\"1\">\n        <div class=\"row\" bis_skin_checked=\"1\">\n            <div class=\"col-lg-12\" bis_skin_checked=\"1\">\n                <div class=\"res-control d-flex align-items-center justify-content-between\" bis_skin_checked=\"1\">\n                    <div class=\"section-title mb-0\" bis_skin_checked=\"1\">\n                        <span class=\"title-head mb-10 builder_text parent\" content_type=\"text\" id=\"349\">Our Blog</span>\n                        <h2 class=\"title builder_text parent\" content_type=\"text\" id=\"369\">Have a look on our news</h2>\n                    </div>\n                    <span class=\"blog-view-all-button\">\n                        <a href=\"#\" class=\"eBtn gradient\">View All Blogs</a>\n                    </span>\n               </div>\n            </div>\n        </div>\n        <span class=\"blog\">\n            <div class=\"row justify-content-center mt-50\" bis_skin_checked=\"1\">\n                <div class=\"col-lg-4 col-md-6 col-sm-6 mb-20\" bis_skin_checked=\"1\">\n                    <div class=\"Ecard card b-card\" bis_skin_checked=\"1\">\n                        <div class=\"card-head\" bis_skin_checked=\"1\">\n                            <img src=\"http://localhost/academy-laravel/sham/academy/public/assets/page-builder/block-image/blog1.png\" alt=\"...\">\n                            <span>Bussiness</span>\n                        </div>\n                        <div class=\"card-body\" bis_skin_checked=\"1\">\n                            <h4>Skills That You Can Learn From Education</h4>\n                            <p class=\"description\">It is a long established fact that a reader will be distracted by the readable...</p>\n                            <div class=\"b_bottom d-flex justify-content-between\" bis_skin_checked=\"1\">\n                                <a href=\"#\" class=\"read-text mt-0 stretched-link\">Read More<i class=\"fa-solid fa-arrow-right-long ms-2\"></i></a>\n                            <span>01 Jan, 2024</span>\n                            </div>\n                        </div>\n                    </div>\n                </div>\n                <div class=\"col-lg-4 col-md-6 col-sm-6 mb-20\" bis_skin_checked=\"1\">\n                    <div class=\"Ecard card b-card\" bis_skin_checked=\"1\">\n                        <div class=\"card-head\" bis_skin_checked=\"1\">\n                            <img src=\"http://localhost/academy-laravel/sham/academy/public/assets/page-builder/block-image/blog2.png\" alt=\"...\">\n                            <span>Bussiness</span>\n                        </div>\n                        <div class=\"card-body\" bis_skin_checked=\"1\">\n                            <h4>Skills That You Can Learn From Education</h4>\n                            <p class=\"description\">It is a long established fact that a reader will be distracted by the readable...</p>\n                            <div class=\"b_bottom d-flex justify-content-between\" bis_skin_checked=\"1\">\n                                <a href=\"#\" class=\"read-text mt-0 stretched-link\">Read More<i class=\"fa-solid fa-arrow-right-long ms-2\"></i></a>\n                            <span>01 Jan, 2024</span>\n                            </div>\n                        </div>\n                    </div>\n                </div>\n                <div class=\"col-lg-4 col-md-6 col-sm-6 mb-20\" bis_skin_checked=\"1\">\n                    <div class=\"Ecard card b-card\" bis_skin_checked=\"1\">\n                        <div class=\"card-head\" bis_skin_checked=\"1\">\n                            <img src=\"http://localhost/academy-laravel/sham/academy/public/assets/page-builder/block-image/blog3.png\" alt=\"...\">\n                            <span>Bussiness</span>\n                        </div>\n                        <div class=\"card-body\" bis_skin_checked=\"1\">\n                            <h4>Skills That You Can Learn From Education</h4>\n                            <p class=\"description\">It is a long established fact that a reader will be distracted by the readable...</p>\n                            <div class=\"b_bottom d-flex justify-content-between\" bis_skin_checked=\"1\">\n                                <a href=\"#\" class=\"read-text mt-0 stretched-link\">Read More<i class=\"fa-solid fa-arrow-right-long ms-2\"></i></a>\n                            <span>01 Jan, 2024</span>\n                            </div>\n                        </div>\n                    </div>\n                </div>\n            </div>\n        </span>\n    </div>\n</section>\n            </div><div class=\"section parent ui-sortable-handle\" id=\"301\" bis_skin_checked=\"1\">\n                                <footer class=\"footer-area\">\n    <div class=\"container\" bis_skin_checked=\"1\">\n        <div class=\"row\" bis_skin_checked=\"1\">\n            <div class=\"col-lg-4 col-md-4\" bis_skin_checked=\"1\">\n                <div class=\"footer-content\" bis_skin_checked=\"1\">\n                    <span class=\"builder_image parent\" content_type=\"image\" id=\"572\">\n                        <img src=\"http://localhost/academy-laravel/sham/academy/public/uploads/home-page-builder/1724763141-rxYmw0UGZT2CjeFk8S3aWKPIQfdVML.png\" alt=\"...\">\n                    </span>\n                    <p class=\"description builder_text parent\" content_type=\"text\" id=\"378\">It is a long established fact that a reader will be the distract by the read content of a page  layout.</p>\n\n                    <span class=\"footer-social-contact\">\n                        <ul class=\"f-socials d-flex\">\n                            <li><a href=\"#\"><i class=\"fa-brands fa-twitter\"></i></a></li>\n                            <li><a href=\"#\"><i class=\"fa-brands fa-facebook-f\"></i></a></li>\n                            <li><a href=\"#\"><i class=\"fa-brands fa-linkedin-in\"></i></a></li>\n                            <li><a href=\"#\"><i class=\"fa-brands fa-instagram\"></i></a></li>\n                        </ul>\n                        <div class=\"gradient-border2\" bis_skin_checked=\"1\">\n                            <a href=\"#\" class=\"gradient-border-btn\">Contact with Us <i class=\"fa-solid fa-arrow-right-long ms-2\"></i></a>\n                        </div>\n                    </span>\n                </div>\n            </div>\n            <div class=\"col-lg-8 col-md-8\" bis_skin_checked=\"1\">\n                <div class=\"row\" bis_skin_checked=\"1\">\n                    <div class=\"col-lg-3 col-md-6\" bis_skin_checked=\"1\">\n                        <span class=\"footer-widget-1\">\n                            <div class=\"footer-widget\" bis_skin_checked=\"1\">\n                                <h4>Resources</h4>\n                                <ul>\n                                    <li><a href=\"#\">Academy</a></li>\n                                    <li><a href=\"#\">Blog</a></li>\n                                    <li><a href=\"#\">Themes</a></li>\n                                    <li><a href=\"#\">Hosting</a></li>\n                                    <li><a href=\"#\">Developer</a></li>\n                                </ul>\n                            </div>\n                        </span>\n                    </div>\n                    <div class=\"col-lg-3 col-md-6\" bis_skin_checked=\"1\">\n                        <span class=\"footer-widget-2\">\n                            <div class=\"footer-widget\" bis_skin_checked=\"1\">\n                                <h4>Company</h4>\n                                <ul>\n                                    <li><a href=\"#\">About Us</a></li>\n                                    <li><a href=\"#\">Careers</a></li>\n                                    <li><a href=\"#\">FAQs</a></li>\n                                    <li><a href=\"#\">Teams</a></li>\n                                    <li><a href=\"#\">Contact Us</a></li>\n                                </ul>\n                            </div>\n                        </span>\n                    </div>\n                    <div class=\"col-lg-6 col-md-6\" bis_skin_checked=\"1\">\n                        <div class=\"footer-widget\" bis_skin_checked=\"1\">\n                            <span class=\"footer-widget-3\">\n                                <h4>Company</h4>\n                                <ul>\n                                    <li><a href=\"#\">Phone : +76 398 380 422</a></li>\n                                    <li><a href=\"#\">Email : companyname@gmail.com</a></li>\n                                </ul>\n                            </span>\n                           <div class=\"newslater-bottom\" bis_skin_checked=\"1\">\n                                <h4 class=\"builder_text parent\" content_type=\"text\" id=\"913\">Newsletter</h4>\n                                <p class=\"description builder_text parent\" content_type=\"text\" id=\"39\">Subscribe to stay tuned for new web design and latest updates. Let\'s do it! </p>\n                                <span class=\"footer-subscription-form\">\n                                    <form action=\"#\" class=\"newslater-form\">\n                                        <input type=\"text\" class=\"form-control\" placeholder=\"Enter your email here\">\n                                        <button class=\"eBtn gradient\">Submit</button>\n                                    </form>\n                                </span>\n                           </div>\n                        </div>\n                    </div>\n                </div>\n            </div>\n        </div>\n    </div>\n    <span class=\"footer-bottom\">\n        <div class=\"footer-bottom\" bis_skin_checked=\"1\">\n            <div class=\"container\" bis_skin_checked=\"1\">\n                <div class=\"row\" bis_skin_checked=\"1\">\n                    <div class=\"col-lg-8\" bis_skin_checked=\"1\">\n                        <ul class=\"footer-policy\">\n                            <li><a href=\"#\">Privacy Policy</a></li>\n                            <li><a href=\"#\">Terms And Use</a></li>\n                            <li><a href=\"#\">Sales and Refunds</a></li>\n                            <li><a href=\"#\">Legal</a></li>\n                            <li><a href=\"#\">Site Map</a></li>\n                        </ul>\n                    </div>\n                    <div class=\"col-lg-4\" bis_skin_checked=\"1\">\n                        <div class=\"copyright-text\" bis_skin_checked=\"1\">\n                            <p>© 2023 All Rights Reserved</p>\n                        </div>\n                    </div>\n                </div>\n            </div>\n        </div>\n    </span>\n</footer>\n            </div>', NULL, NULL, 1, NULL, '2024-08-27 04:25:11', '2024-08-27 06:52:29');

-- --------------------------------------------------------

--
-- Table structure for table `cart_items`
--

CREATE TABLE `cart_items` (
  `id` int(255) NOT NULL,
  `user_id` int(255) DEFAULT NULL,
  `course_id` int(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort` int(11) NOT NULL DEFAULT '0',
  `status` int(11) DEFAULT NULL,
  `keywords` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thumbnail` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `certificates`
--

CREATE TABLE `certificates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `course_id` bigint(20) UNSIGNED DEFAULT NULL,
  `identifier` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` int(21) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8_unicode_ci,
  `message` text COLLATE utf8_unicode_ci,
  `has_read` int(11) DEFAULT '0',
  `replied` int(11) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` int(255) NOT NULL,
  `user_id` int(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `discount` float(10,2) DEFAULT NULL,
  `expiry` varchar(255) DEFAULT NULL,
  `status` int(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `short_description` text COLLATE utf8mb4_unicode_ci,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `course_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `level` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `language` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_paid` int(11) DEFAULT NULL,
  `is_best` int(11) NOT NULL DEFAULT '0',
  `price` double(10,2) DEFAULT NULL,
  `discounted_price` double(10,2) DEFAULT NULL,
  `discount_flag` int(11) DEFAULT NULL,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `thumbnail` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `banner` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `preview` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `requirements` mediumtext COLLATE utf8mb4_unicode_ci,
  `outcomes` mediumtext COLLATE utf8mb4_unicode_ci,
  `faqs` mediumtext COLLATE utf8mb4_unicode_ci,
  `instructors` text COLLATE utf8mb4_unicode_ci,
  `average_rating` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `symbol` varchar(255) DEFAULT NULL,
  `paypal_supported` int(11) DEFAULT NULL,
  `stripe_supported` int(11) DEFAULT NULL,
  `ccavenue_supported` int(11) DEFAULT '0',
  `iyzico_supported` int(11) DEFAULT '0',
  `paystack_supported` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `name`, `code`, `symbol`, `paypal_supported`, `stripe_supported`, `ccavenue_supported`, `iyzico_supported`, `paystack_supported`) VALUES
(1, 'US Dollar', 'USD', '$', 1, 1, 0, 0, 0),
(2, 'Albanian Lek', 'ALL', 'Lek', 0, 1, 0, 0, 0),
(3, 'Algerian Dinar', 'DZD', 'دج', 1, 1, 0, 0, 0),
(4, 'Angolan Kwanza', 'AOA', 'Kz', 1, 1, 0, 0, 0),
(5, 'Argentine Peso', 'ARS', '$', 1, 1, 0, 0, 0),
(6, 'Armenian Dram', 'AMD', '֏', 1, 1, 0, 0, 0),
(7, 'Aruban Florin', 'AWG', 'ƒ', 1, 1, 0, 0, 0),
(8, 'Australian Dollar', 'AUD', '$', 1, 1, 0, 0, 0),
(9, 'Azerbaijani Manat', 'AZN', 'm', 1, 1, 0, 0, 0),
(10, 'Bahamian Dollar', 'BSD', 'B$', 1, 1, 0, 0, 0),
(11, 'Bahraini Dinar', 'BHD', '.د.ب', 1, 1, 0, 0, 0),
(12, 'Bangladeshi Taka', 'BDT', '৳', 1, 1, 0, 0, 0),
(13, 'Barbadian Dollar', 'BBD', 'Bds$', 1, 1, 0, 0, 0),
(14, 'Belarusian Ruble', 'BYR', 'Br', 0, 0, 0, 0, 0),
(15, 'Belgian Franc', 'BEF', 'fr', 1, 1, 0, 0, 0),
(16, 'Belize Dollar', 'BZD', '$', 1, 1, 0, 0, 0),
(17, 'Bermudan Dollar', 'BMD', '$', 1, 1, 0, 0, 0),
(18, 'Bhutanese Ngultrum', 'BTN', 'Nu.', 1, 1, 0, 0, 0),
(19, 'Bitcoin', 'BTC', '฿', 1, 1, 0, 0, 0),
(20, 'Bolivian Boliviano', 'BOB', 'Bs.', 1, 1, 0, 0, 0),
(21, 'Bosnia', 'BAM', 'KM', 1, 1, 0, 0, 0),
(22, 'Botswanan Pula', 'BWP', 'P', 1, 1, 0, 0, 0),
(23, 'Brazilian Real', 'BRL', 'R$', 1, 1, 0, 0, 0),
(24, 'British Pound Sterling', 'GBP', '£', 1, 1, 0, 0, 0),
(25, 'Brunei Dollar', 'BND', 'B$', 1, 1, 0, 0, 0),
(26, 'Bulgarian Lev', 'BGN', 'Лв.', 1, 1, 0, 0, 0),
(27, 'Burundian Franc', 'BIF', 'FBu', 1, 1, 0, 0, 0),
(28, 'Cambodian Riel', 'KHR', 'KHR', 1, 1, 0, 0, 0),
(29, 'Canadian Dollar', 'CAD', '$', 1, 1, 0, 0, 0),
(30, 'Cape Verdean Escudo', 'CVE', '$', 1, 1, 0, 0, 0),
(31, 'Cayman Islands Dollar', 'KYD', '$', 1, 1, 0, 0, 0),
(32, 'CFA Franc BCEAO', 'XOF', 'CFA', 1, 1, 0, 0, 0),
(33, 'CFA Franc BEAC', 'XAF', 'FCFA', 1, 1, 0, 0, 0),
(34, 'CFP Franc', 'XPF', '₣', 1, 1, 0, 0, 0),
(35, 'Chilean Peso', 'CLP', '$', 1, 1, 0, 0, 0),
(36, 'Chinese Yuan', 'CNY', '¥', 1, 1, 0, 0, 0),
(37, 'Colombian Peso', 'COP', '$', 1, 1, 0, 0, 0),
(38, 'Comorian Franc', 'KMF', 'CF', 1, 1, 0, 0, 0),
(39, 'Congolese Franc', 'CDF', 'FC', 1, 1, 0, 0, 0),
(40, 'Costa Rican ColÃ³n', 'CRC', '₡', 1, 1, 0, 0, 0),
(41, 'Croatian Kuna', 'HRK', 'kn', 1, 1, 0, 0, 0),
(42, 'Cuban Convertible Peso', 'CUC', '$, CUC', 1, 1, 0, 0, 0),
(43, 'Czech Republic Koruna', 'CZK', 'Kč', 1, 1, 0, 0, 0),
(44, 'Danish Krone', 'DKK', 'Kr.', 1, 1, 0, 0, 0),
(45, 'Djiboutian Franc', 'DJF', 'Fdj', 1, 1, 0, 0, 0),
(46, 'Dominican Peso', 'DOP', '$', 1, 1, 0, 0, 0),
(47, 'East Caribbean Dollar', 'XCD', '$', 1, 1, 0, 0, 0),
(48, 'Egyptian Pound', 'EGP', 'ج.م', 1, 1, 0, 0, 0),
(49, 'Eritrean Nakfa', 'ERN', 'Nfk', 1, 1, 0, 0, 0),
(50, 'Estonian Kroon', 'EEK', 'kr', 1, 1, 0, 0, 0),
(51, 'Ethiopian Birr', 'ETB', 'Nkf', 1, 1, 0, 0, 0),
(52, 'Euro', 'EUR', '€', 1, 1, 0, 0, 0),
(53, 'Falkland Islands Pound', 'FKP', '£', 1, 1, 0, 0, 0),
(54, 'Fijian Dollar', 'FJD', 'FJ$', 1, 1, 0, 0, 0),
(55, 'Gambian Dalasi', 'GMD', 'D', 1, 1, 0, 0, 0),
(56, 'Georgian Lari', 'GEL', 'ლ', 1, 1, 0, 0, 0),
(57, 'German Mark', 'DEM', 'DM', 1, 1, 0, 0, 0),
(58, 'Ghanaian Cedi', 'GHS', 'GH₵', 1, 1, 0, 0, 0),
(59, 'Gibraltar Pound', 'GIP', '£', 1, 1, 0, 0, 0),
(60, 'Greek Drachma', 'GRD', '₯, Δρχ, Δρ', 1, 1, 0, 0, 0),
(61, 'Guatemalan Quetzal', 'GTQ', 'Q', 1, 1, 0, 0, 0),
(62, 'Guinean Franc', 'GNF', 'FG', 1, 1, 0, 0, 0),
(63, 'Guyanaese Dollar', 'GYD', '$', 1, 1, 0, 0, 0),
(64, 'Haitian Gourde', 'HTG', 'G', 1, 1, 0, 0, 0),
(65, 'Honduran Lempira', 'HNL', 'L', 1, 1, 0, 0, 0),
(66, 'Hong Kong Dollar', 'HKD', '$', 1, 1, 0, 0, 0),
(67, 'Hungarian Forint', 'HUF', 'Ft', 1, 1, 0, 0, 0),
(68, 'Icelandic KrÃ³na', 'ISK', 'kr', 1, 1, 0, 0, 0),
(69, 'Indian Rupee', 'INR', '₹', 1, 1, 1, 0, 0),
(70, 'Indonesian Rupiah', 'IDR', 'Rp', 1, 1, 0, 0, 0),
(71, 'Iranian Rial', 'IRR', '﷼', 1, 1, 0, 0, 0),
(72, 'Iraqi Dinar', 'IQD', 'د.ع', 1, 1, 0, 0, 0),
(73, 'Israeli New Sheqel', 'ILS', '₪', 1, 1, 0, 0, 0),
(74, 'Italian Lira', 'ITL', 'L,£', 1, 1, 0, 0, 0),
(75, 'Jamaican Dollar', 'JMD', 'J$', 1, 1, 0, 0, 0),
(76, 'Japanese Yen', 'JPY', '¥', 1, 1, 0, 0, 0),
(77, 'Jordanian Dinar', 'JOD', 'ا.د', 1, 1, 0, 0, 0),
(78, 'Kazakhstani Tenge', 'KZT', 'лв', 1, 1, 0, 0, 0),
(79, 'Kenyan Shilling', 'KES', 'KSh', 1, 1, 0, 0, 0),
(80, 'Kuwaiti Dinar', 'KWD', 'ك.د', 1, 1, 0, 0, 0),
(81, 'Kyrgystani Som', 'KGS', 'лв', 1, 1, 0, 0, 0),
(82, 'Laotian Kip', 'LAK', '₭', 1, 1, 0, 0, 0),
(83, 'Latvian Lats', 'LVL', 'Ls', 0, 0, 0, 0, 0),
(84, 'Lebanese Pound', 'LBP', '£', 1, 1, 0, 0, 0),
(85, 'Lesotho Loti', 'LSL', 'L', 1, 1, 0, 0, 0),
(86, 'Liberian Dollar', 'LRD', '$', 1, 1, 0, 0, 0),
(87, 'Libyan Dinar', 'LYD', 'د.ل', 1, 1, 0, 0, 0),
(88, 'Lithuanian Litas', 'LTL', 'Lt', 0, 0, 0, 0, 0),
(89, 'Macanese Pataca', 'MOP', '$', 1, 1, 0, 0, 0),
(90, 'Macedonian Denar', 'MKD', 'ден', 1, 1, 0, 0, 0),
(91, 'Malagasy Ariary', 'MGA', 'Ar', 1, 1, 0, 0, 0),
(92, 'Malawian Kwacha', 'MWK', 'MK', 1, 1, 0, 0, 0),
(93, 'Malaysian Ringgit', 'MYR', 'RM', 1, 1, 0, 0, 0),
(94, 'Maldivian Rufiyaa', 'MVR', 'Rf', 1, 1, 0, 0, 0),
(95, 'Mauritanian Ouguiya', 'MRO', 'MRU', 1, 1, 0, 0, 0),
(96, 'Mauritian Rupee', 'MUR', '₨', 1, 1, 0, 0, 0),
(97, 'Mexican Peso', 'MXN', '$', 1, 1, 0, 0, 0),
(98, 'Moldovan Leu', 'MDL', 'L', 1, 1, 0, 0, 0),
(99, 'Mongolian Tugrik', 'MNT', '₮', 1, 1, 0, 0, 0),
(100, 'Moroccan Dirham', 'MAD', 'MAD', 1, 1, 0, 0, 0),
(101, 'Mozambican Metical', 'MZM', 'MT', 1, 1, 0, 0, 0),
(102, 'Myanmar Kyat', 'MMK', 'K', 1, 1, 0, 0, 0),
(103, 'Namibian Dollar', 'NAD', '$', 1, 1, 0, 0, 0),
(104, 'Nepalese Rupee', 'NPR', '₨', 1, 1, 0, 0, 0),
(105, 'Netherlands Antillean Guilder', 'ANG', 'ƒ', 1, 1, 0, 0, 0),
(106, 'New Taiwan Dollar', 'TWD', '$', 1, 1, 0, 0, 0),
(107, 'New Zealand Dollar', 'NZD', '$', 1, 1, 0, 0, 0),
(108, 'Nicaraguan CÃ³rdoba', 'NIO', 'C$', 1, 1, 0, 0, 0),
(109, 'Nigerian Naira', 'NGN', '₦', 1, 1, 0, 0, 1),
(110, 'North Korean Won', 'KPW', '₩', 0, 0, 0, 0, 0),
(111, 'Norwegian Krone', 'NOK', 'kr', 1, 1, 0, 0, 0),
(112, 'Omani Rial', 'OMR', '.ع.ر', 0, 0, 0, 0, 0),
(113, 'Pakistani Rupee', 'PKR', '₨', 1, 1, 0, 0, 0),
(114, 'Panamanian Balboa', 'PAB', 'B/.', 1, 1, 0, 0, 0),
(115, 'Papua New Guinean Kina', 'PGK', 'K', 1, 1, 0, 0, 0),
(116, 'Paraguayan Guarani', 'PYG', '₲', 1, 1, 0, 0, 0),
(117, 'Peruvian Nuevo Sol', 'PEN', 'S/.', 1, 1, 0, 0, 0),
(118, 'Philippine Peso', 'PHP', '₱', 1, 1, 0, 0, 0),
(119, 'Polish Zloty', 'PLN', 'zł', 1, 1, 0, 0, 0),
(120, 'Qatari Rial', 'QAR', 'ق.ر', 1, 1, 0, 0, 0),
(121, 'Romanian Leu', 'RON', 'lei', 1, 1, 0, 0, 0),
(122, 'Russian Ruble', 'RUB', '₽', 1, 1, 0, 0, 0),
(123, 'Rwandan Franc', 'RWF', 'FRw', 1, 1, 0, 0, 0),
(124, 'Salvadoran ColÃ³n', 'SVC', '₡', 0, 0, 0, 0, 0),
(125, 'Samoan Tala', 'WST', 'SAT', 1, 1, 0, 0, 0),
(126, 'Saudi Riyal', 'SAR', '﷼', 1, 1, 0, 0, 0),
(127, 'Serbian Dinar', 'RSD', 'din', 1, 1, 0, 0, 0),
(128, 'Seychellois Rupee', 'SCR', 'SRe', 1, 1, 0, 0, 0),
(129, 'Sierra Leonean Leone', 'SLL', 'Le', 1, 1, 0, 0, 0),
(130, 'Singapore Dollar', 'SGD', '$', 1, 1, 0, 0, 0),
(131, 'Slovak Koruna', 'SKK', 'Sk', 1, 1, 0, 0, 0),
(132, 'Solomon Islands Dollar', 'SBD', 'Si$', 1, 1, 0, 0, 0),
(133, 'Somali Shilling', 'SOS', 'Sh.so.', 1, 1, 0, 0, 0),
(134, 'South African Rand', 'ZAR', 'R', 1, 1, 0, 0, 0),
(135, 'South Korean Won', 'KRW', '₩', 1, 1, 0, 0, 0),
(136, 'Special Drawing Rights', 'XDR', 'SDR', 1, 1, 0, 0, 0),
(137, 'Sri Lankan Rupee', 'LKR', 'Rs', 1, 1, 0, 0, 0),
(138, 'St. Helena Pound', 'SHP', '£', 1, 1, 0, 0, 0),
(139, 'Sudanese Pound', 'SDG', '.س.ج', 1, 1, 0, 0, 0),
(140, 'Surinamese Dollar', 'SRD', '$', 1, 1, 0, 0, 0),
(141, 'Swazi Lilangeni', 'SZL', 'E', 1, 1, 0, 0, 0),
(142, 'Swedish Krona', 'SEK', 'kr', 1, 1, 0, 0, 0),
(143, 'Swiss Franc', 'CHF', 'CHf', 1, 1, 0, 0, 0),
(144, 'Syrian Pound', 'SYP', 'LS', 0, 0, 0, 0, 0),
(145, 'São Tomé and Príncipe Dobra', 'STD', 'Db', 1, 1, 0, 0, 0),
(146, 'Tajikistani Somoni', 'TJS', 'SM', 1, 1, 0, 0, 0),
(147, 'Tanzanian Shilling', 'TZS', 'TSh', 1, 1, 0, 0, 0),
(148, 'Thai Baht', 'THB', '฿', 1, 1, 0, 0, 0),
(149, 'Tongan pa\'anga', 'TOP', '$', 1, 1, 0, 0, 0),
(150, 'Trinidad & Tobago Dollar', 'TTD', '$', 1, 1, 0, 0, 0),
(151, 'Tunisian Dinar', 'TND', 'ت.د', 1, 1, 0, 0, 0),
(152, 'Turkish Lira', 'TRY', '₺', 1, 1, 0, 1, 0),
(153, 'Turkmenistani Manat', 'TMT', 'T', 1, 1, 0, 0, 0),
(154, 'Ugandan Shilling', 'UGX', 'USh', 1, 1, 0, 0, 0),
(155, 'Ukrainian Hryvnia', 'UAH', '₴', 1, 1, 0, 0, 0),
(156, 'United Arab Emirates Dirham', 'AED', 'إ.د', 1, 1, 0, 0, 0),
(157, 'Uruguayan Peso', 'UYU', '$', 1, 1, 0, 0, 0),
(158, 'Afghan Afghani', 'AFA', '؋', 1, 1, 0, 0, 0),
(159, 'Uzbekistan Som', 'UZS', 'лв', 1, 1, 0, 0, 0),
(160, 'Vanuatu Vatu', 'VUV', 'VT', 1, 1, 0, 0, 0),
(161, 'Venezuelan BolÃvar', 'VEF', 'Bs', 0, 0, 0, 0, 0),
(162, 'Vietnamese Dong', 'VND', '₫', 1, 1, 0, 0, 0),
(163, 'Yemeni Rial', 'YER', '﷼', 1, 1, 0, 0, 0),
(164, 'Zambian Kwacha', 'ZMK', 'ZK', 1, 1, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `device_ips`
--

CREATE TABLE `device_ips` (
  `id` int(20) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `ip_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `enrollments`
--

CREATE TABLE `enrollments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `course_id` bigint(20) UNSIGNED DEFAULT NULL,
  `enrollment_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entry_date` int(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `expiry_date` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `forums`
--

CREATE TABLE `forums` (
  `id` int(255) NOT NULL,
  `user_id` int(255) DEFAULT NULL,
  `course_id` int(255) DEFAULT NULL,
  `parent_id` int(255) NOT NULL DEFAULT '0',
  `title` varchar(255) DEFAULT NULL,
  `description` longtext,
  `likes` longtext,
  `dislikes` longtext,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `frontend_settings`
--

CREATE TABLE `frontend_settings` (
  `id` int(11) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` longtext COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `frontend_settings`
--

INSERT INTO `frontend_settings` (`id`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1, 'banner_title', 'Start learning from the world’s pro Instructors', '2023-10-31 11:08:12', '2024-05-13 05:51:22'),
(2, 'banner_sub_title', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum.', '2023-10-31 11:08:12', '2024-05-13 05:51:22'),
(4, 'about_us', '<div>Limitless learning at your fingertips</div><div><br></div><div>Limitless learning at your fingertipsAdvertising a busines online includes assembling the they awesome site. Having the most well-planned on to the our SEO services keep you on the top a business Having the moston to the online.</div><div><br></div><div><br></div><div><br></div><div>Advertising a busines online includes assembling the they awesome site.</div><div><br></div><div><br></div><div>Range including technical skills</div><div>Range including technical skills</div><div>Range including technical skills</div><div><br></div>', '2023-10-31 11:08:12', '2024-05-13 05:51:22'),
(10, 'terms_and_condition', '<h2>Terms and Condition</h2>', '2023-10-31 11:08:12', '2024-05-13 05:51:22'),
(11, 'privacy_policy', '<p></p><p></p><h2><span xss=\"removed\">Privacy Policy</span></h2>', '2023-10-31 11:08:12', '2024-05-13 05:51:22'),
(13, 'theme', 'default', '2023-10-31 11:08:12', '2023-10-31 11:08:12'),
(14, 'cookie_note', 'This website uses cookies to personalize content and analyse traffic in order to offer you a better experience.', '2023-10-31 11:08:12', '2024-05-13 05:51:22'),
(15, 'cookie_status', 'active', '2023-10-31 11:08:12', '2024-05-13 05:51:22'),
(16, 'cookie_policy', '<h2 class=\"\">Cookie policy</h2><ol><li>Cookies are small text files that can be used by websites to make a user\'s experience more efficient.</li><li>The law states that we can store cookies on your device if they are strictly necessary for the operation of this site. For all other types of cookies we need your permission.</li><li>This site uses different types of cookies. Some cookies are placed by third party services that appear on our pages.</li></ol>', '2023-10-31 11:08:12', '2024-05-13 05:51:22'),
(17, 'banner_image', 'assets/upload/banner_image/banner-image-1717045923.png', '2023-10-31 11:08:12', '2024-05-29 23:12:03'),
(18, 'light_logo', 'assets/upload/light_logo/light-logo-1716985414.png', '2023-10-31 11:08:12', '2024-05-29 06:23:34'),
(19, 'dark_logo', 'assets/upload/dark_logo/dark-logo-1716985438.png', '2023-10-31 11:08:12', '2024-05-29 06:23:58'),
(20, 'small_logo', 'assets/upload/small_logo/small-logo-1712661659.jpg', '2023-10-31 11:08:12', '2024-04-09 05:20:59'),
(21, 'favicon', 'assets/upload/favicon/favicon-1716985458.png', '2023-10-31 11:08:12', '2024-05-29 06:24:18'),
(22, 'recaptcha_status', '0', '2023-10-31 11:08:12', '2023-11-01 23:27:24'),
(23, 'recaptcha_secretkey', 'Valid-secret-key', '2023-10-31 11:08:12', '2023-11-01 23:27:24'),
(24, 'recaptcha_sitekey', 'Valid-site-key', '2023-10-31 11:08:12', '2023-11-01 23:27:24'),
(25, 'refund_policy', '<h2><span xss=\"removed\">Refund Policy</span></h2>', '2023-10-31 11:08:12', '2024-05-13 05:51:22'),
(26, 'facebook', 'https://facebook.com', '2023-10-31 11:08:12', '2024-05-13 05:51:22'),
(27, 'twitter', 'https://twitter.com', '2023-10-31 11:08:12', '2024-05-13 05:51:22'),
(28, 'linkedin', 'https://linkedin.com', '2023-10-31 11:08:12', '2024-05-13 05:51:22'),
(31, 'blog_page_title', 'Where possibilities begin', '2023-10-31 11:08:12', '2023-10-31 11:08:12'),
(32, 'blog_page_subtitle', 'We’re a leading marketplace platform for learning and teaching online. Explore some of our most popular content and learn something new.', '2023-10-31 11:08:12', '2023-10-31 11:08:12'),
(33, 'blog_page_banner', 'blog-page.png', '2023-10-31 11:08:12', '2023-10-31 11:08:12'),
(34, 'instructors_blog_permission', '1', '2023-10-31 11:08:12', '2023-12-07 00:28:58'),
(35, 'blog_visibility_on_the_home_page', '1', '2023-10-31 11:08:12', '2023-12-07 00:28:58'),
(37, 'website_faqs', '[{\"question\":\"How to create an account?\",\"answer\":\"Interactively procrastinate high-payoff content without backward-compatible data. Quickly to cultivate optimal processes and tactical architectures. For The Completely iterate covalent strategic.\"},{\"question\":\"Do you provide any support for this kit?\",\"answer\":\"Interactively procrastinate high-payoff content without backward-compatible data. Quickly to cultivate optimal processes and tactical architectures. For The Completely iterate covalent strategic.\"},{\"question\":\"How to create an account?\",\"answer\":\"Interactively procrastinate high-payoff content without backward-compatible data. Quickly to cultivate optimal processes and tactical architectures. For The Completely iterate covalent strategic.\"},{\"question\":\"How long do you provide support?\",\"answer\":\"Interactively procrastinate high-payoff content without backward-compatible data. Quickly to cultivate optimal processes and tactical architectures. For The Completely iterate covalent strategic.\"}]', '2023-10-31 11:08:12', '2023-12-03 23:40:04'),
(38, 'motivational_speech', '{\"0\":{\"title\":\"Jenny Murtagh\",\"designation\":\"Graphic Design\",\"description\":\"Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even for slightly believable randomised words.\",\"image\":\"I6zvV1Mr30YUhLfJgwje.png\"},\"1\":{\"title\":\"Jenny Murtagh\",\"designation\":\"Graphic Design\",\"description\":\"Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even for slightly believable randomised words.\",\"image\":\"ZLfkhGame7sYQvqKxD0J.png\"},\"3\":{\"title\":\"Jenny Murtagh\",\"designation\":\"Graphic Design\",\"description\":\"Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even for slightly believable randomised words.\",\"image\":\"xBYkXnfvmPiU3j0CzME1.png\"}}', '2023-10-31 11:08:12', '2023-11-12 23:46:29'),
(39, 'home_page', NULL, '2023-10-31 11:08:12', '2024-05-29 23:14:06'),
(40, 'contact_info', '{\"email\":\"creativeitem@example.com\",\"phone\":\"67564345676\",\"address\":\"629 12th St, Modesto\",\"office_hours\":\"8\",\"location\":\"40.689880, -74.045203\"}', '2023-10-31 11:08:12', '2024-05-28 05:22:21'),
(41, 'promo_video_provider', 'youtube', '2023-10-31 11:08:12', '2024-05-13 05:51:22'),
(42, 'promo_video_link', 'https://youtu.be/4QCaXTOwigw?si=NsFeBQhWNZC859-l', '2023-10-31 11:08:12', '2024-05-13 05:51:22'),
(43, 'mobile_app_link', '', '2023-10-31 11:08:12', '2023-12-07 00:28:58');

-- --------------------------------------------------------

--
-- Table structure for table `home_page_settings`
--

CREATE TABLE `home_page_settings` (
  `id` int(11) NOT NULL,
  `home_page_id` int(11) DEFAULT NULL,
  `key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` longtext COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `home_page_settings`
--

INSERT INTO `home_page_settings` (`id`, `home_page_id`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1, 14, 'cooking', '{\"title\":\"Become An Instructor\",\"description\":\"Training programs can bring you a super exciting experience of learning through online! You never face any negative experience while enjoying your classes.\\r\\n\\r\\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate ad litora torquent Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate ad litora torquent per conubi himenaeos Awesome site Lorem Ipsum has been the industry\'s standard dummy text ever since the unknown printer took a galley of type and scrambled.\\r\\n\\r\\nConsectetur adipiscing elit. Nunc vulputate ad litora torquent per conubi himenaeos Awesome site Lorem Ipsum has been the industry\'s standard dummy text ever since.\",\"video_url\":\"https:\\\\\\/\\\\\\/www.youtube.com\\\\\\/watch?v=i-rv4VQiBko\",\"image\":\"instructor_image.jpg\"}', '2024-05-15 09:43:54', '2024-05-18 05:41:24'),
(3, 15, 'university', '{\"image\":\"6645d6bfb089f.webp\",\"faq_image\":\"6645d6dde24a8.webp\"}', '2024-05-16 02:31:00', '2024-05-20 00:49:13'),
(4, 17, 'development', '{\"title\":\"Leading the Way in Software Development\",\"description\":\"Far far away, behind the word mountains, far from the away countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.\\r\\nTraining programs can bring you a super exciting experience of learning through online! You never face any negative experience while enjoying your classes. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate ad litora torquent\",\"video_url\":null,\"image\":\"664896388fa23.soft-dev-banner.webp\"}', '2024-05-18 05:40:13', '2024-05-18 08:08:06'),
(5, 13, 'kindergarden', '{\"title\":\"Creating A Community Of Life Long Learners\",\"description\":\"Training programs can bring you a super exciting experience of learning through online! You never face any negative experience while enjoying your classes.\\r\\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate ad litora torquent\\r\\nTraining programs can bring you a super exciting experience of learning through online! You never face any negative experience while enjoying your classes. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate ad litora torquent\",\"video_url\":null,\"image\":\"6648b505c1c03.community-banner.webp\"}', '2024-05-18 08:02:45', '2024-05-18 08:07:59'),
(6, 18, 'marketplace', '{\"instructor\":{\"title\":\"Become an instructor\",\"description\":\"Training programs can bring you a super exciting experience of learning through online! You never face any negative experience while enjoying your classes.\\r\\n\\r\\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate ad litora torquent Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate ad litora torquent per conubi himenaeos Awesome site Lorem Ipsum has been the industry\'s standard dummy text ever since the unknown printer took a galley of type and scrambled.\\r\\n\\r\\nConsectetur adipiscing elit. Nunc vulputate ad litora torquent per conubi himenaeos Awesome site Lorem Ipsum has been the industry\'s standard dummy text ever sinces.\",\"video_url\":\"https:\\/\\/www.youtube.com\\/watch?v=i-rv4VQiBko\",\"image\":\"6649b445b3b52.video-area-banner1.webp\"},\"slider\":[{\"banner_title\":\"LEARN FROM TODAY\",\"banner_description\":\"Academy Starter is a community for creative people\"},{\"banner_title\":\"LEARN FROM TODAY\",\"banner_description\":\"Academy Starter is a community for creative people\"},{\"banner_title\":\"LEARN FROM TODAY\",\"banner_description\":\"Academy Starter is a community for creative people\"},{\"banner_title\":\"LEARN FROM TODAY\",\"banner_description\":\"Academy Starter is a community for creative people\"}]}', '2024-05-18 22:55:44', '2024-05-20 01:22:25'),
(7, 19, 'meditation', '{\"big_image\":\"664b020ed2bbb.png\",\"meditation\":[{\"banner_title\":\"Balance Body & Mind\",\"image\":\"664b07fa650dd.yoga-benefit-1.svg\",\"banner_description\":\"It is a long established fact that a reader will be distracted by the readable content.\"},{\"banner_title\":\"Balance Body & Minds\",\"image\":\"664b08157c7ed.yoga-benefit-2.svg\",\"banner_description\":\"It is a long established fact that a reader will be distracted by the readable content.\"},{\"banner_title\":\"Balance Body & Mind\",\"image\":\"664b08157cab8.yoga-benefit-3.svg\",\"banner_description\":\"It is a long established fact that a reader will be distracted by the readable content.\"},{\"banner_title\":\"Balance Body & Mind\",\"image\":\"664b08157d2be.yoga-benefit-4.svg\",\"banner_description\":\"It is a long established fact that a reader will be distracted by the readable content.\"},{\"banner_title\":\"Balance Body & Mind\",\"image\":\"664b08263ba18.yoga-benefit-5.svg\",\"banner_description\":\"It is a long established fact that a reader will be distracted by the readable content.\"},{\"banner_title\":\"Balance Body & Minddf\",\"image\":\"664b08263bcca.yoga-benefit-6.svg\",\"banner_description\":\"It is a long established fact that a reader will be distracted by the readable content.\"}]}', '2024-05-19 23:54:56', '2024-05-20 02:21:58');

-- --------------------------------------------------------

--
-- Table structure for table `instructor_reviews`
--

CREATE TABLE `instructor_reviews` (
  `id` int(255) NOT NULL,
  `user_id` int(255) DEFAULT NULL,
  `instructor_id` int(255) DEFAULT NULL,
  `rating` varchar(244) DEFAULT NULL,
  `review` longtext,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `direction` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `name`, `direction`, `created_at`, `updated_at`) VALUES
(3, 'English', 'ltr', '2024-04-08 10:42:26', '2024-04-09 01:12:02');

-- --------------------------------------------------------

--
-- Table structure for table `language_phrases`
--

CREATE TABLE `language_phrases` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED DEFAULT NULL,
  `phrase` text COLLATE utf8mb4_unicode_ci,
  `translated` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `language_phrases`
--

INSERT INTO `language_phrases` (`id`, `language_id`, `phrase`, `translated`, `created_at`, `updated_at`) VALUES
(1, 3, 'English', 'English', '2024-08-28 11:39:51', '2024-08-28 11:39:51');

-- --------------------------------------------------------

--
-- Table structure for table `lessons`
--

CREATE TABLE `lessons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `course_id` bigint(20) UNSIGNED DEFAULT NULL,
  `section_id` bigint(20) UNSIGNED DEFAULT NULL,
  `lesson_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `duration` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lesson_src` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attachment` longtext COLLATE utf8mb4_unicode_ci,
  `attachment_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video_type` text COLLATE utf8mb4_unicode_ci,
  `thumbnail` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_free` int(11) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `summary` longtext COLLATE utf8mb4_unicode_ci,
  `status` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `like_dislike_reviews`
--

CREATE TABLE `like_dislike_reviews` (
  `id` int(255) NOT NULL,
  `review_id` int(255) DEFAULT NULL,
  `user_id` int(255) DEFAULT NULL,
  `liked` int(255) DEFAULT '0',
  `disliked` int(255) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `live_classes`
--

CREATE TABLE `live_classes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `course_id` bigint(20) UNSIGNED DEFAULT NULL,
  `class_topic` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `class_date_and_time` timestamp NULL DEFAULT NULL,
  `additional_info` longtext COLLATE utf8mb4_unicode_ci,
  `note` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `media_files`
--

CREATE TABLE `media_files` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `post_id` int(11) DEFAULT NULL,
  `story_id` int(11) DEFAULT NULL,
  `album_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `page_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `chat_id` int(11) DEFAULT NULL,
  `file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `privacy` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(255) NOT NULL,
  `thread_id` int(255) DEFAULT NULL,
  `sender_id` int(255) DEFAULT NULL,
  `receiver_id` int(255) DEFAULT NULL,
  `message` longtext,
  `read` int(11) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `message_threads`
--

CREATE TABLE `message_threads` (
  `id` int(255) NOT NULL,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact_one` int(255) DEFAULT NULL,
  `contact_two` int(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `newsletters`
--

CREATE TABLE `newsletters` (
  `id` int(11) NOT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `newsletter_subscribers`
--

CREATE TABLE `newsletter_subscribers` (
  `id` int(11) NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notification_settings`
--

CREATE TABLE `notification_settings` (
  `id` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_editable` int(11) DEFAULT NULL,
  `addon_identifier` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_types` varchar(400) COLLATE utf8_unicode_ci DEFAULT NULL,
  `system_notification` varchar(400) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_notification` varchar(400) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `template` longtext COLLATE utf8_unicode_ci,
  `setting_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `setting_sub_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_updated` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `notification_settings`
--

INSERT INTO `notification_settings` (`id`, `type`, `is_editable`, `addon_identifier`, `user_types`, `system_notification`, `email_notification`, `subject`, `template`, `setting_title`, `setting_sub_title`, `date_updated`, `created_at`, `updated_at`) VALUES
(1, 'edit_email_template', 1, NULL, '[\"admin\",\"user\"]', '{\"admin\":\"1\",\"user\":\"1\"}', '{\"admin\":\"1\",\"user\":\"0\"}', '{\"admin\":\"New user registered\",\"user\":\"Registered successfully\"}', '{\"admin\":\"New user registered [user_name] \\r\\n<br>User email: <b>[user_email]<\\/b>\",\"user\":\"You have successfully registered with us at [system_name].\"}', 'New user registration', 'Get notified when a new user signs up', '1693215071', '2023-11-02 11:13:07', '2023-12-05 01:23:15'),
(2, 'email_verification', 0, NULL, '[\"user\"]', '{\"user\":\"0\"}', '{\"user\":\"1\"}', '{\"user\":\"Email verification code\"}', '{\"user\":\"You have received a email verification code. Your verification code is [email_verification_code]\"}', 'Email verification', 'It is permanently enabled for student email verification.', '1684135777', '2023-11-02 11:13:07', '2023-11-02 11:13:07'),
(3, 'forget_password_mail', 0, NULL, '[\"user\"]', '{\"user\":\"0\"}', '{\"user\":\"1\"}', '{\"user\":\"Forgot password verification code\"}', '{\"user\":\"You have received a email verification code. Your verification code is [system_name][verification_link][minutes]\"}', 'Forgot password mail', 'It is permanently enabled for student email verification.', '1684145383', '2023-11-02 11:13:07', '2023-11-02 11:13:07'),
(4, 'new_device_login_confirmation', 0, NULL, '[\"user\"]', '{\"user\":\"0\"}', '{\"user\":\"1\"}', '{\"user\":\"Please confirm your login\"}', '{\"user\":\"Have you tried logging in with a different device? Confirm using the verification code. Your verification code is [verification_code]. Remember that you will lose access to your previous device after logging in to the new device <b>[user_agent]<\\/b>.<br> Use the verification code within [minutes] minutes\"}', 'Account security alert', 'Send verification code for login from a new device', '1684145383', '2023-11-02 11:13:07', '2023-11-02 11:13:07'),
(6, 'course_purchase', 1, NULL, '[\"admin\",\"student\",\"instructor\"]', '{\"admin\":\"1\",\"student\":\"1\",\"instructor\":\"1\"}', '{\"admin\":\"0\",\"student\":\"0\",\"instructor\":\"0\"}', '{\"admin\":\"A new course has been sold\",\"instructor\":\"A new course has been sold\",\"student\":\"You have purchased a new course\"}', '{\"admin\":\"<p>Course title: [course_title]<\\/p><p>Student: [student_name]\\r\\n<\\/p><p>Paid amount: [paid_amount]<\\/p><p>Instructor: [instructor_name]<\\/p>\",\"instructor\":\"Course title: [course_title]\\r\\nStudent: [student_name]\\r\\nPaid amount: [paid_amount]\",\"student\":\"Course title: [course_title]\\r\\nPaid amount: [paid_amount]\\r\\nInstructor: [instructor_name]\"}', 'Course purchase notification', 'Stay up-to-date on student course purchases.', '1684303456', '2023-11-02 11:13:07', '2023-11-02 11:13:07'),
(7, 'course_completion_mail', 1, NULL, '[\"student\",\"instructor\"]', '{\"student\":\"1\",\"instructor\":\"1\"}', '{\"student\":\"0\",\"instructor\":\"0\"}', '{\"instructor\":\"Course completion\",\"student\":\"You have completed a new course\"}', '{\"instructor\":\"Course completed [course_title]\\r\\nStudent: [student_name]\",\"student\":\"Course: [course_title]\\r\\nInstructor: [instructor_name]\"}', 'Course completion mail', 'Stay up to date on student course completion.', '1684303457', '2023-11-02 11:13:07', '2023-11-02 11:13:07'),
(8, 'certificate_eligibility', 1, 'certificate', '[\"student\",\"instructor\"]', '{\"student\":\"1\",\"instructor\":\"1\"}', '{\"student\":\"0\",\"instructor\":\"0\"}', '{\"instructor\":\"Certificate eligibility\",\"student\":\"certificate eligibility\"}', '{\"instructor\":\"Course: [course_title]\\r\\nStudent: [student_name]\\r\\nCertificate link: [certificate_link]\",\"student\":\"Course: [course_title]\\r\\nInstructor: [instructor_name]\\r\\nCertificate link: [certificate_link]\"}', 'Course eligibility notification', 'Stay up to date on course certificate eligibility.', '1684303460', '2023-11-02 11:13:07', '2023-11-02 11:13:07'),
(9, 'offline_payment_suspended_mail', 1, 'offline_payment', '[\"student\"]', '{\"student\":\"1\"}', '{\"student\":\"0\"}', '{\"student\":\"Your payment has been suspended\"}', '{\"student\":\"<p>Your offline payment has been <b style=\'color: red;\'>suspended</b> !</p><p>Please provide a valid document of your payment.</p>\"}', 'Offline payment suspended mail', 'If students provides fake information, notify them of the suspension', '1684303463', '2023-11-02 11:13:07', '2023-11-02 11:13:07'),
(10, 'bundle_purchase', 1, 'course_bundle', '[\"admin\",\"student\",\"instructor\"]', '{\"admin\":\"1\",\"student\":\"1\",\"instructor\":\"1\"}', '{\"admin\":\"0\",\"student\":\"0\",\"instructor\":\"0\"}', '{\"admin\":\"A new course bundle has been sold \",\"instructor\":\"A new course bundle has been sold \",\"student\":\"You have purchased a new course bundle test\"}', '{\"admin\":\"Course bundle: [bundle_title]\\r\\nStudent: [student_name]\\r\\nInstructor: [instructor_name] \",\"instructor\":\"Course bundle: [bundle_title]\\r\\nStudent: [student_name] \",\"student\":\"Course bundle: [bundle_title]\\r\\nInstructor: [instructor_name] \"}', 'Course bundle purchase notification', 'Stay up-to-date on student course bundle purchases.', '1684303467', '2023-11-02 11:13:07', '2023-11-02 11:13:07'),
(13, 'add_new_user_as_affiliator', 0, 'affiliate_course', '[\"affiliator\"]', '{\"affiliator\":\"0\"}', '{\"affiliator\":\"1\"}', '{\"affiliator\":\"Congratulation ! You are assigned as an affiliator\"}', '{\"affiliator\":\"You are assigned as a website Affiliator.\\r\\nWebsite: [website_link]\\r\\n<br>\\r\\nPassword: [password]\"}', 'New user added as affiliator', 'Send account information to the new user', '1684135777', '2023-11-02 11:13:07', '2023-11-02 11:13:07'),
(14, 'affiliator_approval_notification', 1, 'affiliate_course', '[\"affiliator\"]', '{\"affiliator\":\"1\"}', '{\"affiliator\":\"0\"}', '{\"affiliator\":\"Congratulations! Your affiliate request has been approved\"}', '{\"affiliator\":\"Congratulations! Your affiliate request has been approved\"}', 'Affiliate approval notification', 'Send affiliate approval mail to the user account', '1684303472', '2023-11-02 11:13:07', '2023-11-02 11:13:07'),
(15, 'affiliator_request_cancellation', 1, 'affiliate_course', '[\"affiliator\"]', '{\"affiliator\":\"1\"}', '{\"affiliator\":\"0\"}', '{\"affiliator\":\"Sorry ! Your request has been currently refused\"}', '{\"affiliator\":\"Sorry ! Your request has been currently refused.\"}', 'Affiliator request cancellation', 'Send mail, when you cancel the affiliation request', '1684303473', '2023-11-02 11:13:07', '2023-11-02 11:13:07'),
(16, 'affiliation_amount_withdrawal_request', 1, 'affiliate_course', '[\"admin\",\"affiliator\"]', '{\"admin\":\"1\",\"affiliator\":\"1\"}', '{\"admin\":\"0\",\"affiliator\":\"0\"}', '{\"admin\":\"New money withdrawal request\",\"affiliator\":\"New money withdrawal request\"}', '{\"admin\":\"New money withdrawal request by [\'user_name] [amount]\",\"affiliator\":\"Your Withdrawal request of [amount] has been sent to authority\"}', 'Affiliation money withdrawal request', 'Send mail, when the users request the withdrawal of money', '1684303476', '2023-11-02 11:13:07', '2023-11-02 11:13:07'),
(17, 'approval_affiliation_amount_withdrawal_request', 1, 'affiliate_course', '[\"affiliator\"]', '{\"affiliator\":\"1\"}', '{\"affiliator\":\"0\"}', '{\"affiliator\":\"Congartulation ! Your withdrawal request has been approved\"}', '{\"affiliator\":\"Congartulation ! Your payment request has been approved.\"}', 'Approval of withdrawal request of affiliation', 'Send mail, when you approved the affiliation withdrawal request', '1684303480', '2023-11-02 11:13:07', '2023-11-02 11:13:07'),
(18, 'course_gift', 1, NULL, '[\"payer\",\"receiver\"]', '{\"payer\":\"1\",\"receiver\":\"1\"}', '{\"payer\":\"1\",\"receiver\":\"1\"}', '{\"payer\":\"You have gift a course\",\"receiver\":\"You have received a course gift\"}', '{\"payer\":\"You have gift a course to [user_name] [course_title][instructor]\",\"receiver\":\"You have received a course gift by [payer][course_title][instructor]\"}', 'Course gift notification', 'Notify users after course gift', '1691818623', '2023-11-02 11:13:07', '2023-11-06 05:02:28');

-- --------------------------------------------------------

--
-- Table structure for table `offline_payments`
--

CREATE TABLE `offline_payments` (
  `id` int(255) NOT NULL,
  `user_id` int(255) DEFAULT NULL,
  `item_type` varchar(255) DEFAULT NULL,
  `items` varchar(255) DEFAULT NULL,
  `tax` double DEFAULT NULL,
  `total_amount` double DEFAULT NULL,
  `coupon` varchar(255) DEFAULT NULL,
  `phone_no` varchar(255) DEFAULT NULL,
  `bank_no` varchar(255) DEFAULT NULL,
  `doc` varchar(255) DEFAULT NULL,
  `status` int(255) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_gateways`
--

CREATE TABLE `payment_gateways` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `identifier` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `keys` text COLLATE utf8mb4_unicode_ci,
  `status` int(11) DEFAULT NULL,
  `test_mode` int(11) DEFAULT NULL,
  `is_addon` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_gateways`
--

INSERT INTO `payment_gateways` (`id`, `identifier`, `currency`, `title`, `model_name`, `description`, `keys`, `status`, `test_mode`, `is_addon`, `created_at`, `updated_at`) VALUES
(1, 'paypal', 'USD', 'Paypal', 'Paypal', '', '{\"sandbox_client_id\":\"AfGaziKslex-scLAyYdDYXNFaz2aL5qGau-SbDgE_D2E80D3AFauLagP8e0kCq9au7W4IasmFbirUUYc\",\"sandbox_secret_key\":\"EMa5pCTuOpmHkhHaCGibGhVUcKg0yt5-C3CzJw-OWJCzaXXzTlyD17SICob_BkfM_0Nlk7TWnN42cbGz\",\"production_client_id\":\"1234\",\"production_secret_key\":\"12345\"}', 1, 1, 0, '2023-06-24 03:51:49', '2023-11-28 01:44:37'),
(2, 'stripe', 'USD', 'Stripe', 'StripePay', '', '{\"public_key\":\"pk_test_c6VvBEbwHFdulFZ62q1IQrar\",\"secret_key\":\"sk_test_9IMkiM6Ykxr1LCe2dJ3PgaxS\",\"public_live_key\":\"pk_live_xxxxxxxxxxxxxxxxxxxxxxxx\",\"secret_live_key\":\"sk_live_xxxxxxxxxxxxxxxxxxxxxxxx\"}', 1, 1, 0, '2023-06-24 03:51:49', '2023-10-30 01:33:32'),
(3, 'razorpay', 'USD', 'Razorpay', 'Razorpay', '', '{\"public_key\":\"rzp_test_J60bqBOi1z1aF5\",\"secret_key\":\"uk935K7p4j96UCJgHK8kAU4q\"}', 1, 1, 0, '2023-06-24 03:51:49', '2023-10-30 01:37:12'),
(4, 'flutterwave', 'USD', 'Flutterwave', 'Flutterwave', '', '{\"public_key\":\"FLWPUBK_TEST-48dfbeb50344ecd8bc075b4ffe9ba266-X\",\"secret_key\":\"FLWSECK_TEST-1691582e23bd6ee4fb04213ec0b862dd-X\"}', 1, 1, 0, '2023-06-24 03:51:49', '2023-10-30 01:39:58'),
(5, 'paytm', 'USD', 'Paytm', 'Paytm', '', '{\"public_key\":\"ApLWOX88722132489587\",\"secret_key\":\"#iFa7&W_C50VL@aT\"}', 1, 1, 0, '2023-06-24 03:51:49', '2023-10-30 01:42:32'),
(6, 'offline', 'USD', 'Offline Payment', 'Paytm', '', '{\"public_key\":\"ApLWOX88722132489587\",\"secret_key\":\"#iFa7&W_C50VL@aT\"}', 1, NULL, 0, '2023-06-24 03:51:49', '2023-10-30 01:42:32');

-- --------------------------------------------------------

--
-- Table structure for table `payment_histories`
--

CREATE TABLE `payment_histories` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `payment_type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `invoice` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_added` int(11) DEFAULT NULL,
  `last_modified` int(11) DEFAULT NULL,
  `admin_revenue` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `instructor_revenue` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tax` double DEFAULT NULL,
  `instructor_payment_status` int(11) DEFAULT '0',
  `transaction_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `session_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `coupon` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payouts`
--

CREATE TABLE `payouts` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `payment_type` varchar(255) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `status` int(11) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `permissions` longtext COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `player_settings`
--

CREATE TABLE `player_settings` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `player_settings`
--

INSERT INTO `player_settings` (`id`, `title`, `description`, `created_at`, `updated_at`) VALUES
(1, 'watermark_width', '100', '2024-08-27 11:25:27', '2024-08-27 11:25:27'),
(2, 'watermark_height', '24', '2024-08-27 11:25:27', '2024-08-27 11:25:27'),
(3, 'watermark_top', '10', '2024-08-27 11:25:27', '2024-08-27 11:25:27'),
(4, 'watermark_left', '10', '2024-08-27 11:25:27', '2024-08-27 11:25:27'),
(5, 'watermark_opacity', '50', '2024-08-27 11:25:27', '2024-08-27 11:25:27'),
(6, 'watermark_type', 'js', '2024-08-27 11:25:27', '2024-08-27 11:25:27'),
(7, 'watermark_logo', 'upload/watermark/watermark-1724757927.png', '2024-08-27 11:25:27', '2024-08-27 11:25:27');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` int(11) NOT NULL,
  `quiz_id` int(11) DEFAULT NULL,
  `title` longtext COLLATE utf8mb4_unicode_ci,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `answer` mediumtext COLLATE utf8mb4_unicode_ci,
  `options` longtext COLLATE utf8mb4_unicode_ci,
  `sort` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quizzes`
--

CREATE TABLE `quizzes` (
  `id` int(255) NOT NULL,
  `user_id` int(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `section_id` int(255) DEFAULT NULL,
  `duration` varchar(255) DEFAULT NULL,
  `total_mark` int(255) DEFAULT NULL,
  `pass_mark` int(255) DEFAULT NULL,
  `drip_rule` int(255) DEFAULT NULL,
  `summary` longtext,
  `attempts` longtext,
  `sort` int(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `quiz_submissions`
--

CREATE TABLE `quiz_submissions` (
  `id` int(11) NOT NULL,
  `quiz_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `correct_answer` longtext COLLATE utf8mb4_unicode_ci,
  `wrong_answer` longtext COLLATE utf8mb4_unicode_ci,
  `submits` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` int(255) UNSIGNED NOT NULL,
  `user_id` int(255) DEFAULT NULL,
  `course_id` int(255) DEFAULT NULL,
  `rating` int(255) DEFAULT NULL,
  `review_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `review` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `course_id` bigint(20) UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort` int(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `seo_fields`
--

CREATE TABLE `seo_fields` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `course_id` int(20) DEFAULT NULL,
  `blog_id` int(20) DEFAULT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_route` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_robot` text COLLATE utf8mb4_unicode_ci,
  `canonical_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `json_ld` longtext COLLATE utf8mb4_unicode_ci,
  `og_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `og_description` text COLLATE utf8mb4_unicode_ci,
  `og_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `seo_fields`
--

INSERT INTO `seo_fields` (`id`, `course_id`, `blog_id`, `route`, `name_route`, `meta_title`, `meta_keywords`, `meta_description`, `meta_robot`, `canonical_url`, `custom_url`, `json_ld`, `og_title`, `og_description`, `og_image`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL, 'Home', 'home', 'Home page', NULL, 'Home page for academy Seo', 'xxxxxx', 'https://academy.com', 'https://academy.com', '<script type=\"application/ld+json\"> {   \"@context\": \"http://schema.org\",   \"@type\": \"WebSite\",   \"name\": \"CodeCanyon\",   \"url\": \"https://codecanyon.net\" } </script>', 'ooooooooo', 'zzzzzzzzzz', 'OG-home.jpg', NULL, NULL),
(2, NULL, NULL, 'Compare', 'compare', 'Course compare', 'course, compare, difference', 'Course compare', 'xxxxxx', 'https:://academy.com/course-compare', 'https:://academy.com/course-compare', NULL, 'Course compare', 'Course compare', '2-customer-php-version.PNG', NULL, NULL),
(3, NULL, NULL, 'Privacy', 'privacy.policy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'OG-documantation.jpg', NULL, NULL),
(4, NULL, NULL, 'Refund', 'refund.policy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'OG-Blog.jpg', NULL, NULL),
(5, NULL, NULL, 'Terms- condition', 'terms.condition', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'OG-service.jpg', NULL, NULL),
(6, NULL, NULL, 'Faq', 'faq', 'Creative elements - ui subscription system', 'ui kits, website template, video template', 'Best and affordable ui kit subscription system', NULL, NULL, NULL, NULL, NULL, NULL, 'OG-elements home.jpg', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) UNSIGNED NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `type`, `description`, `created_at`, `updated_at`) VALUES
(1, 'language', 'english', '2023-10-29 05:36:40', '2024-08-27 05:16:34'),
(2, 'system_name', 'Academy LMS LARAVEL', '2023-10-29 05:36:40', '2024-08-27 05:16:34'),
(3, 'system_title', 'Academy Learning Club', '2023-10-29 05:36:40', '2024-08-27 05:16:34'),
(4, 'system_email', 'academy@example.com', '2023-10-29 05:36:40', '2024-08-27 05:16:34'),
(5, 'address', 'Sydney, Australia', '2023-10-29 05:36:40', '2024-08-27 05:16:34'),
(6, 'phone', '+143-52-9933631', '2023-10-29 05:36:40', '2024-08-27 05:16:34'),
(7, 'purchase_code', 'your-purchase-code', '2023-10-29 05:36:40', '2024-08-27 05:16:34'),
(8, 'paypal', '[{\"active\":\"1\",\"mode\":\"sandbox\",\"sandbox_client_id\":\"AfGaziKslex-scLAyYdDYXNFaz2aL5qGau-SbDgE_D2E80D3AFauLagP8e0kCq9au7W4IasmFbirUUYc\",\"sandbox_secret_key\":\"EMa5pCTuOpmHkhHaCGibGhVUcKg0yt5-C3CzJw-OWJCzaXXzTlyD17SICob_BkfM_0Nlk7TWnN42cbGz\",\"production_client_id\":\"1234\",\"production_secret_key\":\"12345\"}]', '2023-10-29 05:36:40', '2023-10-29 05:36:40'),
(9, 'stripe_keys', '[{\"active\":\"1\",\"testmode\":\"on\",\"public_key\":\"pk_test_CAC3cB1mhgkJqXtypYBTGb4f\",\"secret_key\":\"sk_test_iatnshcHhQVRXdygXw3L2Pp2\",\"public_live_key\":\"pk_live_xxxxxxxxxxxxxxxxxxxxxxxx\",\"secret_live_key\":\"sk_live_xxxxxxxxxxxxxxxxxxxxxxxx\"}]', '2023-10-29 05:36:40', '2023-10-29 05:36:40'),
(10, 'youtube_api_key', 'youtube-api-key', '2023-10-29 05:36:40', '2024-08-27 05:16:34'),
(11, 'vimeo_api_key', 'vimeo-api-key', '2023-10-29 05:36:40', '2024-08-27 05:16:34'),
(12, 'slogan', 'A course based video CMS', '2023-10-29 05:36:40', '2024-08-27 05:16:34'),
(13, 'text_align', NULL, '2023-10-29 05:36:40', '2023-10-29 05:36:40'),
(14, 'allow_instructor', '1', '2023-10-29 05:36:40', '2023-12-05 23:04:06'),
(15, 'instructor_revenue', '70', '2023-10-29 05:36:40', '2023-12-05 23:04:11'),
(16, 'system_currency', 'USD', '2023-10-29 05:36:40', '2024-04-08 00:03:24'),
(17, 'paypal_currency', 'USD', '2023-10-29 05:36:40', '2023-10-29 05:36:40'),
(18, 'stripe_currency', 'USD', '2023-10-29 05:36:40', '2023-10-29 05:36:40'),
(19, 'author', 'Creativeitem', '2023-10-29 05:36:40', '2024-08-27 05:16:34'),
(20, 'currency_position', 'right-space', '2023-10-29 05:36:40', '2024-04-08 00:03:24'),
(21, 'website_description', 'Talemy is your ideal education the WordPress theme for sharing and selling your knowledge online. Teach what you love. Talemy gives you the tools.', '2023-10-29 05:36:40', '2024-08-27 05:16:34'),
(22, 'website_keywords', 'LMS,Learning Management System,Creativeitem,Academy LMS', '2023-10-29 05:36:40', '2024-08-27 05:16:34'),
(23, 'footer_text', '2022 @ By Creativeitem', '2023-10-29 05:36:40', '2024-08-27 05:16:34'),
(24, 'footer_link', 'https://creativeitem.com/', '2023-10-29 05:36:40', '2024-08-27 05:16:34'),
(25, 'protocol', 'smtp', '2023-10-29 05:36:40', '2024-08-27 05:20:40'),
(26, 'smtp_host', 'smtp.gmail.com', '2023-10-29 05:36:40', '2024-08-27 05:20:40'),
(27, 'smtp_port', '587', '2023-10-29 05:36:40', '2024-08-27 05:20:40'),
(28, 'smtp_user', 'example@gmail.com', '2023-10-29 05:36:40', '2024-08-27 05:20:40'),
(29, 'smtp_pass', 'your-smtp-password', '2023-10-29 05:36:40', '2024-08-27 05:20:40'),
(30, 'version', '1.1', '2023-10-29 05:36:40', '2023-10-29 05:36:40'),
(31, 'student_email_verification', 'disable', '2023-10-29 05:36:40', '2023-12-05 00:54:45'),
(32, 'instructor_application_note', 'Fill all the fields carefully and share if you want to share any document with us it will help us to evaluate you as an instructor. dfdfs', '2023-10-29 05:36:40', '2023-12-05 23:04:06'),
(33, 'razorpay_keys', '[{\"active\":\"1\",\"key\":\"rzp_test_J60bqBOi1z1aF5\",\"secret_key\":\"uk935K7p4j96UCJgHK8kAU4q\",\"theme_color\":\"#c7a600\"}]', '2023-10-29 05:36:40', '2023-10-29 05:36:40'),
(34, 'razorpay_currency', 'USD', '2023-10-29 05:36:40', '2023-10-29 05:36:40'),
(35, 'fb_app_id', 'fb-app-id', '2023-10-29 05:36:40', '2023-10-29 05:36:40'),
(36, 'fb_app_secret', 'fb-app-secret', '2023-10-29 05:36:40', '2023-10-29 05:36:40'),
(37, 'fb_social_login', '0', '2023-10-29 05:36:40', '2023-10-29 05:36:40'),
(38, 'drip_content_settings', '{\"lesson_completion_role\":\"duration\",\"minimum_duration\":\"15:30:00\",\"minimum_percentage\":\"60\",\"locked_lesson_message\":\"<h3 xss=\\\"removed\\\" style=\\\"text-align: center; \\\"><span xss=\\\"removed\\\" style=\\\"\\\">Permission denied!<\\/span><\\/h3><p xss=\\\"removed\\\" style=\\\"text-align: center; \\\"><span xss=\\\"removed\\\">This course supports drip content, so you must complete the previous lessons.<\\/span><\\/p>\",\"files\":null}', '2023-10-29 05:36:40', '2023-10-29 05:26:38'),
(41, 'course_accessibility', 'publicly', '2023-10-29 05:36:40', '2023-12-05 00:54:45'),
(42, 'smtp_crypto', 'tls', '2023-10-29 05:36:40', '2024-08-27 05:20:40'),
(43, 'allowed_device_number_of_loging', '5', '2023-10-29 05:36:40', '2023-12-05 00:54:45'),
(47, 'academy_cloud_access_token', 'jdfghasdfasdfasdfasdfasdf', '2023-10-29 05:36:40', '2023-10-29 05:36:40'),
(48, 'course_selling_tax', '0', '2023-10-29 05:36:40', '2024-08-27 05:16:34'),
(49, 'ccavenue_keys', '[{\"active\":\"1\",\"ccavenue_merchant_id\":\"cmi_xxxxxx\",\"ccavenue_working_key\":\"cwk_xxxxxxxxxxxx\",\"ccavenue_access_code\":\"ccc_xxxxxxxxxxxxx\"}]', '2023-10-29 05:36:40', '2023-10-29 05:36:40'),
(50, 'ccavenue_currency', 'INR', '2023-10-29 05:36:40', '2023-10-29 05:36:40'),
(51, 'iyzico_keys', '[{\"active\":\"1\",\"testmode\":\"on\",\"iyzico_currency\":\"TRY\",\"api_test_key\":\"atk_xxxxxxxx\",\"secret_test_key\":\"stk_xxxxxxxx\",\"api_live_key\":\"alk_xxxxxxxx\",\"secret_live_key\":\"slk_xxxxxxxx\"}]', '2023-10-29 05:36:40', '2023-10-29 05:36:40'),
(52, 'iyzico_currency', 'TRY', '2023-10-29 05:36:40', '2023-10-29 05:36:40'),
(53, 'paystack_keys', '[{\"active\":\"1\",\"testmode\":\"on\",\"secret_test_key\":\"sk_test_c746060e693dd50c6f397dffc6c3b2f655217c94\",\"public_test_key\":\"pk_test_0816abbed3c339b8473ff22f970c7da1c78cbe1b\",\"secret_live_key\":\"sk_live_xxxxxxxxxxxxxxxxxxxxx\",\"public_live_key\":\"pk_live_xxxxxxxxxxxxxxxxxxxxx\"}]', '2023-10-29 05:36:40', '2023-10-29 05:36:40'),
(54, 'paystack_currency', 'NGN', '2023-10-29 05:36:40', '2023-10-29 05:36:40'),
(55, 'paytm_keys', '[{\"PAYTM_MERCHANT_KEY\":\"PAYTM_MERCHANT_KEY\",\"PAYTM_MERCHANT_MID\":\"PAYTM_MERCHANT_MID\",\"PAYTM_MERCHANT_WEBSITE\":\"DEFAULT\",\"INDUSTRY_TYPE_ID\":\"Retail\",\"CHANNEL_ID\":\"WEB\"}]', '2023-10-29 05:36:40', '2023-10-29 05:36:40'),
(57, 'google_analytics_id', NULL, '2023-10-29 05:36:40', '2023-12-05 00:54:45'),
(58, 'meta_pixel_id', NULL, '2023-10-29 05:36:40', '2023-12-05 00:54:45'),
(59, 'smtp_from_email', 'example@gmail.com', '2023-10-29 05:36:40', '2024-08-27 05:20:40'),
(61, 'language_dirs', '{\"english\":\"ltr\",\"hindi\":\"rtl\",\"arabic\":\"rtl\"}', '2023-10-29 05:36:40', '2023-10-29 05:36:40'),
(62, 'certificate_template', 'uploads/certificate-template/1724757708-kqhTGFst8cvmpLaY3465B2fnJXueHz.png', '2024-03-12 08:17:10', '2024-08-27 05:21:49'),
(63, 'certificate_builder_content', '<style>\n            @import url(\'https://fonts.googleapis.com/css2?family=Italianno&display=swap\');\n            @import url(\'https://fonts.googleapis.com/css2?family=Pinyon+Script&display=swap%27\');\n            @import url(\'https://fonts.googleapis.com/css2?family=Miss+Fajardose&display=swap%27\');\n        </style>\n        \n\n                    <style>\n            @import url(\'https://fonts.googleapis.com/css2?family=Italianno&display=swap\');\n            @import url(\'https://fonts.googleapis.com/css2?family=Pinyon+Script&display=swap%27\');\n            @import url(\'https://fonts.googleapis.com/css2?family=Miss+Fajardose&display=swap%27\');\n        </style>\n        \n\n                    <style>\n            @import url(\'https://fonts.googleapis.com/css2?family=Italianno&display=swap\');\n            @import url(\'https://fonts.googleapis.com/css2?family=Pinyon+Script&display=swap%27\');\n            @import url(\'https://fonts.googleapis.com/css2?family=Miss+Fajardose&display=swap%27\');\n        </style>\n        \n\n                    <style>\n            @import url(\'https://fonts.googleapis.com/css2?family=Italianno&display=swap\');\n            @import url(\'https://fonts.googleapis.com/css2?family=Pinyon+Script&display=swap%27\');\n            @import url(\'https://fonts.googleapis.com/css2?family=Miss+Fajardose&display=swap%27\');\n        </style>\n        \n\n                    <div id=\"certificate-layout-module\" class=\"certificate-layout-module resizeable-canvas draggable ui-draggable ui-draggable-handle ui-resizable hidden-position\" style=\"position: relative; width: 1069.2px; height: 755.055px; left: 0px; top: -1px;\">\n                <img class=\"certificate-template\" style=\"width: 100%; height: 100%;\" src=\"http://localhost/academy-laravel/sham/academy/public/uploads/certificate-template/1724757708-kqhTGFst8cvmpLaY3465B2fnJXueHz.png\">\n            <div class=\"ui-resizable-handle ui-resizable-e\" style=\"z-index: 90;\"></div><div class=\"ui-resizable-handle ui-resizable-s\" style=\"z-index: 90;\"></div><div class=\"ui-resizable-handle ui-resizable-se ui-icon ui-icon-gripsmall-diagonal-se\" style=\"z-index: 90;\"></div><div class=\"draggable resizeable-canvas ui-draggable ui-draggable-handle ui-resizable\" style=\"position: absolute; font-size: 16px; top: 114px; left: 93px; width: 84.8906px; font-family: &quot;default&quot;; padding: 5px !important; height: 80px;\">\n                {qr_code}\n                <i class=\"remove-item fi-rr-cross-circle cursor-pointer\" onclick=\"$(this).parent().remove()\">\n            </i><div class=\"ui-resizable-handle ui-resizable-e\" style=\"z-index: 90;\"></div><div class=\"ui-resizable-handle ui-resizable-s\" style=\"z-index: 90;\"></div><div class=\"ui-resizable-handle ui-resizable-se ui-icon ui-icon-gripsmall-diagonal-se\" style=\"z-index: 90;\"></div></div><div class=\"draggable resizeable-canvas ui-draggable ui-draggable-handle ui-resizable\" style=\"position: absolute; font-size: 18px; top: 546px; left: 125px; width: 210.031px; font-family: &quot;Pinyon Script&quot;; padding: 5px !important; height: 37px;\">\n                {instructor_name}\n                <i class=\"remove-item fi-rr-cross-circle cursor-pointer\" onclick=\"$(this).parent().remove()\">\n            </i><div class=\"ui-resizable-handle ui-resizable-e\" style=\"z-index: 90;\"></div><div class=\"ui-resizable-handle ui-resizable-s\" style=\"z-index: 90;\"></div><div class=\"ui-resizable-handle ui-resizable-se ui-icon ui-icon-gripsmall-diagonal-se\" style=\"z-index: 90;\"></div></div><div class=\"draggable resizeable-canvas ui-draggable ui-draggable-handle ui-resizable\" style=\"position: absolute; font-size: 18px; top: 546px; left: 724px; width: 210.188px; font-family: &quot;Pinyon Script&quot;; padding: 5px !important; height: 39px;\">\n                {student_name}\n                <i class=\"remove-item fi-rr-cross-circle cursor-pointer\" onclick=\"$(this).parent().remove()\">\n            </i><div class=\"ui-resizable-handle ui-resizable-e\" style=\"z-index: 90;\"></div><div class=\"ui-resizable-handle ui-resizable-s\" style=\"z-index: 90;\"></div><div class=\"ui-resizable-handle ui-resizable-se ui-icon ui-icon-gripsmall-diagonal-se\" style=\"z-index: 90;\"></div></div><div class=\"draggable resizeable-canvas ui-draggable ui-draggable-handle ui-resizable\" style=\"position: absolute; font-size: 16px; top: 545px; left: 442px; width: min-content; font-family: &quot;default&quot;; padding: 5px !important;\">\n                {course_completion_date}\n                <i class=\"remove-item fi-rr-cross-circle cursor-pointer\" onclick=\"$(this).parent().remove()\">\n            </i><div class=\"ui-resizable-handle ui-resizable-e\" style=\"z-index: 90;\"></div><div class=\"ui-resizable-handle ui-resizable-s\" style=\"z-index: 90;\"></div><div class=\"ui-resizable-handle ui-resizable-se ui-icon ui-icon-gripsmall-diagonal-se\" style=\"z-index: 90;\"></div></div><div class=\"draggable resizeable-canvas ui-draggable ui-draggable-handle ui-resizable\" style=\"position: absolute; font-size: 12px; top: 665px; left: 457px; width: min-content; font-family: &quot;default&quot;; padding: 5px !important;\">\n                {certificate_download_date}\n                <i class=\"remove-item fi-rr-cross-circle cursor-pointer\" onclick=\"$(this).parent().remove()\">\n            </i><div class=\"ui-resizable-handle ui-resizable-e\" style=\"z-index: 90;\"></div><div class=\"ui-resizable-handle ui-resizable-s\" style=\"z-index: 90;\"></div><div class=\"ui-resizable-handle ui-resizable-se ui-icon ui-icon-gripsmall-diagonal-se\" style=\"z-index: 90;\"></div></div><div class=\"draggable resizeable-canvas ui-draggable ui-draggable-handle ui-resizable\" style=\"position: absolute; font-size: 30px; top: 136px; left: 264px; width: 534.336px; font-family: &quot;default&quot;; padding: 5px !important; height: 62px;\">\n                COURSE COMPLETION CERTIFICATE\n                <i class=\"remove-item fi-rr-cross-circle cursor-pointer\" onclick=\"$(this).parent().remove()\">\n            </i><div class=\"ui-resizable-handle ui-resizable-e\" style=\"z-index: 90;\"></div><div class=\"ui-resizable-handle ui-resizable-s\" style=\"z-index: 90;\"></div><div class=\"ui-resizable-handle ui-resizable-se ui-icon ui-icon-gripsmall-diagonal-se\" style=\"z-index: 90;\"></div></div><div class=\"draggable resizeable-canvas ui-draggable ui-draggable-handle ui-resizable\" style=\"position: absolute; font-size: 18px; top: 211px; left: 205px; width: 664.5px; font-family: &quot;Pinyon Script&quot;; padding: 5px !important; height: 98px;\">\n                This certificate is awarded to {student_name} in recognition of their successful completion of Course on {course_completion_date}. Your hard work, dedication, and commitment to learning have enabled you to achieve this milestone, and we are proud to recognize your accomplishment.\n                <i class=\"remove-item fi-rr-cross-circle cursor-pointer\" onclick=\"$(this).parent().remove()\">\n            </i><div class=\"ui-resizable-handle ui-resizable-e\" style=\"z-index: 90;\"></div><div class=\"ui-resizable-handle ui-resizable-s\" style=\"z-index: 90;\"></div><div class=\"ui-resizable-handle ui-resizable-se ui-icon ui-icon-gripsmall-diagonal-se\" style=\"z-index: 90;\"></div></div><div class=\"draggable resizeable-canvas ui-draggable ui-draggable-handle ui-resizable\" style=\"position: absolute; font-size: 18px; top: 316px; left: 315px; width: 428.25px; font-family: &quot;default&quot;; padding: 5px !important; height: 48px;\">\n                {course_title}\n                <i class=\"remove-item fi-rr-cross-circle cursor-pointer\" onclick=\"$(this).parent().remove()\">\n            </i><div class=\"ui-resizable-handle ui-resizable-e\" style=\"z-index: 90;\"></div><div class=\"ui-resizable-handle ui-resizable-s\" style=\"z-index: 90;\"></div><div class=\"ui-resizable-handle ui-resizable-se ui-icon ui-icon-gripsmall-diagonal-se\" style=\"z-index: 90;\"></div></div></div>', '2024-03-12 08:17:50', '2024-08-27 05:21:49'),
(64, '_token', 'tEYJPyWB4tjFp0tz78j0gDLj07tLXnw5hVpU5mX7', '2024-03-12 08:18:24', '2024-08-27 05:25:46'),
(65, 'zoom_account_email', 'example@gmail.com', '2024-03-12 08:18:24', '2024-08-27 05:19:46'),
(66, 'zoom_account_id', 'RG4XYxxxxxxxxxxxxxxx', '2024-03-12 08:18:24', '2024-08-27 05:19:46'),
(67, 'zoom_client_id', 'mFgJ4xxxxxxxxxxxxxxx', '2024-03-12 08:18:24', '2024-08-27 05:19:46'),
(68, 'zoom_client_secret', 'OZ6m9xxxxxxxxxxxxxxxx', '2024-03-12 08:18:24', '2024-08-27 05:19:46'),
(69, 'zoom_web_sdk', 'active', '2024-03-12 08:18:24', '2024-08-27 05:19:46'),
(70, 'zoom_sdk_client_id', '7M6Wxxxxxxxxxxxx', '2024-03-12 08:18:24', '2024-08-27 05:19:46'),
(71, 'zoom_sdk_client_secret', 'z1Nzxxxxxxxxxxxxxx', '2024-03-12 08:18:24', '2024-08-27 05:19:46'),
(72, 'open_ai_model', 'gpt-3.5-turbo-0125', '2024-03-12 09:11:12', '2024-08-27 05:25:46'),
(73, 'open_ai_max_token', '100', '2024-03-12 09:11:12', '2024-08-27 05:25:46'),
(74, 'open_ai_secret_key', 'sk-JPYxxxxxxxxxxxxxxxxxxx', '2024-03-12 09:11:12', '2024-08-27 05:25:46'),
(75, 'timezone', 'America/New_York', '2024-07-01 02:06:24', '2024-07-01 08:06:24'),
(76, 'device_limitation', '1', '2023-10-29 05:36:40', '2024-08-27 05:16:34');

-- --------------------------------------------------------

--
-- Table structure for table `team_package_members`
--

CREATE TABLE `team_package_members` (
  `id` int(11) NOT NULL,
  `leader_id` int(11) DEFAULT NULL,
  `team_package_id` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `team_package_purchases`
--

CREATE TABLE `team_package_purchases` (
  `id` int(11) NOT NULL,
  `invoice` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `package_id` int(11) DEFAULT NULL,
  `price` float(10,2) DEFAULT NULL,
  `admin_revenue` float(10,2) DEFAULT NULL,
  `instructor_revenue` float(10,2) DEFAULT NULL,
  `tax` float(10,2) DEFAULT NULL,
  `payment_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_details` text COLLATE utf8mb4_unicode_ci,
  `status` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `team_training_packages`
--

CREATE TABLE `team_training_packages` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double(10,2) DEFAULT NULL,
  `course_privacy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `allocation` int(11) DEFAULT NULL,
  `expiry_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` int(11) DEFAULT NULL,
  `expiry_date` int(11) DEFAULT NULL,
  `features` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `thumbnail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pricing_type` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `skills` text COLLATE utf8mb4_unicode_ci,
  `facebook` text COLLATE utf8mb4_unicode_ci,
  `twitter` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linkedin` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `about` text COLLATE utf8mb4_unicode_ci,
  `biography` longtext COLLATE utf8mb4_unicode_ci,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paymentkeys` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_reviews`
--

CREATE TABLE `user_reviews` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `review` longtext COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `watch_durations`
--

CREATE TABLE `watch_durations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `watch_histories`
--

CREATE TABLE `watch_histories` (
  `id` int(255) UNSIGNED NOT NULL,
  `course_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `completed_lesson` longtext COLLATE utf8mb4_unicode_ci,
  `watching_lesson_id` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `completed_date` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(255) DEFAULT NULL,
  `course_id` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addtocarts`
--
ALTER TABLE `addtocarts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `applications`
--
ALTER TABLE `applications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_categories`
--
ALTER TABLE `blog_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_comments`
--
ALTER TABLE `blog_comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_likes`
--
ALTER TABLE `blog_likes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bootcamps`
--
ALTER TABLE `bootcamps`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bootcamp_categories`
--
ALTER TABLE `bootcamp_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bootcamp_live_classes`
--
ALTER TABLE `bootcamp_live_classes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bootcamp_modules`
--
ALTER TABLE `bootcamp_modules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bootcamp_purchases`
--
ALTER TABLE `bootcamp_purchases`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bootcamp_resources`
--
ALTER TABLE `bootcamp_resources`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `builder_blocks`
--
ALTER TABLE `builder_blocks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `builder_pages`
--
ALTER TABLE `builder_pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_parent_id_index` (`parent_id`);

--
-- Indexes for table `certificates`
--
ALTER TABLE `certificates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `certificates_identifier_unique` (`identifier`),
  ADD KEY `certificates_user_id_index` (`user_id`),
  ADD KEY `certificates_course_id_index` (`course_id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `courses_user_id_index` (`user_id`),
  ADD KEY `courses_category_id_index` (`category_id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `device_ips`
--
ALTER TABLE `device_ips`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `enrollments`
--
ALTER TABLE `enrollments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `enrollments_user_id_index` (`user_id`),
  ADD KEY `enrollments_course_id_index` (`course_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `forums`
--
ALTER TABLE `forums`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `frontend_settings`
--
ALTER TABLE `frontend_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `home_page_settings`
--
ALTER TABLE `home_page_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `instructor_reviews`
--
ALTER TABLE `instructor_reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `language_phrases`
--
ALTER TABLE `language_phrases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `language_phrases_language_id_index` (`language_id`);

--
-- Indexes for table `lessons`
--
ALTER TABLE `lessons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lessons_user_id_index` (`user_id`),
  ADD KEY `lessons_course_id_index` (`course_id`),
  ADD KEY `lessons_section_id_index` (`section_id`);

--
-- Indexes for table `like_dislike_reviews`
--
ALTER TABLE `like_dislike_reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `live_classes`
--
ALTER TABLE `live_classes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `live_classes_user_id_index` (`user_id`),
  ADD KEY `live_classes_course_id_index` (`course_id`);

--
-- Indexes for table `media_files`
--
ALTER TABLE `media_files`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `message_threads`
--
ALTER TABLE `message_threads`
  ADD PRIMARY KEY (`id`),
  ADD KEY `message_thread_sender_foreign` (`contact_one`),
  ADD KEY `message_thread_receiver_foreign` (`contact_two`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `newsletters`
--
ALTER TABLE `newsletters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `newsletter_subscribers`
--
ALTER TABLE `newsletter_subscribers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notification_settings`
--
ALTER TABLE `notification_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `offline_payments`
--
ALTER TABLE `offline_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `payment_gateways`
--
ALTER TABLE `payment_gateways`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_histories`
--
ALTER TABLE `payment_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payouts`
--
ALTER TABLE `payouts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `player_settings`
--
ALTER TABLE `player_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quizzes`
--
ALTER TABLE `quizzes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quiz_submissions`
--
ALTER TABLE `quiz_submissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sections_user_id_index` (`user_id`),
  ADD KEY `sections_course_id_index` (`course_id`);

--
-- Indexes for table `seo_fields`
--
ALTER TABLE `seo_fields`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `team_package_members`
--
ALTER TABLE `team_package_members`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `team_package_purchases`
--
ALTER TABLE `team_package_purchases`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `team_training_packages`
--
ALTER TABLE `team_training_packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_reviews`
--
ALTER TABLE `user_reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `watch_durations`
--
ALTER TABLE `watch_durations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `watch_histories`
--
ALTER TABLE `watch_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addtocarts`
--
ALTER TABLE `addtocarts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `applications`
--
ALTER TABLE `applications`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blog_categories`
--
ALTER TABLE `blog_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blog_comments`
--
ALTER TABLE `blog_comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blog_likes`
--
ALTER TABLE `blog_likes`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bootcamps`
--
ALTER TABLE `bootcamps`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bootcamp_categories`
--
ALTER TABLE `bootcamp_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bootcamp_live_classes`
--
ALTER TABLE `bootcamp_live_classes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bootcamp_modules`
--
ALTER TABLE `bootcamp_modules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bootcamp_purchases`
--
ALTER TABLE `bootcamp_purchases`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bootcamp_resources`
--
ALTER TABLE `bootcamp_resources`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `builder_blocks`
--
ALTER TABLE `builder_blocks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `builder_pages`
--
ALTER TABLE `builder_pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `cart_items`
--
ALTER TABLE `cart_items`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `certificates`
--
ALTER TABLE `certificates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(21) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=165;

--
-- AUTO_INCREMENT for table `device_ips`
--
ALTER TABLE `device_ips`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `enrollments`
--
ALTER TABLE `enrollments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `forums`
--
ALTER TABLE `forums`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `frontend_settings`
--
ALTER TABLE `frontend_settings`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `home_page_settings`
--
ALTER TABLE `home_page_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `instructor_reviews`
--
ALTER TABLE `instructor_reviews`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `language_phrases`
--
ALTER TABLE `language_phrases`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `lessons`
--
ALTER TABLE `lessons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `like_dislike_reviews`
--
ALTER TABLE `like_dislike_reviews`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `live_classes`
--
ALTER TABLE `live_classes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `media_files`
--
ALTER TABLE `media_files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `message_threads`
--
ALTER TABLE `message_threads`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `newsletters`
--
ALTER TABLE `newsletters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `newsletter_subscribers`
--
ALTER TABLE `newsletter_subscribers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notification_settings`
--
ALTER TABLE `notification_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `offline_payments`
--
ALTER TABLE `offline_payments`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_gateways`
--
ALTER TABLE `payment_gateways`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `payment_histories`
--
ALTER TABLE `payment_histories`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payouts`
--
ALTER TABLE `payouts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `player_settings`
--
ALTER TABLE `player_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quizzes`
--
ALTER TABLE `quizzes`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quiz_submissions`
--
ALTER TABLE `quiz_submissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(255) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `seo_fields`
--
ALTER TABLE `seo_fields`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT for table `team_package_members`
--
ALTER TABLE `team_package_members`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `team_package_purchases`
--
ALTER TABLE `team_package_purchases`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `team_training_packages`
--
ALTER TABLE `team_training_packages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_reviews`
--
ALTER TABLE `user_reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `watch_durations`
--
ALTER TABLE `watch_durations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `watch_histories`
--
ALTER TABLE `watch_histories`
  MODIFY `id` int(255) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
