

DROP TABLE IF EXISTS `webtoffee_commentmeta` ;/*END*/ 

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";/*END*/
SET time_zone = "+00:00";/*END*/


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;/*END*/
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;/*END*/
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;/*END*/
/*!40101 SET NAMES utf8 */;/*END*/
--
-- Database: `sqlcamenisch`
--




CREATE TABLE `webtoffee_commentmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;/*END*/






DROP TABLE IF EXISTS `webtoffee_comments` ;/*END*/ 

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";/*END*/
SET time_zone = "+00:00";/*END*/


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;/*END*/
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;/*END*/
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;/*END*/
/*!40101 SET NAMES utf8 */;/*END*/
--
-- Database: `sqlcamenisch`
--




CREATE TABLE `webtoffee_comments` (
  `comment_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint(20) unsigned NOT NULL DEFAULT '0',
  `comment_author` tinytext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `comment_author_email` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`),
  KEY `comment_author_email` (`comment_author_email`(10))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;/*END*/


INSERT INTO webtoffee_comments VALUES
("1","1","Ein WordPress-Kommentator","wapuu@wordpress.example","https://wordpress.org/","","2018-11-18 09:07:11","2018-11-18 09:07:11","Hallo, dies ist ein Kommentar.
Um mit dem Freischalten, Bearbeiten und Löschen von Kommentaren zu beginnen, besuchen Sie bitte die Kommentare-Ansicht im Dashboard.
Die Avatare der Kommentatoren kommen von <a href=\"https://gravatar.com\">Gravatar</a>.","0","1","","","0","0");/*END*/




DROP TABLE IF EXISTS `webtoffee_duplicator_packages` ;/*END*/ 

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";/*END*/
SET time_zone = "+00:00";/*END*/


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;/*END*/
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;/*END*/
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;/*END*/
/*!40101 SET NAMES utf8 */;/*END*/
--
-- Database: `sqlcamenisch`
--




CREATE TABLE `webtoffee_duplicator_packages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `hash` varchar(50) NOT NULL,
  `status` int(11) NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `owner` varchar(60) NOT NULL,
  `package` mediumblob NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hash` (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;/*END*/






DROP TABLE IF EXISTS `webtoffee_links` ;/*END*/ 

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";/*END*/
SET time_zone = "+00:00";/*END*/


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;/*END*/
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;/*END*/
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;/*END*/
/*!40101 SET NAMES utf8 */;/*END*/
--
-- Database: `sqlcamenisch`
--




CREATE TABLE `webtoffee_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) unsigned NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `link_rss` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;/*END*/






DROP TABLE IF EXISTS `webtoffee_options` ;/*END*/ 

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";/*END*/
SET time_zone = "+00:00";/*END*/


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;/*END*/
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;/*END*/
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;/*END*/
/*!40101 SET NAMES utf8 */;/*END*/
--
-- Database: `sqlcamenisch`
--




