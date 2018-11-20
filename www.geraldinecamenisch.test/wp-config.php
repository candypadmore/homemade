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
define('DB_NAME', 'sqlcamenisch');

/** MySQL database username */
define('DB_USER', 'root');

/** MySQL database password */
define('DB_PASSWORD', 'mysql');

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
define('AUTH_KEY',         '@}n7NB,&w>rMtro:709)g51_ -*`rb(.{6Dz~nmx8{KKT/,&tcZ}%VzJ( MwH^.~');
define('SECURE_AUTH_KEY',  'T!aml!g;~+oMauU,8{giNh${_]R]bEbs(1]3b+i|y1738RqY{Z4yc*:L`,vOwcY1');
define('LOGGED_IN_KEY',    '^1W-~f!7knt6vPg@Z0KYiD!=P}y!{E8~V28If^)i:)dDB*s^ -%wKRu)`6=8SW)b');
define('NONCE_KEY',        'Qv V6S-:-lPpu=[/laRA((bizO,xn3lIR]4OpCOc[Ca%n|TCa]06vkWrJ*PD42{h');
define('AUTH_SALT',        '`4n.ff.{)Jd[Jf_JZLG%*LbW9Nvp{,[>*Xb(^+IfYCRjvq)f79[z Y+C}wFp|&0H');
define('SECURE_AUTH_SALT', '? YF;UUDMEVjt?o7H$i%>}G=nGcynGk7Vsv9WM^*T?!.8y~=Rr32T>c}qIDvuyhV');
define('LOGGED_IN_SALT',   '>#LFl5!4+g+(}]hpR}+}]8@/ceH4GrJ]83M4k5l?DYGskc^1q[&.m=OD^Mca<!ug');
define('NONCE_SALT',       'x4xOfG8+FboCtz1!>Bk~u(5.Qj1NTQnxQ4`U.Kyri-WI#uKYT,TsHY.a @=Rv:)p');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix  = 'wp_ca';

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

/* That's all, stop editing! Happy blogging. */

/** Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');
