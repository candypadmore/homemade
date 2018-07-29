<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define('DB_NAME', 'sqlgeraldine');

/** MySQL database username */
define('DB_USER', 'sqlgeraldine');

/** MySQL database password */
define('DB_PASSWORD', 'pa6gQS9!.4');

/** MySQL hostname */
define('DB_HOST', 'localhost');

/** Database Charset to use in creating database tables. */
define('DB_CHARSET', 'utf8mb4');

/** The Database Collate type. Don't change this if in doubt. */
define('DB_COLLATE', '');

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'ffyg2zema36duyr4yfu4deem7vihlnufjfx9kd3if0nwjauzziyg1wtyd6dgggrh');
define('SECURE_AUTH_KEY',  '0se6vxkxnhvv5jkawmf3edjy1vuznmdyxzuhkipd3oejixbhucjr1z8deyfm8bh4');
define('LOGGED_IN_KEY',    'sqodwdl5t87mftiumdrl1k75fpyppruttp4hnzyz2qg1dntnxkc3ovsfyrvjx816');
define('NONCE_KEY',        'ihrnf6zozzsxedibgpyzehapvwy5ghnb8prkgdodgb9azgze0mat1wmdsejmp33i');
define('AUTH_SALT',        'ni6rnnz0i5tddqrvjxk81epmmy2qhhevwgmumhe7mx86jbtpuc5etyw7r0spjfuf');
define('SECURE_AUTH_SALT', 'dk8vrgbcw3p4g2qrhxqliifsv8mwrfehfmzwzntueeolfxgbztl5rvswrbam7wxm');
define('LOGGED_IN_SALT',   '7tbwsp5ftfudjl8z18gpoohtwyrwe7vzmf86r4fudil4buo27zxlugpf4ihmas36');
define('NONCE_SALT',       '7lpfpjlv6pogk4ryev61qabgn446dvurop5om3yhh3saktgexix6j08cmednmzog');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix  = 'wpsx_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the Codex.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define('WP_DEBUG', false);

/* Multisite */
define( 'WP_ALLOW_MULTISITE', true );
define('MULTISITE', true);
define('SUBDOMAIN_INSTALL', false);
define('DOMAIN_CURRENT_SITE', 'www.geraldine-camenisch.test');
define('PATH_CURRENT_SITE', '/');
define('SITE_ID_CURRENT_SITE', 1);
define('BLOG_ID_CURRENT_SITE', 1);

/* That's all, stop editing! Happy blogging. */

/** Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');