CREATE TABLE `webtoffee_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(191) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=InnoDB AUTO_INCREMENT=314 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;/*END*/


INSERT INTO webtoffee_options VALUES
("1","siteurl","http://www.geraldinecamenisch.com","yes"),
("2","home","http://www.geraldinecamenisch.com","yes"),
("3","blogname","www.geraldinecamenisch.com","yes"),
("4","blogdescription","Gerladinè Camenisch - Sopran","yes"),
("5","users_can_register","0","yes"),
("6","admin_email","candy.padmore@bluewin.ch","yes"),
("7","start_of_week","1","yes"),
("8","use_balanceTags","0","yes"),
("9","use_smilies","1","yes"),
("10","require_name_email","1","yes"),
("11","comments_notify","1","yes"),
("12","posts_per_rss","10","yes"),
("13","rss_use_excerpt","0","yes"),
("14","mailserver_url","mail.example.com","yes"),
("15","mailserver_login","login@example.com","yes"),
("16","mailserver_pass","password","yes"),
("17","mailserver_port","110","yes"),
("18","default_category","1","yes"),
("19","default_comment_status","open","yes"),
("20","default_ping_status","open","yes"),
("21","default_pingback_flag","1","yes"),
("22","posts_per_page","10","yes"),
("23","date_format","j. F Y","yes"),
("24","time_format","G:i","yes"),
("25","links_updated_date_format","j. F Y G:i","yes"),
("26","comment_moderation","0","yes"),
("27","moderation_notify","1","yes"),
("28","permalink_structure","/%postname%/","yes"),
("30","hack_file","0","yes"),
("31","blog_charset","UTF-8","yes"),
("32","moderation_keys","","no"),
("33","active_plugins","a:14:{i:0;s:27:\"acf-gallery/acf-gallery.php\";i:1;s:29:\"acf-repeater/acf-repeater.php\";i:2;s:34:\"advanced-custom-fields-pro/acf.php\";i:3;s:30:\"advanced-custom-fields/acf.php\";i:4;s:19:\"akismet/akismet.php\";i:5;s:59:\"black-studio-tinymce-widget/black-studio-tinymce-widget.php\";i:6;s:51:\"codepress-admin-columns/codepress-admin-columns.php\";i:7;s:47:\"email-address-encoder/email-address-encoder.php\";i:8;s:41:\"simple-image-sizes/simple_image_sizes.php\";i:9;s:29:\"svg-complete/svg-complete.php\";i:10;s:37:\"tinymce-advanced/tinymce-advanced.php\";i:11;s:41:\"wordpress-importer/wordpress-importer.php\";i:12;s:24:\"wordpress-seo/wp-seo.php\";i:13;s:56:\"wp-migration-duplicator/webtoffee-wordpress-migrator.php\";}","yes"),
("34","category_base","","yes"),
("35","ping_sites","http://rpc.pingomatic.com/","yes"),
("36","comment_max_links","2","yes"),
("37","gmt_offset","0","yes"),
("38","default_email_category","1","yes"),
("39","recently_edited","a:3:{i:0;s:114:\"/Users/candypadmore/Documents/GitHub/homemade/www.geraldinecamenisch.com/wp-content/themes/twentysixteen/style.css\";i:1;s:111:\"/Users/candypadmore/Documents/GitHub/homemade/www.geraldinecamenisch.com/wp-content/plugins/akismet/akismet.php\";i:2;s:0:\"\";}","no"),
("40","template","camenisch","yes"),
("41","stylesheet","camenisch","yes"),
("42","comment_whitelist","1","yes"),
("43","blacklist_keys","","no"),
("44","comment_registration","0","yes"),
("45","html_type","text/html","yes"),
("46","use_trackback","0","yes"),
("47","default_role","subscriber","yes"),
("48","db_version","38590","yes"),
("49","uploads_use_yearmonth_folders","1","yes"),
("50","upload_path","","yes"),
("51","blog_public","1","yes"),
("52","default_link_category","2","yes"),
("53","show_on_front","page","yes"),
("54","tag_base","","yes"),
("55","show_avatars","1","yes"),
("56","avatar_rating","G","yes"),
("57","upload_url_path","","yes"),
("58","thumbnail_size_w","150","yes"),
("59","thumbnail_size_h","150","yes"),
("60","thumbnail_crop","1","yes"),
("61","medium_size_w","300","yes"),
("62","medium_size_h","300","yes"),
("63","avatar_default","mystery","yes"),
("64","large_size_w","1024","yes"),
("65","large_size_h","1024","yes"),
("66","image_default_link_type","","yes"),
("67","image_default_size","","yes"),
("68","image_default_align","","yes"),
("69","close_comments_for_old_posts","0","yes"),
("70","close_comments_days_old","14","yes"),
("71","thread_comments","1","yes"),
("72","thread_comments_depth","5","yes"),
("73","page_comments","0","yes"),
("74","comments_per_page","50","yes"),
("75","default_comments_page","newest","yes"),
("76","comment_order","asc","yes"),
("77","sticky_posts","a:0:{}","yes"),
("78","widget_categories","a:2:{i:2;a:4:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:12:\"hierarchical\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}","yes"),
("79","widget_text","a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}","yes"),
("80","widget_rss","a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}","yes"),
("81","uninstall_plugins","a:0:{}","no"),
("82","timezone_string","","yes"),
("83","page_for_posts","0","yes"),
("84","page_on_front","5","yes"),
("85","default_post_format","0","yes"),
("86","link_manager_enabled","0","yes"),
("87","finished_splitting_shared_terms","1","yes"),
("88","site_icon","0","yes"),
("89","medium_large_size_w","768","yes"),
("90","medium_large_size_h","0","yes"),
("91","wp_page_for_privacy_policy","3","yes"),
("92","show_comments_cookies_opt_in","0","yes"),
("93","initial_db_version","38590","yes"),
("94","webtoffee_user_roles","a:8:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:63:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;s:20:\"wpseo_manage_options\";b:1;s:20:\"manage_admin_columns\";b:1;}}s:6:\"editor\";a:2:{s:4:\"name\";s:6:\"Editor\";s:12:\"capabilities\";a:35:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:15:\"wpseo_bulk_edit\";b:1;}}s:6:\"author\";a:2:{s:4:\"name\";s:6:\"Author\";s:12:\"capabilities\";a:10:{s:12:\"upload_files\";b:1;s:10:\"edit_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:22:\"delete_published_posts\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:11:\"Contributor\";s:12:\"capabilities\";a:5:{s:10:\"edit_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:10:\"Subscriber\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;}}s:3:\"geo\";a:2:{s:4:\"name\";s:20:\"GeoPartner Superuser\";s:12:\"capabilities\";a:27:{s:4:\"read\";b:1;s:19:\"delete_others_pages\";b:1;s:19:\"delete_others_posts\";b:1;s:12:\"delete_pages\";b:1;s:12:\"delete_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:20:\"delete_private_posts\";b:1;s:22:\"delete_published_pages\";b:1;s:22:\"delete_published_posts\";b:1;s:17:\"edit_others_pages\";b:1;s:17:\"edit_others_posts\";b:1;s:10:\"edit_pages\";b:1;s:10:\"edit_posts\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"edit_private_posts\";b:1;s:20:\"edit_published_pages\";b:1;s:20:\"edit_published_posts\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:17:\"moderate_comments\";b:1;s:13:\"publish_pages\";b:1;s:13:\"publish_posts\";b:1;s:18:\"read_private_pages\";b:1;s:18:\"read_private_posts\";b:1;s:15:\"unfiltered_html\";b:1;s:6:\"import\";b:1;s:12:\"upload_files\";b:1;}}s:13:\"wpseo_manager\";a:2:{s:4:\"name\";s:11:\"SEO Manager\";s:12:\"capabilities\";a:37:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:15:\"wpseo_bulk_edit\";b:1;s:28:\"wpseo_edit_advanced_metadata\";b:1;s:20:\"wpseo_manage_options\";b:1;}}s:12:\"wpseo_editor\";a:2:{s:4:\"name\";s:10:\"SEO Editor\";s:12:\"capabilities\";a:36:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:15:\"wpseo_bulk_edit\";b:1;s:28:\"wpseo_edit_advanced_metadata\";b:1;}}}","yes"),
("95","fresh_site","0","yes"),
("96","WPLANG","de_CH","yes"),
("97","widget_search","a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}","yes"),
("98","widget_recent-posts","a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}","yes"),
("99","widget_recent-comments","a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}","yes"),
("100","widget_archives","a:2:{i:2;a:3:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}","yes"),
("101","widget_meta","a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}","yes");/*END*/
INSERT INTO webtoffee_options VALUES
("102","sidebars_widgets","a:6:{s:19:\"wp_inactive_widgets\";a:0:{}s:18:\"footer-left-widget\";a:1:{i:0;s:31:\"geopartner-left-footer-widget-2\";}s:20:\"footer-center-widget\";a:0:{}s:19:\"footer-right-widget\";a:0:{}s:24:\"header_language_switcher\";a:0:{}s:13:\"array_version\";i:3;}","yes"),
("103","widget_pages","a:1:{s:12:\"_multiwidget\";i:1;}","yes"),
("104","widget_calendar","a:1:{s:12:\"_multiwidget\";i:1;}","yes"),
("105","widget_media_audio","a:1:{s:12:\"_multiwidget\";i:1;}","yes"),
("106","widget_media_image","a:1:{s:12:\"_multiwidget\";i:1;}","yes"),
("107","widget_media_gallery","a:1:{s:12:\"_multiwidget\";i:1;}","yes"),
("108","widget_media_video","a:1:{s:12:\"_multiwidget\";i:1;}","yes"),
("109","widget_tag_cloud","a:1:{s:12:\"_multiwidget\";i:1;}","yes"),
("110","widget_nav_menu","a:1:{s:12:\"_multiwidget\";i:1;}","yes"),
("111","widget_custom_html","a:1:{s:12:\"_multiwidget\";i:1;}","yes"),
("112","cron","a:6:{i:1543147631;a:1:{s:34:\"wp_privacy_delete_old_export_files\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1543153260;a:1:{s:19:\"wpseo-reindex-links\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1543180031;a:3:{s:16:\"wp_version_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:17:\"wp_update_plugins\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_update_themes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1543223241;a:2:{s:19:\"wp_scheduled_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}s:25:\"delete_expired_transients\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1543223437;a:1:{s:30:\"wp_scheduled_auto_draft_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}s:7:\"version\";i:2;}","yes"),
("113","theme_mods_twentyseventeen","a:3:{s:18:\"custom_css_post_id\";i:-1;s:18:\"nav_menu_locations\";a:1:{s:3:\"top\";i:2;}s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1542532582;s:4:\"data\";a:4:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}s:9:\"sidebar-2\";a:0:{}s:9:\"sidebar-3\";a:0:{}}}}","yes"),
("125","_site_transient_update_themes","O:8:\"stdClass\":4:{s:12:\"last_checked\";i:1543144421;s:7:\"checked\";a:4:{s:9:\"camenisch\";s:3:\"1.0\";s:13:\"twentyfifteen\";s:3:\"2.0\";s:15:\"twentyseventeen\";s:3:\"1.7\";s:13:\"twentysixteen\";s:3:\"1.5\";}s:8:\"response\";a:0:{}s:12:\"translations\";a:0:{}}","no"),
("130","can_compress_scripts","1","no"),
("145","_site_transient_update_core","O:8:\"stdClass\":4:{s:7:\"updates\";a:1:{i:0;O:8:\"stdClass\":10:{s:8:\"response\";s:6:\"latest\";s:8:\"download\";s:65:\"https://downloads.wordpress.org/release/de_CH/wordpress-4.9.8.zip\";s:6:\"locale\";s:5:\"de_CH\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:65:\"https://downloads.wordpress.org/release/de_CH/wordpress-4.9.8.zip\";s:10:\"no_content\";b:0;s:11:\"new_bundled\";b:0;s:7:\"partial\";b:0;s:8:\"rollback\";b:0;}s:7:\"current\";s:5:\"4.9.8\";s:7:\"version\";s:5:\"4.9.8\";s:11:\"php_version\";s:5:\"5.2.4\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"4.7\";s:15:\"partial_version\";s:0:\"\";}}s:12:\"last_checked\";i:1543144419;s:15:\"version_checked\";s:5:\"4.9.8\";s:12:\"translations\";a:0:{}}","no"),
("148","recently_activated","a:2:{s:46:\"really-simple-csv-importer/rs-csv-importer.php\";i:1543144002;s:21:\"polylang/polylang.php\";i:1543143991;}","yes"),
("153","nav_menu_options","a:2:{i:0;b:0;s:8:\"auto_add\";a:0:{}}","yes"),
("157","theme_mods_twentysixteen","a:4:{s:18:\"custom_css_post_id\";i:-1;s:18:\"nav_menu_locations\";a:1:{s:7:\"primary\";i:2;}s:16:\"background_image\";s:75:\"http://www.geraldinecamenisch.com/wp-content/uploads/2018/11/background.jpg\";s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1542533508;s:4:\"data\";a:4:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:0:{}s:9:\"sidebar-2\";a:0:{}s:9:\"sidebar-3\";a:0:{}}}}","yes"),
("160","current_theme","camenisch","yes"),
("161","theme_switched","","yes"),
("162","theme_switched_via_customizer","","yes"),
("163","customize_stashed_theme_mods","a:0:{}","no"),
("170","theme_mods_camenisch","a:3:{i:0;b:0;s:18:\"nav_menu_locations\";a:1:{s:7:\"primary\";i:2;}s:18:\"custom_css_post_id\";i:-1;}","yes"),
("174","widget_geopartner-left-footer-widget","a:2:{i:2;a:8:{s:8:\"subtitle\";s:7:\"Kontakt\";s:5:\"title\";s:20:\"Géraldine Camenisch\";s:4:\"name\";s:0:\"\";s:6:\"street\";s:0:\"\";s:3:\"plz\";s:0:\"\";s:3:\"tel\";s:16:\"+41 79 317 00 97\";s:3:\"fax\";s:0:\"\";s:4:\"mail\";s:27:\"mail@geraldinecamenisch.com\";}s:12:\"_multiwidget\";i:1;}","yes"),
("175","widget_geopartner-center-footer-widget","a:1:{s:12:\"_multiwidget\";i:1;}","yes"),
("176","widget_geopartner-right-footer-widget","a:1:{s:12:\"_multiwidget\";i:1;}","yes"),
("193","polylang","a:13:{s:7:\"browser\";i:1;s:7:\"rewrite\";i:1;s:12:\"hide_default\";i:1;s:10:\"force_lang\";i:1;s:13:\"redirect_lang\";i:0;s:13:\"media_support\";i:1;s:9:\"uninstall\";i:0;s:4:\"sync\";a:0:{}s:10:\"post_types\";a:0:{}s:10:\"taxonomies\";a:0:{}s:7:\"domains\";a:0:{}s:7:\"version\";s:3:\"2.4\";s:16:\"first_activation\";i:1542548460;}","yes"),
("194","polylang_wpml_strings","a:0:{}","yes"),
("195","tadv_settings","a:6:{s:7:\"options\";s:15:\"menubar,advlist\";s:9:\"toolbar_1\";s:106:\"formatselect,bold,italic,blockquote,bullist,numlist,alignleft,aligncenter,alignright,link,unlink,undo,redo\";s:9:\"toolbar_2\";s:103:\"fontselect,fontsizeselect,outdent,indent,pastetext,removeformat,charmap,wp_more,forecolor,table,wp_help\";s:9:\"toolbar_3\";s:0:\"\";s:9:\"toolbar_4\";s:0:\"\";s:7:\"plugins\";s:104:\"anchor,code,insertdatetime,nonbreaking,print,searchreplace,table,visualblocks,visualchars,advlist,wptadv\";}","yes"),
("196","tadv_admin_settings","a:1:{s:7:\"options\";a:0:{}}","yes"),
("197","tadv_version","4000","yes"),
("198","wpseo","a:19:{s:15:\"ms_defaults_set\";b:0;s:7:\"version\";s:5:\"9.2.1\";s:20:\"disableadvanced_meta\";b:1;s:19:\"onpage_indexability\";b:1;s:11:\"baiduverify\";s:0:\"\";s:12:\"googleverify\";s:0:\"\";s:8:\"msverify\";s:0:\"\";s:12:\"yandexverify\";s:0:\"\";s:9:\"site_type\";s:0:\"\";s:20:\"has_multiple_authors\";s:0:\"\";s:16:\"environment_type\";s:0:\"\";s:23:\"content_analysis_active\";b:1;s:23:\"keyword_analysis_active\";b:1;s:21:\"enable_admin_bar_menu\";b:1;s:26:\"enable_cornerstone_content\";b:1;s:18:\"enable_xml_sitemap\";b:1;s:24:\"enable_text_link_counter\";b:1;s:22:\"show_onboarding_notice\";b:1;s:18:\"first_activated_on\";i:1542548460;}","yes"),
("199","wpseo_titles","a:97:{s:10:\"title_test\";i:0;s:17:\"forcerewritetitle\";b:0;s:9:\"separator\";s:7:\"sc-dash\";s:16:\"title-home-wpseo\";s:42:\"%%sitename%% %%page%% %%sep%% %%sitedesc%%\";s:18:\"title-author-wpseo\";s:41:\"%%name%%, Author at %%sitename%% %%page%%\";s:19:\"title-archive-wpseo\";s:38:\"%%date%% %%page%% %%sep%% %%sitename%%\";s:18:\"title-search-wpseo\";s:63:\"You searched for %%searchphrase%% %%page%% %%sep%% %%sitename%%\";s:15:\"title-404-wpseo\";s:35:\"Page not found %%sep%% %%sitename%%\";s:19:\"metadesc-home-wpseo\";s:0:\"\";s:21:\"metadesc-author-wpseo\";s:0:\"\";s:22:\"metadesc-archive-wpseo\";s:0:\"\";s:9:\"rssbefore\";s:0:\"\";s:8:\"rssafter\";s:53:\"The post %%POSTLINK%% appeared first on %%BLOGLINK%%.\";s:20:\"noindex-author-wpseo\";b:0;s:28:\"noindex-author-noposts-wpseo\";b:1;s:21:\"noindex-archive-wpseo\";b:1;s:14:\"disable-author\";b:0;s:12:\"disable-date\";b:0;s:19:\"disable-post_format\";b:0;s:18:\"disable-attachment\";b:1;s:23:\"is-media-purge-relevant\";b:0;s:20:\"breadcrumbs-404crumb\";s:25:\"Error 404: Page not found\";s:29:\"breadcrumbs-display-blog-page\";b:1;s:20:\"breadcrumbs-boldlast\";b:0;s:25:\"breadcrumbs-archiveprefix\";s:12:\"Archives for\";s:18:\"breadcrumbs-enable\";b:0;s:16:\"breadcrumbs-home\";s:4:\"Home\";s:18:\"breadcrumbs-prefix\";s:0:\"\";s:24:\"breadcrumbs-searchprefix\";s:16:\"You searched for\";s:15:\"breadcrumbs-sep\";s:7:\"&raquo;\";s:12:\"website_name\";s:0:\"\";s:11:\"person_name\";s:0:\"\";s:22:\"alternate_website_name\";s:0:\"\";s:12:\"company_logo\";s:0:\"\";s:12:\"company_name\";s:0:\"\";s:17:\"company_or_person\";s:0:\"\";s:17:\"stripcategorybase\";b:0;s:10:\"title-post\";s:39:\"%%title%% %%page%% %%sep%% %%sitename%%\";s:13:\"metadesc-post\";s:0:\"\";s:12:\"noindex-post\";b:0;s:13:\"showdate-post\";b:0;s:23:\"display-metabox-pt-post\";b:1;s:23:\"post_types-post-maintax\";i:0;s:10:\"title-page\";s:39:\"%%title%% %%page%% %%sep%% %%sitename%%\";s:13:\"metadesc-page\";s:0:\"\";s:12:\"noindex-page\";b:0;s:13:\"showdate-page\";b:0;s:23:\"display-metabox-pt-page\";b:1;s:23:\"post_types-page-maintax\";i:0;s:16:\"title-attachment\";s:39:\"%%title%% %%page%% %%sep%% %%sitename%%\";s:19:\"metadesc-attachment\";s:0:\"\";s:18:\"noindex-attachment\";b:0;s:19:\"showdate-attachment\";b:0;s:29:\"display-metabox-pt-attachment\";b:1;s:29:\"post_types-attachment-maintax\";i:0;s:10:\"title-team\";s:39:\"%%title%% %%page%% %%sep%% %%sitename%%\";s:13:\"metadesc-team\";s:0:\"\";s:12:\"noindex-team\";b:0;s:13:\"showdate-team\";b:0;s:23:\"display-metabox-pt-team\";b:1;s:23:\"post_types-team-maintax\";i:0;s:20:\"title-ptarchive-team\";s:51:\"%%pt_plural%% Archive %%page%% %%sep%% %%sitename%%\";s:23:\"metadesc-ptarchive-team\";s:0:\"\";s:22:\"bctitle-ptarchive-team\";s:0:\"\";s:22:\"noindex-ptarchive-team\";b:0;s:15:\"title-reference\";s:39:\"%%title%% %%page%% %%sep%% %%sitename%%\";s:18:\"metadesc-reference\";s:0:\"\";s:17:\"noindex-reference\";b:0;s:18:\"showdate-reference\";b:0;s:28:\"display-metabox-pt-reference\";b:1;s:28:\"post_types-reference-maintax\";i:0;s:25:\"title-ptarchive-reference\";s:51:\"%%pt_plural%% Archive %%page%% %%sep%% %%sitename%%\";s:28:\"metadesc-ptarchive-reference\";s:0:\"\";s:27:\"bctitle-ptarchive-reference\";s:0:\"\";s:27:\"noindex-ptarchive-reference\";b:0;s:18:\"title-tax-category\";s:53:\"%%term_title%% Archives %%page%% %%sep%% %%sitename%%\";s:21:\"metadesc-tax-category\";s:0:\"\";s:28:\"display-metabox-tax-category\";b:1;s:20:\"noindex-tax-category\";b:0;s:18:\"title-tax-post_tag\";s:53:\"%%term_title%% Archives %%page%% %%sep%% %%sitename%%\";s:21:\"metadesc-tax-post_tag\";s:0:\"\";s:28:\"display-metabox-tax-post_tag\";b:1;s:20:\"noindex-tax-post_tag\";b:0;s:21:\"title-tax-post_format\";s:53:\"%%term_title%% Archives %%page%% %%sep%% %%sitename%%\";s:24:\"metadesc-tax-post_format\";s:0:\"\";s:31:\"display-metabox-tax-post_format\";b:1;s:23:\"noindex-tax-post_format\";b:1;s:29:\"title-tax-attachment_category\";s:53:\"%%term_title%% Archives %%page%% %%sep%% %%sitename%%\";s:32:\"metadesc-tax-attachment_category\";s:0:\"\";s:39:\"display-metabox-tax-attachment_category\";b:1;s:31:\"noindex-tax-attachment_category\";b:0;s:37:\"taxonomy-attachment_category-ptparent\";i:0;s:25:\"title-tax-reference_types\";s:53:\"%%term_title%% Archives %%page%% %%sep%% %%sitename%%\";s:28:\"metadesc-tax-reference_types\";s:0:\"\";s:35:\"display-metabox-tax-reference_types\";b:1;s:27:\"noindex-tax-reference_types\";b:0;s:33:\"taxonomy-reference_types-ptparent\";i:0;}","yes"),
("200","wpseo_social","a:20:{s:13:\"facebook_site\";s:0:\"\";s:13:\"instagram_url\";s:0:\"\";s:12:\"linkedin_url\";s:0:\"\";s:11:\"myspace_url\";s:0:\"\";s:16:\"og_default_image\";s:0:\"\";s:19:\"og_default_image_id\";s:0:\"\";s:18:\"og_frontpage_title\";s:0:\"\";s:17:\"og_frontpage_desc\";s:0:\"\";s:18:\"og_frontpage_image\";s:0:\"\";s:21:\"og_frontpage_image_id\";s:0:\"\";s:9:\"opengraph\";b:1;s:13:\"pinterest_url\";s:0:\"\";s:15:\"pinterestverify\";s:0:\"\";s:14:\"plus-publisher\";s:0:\"\";s:7:\"twitter\";b:1;s:12:\"twitter_site\";s:0:\"\";s:17:\"twitter_card_type\";s:19:\"summary_large_image\";s:11:\"youtube_url\";s:0:\"\";s:15:\"google_plus_url\";s:0:\"\";s:10:\"fbadminapp\";s:0:\"\";}","yes"),
("201","wpseo_flush_rewrite","1","yes"),
("202","_transient_timeout_wpseo_link_table_inaccessible","1574084460","no"),
("203","_transient_wpseo_link_table_inaccessible","0","no"),
("204","_transient_timeout_wpseo_meta_table_inaccessible","1574084460","no"),
("205","_transient_wpseo_meta_table_inaccessible","0","no"),
("206","widget_akismet_widget","a:1:{s:12:\"_multiwidget\";i:1;}","yes"),
("207","widget_black-studio-tinymce","a:1:{s:12:\"_multiwidget\";i:1;}","yes"),
("208","widget_polylang","a:1:{s:12:\"_multiwidget\";i:1;}","yes"),
("210","acf_version","5.6.7","yes"),
("212","ac_version","3.3.1","no"),
("213","_transient_timeout_ac-deprecated-message-count","1543153301","no"),
("214","_transient_ac-deprecated-message-count","0","no"),
("215","cpac_options_page__default","a:11:{s:2:\"cb\";s:25:\"<input type=\"checkbox\" />\";s:5:\"title\";s:5:\"Titel\";s:6:\"author\";s:5:\"Autor\";s:8:\"comments\";s:115:\"<span class=\"vers comment-grey-bubble\" title=\"Kommentare\"><span class=\"screen-reader-text\">Kommentare</span></span>\";s:4:\"date\";s:5:\"Datum\";s:11:\"wpseo-links\";s:242:\"<span class=\"yoast-linked-to yoast-column-header-has-tooltip\" data-label=\"Number of internal links in this post. See &quot;Yoast Columns&quot; text in the help tab for more info.\"><span class=\"screen-reader-text\"># links in post</span></span>\";s:11:\"wpseo-score\";s:217:\"<span class=\"yoast-tooltip yoast-tooltip-n yoast-tooltip-alt\" data-label=\"SEO score\"><span class=\"yoast-column-seo-score yoast-column-header-has-tooltip\"><span class=\"screen-reader-text\">SEO score</span></span></span>\";s:23:\"wpseo-score-readability\";s:235:\"<span class=\"yoast-tooltip yoast-tooltip-n yoast-tooltip-alt\" data-label=\"Readability score\"><span class=\"yoast-column-readability yoast-column-header-has-tooltip\"><span class=\"screen-reader-text\">Readability score</span></span></span>\";s:11:\"wpseo-title\";s:9:\"SEO Title\";s:14:\"wpseo-metadesc\";s:10:\"Meta Desc.\";s:13:\"wpseo-focuskw\";s:8:\"Focus KW\";}","no"),
("229","cpac_options_post__default","a:13:{s:2:\"cb\";s:25:\"<input type=\"checkbox\" />\";s:5:\"title\";s:5:\"Titel\";s:6:\"author\";s:5:\"Autor\";s:10:\"categories\";s:10:\"Kategorien\";s:4:\"tags\";s:13:\"Schlagwörter\";s:8:\"comments\";s:115:\"<span class=\"vers comment-grey-bubble\" title=\"Kommentare\"><span class=\"screen-reader-text\">Kommentare</span></span>\";s:4:\"date\";s:5:\"Datum\";s:11:\"wpseo-links\";s:242:\"<span class=\"yoast-linked-to yoast-column-header-has-tooltip\" data-label=\"Number of internal links in this post. See &quot;Yoast Columns&quot; text in the help tab for more info.\"><span class=\"screen-reader-text\"># links in post</span></span>\";s:11:\"wpseo-score\";s:217:\"<span class=\"yoast-tooltip yoast-tooltip-n yoast-tooltip-alt\" data-label=\"SEO score\"><span class=\"yoast-column-seo-score yoast-column-header-has-tooltip\"><span class=\"screen-reader-text\">SEO score</span></span></span>\";s:23:\"wpseo-score-readability\";s:235:\"<span class=\"yoast-tooltip yoast-tooltip-n yoast-tooltip-alt\" data-label=\"Readability score\"><span class=\"yoast-column-readability yoast-column-header-has-tooltip\"><span class=\"screen-reader-text\">Readability score</span></span></span>\";s:11:\"wpseo-title\";s:9:\"SEO Title\";s:14:\"wpseo-metadesc\";s:10:\"Meta Desc.\";s:13:\"wpseo-focuskw\";s:8:\"Focus KW\";}","no"),
("238","category_children","a:0:{}","yes"),
("246","cpac_options_team__default","a:9:{s:2:\"cb\";s:25:\"<input type=\"checkbox\" />\";s:5:\"title\";s:5:\"Titel\";s:4:\"date\";s:5:\"Datum\";s:11:\"wpseo-links\";s:242:\"<span class=\"yoast-linked-to yoast-column-header-has-tooltip\" data-label=\"Number of internal links in this post. See &quot;Yoast Columns&quot; text in the help tab for more info.\"><span class=\"screen-reader-text\"># links in post</span></span>\";s:11:\"wpseo-score\";s:217:\"<span class=\"yoast-tooltip yoast-tooltip-n yoast-tooltip-alt\" data-label=\"SEO score\"><span class=\"yoast-column-seo-score yoast-column-header-has-tooltip\"><span class=\"screen-reader-text\">SEO score</span></span></span>\";s:23:\"wpseo-score-readability\";s:235:\"<span class=\"yoast-tooltip yoast-tooltip-n yoast-tooltip-alt\" data-label=\"Readability score\"><span class=\"yoast-column-readability yoast-column-header-has-tooltip\"><span class=\"screen-reader-text\">Readability score</span></span></span>\";s:11:\"wpseo-title\";s:9:\"SEO Title\";s:14:\"wpseo-metadesc\";s:10:\"Meta Desc.\";s:13:\"wpseo-focuskw\";s:8:\"Focus KW\";}","no"),
("276","cpac_options_wp-users__default","a:6:{s:2:\"cb\";s:25:\"<input type=\"checkbox\" />\";s:8:\"username\";s:12:\"Benutzername\";s:4:\"name\";s:4:\"Name\";s:5:\"email\";s:6:\"E-Mail\";s:4:\"role\";s:5:\"Rolle\";s:5:\"posts\";s:9:\"Beiträge\";}","no"),
("278","cpac_options_wp-media__default","a:7:{s:2:\"cb\";s:25:\"<input type=\"checkbox\" />\";s:5:\"title\";s:5:\"Datei\";s:6:\"author\";s:5:\"Autor\";s:28:\"taxonomy-attachment_category\";s:10:\"Kategorien\";s:6:\"parent\";s:14:\"Hochgeladen zu\";s:8:\"comments\";s:115:\"<span class=\"vers comment-grey-bubble\" title=\"Kommentare\"><span class=\"screen-reader-text\">Kommentare</span></span>\";s:4:\"date\";s:5:\"Datum\";}","no"),
("279","custom_image_sizes","a:2:{s:12:\"medium_large\";a:5:{s:5:\"theme\";s:1:\"1\";s:1:\"w\";s:3:\"768\";s:1:\"h\";s:1:\"0\";s:1:\"n\";s:12:\"medium_large\";s:1:\"c\";s:1:\"0\";}s:14:\"small-carousel\";a:5:{s:5:\"theme\";s:1:\"1\";s:1:\"w\";s:4:\"2000\";s:1:\"h\";s:4:\"1200\";s:1:\"n\";s:14:\"small-carousel\";s:1:\"c\";s:1:\"0\";}}","yes"),
("282","_site_transient_timeout_theme_roots","1543144443","no"),
("283","_site_transient_theme_roots","a:4:{s:9:\"camenisch\";s:7:\"/themes\";s:13:\"twentyfifteen\";s:7:\"/themes\";s:15:\"twentyseventeen\";s:7:\"/themes\";s:13:\"twentysixteen\";s:7:\"/themes\";}","no"),
("285","_site_transient_timeout_browser_fc465cd2e84badeff8d20aca02b56594","1543748355","no"),
("286","_site_transient_browser_fc465cd2e84badeff8d20aca02b56594","a:10:{s:4:\"name\";s:5:\"Opera\";s:7:\"version\";s:13:\"56.0.3051.104\";s:8:\"platform\";s:9:\"Macintosh\";s:10:\"update_url\";s:22:\"https://www.opera.com/\";s:7:\"img_src\";s:42:\"http://s.w.org/images/browsers/opera.png?1\";s:11:\"img_src_ssl\";s:43:\"https://s.w.org/images/browsers/opera.png?1\";s:15:\"current_version\";s:5:\"12.18\";s:7:\"upgrade\";b:0;s:8:\"insecure\";b:0;s:6:\"mobile\";b:0;}","no"),
("289","_site_transient_timeout_community-events-1aecf33ab8525ff212ebdffbb438372e","1543186757","no"),
("290","_site_transient_community-events-1aecf33ab8525ff212ebdffbb438372e","a:2:{s:8:\"location\";a:1:{s:2:\"ip\";s:9:\"127.0.0.0\";}s:6:\"events\";a:2:{i:0;a:7:{s:4:\"type\";s:6:\"meetup\";s:5:\"title\";s:67:\"Lugano WordPress Meetup: \"Prima il logo o prima il sito WordPress?\"\";s:3:\"url\";s:64:\"https://www.meetup.com/Lugano-WordPress-Meetup/events/256269127/\";s:6:\"meetup\";s:23:\"Lugano WordPress Meetup\";s:10:\"meetup_url\";s:47:\"https://www.meetup.com/Lugano-WordPress-Meetup/\";s:4:\"date\";s:19:\"2018-11-28 19:00:00\";s:8:\"location\";a:4:{s:8:\"location\";s:19:\"Lugano, Switzerland\";s:7:\"country\";s:2:\"ch\";s:8:\"latitude\";d:46.007126;s:9:\"longitude\";d:8.9415379999999995;}}i:1;a:7:{s:4:\"type\";s:6:\"meetup\";s:5:\"title\";s:46:\"Weihnachten - Rückblick auf 2018, Pläne 2019\";s:3:\"url\";s:56:\"https://www.meetup.com/WordPress-Baden/events/256643287/\";s:6:\"meetup\";s:22:\"WordPress Meetup Baden\";s:10:\"meetup_url\";s:39:\"https://www.meetup.com/WordPress-Baden/\";s:4:\"date\";s:19:\"2018-12-12 19:00:00\";s:8:\"location\";a:4:{s:8:\"location\";s:22:\"Wettingen, Switzerland\";s:7:\"country\";s:2:\"ch\";s:8:\"latitude\";d:47.467452999999999;s:9:\"longitude\";d:8.3126259999999998;}}}}","no"),
("291","_transient_timeout_plugin_slugs","1543231034","no"),
("292","_transient_plugin_slugs","a:17:{i:0;s:57:\"acf-content-analysis-for-yoast-seo/yoast-acf-analysis.php\";i:1;s:51:\"codepress-admin-columns/codepress-admin-columns.php\";i:2;s:30:\"advanced-custom-fields/acf.php\";i:3;s:27:\"acf-gallery/acf-gallery.php\";i:4;s:29:\"acf-repeater/acf-repeater.php\";i:5;s:34:\"advanced-custom-fields-pro/acf.php\";i:6;s:19:\"akismet/akismet.php\";i:7;s:59:\"black-studio-tinymce-widget/black-studio-tinymce-widget.php\";i:8;s:47:\"email-address-encoder/email-address-encoder.php\";i:9;s:35:\"newsletters-lite/wp-mailinglist.php\";i:10;s:21:\"polylang/polylang.php\";i:11;s:41:\"simple-image-sizes/simple_image_sizes.php\";i:12;s:29:\"svg-complete/svg-complete.php\";i:13;s:37:\"tinymce-advanced/tinymce-advanced.php\";i:14;s:41:\"wordpress-importer/wordpress-importer.php\";i:15;s:56:\"wp-migration-duplicator/webtoffee-wordpress-migrator.php\";i:16;s:24:\"wordpress-seo/wp-seo.php\";}","no"),
("293","_transient_timeout_acf_plugin_info_pro","1543147211","no"),
("294","_transient_acf_plugin_info_pro","a:17:{s:4:\"name\";s:26:\"Advanced Custom Fields PRO\";s:4:\"slug\";s:26:\"advanced-custom-fields-pro\";s:8:\"homepage\";s:37:\"https://www.advancedcustomfields.com/\";s:7:\"version\";s:5:\"5.7.7\";s:6:\"author\";s:13:\"Elliot Condon\";s:10:\"author_url\";s:28:\"http://www.elliotcondon.com/\";s:12:\"contributors\";s:12:\"elliotcondon\";s:8:\"requires\";s:5:\"4.4.0\";s:6:\"tested\";s:5:\"4.9.9\";s:4:\"tags\";a:87:{i:0;s:11:\"5.8.0-beta3\";i:1;s:11:\"5.8.0-beta2\";i:2;s:11:\"5.8.0-beta1\";i:3;s:5:\"5.7.6\";i:4;s:5:\"5.7.5\";i:5;s:5:\"5.7.4\";i:6;s:5:\"5.7.3\";i:7;s:5:\"5.7.2\";i:8;s:5:\"5.7.1\";i:9;s:5:\"5.7.0\";i:10;s:5:\"5.6.9\";i:11;s:5:\"5.6.8\";i:12;s:5:\"5.6.7\";i:13;s:5:\"5.6.6\";i:14;s:5:\"5.6.5\";i:15;s:5:\"5.6.4\";i:16;s:5:\"5.6.3\";i:17;s:5:\"5.6.2\";i:18;s:6:\"5.6.10\";i:19;s:5:\"5.6.1\";i:20;s:11:\"5.6.0-beta2\";i:21;s:11:\"5.6.0-beta1\";i:22;s:9:\"5.6.0-RC2\";i:23;s:9:\"5.6.0-RC1\";i:24;s:5:\"5.6.0\";i:25;s:5:\"5.5.9\";i:26;s:5:\"5.5.7\";i:27;s:5:\"5.5.5\";i:28;s:5:\"5.5.3\";i:29;s:5:\"5.5.2\";i:30;s:6:\"5.5.14\";i:31;s:6:\"5.5.13\";i:32;s:6:\"5.5.12\";i:33;s:6:\"5.5.11\";i:34;s:6:\"5.5.10\";i:35;s:5:\"5.5.1\";i:36;s:5:\"5.5.0\";i:37;s:5:\"5.4.8\";i:38;s:5:\"5.4.7\";i:39;s:5:\"5.4.6\";i:40;s:5:\"5.4.5\";i:41;s:5:\"5.4.4\";i:42;s:5:\"5.4.3\";i:43;s:5:\"5.4.2\";i:44;s:5:\"5.4.1\";i:45;s:5:\"5.4.0\";i:46;s:5:\"5.3.9\";i:47;s:5:\"5.3.8\";i:48;s:5:\"5.3.7\";i:49;s:5:\"5.3.6\";i:50;s:5:\"5.3.5\";i:51;s:5:\"5.3.4\";i:52;s:5:\"5.3.3\";i:53;s:5:\"5.3.2\";i:54;s:6:\"5.3.10\";i:55;s:5:\"5.3.1\";i:56;s:5:\"5.3.0\";i:57;s:5:\"5.2.9\";i:58;s:5:\"5.2.8\";i:59;s:5:\"5.2.7\";i:60;s:5:\"5.2.6\";i:61;s:5:\"5.2.5\";i:62;s:5:\"5.2.4\";i:63;s:5:\"5.2.3\";i:64;s:5:\"5.2.2\";i:65;s:5:\"5.2.1\";i:66;s:5:\"5.2.0\";i:67;s:5:\"5.1.9\";i:68;s:5:\"5.1.8\";i:69;s:5:\"5.1.7\";i:70;s:5:\"5.1.6\";i:71;s:5:\"5.1.5\";i:72;s:5:\"5.1.4\";i:73;s:5:\"5.1.3\";i:74;s:5:\"5.1.2\";i:75;s:5:\"5.1.1\";i:76;s:5:\"5.1.0\";i:77;s:5:\"5.0.9\";i:78;s:5:\"5.0.8\";i:79;s:5:\"5.0.7\";i:80;s:5:\"5.0.6\";i:81;s:5:\"5.0.5\";i:82;s:5:\"5.0.4\";i:83;s:5:\"5.0.3\";i:84;s:5:\"5.0.2\";i:85;s:5:\"5.0.1\";i:86;s:5:\"5.0.0\";}s:6:\"tagged\";s:61:\"acf, advanced, custom, field, fields, form, repeater, content\";s:11:\"description\";s:1353:\"<p>Use the Advanced Custom Fields plugin to take full control of your WordPress edit screens & custom field data.</p>
<p><strong>Add fields on demand.</strong> Our field builder allows you to quickly and easily add fields to WP edit screens with only the click of a few buttons!</p>
<p><strong>Add them anywhere.</strong> Fields can be added all over WP including posts, users, taxonomy terms, media, comments and even custom options pages!</p>
<p><strong>Show them everywhere.</strong> Load and display your custom field values in any theme template file with our hassle free developer friendly functions!</p>
<h4>Features</h4>
<ul>
<li> Simple & Intuitive</li>
<li> Powerful Functions</li>
<li> Over 30 Field Types</li>
<li> Extensive Documentation</li>
<li> Millions of Users</li>
</ul>
<h4>Links</h4>
<ul>
<li> <a href=\"https://www.advancedcustomfields.com\">Website</a></li>
<li> <a href=\"https://www.advancedcustomfields.com/resources/\">Documentation</a></li>
<li> <a href=\"https://support.advancedcustomfields.com\">Support</a></li>
<li> <a href=\"https://www.advancedcustomfields.com/pro/\">ACF PRO</a></li>
</ul>
<h4>PRO</h4>
<p>The Advanced Custom Fields plugin is also available in a professional version which includes more fields, more functionality, and more flexibility! <a href=\"https://www.advancedcustomfields.com/pro/\">Learn more</a></p>
\";s:12:\"installation\";s:508:\"<p>From your WordPress dashboard</p>
<ol>
<li> <strong>Visit</strong> Plugins > Add New</li>
<li> <strong>Search</strong> for \"Advanced Custom Fields\"</li>
<li> <strong>Activate</strong> Advanced Custom Fields from your Plugins page</li>
<li> <strong>Click</strong> on the new menu item \"Custom Fields\" and create your first Custom Field Group!</li>
<li> <strong>Read</strong> the documentation to <a href=\"https://www.advancedcustomfields.com/resources/getting-started-with-acf/\">get started</a></li>
</ol>
\";s:9:\"changelog\";s:5329:\"<h4>5.7.7</h4>
<p><em>Release Date - 1 October 2018</em></p>
<ul>
<li> Fix - Fixed various plugin update issues.</li>
<li> Tweak - Added \'language\' to Google Maps API url.</li>
<li> Dev - Major improvements to the <code>acf.models.Postbox</code> model.</li>
<li> Dev - Added JS filter \'check_screen_args\'.</li>
<li> Dev - Added JS action \'check_screen_complete\'.</li>
<li> Dev - Added action \'acf/options_page/submitbox_before_major_actions\'.</li>
<li> Dev - Added action \'acf/options_page/submitbox_major_actions\'.</li>
<li> i18n - Updated Portuguese language thanks to Pedro Mendonça</li>
</ul>
<h4>5.7.6</h4>
<p><em>Release Date - 12 September 2018</em></p>
<ul>
<li> Fix - Fixed unload prompt not working.</li>
<li> Dev - Reduced number of queries needed to populate the relationship field taxonomy filter.</li>
<li> Dev - Added \'nav_menu_item_id\' and \'nav_menu_item_depth\' to get_field_groups() query.</li>
<li> Dev - Reordered various actions and filters for more usefulness.</li>
<li> i18n - Updated Polish language thanks to Dariusz Zielonka</li>
</ul>
<h4>5.7.5</h4>
<p><em>Release Date - 6 September 2018</em></p>
<ul>
<li> Fix - Fixed bug causing multisite login redirect issues.</li>
<li> Fix - Fixed bug causing validation issues in older versions of Firefox.</li>
<li> Fix - Fixed bug causing duplicate Select2 instances when adding a widget via drag/drop.</li>
<li> Dev - Improved WPML compatibility by using <code>$sitepress->get_current_language()</code> instead of <code>ICL_LANGUAGE_CODE</code>.</li>
<li> Dev - Improved validation JS with new Validator model and logic.</li>
</ul>
<h4>5.7.4</h4>
<p><em>Release Date - 30 August 2018</em></p>
<ul>
<li> Fix - Fixed bug causing field groups to disappear when selecting a taxonomy term with WPML active.</li>
<li> Tweak - Added more Dark Mode styles.</li>
<li> Tweak - Improved DB upgrade prompt, functions and AJAX logic.</li>
<li> Tweak - Improved the \"What\'s New\" admin page seen after DB Upgrade.</li>
<li> Dev - Added new location rules filters.</li>
</ul>
<h4>5.7.3</h4>
<p><em>Release Date - 20 August 2018</em></p>
<ul>
<li> New - Added Dark Mode styles for the <a href=\"https://en-au.wordpress.org/plugins/dark-mode/\">Dark Mode Plugin</a>.</li>
<li> New - Added \"Value Contains\" condition to the Select field type.</li>
<li> New - Added support for the WooCommerce product type dropdown to trigger \"update metaboxes\".</li>
<li> Tweak - Improved acf.screen model responsible for \"updating metaboxes\" when changing post data.</li>
<li> Tweak - Removed user fields from the multisite \"Add New User\" page. </li>
<li> Fix - Fixed bug preventing some tinymce customizations from working.</li>
<li> Fix - Fixed JS bug throwing \"preference\" error in console.</li>
<li> Dev - Added action \'acf/enqueue_uploader\' triggered after the hidden \"ACF Content\" editor is rendered.</li>
</ul>
<h4>5.7.2</h4>
<p><em>Release Date - 6 August 2018</em></p>
<ul>
<li> Fix - Fixed bug preventing the Google Maps Field address from being customized.</li>
<li> Fix - Improved logic to request and cache plugin update information.</li>
<li> Fix - Fixed bug preventing JS initialization when editing widgets in accessibility mode.</li>
<li> Fix - Added missing $parent argument to term_exists() function when adding a new term via taxonomy field popup.</li>
<li> Fix - Fixed bug where nested Group Fields did not delete their values.</li>
<li> Fix - Fixed JS error thrown by localStorage if cookies are not enabled.</li>
<li> Dev - Bumped minimum WP version requirement to 4.4.</li>
<li> Dev - Added action \'wp_nav_menu_item_custom_fields\' for compatibility with other plugins modifying the menu walker class.</li>
<li> Dev - Added \'multiple\' to the allowed attributes for an email field.</li>
<li> Dev - Added new ACF_Ajax class for upcoming features.</li>
</ul>
<h4>5.7.1</h4>
<ul>
<li> Core: Minor fixes and improvements</li>
</ul>
<h4>5.7.0</h4>
<ul>
<li> Core: Major JavaScript updates</li>
<li> Core: Improved conditional logic with new types and more supported fields</li>
<li> Core: Improved localization and internationalization</li>
<li> Repeater field: Improved logic that remembers collapsed row states</li>
<li> Repeater field: Added support to collapse multiple rows (hold shift)</li>
<li> API: Improved lookup to find fields without a reference value</li>
<li> Language: Added Croatian translation - Thanks to Vlado Bosnjak</li>
<li> Language: Updated Italian translation - thanks to Davide Pantè</li>
<li> Language: Updated Romanian translation - thanks to Ionut Staicu</li>
<li> Language: Updated German translation - thanks to Ralf Koller</li>
<li> Language: Updated Arabic translation - thanks to Karim Ramadan</li>
<li> Language: Updated Portuguese translation - thanks to Pedro Mendonça</li>
</ul>
<h4>5.6.10</h4>
<ul>
<li> Core: Minor fixes and improvements</li>
</ul>
<h4>5.6.9</h4>
<ul>
<li> User field: Added new \'Return Format\' setting (Array, Object, ID)</li>
<li> Core: Added basic compatibility with Gutenberg - values now save</li>
<li> Core: Fixed bug affecting the loading of fields on new Menu Items</li>
<li> Core: Removed private (\'show_ui\' => false) post types from the \'Post Type\' location rule choices</li>
<li> Core: Minor fixes and improvements</li>
<li> Language: Updated French translation - thanks to Maxime Bernard-Jacquet</li>
</ul>
\";s:14:\"upgrade_notice\";s:505:\"<h4>5.2.7</h4>
<ul>
<li> Field class names have changed slightly in v5.2.7 from <code>field_type-{$type}</code> to <code>acf-field-{$type}</code>. This change was introduced to better optimize JS performance. The previous class names can be added back in with the following filter: https://www.advancedcustomfields.com/resources/acfcompatibility/</li>
</ul>
<h4>3.0.0</h4>
<ul>
<li> Editor is broken in WordPress 3.3</li>
</ul>
<h4>2.1.4</h4>
<ul>
<li> Adds post_id column back into acf_values</li>
</ul>
\";s:5:\"icons\";a:1:{s:7:\"default\";s:63:\"https://ps.w.org/advanced-custom-fields/assets/icon-256x256.png\";}s:7:\"banners\";a:1:{s:7:\"default\";s:66:\"https://ps.w.org/advanced-custom-fields/assets/banner-1544x500.jpg\";}}","no"),
("295","_site_transient_timeout_available_translations","1543154428","no"),
("296","_site_transient_available_translations","a:113:{s:2:\"af\";a:8:{s:8:\"language\";s:2:\"af\";s:7:\"version\";s:5:\"4.9.8\";s:7:\"updated\";s:19:\"2018-11-17 18:13:01\";s:12:\"english_name\";s:9:\"Afrikaans\";s:11:\"native_name\";s:9:\"Afrikaans\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.9.8/af.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"af\";i:2;s:3:\"afr\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:10:\"Gaan voort\";}}s:2:\"ar\";a:8:{s:8:\"language\";s:2:\"ar\";s:7:\"version\";s:5:\"4.9.8\";s:7:\"updated\";s:19:\"2018-11-22 03:45:21\";s:12:\"english_name\";s:6:\"Arabic\";s:11:\"native_name\";s:14:\"العربية\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.9.8/ar.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ar\";i:2;s:3:\"ara\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:16:\"المتابعة\";}}s:3:\"ary\";a:8:{s:8:\"language\";s:3:\"ary\";s:7:\"version\";s:5:\"4.7.7\";s:7:\"updated\";s:19:\"2017-01-26 15:42:35\";s:12:\"english_name\";s:15:\"Moroccan Arabic\";s:11:\"native_name\";s:31:\"العربية المغربية\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.7.7/ary.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ar\";i:3;s:3:\"ary\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:16:\"المتابعة\";}}s:2:\"as\";a:8:{s:8:\"language\";s:2:\"as\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-11-22 18:59:07\";s:12:\"english_name\";s:8:\"Assamese\";s:11:\"native_name\";s:21:\"অসমীয়া\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.7.2/as.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"as\";i:2;s:3:\"asm\";i:3;s:3:\"asm\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:0:\"\";}}s:3:\"azb\";a:8:{s:8:\"language\";s:3:\"azb\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-09-12 20:34:31\";s:12:\"english_name\";s:17:\"South Azerbaijani\";s:11:\"native_name\";s:29:\"گؤنئی آذربایجان\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.7.2/azb.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"az\";i:3;s:3:\"azb\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:2:\"az\";a:8:{s:8:\"language\";s:2:\"az\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-11-06 00:09:27\";s:12:\"english_name\";s:11:\"Azerbaijani\";s:11:\"native_name\";s:16:\"Azərbaycan dili\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.7.2/az.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"az\";i:2;s:3:\"aze\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:5:\"Davam\";}}s:3:\"bel\";a:8:{s:8:\"language\";s:3:\"bel\";s:7:\"version\";s:5:\"4.9.5\";s:7:\"updated\";s:19:\"2018-04-04 08:43:29\";s:12:\"english_name\";s:10:\"Belarusian\";s:11:\"native_name\";s:29:\"Беларуская мова\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.9.5/bel.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"be\";i:2;s:3:\"bel\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:20:\"Працягнуць\";}}s:5:\"bg_BG\";a:8:{s:8:\"language\";s:5:\"bg_BG\";s:7:\"version\";s:5:\"4.9.8\";s:7:\"updated\";s:19:\"2018-11-05 11:37:23\";s:12:\"english_name\";s:9:\"Bulgarian\";s:11:\"native_name\";s:18:\"Български\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.9.8/bg_BG.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"bg\";i:2;s:3:\"bul\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:12:\"Напред\";}}s:5:\"bn_BD\";a:8:{s:8:\"language\";s:5:\"bn_BD\";s:7:\"version\";s:5:\"4.8.6\";s:7:\"updated\";s:19:\"2017-10-01 12:57:10\";s:12:\"english_name\";s:7:\"Bengali\";s:11:\"native_name\";s:15:\"বাংলা\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.8.6/bn_BD.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"bn\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:23:\"এগিয়ে চল.\";}}s:2:\"bo\";a:8:{s:8:\"language\";s:2:\"bo\";s:7:\"version\";s:5:\"4.9.8\";s:7:\"updated\";s:19:\"2018-11-21 15:34:42\";s:12:\"english_name\";s:7:\"Tibetan\";s:11:\"native_name\";s:21:\"བོད་ཡིག\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.9.8/bo.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"bo\";i:2;s:3:\"tib\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:24:\"མུ་མཐུད།\";}}s:5:\"bs_BA\";a:8:{s:8:\"language\";s:5:\"bs_BA\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-09-04 20:20:28\";s:12:\"english_name\";s:7:\"Bosnian\";s:11:\"native_name\";s:8:\"Bosanski\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.2/bs_BA.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"bs\";i:2;s:3:\"bos\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:7:\"Nastavi\";}}s:2:\"ca\";a:8:{s:8:\"language\";s:2:\"ca\";s:7:\"version\";s:5:\"4.9.8\";s:7:\"updated\";s:19:\"2018-10-29 21:28:23\";s:12:\"english_name\";s:7:\"Catalan\";s:11:\"native_name\";s:7:\"Català\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.9.8/ca.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ca\";i:2;s:3:\"cat\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continua\";}}s:3:\"ceb\";a:8:{s:8:\"language\";s:3:\"ceb\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-03-02 17:25:51\";s:12:\"english_name\";s:7:\"Cebuano\";s:11:\"native_name\";s:7:\"Cebuano\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.7.2/ceb.zip\";s:3:\"iso\";a:2:{i:2;s:3:\"ceb\";i:3;s:3:\"ceb\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:7:\"Padayun\";}}s:5:\"cs_CZ\";a:8:{s:8:\"language\";s:5:\"cs_CZ\";s:7:\"version\";s:5:\"4.9.8\";s:7:\"updated\";s:19:\"2018-10-28 17:08:36\";s:12:\"english_name\";s:5:\"Czech\";s:11:\"native_name\";s:9:\"Čeština\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.9.8/cs_CZ.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"cs\";i:2;s:3:\"ces\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:11:\"Pokračovat\";}}s:2:\"cy\";a:8:{s:8:\"language\";s:2:\"cy\";s:7:\"version\";s:5:\"4.9.8\";s:7:\"updated\";s:19:\"2018-11-14 19:51:46\";s:12:\"english_name\";s:5:\"Welsh\";s:11:\"native_name\";s:7:\"Cymraeg\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.9.8/cy.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"cy\";i:2;s:3:\"cym\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Parhau\";}}s:5:\"da_DK\";a:8:{s:8:\"language\";s:5:\"da_DK\";s:7:\"version\";s:5:\"4.9.7\";s:7:\"updated\";s:19:\"2018-07-06 08:46:24\";s:12:\"english_name\";s:6:\"Danish\";s:11:\"native_name\";s:5:\"Dansk\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.9.7/da_DK.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"da\";i:2;s:3:\"dan\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Fortsæt\";}}s:5:\"de_CH\";a:8:{s:8:\"language\";s:5:\"de_CH\";s:7:\"version\";s:5:\"4.9.8\";s:7:\"updated\";s:19:\"2018-07-28 11:47:36\";s:12:\"english_name\";s:20:\"German (Switzerland)\";s:11:\"native_name\";s:17:\"Deutsch (Schweiz)\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.9.8/de_CH.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"de\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Weiter\";}}s:14:\"de_CH_informal\";a:8:{s:8:\"language\";s:14:\"de_CH_informal\";s:7:\"version\";s:5:\"4.9.8\";s:7:\"updated\";s:19:\"2018-07-28 11:48:22\";s:12:\"english_name\";s:30:\"German (Switzerland, Informal)\";s:11:\"native_name\";s:21:\"Deutsch (Schweiz, Du)\";s:7:\"package\";s:73:\"https://downloads.wordpress.org/translation/core/4.9.8/de_CH_informal.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"de\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Weiter\";}}s:5:\"de_DE\";a:8:{s:8:\"language\";s:5:\"de_DE\";s:7:\"version\";s:5:\"4.9.8\";s:7:\"updated\";s:19:\"2018-11-13 20:39:25\";s:12:\"english_name\";s:6:\"German\";s:11:\"native_name\";s:7:\"Deutsch\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.9.8/de_DE.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"de\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Weiter\";}}s:12:\"de_DE_formal\";a:8:{s:8:\"language\";s:12:\"de_DE_formal\";s:7:\"version\";s:5:\"4.9.8\";s:7:\"updated\";s:19:\"2018-11-13 20:39:12\";s:12:\"english_name\";s:15:\"German (Formal)\";s:11:\"native_name\";s:13:\"Deutsch (Sie)\";s:7:\"package\";s:71:\"https://downloads.wordpress.org/translation/core/4.9.8/de_DE_formal.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"de\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Weiter\";}}s:3:\"dzo\";a:8:{s:8:\"language\";s:3:\"dzo\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-06-29 08:59:03\";s:12:\"english_name\";s:8:\"Dzongkha\";s:11:\"native_name\";s:18:\"རྫོང་ཁ\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.7.2/dzo.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"dz\";i:2;s:3:\"dzo\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:0:\"\";}}s:2:\"el\";a:8:{s:8:\"language\";s:2:\"el\";s:7:\"version\";s:5:\"4.9.8\";s:7:\"updated\";s:19:\"2018-11-13 08:48:48\";s:12:\"english_name\";s:5:\"Greek\";s:11:\"native_name\";s:16:\"Ελληνικά\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.9.8/el.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"el\";i:2;s:3:\"ell\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:16:\"Συνέχεια\";}}s:5:\"en_NZ\";a:8:{s:8:\"language\";s:5:\"en_NZ\";s:7:\"version\";s:5:\"4.9.8\";s:7:\"updated\";s:19:\"2018-10-29 04:07:23\";s:12:\"english_name\";s:21:\"English (New Zealand)\";s:11:\"native_name\";s:21:\"English (New Zealand)\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.9.8/en_NZ.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"en\";i:2;s:3:\"eng\";i:3;s:3:\"eng\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:5:\"en_ZA\";a:8:{s:8:\"language\";s:5:\"en_ZA\";s:7:\"version\";s:5:\"4.9.8\";s:7:\"updated\";s:19:\"2018-09-04 13:34:08\";s:12:\"english_name\";s:22:\"English (South Africa)\";s:11:\"native_name\";s:22:\"English (South Africa)\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.9.8/en_ZA.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"en\";i:2;s:3:\"eng\";i:3;s:3:\"eng\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:5:\"en_AU\";a:8:{s:8:\"language\";s:5:\"en_AU\";s:7:\"version\";s:5:\"4.9.8\";s:7:\"updated\";s:19:\"2018-10-28 23:34:56\";s:12:\"english_name\";s:19:\"English (Australia)\";s:11:\"native_name\";s:19:\"English (Australia)\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.9.8/en_AU.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"en\";i:2;s:3:\"eng\";i:3;s:3:\"eng\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:5:\"en_CA\";a:8:{s:8:\"language\";s:5:\"en_CA\";s:7:\"version\";s:5:\"4.9.8\";s:7:\"updated\";s:19:\"2018-11-01 02:03:58\";s:12:\"english_name\";s:16:\"English (Canada)\";s:11:\"native_name\";s:16:\"English (Canada)\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.9.8/en_CA.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"en\";i:2;s:3:\"eng\";i:3;s:3:\"eng\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:5:\"en_GB\";a:8:{s:8:\"language\";s:5:\"en_GB\";s:7:\"version\";s:5:\"4.9.8\";s:7:\"updated\";s:19:\"2018-10-28 16:14:01\";s:12:\"english_name\";s:12:\"English (UK)\";s:11:\"native_name\";s:12:\"English (UK)\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.9.8/en_GB.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"en\";i:2;s:3:\"eng\";i:3;s:3:\"eng\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:2:\"eo\";a:8:{s:8:\"language\";s:2:\"eo\";s:7:\"version\";s:5:\"4.9.8\";s:7:\"updated\";s:19:\"2018-11-09 14:53:42\";s:12:\"english_name\";s:9:\"Esperanto\";s:11:\"native_name\";s:9:\"Esperanto\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.9.8/eo.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"eo\";i:2;s:3:\"epo\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Daŭrigi\";}}s:5:\"es_VE\";a:8:{s:8:\"language\";s:5:\"es_VE\";s:7:\"version\";s:5:\"4.9.8\";s:7:\"updated\";s:19:\"2018-10-10 17:20:09\";s:12:\"english_name\";s:19:\"Spanish (Venezuela)\";s:11:\"native_name\";s:21:\"Español de Venezuela\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.9.8/es_VE.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"es\";i:2;s:3:\"spa\";i:3;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_CO\";a:8:{s:8:\"language\";s:5:\"es_CO\";s:7:\"version\";s:5:\"4.9.2\";s:7:\"updated\";s:19:\"2017-11-15 23:17:08\";s:12:\"english_name\";s:18:\"Spanish (Colombia)\";s:11:\"native_name\";s:20:\"Español de Colombia\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.9.2/es_CO.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"es\";i:2;s:3:\"spa\";i:3;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_GT\";a:8:{s:8:\"language\";s:5:\"es_GT\";s:7:\"version\";s:5:\"4.9.2\";s:7:\"updated\";s:19:\"2017-11-15 15:03:42\";s:12:\"english_name\";s:19:\"Spanish (Guatemala)\";s:11:\"native_name\";s:21:\"Español de Guatemala\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.9.2/es_GT.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"es\";i:2;s:3:\"spa\";i:3;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_CR\";a:8:{s:8:\"language\";s:5:\"es_CR\";s:7:\"version\";s:5:\"4.8.3\";s:7:\"updated\";s:19:\"2017-10-01 17:54:52\";s:12:\"english_name\";s:20:\"Spanish (Costa Rica)\";s:11:\"native_name\";s:22:\"Español de Costa Rica\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.8.3/es_CR.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"es\";i:2;s:3:\"spa\";i:3;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_PE\";a:8:{s:8:\"language\";s:5:\"es_PE\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-09-09 09:36:22\";s:12:\"english_name\";s:14:\"Spanish (Peru)\";s:11:\"native_name\";s:17:\"Español de Perú\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.2/es_PE.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"es\";i:2;s:3:\"spa\";i:3;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_ES\";a:8:{s:8:\"language\";s:5:\"es_ES\";s:7:\"version\";s:5:\"4.9.8\";s:7:\"updated\";s:19:\"2018-10-28 16:20:18\";s:12:\"english_name\";s:15:\"Spanish (Spain)\";s:11:\"native_name\";s:8:\"Español\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.9.8/es_ES.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"es\";i:2;s:3:\"spa\";i:3;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_CL\";a:8:{s:8:\"language\";s:5:\"es_CL\";s:7:\"version\";s:5:\"4.9.8\";s:7:\"updated\";s:19:\"2018-11-15 15:46:49\";s:12:\"english_name\";s:15:\"Spanish (Chile)\";s:11:\"native_name\";s:17:\"Español de Chile\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.9.8/es_CL.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"es\";i:2;s:3:\"spa\";i:3;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_MX\";a:8:{s:8:\"language\";s:5:\"es_MX\";s:7:\"version\";s:5:\"4.9.8\";s:7:\"updated\";s:19:\"2018-11-15 16:32:57\";s:12:\"english_name\";s:16:\"Spanish (Mexico)\";s:11:\"native_name\";s:19:\"Español de México\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.9.8/es_MX.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"es\";i:2;s:3:\"spa\";i:3;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_AR\";a:8:{s:8:\"language\";s:5:\"es_AR\";s:7:\"version\";s:5:\"4.9.8\";s:7:\"updated\";s:19:\"2018-08-03 20:43:09\";s:12:\"english_name\";s:19:\"Spanish (Argentina)\";s:11:\"native_name\";s:21:\"Español de Argentina\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.9.8/es_AR.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"es\";i:2;s:3:\"spa\";i:3;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:2:\"et\";a:8:{s:8:\"language\";s:2:\"et\";s:7:\"version\";s:5:\"4.9.2\";s:7:\"updated\";s:19:\"2017-11-19 14:11:29\";s:12:\"english_name\";s:8:\"Estonian\";s:11:\"native_name\";s:5:\"Eesti\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.9.2/et.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"et\";i:2;s:3:\"est\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Jätka\";}}s:2:\"eu\";a:8:{s:8:\"language\";s:2:\"eu\";s:7:\"version\";s:5:\"4.9.2\";s:7:\"updated\";s:19:\"2017-12-09 21:12:23\";s:12:\"english_name\";s:6:\"Basque\";s:11:\"native_name\";s:7:\"Euskara\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.9.2/eu.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"eu\";i:2;s:3:\"eus\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Jarraitu\";}}s:5:\"fa_IR\";a:8:{s:8:\"language\";s:5:\"fa_IR\";s:7:\"version\";s:5:\"4.9.8\";s:7:\"updated\";s:19:\"2018-10-04 08:05:41\";s:12:\"english_name\";s:7:\"Persian\";s:11:\"native_name\";s:10:\"فارسی\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.9.8/fa_IR.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"fa\";i:2;s:3:\"fas\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:10:\"ادامه\";}}s:2:\"fi\";a:8:{s:8:\"language\";s:2:\"fi\";s:7:\"version\";s:5:\"4.9.8\";s:7:\"updated\";s:19:\"2018-10-05 07:24:22\";s:12:\"english_name\";s:7:\"Finnish\";s:11:\"native_name\";s:5:\"Suomi\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.9.8/fi.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"fi\";i:2;s:3:\"fin\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:5:\"Jatka\";}}s:5:\"fr_CA\";a:8:{s:8:\"language\";s:5:\"fr_CA\";s:7:\"version\";s:5:\"4.9.8\";s:7:\"updated\";s:19:\"2018-11-08 18:24:55\";s:12:\"english_name\";s:15:\"French (Canada)\";s:11:\"native_name\";s:19:\"Français du Canada\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.9.8/fr_CA.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"fr\";i:2;s:3:\"fra\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuer\";}}s:5:\"fr_BE\";a:8:{s:8:\"language\";s:5:\"fr_BE\";s:7:\"version\";s:5:\"4.9.5\";s:7:\"updated\";s:19:\"2018-01-31 11:16:06\";s:12:\"english_name\";s:16:\"French (Belgium)\";s:11:\"native_name\";s:21:\"Français de Belgique\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.9.5/fr_BE.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"fr\";i:2;s:3:\"fra\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuer\";}}s:5:\"fr_FR\";a:8:{s:8:\"language\";s:5:\"fr_FR\";s:7:\"version\";s:5:\"4.9.8\";s:7:\"updated\";s:19:\"2018-10-28 16:02:42\";s:12:\"english_name\";s:15:\"French (France)\";s:11:\"native_name\";s:9:\"Français\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.9.8/fr_FR.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"fr\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuer\";}}s:3:\"fur\";a:8:{s:8:\"language\";s:3:\"fur\";s:7:\"version\";s:5:\"4.8.6\";s:7:\"updated\";s:19:\"2018-01-29 17:32:35\";s:12:\"english_name\";s:8:\"Friulian\";s:11:\"native_name\";s:8:\"Friulian\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.8.6/fur.zip\";s:3:\"iso\";a:2:{i:2;s:3:\"fur\";i:3;s:3:\"fur\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:2:\"gd\";a:8:{s:8:\"language\";s:2:\"gd\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-08-23 17:41:37\";s:12:\"english_name\";s:15:\"Scottish Gaelic\";s:11:\"native_name\";s:9:\"Gàidhlig\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.7.2/gd.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"gd\";i:2;s:3:\"gla\";i:3;s:3:\"gla\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:15:\"Lean air adhart\";}}s:5:\"gl_ES\";a:8:{s:8:\"language\";s:5:\"gl_ES\";s:7:\"version\";s:5:\"4.9.8\";s:7:\"updated\";s:19:\"2018-11-02 09:10:15\";s:12:\"english_name\";s:8:\"Galician\";s:11:\"native_name\";s:6:\"Galego\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.9.8/gl_ES.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"gl\";i:2;s:3:\"glg\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:2:\"gu\";a:8:{s:8:\"language\";s:2:\"gu\";s:7:\"version\";s:5:\"4.9.8\";s:7:\"updated\";s:19:\"2018-09-14 12:33:48\";s:12:\"english_name\";s:8:\"Gujarati\";s:11:\"native_name\";s:21:\"ગુજરાતી\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.9.8/gu.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"gu\";i:2;s:3:\"guj\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:31:\"ચાલુ રાખવું\";}}s:3:\"haz\";a:8:{s:8:\"language\";s:3:\"haz\";s:7:\"version\";s:5:\"4.4.2\";s:7:\"updated\";s:19:\"2015-12-05 00:59:09\";s:12:\"english_name\";s:8:\"Hazaragi\";s:11:\"native_name\";s:15:\"هزاره گی\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.4.2/haz.zip\";s:3:\"iso\";a:1:{i:3;s:3:\"haz\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:10:\"ادامه\";}}s:5:\"he_IL\";a:8:{s:8:\"language\";s:5:\"he_IL\";s:7:\"version\";s:5:\"4.9.8\";s:7:\"updated\";s:19:\"2018-11-12 20:01:58\";s:12:\"english_name\";s:6:\"Hebrew\";s:11:\"native_name\";s:16:\"עִבְרִית\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.9.8/he_IL.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"he\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"המשך\";}}s:5:\"hi_IN\";a:8:{s:8:\"language\";s:5:\"hi_IN\";s:7:\"version\";s:5:\"4.9.7\";s:7:\"updated\";s:19:\"2018-06-17 09:33:44\";s:12:\"english_name\";s:5:\"Hindi\";s:11:\"native_name\";s:18:\"हिन्दी\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.9.7/hi_IN.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"hi\";i:2;s:3:\"hin\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:12:\"जारी\";}}s:2:\"hr\";a:8:{s:8:\"language\";s:2:\"hr\";s:7:\"version\";s:5:\"4.9.8\";s:7:\"updated\";s:19:\"2018-09-19 09:43:51\";s:12:\"english_name\";s:8:\"Croatian\";s:11:\"native_name\";s:8:\"Hrvatski\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.9.8/hr.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"hr\";i:2;s:3:\"hrv\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:7:\"Nastavi\";}}s:5:\"hu_HU\";a:8:{s:8:\"language\";s:5:\"hu_HU\";s:7:\"version\";s:5:\"4.9.8\";s:7:\"updated\";s:19:\"2018-08-03 10:29:39\";s:12:\"english_name\";s:9:\"Hungarian\";s:11:\"native_name\";s:6:\"Magyar\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.9.8/hu_HU.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"hu\";i:2;s:3:\"hun\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:10:\"Folytatás\";}}s:2:\"hy\";a:8:{s:8:\"language\";s:2:\"hy\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-12-03 16:21:10\";s:12:\"english_name\";s:8:\"Armenian\";s:11:\"native_name\";s:14:\"Հայերեն\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.7.2/hy.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"hy\";i:2;s:3:\"hye\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:20:\"Շարունակել\";}}s:5:\"id_ID\";a:8:{s:8:\"language\";s:5:\"id_ID\";s:7:\"version\";s:5:\"4.9.8\";s:7:\"updated\";s:19:\"2018-07-28 13:16:13\";s:12:\"english_name\";s:10:\"Indonesian\";s:11:\"native_name\";s:16:\"Bahasa Indonesia\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.9.8/id_ID.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"id\";i:2;s:3:\"ind\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Lanjutkan\";}}s:5:\"is_IS\";a:8:{s:8:\"language\";s:5:\"is_IS\";s:7:\"version\";s:6:\"4.7.11\";s:7:\"updated\";s:19:\"2018-09-20 11:13:37\";s:12:\"english_name\";s:9:\"Icelandic\";s:11:\"native_name\";s:9:\"Íslenska\";s:7:\"package\";s:65:\"https://downloads.wordpress.org/translation/core/4.7.11/is_IS.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"is\";i:2;s:3:\"isl\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Áfram\";}}s:5:\"it_IT\";a:8:{s:8:\"language\";s:5:\"it_IT\";s:7:\"version\";s:5:\"4.9.8\";s:7:\"updated\";s:19:\"2018-11-19 15:55:54\";s:12:\"english_name\";s:7:\"Italian\";s:11:\"native_name\";s:8:\"Italiano\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.9.8/it_IT.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"it\";i:2;s:3:\"ita\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continua\";}}s:2:\"ja\";a:8:{s:8:\"language\";s:2:\"ja\";s:7:\"version\";s:5:\"4.9.8\";s:7:\"updated\";s:19:\"2018-11-01 10:30:44\";s:12:\"english_name\";s:8:\"Japanese\";s:11:\"native_name\";s:9:\"日本語\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.9.8/ja.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"ja\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"続ける\";}}s:5:\"jv_ID\";a:8:{s:8:\"language\";s:5:\"jv_ID\";s:7:\"version\";s:5:\"4.9.5\";s:7:\"updated\";s:19:\"2018-03-24 13:53:29\";s:12:\"english_name\";s:8:\"Javanese\";s:11:\"native_name\";s:9:\"Basa Jawa\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.9.5/jv_ID.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"jv\";i:2;s:3:\"jav\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Nerusaké\";}}s:5:\"ka_GE\";a:8:{s:8:\"language\";s:5:\"ka_GE\";s:7:\"version\";s:5:\"4.9.8\";s:7:\"updated\";s:19:\"2018-11-02 06:28:35\";s:12:\"english_name\";s:8:\"Georgian\";s:11:\"native_name\";s:21:\"ქართული\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.9.8/ka_GE.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ka\";i:2;s:3:\"kat\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:30:\"გაგრძელება\";}}s:3:\"kab\";a:8:{s:8:\"language\";s:3:\"kab\";s:7:\"version\";s:5:\"4.9.8\";s:7:\"updated\";s:19:\"2018-09-21 14:15:57\";s:12:\"english_name\";s:6:\"Kabyle\";s:11:\"native_name\";s:9:\"Taqbaylit\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.9.8/kab.zip\";s:3:\"iso\";a:2:{i:2;s:3:\"kab\";i:3;s:3:\"kab\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Kemmel\";}}s:2:\"kk\";a:8:{s:8:\"language\";s:2:\"kk\";s:7:\"version\";s:5:\"4.9.5\";s:7:\"updated\";s:19:\"2018-03-12 08:08:32\";s:12:\"english_name\";s:6:\"Kazakh\";s:11:\"native_name\";s:19:\"Қазақ тілі\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.9.5/kk.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"kk\";i:2;s:3:\"kaz\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:20:\"Жалғастыру\";}}s:2:\"km\";a:8:{s:8:\"language\";s:2:\"km\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-12-07 02:07:59\";s:12:\"english_name\";s:5:\"Khmer\";s:11:\"native_name\";s:27:\"ភាសាខ្មែរ\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.7.2/km.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"km\";i:2;s:3:\"khm\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:12:\"បន្ត\";}}s:5:\"ko_KR\";a:8:{s:8:\"language\";s:5:\"ko_KR\";s:7:\"version\";s:5:\"4.9.8\";s:7:\"updated\";s:19:\"2018-11-22 02:28:45\";s:12:\"english_name\";s:6:\"Korean\";s:11:\"native_name\";s:9:\"한국어\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.9.8/ko_KR.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ko\";i:2;s:3:\"kor\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"계속\";}}s:3:\"ckb\";a:8:{s:8:\"language\";s:3:\"ckb\";s:7:\"version\";s:5:\"4.9.8\";s:7:\"updated\";s:19:\"2018-10-28 17:12:13\";s:12:\"english_name\";s:16:\"Kurdish (Sorani)\";s:11:\"native_name\";s:13:\"كوردی‎\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.9.8/ckb.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ku\";i:3;s:3:\"ckb\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:30:\"به‌رده‌وام به‌\";}}s:2:\"lo\";a:8:{s:8:\"language\";s:2:\"lo\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-11-12 09:59:23\";s:12:\"english_name\";s:3:\"Lao\";s:11:\"native_name\";s:21:\"ພາສາລາວ\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.7.2/lo.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"lo\";i:2;s:3:\"lao\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:18:\"ຕໍ່​ໄປ\";}}s:5:\"lt_LT\";a:8:{s:8:\"language\";s:5:\"lt_LT\";s:7:\"version\";s:5:\"4.9.8\";s:7:\"updated\";s:19:\"2018-11-13 21:42:46\";s:12:\"english_name\";s:10:\"Lithuanian\";s:11:\"native_name\";s:15:\"Lietuvių kalba\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.9.8/lt_LT.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"lt\";i:2;s:3:\"lit\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Tęsti\";}}s:2:\"lv\";a:8:{s:8:\"language\";s:2:\"lv\";s:7:\"version\";s:5:\"4.7.7\";s:7:\"updated\";s:19:\"2017-03-17 20:40:40\";s:12:\"english_name\";s:7:\"Latvian\";s:11:\"native_name\";s:16:\"Latviešu valoda\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.7.7/lv.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"lv\";i:2;s:3:\"lav\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Turpināt\";}}s:5:\"mk_MK\";a:8:{s:8:\"language\";s:5:\"mk_MK\";s:7:\"version\";s:5:\"4.7.7\";s:7:\"updated\";s:19:\"2017-01-26 15:54:41\";s:12:\"english_name\";s:10:\"Macedonian\";s:11:\"native_name\";s:31:\"Македонски јазик\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.7/mk_MK.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"mk\";i:2;s:3:\"mkd\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:16:\"Продолжи\";}}s:5:\"ml_IN\";a:8:{s:8:\"language\";s:5:\"ml_IN\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2017-01-27 03:43:32\";s:12:\"english_name\";s:9:\"Malayalam\";s:11:\"native_name\";s:18:\"മലയാളം\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.2/ml_IN.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ml\";i:2;s:3:\"mal\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:18:\"തുടരുക\";}}s:2:\"mn\";a:8:{s:8:\"language\";s:2:\"mn\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2017-01-12 07:29:35\";s:12:\"english_name\";s:9:\"Mongolian\";s:11:\"native_name\";s:12:\"Монгол\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.7.2/mn.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"mn\";i:2;s:3:\"mon\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:24:\"Үргэлжлүүлэх\";}}s:2:\"mr\";a:8:{s:8:\"language\";s:2:\"mr\";s:7:\"version\";s:5:\"4.8.6\";s:7:\"updated\";s:19:\"2018-02-13 07:38:55\";s:12:\"english_name\";s:7:\"Marathi\";s:11:\"native_name\";s:15:\"मराठी\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.8.6/mr.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"mr\";i:2;s:3:\"mar\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:25:\"सुरु ठेवा\";}}s:5:\"ms_MY\";a:8:{s:8:\"language\";s:5:\"ms_MY\";s:7:\"version\";s:5:\"4.9.8\";s:7:\"updated\";s:19:\"2018-08-30 20:27:25\";s:12:\"english_name\";s:5:\"Malay\";s:11:\"native_name\";s:13:\"Bahasa Melayu\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.9.8/ms_MY.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ms\";i:2;s:3:\"msa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Teruskan\";}}s:5:\"my_MM\";a:8:{s:8:\"language\";s:5:\"my_MM\";s:7:\"version\";s:6:\"4.1.20\";s:7:\"updated\";s:19:\"2015-03-26 15:57:42\";s:12:\"english_name\";s:17:\"Myanmar (Burmese)\";s:11:\"native_name\";s:15:\"ဗမာစာ\";s:7:\"package\";s:65:\"https://downloads.wordpress.org/translation/core/4.1.20/my_MM.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"my\";i:2;s:3:\"mya\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:54:\"ဆက်လက်လုပ်ဆောင်ပါ။\";}}s:5:\"nb_NO\";a:8:{s:8:\"language\";s:5:\"nb_NO\";s:7:\"version\";s:5:\"4.9.8\";s:7:\"updated\";s:19:\"2018-11-11 00:57:26\";s:12:\"english_name\";s:19:\"Norwegian (Bokmål)\";s:11:\"native_name\";s:13:\"Norsk bokmål\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.9.8/nb_NO.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"nb\";i:2;s:3:\"nob\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Fortsett\";}}s:5:\"ne_NP\";a:8:{s:8:\"language\";s:5:\"ne_NP\";s:7:\"version\";s:5:\"4.9.5\";s:7:\"updated\";s:19:\"2018-03-27 10:30:26\";s:12:\"english_name\";s:6:\"Nepali\";s:11:\"native_name\";s:18:\"नेपाली\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.9.5/ne_NP.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ne\";i:2;s:3:\"nep\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:43:\"जारी राख्नुहोस्\";}}s:12:\"nl_NL_formal\";a:8:{s:8:\"language\";s:12:\"nl_NL_formal\";s:7:\"version\";s:5:\"4.9.8\";s:7:\"updated\";s:19:\"2018-10-29 08:41:27\";s:12:\"english_name\";s:14:\"Dutch (Formal)\";s:11:\"native_name\";s:20:\"Nederlands (Formeel)\";s:7:\"package\";s:71:\"https://downloads.wordpress.org/translation/core/4.9.8/nl_NL_formal.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"nl\";i:2;s:3:\"nld\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Doorgaan\";}}s:5:\"nl_NL\";a:8:{s:8:\"language\";s:5:\"nl_NL\";s:7:\"version\";s:5:\"4.9.8\";s:7:\"updated\";s:19:\"2018-10-29 08:41:56\";s:12:\"english_name\";s:5:\"Dutch\";s:11:\"native_name\";s:10:\"Nederlands\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.9.8/nl_NL.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"nl\";i:2;s:3:\"nld\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Doorgaan\";}}s:5:\"nl_BE\";a:8:{s:8:\"language\";s:5:\"nl_BE\";s:7:\"version\";s:5:\"4.9.8\";s:7:\"updated\";s:19:\"2018-09-18 11:11:49\";s:12:\"english_name\";s:15:\"Dutch (Belgium)\";s:11:\"native_name\";s:20:\"Nederlands (België)\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.9.8/nl_BE.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"nl\";i:2;s:3:\"nld\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Doorgaan\";}}s:5:\"nn_NO\";a:8:{s:8:\"language\";s:5:\"nn_NO\";s:7:\"version\";s:5:\"4.9.8\";s:7:\"updated\";s:19:\"2018-11-10 17:50:37\";s:12:\"english_name\";s:19:\"Norwegian (Nynorsk)\";s:11:\"native_name\";s:13:\"Norsk nynorsk\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.9.8/nn_NO.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"nn\";i:2;s:3:\"nno\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Hald fram\";}}s:3:\"oci\";a:8:{s:8:\"language\";s:3:\"oci\";s:7:\"version\";s:5:\"4.8.3\";s:7:\"updated\";s:19:\"2017-08-25 10:03:08\";s:12:\"english_name\";s:7:\"Occitan\";s:11:\"native_name\";s:7:\"Occitan\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.8.3/oci.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"oc\";i:2;s:3:\"oci\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Contunhar\";}}s:5:\"pa_IN\";a:8:{s:8:\"language\";s:5:\"pa_IN\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2017-01-16 05:19:43\";s:12:\"english_name\";s:7:\"Punjabi\";s:11:\"native_name\";s:18:\"ਪੰਜਾਬੀ\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.2/pa_IN.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"pa\";i:2;s:3:\"pan\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:25:\"ਜਾਰੀ ਰੱਖੋ\";}}s:5:\"pl_PL\";a:8:{s:8:\"language\";s:5:\"pl_PL\";s:7:\"version\";s:5:\"4.9.8\";s:7:\"updated\";s:19:\"2018-11-21 07:25:37\";s:12:\"english_name\";s:6:\"Polish\";s:11:\"native_name\";s:6:\"Polski\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.9.8/pl_PL.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"pl\";i:2;s:3:\"pol\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Kontynuuj\";}}s:2:\"ps\";a:8:{s:8:\"language\";s:2:\"ps\";s:7:\"version\";s:6:\"4.1.20\";s:7:\"updated\";s:19:\"2015-03-29 22:19:48\";s:12:\"english_name\";s:6:\"Pashto\";s:11:\"native_name\";s:8:\"پښتو\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.1.20/ps.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ps\";i:2;s:3:\"pus\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:19:\"دوام ورکړه\";}}s:5:\"pt_BR\";a:8:{s:8:\"language\";s:5:\"pt_BR\";s:7:\"version\";s:5:\"4.9.8\";s:7:\"updated\";s:19:\"2018-11-05 14:41:09\";s:12:\"english_name\";s:19:\"Portuguese (Brazil)\";s:11:\"native_name\";s:20:\"Português do Brasil\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.9.8/pt_BR.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"pt\";i:2;s:3:\"por\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"pt_PT\";a:8:{s:8:\"language\";s:5:\"pt_PT\";s:7:\"version\";s:5:\"4.9.8\";s:7:\"updated\";s:19:\"2018-11-11 01:38:20\";s:12:\"english_name\";s:21:\"Portuguese (Portugal)\";s:11:\"native_name\";s:10:\"Português\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.9.8/pt_PT.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"pt\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:10:\"pt_PT_ao90\";a:8:{s:8:\"language\";s:10:\"pt_PT_ao90\";s:7:\"version\";s:5:\"4.9.5\";s:7:\"updated\";s:19:\"2018-03-09 09:30:48\";s:12:\"english_name\";s:27:\"Portuguese (Portugal, AO90)\";s:11:\"native_name\";s:17:\"Português (AO90)\";s:7:\"package\";s:69:\"https://downloads.wordpress.org/translation/core/4.9.5/pt_PT_ao90.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"pt\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:3:\"rhg\";a:8:{s:8:\"language\";s:3:\"rhg\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-03-16 13:03:18\";s:12:\"english_name\";s:8:\"Rohingya\";s:11:\"native_name\";s:8:\"Ruáinga\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.7.2/rhg.zip\";s:3:\"iso\";a:1:{i:3;s:3:\"rhg\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:0:\"\";}}s:5:\"ro_RO\";a:8:{s:8:\"language\";s:5:\"ro_RO\";s:7:\"version\";s:5:\"4.9.8\";s:7:\"updated\";s:19:\"2018-11-01 17:58:21\";s:12:\"english_name\";s:8:\"Romanian\";s:11:\"native_name\";s:8:\"Română\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.9.8/ro_RO.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ro\";i:2;s:3:\"ron\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuă\";}}s:5:\"ru_RU\";a:8:{s:8:\"language\";s:5:\"ru_RU\";s:7:\"version\";s:5:\"4.9.8\";s:7:\"updated\";s:19:\"2018-10-28 16:21:25\";s:12:\"english_name\";s:7:\"Russian\";s:11:\"native_name\";s:14:\"Русский\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.9.8/ru_RU.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ru\";i:2;s:3:\"rus\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:20:\"Продолжить\";}}s:3:\"sah\";a:8:{s:8:\"language\";s:3:\"sah\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2017-01-21 02:06:41\";s:12:\"english_name\";s:5:\"Sakha\";s:11:\"native_name\";s:14:\"Сахалыы\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.7.2/sah.zip\";s:3:\"iso\";a:2:{i:2;s:3:\"sah\";i:3;s:3:\"sah\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:12:\"Салҕаа\";}}s:5:\"si_LK\";a:8:{s:8:\"language\";s:5:\"si_LK\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-11-12 06:00:52\";s:12:\"english_name\";s:7:\"Sinhala\";s:11:\"native_name\";s:15:\"සිංහල\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.2/si_LK.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"si\";i:2;s:3:\"sin\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:44:\"දිගටම කරගෙන යන්න\";}}s:5:\"sk_SK\";a:8:{s:8:\"language\";s:5:\"sk_SK\";s:7:\"version\";s:5:\"4.9.8\";s:7:\"updated\";s:19:\"2018-10-31 08:30:58\";s:12:\"english_name\";s:6:\"Slovak\";s:11:\"native_name\";s:11:\"Slovenčina\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.9.8/sk_SK.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"sk\";i:2;s:3:\"slk\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:12:\"Pokračovať\";}}s:5:\"sl_SI\";a:8:{s:8:\"language\";s:5:\"sl_SI\";s:7:\"version\";s:5:\"4.9.2\";s:7:\"updated\";s:19:\"2018-01-04 13:33:13\";s:12:\"english_name\";s:9:\"Slovenian\";s:11:\"native_name\";s:13:\"Slovenščina\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.9.2/sl_SI.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"sl\";i:2;s:3:\"slv\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Nadaljuj\";}}s:2:\"sq\";a:8:{s:8:\"language\";s:2:\"sq\";s:7:\"version\";s:5:\"4.9.8\";s:7:\"updated\";s:19:\"2018-11-01 13:20:12\";s:12:\"english_name\";s:8:\"Albanian\";s:11:\"native_name\";s:5:\"Shqip\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.9.8/sq.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"sq\";i:2;s:3:\"sqi\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Vazhdo\";}}s:5:\"sr_RS\";a:8:{s:8:\"language\";s:5:\"sr_RS\";s:7:\"version\";s:5:\"4.9.8\";s:7:\"updated\";s:19:\"2018-08-02 20:59:54\";s:12:\"english_name\";s:7:\"Serbian\";s:11:\"native_name\";s:23:\"Српски језик\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.9.8/sr_RS.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"sr\";i:2;s:3:\"srp\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:14:\"Настави\";}}s:5:\"sv_SE\";a:8:{s:8:\"language\";s:5:\"sv_SE\";s:7:\"version\";s:5:\"4.9.8\";s:7:\"updated\";s:19:\"2018-10-28 15:35:13\";s:12:\"english_name\";s:7:\"Swedish\";s:11:\"native_name\";s:7:\"Svenska\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.9.8/sv_SE.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"sv\";i:2;s:3:\"swe\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Fortsätt\";}}s:3:\"szl\";a:8:{s:8:\"language\";s:3:\"szl\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-09-24 19:58:14\";s:12:\"english_name\";s:8:\"Silesian\";s:11:\"native_name\";s:17:\"Ślōnskŏ gŏdka\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.7.2/szl.zip\";s:3:\"iso\";a:1:{i:3;s:3:\"szl\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:13:\"Kōntynuować\";}}s:5:\"ta_IN\";a:8:{s:8:\"language\";s:5:\"ta_IN\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2017-01-27 03:22:47\";s:12:\"english_name\";s:5:\"Tamil\";s:11:\"native_name\";s:15:\"தமிழ்\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.2/ta_IN.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ta\";i:2;s:3:\"tam\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:24:\"தொடரவும்\";}}s:2:\"te\";a:8:{s:8:\"language\";s:2:\"te\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2017-01-26 15:47:39\";s:12:\"english_name\";s:6:\"Telugu\";s:11:\"native_name\";s:18:\"తెలుగు\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.7.2/te.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"te\";i:2;s:3:\"tel\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:30:\"కొనసాగించు\";}}s:2:\"th\";a:8:{s:8:\"language\";s:2:\"th\";s:7:\"version\";s:5:\"4.9.5\";s:7:\"updated\";s:19:\"2018-03-02 17:08:41\";s:12:\"english_name\";s:4:\"Thai\";s:11:\"native_name\";s:9:\"ไทย\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.9.5/th.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"th\";i:2;s:3:\"tha\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:15:\"ต่อไป\";}}s:2:\"tl\";a:8:{s:8:\"language\";s:2:\"tl\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-12-30 02:38:08\";s:12:\"english_name\";s:7:\"Tagalog\";s:11:\"native_name\";s:7:\"Tagalog\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.7.2/tl.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"tl\";i:2;s:3:\"tgl\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:10:\"Magpatuloy\";}}s:5:\"tr_TR\";a:8:{s:8:\"language\";s:5:\"tr_TR\";s:7:\"version\";s:5:\"4.9.8\";s:7:\"updated\";s:19:\"2018-11-07 21:08:54\";s:12:\"english_name\";s:7:\"Turkish\";s:11:\"native_name\";s:8:\"Türkçe\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.9.8/tr_TR.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"tr\";i:2;s:3:\"tur\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:5:\"Devam\";}}s:5:\"tt_RU\";a:8:{s:8:\"language\";s:5:\"tt_RU\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-11-20 20:20:50\";s:12:\"english_name\";s:5:\"Tatar\";s:11:\"native_name\";s:19:\"Татар теле\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.2/tt_RU.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"tt\";i:2;s:3:\"tat\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:17:\"дәвам итү\";}}s:3:\"tah\";a:8:{s:8:\"language\";s:3:\"tah\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-03-06 18:39:39\";s:12:\"english_name\";s:8:\"Tahitian\";s:11:\"native_name\";s:10:\"Reo Tahiti\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.7.2/tah.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"ty\";i:2;s:3:\"tah\";i:3;s:3:\"tah\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:0:\"\";}}s:5:\"ug_CN\";a:8:{s:8:\"language\";s:5:\"ug_CN\";s:7:\"version\";s:5:\"4.9.5\";s:7:\"updated\";s:19:\"2018-04-12 12:31:53\";s:12:\"english_name\";s:6:\"Uighur\";s:11:\"native_name\";s:16:\"ئۇيغۇرچە\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.9.5/ug_CN.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ug\";i:2;s:3:\"uig\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:26:\"داۋاملاشتۇرۇش\";}}s:2:\"uk\";a:8:{s:8:\"language\";s:2:\"uk\";s:7:\"version\";s:5:\"4.9.8\";s:7:\"updated\";s:19:\"2018-10-29 07:32:40\";s:12:\"english_name\";s:9:\"Ukrainian\";s:11:\"native_name\";s:20:\"Українська\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.9.8/uk.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"uk\";i:2;s:3:\"ukr\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:20:\"Продовжити\";}}s:2:\"ur\";a:8:{s:8:\"language\";s:2:\"ur\";s:7:\"version\";s:5:\"4.9.8\";s:7:\"updated\";s:19:\"2018-10-06 08:37:04\";s:12:\"english_name\";s:4:\"Urdu\";s:11:\"native_name\";s:8:\"اردو\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.9.8/ur.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ur\";i:2;s:3:\"urd\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:19:\"جاری رکھیں\";}}s:5:\"uz_UZ\";a:8:{s:8:\"language\";s:5:\"uz_UZ\";s:7:\"version\";s:5:\"4.9.8\";s:7:\"updated\";s:19:\"2018-10-11 06:46:15\";s:12:\"english_name\";s:5:\"Uzbek\";s:11:\"native_name\";s:11:\"O‘zbekcha\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.9.8/uz_UZ.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"uz\";i:2;s:3:\"uzb\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:11:\"Davom etish\";}}s:2:\"vi\";a:8:{s:8:\"language\";s:2:\"vi\";s:7:\"version\";s:5:\"4.9.8\";s:7:\"updated\";s:19:\"2018-11-06 02:26:39\";s:12:\"english_name\";s:10:\"Vietnamese\";s:11:\"native_name\";s:14:\"Tiếng Việt\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.9.8/vi.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"vi\";i:2;s:3:\"vie\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:12:\"Tiếp tục\";}}s:5:\"zh_TW\";a:8:{s:8:\"language\";s:5:\"zh_TW\";s:7:\"version\";s:5:\"4.9.8\";s:7:\"updated\";s:19:\"2018-11-19 20:31:12\";s:12:\"english_name\";s:16:\"Chinese (Taiwan)\";s:11:\"native_name\";s:12:\"繁體中文\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.9.8/zh_TW.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"zh\";i:2;s:3:\"zho\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"繼續\";}}s:5:\"zh_HK\";a:8:{s:8:\"language\";s:5:\"zh_HK\";s:7:\"version\";s:5:\"4.9.5\";s:7:\"updated\";s:19:\"2018-04-09 00:56:52\";s:12:\"english_name\";s:19:\"Chinese (Hong Kong)\";s:11:\"native_name\";s:16:\"香港中文版	\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.9.5/zh_HK.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"zh\";i:2;s:3:\"zho\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"繼續\";}}s:5:\"zh_CN\";a:8:{s:8:\"language\";s:5:\"zh_CN\";s:7:\"version\";s:5:\"4.9.2\";s:7:\"updated\";s:19:\"2017-11-17 22:20:52\";s:12:\"english_name\";s:15:\"Chinese (China)\";s:11:\"native_name\";s:12:\"简体中文\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.9.2/zh_CN.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"zh\";i:2;s:3:\"zho\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"继续\";}}}","no"),
("297","_site_transient_timeout_poptags_40cd750bba9870f18aada2478b24840a","1543154475","no"),
("298","_site_transient_poptags_40cd750bba9870f18aada2478b24840a","O:8:\"stdClass\":100:{s:6:\"widget\";a:3:{s:4:\"name\";s:6:\"widget\";s:4:\"slug\";s:6:\"widget\";s:5:\"count\";i:4526;}s:11:\"woocommerce\";a:3:{s:4:\"name\";s:11:\"woocommerce\";s:4:\"slug\";s:11:\"woocommerce\";s:5:\"count\";i:3142;}s:4:\"post\";a:3:{s:4:\"name\";s:4:\"post\";s:4:\"slug\";s:4:\"post\";s:5:\"count\";i:2600;}s:5:\"admin\";a:3:{s:4:\"name\";s:5:\"admin\";s:4:\"slug\";s:5:\"admin\";s:5:\"count\";i:2459;}s:5:\"posts\";a:3:{s:4:\"name\";s:5:\"posts\";s:4:\"slug\";s:5:\"posts\";s:5:\"count\";i:1889;}s:9:\"shortcode\";a:3:{s:4:\"name\";s:9:\"shortcode\";s:4:\"slug\";s:9:\"shortcode\";s:5:\"count\";i:1696;}s:8:\"comments\";a:3:{s:4:\"name\";s:8:\"comments\";s:4:\"slug\";s:8:\"comments\";s:5:\"count\";i:1688;}s:7:\"twitter\";a:3:{s:4:\"name\";s:7:\"twitter\";s:4:\"slug\";s:7:\"twitter\";s:5:\"count\";i:1459;}s:6:\"google\";a:3:{s:4:\"name\";s:6:\"google\";s:4:\"slug\";s:6:\"google\";s:5:\"count\";i:1411;}s:8:\"facebook\";a:3:{s:4:\"name\";s:8:\"facebook\";s:4:\"slug\";s:8:\"facebook\";s:5:\"count\";i:1410;}s:6:\"images\";a:3:{s:4:\"name\";s:6:\"images\";s:4:\"slug\";s:6:\"images\";s:5:\"count\";i:1410;}s:5:\"image\";a:3:{s:4:\"name\";s:5:\"image\";s:4:\"slug\";s:5:\"image\";s:5:\"count\";i:1340;}s:7:\"sidebar\";a:3:{s:4:\"name\";s:7:\"sidebar\";s:4:\"slug\";s:7:\"sidebar\";s:5:\"count\";i:1286;}s:3:\"seo\";a:3:{s:4:\"name\";s:3:\"seo\";s:4:\"slug\";s:3:\"seo\";s:5:\"count\";i:1263;}s:7:\"gallery\";a:3:{s:4:\"name\";s:7:\"gallery\";s:4:\"slug\";s:7:\"gallery\";s:5:\"count\";i:1121;}s:4:\"page\";a:3:{s:4:\"name\";s:4:\"page\";s:4:\"slug\";s:4:\"page\";s:5:\"count\";i:1080;}s:5:\"email\";a:3:{s:4:\"name\";s:5:\"email\";s:4:\"slug\";s:5:\"email\";s:5:\"count\";i:1061;}s:6:\"social\";a:3:{s:4:\"name\";s:6:\"social\";s:4:\"slug\";s:6:\"social\";s:5:\"count\";i:1044;}s:9:\"ecommerce\";a:3:{s:4:\"name\";s:9:\"ecommerce\";s:4:\"slug\";s:9:\"ecommerce\";s:5:\"count\";i:954;}s:5:\"login\";a:3:{s:4:\"name\";s:5:\"login\";s:4:\"slug\";s:5:\"login\";s:5:\"count\";i:904;}s:5:\"links\";a:3:{s:4:\"name\";s:5:\"links\";s:4:\"slug\";s:5:\"links\";s:5:\"count\";i:837;}s:7:\"widgets\";a:3:{s:4:\"name\";s:7:\"widgets\";s:4:\"slug\";s:7:\"widgets\";s:5:\"count\";i:822;}s:5:\"video\";a:3:{s:4:\"name\";s:5:\"video\";s:4:\"slug\";s:5:\"video\";s:5:\"count\";i:811;}s:8:\"security\";a:3:{s:4:\"name\";s:8:\"security\";s:4:\"slug\";s:8:\"security\";s:5:\"count\";i:745;}s:7:\"content\";a:3:{s:4:\"name\";s:7:\"content\";s:4:\"slug\";s:7:\"content\";s:5:\"count\";i:714;}s:4:\"spam\";a:3:{s:4:\"name\";s:4:\"spam\";s:4:\"slug\";s:4:\"spam\";s:5:\"count\";i:703;}s:10:\"buddypress\";a:3:{s:4:\"name\";s:10:\"buddypress\";s:4:\"slug\";s:10:\"buddypress\";s:5:\"count\";i:700;}s:6:\"slider\";a:3:{s:4:\"name\";s:6:\"slider\";s:4:\"slug\";s:6:\"slider\";s:5:\"count\";i:693;}s:3:\"rss\";a:3:{s:4:\"name\";s:3:\"rss\";s:4:\"slug\";s:3:\"rss\";s:5:\"count\";i:689;}s:10:\"e-commerce\";a:3:{s:4:\"name\";s:10:\"e-commerce\";s:4:\"slug\";s:10:\"e-commerce\";s:5:\"count\";i:674;}s:5:\"pages\";a:3:{s:4:\"name\";s:5:\"pages\";s:4:\"slug\";s:5:\"pages\";s:5:\"count\";i:670;}s:9:\"analytics\";a:3:{s:4:\"name\";s:9:\"analytics\";s:4:\"slug\";s:9:\"analytics\";s:5:\"count\";i:668;}s:5:\"media\";a:3:{s:4:\"name\";s:5:\"media\";s:4:\"slug\";s:5:\"media\";s:5:\"count\";i:652;}s:6:\"jquery\";a:3:{s:4:\"name\";s:6:\"jquery\";s:4:\"slug\";s:6:\"jquery\";s:5:\"count\";i:647;}s:4:\"form\";a:3:{s:4:\"name\";s:4:\"form\";s:4:\"slug\";s:4:\"form\";s:5:\"count\";i:629;}s:6:\"search\";a:3:{s:4:\"name\";s:6:\"search\";s:4:\"slug\";s:6:\"search\";s:5:\"count\";i:627;}s:4:\"feed\";a:3:{s:4:\"name\";s:4:\"feed\";s:4:\"slug\";s:4:\"feed\";s:5:\"count\";i:620;}s:4:\"ajax\";a:3:{s:4:\"name\";s:4:\"ajax\";s:4:\"slug\";s:4:\"ajax\";s:5:\"count\";i:608;}s:4:\"menu\";a:3:{s:4:\"name\";s:4:\"menu\";s:4:\"slug\";s:4:\"menu\";s:5:\"count\";i:605;}s:8:\"category\";a:3:{s:4:\"name\";s:8:\"category\";s:4:\"slug\";s:8:\"category\";s:5:\"count\";i:604;}s:5:\"embed\";a:3:{s:4:\"name\";s:5:\"embed\";s:4:\"slug\";s:5:\"embed\";s:5:\"count\";i:574;}s:10:\"javascript\";a:3:{s:4:\"name\";s:10:\"javascript\";s:4:\"slug\";s:10:\"javascript\";s:5:\"count\";i:558;}s:3:\"css\";a:3:{s:4:\"name\";s:3:\"css\";s:4:\"slug\";s:3:\"css\";s:5:\"count\";i:549;}s:4:\"link\";a:3:{s:4:\"name\";s:4:\"link\";s:4:\"slug\";s:4:\"link\";s:5:\"count\";i:548;}s:7:\"youtube\";a:3:{s:4:\"name\";s:7:\"youtube\";s:4:\"slug\";s:7:\"youtube\";s:5:\"count\";i:539;}s:6:\"editor\";a:3:{s:4:\"name\";s:6:\"editor\";s:4:\"slug\";s:6:\"editor\";s:5:\"count\";i:535;}s:5:\"share\";a:3:{s:4:\"name\";s:5:\"share\";s:4:\"slug\";s:5:\"share\";s:5:\"count\";i:528;}s:5:\"theme\";a:3:{s:4:\"name\";s:5:\"theme\";s:4:\"slug\";s:5:\"theme\";s:5:\"count\";i:519;}s:7:\"comment\";a:3:{s:4:\"name\";s:7:\"comment\";s:4:\"slug\";s:7:\"comment\";s:5:\"count\";i:518;}s:10:\"responsive\";a:3:{s:4:\"name\";s:10:\"responsive\";s:4:\"slug\";s:10:\"responsive\";s:5:\"count\";i:512;}s:12:\"contact-form\";a:3:{s:4:\"name\";s:12:\"contact form\";s:4:\"slug\";s:12:\"contact-form\";s:5:\"count\";i:512;}s:9:\"dashboard\";a:3:{s:4:\"name\";s:9:\"dashboard\";s:4:\"slug\";s:9:\"dashboard\";s:5:\"count\";i:503;}s:6:\"custom\";a:3:{s:4:\"name\";s:6:\"custom\";s:4:\"slug\";s:6:\"custom\";s:5:\"count\";i:494;}s:10:\"categories\";a:3:{s:4:\"name\";s:10:\"categories\";s:4:\"slug\";s:10:\"categories\";s:5:\"count\";i:492;}s:9:\"affiliate\";a:3:{s:4:\"name\";s:9:\"affiliate\";s:4:\"slug\";s:9:\"affiliate\";s:5:\"count\";i:489;}s:3:\"ads\";a:3:{s:4:\"name\";s:3:\"ads\";s:4:\"slug\";s:3:\"ads\";s:5:\"count\";i:482;}s:4:\"tags\";a:3:{s:4:\"name\";s:4:\"tags\";s:4:\"slug\";s:4:\"tags\";s:5:\"count\";i:467;}s:6:\"button\";a:3:{s:4:\"name\";s:6:\"button\";s:4:\"slug\";s:6:\"button\";s:5:\"count\";i:465;}s:4:\"user\";a:3:{s:4:\"name\";s:4:\"user\";s:4:\"slug\";s:4:\"user\";s:5:\"count\";i:460;}s:7:\"contact\";a:3:{s:4:\"name\";s:7:\"contact\";s:4:\"slug\";s:7:\"contact\";s:5:\"count\";i:454;}s:6:\"mobile\";a:3:{s:4:\"name\";s:6:\"mobile\";s:4:\"slug\";s:6:\"mobile\";s:5:\"count\";i:449;}s:3:\"api\";a:3:{s:4:\"name\";s:3:\"api\";s:4:\"slug\";s:3:\"api\";s:5:\"count\";i:441;}s:7:\"payment\";a:3:{s:4:\"name\";s:7:\"payment\";s:4:\"slug\";s:7:\"payment\";s:5:\"count\";i:438;}s:5:\"users\";a:3:{s:4:\"name\";s:5:\"users\";s:4:\"slug\";s:5:\"users\";s:5:\"count\";i:427;}s:5:\"photo\";a:3:{s:4:\"name\";s:5:\"photo\";s:4:\"slug\";s:5:\"photo\";s:5:\"count\";i:425;}s:5:\"stats\";a:3:{s:4:\"name\";s:5:\"stats\";s:4:\"slug\";s:5:\"stats\";s:5:\"count\";i:418;}s:6:\"events\";a:3:{s:4:\"name\";s:6:\"events\";s:4:\"slug\";s:6:\"events\";s:5:\"count\";i:418;}s:9:\"slideshow\";a:3:{s:4:\"name\";s:9:\"slideshow\";s:4:\"slug\";s:9:\"slideshow\";s:5:\"count\";i:417;}s:6:\"photos\";a:3:{s:4:\"name\";s:6:\"photos\";s:4:\"slug\";s:6:\"photos\";s:5:\"count\";i:411;}s:10:\"navigation\";a:3:{s:4:\"name\";s:10:\"navigation\";s:4:\"slug\";s:10:\"navigation\";s:5:\"count\";i:398;}s:10:\"statistics\";a:3:{s:4:\"name\";s:10:\"statistics\";s:4:\"slug\";s:10:\"statistics\";s:5:\"count\";i:390;}s:15:\"payment-gateway\";a:3:{s:4:\"name\";s:15:\"payment gateway\";s:4:\"slug\";s:15:\"payment-gateway\";s:5:\"count\";i:386;}s:8:\"calendar\";a:3:{s:4:\"name\";s:8:\"calendar\";s:4:\"slug\";s:8:\"calendar\";s:5:\"count\";i:378;}s:4:\"news\";a:3:{s:4:\"name\";s:4:\"news\";s:4:\"slug\";s:4:\"news\";s:5:\"count\";i:372;}s:4:\"chat\";a:3:{s:4:\"name\";s:4:\"chat\";s:4:\"slug\";s:4:\"chat\";s:5:\"count\";i:371;}s:10:\"shortcodes\";a:3:{s:4:\"name\";s:10:\"shortcodes\";s:4:\"slug\";s:10:\"shortcodes\";s:5:\"count\";i:371;}s:5:\"popup\";a:3:{s:4:\"name\";s:5:\"popup\";s:4:\"slug\";s:5:\"popup\";s:5:\"count\";i:370;}s:9:\"marketing\";a:3:{s:4:\"name\";s:9:\"marketing\";s:4:\"slug\";s:9:\"marketing\";s:5:\"count\";i:369;}s:12:\"social-media\";a:3:{s:4:\"name\";s:12:\"social media\";s:4:\"slug\";s:12:\"social-media\";s:5:\"count\";i:356;}s:7:\"plugins\";a:3:{s:4:\"name\";s:7:\"plugins\";s:4:\"slug\";s:7:\"plugins\";s:5:\"count\";i:355;}s:9:\"multisite\";a:3:{s:4:\"name\";s:9:\"multisite\";s:4:\"slug\";s:9:\"multisite\";s:5:\"count\";i:353;}s:10:\"newsletter\";a:3:{s:4:\"name\";s:10:\"newsletter\";s:4:\"slug\";s:10:\"newsletter\";s:5:\"count\";i:353;}s:4:\"code\";a:3:{s:4:\"name\";s:4:\"code\";s:4:\"slug\";s:4:\"code\";s:5:\"count\";i:345;}s:4:\"meta\";a:3:{s:4:\"name\";s:4:\"meta\";s:4:\"slug\";s:4:\"meta\";s:5:\"count\";i:343;}s:3:\"url\";a:3:{s:4:\"name\";s:3:\"url\";s:4:\"slug\";s:3:\"url\";s:5:\"count\";i:341;}s:4:\"list\";a:3:{s:4:\"name\";s:4:\"list\";s:4:\"slug\";s:4:\"list\";s:5:\"count\";i:338;}s:5:\"forms\";a:3:{s:4:\"name\";s:5:\"forms\";s:4:\"slug\";s:5:\"forms\";s:5:\"count\";i:336;}s:8:\"redirect\";a:3:{s:4:\"name\";s:8:\"redirect\";s:4:\"slug\";s:8:\"redirect\";s:5:\"count\";i:333;}s:11:\"advertising\";a:3:{s:4:\"name\";s:11:\"advertising\";s:4:\"slug\";s:11:\"advertising\";s:5:\"count\";i:316;}s:12:\"notification\";a:3:{s:4:\"name\";s:12:\"notification\";s:4:\"slug\";s:12:\"notification\";s:5:\"count\";i:314;}s:11:\"performance\";a:3:{s:4:\"name\";s:11:\"performance\";s:4:\"slug\";s:11:\"performance\";s:5:\"count\";i:314;}s:6:\"simple\";a:3:{s:4:\"name\";s:6:\"simple\";s:4:\"slug\";s:6:\"simple\";s:5:\"count\";i:310;}s:16:\"custom-post-type\";a:3:{s:4:\"name\";s:16:\"custom post type\";s:4:\"slug\";s:16:\"custom-post-type\";s:5:\"count\";i:309;}s:16:\"google-analytics\";a:3:{s:4:\"name\";s:16:\"google analytics\";s:4:\"slug\";s:16:\"google-analytics\";s:5:\"count\";i:306;}s:4:\"html\";a:3:{s:4:\"name\";s:4:\"html\";s:4:\"slug\";s:4:\"html\";s:5:\"count\";i:306;}s:3:\"tag\";a:3:{s:4:\"name\";s:3:\"tag\";s:4:\"slug\";s:3:\"tag\";s:5:\"count\";i:305;}s:8:\"tracking\";a:3:{s:4:\"name\";s:8:\"tracking\";s:4:\"slug\";s:8:\"tracking\";s:5:\"count\";i:304;}s:14:\"contact-form-7\";a:3:{s:4:\"name\";s:14:\"contact form 7\";s:4:\"slug\";s:14:\"contact-form-7\";s:5:\"count\";i:304;}s:7:\"adsense\";a:3:{s:4:\"name\";s:7:\"adsense\";s:4:\"slug\";s:7:\"adsense\";s:5:\"count\";i:303;}s:6:\"author\";a:3:{s:4:\"name\";s:6:\"author\";s:4:\"slug\";s:6:\"author\";s:5:\"count\";i:300;}}","no"),
("301","duplicator_settings","a:10:{s:7:\"version\";s:6:\"1.2.52\";s:18:\"uninstall_settings\";b:1;s:15:\"uninstall_files\";b:1;s:16:\"uninstall_tables\";b:1;s:13:\"package_debug\";b:0;s:17:\"package_mysqldump\";b:1;s:22:\"package_mysqldump_path\";s:0:\"\";s:24:\"package_phpdump_qrylimit\";s:3:\"100\";s:17:\"package_zip_flush\";b:0;s:20:\"storage_htaccess_off\";b:0;}","yes"),
("302","duplicator_version_plugin","1.2.52","yes"),
("304","_transient_timeout_acf_plugin_updates","1543230339","no"),
("305","_transient_acf_plugin_updates","a:3:{s:7:\"plugins\";a:1:{s:34:\"advanced-custom-fields-pro/acf.php\";a:8:{s:4:\"slug\";s:26:\"advanced-custom-fields-pro\";s:6:\"plugin\";s:34:\"advanced-custom-fields-pro/acf.php\";s:11:\"new_version\";s:5:\"5.7.7\";s:3:\"url\";s:37:\"https://www.advancedcustomfields.com/\";s:6:\"tested\";s:5:\"4.9.9\";s:7:\"package\";s:0:\"\";s:5:\"icons\";a:1:{s:7:\"default\";s:63:\"https://ps.w.org/advanced-custom-fields/assets/icon-256x256.png\";}s:7:\"banners\";a:1:{s:7:\"default\";s:66:\"https://ps.w.org/advanced-custom-fields/assets/banner-1544x500.jpg\";}}}s:10:\"expiration\";i:86400;s:6:\"status\";i:1;}","no"),
("308","duplicator_ui_view_state","a:2:{s:27:\"dup-settings-diag-srv-panel\";s:1:\"1\";s:28:\"dup-settings-diag-opts-panel\";s:1:\"0\";}","yes"),
("309","rewrite_rules","a:96:{s:19:\"sitemap_index\\.xml$\";s:19:\"index.php?sitemap=1\";s:31:\"([^/]+?)-sitemap([0-9]+)?\\.xml$\";s:51:\"index.php?sitemap=$matches[1]&sitemap_n=$matches[2]\";s:24:\"([a-z]+)?-?sitemap\\.xsl$\";s:25:\"index.php?xsl=$matches[1]\";s:11:\"^wp-json/?$\";s:22:\"index.php?rest_route=/\";s:14:\"^wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:21:\"^index.php/wp-json/?$\";s:22:\"index.php?rest_route=/\";s:24:\"^index.php/wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:47:\"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:42:\"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:23:\"category/(.+?)/embed/?$\";s:46:\"index.php?category_name=$matches[1]&embed=true\";s:35:\"category/(.+?)/page/?([0-9]{1,})/?$\";s:53:\"index.php?category_name=$matches[1]&paged=$matches[2]\";s:17:\"category/(.+?)/?$\";s:35:\"index.php?category_name=$matches[1]\";s:44:\"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:39:\"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:20:\"tag/([^/]+)/embed/?$\";s:36:\"index.php?tag=$matches[1]&embed=true\";s:32:\"tag/([^/]+)/page/?([0-9]{1,})/?$\";s:43:\"index.php?tag=$matches[1]&paged=$matches[2]\";s:14:\"tag/([^/]+)/?$\";s:25:\"index.php?tag=$matches[1]\";s:45:\"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:40:\"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:21:\"type/([^/]+)/embed/?$\";s:44:\"index.php?post_format=$matches[1]&embed=true\";s:33:\"type/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?post_format=$matches[1]&paged=$matches[2]\";s:15:\"type/([^/]+)/?$\";s:33:\"index.php?post_format=$matches[1]\";s:60:\"attachment_category/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:58:\"index.php?attachment_category=$matches[1]&feed=$matches[2]\";s:55:\"attachment_category/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:58:\"index.php?attachment_category=$matches[1]&feed=$matches[2]\";s:36:\"attachment_category/([^/]+)/embed/?$\";s:52:\"index.php?attachment_category=$matches[1]&embed=true\";s:48:\"attachment_category/([^/]+)/page/?([0-9]{1,})/?$\";s:59:\"index.php?attachment_category=$matches[1]&paged=$matches[2]\";s:30:\"attachment_category/([^/]+)/?$\";s:41:\"index.php?attachment_category=$matches[1]\";s:12:\"robots\\.txt$\";s:18:\"index.php?robots=1\";s:48:\".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$\";s:18:\"index.php?feed=old\";s:20:\".*wp-app\\.php(/.*)?$\";s:19:\"index.php?error=403\";s:18:\".*wp-register.php$\";s:23:\"index.php?register=true\";s:32:\"feed/(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:27:\"(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:8:\"embed/?$\";s:21:\"index.php?&embed=true\";s:20:\"page/?([0-9]{1,})/?$\";s:28:\"index.php?&paged=$matches[1]\";s:27:\"comment-page-([0-9]{1,})/?$\";s:38:\"index.php?&page_id=5&cpage=$matches[1]\";s:41:\"comments/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:36:\"comments/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:17:\"comments/embed/?$\";s:21:\"index.php?&embed=true\";s:44:\"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:39:\"search/(.+)/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:20:\"search/(.+)/embed/?$\";s:34:\"index.php?s=$matches[1]&embed=true\";s:32:\"search/(.+)/page/?([0-9]{1,})/?$\";s:41:\"index.php?s=$matches[1]&paged=$matches[2]\";s:14:\"search/(.+)/?$\";s:23:\"index.php?s=$matches[1]\";s:47:\"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:42:\"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:23:\"author/([^/]+)/embed/?$\";s:44:\"index.php?author_name=$matches[1]&embed=true\";s:35:\"author/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?author_name=$matches[1]&paged=$matches[2]\";s:17:\"author/([^/]+)/?$\";s:33:\"index.php?author_name=$matches[1]\";s:69:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:45:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/embed/?$\";s:74:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&embed=true\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]\";s:39:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$\";s:63:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]\";s:56:\"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:51:\"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:32:\"([0-9]{4})/([0-9]{1,2})/embed/?$\";s:58:\"index.php?year=$matches[1]&monthnum=$matches[2]&embed=true\";s:44:\"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]\";s:26:\"([0-9]{4})/([0-9]{1,2})/?$\";s:47:\"index.php?year=$matches[1]&monthnum=$matches[2]\";s:43:\"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:38:\"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:19:\"([0-9]{4})/embed/?$\";s:37:\"index.php?year=$matches[1]&embed=true\";s:31:\"([0-9]{4})/page/?([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&paged=$matches[2]\";s:13:\"([0-9]{4})/?$\";s:26:\"index.php?year=$matches[1]\";s:27:\".?.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\".?.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\".?.+?/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:16:\"(.?.+?)/embed/?$\";s:41:\"index.php?pagename=$matches[1]&embed=true\";s:20:\"(.?.+?)/trackback/?$\";s:35:\"index.php?pagename=$matches[1]&tb=1\";s:40:\"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:35:\"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:28:\"(.?.+?)/page/?([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&paged=$matches[2]\";s:35:\"(.?.+?)/comment-page-([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&cpage=$matches[2]\";s:24:\"(.?.+?)(?:/([0-9]+))?/?$\";s:47:\"index.php?pagename=$matches[1]&page=$matches[2]\";s:27:\"[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\"[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\"[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\"[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\"[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\"[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:16:\"([^/]+)/embed/?$\";s:37:\"index.php?name=$matches[1]&embed=true\";s:20:\"([^/]+)/trackback/?$\";s:31:\"index.php?name=$matches[1]&tb=1\";s:40:\"([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?name=$matches[1]&feed=$matches[2]\";s:35:\"([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?name=$matches[1]&feed=$matches[2]\";s:28:\"([^/]+)/page/?([0-9]{1,})/?$\";s:44:\"index.php?name=$matches[1]&paged=$matches[2]\";s:35:\"([^/]+)/comment-page-([0-9]{1,})/?$\";s:44:\"index.php?name=$matches[1]&cpage=$matches[2]\";s:24:\"([^/]+)(?:/([0-9]+))?/?$\";s:43:\"index.php?name=$matches[1]&page=$matches[2]\";s:16:\"[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:26:\"[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:46:\"[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:41:\"[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:41:\"[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:22:\"[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";}","yes"),
("311","_site_transient_update_plugins","O:8:\"stdClass\":5:{s:12:\"last_checked\";i:1543144531;s:7:\"checked\";a:17:{s:57:\"acf-content-analysis-for-yoast-seo/yoast-acf-analysis.php\";s:5:\"2.1.0\";s:51:\"codepress-admin-columns/codepress-admin-columns.php\";s:5:\"3.3.1\";s:30:\"advanced-custom-fields/acf.php\";s:5:\"5.7.7\";s:27:\"acf-gallery/acf-gallery.php\";s:5:\"2.1.0\";s:29:\"acf-repeater/acf-repeater.php\";s:5:\"2.1.0\";s:34:\"advanced-custom-fields-pro/acf.php\";s:5:\"5.6.7\";s:19:\"akismet/akismet.php\";s:3:\"4.1\";s:59:\"black-studio-tinymce-widget/black-studio-tinymce-widget.php\";s:5:\"2.6.3\";s:47:\"email-address-encoder/email-address-encoder.php\";s:5:\"1.0.9\";s:35:\"newsletters-lite/wp-mailinglist.php\";s:6:\"4.6.11\";s:21:\"polylang/polylang.php\";s:3:\"2.4\";s:41:\"simple-image-sizes/simple_image_sizes.php\";s:5:\"3.2.0\";s:29:\"svg-complete/svg-complete.php\";s:5:\"1.0.2\";s:37:\"tinymce-advanced/tinymce-advanced.php\";s:5:\"4.8.0\";s:41:\"wordpress-importer/wordpress-importer.php\";s:5:\"0.6.4\";s:56:\"wp-migration-duplicator/webtoffee-wordpress-migrator.php\";s:5:\"1.0.6\";s:24:\"wordpress-seo/wp-seo.php\";s:5:\"9.2.1\";}s:8:\"response\";a:1:{s:34:\"advanced-custom-fields-pro/acf.php\";O:8:\"stdClass\":8:{s:4:\"slug\";s:26:\"advanced-custom-fields-pro\";s:6:\"plugin\";s:34:\"advanced-custom-fields-pro/acf.php\";s:11:\"new_version\";s:5:\"5.7.7\";s:3:\"url\";s:37:\"https://www.advancedcustomfields.com/\";s:6:\"tested\";s:5:\"4.9.9\";s:7:\"package\";s:0:\"\";s:5:\"icons\";a:1:{s:7:\"default\";s:63:\"https://ps.w.org/advanced-custom-fields/assets/icon-256x256.png\";}s:7:\"banners\";a:1:{s:7:\"default\";s:66:\"https://ps.w.org/advanced-custom-fields/assets/banner-1544x500.jpg\";}}}s:12:\"translations\";a:0:{}s:9:\"no_update\";a:14:{s:57:\"acf-content-analysis-for-yoast-seo/yoast-acf-analysis.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:48:\"w.org/plugins/acf-content-analysis-for-yoast-seo\";s:4:\"slug\";s:34:\"acf-content-analysis-for-yoast-seo\";s:6:\"plugin\";s:57:\"acf-content-analysis-for-yoast-seo/yoast-acf-analysis.php\";s:11:\"new_version\";s:5:\"2.1.0\";s:3:\"url\";s:65:\"https://wordpress.org/plugins/acf-content-analysis-for-yoast-seo/\";s:7:\"package\";s:83:\"https://downloads.wordpress.org/plugin/acf-content-analysis-for-yoast-seo.2.1.0.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:87:\"https://ps.w.org/acf-content-analysis-for-yoast-seo/assets/icon-256x256.png?rev=1717503\";s:2:\"1x\";s:87:\"https://ps.w.org/acf-content-analysis-for-yoast-seo/assets/icon-128x128.png?rev=1717503\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:90:\"https://ps.w.org/acf-content-analysis-for-yoast-seo/assets/banner-1544x500.png?rev=1717503\";s:2:\"1x\";s:89:\"https://ps.w.org/acf-content-analysis-for-yoast-seo/assets/banner-772x250.png?rev=1717503\";}s:11:\"banners_rtl\";a:0:{}}s:51:\"codepress-admin-columns/codepress-admin-columns.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:37:\"w.org/plugins/codepress-admin-columns\";s:4:\"slug\";s:23:\"codepress-admin-columns\";s:6:\"plugin\";s:51:\"codepress-admin-columns/codepress-admin-columns.php\";s:11:\"new_version\";s:5:\"3.3.1\";s:3:\"url\";s:54:\"https://wordpress.org/plugins/codepress-admin-columns/\";s:7:\"package\";s:72:\"https://downloads.wordpress.org/plugin/codepress-admin-columns.3.3.1.zip\";s:5:\"icons\";a:3:{s:2:\"2x\";s:76:\"https://ps.w.org/codepress-admin-columns/assets/icon-256x256.png?rev=1521754\";s:2:\"1x\";s:68:\"https://ps.w.org/codepress-admin-columns/assets/icon.svg?rev=1521754\";s:3:\"svg\";s:68:\"https://ps.w.org/codepress-admin-columns/assets/icon.svg?rev=1521754\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:79:\"https://ps.w.org/codepress-admin-columns/assets/banner-1544x500.png?rev=1220017\";s:2:\"1x\";s:78:\"https://ps.w.org/codepress-admin-columns/assets/banner-772x250.png?rev=1220017\";}s:11:\"banners_rtl\";a:0:{}}s:30:\"advanced-custom-fields/acf.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:36:\"w.org/plugins/advanced-custom-fields\";s:4:\"slug\";s:22:\"advanced-custom-fields\";s:6:\"plugin\";s:30:\"advanced-custom-fields/acf.php\";s:11:\"new_version\";s:5:\"5.7.7\";s:3:\"url\";s:53:\"https://wordpress.org/plugins/advanced-custom-fields/\";s:7:\"package\";s:71:\"https://downloads.wordpress.org/plugin/advanced-custom-fields.5.7.7.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:75:\"https://ps.w.org/advanced-custom-fields/assets/icon-256x256.png?rev=1082746\";s:2:\"1x\";s:75:\"https://ps.w.org/advanced-custom-fields/assets/icon-128x128.png?rev=1082746\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:78:\"https://ps.w.org/advanced-custom-fields/assets/banner-1544x500.jpg?rev=1729099\";s:2:\"1x\";s:77:\"https://ps.w.org/advanced-custom-fields/assets/banner-772x250.jpg?rev=1729102\";}s:11:\"banners_rtl\";a:0:{}}s:19:\"akismet/akismet.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:21:\"w.org/plugins/akismet\";s:4:\"slug\";s:7:\"akismet\";s:6:\"plugin\";s:19:\"akismet/akismet.php\";s:11:\"new_version\";s:3:\"4.1\";s:3:\"url\";s:38:\"https://wordpress.org/plugins/akismet/\";s:7:\"package\";s:54:\"https://downloads.wordpress.org/plugin/akismet.4.1.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:59:\"https://ps.w.org/akismet/assets/icon-256x256.png?rev=969272\";s:2:\"1x\";s:59:\"https://ps.w.org/akismet/assets/icon-128x128.png?rev=969272\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:61:\"https://ps.w.org/akismet/assets/banner-772x250.jpg?rev=479904\";}s:11:\"banners_rtl\";a:0:{}}s:59:\"black-studio-tinymce-widget/black-studio-tinymce-widget.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:41:\"w.org/plugins/black-studio-tinymce-widget\";s:4:\"slug\";s:27:\"black-studio-tinymce-widget\";s:6:\"plugin\";s:59:\"black-studio-tinymce-widget/black-studio-tinymce-widget.php\";s:11:\"new_version\";s:5:\"2.6.3\";s:3:\"url\";s:58:\"https://wordpress.org/plugins/black-studio-tinymce-widget/\";s:7:\"package\";s:76:\"https://downloads.wordpress.org/plugin/black-studio-tinymce-widget.2.6.3.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:80:\"https://ps.w.org/black-studio-tinymce-widget/assets/icon-256x256.png?rev=1002774\";s:2:\"1x\";s:80:\"https://ps.w.org/black-studio-tinymce-widget/assets/icon-128x128.png?rev=1002774\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:83:\"https://ps.w.org/black-studio-tinymce-widget/assets/banner-1544x500.png?rev=1002774\";s:2:\"1x\";s:82:\"https://ps.w.org/black-studio-tinymce-widget/assets/banner-772x250.png?rev=1002774\";}s:11:\"banners_rtl\";a:0:{}}s:47:\"email-address-encoder/email-address-encoder.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:35:\"w.org/plugins/email-address-encoder\";s:4:\"slug\";s:21:\"email-address-encoder\";s:6:\"plugin\";s:47:\"email-address-encoder/email-address-encoder.php\";s:11:\"new_version\";s:5:\"1.0.9\";s:3:\"url\";s:52:\"https://wordpress.org/plugins/email-address-encoder/\";s:7:\"package\";s:70:\"https://downloads.wordpress.org/plugin/email-address-encoder.1.0.9.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:73:\"https://ps.w.org/email-address-encoder/assets/icon-256x256.jpg?rev=970206\";s:2:\"1x\";s:73:\"https://ps.w.org/email-address-encoder/assets/icon-128x128.jpg?rev=970206\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:76:\"https://ps.w.org/email-address-encoder/assets/banner-1544x500.jpg?rev=970206\";s:2:\"1x\";s:75:\"https://ps.w.org/email-address-encoder/assets/banner-772x250.jpg?rev=970206\";}s:11:\"banners_rtl\";a:0:{}}s:35:\"newsletters-lite/wp-mailinglist.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:30:\"w.org/plugins/newsletters-lite\";s:4:\"slug\";s:16:\"newsletters-lite\";s:6:\"plugin\";s:35:\"newsletters-lite/wp-mailinglist.php\";s:11:\"new_version\";s:6:\"4.6.11\";s:3:\"url\";s:47:\"https://wordpress.org/plugins/newsletters-lite/\";s:7:\"package\";s:66:\"https://downloads.wordpress.org/plugin/newsletters-lite.4.6.11.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:69:\"https://ps.w.org/newsletters-lite/assets/icon-256x256.png?rev=1184265\";s:2:\"1x\";s:69:\"https://ps.w.org/newsletters-lite/assets/icon-128x128.png?rev=1184265\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:72:\"https://ps.w.org/newsletters-lite/assets/banner-1544x500.png?rev=1609783\";s:2:\"1x\";s:71:\"https://ps.w.org/newsletters-lite/assets/banner-772x250.png?rev=1609783\";}s:11:\"banners_rtl\";a:0:{}}s:21:\"polylang/polylang.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:22:\"w.org/plugins/polylang\";s:4:\"slug\";s:8:\"polylang\";s:6:\"plugin\";s:21:\"polylang/polylang.php\";s:11:\"new_version\";s:3:\"2.4\";s:3:\"url\";s:39:\"https://wordpress.org/plugins/polylang/\";s:7:\"package\";s:55:\"https://downloads.wordpress.org/plugin/polylang.2.4.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:61:\"https://ps.w.org/polylang/assets/icon-256x256.png?rev=1331499\";s:2:\"1x\";s:61:\"https://ps.w.org/polylang/assets/icon-128x128.png?rev=1331499\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:64:\"https://ps.w.org/polylang/assets/banner-1544x500.png?rev=1405299\";s:2:\"1x\";s:63:\"https://ps.w.org/polylang/assets/banner-772x250.png?rev=1405299\";}s:11:\"banners_rtl\";a:0:{}}s:41:\"simple-image-sizes/simple_image_sizes.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:32:\"w.org/plugins/simple-image-sizes\";s:4:\"slug\";s:18:\"simple-image-sizes\";s:6:\"plugin\";s:41:\"simple-image-sizes/simple_image_sizes.php\";s:11:\"new_version\";s:5:\"3.2.0\";s:3:\"url\";s:49:\"https://wordpress.org/plugins/simple-image-sizes/\";s:7:\"package\";s:67:\"https://downloads.wordpress.org/plugin/simple-image-sizes.3.2.0.zip\";s:5:\"icons\";a:1:{s:7:\"default\";s:69:\"https://s.w.org/plugins/geopattern-icon/simple-image-sizes_ecedf0.svg\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:73:\"https://ps.w.org/simple-image-sizes/assets/banner-772x250.jpg?rev=1818193\";}s:11:\"banners_rtl\";a:0:{}}s:29:\"svg-complete/svg-complete.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:26:\"w.org/plugins/svg-complete\";s:4:\"slug\";s:12:\"svg-complete\";s:6:\"plugin\";s:29:\"svg-complete/svg-complete.php\";s:11:\"new_version\";s:5:\"1.0.2\";s:3:\"url\";s:43:\"https://wordpress.org/plugins/svg-complete/\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/plugin/svg-complete.1.0.2.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:65:\"https://ps.w.org/svg-complete/assets/icon-256x256.jpg?rev=1090634\";s:2:\"1x\";s:65:\"https://ps.w.org/svg-complete/assets/icon-128x128.jpg?rev=1090634\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:67:\"https://ps.w.org/svg-complete/assets/banner-772x250.jpg?rev=1090631\";}s:11:\"banners_rtl\";a:0:{}}s:37:\"tinymce-advanced/tinymce-advanced.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:30:\"w.org/plugins/tinymce-advanced\";s:4:\"slug\";s:16:\"tinymce-advanced\";s:6:\"plugin\";s:37:\"tinymce-advanced/tinymce-advanced.php\";s:11:\"new_version\";s:5:\"4.8.0\";s:3:\"url\";s:47:\"https://wordpress.org/plugins/tinymce-advanced/\";s:7:\"package\";s:65:\"https://downloads.wordpress.org/plugin/tinymce-advanced.4.8.0.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:68:\"https://ps.w.org/tinymce-advanced/assets/icon-256x256.png?rev=971511\";s:2:\"1x\";s:68:\"https://ps.w.org/tinymce-advanced/assets/icon-128x128.png?rev=971511\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:70:\"https://ps.w.org/tinymce-advanced/assets/banner-772x250.png?rev=894078\";}s:11:\"banners_rtl\";a:0:{}}s:41:\"wordpress-importer/wordpress-importer.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:32:\"w.org/plugins/wordpress-importer\";s:4:\"slug\";s:18:\"wordpress-importer\";s:6:\"plugin\";s:41:\"wordpress-importer/wordpress-importer.php\";s:11:\"new_version\";s:5:\"0.6.4\";s:3:\"url\";s:49:\"https://wordpress.org/plugins/wordpress-importer/\";s:7:\"package\";s:67:\"https://downloads.wordpress.org/plugin/wordpress-importer.0.6.4.zip\";s:5:\"icons\";a:3:{s:2:\"2x\";s:71:\"https://ps.w.org/wordpress-importer/assets/icon-256x256.png?rev=1908375\";s:2:\"1x\";s:63:\"https://ps.w.org/wordpress-importer/assets/icon.svg?rev=1908375\";s:3:\"svg\";s:63:\"https://ps.w.org/wordpress-importer/assets/icon.svg?rev=1908375\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:72:\"https://ps.w.org/wordpress-importer/assets/banner-772x250.png?rev=547654\";}s:11:\"banners_rtl\";a:0:{}}s:56:\"wp-migration-duplicator/webtoffee-wordpress-migrator.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:37:\"w.org/plugins/wp-migration-duplicator\";s:4:\"slug\";s:23:\"wp-migration-duplicator\";s:6:\"plugin\";s:56:\"wp-migration-duplicator/webtoffee-wordpress-migrator.php\";s:11:\"new_version\";s:5:\"1.0.6\";s:3:\"url\";s:54:\"https://wordpress.org/plugins/wp-migration-duplicator/\";s:7:\"package\";s:72:\"https://downloads.wordpress.org/plugin/wp-migration-duplicator.1.0.6.zip\";s:5:\"icons\";a:1:{s:2:\"1x\";s:76:\"https://ps.w.org/wp-migration-duplicator/assets/icon-128x128.jpg?rev=1861802\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:78:\"https://ps.w.org/wp-migration-duplicator/assets/banner-772x250.jpg?rev=1865292\";}s:11:\"banners_rtl\";a:0:{}}s:24:\"wordpress-seo/wp-seo.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:27:\"w.org/plugins/wordpress-seo\";s:4:\"slug\";s:13:\"wordpress-seo\";s:6:\"plugin\";s:24:\"wordpress-seo/wp-seo.php\";s:11:\"new_version\";s:5:\"9.2.1\";s:3:\"url\";s:44:\"https://wordpress.org/plugins/wordpress-seo/\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/plugin/wordpress-seo.9.2.1.zip\";s:5:\"icons\";a:3:{s:2:\"2x\";s:66:\"https://ps.w.org/wordpress-seo/assets/icon-256x256.png?rev=1834347\";s:2:\"1x\";s:58:\"https://ps.w.org/wordpress-seo/assets/icon.svg?rev=1946641\";s:3:\"svg\";s:58:\"https://ps.w.org/wordpress-seo/assets/icon.svg?rev=1946641\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:69:\"https://ps.w.org/wordpress-seo/assets/banner-1544x500.png?rev=1843435\";s:2:\"1x\";s:68:\"https://ps.w.org/wordpress-seo/assets/banner-772x250.png?rev=1843435\";}s:11:\"banners_rtl\";a:2:{s:2:\"2x\";s:73:\"https://ps.w.org/wordpress-seo/assets/banner-1544x500-rtl.png?rev=1843435\";s:2:\"1x\";s:72:\"https://ps.w.org/wordpress-seo/assets/banner-772x250-rtl.png?rev=1843435\";}}}}","no"),
("312","_transient_timeout_wpseo-statistics-totals","1543232051","no"),
("313","_transient_wpseo-statistics-totals","a:1:{i:1;a:2:{s:6:\"scores\";a:1:{i:0;a:4:{s:8:\"seo_rank\";s:2:\"na\";s:5:\"label\";s:48:\"Posts <strong>without</strong> a focus keyphrase\";s:5:\"count\";s:1:\"1\";s:4:\"link\";s:110:\"http://www.geraldinecamenisch.com/wp-admin/edit.php?post_status=publish&#038;post_type=post&#038;seo_filter=na\";}}s:8:\"division\";a:5:{s:3:\"bad\";i:0;s:2:\"ok\";i:0;s:4:\"good\";i:0;s:2:\"na\";i:1;s:7:\"noindex\";i:0;}}}","no");/*END*/




DROP TABLE IF EXISTS `webtoffee_postmeta` ;/*END*/ 

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";/*END*/
SET time_zone = "+00:00";/*END*/


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;/*END*/
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;/*END*/
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;/*END*/
/*!40101 SET NAMES utf8 */;/*END*/
--
-- Database: `sqlcamenisch`
--




CREATE TABLE `webtoffee_postmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=1337 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;/*END*/


INSERT INTO webtoffee_postmeta VALUES
("1","2","_wp_page_template","default"),
("2","3","_wp_page_template","default"),
("3","5","_edit_last","1"),
("4","5","_edit_lock","1542660269:1"),
("5","7","_edit_last","1"),
("6","7","_edit_lock","1542653347:1"),
("7","9","_edit_last","1"),
("8","9","_edit_lock","1542532177:1"),
("9","11","_edit_last","1"),
("10","11","_edit_lock","1542532227:1"),
("11","13","_edit_last","1"),
("12","13","_edit_lock","1542532252:1"),
("13","15","_edit_last","1"),
("14","15","_edit_lock","1542532271:1"),
("15","2","_edit_last","1"),
("16","2","_edit_lock","1542532431:1"),
("17","18","_menu_item_type","post_type"),
("18","18","_menu_item_menu_item_parent","0"),
("19","18","_menu_item_object_id","15"),
("20","18","_menu_item_object","page"),
("21","18","_menu_item_target",""),
("22","18","_menu_item_classes","a:1:{i:0;s:0:\"\";}"),
("23","18","_menu_item_xfn",""),
("24","18","_menu_item_url",""),
("26","19","_menu_item_type","post_type"),
("27","19","_menu_item_menu_item_parent","0"),
("28","19","_menu_item_object_id","13"),
("29","19","_menu_item_object","page"),
("30","19","_menu_item_target",""),
("31","19","_menu_item_classes","a:1:{i:0;s:0:\"\";}"),
("32","19","_menu_item_xfn",""),
("33","19","_menu_item_url",""),
("35","20","_menu_item_type","post_type"),
("36","20","_menu_item_menu_item_parent","0"),
("37","20","_menu_item_object_id","11"),
("38","20","_menu_item_object","page"),
("39","20","_menu_item_target",""),
("40","20","_menu_item_classes","a:1:{i:0;s:0:\"\";}"),
("41","20","_menu_item_xfn",""),
("42","20","_menu_item_url",""),
("44","21","_menu_item_type","post_type"),
("45","21","_menu_item_menu_item_parent","0"),
("46","21","_menu_item_object_id","9"),
("47","21","_menu_item_object","page"),
("48","21","_menu_item_target",""),
("49","21","_menu_item_classes","a:1:{i:0;s:0:\"\";}"),
("50","21","_menu_item_xfn",""),
("51","21","_menu_item_url",""),
("53","22","_menu_item_type","post_type"),
("54","22","_menu_item_menu_item_parent","0"),
("55","22","_menu_item_object_id","7"),
("56","22","_menu_item_object","page"),
("57","22","_menu_item_target",""),
("58","22","_menu_item_classes","a:1:{i:0;s:0:\"\";}"),
("59","22","_menu_item_xfn",""),
("60","22","_menu_item_url",""),
("62","23","_menu_item_type","post_type"),
("63","23","_menu_item_menu_item_parent","0"),
("64","23","_menu_item_object_id","5"),
("65","23","_menu_item_object","page"),
("66","23","_menu_item_target",""),
("67","23","_menu_item_classes","a:1:{i:0;s:0:\"\";}"),
("68","23","_menu_item_xfn",""),
("69","23","_menu_item_url",""),
("71","24","_wp_trash_meta_status","publish"),
("72","24","_wp_trash_meta_time","1542532582"),
("73","25","_wp_trash_meta_status","publish"),
("74","25","_wp_trash_meta_time","1542532605"),
("75","26","_wp_trash_meta_status","publish"),
("76","26","_wp_trash_meta_time","1542532630"),
("77","27","_edit_lock","1542532652:1"),
("78","27","_wp_trash_meta_status","publish"),
("79","27","_wp_trash_meta_time","1542532661"),
("82","29","_wp_attached_file","2018/11/background.jpg"),
("83","29","_wp_attachment_metadata","a:6:{s:5:\"width\";i:1600;s:6:\"height\";i:1200;s:14:\"hwstring_small\";s:23:\"height=\'96\' width=\'128\'\";s:4:\"file\";s:22:\"2018/11/background.jpg\";s:5:\"sizes\";a:5:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:22:\"background-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:22:\"background-300x225.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:225;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:22:\"background-768x576.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:576;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:23:\"background-1024x768.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:768;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:14:\"small-carousel\";a:4:{s:4:\"file\";s:24:\"background-1600x1200.jpg\";s:5:\"width\";i:1600;s:6:\"height\";i:1200;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}}}"),
("84","29","_wp_attachment_is_custom_background","twentysixteen"),
("85","30","_wp_trash_meta_status","publish"),
("86","30","_wp_trash_meta_time","1542532842"),
("87","32","_wp_attached_file","2018/11/1.jpg"),
("88","32","_wp_attachment_metadata","a:6:{s:5:\"width\";i:1280;s:6:\"height\";i:960;s:14:\"hwstring_small\";s:23:\"height=\'96\' width=\'128\'\";s:4:\"file\";s:13:\"2018/11/1.jpg\";s:5:\"sizes\";a:4:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:13:\"1-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:13:\"1-300x225.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:225;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:13:\"1-768x576.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:576;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:14:\"1-1024x768.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:768;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}"),
("89","33","_wp_attached_file","2018/11/5-e1542533829581.jpg"),
("90","33","_wp_attachment_metadata","a:6:{s:5:\"width\";i:250;s:6:\"height\";i:333;s:14:\"hwstring_small\";s:22:\"height=\'96\' width=\'72\'\";s:4:\"file\";s:28:\"2018/11/5-e1542533829581.jpg\";s:5:\"sizes\";a:2:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:28:\"5-e1542533829581-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:28:\"5-e1542533829581-225x300.jpg\";s:5:\"width\";i:225;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}"),
("91","33","_wp_attachment_backup_sizes","a:1:{s:9:\"full-orig\";a:3:{s:5:\"width\";i:1280;s:6:\"height\";i:1707;s:4:\"file\";s:5:\"5.jpg\";}}"),
("93","5","_wp_page_template","zweispalter.php"),
("94","5","_yoast_wpseo_content_score","60"),
("95","5","site_title","Geraldiné Camenisch"),
("96","5","_site_title","field_5575c33c5cad0"),
("97","5","title","Next Event"),
("98","5","_title","field_555e02f5624d9"),
("99","35","site_title","Next Event"),
("100","35","_site_title","field_5575c33c5cad0"),
("101","35","title","Next Event"),
("102","35","_title","field_555e02f5624d9"),
("103","31","site_title","Geraldiné Camenisch"),
("104","31","_site_title","field_5575c33c5cad0"),
("105","31","title","Next Event"),
("106","31","_title","field_555e02f5624d9"),
("107","31","intro_link_name",""),
("108","31","_intro_link_name","field_5577e56b3afc7"),
("109","31","intro_link","");/*END*/
INSERT INTO webtoffee_postmeta VALUES
("110","31","_intro_link","field_5577e5ad3afc8"),
("111","31","logo_1",""),
("112","31","_logo_1","field_555b6f46ccbe9"),
("113","31","title_1","Viel Spass bei uns"),
("114","31","_title_1","field_555b6fc74211b"),
("115","31","text_1","Weit hinten, hinter den Wortbergen, fern der Länder Vokalien und Konsonantien leben die Blindtexte. Abgeschieden wohnen sie in Buchstabhausen an der Küste des Semantik, eines großen Sprachozeans.
Ein kleines Bächlein namens Duden fließt durch ihren Ort und versorgt sie mit den nötigen Regelialien. Es ist ein paradiesmatisches Land, in dem einem gebratene Satzteile in den Mund fliegen. Nicht einmal von der allmächtigen Interpunktion werden die Blindtexte beherrscht – ein geradezu unorthographisches Leben. Eines Tages aber beschloß eine kleine Zeile Blindtext, ihr Name war Lorem Ipsum, hinaus zu gehen in die weite Grammatik. Der große Oxmox riet ihr davon ab, da ...<img class=\"alignnone size-medium wp-image-32\" src=\"http://www.geraldinecamenisch.com/wp-content/uploads/2018/11/1-300x225.jpg\" alt=\"\" width=\"300\" height=\"225\" />"),
("116","31","_text_1","field_555b702c4211c"),
("117","31","link_title1",""),
("118","31","_link_title1","field_555c615a6fa46"),
("119","31","link_1",""),
("120","31","_link_1","field_555b712442121"),
("121","31","logo_2",""),
("122","31","_logo_2","field_555b6f8b4211a"),
("123","31","title_2",""),
("124","31","_title_2","field_555b70e74211e"),
("125","31","text_2",""),
("126","31","_text_2","field_555b70fe4211f"),
("127","31","link_title2",""),
("128","31","_link_title2","field_555c61766fa47"),
("129","31","link_2",""),
("130","31","_link_2","field_555c61966fa48"),
("131","31","logo_3",""),
("132","31","_logo_3","field_555b710d42120"),
("133","31","title_3",""),
("134","31","_title_3","field_555b716e3b303"),
("135","31","text_3",""),
("136","31","_text_3","field_555b717f3b304"),
("137","31","link_title3",""),
("138","31","_link_title3","field_555c61af6fa49"),
("139","31","link_3",""),
("140","31","_link_3","field_555b718b3b305"),
("141","31","logo_4",""),
("142","31","_logo_4","field_555b71a83b306"),
("143","31","title_4",""),
("144","31","_title_4","field_555b71c03b307"),
("145","31","text_4",""),
("146","31","_text_4","field_555b71cf3b308"),
("147","31","link_title4",""),
("148","31","_link_title4","field_555c6fb66fa4a"),
("149","31","link_4",""),
("150","31","_link_4","field_555b71dc3b309"),
("151","31","quote_editor",""),
("152","31","_quote_editor","field_56717ddceee3b"),
("153","31","contact_infotitle",""),
("154","31","_contact_infotitle","field_555c328f4593e"),
("155","31","contact_title",""),
("156","31","_contact_title","field_555c32dc4593f"),
("157","31","contact_text",""),
("158","31","_contact_text","field_555c32fc45940"),
("159","31","contact_tel",""),
("160","31","_contact_tel","field_555c332d45941"),
("161","31","contact_mail",""),
("162","31","_contact_mail","field_555c335d45942"),
("163","36","site_title","Geraldiné Camenisch"),
("164","36","_site_title","field_5575c33c5cad0"),
("165","36","title","Next Event"),
("166","36","_title","field_555e02f5624d9"),
("167","37","_wp_attached_file","2018/11/logo.png"),
("168","37","_wp_attachment_metadata","a:6:{s:5:\"width\";i:750;s:6:\"height\";i:113;s:14:\"hwstring_small\";s:23:\"height=\'19\' width=\'128\'\";s:4:\"file\";s:16:\"2018/11/logo.png\";s:5:\"sizes\";a:2:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:16:\"logo-150x113.png\";s:5:\"width\";i:150;s:6:\"height\";i:113;s:9:\"mime-type\";s:9:\"image/png\";}s:6:\"medium\";a:4:{s:4:\"file\";s:15:\"logo-300x45.png\";s:5:\"width\";i:300;s:6:\"height\";i:45;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}"),
("169","2","_wp_trash_meta_status","draft"),
("170","2","_wp_trash_meta_time","1542550035"),
("171","2","_wp_desired_post_slug","beispiel-seite"),
("176","7","_yoast_wpseo_content_score","60"),
("177","7","_wp_page_template","zweispalter.php"),
("178","7","site_title","Geraldiné Camenisch"),
("179","7","_site_title","field_5575c33c5cad0"),
("180","7","title","Sopranistin aus Leidenschaft"),
("181","7","_title","field_555e02f5624d9"),
("182","39","site_title","Geraldiné Camenisch"),
("183","39","_site_title","field_5575c33c5cad0"),
("184","39","title","Sopranistin aus Leidenschaft"),
("185","39","_title","field_555e02f5624d9"),
("186","7","intro_link_name",""),
("187","7","_intro_link_name","field_5577e56b3afc7"),
("188","7","intro_link",""),
("189","7","_intro_link","field_5577e5ad3afc8"),
("190","7","logo_1",""),
("191","7","_logo_1","field_555b6f46ccbe9"),
("192","7","title_1",""),
("193","7","_title_1","field_555b6fc74211b"),
("194","7","text_1",""),
("195","7","_text_1","field_555b702c4211c"),
("196","7","link_title1",""),
("197","7","_link_title1","field_555c615a6fa46"),
("198","7","link_1",""),
("199","7","_link_1","field_555b712442121"),
("200","7","logo_2",""),
("201","7","_logo_2","field_555b6f8b4211a"),
("202","7","title_2",""),
("203","7","_title_2","field_555b70e74211e"),
("204","7","text_2",""),
("205","7","_text_2","field_555b70fe4211f"),
("206","7","link_title2",""),
("207","7","_link_title2","field_555c61766fa47"),
("208","7","link_2",""),
("209","7","_link_2","field_555c61966fa48"),
("210","7","logo_3",""),
("211","7","_logo_3","field_555b710d42120"),
("212","7","title_3",""),
("213","7","_title_3","field_555b716e3b303");/*END*/
INSERT INTO webtoffee_postmeta VALUES
("214","7","text_3",""),
("215","7","_text_3","field_555b717f3b304"),
("216","7","link_title3",""),
("217","7","_link_title3","field_555c61af6fa49"),
("218","7","link_3",""),
("219","7","_link_3","field_555b718b3b305"),
("220","7","logo_4",""),
("221","7","_logo_4","field_555b71a83b306"),
("222","7","title_4",""),
("223","7","_title_4","field_555b71c03b307"),
("224","7","text_4",""),
("225","7","_text_4","field_555b71cf3b308"),
("226","7","link_title4",""),
("227","7","_link_title4","field_555c6fb66fa4a"),
("228","7","link_4",""),
("229","7","_link_4","field_555b71dc3b309"),
("230","7","quote_editor",""),
("231","7","_quote_editor","field_56717ddceee3b"),
("232","7","contact_infotitle",""),
("233","7","_contact_infotitle","field_555c328f4593e"),
("234","7","contact_title",""),
("235","7","_contact_title","field_555c32dc4593f"),
("236","7","contact_text",""),
("237","7","_contact_text","field_555c32fc45940"),
("238","7","contact_tel",""),
("239","7","_contact_tel","field_555c332d45941"),
("240","7","contact_mail",""),
("241","7","_contact_mail","field_555c335d45942"),
("298","7","infobox_subtitle",""),
("299","7","_infobox_subtitle","field_557541ed6885a"),
("300","7","infobox_title",""),
("301","7","_infobox_title","field_557541fd6885b"),
("302","7","infobox_text",""),
("303","7","_infobox_text","field_557542066885c"),
("304","7","kontakte",""),
("305","7","_kontakte","field_55ddcb2a74b41"),
("306","7","side_img1","51"),
("307","7","_side_img1","field_556ef50ee26e9"),
("308","7","side_img1_desc","test1"),
("309","7","_side_img1_desc","field_556ef613e26ea"),
("310","7","side_img2","33"),
("311","7","_side_img2","field_556ef65131b86"),
("312","7","side_img2_desc","test2"),
("313","7","_side_img2_desc","field_556ef66d31b88"),
("314","7","side_img3","29"),
("315","7","_side_img3","field_556ef67b31b89"),
("316","7","side_img3_desc","test 3"),
("317","7","_side_img3_desc","field_556ef68f31b8a"),
("318","7","typ_link",""),
("319","7","_typ_link","field_56a87a017ed65"),
("342","40","site_title","Geraldiné Camenisch"),
("343","40","_site_title","field_5575c33c5cad0"),
("344","40","title","Sopranistin aus Leidenschaft"),
("345","40","_title","field_555e02f5624d9"),
("346","40","intro_link_name",""),
("347","40","_intro_link_name","field_5577e56b3afc7"),
("348","40","intro_link",""),
("349","40","_intro_link","field_5577e5ad3afc8"),
("350","40","logo_1",""),
("351","40","_logo_1","field_555b6f46ccbe9"),
("352","40","title_1",""),
("353","40","_title_1","field_555b6fc74211b"),
("354","40","text_1",""),
("355","40","_text_1","field_555b702c4211c"),
("356","40","link_title1",""),
("357","40","_link_title1","field_555c615a6fa46"),
("358","40","link_1",""),
("359","40","_link_1","field_555b712442121"),
("360","40","logo_2",""),
("361","40","_logo_2","field_555b6f8b4211a"),
("362","40","title_2",""),
("363","40","_title_2","field_555b70e74211e"),
("364","40","text_2",""),
("365","40","_text_2","field_555b70fe4211f"),
("366","40","link_title2",""),
("367","40","_link_title2","field_555c61766fa47"),
("368","40","link_2",""),
("369","40","_link_2","field_555c61966fa48"),
("370","40","logo_3",""),
("371","40","_logo_3","field_555b710d42120"),
("372","40","title_3",""),
("373","40","_title_3","field_555b716e3b303"),
("374","40","text_3",""),
("375","40","_text_3","field_555b717f3b304"),
("376","40","link_title3",""),
("377","40","_link_title3","field_555c61af6fa49"),
("378","40","link_3",""),
("379","40","_link_3","field_555b718b3b305"),
("380","40","logo_4",""),
("381","40","_logo_4","field_555b71a83b306"),
("382","40","title_4",""),
("383","40","_title_4","field_555b71c03b307"),
("384","40","text_4",""),
("385","40","_text_4","field_555b71cf3b308"),
("386","40","link_title4",""),
("387","40","_link_title4","field_555c6fb66fa4a"),
("388","40","link_4",""),
("389","40","_link_4","field_555b71dc3b309"),
("390","40","quote_editor",""),
("391","40","_quote_editor","field_56717ddceee3b");/*END*/
INSERT INTO webtoffee_postmeta VALUES
("392","40","contact_infotitle",""),
("393","40","_contact_infotitle","field_555c328f4593e"),
("394","40","contact_title",""),
("395","40","_contact_title","field_555c32dc4593f"),
("396","40","contact_text",""),
("397","40","_contact_text","field_555c32fc45940"),
("398","40","contact_tel",""),
("399","40","_contact_tel","field_555c332d45941"),
("400","40","contact_mail",""),
("401","40","_contact_mail","field_555c335d45942"),
("402","40","infobox_subtitle",""),
("403","40","_infobox_subtitle","field_557541ed6885a"),
("404","40","infobox_title",""),
("405","40","_infobox_title","field_557541fd6885b"),
("406","40","infobox_text","<img class=\"alignnone size-medium wp-image-33\" src=\"http://www.geraldinecamenisch.com/wp-content/uploads/2018/11/5-225x300.jpg\" alt=\"\" width=\"225\" height=\"300\" />"),
("407","40","_infobox_text","field_557542066885c"),
("408","40","kontakte",""),
("409","40","_kontakte","field_55ddcb2a74b41"),
("410","40","side_img1",""),
("411","40","_side_img1","field_556ef50ee26e9"),
("412","40","side_img1_desc",""),
("413","40","_side_img1_desc","field_556ef613e26ea"),
("414","40","side_img2",""),
("415","40","_side_img2","field_556ef65131b86"),
("416","40","side_img2_desc",""),
("417","40","_side_img2_desc","field_556ef66d31b88"),
("418","40","side_img3",""),
("419","40","_side_img3","field_556ef67b31b89"),
("420","40","side_img3_desc",""),
("421","40","_side_img3_desc","field_556ef68f31b8a"),
("422","40","typ_link",""),
("423","40","_typ_link","field_56a87a017ed65"),
("448","42","site_title","Geraldiné Camenisch"),
("449","42","_site_title","field_5575c33c5cad0"),
("450","42","title","Sopranistin aus Leidenschaft"),
("451","42","_title","field_555e02f5624d9"),
("452","42","infobox_subtitle",""),
("453","42","_infobox_subtitle","field_557541ed6885a"),
("454","42","infobox_title",""),
("455","42","_infobox_title","field_557541fd6885b"),
("456","42","infobox_text","<img class=\"alignnone size-medium wp-image-33\" src=\"http://www.geraldinecamenisch.com/wp-content/uploads/2018/11/5-225x300.jpg\" alt=\"\" width=\"225\" height=\"300\" />"),
("457","42","_infobox_text","field_557542066885c"),
("458","42","kontakte",""),
("459","42","_kontakte","field_55ddcb2a74b41"),
("460","42","side_img1",""),
("461","42","_side_img1","field_556ef50ee26e9"),
("462","42","side_img1_desc",""),
("463","42","_side_img1_desc","field_556ef613e26ea"),
("464","42","side_img2",""),
("465","42","_side_img2","field_556ef65131b86"),
("466","42","side_img2_desc",""),
("467","42","_side_img2_desc","field_556ef66d31b88"),
("468","42","side_img3",""),
("469","42","_side_img3","field_556ef67b31b89"),
("470","42","side_img3_desc",""),
("471","42","_side_img3_desc","field_556ef68f31b8a"),
("472","42","intro_link_name",""),
("473","42","_intro_link_name","field_5577e56b3afc7"),
("474","42","intro_link",""),
("475","42","_intro_link","field_5577e5ad3afc8"),
("476","42","logo_1",""),
("477","42","_logo_1","field_555b6f46ccbe9"),
("478","42","title_1",""),
("479","42","_title_1","field_555b6fc74211b"),
("480","42","text_1",""),
("481","42","_text_1","field_555b702c4211c"),
("482","42","link_title1",""),
("483","42","_link_title1","field_555c615a6fa46"),
("484","42","link_1",""),
("485","42","_link_1","field_555b712442121"),
("486","42","logo_2",""),
("487","42","_logo_2","field_555b6f8b4211a"),
("488","42","title_2",""),
("489","42","_title_2","field_555b70e74211e"),
("490","42","text_2",""),
("491","42","_text_2","field_555b70fe4211f"),
("492","42","link_title2",""),
("493","42","_link_title2","field_555c61766fa47"),
("494","42","link_2",""),
("495","42","_link_2","field_555c61966fa48"),
("496","42","logo_3",""),
("497","42","_logo_3","field_555b710d42120"),
("498","42","title_3",""),
("499","42","_title_3","field_555b716e3b303"),
("500","42","text_3",""),
("501","42","_text_3","field_555b717f3b304"),
("502","42","link_title3",""),
("503","42","_link_title3","field_555c61af6fa49"),
("504","42","link_3",""),
("505","42","_link_3","field_555b718b3b305"),
("506","42","logo_4",""),
("507","42","_logo_4","field_555b71a83b306"),
("508","42","title_4",""),
("509","42","_title_4","field_555b71c03b307"),
("510","42","text_4",""),
("511","42","_text_4","field_555b71cf3b308"),
("512","42","link_title4",""),
("513","42","_link_title4","field_555c6fb66fa4a"),
("514","42","link_4",""),
("515","42","_link_4","field_555b71dc3b309");/*END*/
INSERT INTO webtoffee_postmeta VALUES
("516","42","quote_editor",""),
("517","42","_quote_editor","field_56717ddceee3b"),
("518","42","contact_infotitle",""),
("519","42","_contact_infotitle","field_555c328f4593e"),
("520","42","contact_title",""),
("521","42","_contact_title","field_555c32dc4593f"),
("522","42","contact_text",""),
("523","42","_contact_text","field_555c32fc45940"),
("524","42","contact_tel",""),
("525","42","_contact_tel","field_555c332d45941"),
("526","42","contact_mail",""),
("527","42","_contact_mail","field_555c335d45942"),
("528","42","typ_link",""),
("529","42","_typ_link","field_56a87a017ed65"),
("530","43","site_title","Geraldiné Camenisch"),
("531","43","_site_title","field_5575c33c5cad0"),
("532","43","title","Sopranistin aus Leidenschaft"),
("533","43","_title","field_555e02f5624d9"),
("534","43","intro_link_name",""),
("535","43","_intro_link_name","field_5577e56b3afc7"),
("536","43","intro_link",""),
("537","43","_intro_link","field_5577e5ad3afc8"),
("538","43","logo_1",""),
("539","43","_logo_1","field_555b6f46ccbe9"),
("540","43","title_1",""),
("541","43","_title_1","field_555b6fc74211b"),
("542","43","text_1",""),
("543","43","_text_1","field_555b702c4211c"),
("544","43","link_title1",""),
("545","43","_link_title1","field_555c615a6fa46"),
("546","43","link_1",""),
("547","43","_link_1","field_555b712442121"),
("548","43","logo_2",""),
("549","43","_logo_2","field_555b6f8b4211a"),
("550","43","title_2",""),
("551","43","_title_2","field_555b70e74211e"),
("552","43","text_2",""),
("553","43","_text_2","field_555b70fe4211f"),
("554","43","link_title2",""),
("555","43","_link_title2","field_555c61766fa47"),
("556","43","link_2",""),
("557","43","_link_2","field_555c61966fa48"),
("558","43","logo_3",""),
("559","43","_logo_3","field_555b710d42120"),
("560","43","title_3",""),
("561","43","_title_3","field_555b716e3b303"),
("562","43","text_3",""),
("563","43","_text_3","field_555b717f3b304"),
("564","43","link_title3",""),
("565","43","_link_title3","field_555c61af6fa49"),
("566","43","link_3",""),
("567","43","_link_3","field_555b718b3b305"),
("568","43","logo_4",""),
("569","43","_logo_4","field_555b71a83b306"),
("570","43","title_4",""),
("571","43","_title_4","field_555b71c03b307"),
("572","43","text_4",""),
("573","43","_text_4","field_555b71cf3b308"),
("574","43","link_title4",""),
("575","43","_link_title4","field_555c6fb66fa4a"),
("576","43","link_4",""),
("577","43","_link_4","field_555b71dc3b309"),
("578","43","quote_editor",""),
("579","43","_quote_editor","field_56717ddceee3b"),
("580","43","contact_infotitle",""),
("581","43","_contact_infotitle","field_555c328f4593e"),
("582","43","contact_title",""),
("583","43","_contact_title","field_555c32dc4593f"),
("584","43","contact_text",""),
("585","43","_contact_text","field_555c32fc45940"),
("586","43","contact_tel",""),
("587","43","_contact_tel","field_555c332d45941"),
("588","43","contact_mail",""),
("589","43","_contact_mail","field_555c335d45942"),
("590","43","infobox_subtitle",""),
("591","43","_infobox_subtitle","field_557541ed6885a"),
("592","43","infobox_title",""),
("593","43","_infobox_title","field_557541fd6885b"),
("594","43","infobox_text","<img class=\"alignnone size-medium wp-image-33\" src=\"http://www.geraldinecamenisch.com/wp-content/uploads/2018/11/5-225x300.jpg\" alt=\"\" width=\"225\" height=\"300\" />"),
("595","43","_infobox_text","field_557542066885c"),
("596","43","kontakte",""),
("597","43","_kontakte","field_55ddcb2a74b41"),
("598","43","side_img1","32"),
("599","43","_side_img1","field_556ef50ee26e9"),
("600","43","side_img1_desc",""),
("601","43","_side_img1_desc","field_556ef613e26ea"),
("602","43","side_img2",""),
("603","43","_side_img2","field_556ef65131b86"),
("604","43","side_img2_desc",""),
("605","43","_side_img2_desc","field_556ef66d31b88"),
("606","43","side_img3",""),
("607","43","_side_img3","field_556ef67b31b89"),
("608","43","side_img3_desc",""),
("609","43","_side_img3_desc","field_556ef68f31b8a"),
("610","43","typ_link",""),
("611","43","_typ_link","field_56a87a017ed65"),
("612","44","site_title","Geraldiné Camenisch"),
("613","44","_site_title","field_5575c33c5cad0"),
("614","44","title","Sopranistin aus Leidenschaft"),
("615","44","_title","field_555e02f5624d9");/*END*/
INSERT INTO webtoffee_postmeta VALUES
("616","44","intro_link_name",""),
("617","44","_intro_link_name","field_5577e56b3afc7"),
("618","44","intro_link",""),
("619","44","_intro_link","field_5577e5ad3afc8"),
("620","44","logo_1",""),
("621","44","_logo_1","field_555b6f46ccbe9"),
("622","44","title_1",""),
("623","44","_title_1","field_555b6fc74211b"),
("624","44","text_1",""),
("625","44","_text_1","field_555b702c4211c"),
("626","44","link_title1",""),
("627","44","_link_title1","field_555c615a6fa46"),
("628","44","link_1",""),
("629","44","_link_1","field_555b712442121"),
("630","44","logo_2",""),
("631","44","_logo_2","field_555b6f8b4211a"),
("632","44","title_2",""),
("633","44","_title_2","field_555b70e74211e"),
("634","44","text_2",""),
("635","44","_text_2","field_555b70fe4211f"),
("636","44","link_title2",""),
("637","44","_link_title2","field_555c61766fa47"),
("638","44","link_2",""),
("639","44","_link_2","field_555c61966fa48"),
("640","44","logo_3",""),
("641","44","_logo_3","field_555b710d42120"),
("642","44","title_3",""),
("643","44","_title_3","field_555b716e3b303"),
("644","44","text_3",""),
("645","44","_text_3","field_555b717f3b304"),
("646","44","link_title3",""),
("647","44","_link_title3","field_555c61af6fa49"),
("648","44","link_3",""),
("649","44","_link_3","field_555b718b3b305"),
("650","44","logo_4",""),
("651","44","_logo_4","field_555b71a83b306"),
("652","44","title_4",""),
("653","44","_title_4","field_555b71c03b307"),
("654","44","text_4",""),
("655","44","_text_4","field_555b71cf3b308"),
("656","44","link_title4",""),
("657","44","_link_title4","field_555c6fb66fa4a"),
("658","44","link_4",""),
("659","44","_link_4","field_555b71dc3b309"),
("660","44","quote_editor",""),
("661","44","_quote_editor","field_56717ddceee3b"),
("662","44","contact_infotitle",""),
("663","44","_contact_infotitle","field_555c328f4593e"),
("664","44","contact_title",""),
("665","44","_contact_title","field_555c32dc4593f"),
("666","44","contact_text",""),
("667","44","_contact_text","field_555c32fc45940"),
("668","44","contact_tel",""),
("669","44","_contact_tel","field_555c332d45941"),
("670","44","contact_mail",""),
("671","44","_contact_mail","field_555c335d45942"),
("672","44","infobox_subtitle",""),
("673","44","_infobox_subtitle","field_557541ed6885a"),
("674","44","infobox_title",""),
("675","44","_infobox_title","field_557541fd6885b"),
("676","44","infobox_text","<img class=\"alignnone size-medium wp-image-33\" src=\"http://www.geraldinecamenisch.com/wp-content/uploads/2018/11/5-225x300.jpg\" alt=\"\" width=\"225\" height=\"300\" />"),
("677","44","_infobox_text","field_557542066885c"),
("678","44","kontakte",""),
("679","44","_kontakte","field_55ddcb2a74b41"),
("680","44","side_img1","32"),
("681","44","_side_img1","field_556ef50ee26e9"),
("682","44","side_img1_desc","test"),
("683","44","_side_img1_desc","field_556ef613e26ea"),
("684","44","side_img2",""),
("685","44","_side_img2","field_556ef65131b86"),
("686","44","side_img2_desc",""),
("687","44","_side_img2_desc","field_556ef66d31b88"),
("688","44","side_img3",""),
("689","44","_side_img3","field_556ef67b31b89"),
("690","44","side_img3_desc",""),
("691","44","_side_img3_desc","field_556ef68f31b8a"),
("692","44","typ_link",""),
("693","44","_typ_link","field_56a87a017ed65"),
("694","45","site_title","Geraldiné Camenisch"),
("695","45","_site_title","field_5575c33c5cad0"),
("696","45","title","Sopranistin aus Leidenschaft"),
("697","45","_title","field_555e02f5624d9"),
("698","45","intro_link_name",""),
("699","45","_intro_link_name","field_5577e56b3afc7"),
("700","45","intro_link",""),
("701","45","_intro_link","field_5577e5ad3afc8"),
("702","45","logo_1",""),
("703","45","_logo_1","field_555b6f46ccbe9"),
("704","45","title_1",""),
("705","45","_title_1","field_555b6fc74211b"),
("706","45","text_1",""),
("707","45","_text_1","field_555b702c4211c"),
("708","45","link_title1",""),
("709","45","_link_title1","field_555c615a6fa46"),
("710","45","link_1",""),
("711","45","_link_1","field_555b712442121"),
("712","45","logo_2",""),
("713","45","_logo_2","field_555b6f8b4211a"),
("714","45","title_2",""),
("715","45","_title_2","field_555b70e74211e");/*END*/
INSERT INTO webtoffee_postmeta VALUES
("716","45","text_2",""),
("717","45","_text_2","field_555b70fe4211f"),
("718","45","link_title2",""),
("719","45","_link_title2","field_555c61766fa47"),
("720","45","link_2",""),
("721","45","_link_2","field_555c61966fa48"),
("722","45","logo_3",""),
("723","45","_logo_3","field_555b710d42120"),
("724","45","title_3",""),
("725","45","_title_3","field_555b716e3b303"),
("726","45","text_3",""),
("727","45","_text_3","field_555b717f3b304"),
("728","45","link_title3",""),
("729","45","_link_title3","field_555c61af6fa49"),
("730","45","link_3",""),
("731","45","_link_3","field_555b718b3b305"),
("732","45","logo_4",""),
("733","45","_logo_4","field_555b71a83b306"),
("734","45","title_4",""),
("735","45","_title_4","field_555b71c03b307"),
("736","45","text_4",""),
("737","45","_text_4","field_555b71cf3b308"),
("738","45","link_title4",""),
("739","45","_link_title4","field_555c6fb66fa4a"),
("740","45","link_4",""),
("741","45","_link_4","field_555b71dc3b309"),
("742","45","quote_editor",""),
("743","45","_quote_editor","field_56717ddceee3b"),
("744","45","contact_infotitle",""),
("745","45","_contact_infotitle","field_555c328f4593e"),
("746","45","contact_title",""),
("747","45","_contact_title","field_555c32dc4593f"),
("748","45","contact_text",""),
("749","45","_contact_text","field_555c32fc45940"),
("750","45","contact_tel",""),
("751","45","_contact_tel","field_555c332d45941"),
("752","45","contact_mail",""),
("753","45","_contact_mail","field_555c335d45942"),
("754","45","infobox_subtitle",""),
("755","45","_infobox_subtitle","field_557541ed6885a"),
("756","45","infobox_title",""),
("757","45","_infobox_title","field_557541fd6885b"),
("758","45","infobox_text",""),
("759","45","_infobox_text","field_557542066885c"),
("760","45","kontakte",""),
("761","45","_kontakte","field_55ddcb2a74b41"),
("762","45","side_img1","32"),
("763","45","_side_img1","field_556ef50ee26e9"),
("764","45","side_img1_desc","test"),
("765","45","_side_img1_desc","field_556ef613e26ea"),
("766","45","side_img2",""),
("767","45","_side_img2","field_556ef65131b86"),
("768","45","side_img2_desc",""),
("769","45","_side_img2_desc","field_556ef66d31b88"),
("770","45","side_img3",""),
("771","45","_side_img3","field_556ef67b31b89"),
("772","45","side_img3_desc",""),
("773","45","_side_img3_desc","field_556ef68f31b8a"),
("774","45","typ_link",""),
("775","45","_typ_link","field_56a87a017ed65"),
("776","46","site_title","Geraldiné Camenisch"),
("777","46","_site_title","field_5575c33c5cad0"),
("778","46","title","Sopranistin aus Leidenschaft"),
("779","46","_title","field_555e02f5624d9"),
("780","46","intro_link_name",""),
("781","46","_intro_link_name","field_5577e56b3afc7"),
("782","46","intro_link",""),
("783","46","_intro_link","field_5577e5ad3afc8"),
("784","46","logo_1",""),
("785","46","_logo_1","field_555b6f46ccbe9"),
("786","46","title_1",""),
("787","46","_title_1","field_555b6fc74211b"),
("788","46","text_1",""),
("789","46","_text_1","field_555b702c4211c"),
("790","46","link_title1",""),
("791","46","_link_title1","field_555c615a6fa46"),
("792","46","link_1",""),
("793","46","_link_1","field_555b712442121"),
("794","46","logo_2",""),
("795","46","_logo_2","field_555b6f8b4211a"),
("796","46","title_2",""),
("797","46","_title_2","field_555b70e74211e"),
("798","46","text_2",""),
("799","46","_text_2","field_555b70fe4211f"),
("800","46","link_title2",""),
("801","46","_link_title2","field_555c61766fa47"),
("802","46","link_2",""),
("803","46","_link_2","field_555c61966fa48"),
("804","46","logo_3",""),
("805","46","_logo_3","field_555b710d42120"),
("806","46","title_3",""),
("807","46","_title_3","field_555b716e3b303"),
("808","46","text_3",""),
("809","46","_text_3","field_555b717f3b304"),
("810","46","link_title3",""),
("811","46","_link_title3","field_555c61af6fa49"),
("812","46","link_3",""),
("813","46","_link_3","field_555b718b3b305"),
("814","46","logo_4",""),
("815","46","_logo_4","field_555b71a83b306");/*END*/
INSERT INTO webtoffee_postmeta VALUES
("816","46","title_4",""),
("817","46","_title_4","field_555b71c03b307"),
("818","46","text_4",""),
("819","46","_text_4","field_555b71cf3b308"),
("820","46","link_title4",""),
("821","46","_link_title4","field_555c6fb66fa4a"),
("822","46","link_4",""),
("823","46","_link_4","field_555b71dc3b309"),
("824","46","quote_editor",""),
("825","46","_quote_editor","field_56717ddceee3b"),
("826","46","contact_infotitle",""),
("827","46","_contact_infotitle","field_555c328f4593e"),
("828","46","contact_title",""),
("829","46","_contact_title","field_555c32dc4593f"),
("830","46","contact_text",""),
("831","46","_contact_text","field_555c32fc45940"),
("832","46","contact_tel",""),
("833","46","_contact_tel","field_555c332d45941"),
("834","46","contact_mail",""),
("835","46","_contact_mail","field_555c335d45942"),
("836","46","infobox_subtitle",""),
("837","46","_infobox_subtitle","field_557541ed6885a"),
("838","46","infobox_title","test"),
("839","46","_infobox_title","field_557541fd6885b"),
("840","46","infobox_text",""),
("841","46","_infobox_text","field_557542066885c"),
("842","46","kontakte",""),
("843","46","_kontakte","field_55ddcb2a74b41"),
("844","46","side_img1","32"),
("845","46","_side_img1","field_556ef50ee26e9"),
("846","46","side_img1_desc",""),
("847","46","_side_img1_desc","field_556ef613e26ea"),
("848","46","side_img2","33"),
("849","46","_side_img2","field_556ef65131b86"),
("850","46","side_img2_desc",""),
("851","46","_side_img2_desc","field_556ef66d31b88"),
("852","46","side_img3",""),
("853","46","_side_img3","field_556ef67b31b89"),
("854","46","side_img3_desc",""),
("855","46","_side_img3_desc","field_556ef68f31b8a"),
("856","46","typ_link",""),
("857","46","_typ_link","field_56a87a017ed65"),
("858","47","site_title","Geraldiné Camenisch"),
("859","47","_site_title","field_5575c33c5cad0"),
("860","47","title","Sopranistin aus Leidenschaft"),
("861","47","_title","field_555e02f5624d9"),
("862","47","intro_link_name",""),
("863","47","_intro_link_name","field_5577e56b3afc7"),
("864","47","intro_link",""),
("865","47","_intro_link","field_5577e5ad3afc8"),
("866","47","logo_1",""),
("867","47","_logo_1","field_555b6f46ccbe9"),
("868","47","title_1",""),
("869","47","_title_1","field_555b6fc74211b"),
("870","47","text_1",""),
("871","47","_text_1","field_555b702c4211c"),
("872","47","link_title1",""),
("873","47","_link_title1","field_555c615a6fa46"),
("874","47","link_1",""),
("875","47","_link_1","field_555b712442121"),
("876","47","logo_2",""),
("877","47","_logo_2","field_555b6f8b4211a"),
("878","47","title_2",""),
("879","47","_title_2","field_555b70e74211e"),
("880","47","text_2",""),
("881","47","_text_2","field_555b70fe4211f"),
("882","47","link_title2",""),
("883","47","_link_title2","field_555c61766fa47"),
("884","47","link_2",""),
("885","47","_link_2","field_555c61966fa48"),
("886","47","logo_3",""),
("887","47","_logo_3","field_555b710d42120"),
("888","47","title_3",""),
("889","47","_title_3","field_555b716e3b303"),
("890","47","text_3",""),
("891","47","_text_3","field_555b717f3b304"),
("892","47","link_title3",""),
("893","47","_link_title3","field_555c61af6fa49"),
("894","47","link_3",""),
("895","47","_link_3","field_555b718b3b305"),
("896","47","logo_4",""),
("897","47","_logo_4","field_555b71a83b306"),
("898","47","title_4",""),
("899","47","_title_4","field_555b71c03b307"),
("900","47","text_4",""),
("901","47","_text_4","field_555b71cf3b308"),
("902","47","link_title4",""),
("903","47","_link_title4","field_555c6fb66fa4a"),
("904","47","link_4",""),
("905","47","_link_4","field_555b71dc3b309"),
("906","47","quote_editor",""),
("907","47","_quote_editor","field_56717ddceee3b"),
("908","47","contact_infotitle",""),
("909","47","_contact_infotitle","field_555c328f4593e"),
("910","47","contact_title",""),
("911","47","_contact_title","field_555c32dc4593f"),
("912","47","contact_text",""),
("913","47","_contact_text","field_555c32fc45940"),
("914","47","contact_tel",""),
("915","47","_contact_tel","field_555c332d45941");/*END*/
INSERT INTO webtoffee_postmeta VALUES
("916","47","contact_mail",""),
("917","47","_contact_mail","field_555c335d45942"),
("918","47","infobox_subtitle","wieso"),
("919","47","_infobox_subtitle","field_557541ed6885a"),
("920","47","infobox_title","test"),
("921","47","_infobox_title","field_557541fd6885b"),
("922","47","infobox_text",""),
("923","47","_infobox_text","field_557542066885c"),
("924","47","kontakte",""),
("925","47","_kontakte","field_55ddcb2a74b41"),
("926","47","side_img1","32"),
("927","47","_side_img1","field_556ef50ee26e9"),
("928","47","side_img1_desc",""),
("929","47","_side_img1_desc","field_556ef613e26ea"),
("930","47","side_img2","33"),
("931","47","_side_img2","field_556ef65131b86"),
("932","47","side_img2_desc",""),
("933","47","_side_img2_desc","field_556ef66d31b88"),
("934","47","side_img3",""),
("935","47","_side_img3","field_556ef67b31b89"),
("936","47","side_img3_desc",""),
("937","47","_side_img3_desc","field_556ef68f31b8a"),
("938","47","typ_link",""),
("939","47","_typ_link","field_56a87a017ed65"),
("940","48","site_title","Geraldiné Camenisch"),
("941","48","_site_title","field_5575c33c5cad0"),
("942","48","title","Sopranistin aus Leidenschaft"),
("943","48","_title","field_555e02f5624d9"),
("944","48","intro_link_name",""),
("945","48","_intro_link_name","field_5577e56b3afc7"),
("946","48","intro_link",""),
("947","48","_intro_link","field_5577e5ad3afc8"),
("948","48","logo_1",""),
("949","48","_logo_1","field_555b6f46ccbe9"),
("950","48","title_1",""),
("951","48","_title_1","field_555b6fc74211b"),
("952","48","text_1",""),
("953","48","_text_1","field_555b702c4211c"),
("954","48","link_title1",""),
("955","48","_link_title1","field_555c615a6fa46"),
("956","48","link_1",""),
("957","48","_link_1","field_555b712442121"),
("958","48","logo_2",""),
("959","48","_logo_2","field_555b6f8b4211a"),
("960","48","title_2",""),
("961","48","_title_2","field_555b70e74211e"),
("962","48","text_2",""),
("963","48","_text_2","field_555b70fe4211f"),
("964","48","link_title2",""),
("965","48","_link_title2","field_555c61766fa47"),
("966","48","link_2",""),
("967","48","_link_2","field_555c61966fa48"),
("968","48","logo_3",""),
("969","48","_logo_3","field_555b710d42120"),
("970","48","title_3",""),
("971","48","_title_3","field_555b716e3b303"),
("972","48","text_3",""),
("973","48","_text_3","field_555b717f3b304"),
("974","48","link_title3",""),
("975","48","_link_title3","field_555c61af6fa49"),
("976","48","link_3",""),
("977","48","_link_3","field_555b718b3b305"),
("978","48","logo_4",""),
("979","48","_logo_4","field_555b71a83b306"),
("980","48","title_4",""),
("981","48","_title_4","field_555b71c03b307"),
("982","48","text_4",""),
("983","48","_text_4","field_555b71cf3b308"),
("984","48","link_title4",""),
("985","48","_link_title4","field_555c6fb66fa4a"),
("986","48","link_4",""),
("987","48","_link_4","field_555b71dc3b309"),
("988","48","quote_editor",""),
("989","48","_quote_editor","field_56717ddceee3b"),
("990","48","contact_infotitle",""),
("991","48","_contact_infotitle","field_555c328f4593e"),
("992","48","contact_title",""),
("993","48","_contact_title","field_555c32dc4593f"),
("994","48","contact_text",""),
("995","48","_contact_text","field_555c32fc45940"),
("996","48","contact_tel",""),
("997","48","_contact_tel","field_555c332d45941"),
("998","48","contact_mail",""),
("999","48","_contact_mail","field_555c335d45942"),
("1000","48","infobox_subtitle","wieso"),
("1001","48","_infobox_subtitle","field_557541ed6885a"),
("1002","48","infobox_title","test"),
("1003","48","_infobox_title","field_557541fd6885b"),
("1004","48","infobox_text",""),
("1005","48","_infobox_text","field_557542066885c"),
("1006","48","kontakte",""),
("1007","48","_kontakte","field_55ddcb2a74b41"),
("1008","48","side_img1","32"),
("1009","48","_side_img1","field_556ef50ee26e9"),
("1010","48","side_img1_desc",""),
("1011","48","_side_img1_desc","field_556ef613e26ea"),
("1012","48","side_img2","33"),
("1013","48","_side_img2","field_556ef65131b86"),
("1014","48","side_img2_desc",""),
("1015","48","_side_img2_desc","field_556ef66d31b88");/*END*/
INSERT INTO webtoffee_postmeta VALUES
("1016","48","side_img3","29"),
("1017","48","_side_img3","field_556ef67b31b89"),
("1018","48","side_img3_desc",""),
("1019","48","_side_img3_desc","field_556ef68f31b8a"),
("1020","48","typ_link",""),
("1021","48","_typ_link","field_56a87a017ed65"),
("1022","49","site_title","Geraldiné Camenisch"),
("1023","49","_site_title","field_5575c33c5cad0"),
("1024","49","title","Sopranistin aus Leidenschaft"),
("1025","49","_title","field_555e02f5624d9"),
("1026","49","intro_link_name",""),
("1027","49","_intro_link_name","field_5577e56b3afc7"),
("1028","49","intro_link",""),
("1029","49","_intro_link","field_5577e5ad3afc8"),
("1030","49","logo_1",""),
("1031","49","_logo_1","field_555b6f46ccbe9"),
("1032","49","title_1",""),
("1033","49","_title_1","field_555b6fc74211b"),
("1034","49","text_1",""),
("1035","49","_text_1","field_555b702c4211c"),
("1036","49","link_title1",""),
("1037","49","_link_title1","field_555c615a6fa46"),
("1038","49","link_1",""),
("1039","49","_link_1","field_555b712442121"),
("1040","49","logo_2",""),
("1041","49","_logo_2","field_555b6f8b4211a"),
("1042","49","title_2",""),
("1043","49","_title_2","field_555b70e74211e"),
("1044","49","text_2",""),
("1045","49","_text_2","field_555b70fe4211f"),
("1046","49","link_title2",""),
("1047","49","_link_title2","field_555c61766fa47"),
("1048","49","link_2",""),
("1049","49","_link_2","field_555c61966fa48"),
("1050","49","logo_3",""),
("1051","49","_logo_3","field_555b710d42120"),
("1052","49","title_3",""),
("1053","49","_title_3","field_555b716e3b303"),
("1054","49","text_3",""),
("1055","49","_text_3","field_555b717f3b304"),
("1056","49","link_title3",""),
("1057","49","_link_title3","field_555c61af6fa49"),
("1058","49","link_3",""),
("1059","49","_link_3","field_555b718b3b305"),
("1060","49","logo_4",""),
("1061","49","_logo_4","field_555b71a83b306"),
("1062","49","title_4",""),
("1063","49","_title_4","field_555b71c03b307"),
("1064","49","text_4",""),
("1065","49","_text_4","field_555b71cf3b308"),
("1066","49","link_title4",""),
("1067","49","_link_title4","field_555c6fb66fa4a"),
("1068","49","link_4",""),
("1069","49","_link_4","field_555b71dc3b309"),
("1070","49","quote_editor",""),
("1071","49","_quote_editor","field_56717ddceee3b"),
("1072","49","contact_infotitle",""),
("1073","49","_contact_infotitle","field_555c328f4593e"),
("1074","49","contact_title",""),
("1075","49","_contact_title","field_555c32dc4593f"),
("1076","49","contact_text",""),
("1077","49","_contact_text","field_555c32fc45940"),
("1078","49","contact_tel",""),
("1079","49","_contact_tel","field_555c332d45941"),
("1080","49","contact_mail",""),
("1081","49","_contact_mail","field_555c335d45942"),
("1082","49","infobox_subtitle","wieso"),
("1083","49","_infobox_subtitle","field_557541ed6885a"),
("1084","49","infobox_title","test"),
("1085","49","_infobox_title","field_557541fd6885b"),
("1086","49","infobox_text",""),
("1087","49","_infobox_text","field_557542066885c"),
("1088","49","kontakte",""),
("1089","49","_kontakte","field_55ddcb2a74b41"),
("1090","49","side_img1","32"),
("1091","49","_side_img1","field_556ef50ee26e9"),
("1092","49","side_img1_desc","test1"),
("1093","49","_side_img1_desc","field_556ef613e26ea"),
("1094","49","side_img2","33"),
("1095","49","_side_img2","field_556ef65131b86"),
("1096","49","side_img2_desc","test2"),
("1097","49","_side_img2_desc","field_556ef66d31b88"),
("1098","49","side_img3","29"),
("1099","49","_side_img3","field_556ef67b31b89"),
("1100","49","side_img3_desc","test 3"),
("1101","49","_side_img3_desc","field_556ef68f31b8a"),
("1102","49","typ_link",""),
("1103","49","_typ_link","field_56a87a017ed65"),
("1104","50","site_title","Geraldiné Camenisch"),
("1105","50","_site_title","field_5575c33c5cad0"),
("1106","50","title","Sopranistin aus Leidenschaft"),
("1107","50","_title","field_555e02f5624d9"),
("1108","50","intro_link_name",""),
("1109","50","_intro_link_name","field_5577e56b3afc7"),
("1110","50","intro_link",""),
("1111","50","_intro_link","field_5577e5ad3afc8"),
("1112","50","logo_1",""),
("1113","50","_logo_1","field_555b6f46ccbe9"),
("1114","50","title_1",""),
("1115","50","_title_1","field_555b6fc74211b");/*END*/
INSERT INTO webtoffee_postmeta VALUES
("1116","50","text_1",""),
("1117","50","_text_1","field_555b702c4211c"),
("1118","50","link_title1",""),
("1119","50","_link_title1","field_555c615a6fa46"),
("1120","50","link_1",""),
("1121","50","_link_1","field_555b712442121"),
("1122","50","logo_2",""),
("1123","50","_logo_2","field_555b6f8b4211a"),
("1124","50","title_2",""),
("1125","50","_title_2","field_555b70e74211e"),
("1126","50","text_2",""),
("1127","50","_text_2","field_555b70fe4211f"),
("1128","50","link_title2",""),
("1129","50","_link_title2","field_555c61766fa47"),
("1130","50","link_2",""),
("1131","50","_link_2","field_555c61966fa48"),
("1132","50","logo_3",""),
("1133","50","_logo_3","field_555b710d42120"),
("1134","50","title_3",""),
("1135","50","_title_3","field_555b716e3b303"),
("1136","50","text_3",""),
("1137","50","_text_3","field_555b717f3b304"),
("1138","50","link_title3",""),
("1139","50","_link_title3","field_555c61af6fa49"),
("1140","50","link_3",""),
("1141","50","_link_3","field_555b718b3b305"),
("1142","50","logo_4",""),
("1143","50","_logo_4","field_555b71a83b306"),
("1144","50","title_4",""),
("1145","50","_title_4","field_555b71c03b307"),
("1146","50","text_4",""),
("1147","50","_text_4","field_555b71cf3b308"),
("1148","50","link_title4",""),
("1149","50","_link_title4","field_555c6fb66fa4a"),
("1150","50","link_4",""),
("1151","50","_link_4","field_555b71dc3b309"),
("1152","50","quote_editor",""),
("1153","50","_quote_editor","field_56717ddceee3b"),
("1154","50","contact_infotitle",""),
("1155","50","_contact_infotitle","field_555c328f4593e"),
("1156","50","contact_title",""),
("1157","50","_contact_title","field_555c32dc4593f"),
("1158","50","contact_text",""),
("1159","50","_contact_text","field_555c32fc45940"),
("1160","50","contact_tel",""),
("1161","50","_contact_tel","field_555c332d45941"),
("1162","50","contact_mail",""),
("1163","50","_contact_mail","field_555c335d45942"),
("1164","50","infobox_subtitle",""),
("1165","50","_infobox_subtitle","field_557541ed6885a"),
("1166","50","infobox_title",""),
("1167","50","_infobox_title","field_557541fd6885b"),
("1168","50","infobox_text",""),
("1169","50","_infobox_text","field_557542066885c"),
("1170","50","kontakte",""),
("1171","50","_kontakte","field_55ddcb2a74b41"),
("1172","50","side_img1","32"),
("1173","50","_side_img1","field_556ef50ee26e9"),
("1174","50","side_img1_desc","test1"),
("1175","50","_side_img1_desc","field_556ef613e26ea"),
("1176","50","side_img2","33"),
("1177","50","_side_img2","field_556ef65131b86"),
("1178","50","side_img2_desc","test2"),
("1179","50","_side_img2_desc","field_556ef66d31b88"),
("1180","50","side_img3","29"),
("1181","50","_side_img3","field_556ef67b31b89"),
("1182","50","side_img3_desc","test 3"),
("1183","50","_side_img3_desc","field_556ef68f31b8a"),
("1184","50","typ_link",""),
("1185","50","_typ_link","field_56a87a017ed65"),
("1186","51","_wp_attached_file","2018/11/IMG_3763.jpg"),
("1187","51","_wp_attachment_metadata","a:6:{s:5:\"width\";i:5472;s:6:\"height\";i:3072;s:14:\"hwstring_small\";s:23:\"height=\'72\' width=\'128\'\";s:4:\"file\";s:20:\"2018/11/IMG_3763.jpg\";s:5:\"sizes\";a:5:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:20:\"IMG_3763-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:20:\"IMG_3763-300x168.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:168;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:20:\"IMG_3763-768x431.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:431;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:21:\"IMG_3763-1024x575.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:575;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:14:\"small-carousel\";a:4:{s:4:\"file\";s:22:\"IMG_3763-2000x1123.jpg\";s:5:\"width\";i:2000;s:6:\"height\";i:1123;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:3:\"5.6\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:20:\"Canon EOS 7D Mark II\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:10:\"1478375246\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:2:\"55\";s:3:\"iso\";s:4:\"1000\";s:13:\"shutter_speed\";s:6:\"0.0125\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}}}"),
("1188","52","_wp_attached_file","2018/11/IMG_3778.jpg"),
("1189","52","_wp_attachment_metadata","a:6:{s:5:\"width\";i:5472;s:6:\"height\";i:3072;s:14:\"hwstring_small\";s:23:\"height=\'72\' width=\'128\'\";s:4:\"file\";s:20:\"2018/11/IMG_3778.jpg\";s:5:\"sizes\";a:5:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:20:\"IMG_3778-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:20:\"IMG_3778-300x168.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:168;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:20:\"IMG_3778-768x431.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:431;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:21:\"IMG_3778-1024x575.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:575;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:14:\"small-carousel\";a:4:{s:4:\"file\";s:22:\"IMG_3778-2000x1123.jpg\";s:5:\"width\";i:2000;s:6:\"height\";i:1123;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:3:\"3.5\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:20:\"Canon EOS 7D Mark II\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:10:\"1478375439\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:2:\"55\";s:3:\"iso\";s:3:\"200\";s:13:\"shutter_speed\";s:5:\"0.008\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"6\";s:8:\"keywords\";a:0:{}}}"),
("1190","53","site_title","Geraldiné Camenisch"),
("1191","53","_site_title","field_5575c33c5cad0"),
("1192","53","title","Sopranistin aus Leidenschaft"),
("1193","53","_title","field_555e02f5624d9"),
("1194","53","intro_link_name",""),
("1195","53","_intro_link_name","field_5577e56b3afc7"),
("1196","53","intro_link",""),
("1197","53","_intro_link","field_5577e5ad3afc8"),
("1198","53","logo_1",""),
("1199","53","_logo_1","field_555b6f46ccbe9"),
("1200","53","title_1",""),
("1201","53","_title_1","field_555b6fc74211b"),
("1202","53","text_1",""),
("1203","53","_text_1","field_555b702c4211c"),
("1204","53","link_title1",""),
("1205","53","_link_title1","field_555c615a6fa46"),
("1206","53","link_1",""),
("1207","53","_link_1","field_555b712442121"),
("1208","53","logo_2",""),
("1209","53","_logo_2","field_555b6f8b4211a"),
("1210","53","title_2",""),
("1211","53","_title_2","field_555b70e74211e"),
("1212","53","text_2",""),
("1213","53","_text_2","field_555b70fe4211f"),
("1214","53","link_title2",""),
("1215","53","_link_title2","field_555c61766fa47");/*END*/
INSERT INTO webtoffee_postmeta VALUES
("1216","53","link_2",""),
("1217","53","_link_2","field_555c61966fa48"),
("1218","53","logo_3",""),
("1219","53","_logo_3","field_555b710d42120"),
("1220","53","title_3",""),
("1221","53","_title_3","field_555b716e3b303"),
("1222","53","text_3",""),
("1223","53","_text_3","field_555b717f3b304"),
("1224","53","link_title3",""),
("1225","53","_link_title3","field_555c61af6fa49"),
("1226","53","link_3",""),
("1227","53","_link_3","field_555b718b3b305"),
("1228","53","logo_4",""),
("1229","53","_logo_4","field_555b71a83b306"),
("1230","53","title_4",""),
("1231","53","_title_4","field_555b71c03b307"),
("1232","53","text_4",""),
("1233","53","_text_4","field_555b71cf3b308"),
("1234","53","link_title4",""),
("1235","53","_link_title4","field_555c6fb66fa4a"),
("1236","53","link_4",""),
("1237","53","_link_4","field_555b71dc3b309"),
("1238","53","quote_editor",""),
("1239","53","_quote_editor","field_56717ddceee3b"),
("1240","53","contact_infotitle",""),
("1241","53","_contact_infotitle","field_555c328f4593e"),
("1242","53","contact_title",""),
("1243","53","_contact_title","field_555c32dc4593f"),
("1244","53","contact_text",""),
("1245","53","_contact_text","field_555c32fc45940"),
("1246","53","contact_tel",""),
("1247","53","_contact_tel","field_555c332d45941"),
("1248","53","contact_mail",""),
("1249","53","_contact_mail","field_555c335d45942"),
("1250","53","infobox_subtitle",""),
("1251","53","_infobox_subtitle","field_557541ed6885a"),
("1252","53","infobox_title",""),
("1253","53","_infobox_title","field_557541fd6885b"),
("1254","53","infobox_text",""),
("1255","53","_infobox_text","field_557542066885c"),
("1256","53","kontakte",""),
("1257","53","_kontakte","field_55ddcb2a74b41"),
("1258","53","side_img1","51"),
("1259","53","_side_img1","field_556ef50ee26e9"),
("1260","53","side_img1_desc","test1"),
("1261","53","_side_img1_desc","field_556ef613e26ea"),
("1262","53","side_img2","33"),
("1263","53","_side_img2","field_556ef65131b86"),
("1264","53","side_img2_desc","test2"),
("1265","53","_side_img2_desc","field_556ef66d31b88"),
("1266","53","side_img3","29"),
("1267","53","_side_img3","field_556ef67b31b89"),
("1268","53","side_img3_desc","test 3"),
("1269","53","_side_img3_desc","field_556ef68f31b8a"),
("1270","53","typ_link",""),
("1271","53","_typ_link","field_56a87a017ed65"),
("1272","5","infobox_subtitle",""),
("1273","5","_infobox_subtitle","field_557541ed6885a"),
("1274","5","infobox_title",""),
("1275","5","_infobox_title","field_557541fd6885b"),
("1276","5","infobox_text",""),
("1277","5","_infobox_text","field_557542066885c"),
("1278","5","kontakte",""),
("1279","5","_kontakte","field_55ddcb2a74b41"),
("1280","5","side_img1","51"),
("1281","5","_side_img1","field_556ef50ee26e9"),
("1282","5","side_img1_desc",""),
("1283","5","_side_img1_desc","field_556ef613e26ea"),
("1284","5","side_img2","33"),
("1285","5","_side_img2","field_556ef65131b86"),
("1286","5","side_img2_desc",""),
("1287","5","_side_img2_desc","field_556ef66d31b88"),
("1288","5","side_img3",""),
("1289","5","_side_img3","field_556ef67b31b89"),
("1290","5","side_img3_desc",""),
("1291","5","_side_img3_desc","field_556ef68f31b8a"),
("1292","36","infobox_subtitle",""),
("1293","36","_infobox_subtitle","field_557541ed6885a"),
("1294","36","infobox_title",""),
("1295","36","_infobox_title","field_557541fd6885b"),
("1296","36","infobox_text",""),
("1297","36","_infobox_text","field_557542066885c"),
("1298","36","kontakte",""),
("1299","36","_kontakte","field_55ddcb2a74b41"),
("1300","36","side_img1",""),
("1301","36","_side_img1","field_556ef50ee26e9"),
("1302","36","side_img1_desc",""),
("1303","36","_side_img1_desc","field_556ef613e26ea"),
("1304","36","side_img2",""),
("1305","36","_side_img2","field_556ef65131b86"),
("1306","36","side_img2_desc",""),
("1307","36","_side_img2_desc","field_556ef66d31b88"),
("1308","36","side_img3",""),
("1309","36","_side_img3","field_556ef67b31b89"),
("1310","36","side_img3_desc",""),
("1311","36","_side_img3_desc","field_556ef68f31b8a"),
("1312","54","site_title","Geraldiné Camenisch"),
("1313","54","_site_title","field_5575c33c5cad0"),
("1314","54","title","Next Event"),
("1315","54","_title","field_555e02f5624d9");/*END*/
INSERT INTO webtoffee_postmeta VALUES
("1316","54","infobox_subtitle",""),
("1317","54","_infobox_subtitle","field_557541ed6885a"),
("1318","54","infobox_title",""),
("1319","54","_infobox_title","field_557541fd6885b"),
("1320","54","infobox_text",""),
("1321","54","_infobox_text","field_557542066885c"),
("1322","54","kontakte",""),
("1323","54","_kontakte","field_55ddcb2a74b41"),
("1324","54","side_img1","51"),
("1325","54","_side_img1","field_556ef50ee26e9"),
("1326","54","side_img1_desc",""),
("1327","54","_side_img1_desc","field_556ef613e26ea"),
("1328","54","side_img2","33"),
("1329","54","_side_img2","field_556ef65131b86"),
("1330","54","side_img2_desc",""),
("1331","54","_side_img2_desc","field_556ef66d31b88"),
("1332","54","side_img3",""),
("1333","54","_side_img3","field_556ef67b31b89"),
("1334","54","side_img3_desc",""),
("1335","54","_side_img3_desc","field_556ef68f31b8a"),
("1336","56","_edit_lock","1543143600:1");/*END*/




DROP TABLE IF EXISTS `webtoffee_posts` ;/*END*/ 

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";/*END*/
SET time_zone = "+00:00";/*END*/


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;/*END*/
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;/*END*/
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;/*END*/
/*!40101 SET NAMES utf8 */;/*END*/
--
-- Database: `sqlcamenisch`
--




CREATE TABLE `webtoffee_posts` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_title` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_excerpt` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `to_ping` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `pinged` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `guid` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `post_name` (`post_name`(191)),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;/*END*/


INSERT INTO webtoffee_posts VALUES
("1","1","2018-11-18 09:07:11","2018-11-18 09:07:11","Willkommen zur deutschen Version von WordPress. Dies ist der erste Beitrag. Sie können ihn bearbeiten oder löschen. Und dann starten Sie mit dem Schreiben!","Hallo Welt!","","publish","open","open","","hallo-welt","","","2018-11-18 09:07:11","2018-11-18 09:07:11","","0","http://www.geraldinecamenisch.com/?p=1","0","post","","1"),
("2","1","2018-11-18 09:07:11","2018-11-18 09:07:11","Dies ist eine Beispiel-Seite. Sie unterscheidet sich von Beiträgen, da sie stets an der selben Stelle bleibt und (bei den meisten Themes) in der Navigation angezeigt wird. Die meisten Leute starten mit einem Impressum, der Datenschutzerklärung oder einer &#8222;Über uns&#8220;-Seite mit einer Vorstellung für mögliche Besucher der Website. Dort könnte zum Beispiel stehen:

<blockquote>Hallo! Tagsüber arbeite ich als Fahrradkurier, nachts bin ich ein aufstrebender Schauspieler und dies hier ist meine Website. Ich lebe in Zürich, habe einen grossen Hund namens Jack, mag Pi&#241;a Coladas, jedoch weniger (ohne Schirm) im Regen stehen gelassen zu werden.</blockquote>

...oder so etwas wie:

<blockquote>Unsere Firma XYZ wurde 1971 gegründet und hat seither eine Menge hochqualitativen ABC für die Öffentlichkeit produziert. Ansässig in Gotham City, hat XYZ mittlerweile über 2.000 Mitarbeiter und entwickelt immer wieder grossartige Dinge für die ganze Gotham-Gemeinschaft.</blockquote>

Als neuer WordPress-Benutzer sollten Sie das <a href=\"http://www.geraldinecamenisch.com/wp-admin/\">Dashboard</a> aufrufen, um diese Seite zu löschen und statt dessen eine neue Seite mit Ihren eigenen Inhalten erstellen. Viel Spass!","Beispiel-Seite","","trash","closed","closed","","beispiel-seite__trashed","","","2018-11-18 14:07:15","2018-11-18 14:07:15","","0","http://www.geraldinecamenisch.com/?page_id=2","0","page","","0"),
("3","1","2018-11-18 09:07:11","2018-11-18 09:07:11","<h2>Wer wir sind</h2><p>Die Adresse unserer Website ist: http://www.geraldinecamenisch.com.</p><h2>Welche personenbezogenen Daten wir sammeln und warum wir sie sammeln</h2><h3>Kommentare</h3><p>Wenn Besucher Kommentare auf der Website schreiben, sammeln wir die Daten, die im Kommentar-Formular angezeigt werden, ausserdem die IP-Adresse des Besuchers und den User-Agent-String (damit wird der Browser identifiziert), um die Erkennung von Spam zu unterstützen.</p><p>Aus Ihrer E-Mail-Adresse kann eine anonymisierte Zeichenfolge erstellt (auch Hash genannt) und dem Gravatar-Dienst übergeben werden, um zu prüfen, ob Sie diesen benutzt. Die Datenschutzerklärung des Gravatar-Dienstes finden Sie hier: https://automattic.com/privacy/. Nachdem Ihr Kommentar freigegeben wurde, ist Ihr Profilbild öffentlich im Kontext Ihres Kommentars sichtbar.</p><h3>Medien</h3><p>Wenn Sie ein registrierter Benutzer sind und Fotos auf diese Website laden, sollten Sie vermeiden, Fotos mit einem EXIF-GPS-Standort hochzuladen. Besucher dieser Website könnten Fotos, die auf dieser Website gespeichert sind, downloaden und deren Standort-Informationen extrahieren.</p><h3>Kontaktformulare</h3><h3>Cookies</h3><p>Wenn Sie einen Kommentar auf unserer Website schreiben, kann das eine Einwilligung sein, Ihren Namen, E-Mail-Adresse und Website in Cookies zu speichern. Dies ist eine Komfortfunktion, damit Sie nicht, wenn Sie einen weiteren Kommentar schreiben, all diese Daten erneut eingeben müssen. Diese Cookies werden ein Jahr lang gespeichert.</p><p>Falls Sie ein Konto haben und Sie sich auf dieser Website anmelden, werden wir ein temporäres Cookie setzen, um festzustellen, ob Ihr Browser Cookies akzeptiert. Dieses Cookie enthält keine personenbezogenen Daten und wird verworfen, wenn Sie Ihren Browser schliessen.</p><p>Wenn Sie sich anmelden, werden wir einige Cookies einrichten, um Ihre Anmeldeinformationen und Anzeigeoptionen zu speichern. Anmelde-Cookies verfallen nach zwei Tagen und Cookies für die Anzeigeoptionen nach einem Jahr. Falls Sie bei der Anmeldung „Angemeldet bleiben“ auswählen, wird Ihre Anmeldung zwei Wochen lang aufrechterhalten. Mit der Abmeldung aus Ihrem Konto werden die Anmelde-Cookies gelöscht.</p><p>Wenn Sie einen Artikel bearbeiten oder veröffentlichen, wird ein zusätzlicher Cookie in Ihrem Browser gespeichert. Dieser Cookie enthält keine personenbezogenen Daten und verweist nur auf die Beitrags-ID des Artikels, den Sie gerade bearbeitet haben. Der Cookie verfällt nach einem Tag.</p><h3>Eingebettete Inhalte von anderen Websites</h3><p>Beiträge auf dieser Website können eingebettete Inhalte beinhalten (z.&nbsp;B. Videos, Bilder, Beiträge etc.). Eingebettete Inhalte von anderen Websites verhalten sich exakt so, als ob der Besucher die andere Website besucht hätte.</p><p>Diese Websites können Daten über Sie sammeln, Cookies benutzen, zusätzliche Tracking-Dienste von Dritten einbetten und Ihre Interaktion mit diesem eingebetteten Inhalt aufzeichnen, inklusive Ihrer Interaktion mit dem eingebetteten Inhalt, falls Sie ein Konto haben und auf dieser Website angemeldet sind.</p><h3>Analysedienste</h3><h2>Mit wem wir Ihre Daten teilen</h2><h2>Wie lange wir deine Daten speichern</h2><p>Wenn Sie einen Kommentar schreiben, wird dieser inklusive Metadaten zeitlich unbegrenzt gespeichert. Auf diese Art können wir Folgekommentare automatisch erkennen und freigeben, anstelle sie in einer Moderations-Warteschlange festzuhalten.</p><p>Für Benutzer, die sich auf unserer Website registrieren, speichern wir zusätzlich die persönlichen Informationen, die sie in ihren Benutzerprofilen angeben. Alle Benutzer können jederzeit ihre persönlichen Informationen einsehen, verändern oder löschen (der Benutzername kann nicht verändert werden). Administratoren der Website können diese Informationen ebenfalls einsehen und verändern.</p><h2>Welche Rechte Sie an Ihren Daten haben</h2><p>Wenn Sie ein Konto auf dieser Website besitzen oder Kommentare geschrieben haben, können Sie einen Export Ihrer personenbezogenen Daten bei uns anfordern, inklusive aller Daten, die Sie uns mitgeteilt haben. Darüber hinaus können Sie die Löschung aller personenbezogenen Daten, die wir von Ihnen gespeichert haben, anfordern. Dies umfasst nicht die Daten, die wir aufgrund administrativer, rechtlicher oder sicherheitsrelevanter Notwendigkeiten aufbewahren müssen.</p><h2>Wohin wir Ihre Daten senden</h2><p>Besucher-Kommentare könnten von einem automatisierten Dienst zur Spam-Erkennung untersucht werden.</p><h2>Ihre Kontakt-Informationen</h2><h2>Weitere Informationen</h2><h3>Wie wir Ihre Daten schützen</h3><h3>Welche Massnahmen wir bei Datenschutzverletzungen anbieten</h3><h3>Von welchen Drittanbietern wir Daten erhalten</h3><h3>Welche automatisierte Entscheidungsfindung und/oder Profilerstellung wir mit Benutzerdaten durchführen</h3><h3>Industrielle aufsichtsrechtliche Regulierungsanforderungen</h3>","Datenschutzerklärung","","draft","closed","open","","datenschutzerklaerung","","","2018-11-18 09:07:11","2018-11-18 09:07:11","","0","http://www.geraldinecamenisch.com/?page_id=3","0","page","","0"),
("5","1","2018-11-18 09:10:59","2018-11-18 09:10:59","Weit hinten, hinter den Wortbergen, fern der Länder Vokalien und Konsonantien leben die Blindtexte. Abgeschieden wohnen sie in Buchstabhausen an der Küste des Semantik, eines großen Sprachozeans.
Ein kleines Bächlein namens Duden fließt durch ihren Ort und versorgt sie mit den nötigen Regelialien. Es ist ein paradiesmatisches Land, in dem einem gebratene Satzteile in den Mund fliegen. Nicht einmal von der allmächtigen Interpunktion werden die Blindtexte beherrscht – ein geradezu unorthographisches Leben. Eines Tages aber beschloß eine kleine Zeile Blindtext, ihr Name war Lorem Ipsum, hinaus zu gehen in die weite Grammatik. Der große Oxmox riet ihr davon ab, da ...","Home","","publish","closed","closed","","home","","","2018-11-19 20:17:46","2018-11-19 20:17:46","","0","http://www.geraldinecamenisch.com/?page_id=5","0","page","","0"),
("6","1","2018-11-18 09:10:59","2018-11-18 09:10:59","Dies ist die Startseite.","Home","","inherit","closed","closed","","5-revision-v1","","","2018-11-18 09:10:59","2018-11-18 09:10:59","","5","http://www.geraldinecamenisch.com/2018/11/18/5-revision-v1/","0","revision","","0"),
("7","1","2018-11-18 09:11:31","2018-11-18 09:11:31","Weit hinten, hinter den Wortbergen, fern der Länder Vokalien und Konsonantien leben die Blindtexte. Abgeschieden wohnen sie in Buchstabhausen an der Küste des Semantik, eines großen Sprachozeans.
Ein kleines Bächlein namens Duden fließt durch ihren Ort und versorgt sie mit den nötigen Regelialien. Es ist ein paradiesmatisches Land, in dem einem gebratene Satzteile in den Mund fliegen. Nicht einmal von der allmächtigen Interpunktion werden die Blindtexte beherrscht – ein geradezu unorthographisches Leben. Eines Tages aber beschloß eine kleine Zeile Blindtext, ihr Name war Lorem Ipsum, hinaus zu gehen in die weite Grammatik. Der große Oxmox riet ihr davon ab, da ...","Biografie","","publish","closed","closed","","biografie","","","2018-11-19 18:47:57","2018-11-19 18:47:57","","0","http://www.geraldinecamenisch.com/?page_id=7","0","page","","0"),
("8","1","2018-11-18 09:11:31","2018-11-18 09:11:31","Hier steht die Biografie von Geraldinè","Biografie","","inherit","closed","closed","","7-revision-v1","","","2018-11-18 09:11:31","2018-11-18 09:11:31","","7","http://www.geraldinecamenisch.com/2018/11/18/7-revision-v1/","0","revision","","0"),
("9","1","2018-11-18 09:11:59","2018-11-18 09:11:59","Hier stehen die Konzerte und Auftritte","Agenda","","publish","closed","closed","","agenda","","","2018-11-18 09:11:59","2018-11-18 09:11:59","","0","http://www.geraldinecamenisch.com/?page_id=9","0","page","","0"),
("10","1","2018-11-18 09:11:59","2018-11-18 09:11:59","Hier stehen die Konzerte und Auftritte","Agenda","","inherit","closed","closed","","9-revision-v1","","","2018-11-18 09:11:59","2018-11-18 09:11:59","","9","http://www.geraldinecamenisch.com/2018/11/18/9-revision-v1/","0","revision","","0"),
("11","1","2018-11-18 09:12:48","2018-11-18 09:12:48","Hier stehen die verschiedenen Angebote","Repertoire","","publish","closed","closed","","repertoire","","","2018-11-18 09:12:48","2018-11-18 09:12:48","","0","http://www.geraldinecamenisch.com/?page_id=11","0","page","","0"),
("12","1","2018-11-18 09:12:48","2018-11-18 09:12:48","Hier stehen die verschiedenen Angebote","Repertoire","","inherit","closed","closed","","11-revision-v1","","","2018-11-18 09:12:48","2018-11-18 09:12:48","","11","http://www.geraldinecamenisch.com/2018/11/18/11-revision-v1/","0","revision","","0"),
("13","1","2018-11-18 09:13:11","2018-11-18 09:13:11","Hier stehen die verschiedenen Netzwerke","Netzwerk","","publish","closed","closed","","netzwerk","","","2018-11-18 09:13:11","2018-11-18 09:13:11","","0","http://www.geraldinecamenisch.com/?page_id=13","0","page","","0"),
("14","1","2018-11-18 09:13:11","2018-11-18 09:13:11","Hier stehen die verschiedenen Netzwerke","Netzwerk","","inherit","closed","closed","","13-revision-v1","","","2018-11-18 09:13:11","2018-11-18 09:13:11","","13","http://www.geraldinecamenisch.com/2018/11/18/13-revision-v1/","0","revision","","0"),
("15","1","2018-11-18 09:13:33","2018-11-18 09:13:33","Hier ist eine Galerie","Bilder","","publish","closed","closed","","bilder","","","2018-11-18 09:13:33","2018-11-18 09:13:33","","0","http://www.geraldinecamenisch.com/?page_id=15","0","page","","0"),
("16","1","2018-11-18 09:13:33","2018-11-18 09:13:33","Hier ist eine Galerie","Bilder","","inherit","closed","closed","","15-revision-v1","","","2018-11-18 09:13:33","2018-11-18 09:13:33","","15","http://www.geraldinecamenisch.com/2018/11/18/15-revision-v1/","0","revision","","0"),
("17","1","2018-11-18 09:13:51","2018-11-18 09:13:51","Dies ist eine Beispiel-Seite. Sie unterscheidet sich von Beiträgen, da sie stets an der selben Stelle bleibt und (bei den meisten Themes) in der Navigation angezeigt wird. Die meisten Leute starten mit einem Impressum, der Datenschutzerklärung oder einer &#8222;Über uns&#8220;-Seite mit einer Vorstellung für mögliche Besucher der Website. Dort könnte zum Beispiel stehen:

<blockquote>Hallo! Tagsüber arbeite ich als Fahrradkurier, nachts bin ich ein aufstrebender Schauspieler und dies hier ist meine Website. Ich lebe in Zürich, habe einen grossen Hund namens Jack, mag Pi&#241;a Coladas, jedoch weniger (ohne Schirm) im Regen stehen gelassen zu werden.</blockquote>

...oder so etwas wie:

<blockquote>Unsere Firma XYZ wurde 1971 gegründet und hat seither eine Menge hochqualitativen ABC für die Öffentlichkeit produziert. Ansässig in Gotham City, hat XYZ mittlerweile über 2.000 Mitarbeiter und entwickelt immer wieder grossartige Dinge für die ganze Gotham-Gemeinschaft.</blockquote>

Als neuer WordPress-Benutzer sollten Sie das <a href=\"http://www.geraldinecamenisch.com/wp-admin/\">Dashboard</a> aufrufen, um diese Seite zu löschen und statt dessen eine neue Seite mit Ihren eigenen Inhalten erstellen. Viel Spass!","Beispiel-Seite","","inherit","closed","closed","","2-revision-v1","","","2018-11-18 09:13:51","2018-11-18 09:13:51","","2","http://www.geraldinecamenisch.com/2018/11/18/2-revision-v1/","0","revision","","0"),
("18","1","2018-11-18 09:15:09","2018-11-18 09:15:09"," ","","","publish","closed","closed","","18","","","2018-11-18 09:15:09","2018-11-18 09:15:09","","0","http://www.geraldinecamenisch.com/?p=18","6","nav_menu_item","","0"),
("19","1","2018-11-18 09:15:09","2018-11-18 09:15:09"," ","","","publish","closed","closed","","19","","","2018-11-18 09:15:09","2018-11-18 09:15:09","","0","http://www.geraldinecamenisch.com/?p=19","5","nav_menu_item","","0"),
("20","1","2018-11-18 09:15:09","2018-11-18 09:15:09"," ","","","publish","closed","closed","","20","","","2018-11-18 09:15:09","2018-11-18 09:15:09","","0","http://www.geraldinecamenisch.com/?p=20","3","nav_menu_item","","0"),
("21","1","2018-11-18 09:15:09","2018-11-18 09:15:09"," ","","","publish","closed","closed","","21","","","2018-11-18 09:15:09","2018-11-18 09:15:09","","0","http://www.geraldinecamenisch.com/?p=21","4","nav_menu_item","","0"),
("22","1","2018-11-18 09:15:08","2018-11-18 09:15:08"," ","","","publish","closed","closed","","22","","","2018-11-18 09:15:08","2018-11-18 09:15:08","","0","http://www.geraldinecamenisch.com/?p=22","2","nav_menu_item","","0"),
("23","1","2018-11-18 09:15:08","2018-11-18 09:15:08"," ","","","publish","closed","closed","","23","","","2018-11-18 09:15:08","2018-11-18 09:15:08","","0","http://www.geraldinecamenisch.com/?p=23","1","nav_menu_item","","0"),
("24","1","2018-11-18 09:16:22","2018-11-18 09:16:22","{
    \"old_sidebars_widgets_data\": {
        \"value\": {
            \"wp_inactive_widgets\": [],
            \"sidebar-1\": [
                \"search-2\",
                \"recent-posts-2\",
                \"recent-comments-2\",
                \"archives-2\",
                \"categories-2\",
                \"meta-2\"
            ],
            \"sidebar-2\": [],
            \"sidebar-3\": []
        },
        \"type\": \"global_variable\",
        \"user_id\": 1,
        \"date_modified_gmt\": \"2018-11-18 09:16:22\"
    },
    \"twentysixteen::nav_menu_locations[primary]\": {
        \"value\": 2,
        \"type\": \"theme_mod\",
        \"user_id\": 1,
        \"date_modified_gmt\": \"2018-11-18 09:16:22\"
    }
}","","","trash","closed","closed","","32450a7f-e86a-412d-a869-cc08b7b9004c","","","2018-11-18 09:16:22","2018-11-18 09:16:22","","0","http://www.geraldinecamenisch.com/2018/11/18/32450a7f-e86a-412d-a869-cc08b7b9004c/","0","customize_changeset","","0"),
("25","1","2018-11-18 09:16:45","2018-11-18 09:16:45","{
    \"blogdescription\": {
        \"value\": \"Gerladin\\u00e8 Camenisch - Sopran\",
        \"type\": \"option\",
        \"user_id\": 1,
        \"date_modified_gmt\": \"2018-11-18 09:16:45\"
    }
}","","","trash","closed","closed","","c57a51fd-8d6f-4d38-8630-983dfbc30b9f","","","2018-11-18 09:16:45","2018-11-18 09:16:45","","0","http://www.geraldinecamenisch.com/2018/11/18/c57a51fd-8d6f-4d38-8630-983dfbc30b9f/","0","customize_changeset","","0"),
("26","1","2018-11-18 09:17:10","2018-11-18 09:17:10","{
    \"show_on_front\": {
        \"value\": \"page\",
        \"type\": \"option\",
        \"user_id\": 1,
        \"date_modified_gmt\": \"2018-11-18 09:17:10\"
    },
    \"page_on_front\": {
        \"value\": \"5\",
        \"type\": \"option\",
        \"user_id\": 1,
        \"date_modified_gmt\": \"2018-11-18 09:17:10\"
    }
}","","","trash","closed","closed","","440cdf23-2f11-499c-80b7-e1b4a9861a81","","","2018-11-18 09:17:10","2018-11-18 09:17:10","","0","http://www.geraldinecamenisch.com/2018/11/18/440cdf23-2f11-499c-80b7-e1b4a9861a81/","0","customize_changeset","","0"),
("27","1","2018-11-18 09:17:41","2018-11-18 09:17:41","{
    \"sidebars_widgets[sidebar-1]\": {
        \"value\": [],
        \"type\": \"option\",
        \"user_id\": 1,
        \"date_modified_gmt\": \"2018-11-18 09:17:41\"
    }
}","","","trash","closed","closed","","c4176efc-cdfc-4737-894c-ea77f559f132","","","2018-11-18 09:17:41","2018-11-18 09:17:41","","0","http://www.geraldinecamenisch.com/?p=27","0","customize_changeset","","0"),
("29","1","2018-11-18 09:20:14","2018-11-18 09:20:14","","Background Points","","inherit","open","closed","","background","","","2018-11-19 18:32:01","2018-11-19 18:32:01","","7","http://www.geraldinecamenisch.com/wp-content/uploads/2018/11/background.jpg","0","attachment","image/jpeg","0"),
("30","1","2018-11-18 09:20:42","2018-11-18 09:20:42","{
    \"twentysixteen::background_image\": {
        \"value\": \"http://www.geraldinecamenisch.com/wp-content/uploads/2018/11/background.jpg\",
        \"type\": \"theme_mod\",
        \"user_id\": 1,
        \"date_modified_gmt\": \"2018-11-18 09:20:42\"
    }
}","","","trash","closed","closed","","e5447df3-7c34-46c8-8a41-91154e891192","","","2018-11-18 09:20:42","2018-11-18 09:20:42","","0","http://www.geraldinecamenisch.com/2018/11/18/e5447df3-7c34-46c8-8a41-91154e891192/","0","customize_changeset","","0"),
("31","1","2018-11-18 13:45:32","2018-11-18 13:45:32","Weit hinten, hinter den Wortbergen, fern der Länder Vokalien und Konsonantien leben die Blindtexte. Abgeschieden wohnen sie in Buchstabhausen an der Küste des Semantik, eines großen Sprachozeans.
Ein kleines Bächlein namens Duden fließt durch ihren Ort und versorgt sie mit den nötigen Regelialien. Es ist ein paradiesmatisches Land, in dem einem gebratene Satzteile in den Mund fliegen. Nicht einmal von der allmächtigen Interpunktion werden die Blindtexte beherrscht – ein geradezu unorthographisches Leben. Eines Tages aber beschloß eine kleine Zeile Blindtext, ihr Name war Lorem Ipsum, hinaus zu gehen in die weite Grammatik. Der große Oxmox riet ihr davon ab, da ...","Home","","inherit","closed","closed","","5-autosave-v1","","","2018-11-18 13:45:32","2018-11-18 13:45:32","","5","http://www.geraldinecamenisch.com/2018/11/18/5-autosave-v1/","0","revision","","0"),
("32","1","2018-11-18 09:36:23","2018-11-18 09:36:23","","1","","inherit","open","closed","","1","","","2018-11-19 12:13:52","2018-11-19 12:13:52","","5","http://www.geraldinecamenisch.com/wp-content/uploads/2018/11/1.jpg","0","attachment","image/jpeg","0"),
("33","1","2018-11-18 09:36:24","2018-11-18 09:36:24","","5","","inherit","open","closed","","5","","","2018-11-19 20:17:39","2018-11-19 20:17:39","","5","http://www.geraldinecamenisch.com/wp-content/uploads/2018/11/5.jpg","0","attachment","image/jpeg","0"),
("34","1","2018-11-18 09:37:35","2018-11-18 09:37:35","<h1>Next Event</h1>
Weit hinten, hinter den Wortbergen, fern der Länder Vokalien und Konsonantien leben die Blindtexte. Abgeschieden wohnen sie in Buchstabhausen an der Küste des Semantik, eines großen Sprachozeans.
Ein kleines Bächlein namens Duden fließt durch ihren Ort und versorgt sie mit den nötigen Regelialien. Es ist ein paradiesmatisches Land, in dem einem gebratene Satzteile in den Mund fliegen. Nicht einmal von der allmächtigen Interpunktion werden die Blindtexte beherrscht – ein geradezu unorthographisches Leben. Eines Tages aber beschloß eine kleine Zeile Blindtext, ihr Name war Lorem Ipsum, hinaus zu gehen in die weite Grammatik. Der große Oxmox riet ihr davon ab, da ...","Home","","inherit","closed","closed","","5-revision-v1","","","2018-11-18 09:37:35","2018-11-18 09:37:35","","5","http://www.geraldinecamenisch.com/2018/11/18/5-revision-v1/","0","revision","","0"),
("35","1","2018-11-18 13:42:13","2018-11-18 13:42:13","Weit hinten, hinter den Wortbergen, fern der Länder Vokalien und Konsonantien leben die Blindtexte. Abgeschieden wohnen sie in Buchstabhausen an der Küste des Semantik, eines großen Sprachozeans.
Ein kleines Bächlein namens Duden fließt durch ihren Ort und versorgt sie mit den nötigen Regelialien. Es ist ein paradiesmatisches Land, in dem einem gebratene Satzteile in den Mund fliegen. Nicht einmal von der allmächtigen Interpunktion werden die Blindtexte beherrscht – ein geradezu unorthographisches Leben. Eines Tages aber beschloß eine kleine Zeile Blindtext, ihr Name war Lorem Ipsum, hinaus zu gehen in die weite Grammatik. Der große Oxmox riet ihr davon ab, da ...","Home","","inherit","closed","closed","","5-revision-v1","","","2018-11-18 13:42:13","2018-11-18 13:42:13","","5","http://www.geraldinecamenisch.com/2018/11/18/5-revision-v1/","0","revision","","0"),
("36","1","2018-11-18 13:47:59","2018-11-18 13:47:59","Weit hinten, hinter den Wortbergen, fern der Länder Vokalien und Konsonantien leben die Blindtexte. Abgeschieden wohnen sie in Buchstabhausen an der Küste des Semantik, eines großen Sprachozeans.
Ein kleines Bächlein namens Duden fließt durch ihren Ort und versorgt sie mit den nötigen Regelialien. Es ist ein paradiesmatisches Land, in dem einem gebratene Satzteile in den Mund fliegen. Nicht einmal von der allmächtigen Interpunktion werden die Blindtexte beherrscht – ein geradezu unorthographisches Leben. Eines Tages aber beschloß eine kleine Zeile Blindtext, ihr Name war Lorem Ipsum, hinaus zu gehen in die weite Grammatik. Der große Oxmox riet ihr davon ab, da ...","Home","","inherit","closed","closed","","5-revision-v1","","","2018-11-18 13:47:59","2018-11-18 13:47:59","","5","http://www.geraldinecamenisch.com/2018/11/18/5-revision-v1/","0","revision","","0"),
("37","1","2018-11-18 13:53:44","2018-11-18 13:53:44","","logo","","inherit","open","closed","","logo","","","2018-11-18 13:53:44","2018-11-18 13:53:44","","0","http://www.geraldinecamenisch.com/wp-content/uploads/2018/11/logo.png","0","attachment","image/png","0"),
("39","1","2018-11-18 15:22:49","2018-11-18 15:22:49","Weit hinten, hinter den Wortbergen, fern der Länder Vokalien und Konsonantien leben die Blindtexte. Abgeschieden wohnen sie in Buchstabhausen an der Küste des Semantik, eines großen Sprachozeans.
Ein kleines Bächlein namens Duden fließt durch ihren Ort und versorgt sie mit den nötigen Regelialien. Es ist ein paradiesmatisches Land, in dem einem gebratene Satzteile in den Mund fliegen. Nicht einmal von der allmächtigen Interpunktion werden die Blindtexte beherrscht – ein geradezu unorthographisches Leben. Eines Tages aber beschloß eine kleine Zeile Blindtext, ihr Name war Lorem Ipsum, hinaus zu gehen in die weite Grammatik. Der große Oxmox riet ihr davon ab, da ...<img class=\"alignnone size-medium wp-image-33\" src=\"http://www.geraldinecamenisch.com/wp-content/uploads/2018/11/5-225x300.jpg\" alt=\"\" width=\"225\" height=\"300\" />","Biografie","","inherit","closed","closed","","7-revision-v1","","","2018-11-18 15:22:49","2018-11-18 15:22:49","","7","http://www.geraldinecamenisch.com/7-revision-v1/","0","revision","","0"),
("40","1","2018-11-18 18:03:29","2018-11-18 18:03:29","Weit hinten, hinter den Wortbergen, fern der Länder Vokalien und Konsonantien leben die Blindtexte. Abgeschieden wohnen sie in Buchstabhausen an der Küste des Semantik, eines großen Sprachozeans.
Ein kleines Bächlein namens Duden fließt durch ihren Ort und versorgt sie mit den nötigen Regelialien. Es ist ein paradiesmatisches Land, in dem einem gebratene Satzteile in den Mund fliegen. Nicht einmal von der allmächtigen Interpunktion werden die Blindtexte beherrscht – ein geradezu unorthographisches Leben. Eines Tages aber beschloß eine kleine Zeile Blindtext, ihr Name war Lorem Ipsum, hinaus zu gehen in die weite Grammatik. Der große Oxmox riet ihr davon ab, da ...","Biografie","","inherit","closed","closed","","7-revision-v1","","","2018-11-18 18:03:29","2018-11-18 18:03:29","","7","http://www.geraldinecamenisch.com/7-revision-v1/","0","revision","","0"),
("42","1","2018-11-18 18:32:23","2018-11-18 18:32:23","Weit hinten, hinter den Wortbergen, fern der Länder Vokalien und Konsonantien leben die Blindtexte. Abgeschieden wohnen sie in Buchstabhausen an der Küste des Semantik, eines großen Sprachozeans.
Ein kleines Bächlein namens Duden fließt durch ihren Ort und versorgt sie mit den nötigen Regelialien. Es ist ein paradiesmatisches Land, in dem einem gebratene Satzteile in den Mund fliegen. Nicht einmal von der allmächtigen Interpunktion werden die Blindtexte beherrscht – ein geradezu unorthographisches Leben. Eines Tages aber beschloß eine kleine Zeile Blindtext, ihr Name war Lorem Ipsum, hinaus zu gehen in die weite Grammatik. Der große Oxmox riet ihr davon ab, da ...","Biografie","","inherit","closed","closed","","7-autosave-v1","","","2018-11-18 18:32:23","2018-11-18 18:32:23","","7","http://www.geraldinecamenisch.com/7-autosave-v1/","0","revision","","0"),
("43","1","2018-11-18 18:36:25","2018-11-18 18:36:25","Weit hinten, hinter den Wortbergen, fern der Länder Vokalien und Konsonantien leben die Blindtexte. Abgeschieden wohnen sie in Buchstabhausen an der Küste des Semantik, eines großen Sprachozeans.
Ein kleines Bächlein namens Duden fließt durch ihren Ort und versorgt sie mit den nötigen Regelialien. Es ist ein paradiesmatisches Land, in dem einem gebratene Satzteile in den Mund fliegen. Nicht einmal von der allmächtigen Interpunktion werden die Blindtexte beherrscht – ein geradezu unorthographisches Leben. Eines Tages aber beschloß eine kleine Zeile Blindtext, ihr Name war Lorem Ipsum, hinaus zu gehen in die weite Grammatik. Der große Oxmox riet ihr davon ab, da ...","Biografie","","inherit","closed","closed","","7-revision-v1","","","2018-11-18 18:36:25","2018-11-18 18:36:25","","7","http://www.geraldinecamenisch.com/7-revision-v1/","0","revision","","0"),
("44","1","2018-11-18 18:39:22","2018-11-18 18:39:22","Weit hinten, hinter den Wortbergen, fern der Länder Vokalien und Konsonantien leben die Blindtexte. Abgeschieden wohnen sie in Buchstabhausen an der Küste des Semantik, eines großen Sprachozeans.
Ein kleines Bächlein namens Duden fließt durch ihren Ort und versorgt sie mit den nötigen Regelialien. Es ist ein paradiesmatisches Land, in dem einem gebratene Satzteile in den Mund fliegen. Nicht einmal von der allmächtigen Interpunktion werden die Blindtexte beherrscht – ein geradezu unorthographisches Leben. Eines Tages aber beschloß eine kleine Zeile Blindtext, ihr Name war Lorem Ipsum, hinaus zu gehen in die weite Grammatik. Der große Oxmox riet ihr davon ab, da ...","Biografie","","inherit","closed","closed","","7-revision-v1","","","2018-11-18 18:39:22","2018-11-18 18:39:22","","7","http://www.geraldinecamenisch.com/7-revision-v1/","0","revision","","0"),
("45","1","2018-11-19 11:34:35","2018-11-19 11:34:35","Weit hinten, hinter den Wortbergen, fern der Länder Vokalien und Konsonantien leben die Blindtexte. Abgeschieden wohnen sie in Buchstabhausen an der Küste des Semantik, eines großen Sprachozeans.
Ein kleines Bächlein namens Duden fließt durch ihren Ort und versorgt sie mit den nötigen Regelialien. Es ist ein paradiesmatisches Land, in dem einem gebratene Satzteile in den Mund fliegen. Nicht einmal von der allmächtigen Interpunktion werden die Blindtexte beherrscht – ein geradezu unorthographisches Leben. Eines Tages aber beschloß eine kleine Zeile Blindtext, ihr Name war Lorem Ipsum, hinaus zu gehen in die weite Grammatik. Der große Oxmox riet ihr davon ab, da ...","Biografie","","inherit","closed","closed","","7-revision-v1","","","2018-11-19 11:34:35","2018-11-19 11:34:35","","7","http://www.geraldinecamenisch.com/7-revision-v1/","0","revision","","0"),
("46","1","2018-11-19 18:29:36","2018-11-19 18:29:36","Weit hinten, hinter den Wortbergen, fern der Länder Vokalien und Konsonantien leben die Blindtexte. Abgeschieden wohnen sie in Buchstabhausen an der Küste des Semantik, eines großen Sprachozeans.
Ein kleines Bächlein namens Duden fließt durch ihren Ort und versorgt sie mit den nötigen Regelialien. Es ist ein paradiesmatisches Land, in dem einem gebratene Satzteile in den Mund fliegen. Nicht einmal von der allmächtigen Interpunktion werden die Blindtexte beherrscht – ein geradezu unorthographisches Leben. Eines Tages aber beschloß eine kleine Zeile Blindtext, ihr Name war Lorem Ipsum, hinaus zu gehen in die weite Grammatik. Der große Oxmox riet ihr davon ab, da ...","Biografie","","inherit","closed","closed","","7-revision-v1","","","2018-11-19 18:29:36","2018-11-19 18:29:36","","7","http://www.geraldinecamenisch.com/7-revision-v1/","0","revision","","0"),
("47","1","2018-11-19 18:30:50","2018-11-19 18:30:50","Weit hinten, hinter den Wortbergen, fern der Länder Vokalien und Konsonantien leben die Blindtexte. Abgeschieden wohnen sie in Buchstabhausen an der Küste des Semantik, eines großen Sprachozeans.
Ein kleines Bächlein namens Duden fließt durch ihren Ort und versorgt sie mit den nötigen Regelialien. Es ist ein paradiesmatisches Land, in dem einem gebratene Satzteile in den Mund fliegen. Nicht einmal von der allmächtigen Interpunktion werden die Blindtexte beherrscht – ein geradezu unorthographisches Leben. Eines Tages aber beschloß eine kleine Zeile Blindtext, ihr Name war Lorem Ipsum, hinaus zu gehen in die weite Grammatik. Der große Oxmox riet ihr davon ab, da ...","Biografie","","inherit","closed","closed","","7-revision-v1","","","2018-11-19 18:30:50","2018-11-19 18:30:50","","7","http://www.geraldinecamenisch.com/7-revision-v1/","0","revision","","0"),
("48","1","2018-11-19 18:32:01","2018-11-19 18:32:01","Weit hinten, hinter den Wortbergen, fern der Länder Vokalien und Konsonantien leben die Blindtexte. Abgeschieden wohnen sie in Buchstabhausen an der Küste des Semantik, eines großen Sprachozeans.
Ein kleines Bächlein namens Duden fließt durch ihren Ort und versorgt sie mit den nötigen Regelialien. Es ist ein paradiesmatisches Land, in dem einem gebratene Satzteile in den Mund fliegen. Nicht einmal von der allmächtigen Interpunktion werden die Blindtexte beherrscht – ein geradezu unorthographisches Leben. Eines Tages aber beschloß eine kleine Zeile Blindtext, ihr Name war Lorem Ipsum, hinaus zu gehen in die weite Grammatik. Der große Oxmox riet ihr davon ab, da ...","Biografie","","inherit","closed","closed","","7-revision-v1","","","2018-11-19 18:32:01","2018-11-19 18:32:01","","7","http://www.geraldinecamenisch.com/7-revision-v1/","0","revision","","0"),
("49","1","2018-11-19 18:40:58","2018-11-19 18:40:58","Weit hinten, hinter den Wortbergen, fern der Länder Vokalien und Konsonantien leben die Blindtexte. Abgeschieden wohnen sie in Buchstabhausen an der Küste des Semantik, eines großen Sprachozeans.
Ein kleines Bächlein namens Duden fließt durch ihren Ort und versorgt sie mit den nötigen Regelialien. Es ist ein paradiesmatisches Land, in dem einem gebratene Satzteile in den Mund fliegen. Nicht einmal von der allmächtigen Interpunktion werden die Blindtexte beherrscht – ein geradezu unorthographisches Leben. Eines Tages aber beschloß eine kleine Zeile Blindtext, ihr Name war Lorem Ipsum, hinaus zu gehen in die weite Grammatik. Der große Oxmox riet ihr davon ab, da ...","Biografie","","inherit","closed","closed","","7-revision-v1","","","2018-11-19 18:40:58","2018-11-19 18:40:58","","7","http://www.geraldinecamenisch.com/7-revision-v1/","0","revision","","0"),
("50","1","2018-11-19 18:44:53","2018-11-19 18:44:53","Weit hinten, hinter den Wortbergen, fern der Länder Vokalien und Konsonantien leben die Blindtexte. Abgeschieden wohnen sie in Buchstabhausen an der Küste des Semantik, eines großen Sprachozeans.
Ein kleines Bächlein namens Duden fließt durch ihren Ort und versorgt sie mit den nötigen Regelialien. Es ist ein paradiesmatisches Land, in dem einem gebratene Satzteile in den Mund fliegen. Nicht einmal von der allmächtigen Interpunktion werden die Blindtexte beherrscht – ein geradezu unorthographisches Leben. Eines Tages aber beschloß eine kleine Zeile Blindtext, ihr Name war Lorem Ipsum, hinaus zu gehen in die weite Grammatik. Der große Oxmox riet ihr davon ab, da ...","Biografie","","inherit","closed","closed","","7-revision-v1","","","2018-11-19 18:44:53","2018-11-19 18:44:53","","7","http://www.geraldinecamenisch.com/7-revision-v1/","0","revision","","0"),
("51","1","2018-11-19 18:46:51","2018-11-19 18:46:51","","IMG_3763","","inherit","open","closed","","img_3763","","","2018-11-19 20:17:34","2018-11-19 20:17:34","","7","http://www.geraldinecamenisch.com/wp-content/uploads/2018/11/IMG_3763.jpg","0","attachment","image/jpeg","0"),
("52","1","2018-11-19 18:47:07","2018-11-19 18:47:07","","IMG_3778","","inherit","open","closed","","img_3778","","","2018-11-19 18:47:07","2018-11-19 18:47:07","","0","http://www.geraldinecamenisch.com/wp-content/uploads/2018/11/IMG_3778.jpg","0","attachment","image/jpeg","0"),
("53","1","2018-11-19 18:47:57","2018-11-19 18:47:57","Weit hinten, hinter den Wortbergen, fern der Länder Vokalien und Konsonantien leben die Blindtexte. Abgeschieden wohnen sie in Buchstabhausen an der Küste des Semantik, eines großen Sprachozeans.
Ein kleines Bächlein namens Duden fließt durch ihren Ort und versorgt sie mit den nötigen Regelialien. Es ist ein paradiesmatisches Land, in dem einem gebratene Satzteile in den Mund fliegen. Nicht einmal von der allmächtigen Interpunktion werden die Blindtexte beherrscht – ein geradezu unorthographisches Leben. Eines Tages aber beschloß eine kleine Zeile Blindtext, ihr Name war Lorem Ipsum, hinaus zu gehen in die weite Grammatik. Der große Oxmox riet ihr davon ab, da ...","Biografie","","inherit","closed","closed","","7-revision-v1","","","2018-11-19 18:47:57","2018-11-19 18:47:57","","7","http://www.geraldinecamenisch.com/7-revision-v1/","0","revision","","0"),
("54","1","2018-11-19 20:17:46","2018-11-19 20:17:46","Weit hinten, hinter den Wortbergen, fern der Länder Vokalien und Konsonantien leben die Blindtexte. Abgeschieden wohnen sie in Buchstabhausen an der Küste des Semantik, eines großen Sprachozeans.
Ein kleines Bächlein namens Duden fließt durch ihren Ort und versorgt sie mit den nötigen Regelialien. Es ist ein paradiesmatisches Land, in dem einem gebratene Satzteile in den Mund fliegen. Nicht einmal von der allmächtigen Interpunktion werden die Blindtexte beherrscht – ein geradezu unorthographisches Leben. Eines Tages aber beschloß eine kleine Zeile Blindtext, ihr Name war Lorem Ipsum, hinaus zu gehen in die weite Grammatik. Der große Oxmox riet ihr davon ab, da ...","Home","","inherit","closed","closed","","5-revision-v1","","","2018-11-19 20:17:46","2018-11-19 20:17:46","","5","http://www.geraldinecamenisch.com/5-revision-v1/","0","revision","","0"),
("55","1","2018-11-25 10:59:15","0000-00-00 00:00:00","","Automatisch gespeicherter Entwurf","","auto-draft","open","open","","","","","2018-11-25 10:59:15","0000-00-00 00:00:00","","0","http://www.geraldinecamenisch.com/?p=55","0","post","","0"),
("56","1","2018-11-25 11:00:00","0000-00-00 00:00:00","","Automatisch gespeicherter Entwurf","","auto-draft","closed","closed","","","","","2018-11-25 11:00:00","0000-00-00 00:00:00","","0","http://www.geraldinecamenisch.com/?post_type=acf-field-group&p=56","0","acf-field-group","","0");/*END*/




DROP TABLE IF EXISTS `webtoffee_term_relationships` ;/*END*/ 

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";/*END*/
SET time_zone = "+00:00";/*END*/


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;/*END*/
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;/*END*/
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;/*END*/
/*!40101 SET NAMES utf8 */;/*END*/
--
-- Database: `sqlcamenisch`
--




CREATE TABLE `webtoffee_term_relationships` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;/*END*/


INSERT INTO webtoffee_term_relationships VALUES
("1","1","0"),
("18","2","0"),
("19","2","0"),
("20","2","0"),
("21","2","0"),
("22","2","0"),
("23","2","0");/*END*/




DROP TABLE IF EXISTS `webtoffee_term_taxonomy` ;/*END*/ 

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";/*END*/
SET time_zone = "+00:00";/*END*/


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;/*END*/
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;/*END*/
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;/*END*/
/*!40101 SET NAMES utf8 */;/*END*/
--
-- Database: `sqlcamenisch`
--




CREATE TABLE `webtoffee_term_taxonomy` (
  `term_taxonomy_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;/*END*/


INSERT INTO webtoffee_term_taxonomy VALUES
("1","1","category","","0","1"),
("2","2","nav_menu","","0","6");/*END*/




DROP TABLE IF EXISTS `webtoffee_termmeta` ;/*END*/ 

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";/*END*/
SET time_zone = "+00:00";/*END*/


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;/*END*/
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;/*END*/
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;/*END*/
/*!40101 SET NAMES utf8 */;/*END*/
--
-- Database: `sqlcamenisch`
--




CREATE TABLE `webtoffee_termmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `term_id` (`term_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;/*END*/






DROP TABLE IF EXISTS `webtoffee_terms` ;/*END*/ 

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";/*END*/
SET time_zone = "+00:00";/*END*/


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;/*END*/
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;/*END*/
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;/*END*/
/*!40101 SET NAMES utf8 */;/*END*/
--
-- Database: `sqlcamenisch`
--




CREATE TABLE `webtoffee_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  KEY `slug` (`slug`(191)),
  KEY `name` (`name`(191))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;/*END*/


INSERT INTO webtoffee_terms VALUES
("1","Allgemein","allgemein","0"),
("2","hauptnavi","hauptnavi","0");/*END*/




DROP TABLE IF EXISTS `webtoffee_usermeta` ;/*END*/ 

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";/*END*/
SET time_zone = "+00:00";/*END*/


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;/*END*/
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;/*END*/
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;/*END*/
/*!40101 SET NAMES utf8 */;/*END*/
--
-- Database: `sqlcamenisch`
--




CREATE TABLE `webtoffee_usermeta` (
  `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;/*END*/


INSERT INTO webtoffee_usermeta VALUES
("1","1","nickname","camenisch"),
("2","1","first_name",""),
("3","1","last_name",""),
("4","1","description",""),
("5","1","rich_editing","true"),
("6","1","syntax_highlighting","true"),
("7","1","comment_shortcuts","false"),
("8","1","admin_color","fresh"),
("9","1","use_ssl","0"),
("10","1","show_admin_bar_front","true"),
("11","1","locale","de_CH"),
("12","1","webtoffee_capabilities","a:1:{s:13:\"administrator\";b:1;}"),
("13","1","webtoffee_user_level","10"),
("14","1","dismissed_wp_pointers","wp496_privacy,plugin_editor_notice,theme_editor_notice,black_studio_tinymce_widget"),
("15","1","show_welcome_panel","1"),
("16","1","session_tokens","a:1:{s:64:\"c1480c95158fbf06bf690e862b135b154cf1d7a07042bd065be61e2534eac555\";a:4:{s:10:\"expiration\";i:1543316354;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:139:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36 OPR/56.0.3051.104\";s:5:\"login\";i:1543143554;}}"),
("17","1","webtoffee_dashboard_quick_press_last_post_id","55"),
("18","1","community-events-location","a:1:{s:2:\"ip\";s:9:\"127.0.0.0\";}"),
("19","1","managenav-menuscolumnshidden","a:5:{i:0;s:11:\"link-target\";i:1;s:11:\"css-classes\";i:2;s:3:\"xfn\";i:3;s:11:\"description\";i:4;s:15:\"title-attribute\";}"),
("20","1","metaboxhidden_nav-menus","a:2:{i:0;s:12:\"add-post_tag\";i:1;s:15:\"add-post_format\";}"),
("21","1","nav_menu_recently_edited","2"),
("22","1","webtoffee_user-settings","libraryContent=browse&editor=html"),
("23","1","webtoffee_user-settings-time","1542652246"),
("25","1","ac_preferences_check-review","a:1:{s:18:\"first-login-review\";i:1542548501;}"),
("26","1","closedpostboxes_page","a:4:{i:0;s:23:\"acf-group_5583cd2c38a7c\";i:1;s:23:\"acf-group_55ddc8a3f0861\";i:2;s:10:\"wpseo_meta\";i:3;s:23:\"acf-group_56a879eed3ccb\";}"),
("27","1","metaboxhidden_page","a:15:{i:0;s:23:\"acf-group_566aa0e932e70\";i:1;s:23:\"acf-group_55a4c2e1c1bda\";i:2;s:23:\"acf-group_55deb3a003568\";i:3;s:23:\"acf-group_55acc785d5e06\";i:4;s:23:\"acf-group_5583cd2c41870\";i:5;s:23:\"acf-group_55cb3e22a22fe\";i:6;s:23:\"acf-group_55d197981b0e5\";i:7;s:23:\"acf-group_5583cd2c748ac\";i:8;s:23:\"acf-group_55f2bdc30462f\";i:9;s:23:\"acf-group_5583cd2bea022\";i:10;s:12:\"revisionsdiv\";i:11;s:16:\"commentstatusdiv\";i:12;s:11:\"commentsdiv\";i:13;s:7:\"slugdiv\";i:14;s:9:\"authordiv\";}"),
("28","1","eae_dismissed_page_scanner_notice","1"),
("29","1","show_try_gutenberg_panel","0"),
("30","1","closedpostboxes_dashboard","a:3:{i:0;s:18:\"dashboard_activity\";i:1;s:24:\"wpseo-dashboard-overview\";i:2;s:17:\"dashboard_primary\";}"),
("31","1","metaboxhidden_dashboard","a:0:{}"),
("32","1","wp_caac_preferences_settings","a:1:{s:11:\"list_screen\";s:4:\"post\";}"),
("33","1","wp_cayoast_notifications","a:2:{i:0;a:2:{s:7:\"message\";s:391:\"Yoast SEO and Advanced Custom Fields can work together a lot better by adding a helper plugin. Please activate <a href=\"http://www.geraldinecamenisch.com/wp-admin/plugins.php?action=activate&amp;plugin_status=all&amp;paged=1&amp;s&amp;plugin=acf-content-analysis-for-yoast-seo%2Fyoast-acf-analysis.php&amp;_wpnonce=e5561c7f50\">ACF Content Analysis for Yoast SEO</a> to make your life better.\";s:7:\"options\";a:9:{s:4:\"type\";s:7:\"warning\";s:2:\"id\";s:41:\"wpseo-suggested-plugin-yoast-acf-analysis\";s:5:\"nonce\";N;s:8:\"priority\";d:0.5;s:9:\"data_json\";a:0:{}s:13:\"dismissal_key\";N;s:12:\"capabilities\";a:1:{i:0;s:15:\"install_plugins\";}s:16:\"capability_check\";s:3:\"all\";s:14:\"yoast_branding\";b:0;}}i:1;a:2:{s:7:\"message\";s:176:\"Don\'t miss your crawl errors: <a href=\"http://www.geraldinecamenisch.com/wp-admin/admin.php?page=wpseo_search_console&tab=settings\">connect with Google Search Console here</a>.\";s:7:\"options\";a:9:{s:4:\"type\";s:7:\"warning\";s:2:\"id\";s:17:\"wpseo-dismiss-gsc\";s:5:\"nonce\";N;s:8:\"priority\";d:0.5;s:9:\"data_json\";a:0:{}s:13:\"dismissal_key\";N;s:12:\"capabilities\";s:20:\"wpseo_manage_options\";s:16:\"capability_check\";s:3:\"all\";s:14:\"yoast_branding\";b:0;}}}"),
("34","1","meta-box-order_page","a:4:{s:15:\"acf_after_title\";s:95:\"acf-group_566aa0e932e70,acf-group_5583cd2cc6dac,acf-group_55a4c2e1c1bda,acf-group_55deb3a003568\";s:4:\"side\";s:84:\"submitdiv,pageparentdiv,acf-group_5583cd2c38a7c,acf-group_55ddc8a3f0861,postimagediv\";s:6:\"normal\";s:286:\"acf-group_5583cd2c8c727,wpseo_meta,acf-group_55acc785d5e06,acf-group_5583cd2c41870,acf-group_55cb3e22a22fe,acf-group_55d197981b0e5,acf-group_5583cd2c748ac,acf-group_56a879eed3ccb,acf-group_55f2bdc30462f,acf-group_5583cd2bea022,revisionsdiv,commentstatusdiv,commentsdiv,slugdiv,authordiv\";s:8:\"advanced\";s:0:\"\";}"),
("35","1","screen_layout_page","2"),
("36","2","nickname","admin"),
("37","2","first_name","admin"),
("38","2","last_name",""),
("39","2","description",""),
("40","2","rich_editing","true"),
("41","2","syntax_highlighting","true"),
("42","2","comment_shortcuts","false"),
("43","2","admin_color","fresh"),
("44","2","use_ssl","0"),
("45","2","show_admin_bar_front","true"),
("46","2","locale",""),
("47","2","webtoffee_capabilities","a:1:{s:13:\"administrator\";b:1;}"),
("48","2","webtoffee_user_level","10"),
("49","2","_yoast_wpseo_profile_updated","1543143659"),
("50","2","dismissed_wp_pointers","wp496_privacy"),
("51","1","wp_camedia_library_mode","list"),
("52","2","wpseo_title",""),
("53","2","wpseo_metadesc",""),
("54","2","wpseo_noindex_author",""),
("55","2","wpseo_content_analysis_disable",""),
("56","2","wpseo_keyword_analysis_disable",""),
("57","2","googleplus",""),
("58","2","twitter",""),
("59","2","facebook",""),
("60","1","pll_dismissed_notices","a:1:{i:0;s:8:\"lingotek\";}"),
("61","1","_yoast_wpseo_profile_updated","1543144185"),
("62","1","wpseo_title",""),
("63","1","wpseo_metadesc",""),
("64","1","wpseo_noindex_author",""),
("65","1","wpseo_content_analysis_disable",""),
("66","1","wpseo_keyword_analysis_disable",""),
("67","1","googleplus",""),
("68","1","twitter",""),
("69","1","facebook","");/*END*/




DROP TABLE IF EXISTS `webtoffee_users` ;/*END*/ 

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";/*END*/
SET time_zone = "+00:00";/*END*/


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;/*END*/
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;/*END*/
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;/*END*/
/*!40101 SET NAMES utf8 */;/*END*/
--
-- Database: `sqlcamenisch`
--




CREATE TABLE `webtoffee_users` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`),
  KEY `user_email` (`user_email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;/*END*/


INSERT INTO webtoffee_users VALUES
("1","camenisch","$P$BCzBM2DN0TEJAg5726hGOMSnyiqar41","camenisch","candy.padmore@bluewin.ch","","2018-11-18 09:07:11","","0","camenisch"),
("2","admin","$P$BZhcntRMYChozW7SJIlxiVPPgEJ4N90","admin","pegasus-1880@bluewin.ch","","2018-11-19 18:58:29","1542653909:$P$B5tVwU3iHg46mPfvWmygrwKl.xRydy0","0","admin");/*END*/




DROP TABLE IF EXISTS `webtoffee_yoast_seo_links` ;/*END*/ 

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";/*END*/
SET time_zone = "+00:00";/*END*/


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;/*END*/
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;/*END*/
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;/*END*/
/*!40101 SET NAMES utf8 */;/*END*/
--
-- Database: `sqlcamenisch`
--




CREATE TABLE `webtoffee_yoast_seo_links` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_id` bigint(20) unsigned NOT NULL,
  `target_post_id` bigint(20) unsigned NOT NULL,
  `type` varchar(8) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `link_direction` (`post_id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;/*END*/






DROP TABLE IF EXISTS `webtoffee_yoast_seo_meta` ;/*END*/ 

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";/*END*/
SET time_zone = "+00:00";/*END*/


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;/*END*/
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;/*END*/
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;/*END*/
/*!40101 SET NAMES utf8 */;/*END*/
--
-- Database: `sqlcamenisch`
--




CREATE TABLE `webtoffee_yoast_seo_meta` (
  `object_id` bigint(20) unsigned NOT NULL,
  `internal_link_count` int(10) unsigned DEFAULT NULL,
  `incoming_link_count` int(10) unsigned DEFAULT NULL,
  UNIQUE KEY `object_id` (`object_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;/*END*/


INSERT INTO webtoffee_yoast_seo_meta VALUES
("4","0","0"),
("5","0","0"),
("7","0","0"),
("28","0","0"),
("38","0","0"),
("41","0","0");/*END*/


